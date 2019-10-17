Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB59DAEE3
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 15:58:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D650A1666;
	Thu, 17 Oct 2019 15:57:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D650A1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571320697;
	bh=IzU5KJEN9tW7Il12qdfgdj7n8WQF3YU+cYXZYUAjn3Y=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kl4+DOmQQtZTA+zxJU4C2Jg74VCAFc3yFZ/hhncvhw71TbTWeC4rkMWQo66aV7xda
	 vJTCoYrji4kfDqaoNQoKwii4sX82For6T6WbEYk913BY5O2oN6Z21LN/BOnyXwg/Pg
	 vgAhNpEjOdoiG7bioH2fwyAFztrlUGjl3GppQ6Ho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1729F804A9;
	Thu, 17 Oct 2019 15:56:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D830F804AA; Thu, 17 Oct 2019 15:56:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,PRX_BODY_30,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680064.outbound.protection.outlook.com [40.107.68.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7F52F80322
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 15:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7F52F80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="d9mez6wv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDTZB/Xja+y1t6xiCpPqzL46SaMR8A5LPmoDJb12Kmz5k8yzesaVXZPuRMCerElADED0Y/LmKrWAcHKPoXxKM/3ii6seUCQQ0mP+mRNOpqyZvND5UsdidduWgYuv1ici9iNG7culKKndvqI3tJww/znaqT7v1v0Yg7NfyQ+lv+TmxXmAPJoo2T/wB6T/Lfl3ldMGpkalTlim3sGJpbuUlatwFeaveTqFEh1t1or+oGealLc91b5GaO+aCz2jns5ruTO9uXMLKhq3vxz8I8mrthCOn18QLwGnGPd03r6+ekqcmSz/NXAj9cxTUQhZjxHAnPorAHV5gQX7Tux/yu44eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVrBsS1v9msEt9SREadT+7tJ/+srtvuv1XI/SWls5Xw=;
 b=UFsNjx/+OPqEHS/eqxhcsZXNL3qmvTvpB2H78MWNdwqkG4oyDzMDNz1hGkZluK6+LaG1SRmUQWGcbIoV+gEqvGU87OxTgNOej7iCDGwGy+Y3+gxZPVRFMYP6mVmlC6MvsjjtL/mFN7xgWJMSCF/hH3V6/63KQ3f0zCCwXXgxvvqnvX3Mxcc7ZyGCrzzzL65PJb0+/llBUYyQ87lCDLzsFqDLXow6ghIY4xHUv0g0kkLb12bGh+hHrhUE9yILCptEhJWRqWYnKy0Ik9I4p6ReoHDL3WB9WS7uKE7xE1h4ESZUnA2fkOfAy+Lm/YMLd8rC6PgxCNjnYiV/KuNcbHjloQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVrBsS1v9msEt9SREadT+7tJ/+srtvuv1XI/SWls5Xw=;
 b=d9mez6wvcyXCaOzcQxMPYNhBl8XNYbYnyrgbZtnwDjW29A6IHwy2rec/2Mma9tWplAEXvb9EWushPapYxOhT4SzyfvuDINsTKmE5HtMq1f0vjnLuaY0BBpozg9+XrZFDbUZ5gKu3toZ1szEIdQauWMe2/pNTXLZt5iiLw/ICNBc=
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1601.namprd12.prod.outlook.com (10.172.20.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 17 Oct 2019 13:56:22 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554%12]) with mapi id 15.20.2347.023; Thu, 17 Oct
 2019 13:56:22 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>
Thread-Topic: [PATCH 1/7] ASoC: amd: No need PCI-MSI interrupts
Thread-Index: AQHVd5goxXKghNLRDkOKQUyI++DOdKdGClsQgAACEYCADbLCgIAK7WQAgABJLVA=
Date: Thu, 17 Oct 2019 13:56:21 +0000
Message-ID: <BN6PR12MB1809562679A0266AF1C43A81F76D0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <BN6PR12MB18093C8EDE60811B3D917DEAF79D0@BN6PR12MB1809.namprd12.prod.outlook.com>
 <20191001172941.GC4786@sirena.co.uk>
 <f9b1c3d5-6e02-354f-91b6-3b57e2f88bde@amd.com>
 <76668467-5edf-407a-a063-50f322fe785d@amd.com>
In-Reply-To: <76668467-5edf-407a-a063-50f322fe785d@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
x-originating-ip: [165.204.11.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06cc8126-30a9-4f9f-e888-08d75309cafe
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1601:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1601B31FA1966D42E01A7AE6F76D0@BN6PR12MB1601.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(199004)(189003)(13464003)(8676002)(33656002)(99286004)(229853002)(3846002)(6116002)(81166006)(26005)(81156014)(102836004)(8936002)(446003)(11346002)(478600001)(76176011)(7696005)(6506007)(53546011)(25786009)(14454004)(4326008)(186003)(66446008)(64756008)(66556008)(66476007)(76116006)(66946007)(256004)(9686003)(74316002)(110136005)(54906003)(86362001)(2906002)(316002)(66066001)(5660300002)(71190400001)(71200400001)(305945005)(486006)(52536014)(55016002)(476003)(6436002)(7736002)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1601;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mil2QAK0l2+kcjr96khjksu4e7ROlth3rXCBdtd2wmm64lAi3D44WCRudQ5jVhkI0KS5mHvgq4/14Sqm/OHjal+q976ZiOs1GWXT4xwsQPKeovE6sE6BFetPkUhMbVEZb1TIi6YVTCtVBfeXasb6wbvqJYSTs48SxeIwOApoJ6h9xUc+mYmmejM06PCeR/aLNwMcENBlgtfGMSfnpZYQqkyKE+BJFBm3+ofj393joIemXIbtSVQaflprquPS5Uvz1o4fVgqZzbJZad4BMszwTNoBb9320Fns7O3zHa2c615uv/xhqACMwjAzRfx2/fFHQCAquQkXT+PTGNKO7bHkjyCyLWoxfzKXSPX8pT2XSLeZjK1+KNBUGsxITI/k+JrQBzxkA7K462H3kuAcvkraZNlaBGaa33sBxyy3ghqWa34=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06cc8126-30a9-4f9f-e888-08d75309cafe
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 13:56:22.0679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mBAIWOAB3AlQDVC97ri+Kqc2O8tFcDrytvGrlnuxCI0qjChYFY5lOOCgKMUyRO5J9FIolJcQIerz4yJ7JcEssg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1601
Cc: "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH 1/7] ASoC: amd: No need PCI-MSI interrupts
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

> -----Original Message-----
> From: RAVULAPATI, VISHNU VARDHAN RAO
> <Vishnuvardhanrao.Ravulapati@amd.com>
> Sent: Thursday, October 17, 2019 5:33 AM
> To: Mark Brown <broonie@kernel.org>; Deucher, Alexander
> <Alexander.Deucher@amd.com>
> Cc: RAVULAPATI, VISHNU VARDHAN RAO
> <Vishnuvardhanrao.Ravulapati@amd.com>; Liam Girdwood
> <lgirdwood@gmail.com>; Jaroslav Kysela <perex@perex.cz>; Takashi Iwai
> <tiwai@suse.com>; Mukunda, Vijendar <Vijendar.Mukunda@amd.com>;
> Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>; Colin Ian
> King <colin.king@canonical.com>; Dan Carpenter
> <dan.carpenter@oracle.com>; moderated list:SOUND - SOC LAYER /
> DYNAMIC AUDIO POWER MANAGEM... <alsa-devel@alsa-project.org>; open
> list <linux-kernel@vger.kernel.org>
> Subject: Re: [PATCH 1/7] ASoC: amd: No need PCI-MSI interrupts
> =

> =

> =

> On 11/10/19 3:03 AM, vishnu wrote:
> > Hi,
> > Please find my inline comments.
> >
> > Thanks,
> > Vishnu
> >
> > On 01/10/19 10:59 PM, Mark Brown wrote:
> >> On Tue, Oct 01, 2019 at 05:23:43PM +0000, Deucher, Alexander wrote:
> >>
> >>>> ACP-PCI controller driver does not depends msi interrupts.
> >>>> So removed msi related pci functions which have no use and does not
> >>>> impact on existing functionality.
> >>
> >>> In general, however, aren't MSIs preferred to legacy interrupts?
> >>
> >> As I understand it.=A0 Or at the very least I'm not aware of any
> >> situation where they're harmful.=A0 It'd be good to have a clear
> >> explanation of why we're removing the support.
> >
> > Actually our device is audio device and it does not depends on MSI`s.
> > So we thought to remove it as it has no purpose or meaning to have
> > this code in our audio based ACP-PCI driver.
> >
> >>> Doesn't the driver have to opt into MSI support?=A0 As such, won't
> >>> removing this code effectively disable MSI support?
> >>
> >> Yes.
> >
> >
> =

> Hi Mark,
> =

> Any updates on this patch.

You are removing functionality from the driver with no rational as to why i=
t's necessary.  What's the point of this patch?  Does it fix a particular i=
ssue?  If not, I suggest just dropping it.  The hw supports MSIs, why not u=
se them?

Alex

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
