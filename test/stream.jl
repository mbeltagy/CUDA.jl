@testset "stream" begin

let
    s = CuStream()
    synchronize(s)
    let s2 = CuStream()
        @test s != s2
    end

    let s3 = CuStream(CUDAdrv.STREAM_NON_BLOCKING)
        @test s != s3
    end

    let s4 = CuStream(CUDAdrv.STREAM_DEFAULT | CUDAdrv.STREAM_NON_BLOCKING)
        @test s != s4
    end

    synchronize(CuDefaultStream())
end

end
