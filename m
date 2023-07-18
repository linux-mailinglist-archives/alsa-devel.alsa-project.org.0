Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24648758048
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 17:00:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FE111F6;
	Tue, 18 Jul 2023 16:59:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FE111F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689692400;
	bh=6Mw/dt/A2dZkAywCDCOSLoMIWg4pO92FFevgjzvWi84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OoQcLZEeuC/lBoeLPZ5TTuj/eFHjEzoTpqZQAiD1IGHiI4dfkq6JtBV5cyBfr32Jl
	 sCEEcLlbmDLrEd6aGP8WUr1x60BFgbBJbIVKHlxf98o9wwZCA0p8O9zEdhPB2Zo3bM
	 5g6bltKyiQ8VMWxfmJYXq8/GI5Yx419khHhhPN+M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2182F8007E; Tue, 18 Jul 2023 16:59:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BF86F8027B;
	Tue, 18 Jul 2023 16:59:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD9D2F8032D; Tue, 18 Jul 2023 16:59:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B0E3F8007E
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 16:58:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B0E3F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qlE8l/Lo
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C1D4C6160D;
	Tue, 18 Jul 2023 14:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22CFBC433C9;
	Tue, 18 Jul 2023 14:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689692336;
	bh=6Mw/dt/A2dZkAywCDCOSLoMIWg4pO92FFevgjzvWi84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qlE8l/LoVNNB2wHg3l+SYWj6v5/p1mhQlVX01uJriMx69iROVUZTzqftBYWMvvY6o
	 nYrBzcccbGp2HhtstUIqGqV6eVUOsq4i+74XAQs3cmWBpHhjNzNq5iFm7lgOX+KKkQ
	 KSBigR6c43CRLHafRyBQvKvlrUYhny+QLzDACiSAP6M13Gp8AbL0ZCJA4/MV2t3HP2
	 6h6/jw8tw9iTfzWT9M6Qrz017+9FjjhgvHTuTMRndkailqkHhHVY53Y6zYuQTTFXXF
	 rYHXnFEJjn++qayzNvTCBzgwF3/wgvATxF9XiKbe6byfomhmfuUiGYd9RCYyh+OzAs
	 7B+8ZktdsUlsQ==
Date: Tue, 18 Jul 2023 15:58:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Subject: Re: [PATCH 06/11] ASoC: sigmadsp: Simplify with snd_ctl_activate_id()
Message-ID: <05f607d4-6683-4218-99df-2992fd4ba80d@sirena.org.uk>
References: <20230718141304.1032-1-tiwai@suse.de>
 <20230718141304.1032-7-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A68xVj0bxMRWcdry"
Content-Disposition: inline
In-Reply-To: <20230718141304.1032-7-tiwai@suse.de>
X-Cookie: Nothing happens.
Message-ID-Hash: 4ETJ45HH7DN5OPHX37FIIOF52TRFZNOA
X-Message-ID-Hash: 4ETJ45HH7DN5OPHX37FIIOF52TRFZNOA
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4ETJ45HH7DN5OPHX37FIIOF52TRFZNOA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--A68xVj0bxMRWcdry
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 18, 2023 at 04:12:59PM +0200, Takashi Iwai wrote:
> Use the standard snd_ctl_activate_id() helper instead of an open code
> for code simplification.

Acked-by: Mark Brown <broonie@kernel.org>

--A68xVj0bxMRWcdry
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS2qKsACgkQJNaLcl1U
h9BBPwf+PAfNWJbB+ipcGY5qSTRYo7bUHNUXwuUgPeVmI2wYlNKO9q3vWaCF6lgz
HqRGFncv68wcwAZvJl6pfX/q/KUrKWpNKdqTSdDRxLhMUDJVOtcG7DCqs3v+N27M
k3AEpwDUxA6WVGNapsa9riDvZWEwPrNr7ktQKwW9IVqYqsyCrXZBQQBAGzx1LWrD
lfYh4k+lxKwxgVvBQlDG8q1MRmnGSX7hFJxq1ZwmxRtSy+sT/XMinScBdxm0F8Db
CtnuYbeRu4aNQD75eNpm8dznNseCr93S7/QRgS7BvfwDjZlPGVRk84J6fj1DAwIw
WdAqPF8w/8FRFXyS+5tdQTomI3roNg==
=Uqkw
-----END PGP SIGNATURE-----

--A68xVj0bxMRWcdry--
