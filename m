Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 167312C8188
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Nov 2020 10:59:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F26A173F;
	Mon, 30 Nov 2020 10:58:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F26A173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606730367;
	bh=9fhfRXifZgKdHogvmAhQebe+QmkI4Bwp2iHc6MewfO8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N/yGZIta31HKDU5aXDD6P+Um4nCUPCjewhKTEJT3bathcgyoLxILlQHxSkDIzV72K
	 GsJ2v2iQagLCU90YVPyY8kSgKmtpuLwg3OYnSgJIr052eVJ0RpZ+F+JOBsoTqm4zpA
	 GsxZFnS8mxFOqU1ms4Z0mRmzxVICa+7IMV+2PTbQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F253FF8049C;
	Mon, 30 Nov 2020 10:57:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAA9BF8025F; Mon, 30 Nov 2020 10:57:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9B69F80247
 for <alsa-devel@alsa-project.org>; Mon, 30 Nov 2020 10:57:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9B69F80247
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="N6DumVNq"
IronPort-SDR: hKtE/EpkZ1B9igp3lCM/k/1ufApsKV4qEZWoIznT+njM5xm4qfuc85LgXPwtbg89m3bQdjBPhu
 tr2dHk5FPdaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="172768134"
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="172768134"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 01:57:17 -0800
IronPort-SDR: FkC/rHZA84yOi5P2vFk09z10RwiHQh6AGPwMrbpQboAxs6eN36zaVwXs4zaFpG+9MliTBDEkEV
 TTzRqhbqqo/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="315179827"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 30 Nov 2020 01:57:17 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 01:57:16 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 30 Nov 2020 01:57:16 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.58) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 30 Nov 2020 01:57:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSe0rRj88FRu62Nwx2PuJ8j3K2mTB9wYUOFoEwC55VJqAvC1b1V0/yEs+d74ppJiKE8xOYhJmtqVBjjYmHuPYVScDGZF0q6W+erQrAJYVMDUXAndufRAgFdNKU+e8Lia+3U6CypPXUbuxlScQLuESBvYyIOcph6Qr1EOFA0rcRbNGOgxhcAb74F+wiLcNo2Wp/abIdN5kFNxDbOGT+gj91rbHVGWIEQeJSNG2qp0a8XnvASGkZcPXTs0s7XEkB8ihbZaAPvzv0gITkVXjvtGo5RUBIospmQVuAUCYYiPJuE+ARjuMvwPEA7oiQafOaRZfjVQUYV4JetxUKStX9lOVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fhfRXifZgKdHogvmAhQebe+QmkI4Bwp2iHc6MewfO8=;
 b=LnvII9v+P6tyH5FByfxJPNicufpIBDl0d2c7g+SsL0xnpb5X+2UOtpZBz/eoJFBSyuQbUOYLe0EbCMLUyMNn3pISr/WHiTNYLxFu+1AJ66bPsEeRg7HU3BJNNPiMCDIJD8umBK8zOHpVCfR/kUgVV7ckHhntSNfZW3iI8J4T194syFSL8zAaUNIF4Afcc3pKYLBIeNrY4NeYZlUPVmwUi0YIgjdiud3EfEcCb2EfQMQgZtt1ulsG3NqJ/wQZZtarQCNhAPBpqaOrjNq3u+fbxVHAOJi+E5hLu5M/4CV6llZQ3T1hyNDZ8mowbyhK3Qd5nyZoCDgmCjrQPlOloycHcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fhfRXifZgKdHogvmAhQebe+QmkI4Bwp2iHc6MewfO8=;
 b=N6DumVNqWCfJTOoES936c6uLqPchyT7xHg9L1Z0Cv2Sbgc5TZECVF0CYY2jHRA1O+VuLx7gkAh1XTAJUO+5GvEMqReRlNOLMJTxpXVbiMNPw133IURXeZ1hXW6fc68NblpuRXL/qvJrDYpHfMnV7ODP/7pOAPr/Kn6qEkiGA6qU=
Received: from BYAPR11MB3046.namprd11.prod.outlook.com (2603:10b6:a03:86::18)
 by SJ0PR11MB5216.namprd11.prod.outlook.com (2603:10b6:a03:2db::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Mon, 30 Nov
 2020 09:57:01 +0000
Received: from BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::b544:5491:32e8:f230]) by BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::b544:5491:32e8:f230%3]) with mapi id 15.20.3611.023; Mon, 30 Nov 2020
 09:57:01 +0000
From: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
To: "Sia, Jee Heng" <jee.heng.sia@intel.com>, "Shevchenko, Andriy"
 <andriy.shevchenko@intel.com>, "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "Rojewski, Cezary"
 <cezary.rojewski@intel.com>, "liam.r.girdwood@linux.intel.com"
 <liam.r.girdwood@linux.intel.com>, "vkoul@kernel.org" <vkoul@kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "broonie@kernel.org" <broonie@kernel.org>
Subject: RE: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Thread-Topic: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Thread-Index: AQHWvLmNGvsTxGs990eX9gpk7gsGM6nMeVYAgACSVQCAAO9RgIAIta8AgAnQR9A=
Date: Mon, 30 Nov 2020 09:57:01 +0000
Message-ID: <BYAPR11MB30465A81744EA686D2502DB69DF50@BYAPR11MB3046.namprd11.prod.outlook.com>
References: <20201117080354.4309-1-michael.wei.hong.sit@intel.com>
 <20201117080354.4309-4-michael.wei.hong.sit@intel.com>
 <20201117155038.GO4077@smile.fi.intel.com>
 <CO1PR11MB50269CF832CD14BA2D2A883CDAE10@CO1PR11MB5026.namprd11.prod.outlook.com>
 <20201118145055.GW4077@smile.fi.intel.com>
 <CO1PR11MB5026A81C4294BEF4EE5EF923DAFB0@CO1PR11MB5026.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB5026A81C4294BEF4EE5EF923DAFB0@CO1PR11MB5026.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [14.192.243.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89cce808-0321-4d66-b884-08d8951648d0
x-ms-traffictypediagnostic: SJ0PR11MB5216:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB5216A85DB1D64044EE68727B9DF50@SJ0PR11MB5216.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gFgiwR0Ik7eXiNqFEdh1DgFTTkx+RQmFFCwUc9ZFXB5oCkY9mQ6dh49ZCw8JJfC9fMlkfG/XFqe/mUJ1pSLmNzzbgG3DSqhlJ0sKSjCjsdCXbwrBrlMjAEFyMiwd0mf957upaE0RA3caLXvrg05Ime6+aqlnsRzd6VynAaOxIDrTsyqwb0Zx6ihRW3ZXChzn6u2mFcyJTpIWb1qFK+BPmkDJzd/dXTPxKASJgTOzR8eEeaOS5EAwkjpwz1uytcVuG8QKa+O91YjEqKX3Qv3+bghbMJOaktzCtLCNvhxhkDmEEBYF03BVeX8n2k40pi2NsOaBAW981gXN9oUELev8HTZs6jzQxK6tZwtu7qufJXem6kv4scwqbu1FAdMVFOC2cwj/l1IdEk2r8zJLD+Ca2falBPlD4WTMm9l2Nn2cCkgr4BQs0u/sPPiBMq/Mb7wQ3Ne7TdNsocpFmnMq+b7XP1z28VzsOM78+wBFeKUudkg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(6506007)(66946007)(9686003)(5660300002)(86362001)(7696005)(71200400001)(4326008)(52536014)(53546011)(8936002)(316002)(921005)(186003)(64756008)(2906002)(26005)(966005)(66446008)(8676002)(66556008)(55016002)(33656002)(478600001)(54906003)(83380400001)(66476007)(110136005)(76116006)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?73hPsBFS5x3y2sbBf4gQ++FTRHzXqb5IO+l77DKFJSxYyubCzq9rY8ORwOVk?=
 =?us-ascii?Q?Cq/4UBxczJB76nnDJhX2QJga5i00eu2zgXeGgOu1qcp/osWbPVKSfxnD3QIc?=
 =?us-ascii?Q?MnnTEA+EHkSv19Ygh6gvFdodzCHO7G2TOToCtOlUUzA+xbI2xmJq47RXK8DI?=
 =?us-ascii?Q?3LQXdRCogOIp1rE/7Q8GL4+wdIuVJy+sp9Zt/Gj0Sokt7NFJF6cm39rKoX/A?=
 =?us-ascii?Q?Sc7mQwLBgsXCT5z0f4P4FoC7DrVAaMaKUfLEHW8aFLsrbschFQRUF3IyVXka?=
 =?us-ascii?Q?MCJUT/AAkuS+ap3UFlR1R9I4W8QMPiptfmOdvd8OkmIyxsfsom7iP5HTlkYo?=
 =?us-ascii?Q?6Nm6e2gyzBAAyvIe9n63RBW3SoDklzTEMDb9+F45FcmSd9+LU6RQjkffy0pK?=
 =?us-ascii?Q?6fNcZneG9cmevtuWfKhQnlhv89lxxiohvgzzZO9GGiXqtpgIlUv6nMbMiRin?=
 =?us-ascii?Q?/l1ygDwb5VndDFCIdogwP6olt0taLnJUCudUY7hDJB2O9NbZsxYLiBx0BeOF?=
 =?us-ascii?Q?1Q58naqgy5b1LRJgMALAxLlwLqRJ5Njxk61bl0VCdSjFD9nvsDSlNpUPR4hd?=
 =?us-ascii?Q?23kOVpPww7P7mivfdsDneHxQaaOg7BUPtVA2t8SosJw6YA/dyhu8os+m2Zlk?=
 =?us-ascii?Q?E7iWGwAAODgvgVYSYYHE04bjFeJlfAun6tOES/i/QPECGEtl6vf3dNdMpidl?=
 =?us-ascii?Q?bcwoT5enFhdjEwEFyQxqz6G4M2kKyz496/U077izBamazzmDGfDVEyMUBkG6?=
 =?us-ascii?Q?rjV7KdpE1hWtRAdgOxQ1Ekh1BWMhFDxDVkV4+EbpxdbLV1bJ6HS+InkChnR7?=
 =?us-ascii?Q?46QeaPhYsFjMHdcR7rjzf+5vOPjjPi5ZfbdTkindsVbYArE1dEfJteSbb2sV?=
 =?us-ascii?Q?Hu4LsUNCcu7CCxZnHMBAVmRl9JyuzHgctA+pICdUQOYeCbupy/WPY6YTpj9p?=
 =?us-ascii?Q?yMPjtawhKI0GYDs5G8g3/Q+naI/SzJOUbuG/lVk5bX4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89cce808-0321-4d66-b884-08d8951648d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 09:57:01.5563 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C1XRauYj1SNLGxUPrifggLGrFndzt3o5BWCuHI9FHUBdDv0SXig+stwS/6440GneEdoN5i8lpbqnZNab6uN9hd8A8fqHHQo953s1HkZqyAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5216
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>
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
> From: Sia, Jee Heng <jee.heng.sia@intel.com>
> Sent: Tuesday, 24 November, 2020 11:51 AM
> To: Shevchenko, Andriy <andriy.shevchenko@intel.com>
> Cc: Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>;
> alsa-devel@alsa-project.org; tiwai@suse.com;
> broonie@kernel.org; pierre-louis.bossart@linux.intel.com;
> Rojewski, Cezary <cezary.rojewski@intel.com>;
> liam.r.girdwood@linux.intel.com; vkoul@kernel.org;
> lars@metafoo.de
> Subject: RE: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm:
> Add custom prepare and submit function
>=20
>=20
>=20
> > -----Original Message-----
> > From: Shevchenko, Andriy <andriy.shevchenko@intel.com>
> > Sent: 18 November 2020 10:51 PM
> > To: Sia, Jee Heng <jee.heng.sia@intel.com>
> > Cc: Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>;
> > alsa-devel@alsa- project.org; tiwai@suse.com;
> broonie@kernel.org;
> > pierre- louis.bossart@linux.intel.com; Rojewski, Cezary
> > <cezary.rojewski@intel.com>; liam.r.girdwood@linux.intel.com;
> > vkoul@kernel.org; lars@metafoo.de
> > Subject: Re: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-
> pcm: Add
> > custom prepare and submit function
> >
> > On Wed, Nov 18, 2020 at 02:34:22AM +0200, Sia, Jee Heng
> wrote:
> > > > From: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > > Sent: 17 November 2020 11:51 PM
> > > > On Tue, Nov 17, 2020 at 04:03:48PM +0800, Michael Sit Wei
> Hong wrote:
> > > > > Enabling custom prepare and submit function to
> overcome DMA limitation.
> > > > >
> > > > > In the Intel KeemBay solution, the DW AXI-based DMA
> has a
> > > > > limitation on the number of DMA blocks per transfer. In
> the case
> > > > > of 16 bit audio ASoC would allocate blocks exceeding the
> DMA block limitation.
> > > >
> > > > I'm still not sure the hardware has such a limitation.
> > > >
> > > > The Synopsys IP supports linked list (LLI) transfers and I
> hardly
> > > > can imagine the list has any limitation. Even though, one can
> > > > always emulate LLI in software how it's done in the
> DesignWare AHB DMA driver.
> > > >
> > > > I have briefly read chapter 4.6 "AXI_DMA" of Keem Bay TRM
> and
> > > > didn't find any errata or limits like this.
> > > [>>] Intel KeemBay datasheet can be found at below link:
> > >
> https://www.intel.com/content/www/us/en/secure/design/con
> fidential/p
> > > ro
> > > ducts-and-solutions/processors-and-chipsets/keem-
> bay/technical-libra
> > > ry .html?grouping=3DEMT_Content%20Type&sort=3Dtitle:asc
> > > Pg783, "Programmable transfer length (block length), max
> 1024".
> > > Sub-list can't
> > exceed 1024 blocks.
> > > BTW, I think the 16bits audio could be a confusion because it is
> not
> > > about the
> > number of bits, but rather the constraint of the block length.
> Base on
> > my understanding, Audio needs a period larger than 10ms,
> regardless of the bit depth.
> > > The questions here are:
> > > 1. Should DMAEngine expose a new API to constraint the
> block_length
> > > (instead of
> > size in bytes)?
> > > 2. Should DMA client re-split the linked-list before passing the
> > > linked-list to
> > DMAEngine.
> > > 3. Should DMA controller driver re-split the linked-list before
> execution.
> >
> > Since we have DMA slave capabilities, the consumer may ask
> for them
> > and prepare the SG list accordingly.
> >
> > Above limitation is a block size (value of 1023 is a maximum,
> meaning
> > 1024 maximum items in the block of given transfer width). So,
> like
> > DesignWare DMA
> > (AHB) has up to 4095 (but I saw hardware with 2047) or iDMA
> 32- and
> > 64-bit have 131071. There is no limitation for amount of blocks
> of
> > given maximum length in the LLI!
> >
> > No hacks are needed, really.
> [>>] Hi All, can we have the agreement that DMA clients should
> optimize the linked-list [>>] by retrieve the DMA capabilities from
> the DMA controller?
> [>>] I noticed that Vinod voted #3 but Andy voted #2.
> [>>] We need your decision to move on.
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
Hi everyone,

Is there anymore comment on this RFC?
We will be using the ASoC framework to split the linked-list, since resplit=
ting the linked-list in DMA is a no go.
If there isn't any more comments, we will push these patches for review and=
 merging.

Thanks,
Regards,
Michael
