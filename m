Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C247998225
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2024 11:28:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4ADF84C;
	Thu, 10 Oct 2024 11:28:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4ADF84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728552511;
	bh=Qc/AzkQlI2nXPdkpvLykvsnuBMgjz/SDo6Yy82JMdn4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nB4jmuaNQDpgt+m4qYm5+Yr5osbVoPkuIpd2jNIX9mXt0EKs9KJkimien4D6BW28V
	 L6Uw8qdhDKCtvfgCRkeCNFg9QZIu5gI/WdEDyrH1vSC8rGHxOyGDH/3+KsFQBmMYFp
	 +t9yGnN0qPKO+aFYa7qrYDOWJhL5mM/ETjCz/T2g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87867F805AE; Thu, 10 Oct 2024 11:28:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5831F805B0;
	Thu, 10 Oct 2024 11:28:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38EC0F80528; Thu, 10 Oct 2024 11:27:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7132DF8001E
	for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2024 11:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7132DF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HYHexWZb
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8E0C240009;
	Thu, 10 Oct 2024 09:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728552473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SIpvFyTZgLUu94xOGDEGcr970RAQUxKWuf6ktquG0pA=;
	b=HYHexWZbzisi+7I32KvQ/3MgFxTE0vqgO/bvfPgFfvjFRZ5OL9sONbUEfexGaj3nIYFNBg
	rFZUaS9+M6En3zav/tnEjpEGrVtrUchLMaFKubrwz/WPA5PkH2uATnZ/FxbUUIIlOa9i79
	LftYlIOBb1T/NFh5hwpmp7x5qIojm8Qgq4Z8BE9AXAPsz6/N6EONB62+aL71r4rZPTGC05
	TbrVH8EBsOkG8a8EwJ/WP7/2wT5erFKgJoylTC6JKbG3f2l7lguUKdnT57IhBnrziOxfBW
	oyZsmZ5SKpI9QmYRMdUhHMS9zuORceU+OxkeXy4uL2O+2ozkIJp+R2VbWKooGA==
Date: Thu, 10 Oct 2024 11:27:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, "michael@walle.cc"
 <michael@walle.cc>, "broonie@kernel.org" <broonie@kernel.org>,
 "pratyush@kernel.org" <pratyush@kernel.org>, "richard@nod.at"
 <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>, Rob Herring
 <robh@kernel.org>, "cornor+dt@kernel.org" <cornor+dt@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "nicolas.ferre@microchip.com"
 <nicolas.ferre@microchip.com>, "alexandre.belloni@bootlin.com"
 <alexandre.belloni@bootlin.com>, "claudiu.beznea@tuxon.dev"
 <claudiu.beznea@tuxon.dev>, "Simek, Michal" <michal.simek@amd.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "patches@opensource.cirrus.com"
 <patches@opensource.cirrus.com>, "linux-sound@vger.kernel.org"
 <linux-sound@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>, Conor Dooley
 <conor.dooley@microchip.com>, "beanhuo@micron.com" <beanhuo@micron.com>
Subject: Re: Add stacked and parallel memories support in spi-nor
Message-ID: <20241010112751.01e5afa1@xps-13>
In-Reply-To: 
 <IA0PR12MB769930E81D3D66B51CDC8213DC782@IA0PR12MB7699.namprd12.prod.outlook.com>
References: 
 <IA0PR12MB7699B360C7CF59E0A3D095F9DC8D2@IA0PR12MB7699.namprd12.prod.outlook.com>
	<20240930110408.6ec43e97@xps-13>
	<IA0PR12MB769930E81D3D66B51CDC8213DC782@IA0PR12MB7699.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
Message-ID-Hash: 25YEM36HM4TRMCI75MWDZXZK2IKMAJK6
X-Message-ID-Hash: 25YEM36HM4TRMCI75MWDZXZK2IKMAJK6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/25YEM36HM4TRMCI75MWDZXZK2IKMAJK6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amit,

amit.kumar-mahapatra@amd.com wrote on Thu, 10 Oct 2024 09:17:58 +0000:

> Hello Miquel,
>=20
> > > - The stacked-memories DT bindings will contain the phandles of the f=
lash nodes =20
> > connected in stacked mode. =20
> > >
> > > - The first flash node will contain the mtd partition that would have
> > > the cross over memory staring at a memory location in the first flash
> > > and ending at some memory location of the 2nd flash =20
> >=20
> > I don't like that much. Describing partitions past the actual device so=
unds wrong. If
> > you look into [1] there is a suggestion from Rob to handle this case us=
ing a property
> > that tells us there is a continuation, so from a software perspective w=
e can easily
> > make the link, but on the hardware description side the information are=
 correct. =20
>=20
> I reviewed Rob's suggestions in [1], and I need to examine the MTD layer=
=20
> to determine how this can be implemented from a software perspective.=20
> For reference, here is Rob's suggestion:
>=20
> Describe each device and partition separately and add link(s) from one=20
> partition to the next=20
>=20
> flash0 {
>   partitions {
>     compatible =3D "fixed-partitions";
>     concat-partition =3D <&flash1_partitions>;
>     ...
>   };
> };
>=20
> flash1 {
>   flash1_partition: partitions {
>     compatible =3D "fixed-partitions";
>     ...
>   };
> };
>=20
> >=20
> > If this description is accepted, then fine, you can deprecate the "stac=
ked-memories"
> > property. =20
>=20
> I believe that in addition to Rob's description, we should also include=20
> the 'stacked-memories' property. This property helps us identify which=20
> flashes are stacked, while Rob's suggestion explains how the partitions=20
> within the stacked flashes are connected.
>=20
> For example, if we have three flashes connected to an SPI host, with=20
> flash@0 and flash@1 operating in stacked mode and flash@2 functioning as =
a=20
> standalone flash, the Device Tree binding might look something like this:=
=20
> Please share your thoughts on this.
>=20
> spi@0 {
>   ...
>   flash@0 {
>     compatible =3D "jedec,spi-nor"
>     reg =3D <0x00>;
>     stacked-memories =3D <&flash@0 &flash@1>;
>     spi-max-frequency =3D <50000000>;
>     ...
>         flash0_partition: partitions {
>             compatible =3D "fixed-partitions";
> 	concat-partition =3D <&flash1_partitions>;=09
>         	partition@0 {
>           	    label =3D "Stacked-Flash-1";
>                 reg =3D <0x0 0x800000>;
> 	}
>         }
>     }
>   flash@1 {
>     compatible =3D "jedec,spi-nor"
>      reg =3D <0x01>;
>     spi-max-frequency =3D <50000000>;
>     ...
>         flash1_partition: partitions {
>             compatible =3D "fixed-partitions";
> 	concat-partition =3D <&flash0_partitions>;=09
>         	partition@0 {
>           	    label =3D " Stacked-Flash-2";
>                 reg =3D <0x0 0x800000>;
> 	}
>         }
>   }
>=20
>   flash@2 {
>     compatible =3D "jedec,spi-nor"
>      reg =3D <0x01>;
>     spi-max-frequency =3D <50000000>;
>     ...
>         partitions {
>             compatible =3D "fixed-partitions";
> 	concat-partition =3D <&flash0_partitions>;=09
>         	partition@0 {
>           	    label =3D "Single-Flash";
>                 reg =3D <0x0 0x800000>;
> 	}
>         }
>   }

I'm sorry but this is pretty messed up. The alignments are wrong, I
believe the labels are wrong, the reg properties as well. Can you
please work on this example and send an updated version?

Thanks,
Miqu=C3=A8l
