Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E961D5850FF
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 15:36:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEAED161E;
	Fri, 29 Jul 2022 15:35:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEAED161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659101799;
	bh=OPnmHe7xqIRuz4QI8wZC/8APNp4xzRDjJrUr9X3kF9M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E10FolLZRGA6qDfrQCUXBwsBAVhc7KEuOmhjuy4LybkMDpShWMtUfFHXvj/iqQcBZ
	 2NuJnemnjyI4WRWnEFQ0HkYOtLQzeJD1nfpTXK9hM0nSPFvvlHhXnVpiDl+iFvZjtp
	 lNMrAejof3my1DHLn8722MImyTEshlMySpOtftFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B7C0F804B1;
	Fri, 29 Jul 2022 15:35:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBE79F8049C; Fri, 29 Jul 2022 15:35:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29775F800BD
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 15:35:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29775F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t30MSvdu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 03FF4B827A4;
 Fri, 29 Jul 2022 13:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D89AC433D6;
 Fri, 29 Jul 2022 13:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659101733;
 bh=OPnmHe7xqIRuz4QI8wZC/8APNp4xzRDjJrUr9X3kF9M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t30MSvduBlMTQZckvb2AxnwIrsTUfq06OH+yTTugp5FVfxSetZjJHMpsou1XXs+AZ
 OU3fwVUbHqnEz585yxbddmzGZoG2Q3/4/7Yp1pA0e+af/ZIYi7cbLEFX48i/z0XD1d
 rijRLETJugQ5fi187EHotPsyIiwqcduLHqaaDoZmME/Ua6Mbcapgwf8c9AkJLwydlJ
 01T4MFPV8LK2aWi+57gOmBLUxW/LIvivx2BvYIz2+NvF8bnrfmLZAXhuvJS2PBo4E5
 EWnxmAcqvjFrDXPLzmEsO5to/L3N1OLspHGLB9XCD8qjWltXXp4bm7UHL76ccaGAdA
 pe66tW/3/0yjg==
Date: Fri, 29 Jul 2022 14:35:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhu Ning <zhuning0077@gmail.com>
Subject: Re: [PATCH v4 1/2] ASoC: codecs: add support for ES8326
Message-ID: <YuPiIHvkK4pb6Mae@sirena.org.uk>
References: <20220729090857.579785-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="A/sDrsDDQfaXBz8i"
Content-Disposition: inline
In-Reply-To: <20220729090857.579785-1-zhuning0077@gmail.com>
X-Cookie: Chairman of the Bored.
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
 Zhu Ning <zhuning@everest-semi.com>, David Yang <yangxiaohua@everest-semi.com>
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


--A/sDrsDDQfaXBz8i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 29, 2022 at 05:08:56PM +0800, Zhu Ning wrote:

> +static unsigned int es8326_rates[] = {
> +	8000, 12000, 16000, 32000, 48000, 96000
> +};
> +
> +static struct snd_pcm_hw_constraint_list es8326_constraints = {
> +	.count = ARRAY_SIZE(es8326_rates),
> +	.list = es8326_rates,
> +};
> +

These now aren't used, you should see warnings about this which will
turn into build failures in an allmodconfig since it's built with
-Werror.  Otherwise than that one small thing this now looks good.

--A/sDrsDDQfaXBz8i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLj4iAACgkQJNaLcl1U
h9AKSAf/XESgiF0L737Iu8Wd451H4iGXfZIA2LMbUc9JyLDw0OB/OkiO4otMQxKS
Am5bXzHPOVaoJuh3iUEq6y2JlWigIQH1vMT8NhkXBWlNoo2Zvz1Tr3XA7uocWV4Y
Lmr6ThAMjjFy5keWqaxd9KnVsX8yX6srz5uy8LQye3q/LK3AALxwKkojc6GM0rKQ
Xt+m0e2AHXBQygNc291RpVi45V4UAe8jb4OBiI146U5XZUFCAWaECGtolXQuQLQS
jN6Hk9yesHh+hp2KplfmQwkGUOYBp1ilBaJs/QxyEBZGSPxAle/9htbTG+Ab9axK
X+ulIeq85WDKEg3vCKcH9nUTKWquLQ==
=DHk6
-----END PGP SIGNATURE-----

--A/sDrsDDQfaXBz8i--
