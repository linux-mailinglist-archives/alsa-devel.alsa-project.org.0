Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4E1998ABE
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2024 17:01:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77BE685D;
	Thu, 10 Oct 2024 17:01:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77BE685D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728572482;
	bh=i6YxAqRcwcz/cNnFjqdAoRcTue8f+Pm/Ozecvt1SfsY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e38UrCPCfz7YoswDOLde94SRyS9SDgo4J0y5MsI4jwrtRHBTLbHoYcoFK0TGLikjw
	 IiB49SBHoVQT7tyZbvgG9cTWFrXxkq44QoHP0SLt4PoQf5XOEoHl2iWQwvHd7wKOxs
	 zLqVOXWDpWlFzs5OxmcHRnNxRFwEDlyYzKAd9BIU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1891F80528; Thu, 10 Oct 2024 17:00:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E22CF80588;
	Thu, 10 Oct 2024 17:00:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9D30F80528; Thu, 10 Oct 2024 17:00:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8566F8001E
	for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2024 17:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8566F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lAovvxty
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50EE260002;
	Thu, 10 Oct 2024 15:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728572440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tVZMs2+4Io1fiOqihAdk9nOoc2Kkn2C23QOtaCcVJvE=;
	b=lAovvxtyuEWjNDrbvDbZ/JCn99xSytxs4tLIBt0YjbjA60De6D5cMKL3z9DwFm1X8yJh52
	3/GPLC74/ITwLmc1RQP3dpsepxs4O6FiBwNMBXvrsYPuhGdwz9Ima68G6UWf0oyMGHz2vK
	ZaRJHNj5liMPV78OG+4kQ1UYUB753o3tk6oJWCskVeOje9cPuHiO+J184qqmLKfWVzHfDA
	9RO1vKW8QN92yBkuyAe5JeTo0bZCcu30XVo76jv6Fv0WYGj80MUcdXa+/3hwSxuru+rDDZ
	uQiOy599+8VADJM0xigLYyGRC1jPpLsKtqk0EZpVW2tDjh18jt2ieYHHe0Tr5g==
Date: Thu, 10 Oct 2024 17:00:36 +0200
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
Message-ID: <20241010165933.09a4114e@xps-13>
In-Reply-To: 
 <IA0PR12MB76990FC67F334C0FEBDFEF36DC782@IA0PR12MB7699.namprd12.prod.outlook.com>
References: 
 <IA0PR12MB7699B360C7CF59E0A3D095F9DC8D2@IA0PR12MB7699.namprd12.prod.outlook.com>
	<20240930110408.6ec43e97@xps-13>
	<IA0PR12MB769930E81D3D66B51CDC8213DC782@IA0PR12MB7699.namprd12.prod.outlook.com>
	<20241010112751.01e5afa1@xps-13>
	<IA0PR12MB76990FC67F334C0FEBDFEF36DC782@IA0PR12MB7699.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
Message-ID-Hash: JMKWLRUN23HRANPWAI7TXANLZAUYIYU4
X-Message-ID-Hash: JMKWLRUN23HRANPWAI7TXANLZAUYIYU4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JMKWLRUN23HRANPWAI7TXANLZAUYIYU4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amit,

amit.kumar-mahapatra@amd.com wrote on Thu, 10 Oct 2024 10:35:06 +0000:

> Hello Miquel,
>=20
> > -----Original Message-----
> > From: Miquel Raynal <miquel.raynal@bootlin.com>
> > Sent: Thursday, October 10, 2024 2:58 PM
> > To: Mahapatra, Amit Kumar <amit.kumar-mahapatra@amd.com>
> > Cc: Tudor Ambarus <tudor.ambarus@linaro.org>; michael@walle.cc;
> > broonie@kernel.org; pratyush@kernel.org; richard@nod.at; vigneshr@ti.co=
m; Rob
> > Herring <robh@kernel.org>; cornor+dt@kernel.org; krzk+dt@kernel.org; li=
nux-
> > spi@vger.kernel.org; linux-kernel@vger.kernel.org; linux-mtd@lists.infr=
adead.org;
> > nicolas.ferre@microchip.com; alexandre.belloni@bootlin.com;
> > claudiu.beznea@tuxon.dev; Simek, Michal <michal.simek@amd.com>; linux-a=
rm-
> > kernel@lists.infradead.org; alsa-devel@alsa-project.org;
> > patches@opensource.cirrus.com; linux-sound@vger.kernel.org; git (AMD-Xi=
linx)
> > <git@amd.com>; amitrkcian2002@gmail.com; Conor Dooley
> > <conor.dooley@microchip.com>; beanhuo@micron.com
> > Subject: Re: Add stacked and parallel memories support in spi-nor
> >=20
> > Hi Amit,
> >=20
> > amit.kumar-mahapatra@amd.com wrote on Thu, 10 Oct 2024 09:17:58 +0000:
> >  =20
> > > Hello Miquel,
> > > =20
> > > > > - The stacked-memories DT bindings will contain the phandles of
> > > > > the flash nodes =20
> > > > connected in stacked mode. =20
> > > > >
> > > > > - The first flash node will contain the mtd partition that would
> > > > > have the cross over memory staring at a memory location in the
> > > > > first flash and ending at some memory location of the 2nd flash =
=20
> > > >
> > > > I don't like that much. Describing partitions past the actual device
> > > > sounds wrong. If you look into [1] there is a suggestion from Rob to
> > > > handle this case using a property that tells us there is a
> > > > continuation, so from a software perspective we can easily make the=
 link, but on =20
> > the hardware description side the information are correct. =20
> > >
> > > I reviewed Rob's suggestions in [1], and I need to examine the MTD
> > > layer to determine how this can be implemented from a software perspe=
ctive.
> > > For reference, here is Rob's suggestion:
> > >
> > > Describe each device and partition separately and add link(s) from one
> > > partition to the next
> > >
> > > flash0 {
> > >   partitions {
> > >     compatible =3D "fixed-partitions";
> > >     concat-partition =3D <&flash1_partitions>;
> > >     ...
> > >   };
> > > };
> > >
> > > flash1 {
> > >   flash1_partition: partitions {
> > >     compatible =3D "fixed-partitions";
> > >     ...
> > >   };
> > > };
> > > =20
> > > >
> > > > If this description is accepted, then fine, you can deprecate the "=
stacked- =20
> > memories" =20
> > > > property. =20
> > >
> > > I believe that in addition to Rob's description, we should also
> > > include the 'stacked-memories' property. This property helps us
> > > identify which flashes are stacked, while Rob's suggestion explains
> > > how the partitions within the stacked flashes are connected.
> > >
> > > For example, if we have three flashes connected to an SPI host, with
> > > flash@0 and flash@1 operating in stacked mode and flash@2 functioning
> > > as a standalone flash, the Device Tree binding might look something l=
ike this:
> > > Please share your thoughts on this.
> > >
> > > spi@0 {
> > >   ...
> > >   flash@0 {
> > >     compatible =3D "jedec,spi-nor"
> > >     reg =3D <0x00>;
> > >     stacked-memories =3D <&flash@0 &flash@1>;
> > >     spi-max-frequency =3D <50000000>;
> > >     ...
> > >         flash0_partition: partitions {
> > >             compatible =3D "fixed-partitions";
> > > 	concat-partition =3D <&flash1_partitions>;
> > >         	partition@0 {
> > >           	    label =3D "Stacked-Flash-1";
> > >                 reg =3D <0x0 0x800000>;
> > > 	}
> > >         }
> > >     }
> > >   flash@1 {
> > >     compatible =3D "jedec,spi-nor"
> > >      reg =3D <0x01>;
> > >     spi-max-frequency =3D <50000000>;
> > >     ...
> > >         flash1_partition: partitions {
> > >             compatible =3D "fixed-partitions";
> > > 	concat-partition =3D <&flash0_partitions>;
> > >         	partition@0 {
> > >           	    label =3D " Stacked-Flash-2";
> > >                 reg =3D <0x0 0x800000>;
> > > 	}
> > >         }
> > >   }
> > >
> > >   flash@2 {
> > >     compatible =3D "jedec,spi-nor"
> > >      reg =3D <0x01>;
> > >     spi-max-frequency =3D <50000000>;
> > >     ...
> > >         partitions {
> > >             compatible =3D "fixed-partitions";
> > > 	concat-partition =3D <&flash0_partitions>;
> > >         	partition@0 {
> > >           	    label =3D "Single-Flash";
> > >                 reg =3D <0x0 0x800000>;
> > > 	}
> > >         }
> > >   } =20
> >=20
> > I'm sorry but this is pretty messed up. The alignments are wrong, I bel=
ieve the labels
> > are wrong, the reg properties as well. Can you please work on this exam=
ple and
> > send an updated version? =20
>=20
> Apologies for that. Here's the updated version along with the explanation.

Thanks for the update.

> spi@0 {
> 	...
>   	flash@0 {
>   		compatible =3D "jedec,spi-nor"
>     		reg =3D <0x00>;
>     		stacked-memories =3D <&flash@0 &flash@1>;

The same property should, IMHO, also be expected...

>     		spi-max-frequency =3D <50000000>;
>     		...
>         		partitions {
>             		compatible =3D "fixed-partitions";
>         			concat-partition =3D <&flash1_partition>; /* Link to the flash=
@1 partition@0 */
>                 		flash0_partition: partition@0 {
>                     			label =3D "part0_0";
>                 			reg =3D <0x0 0x800000>;
>         			}
>         		}
>     	}
>   	flash@1 {
>     		compatible =3D "jedec,spi-nor"
>      		reg =3D <0x01>;

... here.

>     		spi-max-frequency =3D <50000000>;
>     		...
>         		partitions {
>             		compatible =3D "fixed-partitions";
>         			concat-partition =3D <&flash0_partition>; /* Link to the flash=
@0 partition@0 */
>                 		flash1_partition: partition@0 {
>                     			label =3D "part0_1";
>                 			reg =3D <0x0 0x800000>;
>         			}
>         		}
>   	}
>=20
>   	flash@2 {
>     		compatible =3D "jedec,spi-nor"
>      		reg =3D <0x02>;
>     		spi-max-frequency =3D <50000000>;
>     		...
>         		partitions {
>             		compatible =3D "fixed-partitions";      =20
>                 		partition@0 {
>                     			label =3D "part1_0";
>                 			reg =3D <0x0 0x800000>;
>         			}
>         		}
>   	}
> }

Otherwise, okay for me.

Thanks,
Miqu=C3=A8l
