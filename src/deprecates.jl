using Base: @deprecate, @deprecate_binding, depwarn

if !isdefined(Base, :stderr)
    @deprecate stderr(obj::StatisticalModel) stderror(obj)
else
    function (io::typeof(stderr))(obj::StatisticalModel)
        Base.depwarn("stderr(obj::StatisticalModel) is deprecated, use stderror(obj) instead", :stderr)
        io === stderr ? stderror(obj) : throw(MethodErrror(io, (obj,)))
    end
end

@deprecate model_response(obj::StatisticalModel) response(obj)

@deprecate norepeats(a::AbstractArray) allunique(a)

@deprecate(mad!(v::AbstractArray{<:Real}, center;
                constant::Real = BigFloat("1.482602218505601860547076529360423431326703202590312896536266275245674447622701")),
           mad!(v, center=center, constant=constant))

### Deprecated January 2019
@deprecate scattermatm(x::DenseMatrix, mean, dims::Int) scattermat(x, mean=mean, dims=dims)
@deprecate scattermatm(x::DenseMatrix, mean, wv::AbstractWeights, dims::Int) scattermat(x, wv, mean=mean, dims=dims)
@deprecate scattermat(x::DenseMatrix, dims::Int) scattermat(x, dims=dims)
@deprecate scattermat(x::DenseMatrix, wv::AbstractWeights, dims::Int) scattermat(x, wv, dims=dims)
@deprecate scattermat_zm(x::DenseMatrix, dims::Int) scattermat_zm(x, dims=dims)
@deprecate scattermat_zm(x::DenseMatrix, wv::AbstractWeights, dims::Int) scattermat_zm(x::DenseMatrix, wv::AbstractWeights, dims=dims)
@deprecate mean!(R::AbstractArray, A::AbstractArray, w::AbstractWeights, dims::Int) mean!(R, A, w, dims=dims)
@deprecate mean(A::AbstractArray{T}, w::AbstractWeights{W}, dims::Int) where {T<:Number,W<:Real} mean(A, w, dims=dims)
