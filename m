Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F147F96F4C6
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 14:56:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6973E69;
	Fri,  6 Sep 2024 14:56:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6973E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725627378;
	bh=rR1RTHP7pHhDvwJ63j4cufAGhg/DSavxqbtggcv3VsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jPGPFxPCHUeji9uDTI2H+lzlT3rU4SdWDlnAKJ8MQDTcxvbm2fC7hVRqLP5rvk8bp
	 kpkWzTy/LNSe9mn45lDfxUIeZnOsN6CotxJrZCjLjAgCq8c4bfoVxzQHYKe95mwkG8
	 LEeE6a9MMK8Se2CFfGbSWTnXHKNRjmY19Y5Qn/v8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D030F805AF; Fri,  6 Sep 2024 14:55:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 721A7F805AC;
	Fri,  6 Sep 2024 14:55:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 254A8F8016C; Fri,  6 Sep 2024 14:55:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BE97F80107
	for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2024 14:55:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BE97F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dZLQ6EHl
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CB25EA44F4C;
	Fri,  6 Sep 2024 12:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42375C4CEC7;
	Fri,  6 Sep 2024 12:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725627337;
	bh=rR1RTHP7pHhDvwJ63j4cufAGhg/DSavxqbtggcv3VsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZLQ6EHlX303v7cR3MWqxnAAQikdvvTvz9u7kgL/Z0JXNNZgWloaJg0uppLD29N5x
	 1lU+1PW1fxVN+PNJf3aHigeJZ2O3L6j+pJg2CxCeP4yqxbUzytP7GCUHk5dtW+IKrJ
	 psBFPcToSQlJJKFd4pbyqdxC0Ta2m2fZL1KnFx7Jlw35Bk2TrG2jrMdjKUQBra1ygU
	 5/gMjbwu60phyXnu57GjSXMuoLPMwgqZshbbNvWmZ9BvqkBtZPO4NPXDCvG62o4CoH
	 tl6/mWGQQTD8KAe3lk2bh2hO6GW57IXdvaUnJ3+5wiJF4FQ8P1s3Q/y/zVTZzNVddp
	 Ma2NBZj4wGh1w==
Date: Fri, 6 Sep 2024 13:55:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: peter.ujfalusi@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH -next 0/5] sound/soc: fix some macro definitions and
 usages
Message-ID: <Ztr7wqQ9CNn1LC2d@finisterre.sirena.org.uk>
References: <20240821070815.2326534-1-lihongbo22@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vOZFg3hwCRKMq5fg"
Content-Disposition: inline
In-Reply-To: <20240821070815.2326534-1-lihongbo22@huawei.com>
X-Cookie: Your love life will be... interesting.
Message-ID-Hash: P5D6KMXMPBMRV5PHLXTSDLOC2AMOX36I
X-Message-ID-Hash: P5D6KMXMPBMRV5PHLXTSDLOC2AMOX36I
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P5D6KMXMPBMRV5PHLXTSDLOC2AMOX36I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--vOZFg3hwCRKMq5fg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 21, 2024 at 03:08:10PM +0800, Hongbo Li wrote:

> Hongbo Li (5):
>   sound/soc: fix macro definition on TWL4030_OUTPUT_PGA
>   sound/soc remove unused substream in macro soc_component_mark_pop
>   sound/soc remove unused substream in macro soc_dai_mark_pop
>   sound/soc remove unused substream in macro soc_link_mark_pop
>   sound/soc: fix macro definition on STM_SAI_HAS_EXT_SYNC

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--vOZFg3hwCRKMq5fg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmba+8IACgkQJNaLcl1U
h9Caiwf/VZjm90+G/a7oA3oyFPBOIQYUcXiuWuEds+rCiArSefxoOrSYwCdC87H7
/Xx2zl2mgXmzff7b9CCmFwbsoFUmXiUFbpPzjvWJRtyqraoXfBWCtBJqYMcu6T0q
atw1IzrnptV8CFQRcAd3OVp0hPKMYaNWFFUoIKpfwi/7jbrh22IuaJcv+LFWO/kJ
lWn79ab1/hFd0ZCui2ZOC43/70Se0eUKCG+EQQ0eowLaLpmi883R8uxmwTTPaNC9
DzPVLTUyIsMa9apcHMCQIgpJWSDT3/3S34lIOjaGCEsIMk06r/EkNf8BA5mZZsHZ
Y2uWIq/H2ofwidaAXkI5fRfU1qXA8A==
=N1UN
-----END PGP SIGNATURE-----

--vOZFg3hwCRKMq5fg--
