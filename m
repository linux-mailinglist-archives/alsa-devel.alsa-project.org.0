Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C158239D56
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 04:01:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6C651668;
	Mon,  3 Aug 2020 04:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6C651668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596420072;
	bh=1IlM9nVeNx1IwGla88JBtcLgk4y29aBmBKQ6yrPFYf4=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lS/412hkUh7mDqLwl/vrfSji20s/nvDSQvXntuajvf/AMBiHxUWP1g3Qc49qD2BbC
	 /M7NFEiRRJvHYHIXoktq7My9QFC4oGqiAhzJ8kmZO15mvRMOSk1c6u7RowB4t1VQzC
	 ozdKmS7iI6NigOOGkDVV7SoU9B9mOCGBt/oymmhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F127DF801F7;
	Mon,  3 Aug 2020 03:59:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6659F80218; Mon,  3 Aug 2020 03:59:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DCBEF80148
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 03:59:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DCBEF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="O7lMoaoe"
IronPort-SDR: yF36OxUMblgDrMR0rDhCNylAOW9pTwdnj3ZuWs97RbtzJgBcsG5ki4C38qCN/amCtmxMNMjQXo
 qlpBJ5U+mQDg==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="139610836"
X-IronPort-AV: E=Sophos;i="5.75,428,1589266800"; d="scan'208";a="139610836"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 18:59:20 -0700
IronPort-SDR: hBtqyKqOKXXx0Fl5jQGycvjlTmReD+gJ2YjLg6KICaEcD/1p9pUShqCy1LdfTEfqJJaQfKbgWl
 7RWaN71nFVYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,428,1589266800"; d="scan'208";a="395905237"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga001.fm.intel.com with ESMTP; 02 Aug 2020 18:59:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 2 Aug 2020 18:59:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 2 Aug 2020 18:59:19 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 2 Aug 2020 18:59:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 2 Aug 2020 18:59:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=goL1TkQDJYTrt6KQQvIBhTO+iJ73ulQFaYFbz3a021IsmbtKylKYotaykIHw1EuPdvMZ0NKQzQRyR9Rk8vtQdQiUP3+2k95qa7rT5rctwOTKbmmy0cDZ/F8amXXqZy+5bZ+16v6gpdGPceTPHGc7Xa0yp+X7Lq3hYeNpE++TNjbdxuhYeRswjek/pQ78YQ+Jr6drFhK+X19eb72h37KMIrQr3gJUomtE7+IrSm1lMKS5e+eVOgXhkhVk1cQVdDoYZbvAUwUCqKShkbOQfEP0LSb4fdMUSOayRC05mAReBXv0ZN/+P+48NhUsMO+mnM/CPUe/+uZcCs0xDJn3lxaucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6R4cotXCnGoUFZybyH03Zn2i9RIpbtNiipLIwgKuS8=;
 b=PdtgtJzNtUQfDvYuj9SaGNpx6d7wdqc2MhIeLDsz+rcRcoVZsXhEBpHHI+BQPOIJG+he8C4ZZXCoooq3qmz9AM7mxKsDUFWAJY3KSF4dko8cEIFLSzJT/TqVc+S5G69ENoqXktJSGPOsXs9TBxhNitCKrzECAqS8ETu58rnb8fbM1coT4GGghMsmKNYVE2znBkJjqR/wRb3tOHjKM03oqQr3cIfTjVroVCOl/FBtnOcghnKwaGwtGDpndBcguLAJjxmVLBBk2KoEvGHdzYkVKRyJeWt3pzqh53WVmSqDX4PImrH3YHnDr47ha5AXF19W8ZlggH1sBCaXDSXpGuK+BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6R4cotXCnGoUFZybyH03Zn2i9RIpbtNiipLIwgKuS8=;
 b=O7lMoaoebJ6/SoqVaUT+1IjR4IwAyZU6o4SG/ArnM8HegG/FGqfqknfYe6D7+lceSwfSiFbUHMM2hRp7S1/ODshiUXcTllsW1FDLARFlZ8L1f+Gd/ed3ITkkW3MVkJ3yKlM9m8Q5T/srl48hnoQAsQ2xbRnVZTLkX3vof7fRllI=
Received: from BYAPR11MB3046.namprd11.prod.outlook.com (2603:10b6:a03:86::18)
 by BYAPR11MB3384.namprd11.prod.outlook.com (2603:10b6:a03:75::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Mon, 3 Aug
 2020 01:59:10 +0000
Received: from BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c]) by BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c%3]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 01:59:10 +0000
From: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 4/4] dt-bindings: sound: intel,keembay-i2s: Add
 channel-max property
Thread-Topic: [PATCH 4/4] dt-bindings: sound: intel,keembay-i2s: Add
 channel-max property
Thread-Index: AQHWZmTSECd6XhR1kUiCjOuunRmPnqklpW/g
Date: Mon, 3 Aug 2020 01:59:10 +0000
Message-ID: <BYAPR11MB3046DD82FAC2B5C672FC85B29D4D0@BYAPR11MB3046.namprd11.prod.outlook.com>
References: <20200730055319.1522-1-michael.wei.hong.sit@intel.com>
 <20200730055319.1522-5-michael.wei.hong.sit@intel.com>
 <20200730112948.GB5055@sirena.org.uk>
In-Reply-To: <20200730112948.GB5055@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [121.123.85.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95877842-1acb-44ad-5745-08d83750d067
x-ms-traffictypediagnostic: BYAPR11MB3384:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3384A7A1629F487772FC6EED9D4D0@BYAPR11MB3384.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: py7iJeaSeKXd3m5oLd+LBwv7vcBFqWeRyJwMkNYbPzT6aFAIct7ijbl/dEWFCPXQBhQRaYRylFWbraOT9Mv/jZd9dgDfkW7eeOheaQQvgBRxp4KDI6EMqcXQbP+56eHhS/QWAjRQ5Qq7kR7EV231pjNkxskT3fell/2aLOhYS3SOn7FkQ8YNUpbiLAkgPLjGUnnDFv0LEizAwLNZ1fnN2sGGNouqhiI2XZojY3GDi5s9GYOTY6KzA2lPJWKx6EBX9dBqQbZDwvvB7tQJm8fFqHxarfSiXfoFWC+bWYNgYsyfr8DklZLcpwvI8ACgX4mUnaAq5JBaIoYjkgL8/6hOVpOsXwNX0eVE0+ev2ibLjQtoaLxObttgtzTZLbP9ISIr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(8676002)(478600001)(5660300002)(71200400001)(76116006)(86362001)(66946007)(52536014)(33656002)(8936002)(66476007)(66556008)(64756008)(66446008)(26005)(186003)(54906003)(7696005)(316002)(6506007)(9686003)(53546011)(6916009)(2906002)(83380400001)(4326008)(55016002)(142933001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: mkgdlH70LztZGBDsHsflFzB3yX7qEdyZf0isnoTYlkp5uIWuFM0FsLzn0NTOYqdJmO1Yzl8EFOhtJo05qAExATOwzUj0WZcghqViQ8rWeUmhJndz9DkTJlkHIHphSKTCgbRBPTkdhgw39Cq0ffbb5GlI5f4+/zL3P5Ii3waeorUBnn9Xo+vgZCPd5MD8m7xkEk1NcOoOwsN0cxs6c5gLL+mglweqvZ6RF0jELJTJE89d1Q4Gzh5EfSo+bLd137JeF73E8Ri0cQz122xNKPlN5m9RmaQhy0JuRChUig78nPkN+VAfnwHIbdUwfz1rsx2lKA62AsU/ULWeH1mHiygkIkzN+rvpg7hUJUAnrgqCd9rseIX44dxGkU/wgkz/dXkpvD8YOvGmgrNcmPVL/mA+KemEX7IRRNHkvzIOi1JmEMPWrud1RotgW41CExuKJFZUayO0XD3tdmMfVs8Z2JeqiiTNrDuLJcL3vksEGbb4YDEhRkS2Tif7AemISIGTxhWbAZh7Lw4TeegHwAbQ63zl5lbBOvyjIxaF9odq8fZxbyUZD/cc5aEqcAzzXP+hKRoPcQIccsc6eExB6dpxQPBbKUk7rFzgOTWNBLkOcgkLRTJ1Yt0NS5DFRKsQvD3DaqSx56emrZk6bNdI9bv4MyJ3Qw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95877842-1acb-44ad-5745-08d83750d067
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2020 01:59:10.4551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XWkyYPe5SlzhG99rq9QLpFBiDV8fr3m+OV850UP6sXORfbofnpVZRbjjkoFu+qEewa1mrKe/kADCMjt/bYslM8tV5G6gUtYEAmULSXpJR3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3384
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
> Sent: Thursday, 30 July, 2020 7:30 PM
> To: Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>
> Cc: alsa-devel@alsa-project.org; tiwai@suse.com; pierre-
> louis.bossart@linux.intel.com; Rojewski, Cezary
> <cezary.rojewski@intel.com>; Shevchenko, Andriy
> <andriy.shevchenko@intel.com>; liam.r.girdwood@linux.intel.com; Sia,
> Jee Heng <jee.heng.sia@intel.com>
> Subject: Re: [PATCH 4/4] dt-bindings: sound: intel,keembay-i2s: Add
> channel-max property
>=20
> On Thu, Jul 30, 2020 at 01:53:19PM +0800, Michael Sit Wei Hong wrote:
>=20
> > Add a property that configures the interface to the desired max number
> > of capture channels. The platform may have multiple interfaces with
> > different number of capture channels.
>=20
> Why?  None of the other platforms which support many channels need
> this defining and the constraint code and/or machine driver would
> normally be where this would be handled.

The platform uses the audio-graph-card to create the dai-links, and doesn't=
 use a specific machine driver code.
The platform also has 2 different interfaces which have different supported=
 max-channels.
Using this value in the device-tree to determine the maximum supported chan=
nel of the interface.
