Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAA3B496A0
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Sep 2025 19:11:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 708B0601EF;
	Mon,  8 Sep 2025 19:11:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 708B0601EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757351516;
	bh=W7ZjuTlEOwtXCnjihP+ONmRgNNY2Qrkb/fLDCbAG+Uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fZSLniQPYqy/XDhzTVMZFhJq1hdBNSRkUNNuZnvrLyCD0j3lo+ZBjwjyvupl/4VKt
	 rESpV9AhKQxQxEmTJk6rUt+HWchaYdJjMAI5usz/16gBphKR4kk6k5Fi6+JTb+x+NK
	 1cCTWx3zFnWfu2XgctckIUsmipkvy9yp0ddi0qhQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 515AEF805D8; Mon,  8 Sep 2025 19:11:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8E8DF805CA;
	Mon,  8 Sep 2025 19:11:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CDB6F8016E; Mon,  8 Sep 2025 19:11:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECA31F8016E
	for <alsa-devel@alsa-project.org>; Mon,  8 Sep 2025 19:10:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECA31F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Tk8kGXq9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EDFCA42BAB;
	Mon,  8 Sep 2025 17:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F28C4CEF1;
	Mon,  8 Sep 2025 17:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757351434;
	bh=W7ZjuTlEOwtXCnjihP+ONmRgNNY2Qrkb/fLDCbAG+Uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tk8kGXq9QBtgZrdFo/n3vuQp/auP++O89rnilB+a0+axf7iThox/UFHD3u+iHDWKe
	 ZOGqOX4LDC+vJNntHb9HxrluLOZcJ54s5PSlKd3dqw3LLrautndhzS4a3sZvVKAm5n
	 UjOEnjp7fbpEQFxUexOS60RTmPuR9ktNtZRAbGqqtVZFgxNifd8gy/q6EjNVp+Y+dp
	 WT1oUxef9h7tFs+VdwRZB6NMJ0nzOMgo/sQ7qGcEy9Sf/a6Cz7kbnDL0KMDSyqBgPj
	 PDpaNF0F8dAroBC6DHJjGVyKjiWFvHi+9EiSkLu9MVQ9D+nDxMmyqjtz2Kbc2em+z6
	 DxREZyTYxkzgw==
Date: Mon, 8 Sep 2025 18:10:28 +0100
From: Mark Brown <broonie@kernel.org>
To: "Xu, Baojun" <baojun.xu@ti.com>
Cc: "tiwai@suse.de" <tiwai@suse.de>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"13916275206@139.com" <13916275206@139.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"Ding, Shenghao" <shenghao-ding@ti.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"Yi, Ken" <k-yi@ti.com>, "Lo, Henry" <henry.lo@ti.com>,
	"Chen, Robin" <robinchen@ti.com>, "Ji, Jesse" <jesse-ji@ti.com>,
	"Wang, Will" <will-wang@ti.com>,
	"jim.shil@goertek.com" <jim.shil@goertek.com>,
	"toastcheng@google.com" <toastcheng@google.com>,
	"chinkaiting@google.com" <chinkaiting@google.com>
Subject: Re: [EXTERNAL] Re: [PATCH v4 1/2] ASoC: tas2781: Add tas2118,
 tas2x20, tas5825 support
Message-ID: <071e0e04-e2cb-480d-8207-f6ba87cb56b5@sirena.org.uk>
References: <20250830061459.24371-1-baojun.xu@ti.com>
 <993d7fe7-5206-45a9-acb6-0d610a3a2136@sirena.org.uk>
 <12aa63e694c94213aeb6b48959d02b45@ti.com>
 <b70314db-357f-4c39-a9b4-088d8ebed2b0@sirena.org.uk>
 <67fafc23d16d4790821321643a87385f@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+406khRUHZ73UGFa"
Content-Disposition: inline
In-Reply-To: <67fafc23d16d4790821321643a87385f@ti.com>
X-Cookie: Air is water with holes in it.
Message-ID-Hash: LSBV6I2NVYBOGTQJH4LWWLLQTCCMQBXX
X-Message-ID-Hash: LSBV6I2NVYBOGTQJH4LWWLLQTCCMQBXX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LSBV6I2NVYBOGTQJH4LWWLLQTCCMQBXX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--+406khRUHZ73UGFa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 08, 2025 at 06:22:51AM +0000, Xu, Baojun wrote:

> > > Or need to create patches on tree broonie/linux.git?

> >   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-6.18

> This patch is also relative (shares the same include/sound/tas5825-tlv.h)
> with another commit on next/linux-next.git:
> https://patch.msgid.link/20250810122358.1575-1-baojun.xu@ti.com (ALSA: hda: Add TAS5825 support)
> However, it was not merged into broonie/sound.git yet, should I wait for it?

OK, it's probably easiest to just apply these directly to Takashi's
tree:

Acked-by: Mark Brown <broonie@kernel.org>

--+406khRUHZ73UGFa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi/DgMACgkQJNaLcl1U
h9CJuQf/RcWlYaOU6atwCI8zHjGpf1PxtrwNOOUZj0EX8bRkztKxNyHuRYjwqPSx
3zZBX5GX/YPXS+9/oL3XplaYE9xtyGSq/yR1GqEr/acBmQkLgmwG5Hzv7a7yx4cj
v36Tlk4qHEyFzrs2QVrNM87FOxdrrnVASGHSVwzqNn1b+WfD0HCG652oMDYXGfWM
SQUH09smpYCGqpDaLKNWDJKF8m/Tt0itPBA6J5AEX92xwljNYpvYohc9ydLZW++E
ObD4Hc6Y71tH13sqXKDijCvBwLdVJx4CSuZ7GOdFoLIRvKvtCcfvPnskamXDXCUS
V5wucygKLUOSMLxvUbYYGAgKjWdArA==
=02zS
-----END PGP SIGNATURE-----

--+406khRUHZ73UGFa--
