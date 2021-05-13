Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F04637F8D2
	for <lists+alsa-devel@lfdr.de>; Thu, 13 May 2021 15:33:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF22517D1;
	Thu, 13 May 2021 15:32:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF22517D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620912829;
	bh=K3hK/G0b4FdBTcp760KZTDWKAGMICe3kjVKyRjjqQ9c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Su8RV/dkDanmer/Qvlrcf07cxEO8o8/KtQOx4psHnsBvwR26HBxPYw5Dz/wZi+n08
	 ESKQOoZkUxHhXawfzkKsGBJV5ZxSK42QZwjPtrfOIEi+rkQkf/Rs9eGtxyD41AABTR
	 iDcMA9MhcVkuqKAuseMraq+hfurnc12ydQtT/j8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D048F8016B;
	Thu, 13 May 2021 15:32:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51D26F8013A; Thu, 13 May 2021 15:32:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F32C6F8013A
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 15:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F32C6F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O7qOuLax"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 905EF61363;
 Thu, 13 May 2021 13:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620912735;
 bh=K3hK/G0b4FdBTcp760KZTDWKAGMICe3kjVKyRjjqQ9c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O7qOuLaxXWxqLB+rL/HX9ZhWlHqP8nfh3Q9rsGaq+oqaILxb7A2yOcza8+fjoKGU8
 8S7hkErJa1OVOwmY8/LF8zEsiytqmO1mhY1CT9AswteaW02VhbDyY+0pJXGorU7aHD
 tXzzfjTFsScF64ftJTUYbiW48RVFgZN3SMG1nj4UQEe0ZhCE+DKm1vaWvxK92udSfT
 7H2F94ZXPKZmypQvYg6xITj8Sj5LQzrjGw/gig0WNIZX/uxM3/37CL3FPjxBcApi2t
 5nJvkjTbqptMRdoWYe9aT6b2pF1jgt/SGT0ZARbqNjoC8vbb4jkfdKrvAZmwe6yLi7
 ig/c1fLmFqhBA==
Date: Thu, 13 May 2021 14:31:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: Fix pop noise during audio
 capture begin
Message-ID: <20210513133132.GC5813@sirena.org.uk>
References: <20210513114539.4813-1-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Content-Disposition: inline
In-Reply-To: <20210513114539.4813-1-srivasam@codeaurora.org>
X-Cookie: snafu = Situation Normal All F%$*ed up
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, rohitkr@codeaurora.org,
 swboyd@chromium.org, judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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


--3siQDZowHQqNOShm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 13, 2021 at 05:15:39PM +0530, Srinivasa Rao Mandadapu wrote:

> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		ret = regmap_fields_write(i2sctl->spken, id,
> +						 LPAIF_I2SCTL_SPKEN_ENABLE);
> +	} else  {
> +		ret = regmap_fields_write(i2sctl->micen, id,
> +						 LPAIF_I2SCTL_MICEN_ENABLE);
> +	}

This commit doesn't remove the matching update in triger() so we'd have
two redundant updates.  I guess it's unlikely to be harmful but it looks
wrong/confusing.

--3siQDZowHQqNOShm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCdKjQACgkQJNaLcl1U
h9DuswgAhMWhYHcZug7WiZh1LrB3iTOXX6ezIaxTUNfqlza9nf4nSQw3P3tyO6ci
LZGERj2vXEi0Eukkh65G98T6YV8j4cyU+91R2pVjb1RJC+SJwSl35a4ZEco777Hq
GsOtXWYtHhpOOhpZvG+jkRSnUrkMDn1yOHPfWyApP4958rJxwqsKoHevCwuSTDrF
fMt2F5eb1qoeao46trnkbNGs1EaWYm7nbu3TFZDWa2FWxTvjJoNc00m3S+hOapMr
EsDSrpsSmcbGu7JHHGonJ4t8mdxsoIEsGy4JcPpSbbwu4mb5GZsGLGHo8jVnTF44
+uGj78EbxQRId8s4I71QW3lXnalgRQ==
=jAkE
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--
