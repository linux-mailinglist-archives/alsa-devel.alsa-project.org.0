Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0976CFD8B
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 09:59:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0496EDE;
	Thu, 30 Mar 2023 09:58:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0496EDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680163170;
	bh=cqFs+AawaZri21Qhl2RiLlvCeDUUkVTKYocul3KAWFw=;
	h=Date:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=SQdivrIlf1TMDSyjVUrZ7MIRmWQXp1fUnCmfSP6Mca/1enmqkUtghd6q3ebele4zk
	 0S3CEEm4G0Ns01qSCXeOWvtOmNh/uFy6Gnksy5TwraAg9PZMEEeaSa9rBMGGHyl3W9
	 /+qrAugDKFoQg+Q2Oc/COjMZxXMrNyIDnY7Y+uJ0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BBC0F80249;
	Thu, 30 Mar 2023 09:58:39 +0200 (CEST)
Date: Thu, 30 Mar 2023 08:58:09 +0100
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<walker.chen@starfivetech.com>
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: add tdm node and sound card
References: <20230329153320.31390-1-walker.chen@starfivetech.com>
 <20230329153320.31390-4-walker.chen@starfivetech.com>
 <d455a90a-7e63-2254-75cb-70cb26ae7483@linaro.org>
In-Reply-To: <d455a90a-7e63-2254-75cb-70cb26ae7483@linaro.org>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IK6BUF2GC5KNTBKQD7IDVCFQISYUF2O6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: <168016311803.26.166234577613341530@mailman-core.alsa-project.org>
From: Conor Dooley via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Conor Dooley <conor.dooley@microchip.com>
Cc: Walker Chen <walker.chen@starfivetech.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A6E5F80272; Thu, 30 Mar 2023 09:58:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8D64F80114
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 09:58:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8D64F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=wYUhcSTe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680163109; x=1711699109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A06o++GEZF1cEl6Qfofe3vUwyO2hA9xPd0Uh8TRXZRI=;
  b=wYUhcSTeiCm2OGjejiGG9dasetIbSZrT3SxbkyuKv+dMlU6t3Q/pnefC
   VY98zEbfe5M6qn+L/VDVsKK7QPiRZdqmyW1K7NvQxckK8YKYvNziU1ypx
   r/ZiWaz/SPBfzWa8xXym7owq4esnCYXsx+gwyIe/7YX65FYajE1NuKk17
   2qb0vEalmfPkqbAjrTeKVhmNhVJMPN7j59aj45NV5Om5Mw9QfPDDG40L2
   yJf3js2yN+b3bAz0GRT5GGEKkI+60SX8SixZ4bS4LwNzgR9SuXpzq3l+m
   QcMojX2kOZF9xM94f9Vti5o34Yg92lxZwd6sGooq9QLlBJL8O1O6iPwXj
   A==;
X-IronPort-AV: E=Sophos;i="5.98,303,1673938800";
   d="asc'?scan'208";a="218651809"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Mar 2023 00:58:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 00:58:25 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 30 Mar 2023 00:58:23 -0700
Date: Thu, 30 Mar 2023 08:58:09 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<walker.chen@starfivetech.com>
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: add tdm node and sound card
Message-ID: <af015701-f1ff-4b1e-9b1b-c635fc684ce6@spud>
References: <20230329153320.31390-1-walker.chen@starfivetech.com>
 <20230329153320.31390-4-walker.chen@starfivetech.com>
 <d455a90a-7e63-2254-75cb-70cb26ae7483@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QNdQWFvvxmlEs8o1"
Content-Disposition: inline
In-Reply-To: <d455a90a-7e63-2254-75cb-70cb26ae7483@linaro.org>
Message-ID-Hash: IK6BUF2GC5KNTBKQD7IDVCFQISYUF2O6
X-Message-ID-Hash: IK6BUF2GC5KNTBKQD7IDVCFQISYUF2O6
X-MailFrom: Conor.Dooley@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Walker Chen <walker.chen@starfivetech.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IK6BUF2GC5KNTBKQD7IDVCFQISYUF2O6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--QNdQWFvvxmlEs8o1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 09:43:10AM +0200, Krzysztof Kozlowski wrote:
> On 29/03/2023 17:33, Walker Chen wrote:
> > Add the tdm controller node and sound card for the StarFive JH7110 SoC.

> > +		compatible =3D "fixed-clock";
> > +		clock-output-names =3D "wm8960_mclk";
> > +		#clock-cells =3D <0>;
> > +	};
> > +
> >  	i2srx_bclk_ext: i2srx-bclk-ext-clock {
> >  		compatible =3D "fixed-clock";
> >  		clock-output-names =3D "i2srx_bclk_ext";
> > @@ -375,6 +381,27 @@
> >  			status =3D "disabled";
> >  		};
> > =20
> > +		tdm: tdm@10090000 {
> > +			compatible =3D "starfive,jh7110-tdm";
> > +			reg =3D <0x0 0x10090000 0x0 0x1000>;
> > +			clocks =3D <&syscrg JH7110_SYSCLK_TDM_AHB>,
> > +				 <&syscrg JH7110_SYSCLK_TDM_APB>,
> > +				 <&syscrg JH7110_SYSCLK_TDM_INTERNAL>,
> > +				 <&syscrg JH7110_SYSCLK_TDM_TDM>,
> > +				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
> > +				 <&tdm_ext>;
> > +			clock-names =3D "tdm_ahb", "tdm_apb",
> > +				      "tdm_internal", "tdm",
> > +				      "mclk_inner", "tdm_ext";
> > +			resets =3D <&syscrg JH7110_SYSRST_TDM_AHB>,
> > +				 <&syscrg JH7110_SYSRST_TDM_APB>,
> > +				 <&syscrg JH7110_SYSRST_TDM_CORE>;
> > +			dmas =3D <&dma 20>, <&dma 21>;
> > +			dma-names =3D "rx","tx";
> > +			#sound-dai-cells =3D <0>;
> > +			status =3D "disabled";
> > +		};
> > +
> >  		stgcrg: clock-controller@10230000 {
> >  			compatible =3D "starfive,jh7110-stgcrg";
> >  			reg =3D <0x0 0x10230000 0x0 0x10000>;
> > @@ -601,5 +628,12 @@
> >  			#reset-cells =3D <1>;
> >  			power-domains =3D <&pwrc JH7110_PD_VOUT>;
> >  		};
> > +
> > +		sound0: snd-card0 {
>=20
> 1. Why card0?
> 2. Where is this node located? In MMIO bus? Run some basic checks on
> your DTS before submitting upstream.
> dtbs_check
> dtbs W=3D1
>=20
> 3. Why this is even in the DTSI? This really looks wrong.

Excuse me for not following here, but Walker, could you point me at
where in the schematic for the VisionFive 2 that this wm8960 actually
is?
I know ~nothing about audio, but good old Google tells me that this is a
dedicated codec chip and I was looking at [1] and could not easily find
it on the schematic.

Thanks,
Conor.

1 https://doc-en.rvspace.org/VisionFive2/PDF/SCH_RV002_V1.2A_20221216.pdf

--QNdQWFvvxmlEs8o1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCVBBAAKCRB4tDGHoIJi
0vwwAP9ZaSwYSns7mnKRth/7zaYJio+DGrk7Decdat0PRkCAKgD/V+oWJQb4k4XP
/cV4orJwQtUvav3dglridCNAmArKkQQ=
=3gLi
-----END PGP SIGNATURE-----

--QNdQWFvvxmlEs8o1--
