Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC30491E62E
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 19:06:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEB4693A;
	Mon,  1 Jul 2024 19:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEB4693A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719853599;
	bh=tlKf3Bi7mDMgBZM+n2HDcWcjHjGpwC6uvUpUb8PK+MA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MontvSd9O7dGoR5XMSFC+ntrfagqtIDRLVFzbNnfebeKpJvVFUlWzvv/jmSZwPBsP
	 ZEh/xe9jWiRo3QdxN+WsvVKfY+8zddHUWP/mSuxQevWOYd6Q2sFeMeEeHcuPvGFWLw
	 I+BB+5eibMwaqrhvsuf19NF/KJ3ZHQJCSThtWz08=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A688F805B3; Mon,  1 Jul 2024 19:06:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CD12F805AA;
	Mon,  1 Jul 2024 19:06:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7D66F8028B; Mon,  1 Jul 2024 19:06:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F82DF8003A
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 19:05:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F82DF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kXLDwVgW
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 539E6CE1A4B;
	Mon,  1 Jul 2024 17:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9175C116B1;
	Mon,  1 Jul 2024 17:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719853553;
	bh=tlKf3Bi7mDMgBZM+n2HDcWcjHjGpwC6uvUpUb8PK+MA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kXLDwVgWaV3pM3cwc9TWqi9Ycg6BiEWLKkRqJkDNk4JHaChdgFfo/ThoVPQoilM+e
	 mjXu7rlFaiQjU/QpoZVlmbhsUcla+mVDOb9vbrifekEMrEBfPynKyH59GWs4BTcrJf
	 9Uw5bW5mv0mWZyv3vRrs/2MqkFk3Hu23ve6dxLzag0U2iTOhcXK+BU6NUMAnu6vKHl
	 YO7hKeXOWmsAmUXo0FtLAXrQO9FlfjvmcpvbXGquBXudpMD1Cv3WY7ITohOwpUZudQ
	 GDoDjVPuXvzeybKmotQfxUukkeIcjnTueqM3ZC0WoTJQIeTXJ75ZbTz86P/CKU1wIJ
	 /+iEWTee0+Yaw==
Date: Mon, 1 Jul 2024 18:05:45 +0100
From: Mark Brown <broonie@kernel.org>
To: "Ding, Shenghao" <shenghao-ding@ti.com>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
	"13916275206@139.com" <13916275206@139.com>,
	"zhourui@huaqin.com" <zhourui@huaqin.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"Salazar, Ivan" <i-salazar@ti.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Chadha, Jasjot Singh" <j-chadha@ti.com>,
	"liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
	"Yue, Jaden" <jaden-yue@ti.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"Rao, Dipa" <dipa@ti.com>,
	"yuhsuan@google.com" <yuhsuan@google.com>,
	"Lo, Henry" <henry.lo@ti.com>, "tiwai@suse.de" <tiwai@suse.de>,
	"Xu, Baojun" <baojun.xu@ti.com>, "soyer@irl.hu" <soyer@irl.hu>,
	"Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
	"judyhsiao@google.com" <judyhsiao@google.com>,
	"Navada Kanyana, Mukund" <navada@ti.com>,
	"cujomalainey@google.com" <cujomalainey@google.com>,
	"Kutty, Aanya" <aanya@ti.com>,
	"Mahmud, Nayeem" <nayeem.mahmud@ti.com>,
	"savyasanchi.shukla@netradyne.com" <savyasanchi.shukla@netradyne.com>,
	"flaviopr@microsoft.com" <flaviopr@microsoft.com>,
	"Ji, Jesse" <jesse-ji@ti.com>,
	"darren.ye@mediatek.com" <darren.ye@mediatek.com>
Subject: Re: [EXTERNAL] Re: [PATCH v1] ASoc: tas2781: Add name_prefix as the
 prefix name of DSP firmwares and calibrated data files
Message-ID: <7a44a36c-6f95-4c5b-a86d-044f9ad13ac1@sirena.org.uk>
References: <20240629101112.628-1-shenghao-ding@ti.com>
 <8245d8e7-3ff0-4f05-9f99-666e9693603f@sirena.org.uk>
 <664b818a177f4403bd60c3d4cd0bf4d1@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X468BpO+KDEWwkKZ"
Content-Disposition: inline
In-Reply-To: <664b818a177f4403bd60c3d4cd0bf4d1@ti.com>
X-Cookie: Microwaves frizz your heir.
Message-ID-Hash: 4IUJKJDG65RFCKPOAM5COZBHABR4IH5H
X-Message-ID-Hash: 4IUJKJDG65RFCKPOAM5COZBHABR4IH5H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4IUJKJDG65RFCKPOAM5COZBHABR4IH5H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--X468BpO+KDEWwkKZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 02:00:13PM +0000, Ding, Shenghao wrote:

> > I'll apply this but I do wonder if it's worth falling back to trying to=
 load the
> > unprefixed name if we fail to load the prefixed one.

> If fail to load dsp firmware, the driver won't load unprefixed name firmw=
are,=20
> but switch tas2563/tas2781 to bypass-dsp mode automatically.
> In this mode, smartamp become simple amp.
> These day, I met a case from one of my customers, they put 2 pieces of ta=
s2563,=20
> and 2 pieces of tas2781 in the same i2c bus. In order to identify tas2563=
 and=20
> tas2781, I think name_prefix is a good solution for this case.
> Looking forward to your comment. Thanks.

Yes, the name_prefix is a good idea and probably people want things
specifically tuned for the DSP - I was thinking about error handling or
upgrade cases where wrong calibration might work better.  Bypass mode
means the device will still function at least.

--X468BpO+KDEWwkKZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaC4egACgkQJNaLcl1U
h9C/aAf/awSSP6/CWpeSsZln8BvRCZrSNarnxmhakBfubuGZsBnYigj6B6a1+3yl
nL9O1GGnP9K+gqXmOGyROc5RAo5AYlEW3WMJ2XulzQ1cJQJp9y9B7NI2tG77ifS3
PatH/PvgLVBkGSHucYN8l5xl7+cbtTJHClg/o0xBbUTQ55tUjsylDYi9v7pJoWSB
VBiceGAY7n9cSOa7DCw7Cvk0e5pugNSzx5QtimuOcZwuGvdKCL/2AVuq9wpXHl2o
1TVfUVxOxPBRySgjW5TOzJtKMBndPfORQ3VkqDLjGTwayj4GUTtTs89P5ypyGRln
Pv1+4b3ufBR65fMywQVN/DmzZ54NpQ==
=3KUS
-----END PGP SIGNATURE-----

--X468BpO+KDEWwkKZ--
