Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B6539DEA6
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 16:24:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EDDD1677;
	Mon,  7 Jun 2021 16:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EDDD1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623075894;
	bh=8WrAytEq6ky6UCFMExL4xaStFB0VcQcKNDyF/tTTxpY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oO5yfnTJ5sIV2k25xEkqlfka2eMvFmXk5uHKWqikHBr3X6TVGrhwzp71kJf2Qd6JR
	 00GJ/J6tYrOW6pw39j4z80WOavoE1l4PKtBwzZ/PLsYzbtHbtr73pI97PKoLiT9s/3
	 gnxcUtTrlZnkQu6qe8GXYXC16O2g+e0LQmo7axUo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF6ADF8026C;
	Mon,  7 Jun 2021 16:23:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8EF5F80212; Mon,  7 Jun 2021 16:23:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDF6FF800DF
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 16:23:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDF6FF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="WRbAJ++A"
IronPort-SDR: wuFyvuZWy88ofdZXCafv/mtCFfBjO+hL4aOfAui97zelUAS/K22XgsG6yHxTunIbBka6CHlXgK
 +BHvB3SuxbCw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204653708"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="204653708"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 07:23:08 -0700
IronPort-SDR: K9V9py2SDGvf0Qseh4wDWtaths1DLPFm0oSs3UsmoMBtbzbLjqAxKE7outxwRHzyEwuRzwNZ2r
 Ri5xlC3OPhcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="484791019"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga002.fm.intel.com with ESMTP; 07 Jun 2021 07:23:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 7 Jun 2021 07:23:06 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 7 Jun 2021 07:23:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Mon, 7 Jun 2021 07:23:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Mon, 7 Jun 2021 07:23:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLy2s6z13qOh+8LKPS9Upm/PPOPpxRycbAgobdClAxvUHws0GJ0OeC3wNLBZxONGZRxwbtYPZwwNwa8BMwuJKC1rccXwoQ0SnOVPxgfkhBepdOWOlby2EpaoW7CtwBLMHroLXbgHsHontMPrCJFkX5YFmjWf9aqLmG6AEXgneF2Ey3A5gzNku8EmJSW4cIHmj0QYDPNPa64fnFP8Rrrk+48q2iyZLFUpQj1dn9uOkCRocShnhVAsWGYqzapha3cuWLUdEebJH7iYdEIpopwsehKxx2dFTl+E0yB1VgFU5K69sqyv5C13h0I403OxctAUQ9MYuI62jY1oon58NOT/Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WrAytEq6ky6UCFMExL4xaStFB0VcQcKNDyF/tTTxpY=;
 b=ORjpWMQRHrm1lx7Ub7br6WIAy34ctn+46ao9QQozebyNiuB16fhY87VdlvnlJJB2ZUbRpMf71OJlN3TxpZT5gB1XPCWuO8QjU9vAPyUKhkY2aw+UsMgcxbYuodIoimt6BBpalAfSf63gD75Pr6J9h1brXrzwfegBvfc1U06sD8iEFZ2PiPI9caqYtRrPYePC8m9K/I6myd7OY7iU93CrmabOhczzfZoXgiW+0DITYHXAtyHHRfV6mrmr+7/0BMNYr3gldXvKdTg8Tz5xEWEBbGNReUhIpU5T2gagiRnhFllDGLddwRTeguoBPKtstdhZTL/EwXbfx+mibkX7B94pYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WrAytEq6ky6UCFMExL4xaStFB0VcQcKNDyF/tTTxpY=;
 b=WRbAJ++AUlI23eBmUP6Jq4etQdytpHY7ehbn5f+t5x4IQ/gR2qy5/fC+5W/o0hL3G7KZ6B9nPWWQRvuTTycY9c22bCQbm9DwYX5CMufklxDgRq2oiBd7kDUHHKxdIInhiyHYJzb1Lu94SPIGlFu1JRYo9ZDfPcdDsi5zavDbyTo=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM4PR11MB5501.namprd11.prod.outlook.com (2603:10b6:5:39d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 14:23:03 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f890:381e:1e24:a6d9]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f890:381e:1e24:a6d9%7]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 14:23:03 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 1/4] ASoC: Intel: sof_cs42l42: support JSL DAI link
 sequence
Thread-Topic: [PATCH 1/4] ASoC: Intel: sof_cs42l42: support JSL DAI link
 sequence
Thread-Index: AQHXWm97xwmY5nUjBEOmAodTtswOUqsIjkeAgAAJ2cA=
Date: Mon, 7 Jun 2021 14:23:03 +0000
Message-ID: <DM6PR11MB36429F4E8A6F077F8D2374F997389@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <20210606004102.26190-1-brent.lu@intel.com>
 <20210606004102.26190-2-brent.lu@intel.com>
 <2ccdffb1-e905-420e-5144-ebb8356b5518@linux.intel.com>
In-Reply-To: <2ccdffb1-e905-420e-5144-ebb8356b5518@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [36.230.1.79]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30a42fcf-9665-402a-586f-08d929bfc2ed
x-ms-traffictypediagnostic: DM4PR11MB5501:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR11MB55010F5C89BD7FF7444197B297389@DM4PR11MB5501.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lzz//6Hx8N4tsjekYePX1ng2Q+Drh2FC8wMUHrE0NjKUp+mdzWdeZqMSLXF5m+en+P/qARLzkHU0eb8rJohOmnJ8VJXDZwfkA9vADPrXaUaIo8iOwaGyE5XCKdp5T9Wt/SGNsdX9CcN5Uz6DC6IbEBGZfvJXQgeU4rUtc6gdqrgVD7poIie1HIJgIofDOhjPMTr6YZU5JIitm1mXD7+wJ9e3c6hNAgCJiO0DmvN6j5hxUlaUntwKcd2aRligQHHc3DcWUeqWkaudh3/JgCwH47TTm9UO0D1vDGGTympz6ACnwZQ7kZ+HZh6s0DVMqWxhGJuYcDbZy0RyL53qxD5kmzzsf9RFvQarhBmnzYZBaKf5LFmoM46Rpr2sdZ/1YfNPhom2tycAS8RuQL3gmC+iU1UwX1+33r0QH5WjXiWx/g7GV6e+BBIwCliFgH3Os72zPig2AgU7UO+5w2p09JWo8utcmQlFyxlPHsfEtZ+WPXc2V3s1vs/IhpZIKwbDIEHi+13qP22UgsyafRh7Do35Qye4Zl9kPspPu1AU5p2OLOTjLJdZPHi7aLM+k0Q6O+zBdIrp8pZZuoE7YvZ0g7poj/i4yz27b0gmLpLmO4JQ0Ac=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39850400004)(346002)(366004)(376002)(136003)(33656002)(8936002)(316002)(26005)(71200400001)(55016002)(66946007)(66446008)(64756008)(186003)(66556008)(66476007)(9686003)(478600001)(76116006)(4326008)(110136005)(54906003)(5660300002)(86362001)(7696005)(2906002)(53546011)(6506007)(52536014)(83380400001)(38100700002)(7416002)(122000001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Q0UvNEd4dVpnd0xGSG9GVG5ETmt0NEVSSEVlT2pBZjErekkzbmExL0t0MDR4?=
 =?utf-8?B?T3FqUFdRUFNhd0svV1ZYRWhLbHl6emhtL3BzRk41cWxFT21ZTkd2Qzl0V2hh?=
 =?utf-8?B?dmJIUThIbWx4Wm5GNTJ1VmhVZUJ5Y1psSnI2MFNBa0N6MThsQkN0QU9pZTZ6?=
 =?utf-8?B?TCtXdXNvZlFyaW1MbytKSzh3ODN3eWoxTVQ1aVBsTTFPaW00VXJLS2dmYjNH?=
 =?utf-8?B?NDV2dHRpaFdFK05lc1VLTkZPcGZUaEtIU3kyTmszdFRaUllrTkttc3d3UDdy?=
 =?utf-8?B?VUtBN0Z2U0pIcVZRcERUSUhJaEF3dmdpY1JuWkxFcjJmM3ljYytrS3JIR1Nk?=
 =?utf-8?B?TnlhTFI2RW1CZjJvNjFhczhBdks3YUxJQW8rVTZ2dkxlUENBM3hoNWplaUNx?=
 =?utf-8?B?MU9NaDludGxEaDIxWUJjRzJVVGJKckZsaU0waFFBYTZwV3BWanhKTWt5dmQw?=
 =?utf-8?B?d1RXOVluZXZRUEJ0OXdldzZHSk1kUDFyZTdVeHlUUWhNRVJyRGU1TzBwUmp5?=
 =?utf-8?B?QUg2MW1jNC80S2ZpMFJHRE5rdDhjT0thT2ZVbjlEcXBGNUtUL3g4NVE5aWIr?=
 =?utf-8?B?VmYyRDFqTElZZjlrM3BINStsd3d6ZWRMa08zUU5PVGh2RUFudlJTVEZNM2VB?=
 =?utf-8?B?dmgwdjkyT0xnbU1PRjk4aHpVczlsUTFkMlVQVlpwN3Jnejk0RzA4NzFvNWlH?=
 =?utf-8?B?dDFmU3BPejJ3Z25MRTJ3NzlUc1h6dkJkcUVrOUsyUml5ZXo1NHltSS9Uc1Yy?=
 =?utf-8?B?cGxOR25sdFI2NnNPRThrend1NWE0Z3VHVG13LzRnZVE0eVNEY0tjejVCdzJU?=
 =?utf-8?B?Q2pjQXpkNXlhdm5EK1pyVTE3RVppRk5qOUhGUCtkQmZQTzFyQWpwT3NGcmRv?=
 =?utf-8?B?OFVjbmZpTW1JSzdMYnowTEs0Q2w4K3N1TUpmUUFUMEVqRnRHTGQ4NzZ1TUcz?=
 =?utf-8?B?aGpYNWNTUnJqRStwejFYbUFXQTl1cDdqcFJXYXZQc1Y3SGZqcmlPRldRanBl?=
 =?utf-8?B?bjgzUUM0MHQ1YjRvQjh1Y3ViblJMaStGUkVMU1Ywdk5tNDFOajdOQkxOK1o5?=
 =?utf-8?B?RWVWQWdVRzdaS1A5NEd4RGpEbS9oRXFiaTUrWHZ6djFHQzBYdENOY0M0OVk2?=
 =?utf-8?B?SXEzWWVXSXU2b24ycG9RQWRtSmMrYmhwYWU2bFhGZnR5QjQyUURJMUNNdmp6?=
 =?utf-8?B?a25MU3hjZVZuZ21DV2RJbnBZMDd0Vm4vNlplT3VxN2RjM3hldEdnYVFWOEd1?=
 =?utf-8?B?OTZvTVU1YWhDSVR0MlZrRjJxMFU1ZUYwKzdYN01xUHJaK2ZmR01mSzRRKzkv?=
 =?utf-8?B?UytXeisyZzBHdEFieHBpNHBZMCsxN0pYdGdxZ3FoZGY3aythRFZWbjQwb0Jk?=
 =?utf-8?B?VGJncjhqU3U5UGFyeTVJYnd3cUlvN1QwSjdLSVpDWlBnZkIzSDk5NXN1cDJU?=
 =?utf-8?B?RWxpOEJBN2xZYzV4MVNjRGRjaHJHYWxIbTNaWEloY0U5eHAxODQvd0l0U0Q5?=
 =?utf-8?B?YSs5MFpzdStTY2tjbzA2L05sUDNPc3hyOW9NV3RGcG8rSnBtTVErSEhsVk9h?=
 =?utf-8?B?SElIaEIvQlR6aGNLdHJSVXl2Z0E2U1gvWjgvS0pIV2srWUlGakFoWm8xbDFy?=
 =?utf-8?B?alo1NmdnclZvTHI0TGk1MUJhRTBNSjdGcWhCMVptUi9EYmtpaGorYytlcVFw?=
 =?utf-8?B?cFVCRXNxOFkxbFhTL1M3cXl2RE5qQlJNZUlCd3cvR21pN09TZFhYQWo2OENQ?=
 =?utf-8?Q?0yivvgHUtXfms5ARmE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a42fcf-9665-402a-586f-08d929bfc2ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2021 14:23:03.3703 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1/jp7O1qRN5er99q3xZi0fC+aWPX16hmZKd3JetyibYp4yP1MJ9+jOFoPQ09LkGEGJP+hQlgqTvcSwS5h3Nk9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5501
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, "R,
 Dharageswari" <dharageswari.r@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, "Zhi, 
 Yong" <yong.zhi@intel.com>, Mark Brown <broonie@kernel.org>, Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>, "M, Naveen" <naveen.m@intel.com>,
 "Wang, Rander" <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Fred Oh <fred.oh@linux.intel.com>,
 "Gopal, Vamshi Krishna" <vamshi.krishna.gopal@intel.com>, "Nujella,
 Sathyanarayana" <sathyanarayana.nujella@intel.com>
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

PiBPbiA2LzUvMjEgNzo0MCBQTSwgQnJlbnQgTHUgd3JvdGU6DQo+ID4gVGhlIGJhY2tlbmQgREFJ
IGxpbmsgc2VxdWVuY2Ugb2YgR0xLIHBsYXRmb3JtIGlzIGRpZmZlcmVudCBmcm9tIHRoZQ0KPiA+
IHNlcXVlbmNlIG9mIG90aGVyIHBsYXRmb3Jtcy4gV2UgcmVmYWN0b3IgdGhlDQo+ID4gc29mX2Nh
cmRfZGFpX2xpbmtzX2NyZWF0ZSgpIGZ1bmN0aW9uIHRvIHN1cHBvcnQgYm90aCBzdHlsZS4NCj4g
Pg0KPiA+IEdMSzogU1BLIC0gSFAgLSBETUlDIC0gSERNSQ0KPiA+IE90aGVyOiBIUCAtIERNSUMg
LSBIRE1JIC0gU1BLDQo+IA0KPiBJIGFtIHJlYWxseSBjb25mdXNlZCBoZXJlLg0KPiBUaGUgZGFp
bGluayBzZXF1ZW5jZSBpcyB3aGF0ZXZlciB3ZSB3YW50IGl0IHRvIGJlLiBXaGF0IG1hdHRlcnMg
aXMgdGhhdCB0aGUNCj4gZGFpbGluayBJRCBtYXRjaGVzIHdoYXQgaXMgaW4gdGhlIHRvcG9sb2d5
Lg0KPiANCj4gSXMgdGhpcyBzYXlpbmcgdGhhdCB0aGUgR0xLIGFuZCBKU0wgdG9wb2xvZ2llcyBk
aWQgbm90IGZvbGxvdyBhbnkgc29ydCBvZg0KPiBjb252ZW50aW9uPyBDYW4geW91IGVsYWJvcmF0
ZSBtb3JlIG9uIHdoYXQgaXMgdGhlIGlzc3VlPw0KPiANCj4gUHV0IGRpZmZlcmVudGx5LCB3aHkg
Y2FuJ3Qgd2UgZml4IHRoZSB0b3BvbG9neSBpbnN0ZWFkIHdpdGggYSByZW9yZGVyIG9mIHRoZQ0K
PiBkYWlsaW5rcz8NCj4gDQoNCnNuZF9zb2NfZmluZF9kYWlfbGluaygpIGNoZWNrZWQgYm90aCBk
YWkgbGluayBuYW1lIGFuZCBpZCB3aGVuIG1hdGNoaW5nDQp0b3BvbG9neSBhbmQgbWFjaGluZSBk
cml2ZXIuIFNvdW5kY2FyZCByZWdpc3RyYXRpb24gd291bGQgZmFpbCBpZiB0aGVpciBpZA0KZG9l
c24ndCBtYXRjaC4NCg0KQ3M0Mmw0MiBpcyBzaGFyaW5nIHRvcG9sb2d5IHdpdGggREE3MjE5J3Mg
dG9wb2xvZ3kgc291cmNlIGZpbGUgc29mLWdsay1kYTcyMTkubTQNCm9uIEdMSyBwbGF0Zm9ybS4g
VGhlIGNvbmZpZ3VyYXRpb24gaXM6DQoNCmRhaSBsaW5rIGlkIDAgaXMgZm9yIHNwaw0KI1NTUCAx
IChJRDogMCkgd2l0aCAxOS4yIE1IeiBtY2xrIHdpdGggTUNMS19JRCAxICh1bnVzZWQpLCAxLjUz
NiBNSHogYmxjaw0KREFJX0NPTkZJRyhTU1AsIDEsIDAsIFNTUDEtQ29kZWMsDQoNCmRhaSBsaW5r
IGlkIDEgaXMgZm9yIGhlYWRwaG9uZQ0KI1NTUCAyIChJRDogMSkgd2l0aCAxOS4yIE1IeiBtY2xr
IHdpdGggTUNMS19JRCAxLCAxLjkyIE1IeiBiY2xrDQpEQUlfQ09ORklHKFNTUCwgMiwgMSwgU1NQ
Mi1Db2RlYywNCg0KZGFpIGxpbmsgaWQgMiBpcyBmb3IgZG1pYw0KREFJX0NPTkZJRyhETUlDLCAw
LCAyLCBkbWljMDEsDQoNCmRhaSBsaW5rIGlkIDMvNC81IGlzIGZvciBoZG1pDQpEQUlfQ09ORklH
KEhEQSwgMywgMywgaURpc3AxLA0KREFJX0NPTkZJRyhIREEsIDQsIDQsIGlEaXNwMiwNCkRBSV9D
T05GSUcoSERBLCA1LCA1LCBpRGlzcDMsDQoNCldoZW4gb24gSlNMLCB3ZSBwbGFuIHRvIHNoYXJl
IHRvcG9sb2d5IHdpdGggcnQ1NjgyIHdoaWNoIGhhcyBkaWZmZXJlbnQgZGFpIGxpbmsNCnNlcXVl
bmNlOg0Kc29mLWpzbC1ydDU2ODIubTQ6DQoNCmRhaSBsaW5rIGlkIDAgaXMgZm9yIGhlYWRwaG9u
ZQ0KREFJX0NPTkZJRyhTU1AsIDAsIDAsIFNTUDAtQ29kZWMsDQoNCmRhaSBsaW5rIGlkIDYgaXMg
Zm9yIHNwaw0KIyBTU1AgMSAoSUQ6IDYpDQpEQUlfQ09ORklHKFNTUCwgU1BLX0lOREVYLCA2LCBT
UEtfTkFNRSwNCglTRVRfU1NQX0NPTkZJRykNCg0KZGFpIGxpbmsgaWQgMy80LzUgaXMgZm9yIGhk
bWkNCiMgNCBIRE1JL0RQIG91dHB1dHMgKElEOiAzLDQsNSkNCkRBSV9DT05GSUcoSERBLCAwLCAz
LCBpRGlzcDEsDQpEQUlfQ09ORklHKEhEQSwgMSwgNCwgaURpc3AyLA0KREFJX0NPTkZJRyhIREEs
IDIsIDUsIGlEaXNwMywNCg0KSSdtIG5vdCBzdXJlIGlmIHRoZXJlIGlzIGNvbnZlbnRpb24gYWJv
dXQgdGhlIHNlcXVlbmNlIHRvIGZvbGxvdz8NCg0KDQpSZWdhcmRzLA0KQnJlbnQNCg0K
