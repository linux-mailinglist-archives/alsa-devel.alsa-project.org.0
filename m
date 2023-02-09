Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59104690C7C
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 16:11:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A02BDF1;
	Thu,  9 Feb 2023 16:11:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A02BDF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675955515;
	bh=nkTLAKeLsci+0CS6kERunXfzZevD3453gUEgcmJWm+M=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CX7cpy94amxsuX1RvXsU0DiZpHi8sAMNh9hQ1rL3P9en0MQoJyVLyRazFcdfEHdU5
	 9ZDf8/lreO15KaQhmaxPEDeKw8VYRnyhK8MUVtAhyNqcasFYMkRBKwBLMYd0G6WLo9
	 M8qS+PMSDbL6cVoRlQ3S37GDGHKwEOd02jnQZPbg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6642DF80094;
	Thu,  9 Feb 2023 16:11:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5217BF800E4; Thu,  9 Feb 2023 16:10:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73AA3F80086
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 16:10:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73AA3F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jTioB0ZM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3757161A77;
	Thu,  9 Feb 2023 15:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E987EC433D2;
	Thu,  9 Feb 2023 15:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675955451;
	bh=nkTLAKeLsci+0CS6kERunXfzZevD3453gUEgcmJWm+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jTioB0ZM7fDCIyHXS+N1wspT896x+fm0i4fO7/YyD0wnEE/lz86AtjE+qySmp/W2F
	 yi+r6pTSYETAAXxq8JdyPU0mga4Tb4C1tXzAYzm+z2Sm0lTu6hPlbnLmr4RQ1f/TM7
	 i+y6VQ6OFIPotGI3NKMgf3Xv7kCHxabA6BHcNoyKuPfevyBw7eWcXzs7rBgd8c1l7v
	 oYUGefa31a5/2lX95gY4Btz3dbQP5GSaY9XJn3y5Vk+Sodqj4i1L+oC29ADcVB5WEr
	 ybmjP2NqnmsonlzmeemYukvRgZnSCdcabOlNvMnlPGASsBKcPtSgI39/2pN3N16upe
	 zfK9eoS5O1zfw==
Date: Thu, 9 Feb 2023 15:10:45 +0000
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Subject: Re: [PATCH] ASoC: rt712-sdca: Add RT712 SDCA driver for Jack and Amp
 topology
Message-ID: <Y+UM9druIQDacdgX@sirena.org.uk>
References: <20230207090946.20659-1-shumingf@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wAKG3ryAwwOAIzeF"
Content-Disposition: inline
In-Reply-To: <20230207090946.20659-1-shumingf@realtek.com>
X-Cookie: Anger is momentary madness.
Message-ID-Hash: OA3GAP4LH5P662MXTFFDP63XUXS6JUBX
X-Message-ID-Hash: OA3GAP4LH5P662MXTFFDP63XUXS6JUBX
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 flove@realtek.com, oder_chiou@realtek.com, jack.yu@realtek.com,
 derek.fang@realtek.com, pierre-louis.bossart@intel.com, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OA3GAP4LH5P662MXTFFDP63XUXS6JUBX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--wAKG3ryAwwOAIzeF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 07, 2023 at 05:09:46PM +0800, shumingf@realtek.com wrote:

> +	/* pin attached */
> +	if (det_mode) {
> +		/* read UMP message offset */
> +		ret = regmap_read(rt712->regmap,

> +			}
> +		}
> +	} else
> +		rt712->jack_type = 0;

If one side of an if has { } the other side should too for clarity.

--wAKG3ryAwwOAIzeF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPlDPQACgkQJNaLcl1U
h9CWWAf9FMGBXdqAZItAfO9iXVEyMVA+JAXKg2s8y5ES9bax/tNm9lSRWIuzmBqG
cMCkQIjGPtK1jWTlGDoQhJfPVOLwhKeEDnAiT5jAY+vGsXpnBkPANrYnQnIESUi6
cDnZd+k+CpVK79lBfLNKPZuekJAfQpwuECJ2U3zj92k2M8mAWdRCk16kHzK3Ufue
Dz7z+i+pCQCDRcemD79JhPUVhFSkITLHBKA7LeuWaHdKJYtyLWnPQNMzgmvfjGQ3
gNojoDcZPxMDmvtkLC9bCdPAZAnjLJZeLGiDWUKHJcXor2bUfMWALEvYmYwn3Jcu
42iUQAEkxQdJLZAdTxZkoFcRYXOiow==
=M+aq
-----END PGP SIGNATURE-----

--wAKG3ryAwwOAIzeF--
