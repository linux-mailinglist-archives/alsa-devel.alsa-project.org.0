Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 917FF4E9B4C
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 17:45:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F2C4186C;
	Mon, 28 Mar 2022 17:45:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F2C4186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648482353;
	bh=bVwuxMR1FNIryjiDvIXdi9f+NUSMKrjmUQq6FdKXor8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u68IpqALRSbm2ZjQV/SGcga4uB/BhzNX0h0FA9bXSQccdVZEukc+7taKoKEDdxANG
	 mfGffE7YaRZwkbNHP+h6CueNAdvFGsRwBXrq+KhcsTtAD0aeFvUkGGuUFgUp8IaBNd
	 2GAj2F+/9x7U2+n2scDZydSVXA0DgJR99/wEe7To=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84B03F8026A;
	Mon, 28 Mar 2022 17:44:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED132F800FA; Mon, 28 Mar 2022 17:44:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74DFDF800FA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 17:44:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74DFDF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="I+mXUJEa"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4CADBB81136;
 Mon, 28 Mar 2022 15:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5B6C004DD;
 Mon, 28 Mar 2022 15:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648482278;
 bh=bVwuxMR1FNIryjiDvIXdi9f+NUSMKrjmUQq6FdKXor8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I+mXUJEaHR9d0bwysioVzxtU17wrckU+sj8J+vCUMXI3+mZ5IL3NvplD9Tmqliw5b
 VMvY8sWSdaAfTdlY3vPFcCvltz1VT6gS1PDK6Ll1d+24jIse2UPucFPT5IiPARzAmU
 3/wBfa+2+HG5vJWxzLi5SKxBic9jcGA0pgA8D+WgLTFlFSpS5/vxq1J7ULz+V5UOop
 0ZFRvg343SeWzE+1t92wLS7rG5gEUod4BZyzNA5mKCfJugZgfGP8fP3AOOB0BR/wxZ
 tPbEkN3Kdm5UlBelQIZ8q+wvYyun0QmQeLGGdHSGPswXp6/G7clumKRTAks8JFqGIb
 XMJkMggW8YULA==
Date: Mon, 28 Mar 2022 16:44:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH 2/6] ASoC: tegra: Add Tegra186 based ASRC driver
Message-ID: <YkHX3/8BbXo4obWI@sirena.org.uk>
References: <1648447526-14523-1-git-send-email-spujar@nvidia.com>
 <1648447526-14523-3-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Q6kdKZClj14YwsHl"
Content-Disposition: inline
In-Reply-To: <1648447526-14523-3-git-send-email-spujar@nvidia.com>
X-Cookie: What hath Bob wrought?
Cc: jonathanh@nvidia.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, catalin.marinas@arm.com, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 krzk+dt@kernel.org, will@kernel.org, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--Q6kdKZClj14YwsHl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 28, 2022 at 11:35:22AM +0530, Sameer Pujar wrote:

> +	regcache_cache_only(asrc->regmap, false);
> +	regcache_sync(asrc->regmap);
> +
> +	/* Setup global registers */
> +	regmap_write(asrc->regmap, TEGRA186_ASRC_GLOBAL_SOFT_RESET, 0x1);
> +	regmap_write(asrc->regmap, TEGRA186_ASRC_GLOBAL_SCRATCH_ADDR,
> +		     TEGRA186_ASRC_ARAM_START_ADDR);
> +	regmap_write(asrc->regmap, TEGRA186_ASRC_GLOBAL_INT_MASK, 0x01);
> +	regmap_write(asrc->regmap, TEGRA186_ASRC_GLOBAL_ENB,
> +		     TEGRA186_ASRC_GLOBAL_EN);
> +	regmap_write(asrc->regmap, TEGRA186_ASRC_GLOBAL_INT_CLEAR, 0x01);

This seems weird - we resync the cache, then do a soft reset (which
presumably desyncs the cache) and then explicitly restore a bunch of
things (hopefully everything that was in the cached state?).  This is
certainly very much not idiomatic and looks worrying.  Are you sure that
the device is getting anything out of the register cache?

> +static int tegra186_asrc_put_ratio_source(struct snd_kcontrol *kcontrol,
> +					  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_enum *asrc_private =
> +		(struct soc_enum  *)kcontrol->private_value;
> +	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
> +	struct tegra186_asrc *asrc = snd_soc_component_get_drvdata(cmpnt);
> +	unsigned int id = asrc_private->reg / TEGRA186_ASRC_STREAM_STRIDE;
> +
> +	asrc->lane[id].ratio_source = ucontrol->value.enumerated.item[0];
> +
> +	regmap_update_bits(asrc->regmap, asrc_private->reg,
> +			   TEGRA186_ASRC_STREAM_RATIO_TYPE_MASK,
> +			   asrc->lane[id].ratio_source);
> +
> +	return 1;
> +}

This should only return 1 if the value actually changed, you can use
regmap_update_bits_check() to detect the change.  Current mixer-test
ought to spot this.

> +static const struct snd_kcontrol_new tegra186_asrc_controls[] = {
> +	/* Controls for integer part of ratio */
> +	SOC_SINGLE_EXT("Ratio1 Integer Part",
> +		       ASRC_STREAM_REG(TEGRA186_ASRC_RATIO_INT_PART, 0),
> +		       0, TEGRA186_ASRC_STREAM_RATIO_INT_PART_MASK, 0,
> +		       tegra186_asrc_get_ratio_int,
> +		       tegra186_asrc_put_ratio_int),

Can't the driver work out the ratios based on...

> +	/* Source of ratio provider */
> +	SOC_ENUM_EXT("Ratio1 Source", src_select1,
> +		     tegra186_asrc_get_ratio_source,
> +		     tegra186_asrc_put_ratio_source),

...the sources?  Or does it need to be configured before either side is
ready in which case this might be the best we can do for now.

--Q6kdKZClj14YwsHl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJB194ACgkQJNaLcl1U
h9DJPQf/TvXk6oi+ijY9O9IQ133Gu9xWGWV+7fiQYkIlAtddglEabfYOJxtLVKuV
xgm5SIaEfWvUPj3kevurFVLxyTvAZhpI8KfamsiUlRKjlK6IkKEsfx6yhYY9tvLn
6QDMj18+mr1VrQNDyrlFRpuV8anPmnuHmXAJBb3gM4HSxM48Dn0uQyLgxkRwL9Ke
X/j54DAQE8SAlTMafIfz24xWmojIyEyEY6CHIVrxfYqhJGIv24fQoIgA9P+b1vMW
NmIlXb4oJ+TveCsUJBwRiwRzV8TIqoErgLkcReVThoeIf5yMz2smnJ7QltwRb+QN
8BxNA3n76o2Idu8GGTH3RLmDwzHjhA==
=G6cv
-----END PGP SIGNATURE-----

--Q6kdKZClj14YwsHl--
