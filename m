Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB7DC895A
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 15:13:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4021E1674;
	Wed,  2 Oct 2019 15:12:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4021E1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570022013;
	bh=YO+8l+csS/qjtrWN4mmBgP/HjLfP2EQc5xUyfD/va68=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WKgE7dmS0oUwwlDxnGRyKFTBt3L8QBWLuC65u2Y0x9Z70NqPiL8uXUDLU8zxB5Ncg
	 c3cBjKQXQgOuKhGSz8Cx75yQFHnG1ERWqLdKP/ol3Mm6m1+X3eFJJMhpbfDtC8/N5p
	 wLufkXUw7z48SiAQreoFMDOZaDejGgsEGPcArsNo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80BBFF80391;
	Wed,  2 Oct 2019 15:11:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35DC2F80391; Wed,  2 Oct 2019 15:11:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750041.outbound.protection.outlook.com [40.107.75.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FFF5F8036E
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 15:11:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FFF5F8036E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="IXfx3BwD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pyhxkm88diybtDHUOtCzuaK/37zfKSuDZeAEc6iaus37HxMuSSVy1jNpGalKwRKBiikTrL8AR+Pp0fipSKQl0mIDkHOKiqKb6tTpc0BA1WMh3i3k5YLGWTvV3ZdtGKM72CczrdJdbWKf6XcFTKXuUONjaqC6qRFKbn0vV1E7qnscvLkdtCc9ozTtsTd/cg2msfJM/yOR1S+XjkyI4sHs4hMdzPEabuIk2B6Hmrwaz1ZhhvjyGnzOmHSpT9k/P1nRFXfXot0zNFJCCwfcATRo4QAjar5qGcQ6Qjr4VK5aM1qMN6yPmKux09uWphsHk/m93KHNjEhJsO9ew9GgokbX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PD07Va/9+y914VgEDJb2rG+ZgMoSIIweZWHEHvUJvUQ=;
 b=CYeZB6Wmtj2rFILxTKs/xRFpslQ5ny4mA9fFpbIo4hjgzDuRdAbq8F6IQg8QPmL3SV0mhx4LpVwxpkDbb37WBBlezkYLVrOvRkxcSz6imNSF9l2lk0S5isMqBhosbpyT2juw/FOH9OoIgSd6izET/awP5b/xwHocJOp/gl1Br+eDMKd2EybN9tNC+yDpLAuQMJPYqvBQ+XE9gKvAMcAhW9IIYLaHCpJsnWGdBU2ifa+1cPgmIaj6jVdO8fKrLR4rS8IEV7zMAORbQA83svSYjRchqRrAm2CUiU/PWIghiSWFp+q8NbI9ERdYebtRaQgHo/tMAvD44hF1WSsz9bff4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PD07Va/9+y914VgEDJb2rG+ZgMoSIIweZWHEHvUJvUQ=;
 b=IXfx3BwDYceBuUFXAfKFPPV/2H3tszv+KH5ZoXCtS8UUDq4oCXMNVd9Cib7/761IC27m/Q+5SPrQzf8iSziarviMCVQL6WuwjQJxPyBYJDbHkn/PYeOHWdvbnVug5injcSeaC72tyQaNsFET20nd4ghOBGuSh5tjuyA/nvJQy0g=
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1268.namprd12.prod.outlook.com (10.168.226.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 13:11:37 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::418d:e764:3c12:f961]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::418d:e764:3c12:f961%10]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 13:11:37 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Lee Jones <lee.jones@linaro.org>
Thread-Topic: [PATCH 2/7] ASoC: amd: Registering device endpoints using MFD
 framework
Thread-Index: AQHVd5gywJvnY+WwrkWUotR2w3skaqdFWHuAgAA2g4CAACFpAIAAct1AgAEp/YCAAAfXMA==
Date: Wed, 2 Oct 2019 13:11:37 +0000
Message-ID: <BN6PR12MB1809451A3152488F3D8D1371F79C0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1569891524-18875-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20191001064539.GB11769@dell> <2ff13a61-a346-4d49-ab3a-da5d2126727c@amd.com>
 <20191001120020.GC11769@dell>
 <BN6PR12MB180930BD7D03FD7DEB14D7C1F79D0@BN6PR12MB1809.namprd12.prod.outlook.com>
 <20191002123759.GD11769@dell>
In-Reply-To: <20191002123759.GD11769@dell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
x-originating-ip: [165.204.11.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8036b446-7897-4b19-cd92-08d7473a0e72
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1268:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB126868E3AD54F7721D79E040F79C0@BN6PR12MB1268.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(189003)(199004)(13464003)(14454004)(74316002)(305945005)(316002)(8676002)(52536014)(256004)(54906003)(5660300002)(99286004)(6916009)(33656002)(81156014)(81166006)(7736002)(2906002)(6506007)(6436002)(53546011)(8936002)(55016002)(64756008)(66476007)(66556008)(66446008)(486006)(66946007)(229853002)(26005)(102836004)(76116006)(6246003)(9686003)(86362001)(11346002)(6116002)(3846002)(186003)(66066001)(71190400001)(71200400001)(7696005)(25786009)(476003)(4326008)(478600001)(76176011)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1268;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1EpR3h00UBdCYhSXbz8/n0wPEe1DDUwgLzRdkt72tOdtpD10cBzqaFClKUNTAJzIiCYaWeZtpt+dTjkGz/i6beSYiQoCrvAPepEJFcR4OwwuiXZ++by1tRrfWz8zJ6/YczaIcr+3/NIGoRkD3zMe37diXNp6V79y0L4vgOdJ+RWHx7YwcwqqsrQdiFEPmrfUqbygdk/focuctSs3/bjZp6D9yTL2f0E9Skwv8ZPV+5cFL5bp6psj1/z7HLOFP3C/B9qJufcHwXs+6Y5xLJLn4ztl7f1YALBhPp8CGDnjP/JGBx9ONDk9Poft34V6UTydg3LSufLkQd2QCG5g38ULB/EMnIr+1SauqTuCj2X0FzIgCdRCe4wN+w2jnbI65YYr2ouRwc0jSLdeYn7MEHmrvipme6GXILtxEIv+5VHGCNQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8036b446-7897-4b19-cd92-08d7473a0e72
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 13:11:37.1065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BDPKoc6mlmravNEul9yc3TYislK29Wo3atjJtfouGxVGY67k2LQQ1jGm1f5rkQ980s2Nw/KJI1wZ2YDFtNEMvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1268
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Mehta, Sanju" <Sanju.Mehta@amd.com>,
 Mark Brown <broonie@kernel.org>, "Mukunda, 
 Vijendar" <Vijendar.Mukunda@amd.com>, "RAVULAPATI,
 VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH 2/7] ASoC: amd: Registering device
 endpoints using MFD framework
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

> -----Original Message-----
> From: Lee Jones <lee.jones@linaro.org>
> Sent: Wednesday, October 2, 2019 8:38 AM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>
> Cc: RAVULAPATI, VISHNU VARDHAN RAO
> <Vishnuvardhanrao.Ravulapati@amd.com>; Liam Girdwood
> <lgirdwood@gmail.com>; Mark Brown <broonie@kernel.org>; Jaroslav
> Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; Mukunda,
> Vijendar <Vijendar.Mukunda@amd.com>; Maruthi Srinivas Bayyavarapu
> <Maruthi.Bayyavarapu@amd.com>; Mehta, Sanju
> <Sanju.Mehta@amd.com>; Colin Ian King <colin.king@canonical.com>; Dan
> Carpenter <dan.carpenter@oracle.com>; moderated list:SOUND - SOC LAYER
> / DYNAMIC AUDIO POWER MANAGEM... <alsa-devel@alsa-project.org>;
> open list <linux-kernel@vger.kernel.org>
> Subject: Re: [PATCH 2/7] ASoC: amd: Registering device endpoints using MFD
> framework
> 
> On Tue, 01 Oct 2019, Deucher, Alexander wrote:
> 
> > > -----Original Message-----
> > > From: Lee Jones <lee.jones@linaro.org>
> > > Sent: Tuesday, October 1, 2019 8:00 AM
> > > To: RAVULAPATI, VISHNU VARDHAN RAO
> > > <Vishnuvardhanrao.Ravulapati@amd.com>
> > > Cc: RAVULAPATI, VISHNU VARDHAN RAO
> > > <Vishnuvardhanrao.Ravulapati@amd.com>; Deucher, Alexander
> > > <Alexander.Deucher@amd.com>; Liam Girdwood
> <lgirdwood@gmail.com>;
> > > Mark Brown <broonie@kernel.org>; Jaroslav Kysela <perex@perex.cz>;
> > > Takashi Iwai <tiwai@suse.com>; Mukunda, Vijendar
> > > <Vijendar.Mukunda@amd.com>; Maruthi Srinivas Bayyavarapu
> > > <Maruthi.Bayyavarapu@amd.com>; Mehta, Sanju
> <Sanju.Mehta@amd.com>;
> > > Colin Ian King <colin.king@canonical.com>; Dan Carpenter
> > > <dan.carpenter@oracle.com>; moderated list:SOUND - SOC LAYER /
> > > DYNAMIC AUDIO POWER MANAGEM... <alsa-devel@alsa-project.org>;
> open
> > > list <linux-kernel@vger.kernel.org>
> > > Subject: Re: [PATCH 2/7] ASoC: amd: Registering device endpoints
> > > using MFD framework
> > >
> > > On Tue, 01 Oct 2019, vishnu wrote:
> > >
> > > > Hi Jones,
> > > >
> > > > I am very Thankful to your review comments.
> > > >
> > > > Actually The driver is not totally based on MFD. It just uses
> > > > mfd_add_hotplug_devices() and mfd_remove_devices() for adding
> the
> > > > devices automatically.
> > > >
> > > > Remaining code has nothing to do with MFD framework.
> > > >
> > > > So I thought It would not break the coding style and moved ahead
> > > > by using the MFD API by adding its header file.
> > > >
> > > > If it is any violation of coding standard then I can move it to
> > > > drivers/mfd.
> > > >
> > > > This patch could be a show stopper for us.Please suggest us how
> > > > can we move ahead ASAP.
> > >
> > > Either move the MFD parts to drivers/mfd, or stop using the MFD API.
> >
> > There are more drivers outside of drivers/mfd using this API than
> > drivers in drivers/mfd.
> 
> People do wrong things all the time.  It doesn't make them right.
> 
> > In a lot of cases it doesn't make sense to move the driver to drivers/mfd.
> 
> In those cases, the platform_device_*() API should be used.

Why do we have both?  It's not clear to me on when we should use one vs the other.  These are not platforms per se, they are PCI devices that happen to have other devices on them.  On previous projects, I was told to use mfd and no objections were raised at that time.

Alex

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
