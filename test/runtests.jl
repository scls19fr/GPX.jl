using Test
using GPX


@testset "Sample" begin
    @testset "write_gpx" begin
		include("../sample/write_gpx.jl")
		@test 1 == 1
    end

    @testset "read_gpx" begin
		include("../sample/read_gpx.jl")
		@test 1 == 1
    end

end

@testset "parse gpx" begin
    s = """<gpx xmlns="http://www.topografix.com/GPX/1/1" version="1.1" creator="GPX.jl">
	<metadata>
		<name>07/11/2019 LFBI (09:32) LFBI (11:34)</name>
		<author>
			<name>GPX.jl</name>
		</author>
		<time>2019-11-09T09:14:17.473Z</time>
	</metadata>
	<trk>
		<trkseg>
			<trkpt lat="46.58634900" lon="0.30904200">
				<ele>63.6000</ele>
				<time>2019-11-07T08:44:06Z</time>
				<desc>Vitesse : 0 kts
Altitude : 209 ft
Latitude : 46.586349
Longitude : 0.309042
Cap : 314°
</desc>
			</trkpt>
			<trkpt lat="46.58653100" lon="0.30869000">
				<ele>64.8000</ele>
				<time>2019-11-07T08:44:55.000Z</time>
				<desc>Vitesse : 11 kts
Altitude : 213 ft
Latitude : 46.586531
Longitude : 0.308690
Cap : 307°
</desc>
            </trkpt>
        </trkseg>
    </trk>
</gpx>"""
    gpx = parse_gpx_string(s)
	println(gpx)

	# Metadata
	# ToFix @test gpx.metadata.name == "07/11/2019 LFBI (09:32) LFBI (11:34)"
	# ToFix @test gpx.metadata.author.name == "GPX.jl"
	# ToFix @test gpx.metadata.time == ZonedDateTime("2019-11-09T09:14:17.473+00:00")

	# Tracks / Track segments / Track points
	@test length(gpx.tracks) == 1
	@test length(gpx.tracks[1].segments) == 1
	@test length(gpx.tracks[1].segments[1].points) == 2

	pt = gpx.tracks[1].segments[1].points[1]
	@test pt.lat == 46.58634900
	@test pt.lon == 0.30904200
	@test pt.ele == 63.6000
	@test pt.time == ZonedDateTime("2019-11-07T08:44:06.000+00:00")

	pt = gpx.tracks[1].segments[1].points[2]
	@test pt.lat == 46.58653100
	@test pt.lon == 0.30869000
	@test pt.ele == 64.8000
	@test pt.time == ZonedDateTime("2019-11-07T08:44:55.000+00:00")
end
