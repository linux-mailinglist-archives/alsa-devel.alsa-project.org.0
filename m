Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E587BD69
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 11:40:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF5CF16FD;
	Wed, 31 Jul 2019 11:39:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF5CF16FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564566023;
	bh=xwG5QpCM4iJlTovcOIw8+/rxi7m0tYTzCRQxym84fyU=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pTRfeWaPqoJcvhQ76gBIdAcxEutrlMJEmLthLtn21pWOWuOFpEzOIQUOeXUBcmG0V
	 LLtxYt5s7q22nFhHYyj0vi1cFC3Z1/QqNbviox6SJ7KJkozBzvu0uI2l/YxEH/q8/w
	 zGbmk0cOFDr9LCx09zFd5qh/jyeKXKpSfa+cCPx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7575DF8048F;
	Wed, 31 Jul 2019 11:38:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89EEAF804CA; Tue, 30 Jul 2019 19:44:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on0717.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::717])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E71D2F800BF
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 19:44:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E71D2F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=wavecomp.com header.i=@wavecomp.com
 header.b="qhEQJY1l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1+kkZjZL3XExNekGJglFZU2SfWUrzVVZCIaFGHHIrpHz/vuzqQQyn90xyU4JaDkW7tct7xbwELvnq1637t0tzuEQH48i6WAGCTsngjaDyKBA9jMDrYET8+ducgn26/bseo6BC//bDmg8ELhrCe7zfpR4AaTY1W8jX5wLuCn6uAeiELMEAryF5NAHpIAxJn8RBTaI5duRVxg9NwljdHGDFJCbWMgbfr5pIf69JixoBRuq8pjfEZeBQ3FJc4WdHVCpZvD1eE3HN1cBg4Dd3HyblZwVyr0tbB+c2TWY68AO/m5mx/irTDkySFvQtEM+DrrhLYlBv7cPDir2NUA2FQ4EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SG+mgJGml+VLKAIGTjphO5Z0KAYO/Qs0X5QNpvriwvI=;
 b=PW+c7GD9/648W5Epk7EfzgmpjTr53M6gSImrXKV7O2YsnLruO2occ0ZI5/LnnnEZjcAFDDtnZae5RTip5aaGUJNgPdew/z5Dwa5endNdeDpJjJGcQtC2ShFjGA58Jp37M8hTWH73/7z4COamUiTbe6U1hvbo4RZtcCuPburUPzuSixmKo51G2O1L7PqZn0RPiwdnEk8CB9lZMSWvu0ZgmPYtkhz88CHiVQN1yajNu7OayUE7FDPv/oLTKORkcVrcpcVh9ntII9Pc0N8nrjpbMwiYwfqL+djYFzLMR/ftKBMvett0pMxwXLQL2GbB8cCdaVftRWlUbzqy2yxY+XeU2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SG+mgJGml+VLKAIGTjphO5Z0KAYO/Qs0X5QNpvriwvI=;
 b=qhEQJY1lSlez3T7mcAVDK3p27GBrL4fLfsXRKY4/AcuqUFA4kzctiL99ETC9E1KfwTvpo95CE2qLvRHly+ZKKvViD7uEikkiohmoY5oxfnG4qmEJIP60kxraaUGsBwbax8qxQ0hsyWfnfheljYsOEhzmtEsUzqOYOEGj6pehrZU=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1023.namprd22.prod.outlook.com (10.174.167.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 17:44:17 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 17:44:17 +0000
From: Paul Burton <paul.burton@mips.com>
To: Paul Cercueil <paul@crapouillou.net>
Thread-Topic: [PATCH 11/11] MIPS: jz4740: Drop dead code
Thread-Index: AQHVRv5prUMgGonT8UmT7v+ptlQ2uA==
Date: Tue, 30 Jul 2019 17:44:17 +0000
Message-ID: <MWHPR2201MB1277B22F5752232A50F9DF8DC1DC0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190725220215.460-12-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-12-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR13CA0036.namprd13.prod.outlook.com
 (2603:10b6:a03:180::49) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d19d8d58-31f1-49bf-c0b8-08d715158b5a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR2201MB1023; 
x-ms-traffictypediagnostic: MWHPR2201MB1023:
x-microsoft-antispam-prvs: <MWHPR2201MB10237A12B4BC9DD36D749F00C1DC0@MWHPR2201MB1023.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(136003)(376002)(39850400004)(396003)(189003)(199004)(6116002)(53936002)(66556008)(52536014)(8936002)(74316002)(71190400001)(6246003)(76176011)(71200400001)(446003)(81156014)(81166006)(476003)(64756008)(6436002)(14454004)(66946007)(66446008)(26005)(33656002)(256004)(7736002)(305945005)(52116002)(186003)(386003)(7696005)(55016002)(6506007)(486006)(66476007)(99286004)(102836004)(2906002)(229853002)(44832011)(11346002)(66066001)(7416002)(316002)(5660300002)(9686003)(4744005)(6916009)(8676002)(478600001)(42882007)(68736007)(25786009)(54906003)(4326008)(3846002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1023;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CfE/YTEaiPc2vw5PCYZ7HIZ6xGjGjl8CCpXtF95Q975bD9E1o4gATxtLXzKx3a13ylRszvkGrcKwXqXVJo2cGWgA6hs3oP+CSHCouISXmx4FcqKzWq9MeD2QbiJgWUca+XVhs83dWl+hZYXyXyoUzH2sJQf3AvJpM3rPn04aaBJpTAWxvU2ZFLwX9fQKN19kdpJdnSBi9aKBQLE6+6emPsA2kKfJNm9Jv3gaNx5c7zWOQtW4G6C8PG6mMy43oM2K8o3VfTC6NCekkzJd1kXJmOxoFK1l2MCoXDbFDG9s2t8Q0prGSeiiOep4tYAgE23vcCU4aXbynqO/sIln5RSb6t7743rWNseNVrXkUCRTNk3ZkQ9R0wmsQb0PfrdkUcTL2QGkb1AAtzDwAMSEvXta/TKbm+7i0iya5AtNrbZVMJ0=
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d19d8d58-31f1-49bf-c0b8-08d715158b5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 17:44:17.5553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1023
X-Mailman-Approved-At: Wed, 31 Jul 2019 11:19:41 +0200
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
Subject: Re: [alsa-devel] [PATCH 11/11] MIPS: jz4740: Drop dead code
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
> Remove all the source files that are not used anywhere anymore.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
