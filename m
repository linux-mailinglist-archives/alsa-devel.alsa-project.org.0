Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B597BD29
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 11:29:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14736170D;
	Wed, 31 Jul 2019 11:28:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14736170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564565347;
	bh=u93+0XkJ3JVRt5U/FPa0v5uZDEuYpYvIFwrbK1qiT7w=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YuBRVsqVCZipNI8f7e4z9ZfL11j/2GkGhKBjvKA8b9NXmJ12LkHQoPAI3OHakpKSK
	 pIVvxz5vxJOSZvY3Fv7OI+0DE2BeljjY540kMaIpXSdXBof87rH5QpQBAJx8jLndhy
	 h9KvE8fm3ZzxiSq0kZa3T39OJ/n5t+LoIeKE1kxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FEF8F8053A;
	Wed, 31 Jul 2019 11:25:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF545F804CB; Tue, 30 Jul 2019 19:43:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680095.outbound.protection.outlook.com [40.107.68.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C9CBF80482
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 19:43:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C9CBF80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=wavecomp.com header.i=@wavecomp.com
 header.b="ITnpH7wK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbuxwj7j4adzdv0fmBNfnqhx24c+eYYEuUVqbkE6hJvCDq7LoV0Zl+W7KkbSFqux8s2YY5k3hPZ8az0RxquzZGeLSLGDQJxuwrqd7vqlDlG1pITkCt8ZA9Ge40XEh7mufk3eOYHjYkbL/9iz8I3bYOgN/L0N8q1EWfZ+hINbk73sD5KzjRkGEA/4AUhJ1dYQCgmHst+KYTWNE58UuG9zd0oYsOZ5NkCIxmcBOiCUwucg32N97xnJDGWUteBOHb1hTBCM8HZFuw7xdRJBXyfIKIIezjguUo80dd2uItxrOSodtvseWr5V1al5F+u0Gs6VqW9x9zZV915wT+jKzotBhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BX4SU6PwwnhbvyGfv3M6c92ze2YzMLnLwmrICGdzqg=;
 b=ZKsPTX/Fryl9JUC/Tdq/8FJ6jQRq1/JtwW89+fcrOtJOzaqQ4N/MtX6SfEkvC/TYOfWmvnbra+DB7IQICGr+MqeKaienfS+wPA27REAu8UZ6KKPbYvxAQkkxGFZEl6vrQ8lKOkk5rtb8AGYF1bMekFHXiuy/Fj4wQCm7/Km45RL9FbNpl88aMeQ56YoVu5nMkGSX5Pml/09hBQrTZhZyUII3m3iNv2DPAiogUPBLeHr2p6VqnoffvF5BXzAwYzU5dTVf7Vs9ce/ADifT/BWNlmW8bjd3jNrvnt/QwnyvTLO/iLFISvVsJ8yfvhvsHqHia8csSGM+2ZSg/XQUGBQN3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BX4SU6PwwnhbvyGfv3M6c92ze2YzMLnLwmrICGdzqg=;
 b=ITnpH7wKokCT6qpAxKCxOTrURLPinYmauj6s0majVYCRV1xr4u/A3dahC9UMgosTrPipIG67IgeVu7lsEn1ZlJdBFctnTK5YaTYu57td3R/OxKQDmwWmTzBOLRxuLvSaMlowDf3NroMRD3XZUTgn4jQ17Bmn+BoqMWsx04RATZA=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1088.namprd22.prod.outlook.com (10.174.169.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 17:43:51 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 17:43:51 +0000
From: Paul Burton <paul.burton@mips.com>
To: Paul Cercueil <paul@crapouillou.net>
Thread-Topic: [PATCH 04/11] ASoC: jz4740: Drop lb60 board code
Thread-Index: AQHVRv5Z3HRPuXglA0CFShYL1aERyQ==
Date: Tue, 30 Jul 2019 17:43:51 +0000
Message-ID: <MWHPR2201MB12774249834C09DBDE719902C1DC0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190725220215.460-5-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-5-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0073.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::14) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6250fd5d-84dd-4f26-1f29-08d715157bc2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR2201MB1088; 
x-ms-traffictypediagnostic: MWHPR2201MB1088:
x-microsoft-antispam-prvs: <MWHPR2201MB1088EF45D9223799A65AAB40C1DC0@MWHPR2201MB1088.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(39850400004)(346002)(376002)(396003)(189003)(199004)(7736002)(6436002)(52536014)(386003)(486006)(74316002)(6116002)(446003)(9686003)(11346002)(305945005)(5660300002)(55016002)(99286004)(66446008)(66946007)(53936002)(64756008)(66556008)(66476007)(4326008)(6246003)(25786009)(3846002)(71200400001)(66066001)(71190400001)(7416002)(8676002)(6916009)(76176011)(81156014)(52116002)(54906003)(186003)(44832011)(229853002)(476003)(4744005)(8936002)(81166006)(68736007)(102836004)(7696005)(2906002)(6506007)(256004)(33656002)(316002)(478600001)(42882007)(26005)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1088;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lhq3rr5NngLy/qSzzewAQ7EPGtEV8okVD8OhyyTbH+SjEe+8hGmbbKBx9ItUYQadHktlIVbR10tYRV8nCAQNsecG+lLBr7HGXXNTBemSXc8UC6LOS5Nzsa8uIfhV/IK7kbg+gXy+j1wai8B1gCmriXrYVJqI4hXPdsAYfz/A8FvvuaoTrLX/EQo3zZAkY84UnGbxRJHhKaW9jCKQ0zgwCqJcgOZTiFhRoytI07CSnozo86y8q/gOSLfzmW0M+qsPJ8QbVR5XqVOUxWJ5LoGXoohxTwIjfPzqZbK5ONE/IVf+7buufQ3FHpgfMQTcU2tG2RjErn9QBYz6uX2uBcOa+R9BMo3e4fWnGr6AFdnRrclZ/BGjxuLsBtoG/I24n92NPNjtbi3I+6WcBZUyf2DRbCyINsen1vVdfr1ubN02ADY=
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6250fd5d-84dd-4f26-1f29-08d715157bc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 17:43:51.4012 (UTC)
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
Subject: Re: [alsa-devel] [PATCH 04/11] ASoC: jz4740: Drop lb60 board code
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
> The board now uses the simple-audio-card driver.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>
> Acked-by: Mark Brown <broonie@kernel.org>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
