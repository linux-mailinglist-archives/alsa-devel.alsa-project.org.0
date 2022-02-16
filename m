Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0564E4B8195
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 08:32:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90C70176E;
	Wed, 16 Feb 2022 08:31:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90C70176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644996740;
	bh=u/HPKJ8me8/QpWl668vcE4g55MYHDMD3soipFeXu8u8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MzlB/6BTe5ap+pikBnBw7rQBKkAxos8JxuFPr7JUY07NpDmIxKndX6aVf70UpK3z9
	 5PXjaTXrhoDAqYYE865FLTIO7N1/PF1Vn7cQ4ll1jm6L38Ep80eU6s+vW7Zb0J6Iz9
	 XEUmaBOTFZI0rWIms2C+yvsRNc3Xb2VQXgmTiWKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC76AF8012E;
	Wed, 16 Feb 2022 08:31:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D21A7F800C0; Wed, 16 Feb 2022 08:31:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_1,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 686EAF800C0
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 08:31:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 686EAF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="j+3U+Z8z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIrZ/6V3i1uJILOsRivasQnFQqc72KDA3kEEKryq4XgZgfUL9Q3jNC55v23+e04mR3JbwrDCh5ThclRacFwcOviTs9xJAS1wUwMUhp7XypguDdwjc0wBYyRL866MbU9pjXwGlmWzlMkIiHcZE5aIE5I6vU3rQScWQG8ReW0WkhkH7X7M/KonXelSL9EOVsDHeTGlQA6czSTM0E8Y/Dozi6wLv+X6aWV8LxA+qx7W36JPKFq2RS0JWZpOWTkmTwTnbVojHxwZAkZw89vg77yGpgb1j/eXKPVp6ZgnZZoZnstw6S1iAYnFiCZODEUMA7ZJGp9v2usW4ubH2uLhlpz2xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5A/2027vx5pLt5iDeaumLs7ox9N+sFPxVkL3tj+H44s=;
 b=obaletMcPn5Ra7s5vJr4/51iEcRInwVS02+/WXt8h5cAwSb9JDlwkFPqATWf0BBdD9fifRKPwZGdo51v4z9hWejZSr33/Sp08PtN5un/53q6qzIzMDv65TG5fQRPG/rCUM74/BUVN+BHMKM4fvaJP66a420PRTggAc/TKIbdBtMo7RefpzBJbodt+LbKXTCxprM1v+meDBX3cOeuz+soYn9/OMQ7j2bm56TylugthN5uDCx9DlV53te5VKk9Dc8sIQhZV3dfVr4uf9ysepa7DLVCwOzB3rvxEx6Pf6qCEjEhiEQRep0Qenw+VAAxj1d3TsY+9SKwjgRh4q4elXW1ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5A/2027vx5pLt5iDeaumLs7ox9N+sFPxVkL3tj+H44s=;
 b=j+3U+Z8znMRbEUUjLmZ6RRDh/2GokRIA+YPT2+gRMANj/uhbrxlTkQHIPj0f9mC0WP1XIGULPMTeyuukiu3FWmxvQj+dkX2KHu+p9tZ2BHtaOlG/RQ0WBQyZCi9sHTZFpqo+RoDdFrtsMLhCmrN+KB6eFB/slWCdkYkHt+oebdObwknSUneRHfmfVSSCDVYOMBAHMz7OlxuCT44VpxZrbcvD9RIkt1fSB/ES0m0PqQK/5ENTOSPrseoYSQMCio0TrNnnbpDHbmv2RN9LSA0PIwK+Ajy3+o9Bj/+/pJLdDVjxVK4Jo6riee1aw+Q6c0VlxSzA9gP9ttCMIfzMswRE1A==
Received: from DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23)
 by BN6PR12MB1364.namprd12.prod.outlook.com (2603:10b6:404:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 16 Feb
 2022 07:31:01 +0000
Received: from DM6PR12MB4435.namprd12.prod.outlook.com
 ([fe80::83b:60bf:1e58:de83]) by DM6PR12MB4435.namprd12.prod.outlook.com
 ([fe80::83b:60bf:1e58:de83%7]) with mapi id 15.20.4995.015; Wed, 16 Feb 2022
 07:31:01 +0000
From: Mohan Kumar D <mkumard@nvidia.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: RE: [PATCH v2 0/6] Add Tegra234 HDA support
Thread-Topic: [PATCH v2 0/6] Add Tegra234 HDA support
Thread-Index: AQHYHkqfIXhpDBHnV0GiVPOVgWWYmqyUo6YAgAABJoCAASyu4A==
Date: Wed, 16 Feb 2022 07:31:01 +0000
Message-ID: <DM6PR12MB4435BDDAA9DF1820C5D92637C1359@DM6PR12MB4435.namprd12.prod.outlook.com>
References: <20220210065057.13555-1-mkumard@nvidia.com>
 <s5hmtiscl65.wl-tiwai@suse.de> <s5hk0dwckza.wl-tiwai@suse.de>
In-Reply-To: <s5hk0dwckza.wl-tiwai@suse.de>
Accept-Language: en-US, ta-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31c4690e-aed0-4660-915f-08d9f11e4846
x-ms-traffictypediagnostic: BN6PR12MB1364:EE_
x-microsoft-antispam-prvs: <BN6PR12MB136459F58FDA499983C726A0C1359@BN6PR12MB1364.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0cOalGH5KKH0Vi2H9hsUtl7/PdCv9J9UxcjdvxCPDD8djrfyRHf6/Vi6t4gCKVAxQs30g7TAGy5xDSNGvzdOpphyI61Q3b/HWt6ibAgMrL2H/LoY8tQ0CWZY++jUaZR1kTtSaOF0TSnTvQupKNQ1H0Ydr4oSav3aXW/Ue0Q4iV1JKWSXfW3uEomn9ND/QRbnSxHr0/brsfxkv/v8K3ijp3DUr1ON50bd/OFPlEs90raVNH3/7EkscPmHc/OLsKolc7aK+3vdugNroY/2LYrdX7I3eCSzxHdFAQhtdV4jUiFFfKzTQ8vPRHFgZVdcp5wfAKli2EIkpSN1e1n6gbjuz9Bjq4m8bpZAXD7+H7nAQOWe0RLK2XFtNhkAvnIz+b+daAR7QmJwXplCE2SR4Bpm2fG+9OLQgEcxMXsUMfJvIMUB5/hawTJQdCvO1h+FXaZ8DUJIWeW7EqqHX1wND57rmm8KtJTM3CjQx6eSaXlSQs3EiVQMaV6JOuyToSXM8syUam4RYS6yTg2quDJ2RBFo7OrL7LJsRxNmLV4YWp3GcvGfeJZF6BmhZCVWfFCIv4bRiwgxk2oWBk+6QLVPJZSJ/YRsJ/Md+HDaXzbFxmbEQt5j8Y8PRdWBJXgYCp1VugTGlcOxgTMA0HMRW0FcztoPX/MA2tMbAtnOH3wx1tCtQ4LzPOcmqp4fcKvnNTe6a/ueUAanmyOckkzawQfNb0ohVQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(122000001)(6506007)(55016003)(7696005)(9686003)(38070700005)(33656002)(71200400001)(508600001)(38100700002)(26005)(186003)(83380400001)(86362001)(4326008)(2906002)(8676002)(316002)(76116006)(8936002)(66946007)(66556008)(66446008)(64756008)(66476007)(6916009)(54906003)(7416002)(5660300002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JNzmvtn+yW2gzs3Erg6FSHuvDCYiRDnz75qUMVoyUmBzHad2PcVwODr4CVCB?=
 =?us-ascii?Q?lAx6kMeZowsfWp3R5hqpwLAKtLnxVv0EvrQrqDUp3mxKpGX/6SbRWJG7kWhd?=
 =?us-ascii?Q?8OFU/2WAcIGL7QkCChHNGChNM1nF2l1w2IJhQ8+MocKS/JQpDKmzpDl03RnU?=
 =?us-ascii?Q?WBxrD43B8XKTbx2Ea9VjivWdDjD+d7NUqInjfagKwcyKAIJ3RPJ/19w0ELkx?=
 =?us-ascii?Q?IM0+I3uq6myhn+Hrh8RwTbkD80HWYQHy/14Se9aA+et3fRxsW92MNIvQR82k?=
 =?us-ascii?Q?BrrKUx2SOyggC/LUhRLtlwYfkp3B0+CYdh5I2Nn4yEV+NXBENyIvrwlA7hW3?=
 =?us-ascii?Q?/qaDVaG2qJTKdsgFkCP+H3tm7rRi7UOQknvW84cIyEsnC8jwPXR4L//ClREg?=
 =?us-ascii?Q?NbCoy8L4uhKJBxKDELJuwZv+e5hie7CkqVoGDescSlG2Y5qGWFU6oXJnPh57?=
 =?us-ascii?Q?TxoHYBq0UrdCepVfHxTLMLDT+QVEl31Z3RqalR5iuSilen9pdR+ULMZGgpt4?=
 =?us-ascii?Q?mgYvm63inpqSndVIt8z3j+PjcFpfS+LmjrjomSzQ4mmYY64diJdL+ywNHfWn?=
 =?us-ascii?Q?DPvrkJWbBF/476u8rnnDjWKA7x38XM0L6hm9J6kfD+wsOYc7djYFWyqyfBMT?=
 =?us-ascii?Q?7CvD37zglWqeIaYnjfTGra2T3jq3B/ssweRis8uM766bjZeOprmQGxPuEahN?=
 =?us-ascii?Q?5v/XK+0dWzk0+rBdPBNIQUS9jvZl3dT0fRXqOnx1e4hOAP/YcSFU8YoWoF3+?=
 =?us-ascii?Q?xp+KyHB+FvIkkC7J40uL9zT18LUXY+ifqxKyPtOv/SAovJ1yMod2VHBRnR4E?=
 =?us-ascii?Q?2CaxjXEjdlSPsDVjXJnaZG7ku6asmEyTgKeZysgc2KFYhvYA4gFrRNo9665c?=
 =?us-ascii?Q?GtFuf6husJK1b5FmUalOtmj04/xFf3M8RTntZZtdd53Ul3DGoaMB05VTXjyc?=
 =?us-ascii?Q?j0wbNro8wopazDGkSDHCfZ1LSesq+y+C4wafCsW4C7RAXZpJg5QrNvvFmyAJ?=
 =?us-ascii?Q?toenZrpFdOl5dTuz08ZA1SEwn8nIss7t6cY3/sjIgCvfwId/KvTMo9wgLNVz?=
 =?us-ascii?Q?uqL2ajOwk8lk8pGivSMfBa+XFY0jp1XSbSK1UZT4d1iE364yeckUJ5ew8kQN?=
 =?us-ascii?Q?caRYENZvBu/Cj6CDdoWZRUw0ohhi5/PGwhN+giabG+DvhhQTloYReNCd2d/N?=
 =?us-ascii?Q?wSuG5Jlt5E5qAbGBESrihkgAjE7vpE50WzUalwKtAbL/RJqBkbZabIHWiaJ3?=
 =?us-ascii?Q?K1DzqKsb5y1sdWLMwJYCJ8YmMfhbU9cyV9/HhXYBniKpTfyhdmG9qoIHd8JN?=
 =?us-ascii?Q?NQRH4Hr3s3r69TPc0KZaOodWGxcKMELhdKZmTptMrrwsxZh2DuznrYqYZRKd?=
 =?us-ascii?Q?AIrqsbF7Bzid+qGR61nJNVudUXpHdik3FxZy3FJbWn23c9cwTOscdQckMLlm?=
 =?us-ascii?Q?xVDIh9aNGczpREicKPtvy/tCCcFpNycH7pg567hNMIfirj0iq9FsenMSxaTN?=
 =?us-ascii?Q?ojn1fNwCt+d9ib8LCTO0F4Jj57L9+G5Y2SHab6a7TFbP4pSVSqWwRGOrdhfo?=
 =?us-ascii?Q?1XLT/1Swrhl8NtDfpOVTp/AD98YccQBFtT0MXOcwGOn9LZy0UEUooSv4E/4j?=
 =?us-ascii?Q?WQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31c4690e-aed0-4660-915f-08d9f11e4846
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 07:31:01.3064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2MBoQirGuzHj+xmJXZ+EHz/BmVgMtlswERERYrSFUVXlmJD9lLpTDmwWpo8GpGgFr2XbcnUkTmstRoS8GtjdRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1364
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sameer Pujar <spujar@nvidia.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
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

Ok, Let me resync linux-next to clear the conflict and will resend patches =
with v3.

-----Original Message-----
From: Takashi Iwai <tiwai@suse.de>=20
Sent: Tuesday, February 15, 2022 7:04 PM
To: Mohan Kumar D <mkumard@nvidia.com>
Cc: broonie@kernel.org; lgirdwood@gmail.com; robh+dt@kernel.org; thierry.re=
ding@gmail.com; tiwai@suse.com; Jonathan Hunter <jonathanh@nvidia.com>; Sam=
eer Pujar <spujar@nvidia.com>; alsa-devel@alsa-project.org; devicetree@vger=
.kernel.org; linux-tegra@vger.kernel.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Add Tegra234 HDA support

External email: Use caution opening links or attachments


On Tue, 15 Feb 2022 14:29:54 +0100,
Takashi Iwai wrote:
>
> On Thu, 10 Feb 2022 07:50:51 +0100,
> Mohan Kumar wrote:
> >
> > This series add the support for TEGRA234 HDA driver support
> >
> > Mohan Kumar (6):
> >   ALSA: hda/tegra: Add Tegra234 hda driver support
> >   ALSA: hda/tegra: Hardcode GCAP ISS value on T234
> >   ALSA: hda/tegra: Update scratch reg. communication
> >   dt-bindings: Add HDA support for Tegra234
> >   dt-bindings: Document Tegra234 HDA support
> >   arm64: tegra: Add hda dts node for Tegra234
>
> Applied all six patches to for-next branch now.

... and now I realized that it's conflicting with the latest Tegra234 reset=
 stuff on linux-next.

Maybe better to split the patches to be merged through several trees?


Takashi
