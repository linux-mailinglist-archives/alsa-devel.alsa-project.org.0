Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B1A846017
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Feb 2024 19:38:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0816A852;
	Thu,  1 Feb 2024 19:38:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0816A852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706812738;
	bh=MP7ZgueF9uhKpBdmtmIbAciwd6VQ28FUELZavoGxPZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IuDOdz1jwlTityIwdxPCpueOGtGteIc67UWiSeAVnMKwuda5RYxbgXLkVv3oau61P
	 usPcaEMstHB3AKeFKB+w0svVECMLjKa1fR5Q8ox9p+xnMc/kQMjPOt16ERALKwQjdB
	 mNIPGD91j0j9ygnP076CifAFvrfAYSq08sORYsWc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E0A0F805AF; Thu,  1 Feb 2024 19:38:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F8B1F8057E;
	Thu,  1 Feb 2024 19:38:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAE05F8055C; Thu,  1 Feb 2024 19:38:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF9EFF80548
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 19:38:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF9EFF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Jxl0/gC/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E149BCE2844;
	Thu,  1 Feb 2024 18:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D13DC433C7;
	Thu,  1 Feb 2024 18:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706812688;
	bh=MP7ZgueF9uhKpBdmtmIbAciwd6VQ28FUELZavoGxPZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jxl0/gC/9V7NGs4np0Fg19VgmgjzXXFNA/Kyy3ptdGo2hXh0oyv7laOOTrgF4/MmJ
	 dU5xwXGWl1QSRvb9Jgq6hGC5FENA4bZ840nCT+GADPvZcnzvL17lRMtXwJamBE26zp
	 u94+NOP1Xm5khmd5Lz1DyAS16+HyAhEnhhuqW0fOw8HxoCDnjJP2/Jgo1+7slnVomq
	 UjFAdqrTSosZfQBtMOpvrP4qMTU4K4b0GNvvprl9dV74MYTSWoQpw/s8gLDhEti1qe
	 Hp83wDDA6SCEgEFxu8KAal1YYiQ40nTOONsAwsd2OHPKTDMTntPjWvnyg+42sKpc2J
	 bVrMWkhddzvuQ==
Date: Thu, 1 Feb 2024 18:38:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.8-rc2-2
Message-ID: <1c3b919e-f1ae-48d5-83d3-0a091a3fe9f1@sirena.org.uk>
References: <20240201183548.66010C433C7@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="15S74Tqch00iAMj+"
Content-Disposition: inline
In-Reply-To: <20240201183548.66010C433C7@smtp.kernel.org>
X-Cookie: You can't cheat the phone company.
Message-ID-Hash: NMJMARND32H2BXTHWLUV5VSHKGMKFDE6
X-Message-ID-Hash: NMJMARND32H2BXTHWLUV5VSHKGMKFDE6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NMJMARND32H2BXTHWLUV5VSHKGMKFDE6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--15S74Tqch00iAMj+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 01, 2024 at 06:35:41PM +0000, Mark Brown wrote:

> Johan Hovold (5):
>       ASoC: codecs: wsa883x: fix PA volume control
>       ASoC: codecs: lpass-wsa-macro: fix compander volume hack
>       ASoC: codecs: wcd9335: drop unused gain hack remnant
>       ASoC: codecs: wcd938x: fix headphones volume controls
>       ASoC: qcom: sc8280xp: limit speaker volumes

I should also mention that the Qualcomm people were very keen to get
these earlier fixes merged into mainline promptly as they have some
impact on recently merged and released updates to the UCM files, mainly
the fix for headphone volume controls AIUI.

--15S74Tqch00iAMj+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmW75QsACgkQJNaLcl1U
h9DNKQf+MSTF9W6acvBPx39TZbOUzFVX0H2KNlDqK2IC8AUEwXXzqT+OtWYl+6bI
ey5mG0CssLnXGqFOJenicNVLhVLrNrc/lgw+jRCT24LI6RdG5ULXC7iH9Ycd+YID
OxMHe7vcyhXLiw+QuJoZUPyFG/Li813994IBLK9IpY9Rn+88fGLLDfJBDxJVlShy
1XgWEvydRl/c+5ywOFU/TBYdgtVNWiV/mijyQHrBMtTAvzFE4OBaRfHzN5rJjuGg
sF3TwMGH7ffKoiyVt5MP5GILOot6+BhQcxcMkGEKJqm6tbXNQK3dYfXrgO3M906s
w/W/LsJeHZCcvsYs1B0ZxdjGiWAuGg==
=T2wL
-----END PGP SIGNATURE-----

--15S74Tqch00iAMj+--
