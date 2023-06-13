Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD1B72E5C1
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 16:31:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79598E7E;
	Tue, 13 Jun 2023 16:30:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79598E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686666674;
	bh=uE8h88szvoGxwdIx+6c5cOD/htbOXhAFq/tdRywRONE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Pn0tVIy7Yg09x/5vjqtjfpBJb1cIX0bY7xTOmnQNa8dYFkD+yjW/n2Os/e7rxPIJp
	 gAtQrUCuPBwLb7q6+w4zGTGavB5k/5Ogkm9TPRQQf82eWc6qni7Of0F7RjtoFMpgcS
	 dxPK8rIkoc/4QUzCCbYynR1BbvC03SAoHqTpIv84=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B77F6F80246; Tue, 13 Jun 2023 16:30:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 362BFF80132;
	Tue, 13 Jun 2023 16:30:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5023EF80149; Tue, 13 Jun 2023 16:30:18 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BA3D0F80093
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 16:30:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA3D0F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=Fl47F2M3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686666612; x=1718202612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uE8h88szvoGxwdIx+6c5cOD/htbOXhAFq/tdRywRONE=;
  b=Fl47F2M3vnF6WjS94NRdnEZb0dizUenLU1bwwHiursj+OPZX3CwNgBqU
   NNIlikRtJvlmdxPdF43zv+W0zu3rvPU0go6DHVEUm3u/J8qMx8ui7/44p
   I5frm0b/Zh+FnqCKIY+xZ504tfZcBANSDLFf0csX/2jjyzONDoMSIsOql
   aTHH14yaAHpri3XzH1lXimsZk7kcsTdhULitrSowWKAo0SU/RxE5eOu11
   BSEy+P5nzJ8FTLNlRYQZUwpdoCTtaqJFYd0cbPCUbtu4lk07GaXhXba7o
   YU0q0GMMUu6NIfFtUGezHEamfCQUy9QyD4orNK+K4XRtCuGFazTCLoq8S
   A==;
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400";
   d="asc'?scan'208";a="215841586"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Jun 2023 07:30:05 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 13 Jun 2023 07:30:01 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 13 Jun 2023 07:29:59 -0700
Date: Tue, 13 Jun 2023 15:29:33 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Mark Brown <broonie@kernel.org>
CC: Yingkun Meng <mengyingkun@loongson.cn>, Conor Dooley <conor@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
	<conor+dt@kernel.org>, <lgirdwood@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<loongarch@lists.linux.dev>, <loongson-kernel@lists.loongnix.cn>
Subject: Re: [ PATCH v2 3/3] ASoC: dt-bindings: Add support for Loongson
 audio card
Message-ID: <20230613-crewmate-levitate-597ab96ea2d7@wendy>
References: <20230612085614.3039498-1-mengyingkun@loongson.cn>
 <20230612-booted-french-186dd95e78a9@spud>
 <bda7c25f-65cf-d45f-3ac0-f2471e3aacf8@loongson.cn>
 <20230613-zoologist-panorama-a87858bba075@wendy>
 <887f9cc4-6457-9d14-8aef-011ff4c9aeda@loongson.cn>
 <20230613-depletion-garnet-ccc2009111c3@wendy>
 <449d07d9-5538-4f36-83a0-3a81a9ab9ea2@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="F73UMBvZBx0/ykU7"
Content-Disposition: inline
In-Reply-To: <449d07d9-5538-4f36-83a0-3a81a9ab9ea2@sirena.org.uk>
Message-ID-Hash: GEFCWO2CUQA3LVU2ZC7H6A64J4Y2M72M
X-Message-ID-Hash: GEFCWO2CUQA3LVU2ZC7H6A64J4Y2M72M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GEFCWO2CUQA3LVU2ZC7H6A64J4Y2M72M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--F73UMBvZBx0/ykU7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 02:54:36PM +0100, Mark Brown wrote:
> On Tue, Jun 13, 2023 at 01:46:41PM +0100, Conor Dooley wrote:
>=20
> > So it is entirely a software construct? Why does it need a dt-binding
> > then? Your commit message says the controller is present on the device!
>=20
> A typical embedded (or power efficient laptop) audio design will consist
> of multiple devices connected together (frequently via non-control
> buses) together with system level passive components and plastics which
> are also important to the audio configuration.  A card binding describes
> the interconections between the devices in the system and provides
> identification information for the audio subsystem.  This system level
> audio integration is a physical thing that can be pointed at that
> requires real software control.

The bit you were responding to with that was a disingenuous question.
Probably not fair of me to ask one of a non-native speaker like that,
when all I wanted to know was whether it was appropriate not to add
a more specific compatible, or whether this was something invariant.

> Like I said before please look at the existing audio card bindings.

Yah, ofc I did that to see if there were other similar bindings that
used specific compatibles...


--F73UMBvZBx0/ykU7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIh9TQAKCRB4tDGHoIJi
0im6AQCKC+utNKucFVTzatpu/JT9toHFnwcH/P19lIwDWM2GMwD+LgeihZ5UpRNH
1O78Io5ySAoSy/xH4fujDTp98LU1SQI=
=AuWz
-----END PGP SIGNATURE-----

--F73UMBvZBx0/ykU7--
