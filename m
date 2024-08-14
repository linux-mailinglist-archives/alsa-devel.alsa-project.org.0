Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D09C951978
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 12:55:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3295127AB;
	Wed, 14 Aug 2024 12:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3295127AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723632917;
	bh=uNzw9J4WE8npfPuqFzki9uq65FktmGhF48iIhaLpTf4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KmiCYDTQ0mj0MRXyEk3ryY17nREHpBT0lqrNWMWRJRH4cyWz6KG2efo+XwGiYUmam
	 nL8VXV13Rb0YgMO2IJAsgwyt3QFfr9NtA0D2UUcBstY0guVp+7NOVxlKpejizBC+SA
	 +XPZvdtstrlUmK8c7UULOkJJCZ5fuFNub9BN40Z4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2AB7F806A2; Wed, 14 Aug 2024 12:53:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3EA6F806BA;
	Wed, 14 Aug 2024 12:53:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 338A4F80423; Wed, 14 Aug 2024 10:46:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C049DF800B0
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 10:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C049DF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FdsiK+vF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A91E240002;
	Wed, 14 Aug 2024 08:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723625187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ucah7eJHaaeq3ephNaG8kgL8jqU515QWycrDeI4W32U=;
	b=FdsiK+vFzIxzAqPbfc+zcpWwxzSkeu0QWaWCCAjEbz0ECS+4Gop5b9iMy9KvidVfzrT8YS
	R3glCu3H/fqGqqli0J7bcQs1w03PBRnmCapSt56E9eryaNugOsi1PeVvaPMZvrGAhfIkSu
	/t4pALdm08hT/0XNHlcrmjKN0EZBCdXNgFQPpp1Z0aEC9SrkAFKSLnmVn9py1QCfRHIjnT
	2sHSq8VKWfcCkSJJEP/ynJ4bZVshyjwgQhXFQlj4veogBmCtfuNurSeoBV7fWvqLvn4VxT
	XCZP930UGMK7PVedVe/wN8EbyAnhDkfoixyA+y09If7Os0pmm1Gwux56yiPboQ==
Date: Wed, 14 Aug 2024 10:46:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, "broonie@kernel.org"
 <broonie@kernel.org>, "pratyush@kernel.org" <pratyush@kernel.org>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "sbinding@opensource.cirrus.com" <sbinding@opensource.cirrus.com>,
 "lee@kernel.org" <lee@kernel.org>, "james.schulman@cirrus.com"
 <james.schulman@cirrus.com>, "david.rhodes@cirrus.com"
 <david.rhodes@cirrus.com>, "rf@opensource.cirrus.com"
 <rf@opensource.cirrus.com>, "perex@perex.cz" <perex@perex.cz>,
 "tiwai@suse.com" <tiwai@suse.com>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "michael@walle.cc" <michael@walle.cc>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>, "Simek, Michal"
 <michal.simek@amd.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "patches@opensource.cirrus.com"
 <patches@opensource.cirrus.com>, "linux-sound@vger.kernel.org"
 <linux-sound@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>, Conor Dooley
 <conor.dooley@microchip.com>, "beanhuo@micron.com" <beanhuo@micron.com>
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Message-ID: <20240814104623.72eef495@xps-13>
In-Reply-To: 
 <IA0PR12MB769997D5958C191215254983DC872@IA0PR12MB7699.namprd12.prod.outlook.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
	<c3fa1e04-92ed-48ab-a509-98e43abd5cd6@linaro.org>
	<BN7PR12MB2802E87F1A6CD22D904CAEACDC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
	<b3d3c457-a43b-478a-85b3-52558227d139@linaro.org>
	<BN7PR12MB28027E62D66460A374E3CFEADC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
	<e212f9fa-83c5-4b9e-8636-c8c6183096ab@linaro.org>
	<BN7PR12MB280237CDD7BB148479932874DC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
	<576d56ed-d24b-40f9-9ae4-a02c50eea2ab@linaro.org>
	<BN7PR12MB2802F288C6A6B1580CF07959DC95A@BN7PR12MB2802.namprd12.prod.outlook.com>
	<c6f209c8-47da-4881-921d-683464b9ddd5@linaro.org>
	<9cdb7f8b-e64f-46f6-94cb-194a25a42ccd@linaro.org>
	<BN7PR12MB28028B63E69134094D50F3E4DC2A2@BN7PR12MB2802.namprd12.prod.outlook.com>
	<IA0PR12MB769944254171C39FF4171B52DCB42@IA0PR12MB7699.namprd12.prod.outlook.com>
	<20240812103812.72763f69@xps-13>
	<IA0PR12MB769997D5958C191215254983DC872@IA0PR12MB7699.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
Message-ID-Hash: 7KHPRYAF4FVBK7UMTEV4QJKKRAGUDTJQ
X-Message-ID-Hash: 7KHPRYAF4FVBK7UMTEV4QJKKRAGUDTJQ
X-MailFrom: miquel.raynal@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7KHPRYAF4FVBK7UMTEV4QJKKRAGUDTJQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amit,

amit.kumar-mahapatra@amd.com wrote on Wed, 14 Aug 2024 07:13:35 +0000:

> Hello Miquel,
>=20
> > > Based on the inputs/suggestions from Tudor, i am planning to add a new
> > > layer between the SPI-NOR and MTD layers to support stacked and
> > > parallel configurations. This new layer will be part of the spi-nor
> > > and located in mtd/spi-nor/ =20
> >=20
> > For now I don't think you need a totally generic implementation. As lon=
g as
> > there is only one controller supporting these modes, I'd say this is no=
t super
> > relevant. =20
>=20
> IMHO, there should be a general solution since this isn't limited to just=
=20
> one controller. Any controller can support stacked mode with multiple=20
> native-cs or multiple gpio-cs, or with a combination of a native-cs and a=
=20
> gpio-cs.

That's not what was initially discussed. The Xilinx use case was:
a controller is managing two devices "at the same time" transparently
from the host. So the two flashes appear like a single one and thus,
are described like a single one.

You don't need anything in the bindings nor in the core to manage two
flashes connected to the same controller otherwise. The only use case
the Xilinx model was bringing, was to consider the storage bigger from
a host perspective and thus be able to store files across the device
boundary natively.

> For parallel configurations, there are other controllers from=20
> Microchip and some flash devices that operate similarly to AMD's parallel=
=20
> mode.

Yes, Tudor reminded me about these.

> > > This layer would perform the following tasks:
> > >  - During probing, store information from all the connected flashes,
> > >    whether in stacked or parallel mode, and present it as a single de=
vice
> > >    to the MTD layer.
> > >  - Register callbacks through this new layer instead of spi-nor/core.=
c and
> > >    handle MTD device registration.
> > >  - In stacked mode, select the appropriate spi-nor flash based on the
> > >    address provided by the MTD layer during flash operations.
> > >  - Manage flash crossover operations in stacked mode.
> > >  - Ensure both connected flashes are identical in parallel mode.
> > >  - Handle odd byte count requests from the MTD layer during flash
> > >    operations in parallel mode.
> > >
> > > For implementing this the current DT binding need to be updated as
> > > follows. =20
> >=20
> > So you want to go back to step 1 and redefine bindings? Is that worth? =
=20
>=20
> The current bindings are effective if we only support identical=20
> flash devices or flashes of the same make but with different sizes=20
> connected in stacked mode. However, if we want to extend stacked support=
=20
> to include flashes of different makes in stacked mode,

The only actual feature the stacked mode brings is the ability to
consider two devices like one. This is abstracted by hardware, this is
a controller capability. The only way this can work is if the two
storage devices are of the same kind and accept the same commands/init
cycles.

If you consider two different devices, then there is no hardware
abstraction anymore, the controller is no longer "smart" enough and you
are back to the standard situation with two devices connected using
their own independent CS, known by the host. In this case the
"stacked-mode" bindings no longer apply. You need to describe the two
chips independently in the DT, and your stacked feature in the
controller can no longer be used.

You need other bindings to support this case because it is a different
situation. For this case, there was a mtd-concat approach (which was
never merged). But this is really something different than the stacked
mode in your controller because there is no specific hardware feature
involved, it's just pure software.

> the current=20
> bindings may not be adequate. That's why I suggested updating the binding=
s=20
> to accommodate all possible scenario.
>=20
> >  =20
> > > stacked-memories DT changes:
> > >  - Flash size information can be retrieved directly from the flash, s=
o it
> > >    has been removed from the DT binding.
> > >  - Each stacked flash will have its own flash node. This approach all=
ows
> > >    flashes of different makes and sizes to be stacked together, as ea=
ch
> > >    flash will be probed individually. =20
> >=20
> > And how will you define partitions crossing device boundaries? I believ=
e this
> > constraint has been totally forgotten in this proposal. =20
>=20
> According to the new binding proposal, one of the two flash nodes will=20
> have a partition that crosses the device boundary.

=46rom a bindings perspective, it feels very awkward and I doubt it will
be accepted. From a code perspective, you're gonna need to butcher the
core...

> > The whole idea of stacking two devices this way was to simplify the use=
r's life
> > with a single device exposed and the controller handling itself the CS =
changes.
> > That is precisely what the current binding do. =20
>=20
> That's true, but as I mentioned earlier, if we're not inclined to support=
=20
> stacked mode for flashes of different makes, then the current bindings=20
> are sufficient.

Thanks,
Miqu=C3=A8l
