Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2469D378A
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2024 10:53:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 027D71939;
	Wed, 20 Nov 2024 10:53:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 027D71939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732096408;
	bh=0k5XmDP3+QnNrEI2KbUVvvL7QkJFuQCAvDrn688lHe4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dpmIJu5jRZpO3NLsKyHPlsI/V9IakR9K5Zo1F2DtJ6dFkv3sVH6gTWLrU63OfplLa
	 q+p7pq3/OJ1PqJjafvJLSildspt6n62Ye3psi5iOOIJu1SiUL317tz3gyzVrMFXdhX
	 fseySBMiiuKHSA8cWDT72anLVrawYc7CxoInTgvk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB3FAF805B2; Wed, 20 Nov 2024 10:52:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6590EF805AD;
	Wed, 20 Nov 2024 10:52:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59B82F8026D; Wed, 20 Nov 2024 10:52:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1125CF800D2
	for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2024 10:52:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1125CF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UMsqcLqi
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BCCB60005;
	Wed, 20 Nov 2024 09:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732096361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CjSe/U+nzv9GiQYKnA55TJmWIVaBLG17HklLuP9BQuo=;
	b=UMsqcLqizhfjcdodWKdRRxIHV/G24AKIsGNrdAAq4ZT9e/a9MVuhkV/AOZQ0kRe+iAF131
	xWlc7VGm++AIHwxvSi1cFpq8y3AfypDdpXPHg+R8zytnvRnc/lXI4CndJZ+clFyZkMNUkB
	K4rSmJ+GW3cgI/j0F0Ziev7Q82q8O/t9yiUr50dDIellFUW7jQcHAjB3R7E1NepRa1KImD
	zdXTwbQ4eOAIk2e9JAty7V91bo9Bvg3JKqBs7gJs9pV6bIjkqcrbzasIiMFj3N6nPUXPjS
	hwLeJt9Ro2U3gRa7a/vAyOWgyPSCxvuhhqafKFS9d0uH3b3+344AeSnRRue/Ig==
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
Subject: Re: [RFC PATCH 1/2] dt-bindings: mtd: Add bindings for describing
 concatinated MTD devices
In-Reply-To: 
 <IA0PR12MB76994483BBB757BD9F691513DC202@IA0PR12MB7699.namprd12.prod.outlook.com>
	(Amit Kumar Mahapatra's message of "Tue, 19 Nov 2024 17:02:33 +0000")
References: <20241026075347.580858-1-amit.kumar-mahapatra@amd.com>
	<20241026075347.580858-2-amit.kumar-mahapatra@amd.com>
	<87frnoy8na.fsf@bootlin.com>
	<IA0PR12MB76994483BBB757BD9F691513DC202@IA0PR12MB7699.namprd12.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 20 Nov 2024 10:52:38 +0100
Message-ID: <87sermxme1.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
Message-ID-Hash: CPBJ27REAZOEVA7EXIFVAZ5LBECQVVNK
X-Message-ID-Hash: CPBJ27REAZOEVA7EXIFVAZ5LBECQVVNK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CPBJ27REAZOEVA7EXIFVAZ5LBECQVVNK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19/11/2024 at 17:02:33 GMT, "Mahapatra, Amit Kumar" <amit.kumar-mahapatr=
a@amd.com> wrote:

> Hello Miquel,
>=20=20
>> > This approach was suggested by Rob [1] during a discussion on Miquel's
>> > initial approach [2] to extend the MTD-CONCAT driver to support
>> > stacked memories.
>> > Define each flash node separately with its respective partitions, and
>> > add a 'concat-parts' binding to link the partitions of the two flash
>> > nodes that need to be concatenated.
>> >
>> > flash@0 {
>> >         compatible =3D "jedec,spi-nor"
>> >         ...
>> >                 partitions {
>>=20
>> Wrong indentation here and below which makes the example hard to read.
>
> Sorry about that. I am redefining both the flash nodes here with proper=20
> indentation.
>
> flash@0 {
> 	compatible =3D "jedec,spi-nor"
> 	...
> 	partitions {
> 		compatible =3D "fixed-partitions";
> 		concat-partition =3D <&flash0_partition &flash1_partition>;
>=20=09=09
> 		flash0_partition: partition@0 {
> 			label =3D "part0_0";
> 			reg =3D <0x0 0x800000>;
> 		};
> 	};
> };
>
> flash@1 {
> 	compatible =3D "jedec,spi-nor"
> 	...
> 	partitions {
> 		compatible =3D "fixed-partitions";
> 		concat-partition =3D <&flash0_partition &flash1_partition>;
>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> 		flash1_partition: partition@0 {
> 			label =3D "part0_1";
> 			reg =3D <0x0 0x800000>;
> 		};
> 	};
> };
>
>>=20
>> >                 compatible =3D "fixed-partitions";
>> >                         concat-partition =3D <&flash0_partition &flash=
1_partition>;
>> >                         flash0_partition: partition@0 {
>> >                                 label =3D "part0_0";
>> >                                 reg =3D <0x0 0x800000>;
>> >                         }
>> >                 }
>> > }
>> > flash@1 {
>> >         compatible =3D "jedec,spi-nor"
>> >         ...
>> >                 partitions {
>> >                 compatible =3D "fixed-partitions";
>> >                         concat-partition =3D <&flash0_partition &flash=
1_partition>;
>> >                         flash1_partition: partition@0 {
>> >                                 label =3D "part0_1";
>> >                                 reg =3D <0x0 0x800000>;
>> >                         }
>> >                 }
>> > }
>>=20
>> This approach has a limitation I didn't think about before: you cannot u=
se anything
>> else than fixed partitions as partition parser.
>
> Yes, that's correct=E2=80=94it won't function when partitions are defined=
 via the=20
> command line. In my opinion, we should start by adding support for fixed=
=20
> partitions, add comments in code stating the same. If needed, we can late=
r=20
> extend the support to dynamic partitions as well.

New thought. What if it was a pure fixed-partition capability? That's
actually what we want: defining fixed partitions through device
boundaries. It automatically removes the need for further dynamic
partition extensions.

Thanks,
Miqu=C3=A8l
