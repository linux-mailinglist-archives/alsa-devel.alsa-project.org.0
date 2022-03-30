Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 951D94EBFEA
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:42:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 071D216EC;
	Wed, 30 Mar 2022 13:41:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 071D216EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648640527;
	bh=3FN9c9vGoHdL5GuwSuetkzJxobriGvDENeORB00952U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=luDN1a4u76CNIQ8yJR5cnuQ4eTL8ZIo7oaVxNeQjZWdmcc52u4CPveqaZTidFBXdz
	 qZPdUNNUp+VoUdHHjL1b4Ck4O3jyHOqOmpDQUyIQVqp9zxhZZQgH+igFXb9WK8F8wA
	 9PwaU9ewT9MbpXsdFL2eBmf5h1MpEAZ0LfL6b0Oc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F9EEF8025A;
	Wed, 30 Mar 2022 13:41:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25B0EF80254; Wed, 30 Mar 2022 13:40:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D08DEF800F2
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D08DEF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X/GT7jNj"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E5C30B81BBA;
 Wed, 30 Mar 2022 11:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21EE9C340EE;
 Wed, 30 Mar 2022 11:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640453;
 bh=3FN9c9vGoHdL5GuwSuetkzJxobriGvDENeORB00952U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X/GT7jNjmWZgfOPvUqUjkN850s9lr6tQHN4zdwFdHVFU9KmqYal7x0M3rEefx3fR/
 Yd15dpOzRMWBwDpDokAK4PkzmQ+eTbWLIwwVXeIX1l1hXD6sADeuBCkxJDHfqPBDvA
 h3/1qK3LBbXD7pDtEtMWcUV84glJ3DLWWBZ0Cq7kZZ+C3UNOQQ2ODB5EuEN1zwCrwC
 pPqX0p3iDB45kuWIijpZcQZynPUUvR4WPPpTweaiDUsKoUeYout+u9bKEosFLvdN1D
 fWqDNISnwbVEf7vaNBZ+Z7MkJTl5fyK5jhN63bkFWiOscjyWyuWPxhGRkKZg8hc0yo
 cSAuTDy2dXAmA==
Date: Wed, 30 Mar 2022 12:40:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Judy Hsiao <judyhsiao@chromium.org>
Subject: Re: [v1] ASoC: qcom: Add driver support for ALC5682I-VS.
Message-ID: <YkRBo/1s6BgCRCvP@sirena.org.uk>
References: <20220330084519.3863856-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Ky979h6xaIlV4RrK"
Content-Disposition: inline
In-Reply-To: <20220330084519.3863856-1-judyhsiao@chromium.org>
X-Cookie: Two is company, three is an orgy.
Cc: judyhsiao@google.com, cychiang@google.com, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, dianders@chromium.org, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, yuhsuan@chromium.org
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


--Ky979h6xaIlV4RrK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 30, 2022 at 04:45:19PM +0800, Judy Hsiao wrote:

> +#define DEFAULT_MCLK_RATE              19200000
> +#define RT5682_PLL1_FREQ (48000 * 512)
>  struct sc7280_snd_data {

Missing blank line.

> +	snd_soc_dai_set_fmt(codec_dai,
> +				SND_SOC_DAIFMT_CBS_CFS |
> +				SND_SOC_DAIFMT_NB_NF |
> +				SND_SOC_DAIFMT_I2S);

Please use _CBC_CFS, and this can be set in the dai_link as data.

--Ky979h6xaIlV4RrK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJEQb8ACgkQJNaLcl1U
h9AR3Qf9Ho0Eyj/n89RE1B4Sbjzj5gO8zo8lEWLCMZlosuTmkR4atNYmNHu25DGc
1j9nuumeUhRu8ld6fXEBj1eFDwzM1QH8KbuQ4yCiq6CyWxUABqQdAaqAF7LCQW5m
+SmJpT2sLmF/XAUFM8m95jPY5O27Ncy7NVz7IQeNuB7V6+PlKa0lqBi+PKxf+CB9
vmXpOu0Q4J7fnd7VV3JAajDO+Bl95sxLlPaxdquI8uP8l0PmGTyrAFcL4VBog4iK
5vCqVxQxhrC0MXXL9N/za3L33ScTj2yl5KoXfv1/lvGnb7zRsZ1/PT5UsU3jw5xv
fNPx3iBRnamjtoqJjk+xpHssIR8Qdw==
=Puyr
-----END PGP SIGNATURE-----

--Ky979h6xaIlV4RrK--
