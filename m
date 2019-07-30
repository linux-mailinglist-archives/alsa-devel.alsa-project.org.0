Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0F87BD3C
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 11:34:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED1F31721;
	Wed, 31 Jul 2019 11:33:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED1F31721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564565649;
	bh=LL9QShu0Dekh4nux4gdp9dTNhROhNGYbtX94NC7Lrlk=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eJCvY0x7TEJY/H+3Cx8UYZWc/Yz95/eDErtjePtd2WLPnwNoGGufwpSsDPBaWrRHs
	 yO/ewzSW4mkSsmujNU1iStDOalcZRbcJqsZIbRTUIlYqOoYJZmuiy9o2Eh22uXkZAE
	 qr2SGzBPtugnD0+TzXIJbzTUTgCcRH4h0TU129ig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C131CF80638;
	Wed, 31 Jul 2019 11:27:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FC7CF804CA; Tue, 30 Jul 2019 19:44:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740105.outbound.protection.outlook.com [40.107.74.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6CF7F80214
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 19:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6CF7F80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=wavecomp.com header.i=@wavecomp.com
 header.b="S4rDSpaC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRNsShTB3W2YN18KscRiezzbVRVOaHwU++9fONhjG4JaGD6ywGy4SZdIqMOgc0hiKhKZYDFqKG4o7q5lcpa9ynRSR5AqqxtwoPETYY13CTnKqsmJQAKPdn2gkDZ1R1zJPEodWHinxSrfcgI2kiEqjydujKpQDa58UHrE0N2ONJytvJ9f/uaIrCDQ6zNmbDmHzh19RC4ggSkyaLNBakgdtfsBUlCBL+1FsdhQ58nq73cRnXGA+vHa58kgTyWnnS8dfNlJpGl0fu7v7cu7a0uHTeY27vsVWOfBoSRQ1RmYoI3NQvuGNFr9LcwCPWIZwtwywWaZmtbALc/2mKhbiG7Xcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTtK0xexa6OefAxCOUkdSxG1tXcEDaHWIg1jxrq+2Qw=;
 b=m/VT+Hui31gkZ1+NXQQjKrlW4D+yqt967qZuFbu6J1xHc6DNqs2A10LjcMdfgRFbx9VbcueNnqNkbYZFZR4bCJEzPUU0BTus5vwBMms7bvVzK8+PkCc+bCe/DCCFsOhflAP41YmMWdtSasLygsZmA8r+wkd0yWXO5elnQr4H3lPavwxMfsrWboJYUzNkGL6WL541m2aihYYPIFzvZP2pLdG2lx+co7P0LNf4Cu0JyOuzlFKYCYoxVD3J/ggReVJON0WAmBNNM++RFspXYmd12Wo5cgjWkZzpF3l6OoVxNzILnM0y5SuH9vDTCQOfQ/qILAuANVxYQ1KpQyJX9gsgjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTtK0xexa6OefAxCOUkdSxG1tXcEDaHWIg1jxrq+2Qw=;
 b=S4rDSpaCNgUAliugZ9qODEgD8cyc6CU5+nYX3+Z4Avkd2kiAcpfn/hkgAUSg30BamFdeteBYlpg2WDVFuGzC6Nx0Y1LCtjjJmuUjwj8sRVpWVHJdRN9y2B4tstrH0C4yARiFKpJQoMGnwcckMmrI3LKwNe6MhqCG8gsg2VN3a0s=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1023.namprd22.prod.outlook.com (10.174.167.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 17:44:13 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 17:44:13 +0000
From: Paul Burton <paul.burton@mips.com>
To: Paul Cercueil <paul@crapouillou.net>
Thread-Topic: [PATCH 09/11] hwmon: Drop obsolete JZ4740 driver
Thread-Index: AQHVRv5msVS8eXHddUW+EWQ0JmG3sg==
Date: Tue, 30 Jul 2019 17:44:13 +0000
Message-ID: <MWHPR2201MB127717A25A015893A7BCB916C1DC0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190725220215.460-10-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-10-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::35) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cefa3c0-4884-4b40-3d1c-08d7151588ff
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR2201MB1023; 
x-ms-traffictypediagnostic: MWHPR2201MB1023:
x-microsoft-antispam-prvs: <MWHPR2201MB1023FD94F018FD52EB5182C1C1DC0@MWHPR2201MB1023.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(136003)(376002)(39850400004)(396003)(189003)(199004)(6116002)(53936002)(66556008)(52536014)(8936002)(74316002)(71190400001)(6246003)(76176011)(71200400001)(446003)(81156014)(81166006)(476003)(64756008)(6436002)(14454004)(66946007)(66446008)(26005)(33656002)(256004)(7736002)(305945005)(52116002)(186003)(386003)(7696005)(55016002)(6506007)(486006)(66476007)(99286004)(102836004)(2906002)(229853002)(44832011)(11346002)(66066001)(7416002)(316002)(5660300002)(9686003)(4744005)(6916009)(8676002)(478600001)(42882007)(68736007)(25786009)(54906003)(4326008)(3846002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1023;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wrjsRhYO4vUkdcevYoOPMGH4LmQ+yXjxc1W7WKNRtxI3t/S8HAeLqp1X47s+5RbKb8a91cbBReJCcWJtJHL/f3RoHku19srxbHMUDXhnV4BmObf4APQMHzdfrES+XLzFrBAhTP+m0Mpn5Qsk6NLIkkWVa/OKiaOURKfdtcfxuYl3l025KxqRfLIUQBd4BC2nPzRGKETSYRDmH5nABDVSdPlqQQuF8VwM9C9NxVYDc1FLOopIfKrkBlZOC4WxeFlfxSk14OUP0LBOj+PPD1L4Hh5WOJyuRW5kGhPnlthonzKIiKnyMjcurMu5Do3LLP/zTlK7RlQwV9aOz4NGwzREnZCi8FXhqT+SHMz+74UG1dUVnbox2c3Ex1w5FjzeG9zR2g9vUtdku7AnDjth04YAX6VHysQ8pG4wANLLj9u8mho=
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cefa3c0-4884-4b40-3d1c-08d7151588ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 17:44:13.6162 (UTC)
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
Subject: Re: [alsa-devel] [PATCH 09/11] hwmon: Drop obsolete JZ4740 driver
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
> The JZ4740 boards now use the iio-hwmon driver.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>
> Acked-by: Guenter Roeck <linux@roeck-us.net>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
