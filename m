Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 102377F1FF9
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 23:08:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C79FAE9;
	Mon, 20 Nov 2023 23:07:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C79FAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700518084;
	bh=VgevGQRE0DkW5gNXBJLRH1C9nvApnpFXwehmDOXU/q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oVlxjWbtXSaOryZ1CtIW3tGkEqkqqQbRLGkpQYmkmJ6iVQt3SFHJf4jPVStLnxMCl
	 CJKu7ZQdYbluX8wDfjtMTqY+Gsm6KoU+U1l3U+Xpf4rFS2iShuxGPJ/lYoU2zd8plL
	 XmE92w2GLqH3deB7LcSfwrA7cw87oKxAeTW0sbpE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4417EF8057D; Mon, 20 Nov 2023 23:07:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9335BF80579;
	Mon, 20 Nov 2023 23:07:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54E4DF802E8; Mon, 20 Nov 2023 23:07:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CA80F80093
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 23:07:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CA80F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iU6FAGtP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 349C6CE17B5;
	Mon, 20 Nov 2023 22:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C49FBC433C7;
	Mon, 20 Nov 2023 22:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700518042;
	bh=VgevGQRE0DkW5gNXBJLRH1C9nvApnpFXwehmDOXU/q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iU6FAGtPzvf4n9aM9W0QY4oudQh44SjSKBAI7GZnP37lx9b4Ur3Mj65H4PbTVlJe1
	 K830TcCwVhF4na4SXXAjtuai+L+A4G0Z1VWcmlq7Rf5al1z2bgJiwIVL70UoAy60JP
	 woqqwzLVJtmflPxfvt8pEjG9+CU6dhobQk6kSlU/BwIslM2g2r0yTlNK+lMPACTjuE
	 SMPQGHtftu7E7I7YS2d/topBuO0JD4U+ptQ0vcLMCJUPTkZd4ECtI99oWD5qN1mrOF
	 Em6PZDSrO8QmYMfZ0HBjZs5I19UKiw24kyVI9YIuY/WfdXmp8xYZmKtlBXOW1J85vA
	 e4Go+Gv3eNASg==
Date: Mon, 20 Nov 2023 22:07:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] ASoC: imx-rpmsg: Force codec power on in low
 power audio mode
Message-ID: <edd348ea-ef95-453a-9838-636769ab569f@sirena.org.uk>
References: <20231023020718.1276000-1-chancel.liu@nxp.com>
 <20231023020718.1276000-2-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ys7+XtCcLmb6Czww"
Content-Disposition: inline
In-Reply-To: <20231023020718.1276000-2-chancel.liu@nxp.com>
X-Cookie: The meek don't want it.
Message-ID-Hash: XQ477GLFT3HB6AYMBNT76F33HWH2B4E4
X-Message-ID-Hash: XQ477GLFT3HB6AYMBNT76F33HWH2B4E4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XQ477GLFT3HB6AYMBNT76F33HWH2B4E4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ys7+XtCcLmb6Czww
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 10:07:18AM +0800, Chancel Liu wrote:
> Low power audio mode requires binding codec still power on while Acore
> enters into suspend so Mcore can continue playback music.
>=20
> ASoC machine driver acquires DAPM endpoints through reading
> "ignore-suspend-widgets" property from DT and then forces the path
> between these endpoints ignoring suspend.

This breaks an x86 allmodconfig build:

/build/stage/linux/sound/soc/fsl/imx-rpmsg.c: In function =E2=80=98imx_rpms=
g_late_probe=E2=80=99
:
/build/stage/linux/sound/soc/fsl/imx-rpmsg.c:60:46: error: implicit declara=
tion=20
of function =E2=80=98of_find_device_by_node=E2=80=99; did you mean =E2=80=
=98of_find_i2c_device_by_node=E2=80=99?
 [-Werror=3Dimplicit-function-declaration]
   60 |                                 codec_pdev =3D of_find_device_by_no=
de(code
c_np);
      |                                              ^~~~~~~~~~~~~~~~~~~~~~
      |                                              of_find_i2c_device_by_=
node
/build/stage/linux/sound/soc/fsl/imx-rpmsg.c:60:44: error: assignment to =
=E2=80=98struct
 platform_device *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from i=
nteger without a cast [-Werro
r=3Dint-conversion]
   60 |                                 codec_pdev =3D of_find_device_by_no=
de(codec_np);
      |                                            ^
cc1: all warnings being treated as errors

--ys7+XtCcLmb6Czww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVb2JIACgkQJNaLcl1U
h9D5Ygf/Ur0x116afGwToupSLPOlWheujkRjuYUrg95VQwQ3SkvnrgRzVCJ+GIst
9GzXEnzHorx+Vw4NzSNtzA5TF94TOOf+9GuRz5LQrl5hUJFhOnF0lz+0FGrXbXNE
yTD3a0tuYY7uSXyxFAZEszj3kHhUFZYg9SMAsJXVkpzej8rP7PiiJ2CyjnrkX0hY
lt6a8UmWNeNDaxS/8PMAXsraltapBbMjgxKYUCrbRXG8eRwZuKM1FBUyTkk5rER3
81ZfNxk2+8f5PDf9pX7mmjQXnPjDmumPU5HWn4Oz0cfEXeUG8xopxm50UwxLvhBk
Jj4TQkMAEWCmlRaVVi8MKepQqzhNig==
=sif7
-----END PGP SIGNATURE-----

--ys7+XtCcLmb6Czww--
