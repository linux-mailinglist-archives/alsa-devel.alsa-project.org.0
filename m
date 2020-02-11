Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55873158C67
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 11:10:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A92BE1664;
	Tue, 11 Feb 2020 11:09:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A92BE1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581415809;
	bh=zjdEYf2r1s0Keqm8kRADC5NUyMGVBawazaiCmsQLI7Q=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OataqvbCD4QOgR4BM/hf8NGdh6tvvXyfkXiS/y6nz5VVyH+qlecZqcRVMC6JjAMpn
	 B2b5SJ+yxue7hj2+30BYqVHdeWTWRSebSBmu8+XJZ+7c2uxJ4z6IInS5cLbHFH/Tnh
	 ewPppq5VOjexnZ20KLVytgoUKVf5+Tr6JdXu0VBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC67FF800E7;
	Tue, 11 Feb 2020 11:08:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39264F80145; Tue, 11 Feb 2020 11:08:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9C98F800F0
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 11:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9C98F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="DdKvXIXL"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 02:08:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="347251201"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
 by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2020 02:08:17 -0800
Received: from orsmsx156.amr.corp.intel.com (10.22.240.22) by
 ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 11 Feb 2020 02:08:17 -0800
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX156.amr.corp.intel.com (10.22.240.22) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 11 Feb 2020 02:08:17 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.53) by
 edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 11 Feb 2020 02:08:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1PuXVbi1teswE6xgS6xnwm458F4cxRaHhcDDF6W7E0MbZF5gD8Rm5oQkNFPc3/rNkdgWDcj5Cly8P1E0vd+3HMCrTYyMIPGqwysZTeOpvBBE6nTJcF/HIW5QeGwCsAtA0pOrsLdolx/OfgRmRsUDCr6E4E0V9jeOWJkbzKWVuhYSiQGcUbhc0E5E3Gw+YD96hLf/kTHy57EpYnXl/x0AR9F/IYVbTV/wcRToPfSrr6J4XeGjknqHL0txNbxiTKLe7jYfKj14yDx8pVFsWGgJAU4aJ/TRVudCMGjKJDL1Sz87AzNts/St3HmO6zDaCQVyNF8+QCW4Uyp09sQRH3YYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpcmSIVywS6TGD3yd0QknKobI3PH6rA5TxvAwleHvWU=;
 b=H+m+OcfLW/yi4tuUPJsC4PkXXBTbja5mDrb0hBVEvO6ND8lP2t5w1AKRl2kgvwU1Le9RGMu3QfI8UqdpAXO7BFiBLEZipeY0kf1wjbLk0Ko8oLpY3W2WQKJOver8CRvA7HHRCThoxrTPGV7yP67HBTPOQUfOwodtHBkliL6wpSbpv9Y1ObJ10Yr9PyZN7wZJJT7LwQm6dJthKHAs2yfd+xBYSvp2DzBFhilbN66hY4gCZYY8aY0uf0VXLSmpr9UD/qhvGpHV8CyXevOOavZ+pXgtG5fwZ11cjzWPlazbC1XIegOGKHYOyczpeNDKbyKUbeAksqxP3BMmUet5w8yXjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpcmSIVywS6TGD3yd0QknKobI3PH6rA5TxvAwleHvWU=;
 b=DdKvXIXL0VM+wbC045vdU/zs/Jna01VOvei3gnJYz/N3OloYKgA6UT0U61C0xUo0vyX9NLNIHW6Dv6jBjqKNj70nMdEXzf9vgrbU7ARHQ+kKdZjTuLphmhME1ET7StxENc8o3EQfL6DZVPZUjQJVAGxyYdyU/3V0PdQclVCeIqA=
Received: from SN6PR11MB2670.namprd11.prod.outlook.com (52.135.96.25) by
 SN6PR11MB2573.namprd11.prod.outlook.com (52.135.89.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.27; Tue, 11 Feb 2020 10:08:15 +0000
Received: from SN6PR11MB2670.namprd11.prod.outlook.com
 ([fe80::d9a3:52a2:97d7:89ec]) by SN6PR11MB2670.namprd11.prod.outlook.com
 ([fe80::d9a3:52a2:97d7:89ec%4]) with mapi id 15.20.2707.028; Tue, 11 Feb 2020
 10:08:15 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH] ASoC: da7219: check SRM lock in trigger callback
Thread-Index: AQHV3+tuqX6FpQoz5UK6Rt5tUMk2f6gUfeSAgAE8rrA=
Date: Tue, 11 Feb 2020 10:08:15 +0000
Message-ID: <SN6PR11MB26702B2E7E5F705425517F4897180@SN6PR11MB2670.namprd11.prod.outlook.com>
References: <1581322611-25695-1-git-send-email-brent.lu@intel.com>
 <AM6PR10MB2263F302A86B17C95B16361280190@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AM6PR10MB2263F302A86B17C95B16361280190@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=brent.lu@intel.com; 
x-originating-ip: [192.55.52.208]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f04bdcf-fc5d-4839-a702-08d7aeda4f57
x-ms-traffictypediagnostic: SN6PR11MB2573:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB25731C3AED984BA1ECA3B08197180@SN6PR11MB2573.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0310C78181
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(136003)(39860400002)(396003)(366004)(189003)(199004)(66476007)(66556008)(64756008)(66446008)(66946007)(55016002)(76116006)(478600001)(2906002)(6506007)(107886003)(71200400001)(4326008)(9686003)(33656002)(8936002)(5660300002)(81156014)(81166006)(8676002)(52536014)(186003)(86362001)(54906003)(110136005)(316002)(7696005)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR11MB2573;
 H:SN6PR11MB2670.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LsmTVP1RayZekXXCsezHTX7nKqn61HiA1rCLLTYShN0lD9puCNOLbrXSnNqhACL5GXoFAcNyh4kOFIjL9DTg6aBlFCki6E9++8GeexryU29Uf9lBxcrxglRqfNyyEFrM+ZvnDib4h+BkSufQFOreLE5bnNlcOUH7V/FH8fZViFCVJGuVuSqvqGYSuCqXJilKmGISYxAozAQoZTnLHn3Fe2VDA/BJOOyFhtW08mU2x93FZfsbUj8H1HMpBF0urbmEbRDG6U6tj4RGcatQHRdTB6iTeJjediZS6/q2f+oMYLK6mUCd+7ipvvhfKTdobowbKQOniYmopkWNtE1HoCY3JfWu/CcPfamXIpPL0NGc4iqDMnDEu2N3fj6TQ9eO1Vo/rvWPkyCrlgPts6ngqGr9fR1sLi6zQZw/NfRyYmVi8wlj305mpS1KBr/W2DAO3ctD
x-ms-exchange-antispam-messagedata: znHEXOJwdhOt30dnMFDyKLr+tbVLj5F38Ciz8XFIa+YUNX502uRGQ5WkzSQW26U2VtrR0fcAH6xjc7YODDFHHQiU3yJdxratDr4Izy41RX45ltpo4cfR/wMaIF/e1V/XKUHKpB7qk+SsX2FT6vgmEA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f04bdcf-fc5d-4839-a702-08d7aeda4f57
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2020 10:08:15.1453 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rLkUdEdmfJUolACqmCVB1uhWBQUMHZsOSNw3RRXQYQFhDoYtzFmo2nDvKRBwzVg9+0rTJh445tlFTXRXi8zhwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2573
X-OriginatorOrg: intel.com
Cc: Support Opensource <Support.Opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chiang,
 Mac" <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 "cychiang@google.com" <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: da7219: check SRM lock in trigger
	callback
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

> 
> Could ensure? This change seems specific to Intel DSP based systems, at
> least from the description. Having looked through the core, the trigger code
> for a codec is seemingly always called before the trigger for the CPU. How will
> this work for other platforms, assuming their clocks are enabled in the CPU
> DAI trigger function by default?
> 
> Can we always guarantee the CPU side isn't going to send anything other
> than 0s until after SRM has locked?
> 

I think the patch is for those systems which enable I2S clocks in pcm_start instead
of pcm_prepare. It has no effect on systems already be able to turn on clocks in
supply widgets or set_bias_level() function.

If the trigger type in the DAI link is TRIGGER_PRE, then the trigger function of FE port
(component or CPU DAI) will be called before codec driver's trigger function. In this
case we will be able to turn on the clock in time. However, if the trigger type is
TRIGGER_POST, then the patch does not help because just like what you said, codec
driver's trigger function is called first.

In my experiment with the patch, the SRM is locked in the second read and cost
50ms to wait.

> 
> I was under the impression that 'trigger()' was atomic? We'd have to have
> some kind of workqueue to do all of this, which means we'd almost certainly
> lose some PCM data at the start of a stream.
> 


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
