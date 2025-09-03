Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CED5B41D2C
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Sep 2025 13:37:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2864160202;
	Wed,  3 Sep 2025 13:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2864160202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756899457;
	bh=kcoz6IRnW6gx/sB53OJmz0DlwnSZ6BGmZgBLPY8OboE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eMQfxYx1sENxEkhzZkqZ6J04px8H4/PN+U6TxzuM2kMlMvTcjhCFbbPi7f+hPKdZm
	 7CF0rVSfiOusc+z8K8D2jC0HmIHyIth72ohKQcvNwmn2t12ATMdrW0BnMxi/1tSp+x
	 Ms3wC6v8k7Vnu0ztnMCDRD4eI+1tHUkauDnHFtQ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E82A0F805D7; Wed,  3 Sep 2025 13:37:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BF1EF805C0;
	Wed,  3 Sep 2025 13:37:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71E51F80075; Wed,  3 Sep 2025 13:36:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9A10F80075
	for <alsa-devel@alsa-project.org>; Wed,  3 Sep 2025 13:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9A10F80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CujKhsZ2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A632B6013B;
	Wed,  3 Sep 2025 11:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A51C4CEF0;
	Wed,  3 Sep 2025 11:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756899404;
	bh=kcoz6IRnW6gx/sB53OJmz0DlwnSZ6BGmZgBLPY8OboE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CujKhsZ2eiNRgmkEythvEi3aZU5NdXxkxS86MoT1EeaPOQpXAz95hFRMOo/UdfWrd
	 DU6aitLbnA+3mFS8jY8RC469ToVH5S+h63Y8TMj/83HQ/ogL3MkVVVwPcN+DrVnWwg
	 a2KXKxkSkpCNF1b/pPJrKnjSaT+vCNhI7P4MdGQFJ/EcJd1xNc1qMyWxkdVqNzKSDF
	 4PzBDwMgw9QTqm5eDCsRf1xSvozFHIbRX717nOAqZ2p/orcqxaGOhqC7Rv8Jk3GfaL
	 e7V8l16gYikzTub0o+f5VlP6KkREqFS/p56TnQyjNmC4xRp1WPqGtBBSo4wah6t4x6
	 GcIDSC73KY2zg==
Date: Wed, 3 Sep 2025 12:36:37 +0100
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
Subject: Re: [PATCH v4 1/2] ASoC: tas2781: Add tas2118, tas2x20, tas5825
 support
Message-ID: <993d7fe7-5206-45a9-acb6-0d610a3a2136@sirena.org.uk>
References: <20250830061459.24371-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GnIkFgzAOSmCpQmI"
Content-Disposition: inline
In-Reply-To: <20250830061459.24371-1-baojun.xu@ti.com>
X-Cookie: try again
Message-ID-Hash: SELCOIQF2GAYUGZ5QGRJOTMPGZ6YO7A2
X-Message-ID-Hash: SELCOIQF2GAYUGZ5QGRJOTMPGZ6YO7A2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SELCOIQF2GAYUGZ5QGRJOTMPGZ6YO7A2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--GnIkFgzAOSmCpQmI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 30, 2025 at 02:14:58PM +0800, Baojun Xu wrote:
> Add tas2020, tas2118, tas2120, tas2320, tas2570, tas2572, tas5825
> tas5827 support in tas2781 driver.
> Tas2118, tas2x20, tas257x have no on-chip DSP, tas582x have on-chip
> DSP but have no calibration required stereo smart amplifier.

This doesn't apply against current code, please check and resend.

--GnIkFgzAOSmCpQmI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi4KEUACgkQJNaLcl1U
h9AlZgf/e7VQ6pQUaocUBbqFkv7B2Odnfb9DRKZ3FDueq/0l2XWuvcYzMVaDkCHB
jlDGfEPUsWSwhNL73yRKy7w2OOOcS9aKHhq6X87Cjt/KGQKmkSGqp5EwYDiiUeLU
iqJCC9quMvYi2egEAEWBtk1W2rYH04nvoZokngeGhAUvAyT+6vaZYMNe0ZOxgFY5
douQiaHI3SN7C+KGJWKob7PhvjT7MZ614Ikq/6xVFU1uwGSHDNLwF4JGesBUTxsw
IKtqqhlPoGB8c9FfPWyarSzn+p1vs0fodL/iqDKcwFEB0d7BYc3SkL8JK68sOv63
D4n4tLwE0keYygArv8QRb8Hr5hD/yg==
=lHOI
-----END PGP SIGNATURE-----

--GnIkFgzAOSmCpQmI--
