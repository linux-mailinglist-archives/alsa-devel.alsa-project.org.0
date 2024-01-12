Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0ED82C5CF
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jan 2024 20:17:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41150EC0;
	Fri, 12 Jan 2024 20:17:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41150EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705087047;
	bh=Am1A9i2lBbnw4qGcrTrX1i0DCJ+vBKAzCbY9dPPryfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZTFWIneiIboxE1cdJoO5/G5HQX+tJ6GkCzydSlAN/L6hNz19rotwKlqDwif1rbFUT
	 ScZDwSGVvNi1SRn0KPVdI4smiYj4YVIMEUDFXhdvk0kwTQz6NpJNcuJ0V4MYtQplOY
	 QCiCJeK3mdtesqQ5RUCQlmDVeGwglGAglq7e2RoU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CCC3F80579; Fri, 12 Jan 2024 20:16:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6D78F8057F;
	Fri, 12 Jan 2024 20:16:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C040FF80254; Fri, 12 Jan 2024 20:16:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B494AF8014B
	for <alsa-devel@alsa-project.org>; Fri, 12 Jan 2024 20:16:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B494AF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MZZn/68n
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC38861E31;
	Fri, 12 Jan 2024 19:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75404C43390;
	Fri, 12 Jan 2024 19:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705087003;
	bh=Am1A9i2lBbnw4qGcrTrX1i0DCJ+vBKAzCbY9dPPryfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MZZn/68nray6hRjqWId84rTXwl/BOanKKwZBHsc5J/MPtmSiQiYjQZxsmbSzS1Nwc
	 PA2va7IUQP+O3rlxu6CS2NE+zcsVt0wWEGP1LKkbixm4x87RorzmDMhN6Odr3Gr1bU
	 PMmtGZFpoyqBxhZdcbpkIjITklMb9RLn3zrMPHZ5aNP8CUmTAYkvds2WdTN6OOawe+
	 UCHmhpIu3U+X/MB1YSHTtdATdkgtWkrGukQzxjuXolePBp9vFVNUrhdQ3lp+EyLexp
	 ydlBlGmqHW/OSZDavq7UsQzNN1WbUNqDo3mPvXMrR4kmU7QNdUmH+CEOorNYIj7jTY
	 skI22dH3Rg4Qg==
Date: Fri, 12 Jan 2024 19:16:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	tudor.ambarus@linaro.org, pratyush@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sbinding@opensource.cirrus.com, lee@kernel.org,
	james.schulman@cirrus.com, david.rhodes@cirrus.com,
	rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	michael@walle.cc, linux-mtd@lists.infradead.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, michal.simek@amd.com,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	git@amd.com, amitrkcian2002@gmail.com
Subject: Re: [PATCH v11 03/10] spi: Add multi-cs memories support in SPI core
Message-ID: <d21e76ce-8b55-48b1-ade0-9ec22092caeb@sirena.org.uk>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-4-amit.kumar-mahapatra@amd.com>
 <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n9fB7lgLUAsxqCcd"
Content-Disposition: inline
In-Reply-To: <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
X-Cookie: I want a WESSON OIL lease!!
Message-ID-Hash: THJYCC4XJN77QWDEYIMT6QANNU5NYCWR
X-Message-ID-Hash: THJYCC4XJN77QWDEYIMT6QANNU5NYCWR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/THJYCC4XJN77QWDEYIMT6QANNU5NYCWR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--n9fB7lgLUAsxqCcd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 11:11:07AM -0800, Guenter Roeck wrote:
> On Sat, Nov 25, 2023 at 02:51:30PM +0530, Amit Kumar Mahapatra wrote:

> > AMD-Xilinx GQSPI controller has two advanced mode that allows the
> > controller to consider two flashes as one single device.

=2E..

> With this patch in the mainline kernel, two of my qemu emulations
> (quanta-q71l-bmc and almetto-bmc) fail to instantiate the first SPI
> controller and thus fail to boot from SPI. The error message is

Not sure what quanta-q711-bmc is - is almetto-bmc really palmetto-bmc
(which has a mainline DT with a SPI flash)?

>=20
> [    3.006458] spi_master spi0: No. of CS is more than max. no. of suppor=
ted CS
> [    3.006775] spi_master spi0: Failed to create SPI device for /ahb/spi@=
1e620000/flash@0
>=20
> The problem is no longer seen after reverting this patch.
>=20
> Bisect log attached for reference.
>=20
> Guenter
>=20
> ---
> # bad: [70d201a40823acba23899342d62bc2644051ad2e] Merge tag 'f2fs-for-6.8=
-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs
> # good: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
> git bisect start 'HEAD' 'v6.7'
> # bad: [de927f6c0b07d9e698416c5b287c521b07694cac] Merge tag 's390-6.8-1' =
of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux
> git bisect bad de927f6c0b07d9e698416c5b287c521b07694cac
> # bad: [35f11a3710cdcbbc5090d14017a6295454e0cc73] Merge tag 'mtd/for-6.8'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux
> git bisect bad 35f11a3710cdcbbc5090d14017a6295454e0cc73
> # good: [d30e51aa7b1f6fa7dd78d4598d1e4c047fcc3fb9] Merge tag 'slab-for-6.=
8' of git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab
> git bisect good d30e51aa7b1f6fa7dd78d4598d1e4c047fcc3fb9
> # good: [fb46e22a9e3863e08aef8815df9f17d0f4b9aede] Merge tag 'mm-stable-2=
024-01-08-15-31' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> git bisect good fb46e22a9e3863e08aef8815df9f17d0f4b9aede
> # good: [063a7ce32ddc2c4f2404b0dfd29e60e3dbcdffac] Merge tag 'lsm-pr-2024=
0105' of git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm
> git bisect good 063a7ce32ddc2c4f2404b0dfd29e60e3dbcdffac
> # bad: [f6cd66231aa58599526584ff4df1bdde8d86eac8] spi: stm32: add st,stm3=
2mp25-spi compatible supporting STM32MP25 soc
> git bisect bad f6cd66231aa58599526584ff4df1bdde8d86eac8
> # good: [18f78b5e609b19b56237f0dae47068d44b8b0ecd] spi: axi-spi-engine: i=
mprovements round 2
> git bisect good 18f78b5e609b19b56237f0dae47068d44b8b0ecd
> # bad: [9d93c8d97b4cdb5edddb4c5530881c90eecb7e44] spi: spi-ti-qspi: switc=
h to use modern name
> git bisect bad 9d93c8d97b4cdb5edddb4c5530881c90eecb7e44
> # bad: [e6b7e64cb11966b26646a362677ca5a08481157e] spi: st-ssc4: switch to=
 use modern name
> git bisect bad e6b7e64cb11966b26646a362677ca5a08481157e
> # bad: [c3aeaf2f0ec8af93189488bda3928a1ac7752388] spi: pxa2xx: Use inclus=
ive language
> git bisect bad c3aeaf2f0ec8af93189488bda3928a1ac7752388
> # good: [f05e2f61fe88092e0d341ea27644a84e3386358d] ALSA: hda/cs35l56: Use=
 set/get APIs to access spi->chip_select
> git bisect good f05e2f61fe88092e0d341ea27644a84e3386358d
> # bad: [88a50c1663ffa9f6b31705c6bf7a887a2c8d9434] spi: Add support for st=
acked/parallel memories
> git bisect bad 88a50c1663ffa9f6b31705c6bf7a887a2c8d9434
> # bad: [4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b] spi: Add multi-cs memor=
ies support in SPI core
> git bisect bad 4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b
> # first bad commit: [4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b] spi: Add m=
ulti-cs memories support in SPI core

--n9fB7lgLUAsxqCcd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWhkBAACgkQJNaLcl1U
h9C2wgf/ZtMyG4HQA/GSK+rebVCqjyVQet/jKh7v1dsFkCT/xutY7+75Q5AZe3h3
B8U0Euv952q9dUWjbmiZlQRTigIDwJDNNiJkqcu3/oHPCh+p1xERe9f/Qwu8sDMY
toSk5Dtg4TuBE1qEpVZwrd2fzorgxLzvKGHVb8RdZ4pVFm64TT1vXXEyGOaNoyAp
/k30MZdWqi9cvJvgMFW2/XpsIa0kBtWC6o/L6RHjiJluOqVc2BYkDuQboA+qtOE5
jIptXuVM1sOt3vmGr95303roCxKHBxvADD0hwZumLIX5xMd3LSIwBCJ4T7WmNrNm
t0U5a7D4yjLZQ7mOmYsa9uKHAo2Xbw==
=MtQn
-----END PGP SIGNATURE-----

--n9fB7lgLUAsxqCcd--
