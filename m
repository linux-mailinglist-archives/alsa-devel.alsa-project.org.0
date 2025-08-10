Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B3AB1FBF9
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Aug 2025 22:07:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95B446022B;
	Sun, 10 Aug 2025 22:06:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95B446022B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754856421;
	bh=pllPXHwz/RPDMfVWZIUSYUcNDnCv/UBWTzGkcJ2N38s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ah7CLO2qcuVHqjXp4QODaB/cTaHUXQrNj5ki4PPNTjlhnGugZfTjbli7gpMh3053f
	 i2WBXMKBLtzCJ6EkdYc3lyhaSwNmfBJ6cWCOnxrjxSE2lyg+bKdv7fZ5KxJxHCajme
	 QolqY5ooVLbDnR30tn8vmPc0mTfFQb9qjmttkPDg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70CFBF805C4; Sun, 10 Aug 2025 22:06:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53342F805BF;
	Sun, 10 Aug 2025 22:06:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2987F80272; Sun, 10 Aug 2025 22:06:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF0F4F80093
	for <alsa-devel@alsa-project.org>; Sun, 10 Aug 2025 22:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF0F4F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=H3NLYvh/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54FBE61409;
	Sun, 10 Aug 2025 20:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D70C4CEEB;
	Sun, 10 Aug 2025 20:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754856371;
	bh=pllPXHwz/RPDMfVWZIUSYUcNDnCv/UBWTzGkcJ2N38s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H3NLYvh/OxabO0SiK5cZVEWn93Kv+ARL7zo9r/Rds7AniIen7lg8zXnDT+Qj24ZeB
	 tU1wY7gAQLO23yuzQlDhBEecaMUOp/RH6isbLedYKI3EVgIj3F4r8ZXsHRdBTPvReO
	 sIr3oMN3BYprmPlKfUDG0kqanvqSebAsZhccFyPJeOeMu3jx02UCCZq6SXPs1+GSLP
	 Kq/Y/1nqWckq+cDm2p+aq8smvhIf48kG6RRExDlGB+aXGKFmoPUXTAsI/2wEk37MEq
	 55uX4k2qvoZCfFJe5m/I9lbZj9+BBMnIoDDmgX6Mqn4wWt8ubQRhZbQHi1juUmPRAg
	 U+nTHxBB3lK6g==
Date: Sun, 10 Aug 2025 21:06:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com,
	alsa-devel@alsa-project.org, shenghao-ding@ti.com,
	13916275206@139.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ALSA: hda: Add TAS5825 support
Message-ID: <034afe16-4027-461f-bf5b-d95a15d6a0e0@sirena.org.uk>
References: <20250810122358.1575-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wP2b3y7eRXX+SnBm"
Content-Disposition: inline
In-Reply-To: <20250810122358.1575-1-baojun.xu@ti.com>
X-Cookie: Natural laws have no pity.
Message-ID-Hash: W56Z2AEHCDVNO23ZERULT24OENIPLR2X
X-Message-ID-Hash: W56Z2AEHCDVNO23ZERULT24OENIPLR2X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W56Z2AEHCDVNO23ZERULT24OENIPLR2X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--wP2b3y7eRXX+SnBm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 10, 2025 at 08:23:58PM +0800, Baojun Xu wrote:
> Add TAS5825 support in TI's HDA driver.
> TAS5825 is an on-chip DSP, but no calibration is required,
> and no global address support smart amplifier devices.

Acked-by: Mark Brown <broonie@kernel.org>

--wP2b3y7eRXX+SnBm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiY+6gACgkQJNaLcl1U
h9DVdgf/ZWlTUDmxwnNn4h43uCr2IBqCUeAB7aoggFcVR0fLtr5CikECiBbtqaFe
dHsG6JOJitCG/cauQyL1UcX0nyjVMng7SULHUvkRO0bbw7Hptz4MLnm4Kdws2h7S
/K77hWkRCieJLMI43SHwnUu7LFad08lxiIqMIsteBtVQ3C6BMN0s57ufaQ35dA8v
qSt42M9ZwS+N9cJtdci2OB6uRbxh8aBeN9kCDMasp+zzrpKbvRdz019rm06InTsN
iWmJ1S8g9PiFIMHW3ArC2ZIb/QdI5qHdJsQ9g6M7+A8q2qogI+l9rwXTICHbMGjA
1m2H03DYMOrJpk5wu8GzFGbSKNQ7EA==
=ZfyP
-----END PGP SIGNATURE-----

--wP2b3y7eRXX+SnBm--
