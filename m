Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A90C67B442
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 15:24:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B76EE79;
	Wed, 25 Jan 2023 15:23:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B76EE79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674656689;
	bh=jWLazPvj3pnZUFvAR8usCtdgM2mJnO+ZF5Qh2FhGkjM=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GOfVcMU9sI2Cq2nRy8CGYyh9mnjaWsfxwQQ/z8znOLNCQsbkcYftnMqLMjBNGk0Ah
	 q7WagPVLefDlp2iidqINfXFh7ESx0fAozdK0KH68BH/FY9d4hz+TRE1bg71amqnd0Z
	 0fP2MzZHGt7VRyp5JJ+HTyIdQu5bw9MXKup4wkQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E61AF804A9;
	Wed, 25 Jan 2023 15:23:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB433F80424; Wed, 25 Jan 2023 15:23:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 175EDF800FB
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 15:23:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 175EDF800FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=V/Nqdcjw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A06AF61502;
 Wed, 25 Jan 2023 14:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90727C433EF;
 Wed, 25 Jan 2023 14:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674656623;
 bh=jWLazPvj3pnZUFvAR8usCtdgM2mJnO+ZF5Qh2FhGkjM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V/NqdcjwmFo8Pii2c8k80jWwIlPZPCk+/BEiiXTtYSzjqJlWG1Oj0kCmANCmOQuWT
 nxuw86sxfj8zdCyM8sRxDOiqTvF60zOJDLtMdARLCMe4r8g2PebBUISuzt/BoZ2/BE
 9kk2N22Ih81NIaNIw4P5NaakV5zPag+bs5VI3LStXCSkiVKLusRqx4aOn8LS+KozaX
 t58R5gViQYLE3NmeLPzr4dMCR7w9dpHTd6cgyhyvPXvMlwaFOmWezuwMJsW4Sw+n0e
 3CjnfbhPTin3JUh04SCj+Joxf9dpGsB6jZ/PvEueCHvMp21yHmuXYcWvTWipJRrn7f
 A2UVi//YZ9dCA==
Date: Wed, 25 Jan 2023 14:23:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexandru Ardelean <alex@shruggie.ro>
Subject: Re: [PATCH 2/4] ASoC: codecs: tas5720: add support for TAS5720A-Q1
 (automotive) variant
Message-ID: <Y9E7a/erXV/xd3lz@sirena.org.uk>
References: <20230115193347.24190-1-alex@shruggie.ro>
 <20230115193347.24190-2-alex@shruggie.ro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IN+g6atGAzM+/NVn"
Content-Disposition: inline
In-Reply-To: <20230115193347.24190-2-alex@shruggie.ro>
X-Cookie: Nice guys get sick.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 steffen.aschbacher@stihl.de, tiwai@suse.com, lgirdwood@gmail.com,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--IN+g6atGAzM+/NVn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 15, 2023 at 09:33:45PM +0200, Alexandru Ardelean wrote:

>  static int tas5720_mute_soc_component(struct snd_soc_component *componen=
t, int mute)
>  {
> +	unsigned int reg, mask, val;
>  	int ret;
> =20
> -	ret =3D snd_soc_component_update_bits(component, TAS5720_DIGITAL_CTRL2_=
REG,
> -				  TAS5720_MUTE, mute ? TAS5720_MUTE : 0);
> +	switch (tas5720->devtype) {
> +	case TAS5720A_Q1:

This doesn't build:

/build/stage/linux/sound/soc/codecs/tas5720.c:217:17: error: =E2=80=98tas57=
20=E2=80=99 undeclare
d (first use in this function); did you mean =E2=80=98TAS5720=E2=80=99?
  217 |         switch (tas5720->devtype) {
      |                 ^~~~~~~
      |                 TAS5720
/build/stage/linux/sound/soc/codecs/tas5720.c:217:17: note: each undeclared=
 iden
tifier is reported only once for each function it appears in
/build/stage/linux/sound/soc/codecs/tas5720.c:214:33: error: unused variabl=
e =E2=80=98va
l=E2=80=99 [-Werror=3Dunused-variable]
  214 |         unsigned int reg, mask, val;
      |                                 ^~~
cc1: all warnings being treated as errors

--IN+g6atGAzM+/NVn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPRO2sACgkQJNaLcl1U
h9CqZwf/XynyDp8ChZbxx3Q8y/3ooG8nSiuib+KNMcHqdZF/3KOnx3eW1vOXJ0IV
WhmoFWOoW5qZ4naXyFiN04HKt9CYitZX9+dcKa1CjUfJPs1Sr9Z7VmxKU7evpR/y
IacUhb1qU+EJrBGONg6erVrffgWD3quJw+DVripimsAi2MFAWdUCHw24GmgmG6ay
F8RFX5TgH+6673YiM+LDsie/RER3QVlcbdVp7oHM99RCqIYpLL7XHeoaRNbumIWs
b6wBlYm7cuaa83jRgflM/ka1Ac6J1yjlaFUfhu5n7MpxnTep5Hjfds5fwMh5SJHk
qjmewk5RCT+4V0GsoxfEJalpsxTuMw==
=4cCs
-----END PGP SIGNATURE-----

--IN+g6atGAzM+/NVn--
