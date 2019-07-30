Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4637BD35
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 11:32:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFDCF1711;
	Wed, 31 Jul 2019 11:31:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFDCF1711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564565534;
	bh=L/E7/oUm4Mrx/hb+uY7TZTbtFj+XmmxM630POeeYhZs=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P5qspcKG5HrvcrDNgOx07mtXpYuQcYx2pOKrV54+/XMy5PbsMgoPgVpzvblGW9uQq
	 iOBDbXnifB3qTX1oT3qmVAwBjUTX22/GfJHMbJHmGG5zTrnHHHU2bQZa92nMi5/Fee
	 TSnZeLqV5RsIe756hJhmMRhGnWKKQ3SZUmXoxQm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1987F805FC;
	Wed, 31 Jul 2019 11:27:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDC7FF80482; Tue, 30 Jul 2019 19:44:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam04on071b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4e::71b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E580AF800BF
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 19:44:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E580AF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=wavecomp.com header.i=@wavecomp.com
 header.b="OCTR7Kd8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOfQxlovo1hBnVbQAluJHM/Ho8mIKjzsBvE3H2vHSzXOLBivuEpzq93nkXCjBBEr8lwcKbyRIWOJ8H9KqsCdUYKU6trN4kB4wqGBx17UJ8HSMw1rg/qZ31fHgIdeavhnlOtuwELERPjztaiejdbAS/VKwOV4qtcf3ODGImUhZ48Lw7RLz1S50J1zo7OqxEij6I2L4dWT3Acrm79GKD80TNg0jyiYCP+CQxvbFS4GUeVKh5UexTRJIbn3bEg0i3t02TGBQx/cxS3LMabFaqoUHon7m2jyB7oUYZhzL3fiKbOpWtatgrPpg4j90pQjLExDHW56Pa7fcG89C38+WdqhDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/9kVOmtYsGf1tTebWAncnxaLOdzGNqeJFHrw8PAIig=;
 b=g20+BqRmKn5m+ydnJTid0pTU805ioMp6O9BU2a9/SIkz5mgivPZ7XZSAb3stkgQYpJRTOH/lQnYetMJFtN1xP9CrT/IC0ZU+7LFUVrBm/cAwBIRX1m89dDBFMb+qwKSTGMe0OPv0tImLjGbqmwsWY/wh0OjM4w0A8C683SNUcL55RW14F0cxE/H8p/xKx5sX46ej7iKsP9hmusu5Cbjt0qzJPp89DHxLpjJkQ0V3dYN+mAqimp1TeluvyEN1hc0HPyt2GbPKpI6HVC8/aHdqRpsOCl2kkqwWVZ4RS+v42kBmPLUiwOn/rdLqG5PQknWCop9ohtubK+ylKSpaKXzwgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/9kVOmtYsGf1tTebWAncnxaLOdzGNqeJFHrw8PAIig=;
 b=OCTR7Kd84+HbbSIii4NGmnU/DuaNDCtFnBgpagDHOEFFs+2QmAsQ9RXCsazWdSm0ynANV23aBd5rZXYzzDAAu2EEL5xFCWnqcvnR6VSUFuK2yVcZAGE/JfcJ3aAv9iA/DnvZ77rRrMBD2iqHbFTnN0+lLWOplPS17gH2eg831lo=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1088.namprd22.prod.outlook.com (10.174.169.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 17:44:00 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 17:44:00 +0000
From: Paul Burton <paul.burton@mips.com>
To: Paul Cercueil <paul@crapouillou.net>
Thread-Topic: [PATCH 06/11] dma: Drop JZ4740 driver
Thread-Index: AQHVRv5ekaH2UYAaWEud9Ij5KlCMtA==
Date: Tue, 30 Jul 2019 17:44:00 +0000
Message-ID: <MWHPR2201MB127716344973CCF7640D0B16C1DC0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190725220215.460-7-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-7-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:74::28) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f996696b-f650-4660-463e-08d7151580da
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR2201MB1088; 
x-ms-traffictypediagnostic: MWHPR2201MB1088:
x-microsoft-antispam-prvs: <MWHPR2201MB1088AD4203E51034AED8E8C1C1DC0@MWHPR2201MB1088.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(39850400004)(346002)(376002)(396003)(189003)(199004)(7736002)(6436002)(52536014)(386003)(486006)(74316002)(6116002)(446003)(9686003)(11346002)(305945005)(5660300002)(55016002)(99286004)(66446008)(66946007)(53936002)(64756008)(66556008)(66476007)(4326008)(6246003)(25786009)(3846002)(71200400001)(66066001)(71190400001)(7416002)(8676002)(6916009)(76176011)(81156014)(52116002)(54906003)(186003)(44832011)(229853002)(476003)(4744005)(8936002)(81166006)(68736007)(102836004)(7696005)(2906002)(6506007)(256004)(33656002)(316002)(478600001)(42882007)(26005)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1088;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tf5EMwgYP0T534u0xmhTITDu93gIRV/ChAJaMZx4jg2khl5SV+KJsHt2FW+ixU8t3B4rGzzzvAT/Vj7jGh/R6P0ACIazIZXz476u45whx89Avs0FnPHt5ODkDJ6tyTLI/Z/HdXXV5NFBiOKEBQZTacGAcNSJ5N2hYEQCCZ/9mSQlr8HeYEOLFYhqsAaZ2y1dj+Jl3KRNj6VMMEEH+UPVq/Dyo3eON7Z+30XPAYbrsDik+lVd1jQKPMzKh/XXJc1YaSpQAzCEFSuiKCMixRRYA8+YZHe6aP1Rwkh33O+JJz+kjdSsbN7AyiEMH4r5K9Jq5l3WCaVZ8LOZ1/fZV5iJa66qFZ9RM4uiLIxhHQrS4G2RuE6Sx7b9M9hR2uwXcu7MNZqQPJGj9gNZoWJpdrcH/NDwIK+5XosA6obzAnmKM2Y=
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f996696b-f650-4660-463e-08d7151580da
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 17:44:00.0382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1088
X-Mailman-Approved-At: Wed, 31 Jul 2019 11:19:40 +0200
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Burton <pburton@wavecomp.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, James Hogan <jhogan@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sebastian Reichel <sre@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 "od@zcrc.me" <od@zcrc.me>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH 06/11] dma: Drop JZ4740 driver
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello,

Paul Cercueil wrote:
> The newer and better JZ4780 driver is now used to provide DMA
> functionality on the JZ4740.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>
> Acked-by: Vinod Koul <vkoul@kernel.org>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
