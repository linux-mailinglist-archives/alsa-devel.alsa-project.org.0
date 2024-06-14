Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB849090C9
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2024 18:54:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 754B9DF8;
	Fri, 14 Jun 2024 18:53:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 754B9DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718384045;
	bh=fPlz7/O4CHKldDLCxbpg3ui9wtblMgB3TXnLBn0vSI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hlExErN4LbBr2ku6pkZ7BHYHIOkIZhdCBT5HB46tEzjsxyCXXF9h5BfoX+wTlUayo
	 4a/RO87Ja1NiHJXjaTrR5RKNchiT6GH5+RZ4YC9TQ+jupmja4NFz7bRqik7myJ9Hi7
	 8dgwMIZcKgStQq1QXU0/rrSZ3iD62U7M1BDhogDE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 042BDF805AE; Fri, 14 Jun 2024 18:53:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CB53F805AA;
	Fri, 14 Jun 2024 18:53:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B9A8F80448; Fri, 14 Jun 2024 18:53:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B26AF800E9
	for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2024 18:52:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B26AF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CpFq6UCC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D46D1CE2C46;
	Fri, 14 Jun 2024 16:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29068C2BD10;
	Fri, 14 Jun 2024 16:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718383907;
	bh=fPlz7/O4CHKldDLCxbpg3ui9wtblMgB3TXnLBn0vSI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CpFq6UCC7cqq4TL2Q4voaO/eWCDtFrzYqrhpIB1METf7ygd32ZxG5reEb08aI2/2l
	 EOxJV0ZJspzfFvIBXYmPTqrYT27w3rTiKkm+0qK4iCpyuG7O8YAUweHKhCa8wqWvjd
	 cjod0053tLA2spwX/oQuoY0BJCQ8ikbCbbKxI3lw3enf1LhXAA6RU9YT5281LMbTRV
	 BM47sjqNEhDV2l7quJAsEP4p/QiQyrdWTMeDPgyTL6Vqsm+ScmxescTGkW2jxGxXvb
	 /Uf4o81uIhzqasU0dnRZVZ0nFTzxCL9yCWfUrzi+KZa3C2Rw0AIU1tMb3tNPV6KEG3
	 lW5zitAlFmhCw==
Date: Fri, 14 Jun 2024 17:51:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Russell King <linux@armlinux.org.uk>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Chancel Liu <chancel.liu@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [Patch v2 1/2] ASoC: fsl: Add i2s and pcm drivers for LPC32xx
 CPUs
Message-ID: <Zmx1H5MyjWvoRdwz@finisterre.sirena.org.uk>
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <Zmgor8accyAiUkUO@finisterre.sirena.org.uk>
 <CAG+cZ06B+AexqvwZtNP5FX50AmghAFLa=1ebxmKLvMoyVJ529w@mail.gmail.com>
 <Zmxy-xA3YDU06Eht@finisterre.sirena.org.uk>
 <CAG+cZ05KomezPn0bAuZWrfO=rbyLdCU8_Xx11oEihUaD97gF8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7aeyEfJwNjSnCeXl"
Content-Disposition: inline
In-Reply-To: 
 <CAG+cZ05KomezPn0bAuZWrfO=rbyLdCU8_Xx11oEihUaD97gF8w@mail.gmail.com>
X-Cookie: Your love life will be... interesting.
Message-ID-Hash: CBPGVVQX4RN3T5J4IFZHTPUL5ZXZIPMI
X-Message-ID-Hash: CBPGVVQX4RN3T5J4IFZHTPUL5ZXZIPMI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CBPGVVQX4RN3T5J4IFZHTPUL5ZXZIPMI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--7aeyEfJwNjSnCeXl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 06:46:46PM +0200, Piotr Wojtaszczyk wrote:
> On Fri, Jun 14, 2024 at 6:42=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:
> > On Fri, Jun 14, 2024 at 06:24:50PM +0200, Piotr Wojtaszczyk wrote:

> > > Ok. Later I will add a sound card driver to phytec3250 board which us=
es
> > > arch/arm/configs/lpc32xx_defconfig config file so that the COMPILE_TE=
ST
> > > won't be needed.

> > Why would a defconfig affect the Kconfig?

> I guess when lpc32xx_defconfig enables the SND_SOC_FSL_LPC3XXX then the
> COMPILE_TEST won't be needed or does it?

The whole point of COMPILE_TEST is to allow the driver to be covered
when people aren't building for whatever specific platform would
actually use it.

--7aeyEfJwNjSnCeXl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZsdR4ACgkQJNaLcl1U
h9CNrQf/QOGnPQlIqhyNGJmHt+OTyAKxvU02FdwW1IOOW6yQBj4UO9d4k7nblhEn
F7Vtbh6YUxU664IKdVLn2n6JwvOzBu2sPuLmm0JQgsZnlOB23KNWgw7yoZdgPL9m
tKbUe6KCBHoMU/LJe+m2nm9qhAlTXlL4Uf1xgJQ3TK9c2neuko0efOtWy97OE8Oc
PxHGfc5fFxAjEtnOQq47Nj0/fKCzXF3HLOseOx+KibzpUMgVZJTdVilroWPHOGXa
u9aMHOWsdypZIO6rRaAjhslOpENc0zW4+v4gaWtRD8mmsiKzvQuZTB6zo/vMTTfA
GUx5oQKpFeCMxaFkBGj6dCVLbitmgQ==
=r/9i
-----END PGP SIGNATURE-----

--7aeyEfJwNjSnCeXl--
