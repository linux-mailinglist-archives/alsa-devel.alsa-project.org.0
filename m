Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F077F240439
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Aug 2020 11:49:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71F331667;
	Mon, 10 Aug 2020 11:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71F331667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597052964;
	bh=enUsemuBwSRxpyjOpqUpVCbIxPpC7IkjzNh/9VKMXX8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rHHtndTgihmvJjb02L2r3mISOVBO6CXU+iNMR4mXKS4yNCpYy74G2w7kiD3d01nAu
	 cDkJszeS9zlGrA65978s9tfEguFUFZOYcDFzCmC0FxKTaGXD5q42XdE2y+mJdjisL5
	 y4qFTx+7gxQe5/7zlovE9ohlAJpnijeRmMDHoTZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A5FDF801DB;
	Mon, 10 Aug 2020 11:47:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E3EFF8022B; Mon, 10 Aug 2020 11:47:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2705CF80085
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 11:47:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2705CF80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="T9xGXtBA"
IronPort-SDR: DKakov1WaJvoA7vxU7pO968bZtKJ/717ZhxQwXH/WiZ0zRxaB0QmcxSVJp0ys0FT+SsPi1D1tu
 MXkeooqkN+VQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9708"; a="141363643"
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; d="scan'208";a="141363643"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2020 02:47:24 -0700
IronPort-SDR: VM3O3zXWtWQYyHGTkIuliC6z0C+ndwec32MHfp4WK671OnS1W4joH/xYl89YzTlzP90qv/Wk4C
 X87vr/SZRXbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; d="scan'208";a="332159224"
Received: from fmsmsx603-2.cps.intel.com (HELO fmsmsx603.amr.corp.intel.com)
 ([10.18.84.213])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Aug 2020 02:47:24 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 10 Aug 2020 02:47:23 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 10 Aug 2020 02:47:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Mon, 10 Aug 2020 02:47:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SB5zzC3GjGtML4K4wLEsa/hMr474nvHj6jtjWn7F1C4xsRZ1nLFBX0lhI95KN80clv22LRgFAsnOeSyU1p17IGFLvmtUDdeAaNYD+BzP4Sk1EffCxt1veofegYO1caWyPaSmtRctyWGxLeGV3MHjVokI++TpCCADZ0XlMq4aqODcH62xMLS3yu6NlWXolzC2MkkjfKnTxQ6q+BGqhs1JTNvGamqVBfMaEEW6fmDEIOEcUCnJttKBUjia8wcGlaCiX93Fsff0aoWCSsrlQYNijqVYumhlIqzCcaTI8zuHAgN1SBgNX88xjxNJxg1CgRP5/5R3FqTd7iIewO4bW3Qg/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Trp0bIrrVAJRAVPdHncIEhpcxbIQ4ofFvlVg/txzFUU=;
 b=D7Ab3tkokzwK5MYr6Ft6SpwOrigs+ukxhaLQnpkr39RVZSw6BC6uh8JGF60WfRCQgQxHuLLJ08bUSlb2uVHQna7tbsO6rUN9TY5f7U1KYIiXT7rlH+4qd3z92yQRF84BVeyP29Egfz0jH2o5v/T5eAMCbXeEPLvrnGGP2c3xqdpaSxJ28DWedKcajNLvBl3qRa+vcJBmOIehzWGxhCZ4k94CTtwYpD26G4WT31ygTIN9q/XNBSbathBzwUJ9xrpg4tKK/dkNMm8GjKUZfAzPX5/cSXM6KhrlAH19C0tNO0CcbVhgtYp4d4agv3j1WXA91dpcXRXAzSnsR4Ie3W777w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Trp0bIrrVAJRAVPdHncIEhpcxbIQ4ofFvlVg/txzFUU=;
 b=T9xGXtBAeL3qE3kx/i9cYhWRP+iDdOhXWRV8X/lkF2YsUpjaqpnz4N8ZGgx/WFnm3xgV3wsfpE9AYVgFpf1ksBTEpe2VDgJn5RCjNsTlSkPjBeyAhOeZb5N9xUEo8tXq8iTO8/Rxw10lRtGsmArpATnjY2GEhNFEIWmOUg67aqc=
Received: from BYAPR11MB3046.namprd11.prod.outlook.com (2603:10b6:a03:86::18)
 by BYAPR11MB3495.namprd11.prod.outlook.com (2603:10b6:a03:8a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Mon, 10 Aug
 2020 09:47:15 +0000
Received: from BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c]) by BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c%3]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 09:47:15 +0000
From: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 4/4] dt-bindings: sound: intel,keembay-i2s: Add
 channel-max property
Thread-Topic: [PATCH 4/4] dt-bindings: sound: intel,keembay-i2s: Add
 channel-max property
Thread-Index: AQHWZmTSECd6XhR1kUiCjOuunRmPnqklpW/ggACVP4CAAP0SgIAAplCAgAE1hHCAA65hgIAEZ0wQ
Date: Mon, 10 Aug 2020 09:47:15 +0000
Message-ID: <BYAPR11MB304699F4BE93C6DDB9620EFD9D440@BYAPR11MB3046.namprd11.prod.outlook.com>
References: <20200730055319.1522-1-michael.wei.hong.sit@intel.com>
 <20200730055319.1522-5-michael.wei.hong.sit@intel.com>
 <20200730112948.GB5055@sirena.org.uk>
 <BYAPR11MB3046DD82FAC2B5C672FC85B29D4D0@BYAPR11MB3046.namprd11.prod.outlook.com>
 <20200803104917.GB4502@sirena.org.uk>
 <BYAPR11MB3046E41085E470BFB11D710B9D4A0@BYAPR11MB3046.namprd11.prod.outlook.com>
 <20200804115019.GA5249@sirena.org.uk>
 <BYAPR11MB3046BCAFC8335E7841DE8EAA9D4B0@BYAPR11MB3046.namprd11.prod.outlook.com>
 <20200807143101.GL5435@sirena.org.uk>
In-Reply-To: <20200807143101.GL5435@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [121.123.85.241]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc83a1dc-0499-4951-c5bf-08d83d125d59
x-ms-traffictypediagnostic: BYAPR11MB3495:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3495F699BC90EDBCA6F0BB309D440@BYAPR11MB3495.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RanJCpEoWlS87DdLDvQir+GgAhDPNl45YKs7qqM3640qGZXKNgV/skD7RAUIYB0K8UIVXEw8cddS72k64gfNwOQAIDZNGTKXhKcwDvFYgpCYxticz05H6fVll/bv7JCCtgvg945a5xuTg0QFeG9T9MbRlvfcCDfyvV7HCyiYqc2j9tukF5cH1xvundby69xzO3HMS4h8MZc6zgDvLv8JVwRIjw5nPphxsm7nYjz2xuqiyDhsIk/OxhhcXLcEQ8wcFP6ETvAXlPVlB7lcw3tSLMEA4v3aYyjgSCmeIxT/4A/webkccdFxtFy2uQ+uytvLqEJMKuX7vxKSrMaDaROqJ/uBVnXufqLtNFY1OhObBVkK4CaJb9tK+x+qzeSaDqhb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(6916009)(52536014)(54906003)(71200400001)(4326008)(83380400001)(26005)(5660300002)(316002)(8936002)(33656002)(86362001)(8676002)(7696005)(478600001)(76116006)(6506007)(66946007)(66476007)(64756008)(66446008)(66556008)(186003)(53546011)(2906002)(9686003)(55016002)(142933001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: l0m1oc/SPKnguJPmfMB2evv6xMdCa8t/88p3Bo/BDuZcX9UruyfYBYKBeygI5PNnEKDJCfe97RxVJl0aWyUI6pe41vHjJQcbSEPhEOPvF0HUFuuUU6m0iOKNDRhAfgQp2HHbQ3kEvCyPihm+nFEYC0zP941/mj/bXeF0Sk+bv3HwD64wfsfM1wPfNsfrR8k8qCs9BOGH8IzplFO9+QvkL8maE5AYzevY2wwtoh/TWp+OUX9H+DFnjO2ltnOvxs/XpmppfuHvretXo9RxDMXYkmBu1wpNPmHILW1d2jlNNvUIZSsL6CRVbZ7twWn+hhbim6eKRk6BtlIZunw77KglOOKfQ+yASxnYJg02uOgP7dkr1hLh6xkF63RF+o9GYc1bUgJMOzgksEXER/L5qHgIzLMRJd1YCEMy2Z+UAtDRPhpQG0XmcH+Y+0hebiNVAMcBnsSFL3HWgDCXgAtnUUGF2mp4uuPZe/Es44rwQebeqd86GmEX9Dc1z0RbYQm127uIJ6TOJFN0EtdWtM0oD16OPbgHvd9fhjfbvWMBfKRi2vDPNuSOKjfXqEFcyVOOeTQkEHfC67f//Zvn1yMw8K3r6EuY9WSRTkknRBGECzkWaZhh6aoH3r8eH4MoGjdhPyT9tPD6EqD74WZ++uv6QARWKw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc83a1dc-0499-4951-c5bf-08d83d125d59
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2020 09:47:15.6735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uFDu7wL3jgHP0l6E912gB1LN9QVLV34UAbtAlZzO3RPCm13HEO4gjtOaRif6whDVvsJphHp+7dNdkh749cVYjNaNtsEVYsDqopX4OB36nXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3495
X-OriginatorOrg: intel.com
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, "Shevchenko,
 Andriy" <andriy.shevchenko@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Sia,
 Jee Heng" <jee.heng.sia@intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>
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
> From: Mark Brown <broonie@kernel.org>
> Sent: Friday, 7 August, 2020 10:31 PM
> To: Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>
> Cc: alsa-devel@alsa-project.org; tiwai@suse.com; pierre-
> louis.bossart@linux.intel.com; Rojewski, Cezary
> <cezary.rojewski@intel.com>; Shevchenko, Andriy
> <andriy.shevchenko@intel.com>; liam.r.girdwood@linux.intel.com;
> Sia, Jee Heng <jee.heng.sia@intel.com>
> Subject: Re: [PATCH 4/4] dt-bindings: sound: intel,keembay-i2s: Add
> channel-max property
>=20
> On Wed, Aug 05, 2020 at 06:21:14AM +0000, Sit, Michael Wei Hong
> wrote:
>=20
> > > Are you *sure* that's the only difference, or is that just the only
> > > difference you know about right now?
>=20
> > Yes, I am fairy sure that is the only difference according to the
> design, as per the platform use case.
>=20
> It would still be safer to have a separate compatible, it wouldn't be
> the first time that additional changes that the hardware people had
> failed to communicate were discovered.
>=20
I will create a separate compatible string in the next revision of the patc=
h.
Since part of the patch series has already been merged, do I send in the ne=
w
patch as a new review or on top of these patch series?
> Please fix your mail client to word wrap within paragraphs at
> something substantially less than 80 columns.  Doing this makes
> your messages much easier to read and reply to.
