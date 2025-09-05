Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26363B454F0
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Sep 2025 12:42:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E6BF60155;
	Fri,  5 Sep 2025 12:42:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E6BF60155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757068947;
	bh=0YT3gSVmaRAfERZsP5juwTay+cdaKDtqbsQUs+7eD3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RT3WnKPahsqSpiInSQ+GYFrc4Jb5FnSul+xATIzeshDFYHo2YFrObC34b6T0VEyna
	 NHdm0OfYDs7BcRfO5Xz7KoExhZxji6Jg28Dzcc5MCm0rJAW+/Nli2gxbnsdSs261TP
	 aVegSqQ/vWfDJXlGD/d03USEvccFrX8Tzje/P3VA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E056F805B6; Fri,  5 Sep 2025 12:41:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA48BF805CA;
	Fri,  5 Sep 2025 12:41:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 909E9F80508; Fri,  5 Sep 2025 12:41:38 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B69DF80086
	for <alsa-devel@alsa-project.org>; Fri,  5 Sep 2025 12:41:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B69DF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kjzmTBtw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F4966027D;
	Fri,  5 Sep 2025 10:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BABFC4CEFE;
	Fri,  5 Sep 2025 10:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757068893;
	bh=0YT3gSVmaRAfERZsP5juwTay+cdaKDtqbsQUs+7eD3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kjzmTBtwHMLhywCZLnQFDomzZH7m1TsQMv1EkpTVegEsDO/Dr+j+V+AAoGzxyhbFQ
	 Zq4TaV709BfJux6xejkxhabNoARA64dJeK1SivofU/vwK8EzB98+KPNLd2uuBTzBsT
	 6UQ8PgjtmZcKB9opyRYmcwF0m/+A/S9X6sSV7tLEWyhMbVMd+8pHd+byw5G/1oiPA+
	 eDTpDXwlIFB+SlewvXlPXeN+1tpTR6cc83qwvHwbiiAgql1vOrQ/4b6cwXgKCENmJ2
	 Ntn47s86EbF876fkk2M0/m/2ymR2MBAZ9A31kJUw5+B5gqq+THnl8dcLoh//zmbjbi
	 Gxd6DD2zf7XCg==
Date: Fri, 5 Sep 2025 11:41:24 +0100
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
Message-ID: <b70314db-357f-4c39-a9b4-088d8ebed2b0@sirena.org.uk>
References: <20250830061459.24371-1-baojun.xu@ti.com>
 <993d7fe7-5206-45a9-acb6-0d610a3a2136@sirena.org.uk>
 <12aa63e694c94213aeb6b48959d02b45@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W/8Zc+tPZVZu2YRi"
Content-Disposition: inline
In-Reply-To: <12aa63e694c94213aeb6b48959d02b45@ti.com>
X-Cookie: He who laughs, lasts.
Message-ID-Hash: 3RFBE4C3ABSG55XXFU2VFZSHOEHEW3J6
X-Message-ID-Hash: 3RFBE4C3ABSG55XXFU2VFZSHOEHEW3J6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3RFBE4C3ABSG55XXFU2VFZSHOEHEW3J6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--W/8Zc+tPZVZu2YRi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 05, 2025 at 04:15:45AM +0000, Xu, Baojun wrote:

> > This doesn't apply against current code, please check and resend.

> Hi, do you mean I need a re-patch for the newest (next/linux-next.git) code?
> Or need to create patches on tree broonie/linux.git?

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-6.18

--W/8Zc+tPZVZu2YRi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi6vlQACgkQJNaLcl1U
h9DyYgf+JzOcCB2e4kN0lqPPMtGy3W9chZ/RtSZ7X58/3sxxM8IFEG4/LZR9KOlK
I4tkBJu1o5TcaojTKjg7wJiw44Es1g5I5ZzgObWS1rjngU5k3aW9eH3x5dGTwhOC
XozX6auMJbj8HjxzxIeDo0azbnyMGpUGNDDhMGa91uzxMcyHwyOzLr8p9DqHn+zp
cL0NlkMQVQzfluQa3HN7xkEXwj2xqw1CRmZN4HmI6petXnNHh5DuGeEgrkErrZRf
lFYXKinXgmw8485n9K2g54si/TKeS+d55xfNihEaHufwSu6aWY1/AhP/7Z4eE6Hm
mM+7Uw+83YmCbmYsaxEW7tlKxO6G0g==
=1xzx
-----END PGP SIGNATURE-----

--W/8Zc+tPZVZu2YRi--
