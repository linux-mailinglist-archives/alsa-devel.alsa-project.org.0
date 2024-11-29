Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 107789D37BC
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2024 10:58:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55BA4192E;
	Wed, 20 Nov 2024 10:58:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55BA4192E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732096729;
	bh=K8zBgnmsPULEghjWE7qyt+SNHsWqFYpGiv4K6uGA2Fc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n0MWn+wkRkTGERfmxr/Pq+2lkVIcbYgrZmwB5SoBEpwn+x/+scnxY9aEOCD588kpl
	 /MeU/0DMsy/QckyqJKH5ma71Ok54jpXTo7UTKJohVI/HJRP2rUm5jj/QwTNfg99b/2
	 lMxozk/g7jJobgNHHxS8r3XU/R72VL0i+75+t4MA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B879F805BF; Wed, 20 Nov 2024 10:58:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8BADF805AA;
	Wed, 20 Nov 2024 10:58:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEAB9F8026D; Wed, 20 Nov 2024 10:58:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDAA9F800BA
	for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2024 10:58:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDAA9F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YcKYT+X/
Received: by mail.gandi.net (Postfix) with ESMTPSA id 888561C0002;
	Wed, 20 Nov 2024 09:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732096687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BJBQhOJJKyJIub486+xY+tIqICKMJsQpiwZBKO1U4e0=;
	b=YcKYT+X/kbeYr3xub2kdu7gZpNiUBE1WFtfL/o3SWpxY9P8YR+407tw5COM81yOdPrP6K2
	2ZoMCniU3Qy9u2MJM8Ob7NpPPDhkgZgemPcI80cDgnlO/mORHAm+4UiQwMkOIlY5zlJoh0
	yK4BxEiqBGdzXECuq9OfzL1Bnl5DvppHJU7GWXt6OEJmDUtS/fxkoKBYQn5SaVV7DZ0B2d
	3olI/snl8pzs4+vdP4ehSjTuBkFb6TIqKTWQSVvC5NERf8tS/NWGRhSPJJkUvDbAAr3woO
	JOgupd7SKHZVJGnlvu8k6LqtZgnN/4KRQU8kfcQw2paLjzSnMvwu9UrohouTfg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Cc: "tudor.ambarus@linaro.org" <tudor.ambarus@linaro.org>,
  "michael@walle.cc" <michael@walle.cc>,  "broonie@kernel.org"
 <broonie@kernel.org>,  "pratyush@kernel.org" <pratyush@kernel.org>,
  "richard@nod.at" <richard@nod.at>,  "vigneshr@ti.com" <vigneshr@ti.com>,
  "robh@kernel.org" <robh@kernel.org>,  "conor+dt@kernel.org"
 <conor+dt@kernel.org>,  "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
  "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com>,
  "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
  "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
  "claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>,  "Simek, Michal"
 <michal.simek@amd.com>,  "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,  "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>,  "patches@opensource.cirrus.com"
 <patches@opensource.cirrus.com>,  "git (AMD-Xilinx)" <git@amd.com>,
  "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>,
  "beanhuo@micron.com" <beanhuo@micron.com>
Subject: Re: [RFC PATCH 2/2] dt-bindings: spi: Update stacked and parallel
 bindings
In-Reply-To: 
 <IA0PR12MB769947EEA7AB4D9DFF0B2510DC202@IA0PR12MB7699.namprd12.prod.outlook.com>
	(Amit Kumar Mahapatra's message of "Tue, 19 Nov 2024 17:02:45 +0000")
References: <20241026075347.580858-1-amit.kumar-mahapatra@amd.com>
	<20241026075347.580858-3-amit.kumar-mahapatra@amd.com>
	<87y11gwtij.fsf@bootlin.com>
	<IA0PR12MB769947EEA7AB4D9DFF0B2510DC202@IA0PR12MB7699.namprd12.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 20 Nov 2024 10:58:05 +0100
Message-ID: <87bjyaxm4y.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
Message-ID-Hash: 5JYI5DMNTJBKW2GCZB2UOZ26A24FOZDH
X-Message-ID-Hash: 5JYI5DMNTJBKW2GCZB2UOZ26A24FOZDH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JYI5DMNTJBKW2GCZB2UOZ26A24FOZDH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19/11/2024 at 17:02:45 GMT, "Mahapatra, Amit Kumar" <amit.kumar-mahapatr=
a@amd.com> wrote:

> Hello Miquel,
>
>> >         flash@1 {
>> >                 compatible =3D "jedec,spi-nor"
>> >                 reg =3D <0x01>;
>> >                 stacked-memories =3D <&flash@0 &flash@1>;
>> >                 spi-max-frequency =3D <50000000>;
>> >                 ...
>> >                         partitions {
>>=20
>> Same comment as before here.
>
> Sorry again=20
>
> spi@0 {
> 	...
> 	flash@0 {
> 		compatible =3D "jedec,spi-nor"
> 		reg =3D <0x00>;
> 		stacked-memories =3D <&flash@0 &flash@1>;
> 		spi-max-frequency =3D <50000000>;
> 		...
> 		partitions {
> 			compatible =3D "fixed-partitions";
> 			concat-partition =3D <&flash0_part0 &flash1_part0>;
>=20=09=09=09
> 			flash0_part0: partition@0 {
> 				label =3D "part0_0";
> 				reg =3D <0x0 0x800000>;
> 			};
> 		};
> 	};
> 	flash@1 {
> 		compatible =3D "jedec,spi-nor"
> 		reg =3D <0x01>;
> 		stacked-memories =3D <&flash@0 &flash@1>;
> 		spi-max-frequency =3D <50000000>;
> 		...
> 		partitions {
> 			compatible =3D "fixed-partitions";
> 			concat-partition =3D <&flash0_part0 &flash1_part0>;
>=20=09=09=09
> 			flash1_part0: partition@0 {
> 				label =3D "part0_1";
> 				reg =3D <0x0 0x800000>;
> 			};
> 		};
> 	};
> };
>
>>=20
>> >                         compatible =3D "fixed-partitions";
>> >                                 concat-partition =3D <&flash0_partitio=
n &flash1_partition>;
>> >                                 flash1_partition: partition@0 {
>> >                                         label =3D "part0_1";
>> >                                         reg =3D <0x0 0x800000>;
>> >                                 }
>> >                         }
>> >         }
>> >
>> > }
>> >
>> > parallel-memories binding changes:
>> > - Remove the size information from the bindings and change the type to
>> >   boolen.
>> > - Each flash connected in parallel mode should be identical and will h=
ave
>> >   one flash node for both the flash devices.
>> > - The =E2=80=9Creg=E2=80=9D prop will contain the physical CS number f=
or both the connected
>> >   flashes.
>> >
>> > The new layer will double the mtd-> size and register it with the mtd
>> > layer.
>>=20
>> Not so sure about that, you'll need a new mtd device to capture the whol=
e device.
>> But this is implementation related, not relevant for binding.
>>=20
>> >
>> > spi@1 {
>> >         ...
>> >         flash@3 {
>> >                 compatible =3D "jedec,spi-nor"
>> >                 reg =3D <0x00 0x01>;
>> >                 paralle-memories ;
>>=20
>> Please fix the typos and the spacing (same above).
>>=20
>> >                 spi-max-frequency =3D <50000000>;
>> >                 ...
>> >                         partitions {
>> >                         compatible =3D "fixed-partitions";
>> >                                 flash0_partition: partition@0 {
>> >                                         label =3D "part0_0";
>> >                                         reg =3D <0x0 0x800000>;
>> >                                 }
>> >                         }
>> >         }
>> > }
>> >
>> > Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
>> > ---
>> >  .../bindings/spi/spi-controller.yaml          | 23 +++++++++++++++++--
>> >  .../bindings/spi/spi-peripheral-props.yaml    |  9 +++-----
>> >  2 files changed, 24 insertions(+), 8 deletions(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml
>> > b/Documentation/devicetree/bindings/spi/spi-controller.yaml
>> > index 093150c0cb87..2d300f98dd72 100644
>> > --- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
>> > +++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
>> > @@ -185,7 +185,26 @@ examples:
>> >          flash@2 {
>> >              compatible =3D "jedec,spi-nor";
>> >              spi-max-frequency =3D <50000000>;
>> > -            reg =3D <2>, <3>;
>> > -            stacked-memories =3D /bits/ 64 <0x10000000 0x10000000>;
>> > +            reg =3D <2>;
>> > +            stacked-memories =3D <&flash0 &flash1>;
>> >          };
>>=20
>> I'm sorry but this is not what you've talked about in this series.
>> Either you have flash0 and flash1 and use the stacked-memories property =
in both of
>> them (which is what you described) or you create a third virtual device =
which points
>> to two other flashes. This example allows for an easier use of the parti=
tions
>
> If I understand your point correctly, you're suggesting that we should=20
> avoid using stacked-memories and concat-partition properties together and=
=20
> instead choose one approach. Between the two, I believe concat-partition=
=20
> would be the better option.

That's not exactly it, look at the reg properties above, they do not
match the flash devices. Your example above invalid but it is not clear
whether this is another typo or voluntary.

> While looking into your mtdconcat patch [1], I noticed that it creates a=
=20
> virtual MTD device that points to partitions on two different flash nodes=
,=20
> which aligns perfectly with our requirements.
>
> However, there are two key concerns that, if addressed, could make this=20
> patch suitable for the stacked mode:
>
> 1/ The creation of a virtual device that does not have a physical=20
> existence.

We do already have:
- the master mtd device (disabled by default for historical reasons, but
  can be enabled with a Kconfig option).
- an mtd device per partition

I don't see a problem in creating virtual mtd devices in the kernel.

> 2/ The creation of individual MTD devices that are concatenated to form=20
> the virtual MTD device, which may not be needed by the user.

You can also get rid of them by default (or perhaps do the opposite and
let a Kconfig option for that).

> Regarding the first point, I currently cannot think of a better generic=20
> way to support the stacked feature than creating a virtual device.
> Please let me know you thoughts on this.
>
> For the second point, one possible solution is to hide the individual MTD=
=20
> devices (that form the concatenated virtual MTD device) from the user onc=
e=20
> the virtual device is created. Please let us know if you have any other=20
> suggestions to address this issue.

That is what is done with the master device by default.

> [1] https://lore.kernel.org/linux-mtd/20191127105522.31445-5-miquel.rayna=
l@bootlin.com/=20

Thanks,
Miqu=C3=A8l
