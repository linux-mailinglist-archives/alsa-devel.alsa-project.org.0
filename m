Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6D97BD1D
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 11:27:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 034B91710;
	Wed, 31 Jul 2019 11:27:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 034B91710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564565270;
	bh=kvzxj4Wnwqo8YpH2DapMZ3hsjIaLrdlZdWodf0N7eTc=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=luhYkbJYzxIu9Jrdsn+ULHw9RdXGlKT2xYVGggBMEpQqQ0bIobh6aM6yr6JMBHGaz
	 oG0lZrdIJVW9q4hawQLF8aiJCGzht8e7x6xuakjFXazNunVCGQP6sBhj3KdkifR/qv
	 v3Edjx1DXYiK3SJDabPF6xHzfzm5rxZL6Ip45XlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C83CF80508;
	Wed, 31 Jul 2019 11:25:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA38FF804CA; Tue, 30 Jul 2019 19:43:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760125.outbound.protection.outlook.com [40.107.76.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 108E3F804CA
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 19:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 108E3F804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=wavecomp.com header.i=@wavecomp.com
 header.b="nryBVCHQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiJ3XDObEosBmJb9GrW1LTY/kB81GehET/A5e3Ih2LZcyu8kLq2KnBNy/vWUx5g7sMai3FH7vQas+H/+Ml+N1GX8c+KPbfCpRyAZAfmzbLlYVbkJBzQTw0c2GQDktrvarSueRHLBQYTl5vUWe6ECIJWksVGtonv1dJFMUW7SCL8ME5UVT2wiXS21tu28GKe9IxHZJbSsqyQMLZACMLQoYbkrYfYnvTwJsnU7jiUhlRqp7UYEBenDKd+wYKsvkCMokrMe9pdEbj9jy4YMZVSuzUkC7YCDL35lcb7+PDWe1o0QMXqoyedllWTkXAsc1Ky1dsuFdVH+TeS/XClhuOzx4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+zjCxUAQD9m680Ix4UeeuF7K/eR3x6uU6kM5wHy3lI=;
 b=at0kFB58m1/LehSfq0sZLLtbb3QZkY/nASnykmK/3JzR5o32XcRbIYZxtdoWYdywNC8rKzUuB20F94iR6iTXJ9CLcii9J9b8WEb1OZnEUePp68TpLhId84zOq0vSV9Jqvjy7q0HbF1RBcWTIvnG160LbOV+TVTCD4z2euLuZ1eP60Zz7TlvGTot70w61SZrddtg2nrGs+xLYXyh4DodryjFd5X6IovnuCP09Ai3XRVRzZGyuOzHRtH0kf1syTIdrZt4F0sHiess8DnXJStquIulbF9EbpJ16AVfGW/D3Fdv9P/IxqGaIZg0XEzGjAPGoworLrM1ty17reRbOUiNgew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+zjCxUAQD9m680Ix4UeeuF7K/eR3x6uU6kM5wHy3lI=;
 b=nryBVCHQq310G+h3Mm8EjUngRt9l8qzTbYezSaauD2OcL9v0HMKjNxjPgNEynY9G8f7aiQW/Qjj9L11tCTn0Ye/W7HIAwAumHOfZYUpT9Fy9uExVHSQqILVdEL0Ahw8ufSBH9v9kCniV2fbYSVeGfYUL3zQ8menSAAYtyOmr0oQ=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1199.namprd22.prod.outlook.com (10.174.169.162) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Tue, 30 Jul 2019 17:43:43 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 17:43:43 +0000
From: Paul Burton <paul.burton@mips.com>
To: Paul Cercueil <paul@crapouillou.net>
Thread-Topic: [PATCH 02/11] MIPS: qi_lb60: Migrate to devicetree
Thread-Index: AQHVRv5UMJ/SoHC9Gk60MsTZ5BIvEQ==
Date: Tue, 30 Jul 2019 17:43:43 +0000
Message-ID: <MWHPR2201MB127750BFB9E4A64236710A6FC1DC0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190725220215.460-3-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-3-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0100.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::41) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07b5ec6c-4cbb-46ea-8805-08d7151576da
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR2201MB1199; 
x-ms-traffictypediagnostic: MWHPR2201MB1199:
x-microsoft-antispam-prvs: <MWHPR2201MB1199D436144EE4374D04D8B5C1DC0@MWHPR2201MB1199.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39850400004)(376002)(346002)(136003)(396003)(366004)(199004)(189003)(52314003)(76176011)(54906003)(4326008)(8936002)(68736007)(14454004)(81156014)(66066001)(99286004)(6916009)(81166006)(7416002)(52116002)(7696005)(71200400001)(71190400001)(316002)(8676002)(256004)(7736002)(2906002)(186003)(6246003)(305945005)(42882007)(478600001)(64756008)(66476007)(66556008)(66446008)(6436002)(6506007)(386003)(66946007)(53936002)(26005)(102836004)(6116002)(74316002)(25786009)(3846002)(55016002)(229853002)(52536014)(476003)(44832011)(33656002)(9686003)(486006)(5660300002)(11346002)(446003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1199;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: T3g95IsMIEfxoGLC7iAz1B8kCaJZYtFUkYfld7Nn/4xmUWXPAOm3juEELq+kCPUU2X1dQ+Ue+UmfwJ7U7TDNUEG0Gf1pd+okWlpmJKmDzi8YwD7ssQbBW+F/LBuK5E1C37nNcwG6NiCNgFZucLdQYK3aYll3FT2pMNjgA1XM+ippcwcEQvwJ2x8bidRlHdOrJQWFxXMwBpP17weB1vu8dcQQGNZxz5CuWLvbUgkRehE7tZcpgXINHCR6/k7B7U+3RYLPNe00SijQqz8z4kfu6ANF3mzgnr0clctESS+aY1dHEj9VcLFMT+zhHVjy7T4QpjZBo99w5EBgs/S+U3/W4iWoPYLEGJff7bdDQu6Kq2juPOewF6QVK5O/XMRMumbcb0Gz16uBSEi4XwHt5zbacm7fB4QuOMZkRwvcKpbnAL0=
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b5ec6c-4cbb-46ea-8805-08d7151576da
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 17:43:43.2717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1199
X-Mailman-Approved-At: Wed, 31 Jul 2019 11:19:39 +0200
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
Subject: Re: [alsa-devel] [PATCH 02/11] MIPS: qi_lb60: Migrate to devicetree
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
> Move all the platform data to devicetree.
> 
> The only bit dropped is the PWM beeper, which requires the PWM driver
> to be updated. I figured it's okay to remove it here since it's really
> a non-critical device, and it'll be re-introduced soon enough.
> 
> The other change is the CS line of the SPI is now set as active low. The
> SPI core would have forced "active low" anyway, unless the 'spi-cs-high'
> property is set.
> 
> In the process of moving to devicetree, we also switched to new drivers:
> - We use the simple-audio-card and simple-amplifier drivers instead of
> the custom ASoC code;
> - We use the new Ingenic DRM driver coupled with the GiantPlus GPM940B0
> DRM panel driver instead of the old framebuffer driver;
> - We use the new jz4780-dma driver instead of the old jz4740-dma one;
> - We use the ingenic-nand and jz4740-ecc drivers instead of the old
> jz4740-nand driver;
> - We use ingenic-battery instead of jz4740-battery;
> - We use iio-hwmon instead of jz4740-hwmon;
> - We use ingenic-iio instead of the old jz4740-adc MFD driver.
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
