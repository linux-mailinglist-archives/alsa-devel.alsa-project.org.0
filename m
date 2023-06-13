Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EF172E302
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 14:29:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3DA886E;
	Tue, 13 Jun 2023 14:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3DA886E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686659392;
	bh=M+YsxAsrMOdQXi3EjTzJQEXiDd2GLlwy4TAIkoE71E8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VICU02Lh9lOTbsVBQqRc8KE4lm34vwGZVEYBShWe83sC4IRBFD+oFzmcCQYTElCPA
	 jNQ2j4pEdZBm/lVCY8dBz9AI32fEl95tauPBKE7iSNPqC1zLJRtxYS1ofQNi6ogpiq
	 FPWTOevC9RXblR+ZQCEiGMax6+XjkVwSbD7Wshjs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C044F8052E; Tue, 13 Jun 2023 14:29:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10516F80132;
	Tue, 13 Jun 2023 14:29:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE00AF80149; Tue, 13 Jun 2023 14:28:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1125DF800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 14:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1125DF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=o7dCoZcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686659333; x=1718195333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M+YsxAsrMOdQXi3EjTzJQEXiDd2GLlwy4TAIkoE71E8=;
  b=o7dCoZccmxXroCNrV9Ig5iDLMiQIeuV/Seh22kvn92VivfyFw5qOq3Il
   P4S55qunHiz/dnTTDJ+Q3EZ4/fuE+Wtl3hf2nsAvMKY8hKYQmpUNgybXN
   xIVKocB77YbhbCkRueUP8Pv4Kba+HnHGeYa8PTier2rNJf1j3RXFZlwAK
   fwll89SW+oKKzV9RiWUo0agWqPZtt74BpXcxosg47oZdnM13fDttkHZYf
   7CUs4aHPH4nUYnthMDfjGGm+iK4yXGill/FuI6SlVuWP4dNMOi930URj9
   FFirimTLHlyvunJyQ5zSTFWZRPj/lN4XolzdAkbY7QcguRUBeSEfV3XAq
   g==;
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400";
   d="asc'?scan'208";a="156745543"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Jun 2023 05:28:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 13 Jun 2023 05:28:38 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 13 Jun 2023 05:28:36 -0700
Date: Tue, 13 Jun 2023 13:28:11 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yingkun Meng <mengyingkun@loongson.cn>
CC: Conor Dooley <conor@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<robh+dt@kernel.org>, <conor+dt@kernel.org>, <broonie@kernel.org>,
	<lgirdwood@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<loongarch@lists.linux.dev>, <loongson-kernel@lists.loongnix.cn>
Subject: Re: [ PATCH v2 3/3] ASoC: dt-bindings: Add support for Loongson
 audio card
Message-ID: <20230613-zoologist-panorama-a87858bba075@wendy>
References: <20230612085614.3039498-1-mengyingkun@loongson.cn>
 <20230612-booted-french-186dd95e78a9@spud>
 <bda7c25f-65cf-d45f-3ac0-f2471e3aacf8@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b/Hqn05Zp1cdyDvp"
Content-Disposition: inline
In-Reply-To: <bda7c25f-65cf-d45f-3ac0-f2471e3aacf8@loongson.cn>
Message-ID-Hash: SATZL72ESPUQWDWSYD4FAEQHDA4YGQJM
X-Message-ID-Hash: SATZL72ESPUQWDWSYD4FAEQHDA4YGQJM
X-MailFrom: Conor.Dooley@microchip.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SATZL72ESPUQWDWSYD4FAEQHDA4YGQJM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--b/Hqn05Zp1cdyDvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 08:23:58PM +0800, Yingkun Meng wrote:
>=20
> On 2023/6/13 01:24, Conor Dooley wrote:
> > Hey!
> >=20
> > On Mon, Jun 12, 2023 at 04:56:14PM +0800, YingKun Meng wrote:
> > > From: Yingkun Meng <mengyingkun@loongson.cn>
> > >=20
> > > The audio card uses loongson I2S controller present in
> > > 7axxx/2kxxx chips to transfer audio data.
> > >=20
> > > On loongson platform, the chip has only one I2S controller.
> > >=20
> > > Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
> > I got 2 copies of this patch, but none of the rest of the series appears
> > to be threaded with it.
> >=20
> > >   .../sound/loongson,ls-audio-card.yaml         | 70 ++++++++++++++++=
+++
> > >   1 file changed, 70 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/sound/loongson=
,ls-audio-card.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/sound/loongson,ls-audi=
o-card.yaml b/Documentation/devicetree/bindings/sound/loongson,ls-audio-car=
d.yaml
> > > new file mode 100644
> > > index 000000000000..61e8babed402
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/loongson,ls-audio-card.=
yaml
> > > @@ -0,0 +1,70 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/sound/loongson,ls-audio-card.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Loongson 7axxx/2kxxx ASoC audio sound card driver
> > > +
> > > +maintainers:
> > > +  - Yingkun Meng <mengyingkun@loongson.cn>
> > > +
> > > +description:
> > > +  The binding describes the sound card present in loongson
> > > +  7axxx/2kxxx platform. The sound card is an ASoC component
> > > +  which uses Loongson I2S controller to transfer the audio data.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: loongson,ls-audio-card
> > Reviewing sound stuff is beyond my pay grade, so forgive me if I am off
> > the rails here, but this (and the "x"s in the description) look a bit
> > odd. Recently, we've noticed quite a few loongson dt-bindings attempting
> > to use a single compatible for many different chips.
> > Usually you have individual compatibles for the various SoCs with this
> > core, which can fall back to a generic one, rather than just adding a
> > generic compatible for all devices.
> > As far as I know, there's several SoCs fitting 2kxxx, and the format
> > being used elsewhere is "loongson,ls2k1000" etc.
>=20
>=20
> Currently, Loongson has 2K0500/2K1000LA/2K1500/2K2000 chips.
>=20
> Here, its' possible to use a single compatible for different chips,
>=20
> as the audio device is a logical device, not dependent on chip model.

What, may I ask, is a "logical device"?

--b/Hqn05Zp1cdyDvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIhg2wAKCRB4tDGHoIJi
0u4VAQCigbmTSbs6qKpLCthlel+v9B2o217oImTKlmwzgWRYqQEArSFE2JivD5nX
5x8XGvhmbqoQ+5dKs74EhWk1XyGz6Qs=
=K/HX
-----END PGP SIGNATURE-----

--b/Hqn05Zp1cdyDvp--
