Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA31B9431C1
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 16:12:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33B182BAE;
	Wed, 31 Jul 2024 16:11:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33B182BAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722435107;
	bh=g0FCq4nnchDFfxh51t3tr65YF79O4pzb8rTXeXDOps0=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O1Il0VKsfnk4gvB/h1q9o/fRpfrtY6Uch5fNat0vktw9cOOVYdmAAs4o5nz+W809t
	 duVNyozSotON3tE8Y5Btn3HfB3hQzNHeBUB+2JxjXhWSDWH5SyNUKlRiTpIj3Mp4s1
	 ynaS98C1fOaXY2mZJ5NoNYMhOiz0W24DeGtnzMF0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21CA0F80579; Wed, 31 Jul 2024 16:11:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 770F2F805B1;
	Wed, 31 Jul 2024 16:11:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A271DF802DB; Wed, 31 Jul 2024 16:11:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MIME_HEADER_CTYPE_ONLY,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82902F800C9
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 16:11:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82902F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2022082101 header.b=RheJVGsL
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id E4BD2505D;
	Wed, 31 Jul 2024 16:11:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101;
	t=1722435067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=g0FCq4nnchDFfxh51t3tr65YF79O4pzb8rTXeXDOps0=;
	b=RheJVGsLyDe1VaZaZGyLz41KRqG0eQbpu4lcvjRkmhqYsQxVpnY6SHspc+AJsru6X0q+4H
	bFookNN2M2VflPjpAAD+KOxP9DSJKXFp+N5ii2OEzP5Mgf0JxBAhKMVXa+A/z9hdaMiFVU
	fIYwA/Yrhh0W5AFk+8q9MlwIDS81LaZkUIvk2pT5xihTXbtf6qz8ClP1SJsvpKShFVOdsd
	d9SijFRnSMSkdjPpL9ejDJsPMgkEgPbHP2qO4t795kQoPdBkT7deSy2NsBu4gEQc2GD+eq
	+UD6qx97Lzo8BKfKecddrJISdAvVIB3G0WsxUA5xQY7a7wjGLRtxXewwju3sqQ==
Content-Type: multipart/signed;
 boundary=96d5968b07d14bbafb7edd54105440eb618b58c0255484c32a5e40a9f01c;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 31 Jul 2024 16:11:05 +0200
Message-Id: <D33S9T73M6ND.G7CCJ4PDVYQU@walle.cc>
To: "Michal Simek" <michal.simek@amd.com>, "Mahapatra, Amit Kumar"
 <amit.kumar-mahapatra@amd.com>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "pratyush@kernel.org"
 <pratyush@kernel.org>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "sbinding@opensource.cirrus.com"
 <sbinding@opensource.cirrus.com>, "lee@kernel.org" <lee@kernel.org>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
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
From: "Michael Walle" <michael@walle.cc>
X-Mailer: aerc 0.16.0
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
 <D2ZHJ765LUGP.2KTA46P1BL75X@walle.cc>
 <e1587f61-f765-4a22-b06e-71387cc49c4d@amd.com>
 <D33M26RLVLHF.3Q5YARPBNSBOY@walle.cc>
 <9fb60743-3e89-49fa-a399-3cf2607a7e41@amd.com>
In-Reply-To: <9fb60743-3e89-49fa-a399-3cf2607a7e41@amd.com>
Message-ID-Hash: EIEA4X5SNNMMQOD75IJUCSZ4NWEL4MSR
X-Message-ID-Hash: EIEA4X5SNNMMQOD75IJUCSZ4NWEL4MSR
X-MailFrom: michael@walle.cc
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EIEA4X5SNNMMQOD75IJUCSZ4NWEL4MSR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--96d5968b07d14bbafb7edd54105440eb618b58c0255484c32a5e40a9f01c
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> > All I'm saying is that you shouldn't put burden on us (the SPI NOR
> > maintainers) for what seems to me at least as a niche. Thus I was
> > asking for performance numbers and users. Convince me that I'm
> > wrong and that is worth our time.
>
> No. It is not really just feature of our evaluation boards. Customers are=
 using=20
> it. I was talking to one guy from field and he confirms me that these=20
> configurations are used by his multiple customers in real products.

Which begs the question, do we really have to support every feature
in the core (I'd like to hear Tudors and Pratyush opinion here).
Honestly, this just looks like a concatenation of two QSPI
controllers. Why didn't you just use a normal octal controller which
is a protocol also backed by the JEDEC standard. Is it any faster?
Do you get more capacity? Does anyone really use large SPI-NOR
flashes? If so, why? I mean you've put that controller on your SoC,
you must have some convincing arguments why a customer should use
it.

> > The first round of patches were really invasive regarding the core
> > code. So if there is a clean layering approach which can be enabled
> > as a module and you are maintaining it I'm fine with that (even if
> > the core code needs some changes then like hooks or so, not sure).
>
> That discussion started with Miquel some years ago when he was trying to =
to=20
> solve description in DT which is merged for a while in the kernel.

What's your point here? From what I can tell the DT binding is wrong
and needs to be reworked anyway.

> And Amit is trying to figure it out which way to go.
> I don't want to predict where that code should be going or how it should =
look=20
> like because don't have spi-nor experience. But I hope we finally move fo=
rward=20
> on this topic to see the path how to upstream support for it.

You still didn't answer my initial question. Will AMD support and
maintain that code? I was pushing you towards putting that code into
your own driver because then that's up to you what you are doing
there.

So how do we move forward? I'd like to see as little as core changes
possible to get your dual flash setup working. I'm fine with having a
layer in spi-nor/ (not sure that's how it will work with mtdcat
which looks like it's similar as your stacked flash) as long as it
can be a module (selected by the driver).

-michael

--96d5968b07d14bbafb7edd54105440eb618b58c0255484c32a5e40a9f01c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZqpF+REcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+L4FAYD66zueUFU1636OvgoGDTll3VhlpfWvCNks
ygBkg8btX0/kDdus+Zs1Lz63qoncGBIBfjSOIExt4q/UijTQMIfXmQjnzxUHEsUH
/aUgW/mzMqFLKqdncy63f8sPZX5ZY3vmAA==
=2i8/
-----END PGP SIGNATURE-----

--96d5968b07d14bbafb7edd54105440eb618b58c0255484c32a5e40a9f01c--
