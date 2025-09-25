Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D65BA2007
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Sep 2025 01:53:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFC8D601F0;
	Fri, 26 Sep 2025 01:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFC8D601F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758844426;
	bh=erOnXljr1CF5krssC9cl4XOhPI/hrAqcFARq/3Ceb7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h7rooipI2+KIxlfB4phVobzeX3jZh3+FtC7A5OTErFF6MpsfCrYYZpHS66J8PNUBR
	 lFaCPeH2Ie43l65/4//ByOyzQeJrr8tQlLae6P4NjBR/0I7LKvygTUinlf4NhBoyEL
	 a14ZsRjtV1gxiytxZnpoXTN7Ni6efVqZDJMwXR5k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 596DBF805C3; Fri, 26 Sep 2025 01:53:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC0CEF805BD;
	Fri, 26 Sep 2025 01:53:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C64E4F804FC; Fri, 26 Sep 2025 01:52:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BFA2BF8011B
	for <alsa-devel@alsa-project.org>; Fri, 26 Sep 2025 01:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFA2BF8011B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qUznzpKd
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D9FE439D1;
	Thu, 25 Sep 2025 23:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0FBC4CEF0;
	Thu, 25 Sep 2025 23:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758844362;
	bh=erOnXljr1CF5krssC9cl4XOhPI/hrAqcFARq/3Ceb7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qUznzpKdr7a6cKKMlWesJiEcfIMdUPFM7TIL1WD5pNwjVNbQB+8ZwYqHt6UtIZXud
	 y0ep0uOPcq10h9cxruVL7uhCAfkOtih7CPlHWmRqQdmnvozTw3VGkYoHjMBMuFkIz1
	 PGr9Y1E8b+RX/OC0YZtMdk0ZP1r2H2th7vJMT1dy0PrHKA9gX/2WanjhVy+ZCJeUh7
	 EdpGwSh/3bBXQK5CiFC9JY5/YTGNp9FVzb9PEi2Oc7BvRnu3svbf6s80LlMlfREvim
	 DGanULl5337mJCtw1UeKQd/53bHbP5dsrwUQh+XBotEwzhtfuniHaIf6bFwHGl80aB
	 WcrOJN8gvlyVQ==
Date: Fri, 26 Sep 2025 00:52:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13916275206@139.com,
	alsa-devel@alsa-project.org, shenghao-ding@ti.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, k-yi@ti.com,
	henry.lo@ti.com, robinchen@ti.com, jesse-ji@ti.com,
	will-wang@ti.com, jim.shil@goertek.com, toastcheng@google.com,
	chinkaiting@google.com
Subject: Re: [PATCH v1 1/2] ASoC: tas2781: Add tas5828 support
Message-ID: <fe5cd279-0b28-470b-88c2-49ad9428b125@sirena.org.uk>
References: <20250925051302.6805-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wqEEULI/76E+hpBZ"
Content-Disposition: inline
In-Reply-To: <20250925051302.6805-1-baojun.xu@ti.com>
X-Cookie: So this is it.  We're going to die.
Message-ID-Hash: KKGHMHWYS3UAR6D2CBQWSQAOQKIPX7PT
X-Message-ID-Hash: KKGHMHWYS3UAR6D2CBQWSQAOQKIPX7PT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KKGHMHWYS3UAR6D2CBQWSQAOQKIPX7PT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--wqEEULI/76E+hpBZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 25, 2025 at 01:13:01PM +0800, Baojun Xu wrote:
> TAS5828 have on-chip DSP but have no calibration required stereo
> smart amplifier.

This doesn't apply against current code, please check and resend.

--wqEEULI/76E+hpBZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjV1bkACgkQJNaLcl1U
h9DHcAf9EuS3d8oup+XlJUpvsOnB0mljoa4P/F5jv4tdKvmjIQbsNgesKDJBthz8
uyUzb8DkJLufBS2rDJxufCCm5AbNTB3zTJwOhng+fm4j3bpjJTuU9Z1umB144NX/
UwhdJXM96wqQkgGwLgBWaDtRfiCidOYT5bYNJ6sx3MhpfX7VEzML4bPXiT2HWqNz
mmAh3IucXSacEQ6UvaD0B3iQohx39/Tghmv6AEM0FA2BmYWOovvGe59ifqLyyxvQ
bf45NWBkz74dYArErMj3+P34FR2zqrlOib5AAmZPtzjvkEEM+w+4pRKw4uIBogeC
/NxJYFj37vwlSgvNgAEOPbkazh0mOg==
=nh23
-----END PGP SIGNATURE-----

--wqEEULI/76E+hpBZ--
