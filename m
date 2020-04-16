Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D14A1AB6C6
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 06:26:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACB4C1663;
	Thu, 16 Apr 2020 06:25:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACB4C1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587011176;
	bh=XCXFf7V0z+YjDywyTqVBWear9rBpBCsolcpi9KWtsEI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kU06vZtzP0PpHOGVbwBOqMeyqiRGWfegNhtEkuXpcTY244xaeRPx6E4YY6mKbfn/H
	 zI4D5HFSFfwDXF9ngrGhCKaGGazEBHXjG1HuM9Af3dxpytGGJV2tOMhMhDpQmJWOzh
	 0QAMfv5bXC0NpPjgRMDiNeUxV7RaZ2tbhsu0nu0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCABFF8016F;
	Thu, 16 Apr 2020 06:24:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 266EDF8014E; Thu, 16 Apr 2020 06:24:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn2049.outbound.protection.outlook.com [40.92.23.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E590F8012E
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 06:24:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E590F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="e+UPaA1Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RC9+GXYjPIg3F+/hrVyuSIVANSJyFk/I2FeibcDviiJSBAnPAPnRgvl8foqAknf6K/ACCANZvKu7D21V8B89k1Z/bLsEt2B+jTXxm8njvtRL0yF/seI5JuysbXwi06AEDE2Mp60l5y0H9TaLmU3X8RSh+IaH4/OourHmMy85vnMqYThLcd16nAZP2addJ7o2QsM4rQ5tehGHRj3dBBJPZMbZQby7HEriAHCGM6uNWvn6Y27uj8kJa63inh0nPkw4s5N+K3pzGgGs/0a6pLbWUixGE8J46OKg87HhAyT3KIlTJeWaEf8boHs7JGVSfX+O1zVYw16QzLhRdvexhskP2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkSNNCCYJx2E2pVIiiQgwOMzMhyKKJPaanFKpeKW6iI=;
 b=VlvFqpZHqb+vq7y5583aRWbcLgizo6tV1p1EQJYN/sEpZGSOpdZEy/Q8x0DDHfGsAEd0i79U3HtKOBKu0zwz9kEUANqHkm654EBhQXPilcR9NpQ7h8Yx25c7n5yvHEtK1tnKWvGqvx/dHC/mFgXodFbioh3EDQxsgSPQjJJnbeXrZjAILwUz7LrYlPo526VXRNqGMY+KpLTlCkUQjfvXbF3Uu4mSEeVgboSMiy0NvO9zNX8Xs2NYrA8o6UZACqfxYuRl8E7YYmLpIgm7jLdGWoKf2OYRid3SGtqyI9RDVFCFEjwJujb5CpN8QPj6sQHi2+pUjxsy0dgRmECJfF3vCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkSNNCCYJx2E2pVIiiQgwOMzMhyKKJPaanFKpeKW6iI=;
 b=e+UPaA1ZQEljhexf47jtXdaXGitDLNzRgIrHJfaZEsrsVZEtVZn4CeXZEQwZ+FOD1SHSdRFZC1/JTbh339uS3QEpe09U2xptSImKqkbGByWANPWug81QsDf39gYF5Erb8KwASxXHAESuH3AKLcQ3IGe0cyRLblDZ8x5z3Jg0IcYifvInFx/MB+t8rNDfEL7DJoj4dbdI7YIS2N0wUm6m6fEJzSMSx3+PFCSC1FLaxt0K+KdcrLq3rIU/SgZQzirXThfhhZKODUShITMrWrFAmErtUEgSonQQx3k1Orx242AGy+CVG0dQSsFkML2cDosOZFGzGqFPlipuheNZtoyn6g==
Received: from DM6NAM12FT064.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc64::50) by
 DM6NAM12HT168.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc64::131)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.12; Thu, 16 Apr
 2020 04:24:18 +0000
Received: from BL0PR01MB4802.prod.exchangelabs.com (2a01:111:e400:fc64::44) by
 DM6NAM12FT064.mail.protection.outlook.com (2a01:111:e400:fc64::114)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.12 via Frontend
 Transport; Thu, 16 Apr 2020 04:24:18 +0000
Received: from BL0PR01MB4802.prod.exchangelabs.com
 ([fe80::a183:5ea9:1771:8226]) by BL0PR01MB4802.prod.exchangelabs.com
 ([fe80::a183:5ea9:1771:8226%5]) with mapi id 15.20.2900.028; Thu, 16 Apr 2020
 04:24:18 +0000
From: Alexey Shinkin <alexshinkin@hotmail.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: wm8960  codec driver question
Thread-Topic: wm8960  codec driver question
Thread-Index: AQHWE6TcbAUos7XiQ0yvW6Go4aEqqg==
Date: Thu, 16 Apr 2020 04:24:18 +0000
Message-ID: <BL0PR01MB4802ECF9650E33DCAA7FEFEDAFD80@BL0PR01MB4802.prod.exchangelabs.com>
Accept-Language: en-AU, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:26EE81E41A164437EF69DB60840FEBA8F2F3F6EAD147DF8B817FD8FA1AF13112;
 UpperCasedChecksum:D0BBE4C3AB1052CD86B4C1C04D05159607CEC927CED3BC3359779C88C0D2C478;
 SizeAsReceived:6807; Count:42
x-tmn: [gq68qEETEXeB+Y7TVnBiSC0YFfK46afCEGouGkOkJoECd+U0bFSQiGOe6oAExvq2]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 0a4203a6-e3e0-48cc-36c1-08d7e1be0796
x-ms-traffictypediagnostic: DM6NAM12HT168:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8dAYvKJmKGj+6lQg0eT0FFbypvTfrJ/SVTSAEU3GOZzQCS2+MTzX1DmkxE1hksNPIvCjGGczwNkc1ZF3X5joDDvK07NIyTC7Wc0llk4dXGaaQH55gQxaXNVmSa/bDyCRR3dsBkBUkiYrlZ3EqKi8S5+e+jMcNUVNYeZrF0Als8qi1YLrYS3Ugyai+qddATU5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR01MB4802.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: a0YMcbjft04WIwzelhV4AIKgmj8p51NFybG0QHHmJttuTu2EvkMT1k9rNzGxQwxpb32PHFAIB6p8siRndEuN4ONNG6LVBNtp4EjE6Lm9c20AKDwrSmTYSolc/QVLv39mT/c6RkmkWhpHe7KW0i7PpoJKK/ePzxPIVSTF0c9xFHJTv2fnqTeMcFGFDqK9wYAyN/V2SLiAZN6uTYficX4ibw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4203a6-e3e0-48cc-36c1-08d7e1be0796
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2020 04:24:18.2745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM12HT168
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,=0A=
=0A=
I hope this is the right place to ask .=0A=
=0A=
In the driver ( soc/codecs/wm8960.c )=A0 there is a function that sets pll =
-=A0 the wm8960_set_pll() , line 1185 .=0A=
On exit , the function turns on the pll clocking like this :=A0=0A=
=0A=
	/* Turn it on */=0A=
	snd_soc_component_update_bits(component, WM8960_POWER2, 0x1, 0x1);=0A=
	msleep(250);=0A=
	snd_soc_component_update_bits(component, WM8960_CLOCK1, 0x1, 0x1);=0A=
=0A=
=0A=
What is the reason  for the 250 ms delay ?  I did not find anything related=
 in the chip datasheet . =0A=
=0A=
I found the delay very annoying in my app that generates an audible feedbac=
k to touchscreen events.  Looks like it is safe to comment out the msleep()=
 call  , could there be any implications ?   =0A=
=0A=
 =0A=
Best regards,=0A=
Alex Shinkin=
