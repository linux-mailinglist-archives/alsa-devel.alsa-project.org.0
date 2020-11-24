Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E68E12C1C48
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 04:53:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A3DE1678;
	Tue, 24 Nov 2020 04:52:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A3DE1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606189991;
	bh=bfcaLN0wSDByHBGBMKse/11fEz3wBMCRy18NofV9VmA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NoTSL5X35cJlGyKTVaRHpHjB5dYwYQ43AN2/L913SYVsW9jfhVd1kzQPVmPOr7x7G
	 pARltpHJ2p6se+7u6KQvZXTAiI5hUTE4x6cnjVt2T0jyUmsSfhqyf0d+rqA+cx0GfR
	 Si5JIaGtZAH1aDqREu489AWgYbCY44tAQCq0a0xw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB8D5F80166;
	Tue, 24 Nov 2020 04:51:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1582F80165; Tue, 24 Nov 2020 04:51:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B56EF8015A
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 04:51:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B56EF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="Ndo8k1xe"
IronPort-SDR: H8wFEDjqvZqUPea7oecTg19mI7SHijC116Hhs9nFxddFEebhxHxuODnGMzM+8Yw0IQvkkCh7xB
 uyBFFKiXX9qg==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="171982831"
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; d="scan'208";a="171982831"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 19:51:20 -0800
IronPort-SDR: fEKoTOCONw7hNfmftjxfKv/PQSKO8eHZGmQX/EVr5yqAcmXNW1b+eEBcIzxKu5NWk9Iv1xlMCM
 2/QK4pxQEz0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; d="scan'208";a="364877878"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga002.fm.intel.com with ESMTP; 23 Nov 2020 19:51:20 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Nov 2020 19:51:19 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Nov 2020 19:51:19 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 23 Nov 2020 19:51:19 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 23 Nov 2020 19:51:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBLq70fOmSdD0SvGut+VbM2vPypeGlleKVJDjnaDYPNwFwO2kuvusyxzyxj47N6WHWyMYiIf/s3uj82dN3DHYimkHjMIThC5BG4oeDb3bNuGv8Zv4Uq/E+Y3soViqcp3SbgOPdLqU0usrgs/AwooosH1lok8aiS1ghG3/P+K/Myr3R9CyZcou7Tkz04sHzBBWPcPxQk345zne7rGYYVPZD4kpjXYQo/uAp+SZa3joeGyBPM4mWrSjbsqw+Ae4TX5DvQAdoLpHhF2g7ltl0skCM7+EVkTbFxkph9vufl9Of/Hd8QYXU2rL7wIhc4GCUdWxhry7qNBw8vv8GtAywkFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfcaLN0wSDByHBGBMKse/11fEz3wBMCRy18NofV9VmA=;
 b=mqQFbsTn6LKb+XepUJdlVZYBw3P+GUt8EfPIaN740HLx7MJheZxq9skCNniYCTbbSOD7b3eqx5yYnnsKRBfI+MeFMZfSqVMjZuEXiswYEW1zicM4Ahvuk3sLKAuUajLUNV/DFKe/oY9wn9p+mWyM+lSkxvRrmPaTgR3Unf+cqRMkigldIEYybUw8KoR+HR01WPuY5tCkLJVoxMkK3HJ00Dh2ihISDEPxpno3UT+i2eVzcK6UjhYAYEMrHQy4nOtp+AKBnwj+tdDrz/6g96mTRcuxq/A9oNttAv3jkgzajLWpDnTzhUp5nom93670VGViAc45z0K4YCHrW3Vk66l4Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfcaLN0wSDByHBGBMKse/11fEz3wBMCRy18NofV9VmA=;
 b=Ndo8k1xeBVqAtwqDXmA6kVEEsSwN+pPb0ccPpII1pqhLFLI1yistIFFcBqb8ESBI591UkbgM9zxdyQw0De2lnb/V7q3lZ42ihIGRdmQimmVyjpyS2ntl878YxReifqOI/DH56f6V/2bzIIx/WxuNTv46NGS5PBcEeNJppd/9MMg=
Received: from CO1PR11MB5026.namprd11.prod.outlook.com (2603:10b6:303:9c::13)
 by MWHPR1101MB2206.namprd11.prod.outlook.com (2603:10b6:301:51::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Tue, 24 Nov
 2020 03:51:16 +0000
Received: from CO1PR11MB5026.namprd11.prod.outlook.com
 ([fe80::4820:6e90:3d0e:3b5f]) by CO1PR11MB5026.namprd11.prod.outlook.com
 ([fe80::4820:6e90:3d0e:3b5f%4]) with mapi id 15.20.3589.022; Tue, 24 Nov 2020
 03:51:16 +0000
From: "Sia, Jee Heng" <jee.heng.sia@intel.com>
To: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Subject: RE: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Thread-Topic: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Thread-Index: AQHWvLkz/K4udK7YCEaiWD6EQ6aik6nMeVcAgACNiCCAAPQdgIAIspZA
Date: Tue, 24 Nov 2020 03:51:16 +0000
Message-ID: <CO1PR11MB5026A81C4294BEF4EE5EF923DAFB0@CO1PR11MB5026.namprd11.prod.outlook.com>
References: <20201117080354.4309-1-michael.wei.hong.sit@intel.com>
 <20201117080354.4309-4-michael.wei.hong.sit@intel.com>
 <20201117155038.GO4077@smile.fi.intel.com>
 <CO1PR11MB50269CF832CD14BA2D2A883CDAE10@CO1PR11MB5026.namprd11.prod.outlook.com>
 <20201118145055.GW4077@smile.fi.intel.com>
In-Reply-To: <20201118145055.GW4077@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [218.111.111.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b4e7d0e-f5d4-4cb0-ea17-08d8902c31da
x-ms-traffictypediagnostic: MWHPR1101MB2206:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB2206784A736D3E275C17B416DAFB0@MWHPR1101MB2206.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h407S7sGkdsGJLtRlSpXY1358cN16Wxmhm3/rpmb/EfxhDM+S9Nx7tweVbePmPzV/sVnLdajxqKnlb4nInHD/Ct2qp+GPu84tkbNAwT47hMziLTeq80kFpGn5uLt8q5yAcRK9HYSVJDrYxh3kS10Fl4c2ayJT7KNOgK3sRFrtN/zgAcryOYmGKoXaFI9+PNIA2FsZUrrZd/h8cYvHdb91ZqNaN7qoF44kZ7JVy7yPVN091GNxx7zpJO+eAIw94W7n8EHv2oG/NCYGPDvjI9TivvzN23NMInFlMRlMyH0rajAFNju0Rsqx5zcpgcdmi7o6rVt+b6hrXHyqpOmXjjCykqiowOQsc7eoktYo96Vl/vwjX8ufW1HgP02QR5nT54V1LgK/bI+3WNA2ak6C7MMXBnBCfX7O2l9j6T00/YDWj1YTIiQ75YYUO6Q3tAD4hbfl8JgbOc4hjhnh1IxvLgqzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5026.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(66476007)(64756008)(76116006)(66446008)(26005)(66556008)(186003)(66946007)(966005)(5660300002)(478600001)(2906002)(52536014)(7696005)(6636002)(8676002)(4326008)(86362001)(6506007)(53546011)(33656002)(8936002)(6862004)(9686003)(54906003)(83380400001)(55016002)(71200400001)(316002)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?P5VAksLKnqCMsKgR1jnFIt2LuX492zBRKVny40QLzMkDlIwgQSJdL+XZGcEr?=
 =?us-ascii?Q?oPQDiNEhd5cEey1zKsBS8yaKSZooEcuF3PFLm9jw/jMl16yfpNAbbYVDt9A7?=
 =?us-ascii?Q?pbeSLk+R5shfx1r48tHMvErOItMwt4KnNI4ScMwq3bIjuwTOqilcp86hAX8y?=
 =?us-ascii?Q?K8C8h/q93bXTqqPiII3pg5nyqyek83wA+eHcn7jzyn7U7C3eBOWoXj91ikSm?=
 =?us-ascii?Q?T6/7mGYT9efHLKGKhEcCOv6U4JQXQ/AxV6dBZGrhQZciS8gzE1SYpeqKE/TU?=
 =?us-ascii?Q?Ph0C1N3nv/ne0W66M+wXEaWH4z5ukFr4xp+jrcSKKOVcDZ+w+eYVX0IRZEYH?=
 =?us-ascii?Q?JDx3deodkm45YDDBa+1kKSMEQEM/wW4cvae/6+ISOY2FPsTYEHshb0eGX2Za?=
 =?us-ascii?Q?ZKzMBzJgB9uVYDr8XV6a2fD5i+o4mxBHhSE9J52j2wYxoLmUBkjr+ePzUSCq?=
 =?us-ascii?Q?Zdl/Ow5SrHYxnawbVU8k+9krNmpeltCCntuDZy2DVigZhOLbLTrEmeNOhjc3?=
 =?us-ascii?Q?7bWiaLkKpMFX8QrV/l5/yR4eZ4PgDpSa8e39C+xUc+Q9GDdWZumBNt/XQsnz?=
 =?us-ascii?Q?QYw0Mxfl7uiCzVIN5JjCTXjUPt5JstKgtQ4GBaKqrMRJFdNSjZIQTa/ioEHR?=
 =?us-ascii?Q?nUnoz4I0BsS9p9pxyYTbMD7TyxVnFY2eA+n/gbG08/k6Q7YcwbaHk5y0leee?=
 =?us-ascii?Q?5OwEObJkOezHazAttUkCBlhy/8Vy4i0fE2M45Vzpbzffki8463fHGaaLoD/j?=
 =?us-ascii?Q?e0TFNCAn/F/c6miVwF3XO4SmbYfDZSoHBx8DkrLlhev20MUXbWKB6j3ycEgA?=
 =?us-ascii?Q?moRwSG0AISkPMxVNVJA02guvElCDsZn4HK2CVQo5XLpsN0hHOwMECrMSFP40?=
 =?us-ascii?Q?r4d8l+0vQo4/cy1stE6wbvBjs3kw8Ya4+yZW2TyXfxFLE1Iw32GfKJ1Z43Jm?=
 =?us-ascii?Q?6aGEKYCA2PKKA/5E+B5GqSG/jpbPt/j5moM/Tyu4HiE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5026.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4e7d0e-f5d4-4cb0-ea17-08d8902c31da
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 03:51:16.0812 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 16OdDnAdlP61qt/Yj5qFsXJi/rDahHXCGMz6PWrwMQLtY19qt/hRkuzKyYth5AZaN0Py5z+Qni2G75MPeeekWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2206
X-OriginatorOrg: intel.com
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "Sit,
 Michael Wei Hong" <michael.wei.hong.sit@intel.com>
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



> -----Original Message-----
> From: Shevchenko, Andriy <andriy.shevchenko@intel.com>
> Sent: 18 November 2020 10:51 PM
> To: Sia, Jee Heng <jee.heng.sia@intel.com>
> Cc: Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>; alsa-devel@al=
sa-
> project.org; tiwai@suse.com; broonie@kernel.org; pierre-
> louis.bossart@linux.intel.com; Rojewski, Cezary <cezary.rojewski@intel.co=
m>;
> liam.r.girdwood@linux.intel.com; vkoul@kernel.org; lars@metafoo.de
> Subject: Re: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
> prepare and submit function
>=20
> On Wed, Nov 18, 2020 at 02:34:22AM +0200, Sia, Jee Heng wrote:
> > > From: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > Sent: 17 November 2020 11:51 PM
> > > On Tue, Nov 17, 2020 at 04:03:48PM +0800, Michael Sit Wei Hong wrote:
> > > > Enabling custom prepare and submit function to overcome DMA limitat=
ion.
> > > >
> > > > In the Intel KeemBay solution, the DW AXI-based DMA has a
> > > > limitation on the number of DMA blocks per transfer. In the case
> > > > of 16 bit audio ASoC would allocate blocks exceeding the DMA block =
limitation.
> > >
> > > I'm still not sure the hardware has such a limitation.
> > >
> > > The Synopsys IP supports linked list (LLI) transfers and I hardly
> > > can imagine the list has any limitation. Even though, one can always
> > > emulate LLI in software how it's done in the DesignWare AHB DMA drive=
r.
> > >
> > > I have briefly read chapter 4.6 "AXI_DMA" of Keem Bay TRM and didn't
> > > find any errata or limits like this.
> > [>>] Intel KeemBay datasheet can be found at below link:
> > https://www.intel.com/content/www/us/en/secure/design/confidential/pro
> > ducts-and-solutions/processors-and-chipsets/keem-bay/technical-library
> > .html?grouping=3DEMT_Content%20Type&sort=3Dtitle:asc
> > Pg783, "Programmable transfer length (block length), max 1024". Sub-lis=
t can't
> exceed 1024 blocks.
> > BTW, I think the 16bits audio could be a confusion because it is not ab=
out the
> number of bits, but rather the constraint of the block length. Base on my
> understanding, Audio needs a period larger than 10ms, regardless of the b=
it depth.
> > The questions here are:
> > 1. Should DMAEngine expose a new API to constraint the block_length (in=
stead of
> size in bytes)?
> > 2. Should DMA client re-split the linked-list before passing the linked=
-list to
> DMAEngine.
> > 3. Should DMA controller driver re-split the linked-list before executi=
on.
>=20
> Since we have DMA slave capabilities, the consumer may ask for them and p=
repare
> the SG list accordingly.
>=20
> Above limitation is a block size (value of 1023 is a maximum, meaning 102=
4
> maximum items in the block of given transfer width). So, like DesignWare =
DMA
> (AHB) has up to 4095 (but I saw hardware with 2047) or iDMA 32- and 64-bi=
t have
> 131071. There is no limitation for amount of blocks of given maximum leng=
th in the
> LLI!
>=20
> No hacks are needed, really.
[>>] Hi All, can we have the agreement that DMA clients should optimize the=
 linked-list
[>>] by retrieve the DMA capabilities from the DMA controller?
[>>] I noticed that Vinod voted #3 but Andy voted #2.=20
[>>] We need your decision to move on.
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

