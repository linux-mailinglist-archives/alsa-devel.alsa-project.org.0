Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4424C44F2
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 13:52:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 394781937;
	Fri, 25 Feb 2022 13:51:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 394781937
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645793548;
	bh=q1+r/+3xtWcPMv4T9j+32cafcz5PosdhCxKdmS5340g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vBiJMTdrglu5z6jRfeXXIMKZ3FLtS0m6v+Qpz3Y+yaCW5ixkwdA7rGgkhXlgVf8AF
	 6199FclX86ny++lfLCa1/lU+i1B1q9IbLd0Zb1Ze0vibW/2LiX9hrfnuDfXGxnHtz1
	 tRAcunLCIcY2G1+GNm/WmO7Gd0U+tfXvIEx11ok8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5186CF80159;
	Fri, 25 Feb 2022 13:51:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDC58F800B6; Fri, 25 Feb 2022 13:51:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C44A6F800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 13:51:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C44A6F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qFtlxCms"
Received: by mail-wm1-x32c.google.com with SMTP id r10so1601793wma.2
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 04:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=D8OkI5TiOmFqdEQ1+JExn8L7GZBvYCU0s5pvA+scH4E=;
 b=qFtlxCmsJW0iYp6O6aQUAt92qxIp3FA3KLYPQqOkTNYMBNmitYRRSJ/2XNzOlWbitx
 FBO14LkJ/Hsoks8Ycb6aOb+Udtayxs9u3mkLKbwh18PPlHXXjLBJsuM+pg4REcFo0eR/
 JnC8khZewuHT6+ea+Kp20IzzJrPaVSLgGV/n7ChimT/UUYCZ2uXKV3TkiySMFu9nW2Lj
 cYNhU0ppyM9yR+Y6iC9AZi05cjvJM3E55j41DBYEg87ULbWS6E3xkLvEN6Xl6F9ERUcr
 uTw2nbB6YwhMD+QhBCiiUNDvfbRjw401gSdkZllKI1SIUghvuK/MxqYGR+h5CpEBOjJD
 HxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=D8OkI5TiOmFqdEQ1+JExn8L7GZBvYCU0s5pvA+scH4E=;
 b=FK5Z6LQKcVVL/dV8VQrEB4rqnTascMy9UY7X0KbmLNfixdC8ei2fby9xMQ9pIwfCmc
 Vok7Ka6NWtVypUT5eIoixUL97D3fTxaOMaZgXzCETQBkxQHn1XfJWXkez+ZtmMPGxa1n
 jFVbPqIoXCjnQFO1oSWLIoTAeiNHHB4ImclqIUsqHVIYzgbzwo7K2xA5bIbtauAoe0tk
 Lriz5CnMNcHnQCP3mOgJv7IYtYmuTqD/H6fBzIz7A2nd8033tQDXNvP/xTg8bvlYjTY1
 FyGB5MTSdpbOP+psfqpN4Qsdt1nPGRdOdu1rGoLncr5gAtE88kuftt1zXy67MPas7kP5
 A4bQ==
X-Gm-Message-State: AOAM531gp5oS5W2mmvQvogO5tt/yMHCkSRlpKcE4c/22J3M1H2YtDENw
 Jh4ZLxhBKSwCS0FDmP58Rzg=
X-Google-Smtp-Source: ABdhPJwgg6EZexSvdvXpWUwvbWOLrPrcS8JCeV5BHAXFWiezdJXjxL0kWP6rSVFEBHQhGy66O1fbXw==
X-Received: by 2002:a05:600c:4107:b0:381:1c3:5d3 with SMTP id
 j7-20020a05600c410700b0038101c305d3mr2567355wmi.107.1645793465616; 
 Fri, 25 Feb 2022 04:51:05 -0800 (PST)
Received: from orome ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b001edc107e4f7sm3253983wrq.81.2022.02.25.04.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 04:51:04 -0800 (PST)
Date: Fri, 25 Feb 2022 13:51:02 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/6] dt-bindings: Add HDA support for Tegra234
Message-ID: <YhjQtrueEYNGQrSA@orome>
References: <20220216092240.26464-1-mkumard@nvidia.com>
 <20220216092240.26464-5-mkumard@nvidia.com>
 <YhfdHd2LPc+ifFTS@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VMSq3re6wkdG1hOh"
Content-Disposition: inline
In-Reply-To: <YhfdHd2LPc+ifFTS@robh.at.kernel.org>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, spujar@nvidia.com,
 tiwai@suse.com, jonathanh@nvidia.com, broonie@kernel.org,
 linux-tegra@vger.kernel.org, Mohan Kumar <mkumard@nvidia.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--VMSq3re6wkdG1hOh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2022 at 01:31:41PM -0600, Rob Herring wrote:
> On Wed, Feb 16, 2022 at 02:52:38PM +0530, Mohan Kumar wrote:
> > Add hda clocks, memory ,power and reset binding entries
> > for Tegra234.
> >=20
> > Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
> > ---
> >  include/dt-bindings/clock/tegra234-clock.h     | 4 ++++
> >  include/dt-bindings/memory/tegra234-mc.h       | 6 ++++++
> >  include/dt-bindings/power/tegra234-powergate.h | 9 +++++++++
> >  include/dt-bindings/reset/tegra234-reset.h     | 2 ++
> >  4 files changed, 21 insertions(+)
> >  create mode 100644 include/dt-bindings/power/tegra234-powergate.h
> >=20
> > diff --git a/include/dt-bindings/clock/tegra234-clock.h b/include/dt-bi=
ndings/clock/tegra234-clock.h
> > index 2529e7ec0bf4..2ab651916127 100644
> > --- a/include/dt-bindings/clock/tegra234-clock.h
> > +++ b/include/dt-bindings/clock/tegra234-clock.h
> > @@ -64,4 +64,8 @@
> >  #define TEGRA234_CLK_PLLC4			237U
> >  /** @brief 32K input clock provided by PMIC */
> >  #define TEGRA234_CLK_CLK_32K			289U
> > +/** @brief CLK_RST_CONTROLLER_AZA2XBITCLK_OUT_SWITCH_DIVIDER switch di=
vider output (aza_2xbitclk) */
> > +#define TEGRA234_CLK_AZA_2XBIT			457U
> > +/** @brief aza_2xbitclk / 2 (aza_bitclk) */
> > +#define TEGRA234_CLK_AZA_BIT			458U
> >  #endif
> > diff --git a/include/dt-bindings/memory/tegra234-mc.h b/include/dt-bind=
ings/memory/tegra234-mc.h
> > index 2662f70c15c6..c42fe61fba5e 100644
> > --- a/include/dt-bindings/memory/tegra234-mc.h
> > +++ b/include/dt-bindings/memory/tegra234-mc.h
> > @@ -7,6 +7,8 @@
> >  #define TEGRA234_SID_INVALID		0x00
> >  #define TEGRA234_SID_PASSTHROUGH	0x7f
> > =20
> > +/* NISO0 stream IDs */
> > +#define TEGRA234_SID_HDA		0x03
> > =20
> >  /* NISO1 stream IDs */
> >  #define TEGRA234_SID_SDMMC4	0x02
> > @@ -16,6 +18,10 @@
> >   * memory client IDs
> >   */
> > =20
> > +/* High-definition audio (HDA) read clients */
> > +#define TEGRA234_MEMORY_CLIENT_HDAR 0x15
> > +/* High-definition audio (HDA) write clients */
> > +#define TEGRA234_MEMORY_CLIENT_HDAW 0x35
> >  /* sdmmcd memory read client */
> >  #define TEGRA234_MEMORY_CLIENT_SDMMCRAB 0x63
> >  /* sdmmcd memory write client */
> > diff --git a/include/dt-bindings/power/tegra234-powergate.h b/include/d=
t-bindings/power/tegra234-powergate.h
> > new file mode 100644
> > index 000000000000..3c5575a51296
> > --- /dev/null
> > +++ b/include/dt-bindings/power/tegra234-powergate.h
> > @@ -0,0 +1,9 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
>=20
> Dual license please.

We've got a bunch of similar files in this directory that are not
dual licensed. These files originally are part of the BPMP firmware
tree, so I'll check with the owners if relicensing would be possible.
If so, I think we should be able to relicense all of those header files.

Thierry

--VMSq3re6wkdG1hOh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmIY0LMACgkQ3SOs138+
s6Ez8xAAn+49vmQ+ErSD9Sg2/t6O8Sil+0KTyZF+OSNKNEOKafvj38Sv+zjGH7ZN
OH0666hghTwlDgDBX9L/ZI4fItEVAXr7l/lMjoIiXtZ0CYb0xIXBXqIRvP8R7xOp
TjPWFBe1oTBqALv+GSRE0f4ZPT1OsWtCddlONIwMtzO4SmHjtTKTx6PvCvOL62AC
s+xHeUtfCeh8orT1Qcmr9XK0XGDikxqVi1SFfl7rgUBX2TS+7zmjHVDF5vmSkpw7
lTQ3rZsRTWlyScBolyIhNAP9y6N4/Ix3ASVrEQSPjkRx6S8UgnlCsjN9qjXS0I4W
C7rQgFPPHQVpIEFxdfZBWaP1ReyDUN/5kseJzPVqB+XQ+/cUXsFYsuP8Nnx8+F4m
/GlQwsmtLzanpKOgwyMEN9sgJcWLbXa+9ZtT2lOEr9dDMFbnMq27bZZ319DvTQ6o
Fh9aahMgLu45+gRhGMJsrGRaFqoVYzFPUh6+7bJmSshVIvvp1esNNy9ofZXdBKIW
oPzfNjAd0l4KQ2eDmZdjfZyYjgcnU6gTeSoXIPvjwf3i6Vp3kjcB5eAR6qwcKxDc
8r+dsJaPfBoS0qMWpe2zMPgiHJ5N034/Au6JqDjuv94vY1sVDCRvS1UejJlItHe9
9iTv9lVa4Fa+6r6vj0MnPhLSCk8PpmXqiuGWBMyAc8MyWMbtHyA=
=xQrv
-----END PGP SIGNATURE-----

--VMSq3re6wkdG1hOh--
