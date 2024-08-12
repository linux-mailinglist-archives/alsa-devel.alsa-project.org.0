Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E8294E8C4
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2024 10:41:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C34A81923;
	Mon, 12 Aug 2024 10:41:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C34A81923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723452088;
	bh=DmoRqVAVIIzX9czb1SfLwMPylTd8uefceb4XEeX2UBw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E5W+b8xQZZsmVxN0NFg9kPdlzRXkP0m2Rau0oDqTeAT0D0vBdaF4GtAlDdQcmtkOR
	 9bovCBY4p/VwQ4i3T1imOgWy7uy5udw0a+PWADHup1BCakZlu9jjokPev5VC7r6tBT
	 kEgj9EzzEOfi66TfwuE6Uw2unRUeAgLxWre3i2Ho=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B6A3F80589; Mon, 12 Aug 2024 10:40:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8DC4F805B0;
	Mon, 12 Aug 2024 10:40:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90020F8049C; Mon, 12 Aug 2024 10:40:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BFF36F805B3
	for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2024 10:40:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFF36F805B3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ne2p68+A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F827FF80F;
	Mon, 12 Aug 2024 08:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723452001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jHAG+jr6VS671kkd3H78pc9Iro9nLTf+bq+1ySK8OnU=;
	b=Ne2p68+A/GgfP/80JnUELAHEfVOaVX9dUSegNx2U92Hm4Z+Z1tahbt/l3m/yDi/8Rg3yrX
	VPhiQlymu6tf5Dd62mTznTv+B41O9S6hXO3soybZzLuPwJ4avLyz0uieM4UcQ/O+XsXBDW
	29n/W0lXXeEP6UOG4OOrY/EoJ/lavU6/A3xZj/SvNZlHe2kGmzkKt7WvUu9C0vZwWi7mZJ
	SsBl6rAFh+4ke/YlSof6m/uMVG705rrGJidSAzD8lHx3VZJYI/1DsO/1Tel3tjlnVtyEtB
	cPR6vqhZKGqWUlu+ynuxR3hEd5mx9dPoGK7cwHxuIr8iqMJGW/9C1nblAWRxZw==
Date: Mon, 12 Aug 2024 10:39:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <michael@walle.cc>
Cc: "Michal Simek" <michal.simek@amd.com>, "Mahapatra, Amit Kumar"
 <amit.kumar-mahapatra@amd.com>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "pratyush@kernel.org"
 <pratyush@kernel.org>, "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com"
 <vigneshr@ti.com>, "sbinding@opensource.cirrus.com"
 <sbinding@opensource.cirrus.com>, "lee@kernel.org" <lee@kernel.org>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "patches@opensource.cirrus.com"
 <patches@opensource.cirrus.com>, "linux-sound@vger.kernel.org"
 <linux-sound@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>, "Conor Dooley"
 <conor.dooley@microchip.com>, "beanhuo@micron.com" <beanhuo@micron.com>
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Message-ID: <20240812103957.04a1ef55@xps-13>
In-Reply-To: <D3DREP874QG7.2UOSZSBI3BRQY@walle.cc>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
	<BN7PR12MB28027E62D66460A374E3CFEADC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
	<e212f9fa-83c5-4b9e-8636-c8c6183096ab@linaro.org>
	<BN7PR12MB280237CDD7BB148479932874DC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
	<576d56ed-d24b-40f9-9ae4-a02c50eea2ab@linaro.org>
	<BN7PR12MB2802F288C6A6B1580CF07959DC95A@BN7PR12MB2802.namprd12.prod.outlook.com>
	<c6f209c8-47da-4881-921d-683464b9ddd5@linaro.org>
	<9cdb7f8b-e64f-46f6-94cb-194a25a42ccd@linaro.org>
	<BN7PR12MB28028B63E69134094D50F3E4DC2A2@BN7PR12MB2802.namprd12.prod.outlook.com>
	<IA0PR12MB769944254171C39FF4171B52DCB42@IA0PR12MB7699.namprd12.prod.outlook.com>
	<D2ZHJ765LUGP.2KTA46P1BL75X@walle.cc>
	<e1587f61-f765-4a22-b06e-71387cc49c4d@amd.com>
	<D33M26RLVLHF.3Q5YARPBNSBOY@walle.cc>
	<9fb60743-3e89-49fa-a399-3cf2607a7e41@amd.com>
	<D33S9T73M6ND.G7CCJ4PDVYQU@walle.cc>
	<20240812092937.2bd5c85a@xps-13>
	<D3DREP874QG7.2UOSZSBI3BRQY@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
Message-ID-Hash: FIEIXENYDD5KOHB3LTT3LJE3HK32JJSZ
X-Message-ID-Hash: FIEIXENYDD5KOHB3LTT3LJE3HK32JJSZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FIEIXENYDD5KOHB3LTT3LJE3HK32JJSZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Michael,

michael@walle.cc wrote on Mon, 12 Aug 2024 09:37:06 +0200:

> Hi,
>=20
> > > > > The first round of patches were really invasive regarding the core
> > > > > code. So if there is a clean layering approach which can be enabl=
ed
> > > > > as a module and you are maintaining it I'm fine with that (even if
> > > > > the core code needs some changes then like hooks or so, not sure)=
.   =20
> > > >
> > > > That discussion started with Miquel some years ago when he was tryi=
ng to to=20
> > > > solve description in DT which is merged for a while in the kernel. =
  =20
> > >=20
> > > What's your point here? From what I can tell the DT binding is wrong
> > > and needs to be reworked anyway. =20
> >
> > I'm sorry I'm now catching up, can you point at the thread explaining
> > what is wrong in the bindings? I didn't find where this was detailed. Or
> > otherwise summarize quickly what needs to change? =20
>=20
> Somewhere in this mega thread Tudor had some remarks about the
> bindings. Amit also mentioned it here:
>=20
> https://lore.kernel.org/r/IA0PR12MB769944254171C39FF4171B52DCB42@IA0PR12M=
B7699.namprd12.prod.outlook.com/

Great. I jumped-in there. Thanks!

Miqu=C3=A8l
