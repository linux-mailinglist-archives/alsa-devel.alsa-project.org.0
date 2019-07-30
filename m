Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5EF7BD3A
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 11:33:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69384171C;
	Wed, 31 Jul 2019 11:32:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69384171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564565597;
	bh=j1mP5ERFo9AjSHI5bGLGeN47DcHzfyNYWB7vIfLzDDQ=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JHbZRQradYFc8vcsO7rO/AXrdUpkMshDldqW4LTjeRd5x5B79IQDJHcBL+/ZC8AFx
	 xE9Og+S2LXCjNrzRlo8cnMGv1O0hSwW1uEHY1Bg6zN253prHnfOCPW8PpZrkD6l7h0
	 lYxNHwg+oWPd5ZivClafHzuGqr7KunewYj0q2w7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC0B7F80612;
	Wed, 31 Jul 2019 11:27:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F34CF804CA; Tue, 30 Jul 2019 19:44:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740114.outbound.protection.outlook.com [40.107.74.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3833FF80214
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 19:44:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3833FF80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=wavecomp.com header.i=@wavecomp.com
 header.b="BzPoZ/02"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RviucMrb7bRqocz9LC2G3S2nCjFeI5timeG1WbsXgv8JQYIByI23RCIt8Vy9w26MeIFA72dXrQwhpo769lkuTHeCLX85nnVArDG0CyXJ6P/8ST+Dbv+VblcAIjHYPXmDa4NAwzdcASyEQ0H+YsH3WjDlucayzMfkrZytVzSWd0mtLGXJlaM1BoBj8J325rlUMrf+ON/4uQpL+ax0dYXCVXwIghi2Nsxl6JvfwWR2MNpUmJvXt8+eEI5amnhf0PpXzaXJQEmrI8d94RJy6xNLuXI0KKMivQwhhEGUcw8osmcoQGAceDbqVuWWk812Oy6ohXj17JGsKjTnF/Q3/9YwVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHTU9zmPJjPcJnHR862mpbpt9BLI9Xdp2TU5a+bK0pI=;
 b=Bp4z5/kHhEkl4jrydVnCys4H6OD6OiUwh66WDdTX0hMzm+J9MDUQJ4E2DnWAnjLohcdQULIsih1rg8F9S7Vm/jOMboTXVNkZEJvC+2XbnTXiBQ/c+081onBdFdH+gypJTDW4TH7DRZxEqmeJWNKBAXzNBos3v/qEy1rYFbTWyQapLHmwX8oeju1IfGqN7z5Td5yegF8wfGdVMTcEODvo519c0y78J0+vR0Wc4kRfCjXhobV/ZmOdVw2lbel7d7rRePxYrmhyclAwPYum5Vzbrhl7Dbq5L+ze4UBvziixI87yiEfjgFlRqpwQQE52ZPlQtej6qpBVHmauk1JKC92hSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHTU9zmPJjPcJnHR862mpbpt9BLI9Xdp2TU5a+bK0pI=;
 b=BzPoZ/02L8AJrkfU8gHUiE85GslDdMUAmYKV+jPykdzrWnj1DH1pxmTrZvv+0FnlusEegMfWPtLsva19r6PkiIYGTRYS/zkA9awQam9uFcZPhMEqPNI355Xp6WDR7A+J7ymu5O6GyPDCwXG8g47/6204v2mbh294tZeR3JxDxxQ=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1023.namprd22.prod.outlook.com (10.174.167.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 17:44:09 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 17:44:09 +0000
From: Paul Burton <paul.burton@mips.com>
To: Paul Cercueil <paul@crapouillou.net>
Thread-Topic: [PATCH 08/11] power/supply: Drop obsolete JZ4740 driver
Thread-Index: AQHVRv5k4TjTT1pcZU2LxKlcftx5bg==
Date: Tue, 30 Jul 2019 17:44:09 +0000
Message-ID: <MWHPR2201MB12771D2BA5082D6000D6C596C1DC0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190725220215.460-9-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-9-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0076.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::17) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e951fb2d-2cdf-4873-3c89-08d715158688
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR2201MB1023; 
x-ms-traffictypediagnostic: MWHPR2201MB1023:
x-microsoft-antispam-prvs: <MWHPR2201MB10233100C59115D7E87A6317C1DC0@MWHPR2201MB1023.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(136003)(376002)(39850400004)(396003)(189003)(199004)(6116002)(53936002)(66556008)(52536014)(8936002)(74316002)(71190400001)(6246003)(76176011)(71200400001)(446003)(81156014)(81166006)(476003)(64756008)(6436002)(14454004)(66946007)(66446008)(26005)(33656002)(256004)(7736002)(305945005)(52116002)(186003)(386003)(7696005)(55016002)(6506007)(486006)(66476007)(99286004)(102836004)(2906002)(229853002)(44832011)(11346002)(66066001)(7416002)(316002)(5660300002)(9686003)(4744005)(6916009)(8676002)(478600001)(42882007)(68736007)(25786009)(54906003)(4326008)(3846002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1023;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZKTtr5jL2TH0M3itAqGi58WW3r+lZ85Szm/ou+rqDdV2Qs9TtFtD361F9feNUZN/DOXkLYSlBQjIDvuYH/E8A/ka5Nhs7wfDjrCxHyXrQ1cMUJfwiN5AgzGCA91TK0rK08igGIOyr3bSeT3119NVJZvwzjBhwtvgRoyFVpzfexUEmW/zAlTLWKz4wYgVSWMWJtBO2ZHiUcI6rtJn5yWANR0BPAg7rXa+7jUemlP9LzdZbmnX/zCAq52q/aDiIdQwldkMBG6dZ/v/nZ/pM+Qyzh91/FWnB91upVKryInbGTmuHZ/rfbvrc4rqerQZE1XWg9t6xvtFmx8gLrtaLvE+LMmu5CBYOPojMiVLtGAAKkZFzw/Wni3elLTBQRd9W4Y158pF76T/tLggbLS9Hzt46NcBcgXT3hvivYrsLWkykMg=
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e951fb2d-2cdf-4873-3c89-08d715158688
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 17:44:09.4758 (UTC)
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
Subject: Re: [alsa-devel] [PATCH 08/11] power/supply: Drop obsolete JZ4740
	driver
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
> It has been replaced with the more mature ingenic-battery driver.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
