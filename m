Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B602DAAB1
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 11:17:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DB9316EF;
	Tue, 15 Dec 2020 11:16:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DB9316EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608027439;
	bh=3wfBSH4npzrm+wp/dnMgK4Um8Xl8eCBUw4J3stZlgs0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LZjjMrqWW6aACKUWcuxu3OjZosg5E1wMdVM0rmZh42ys0Ud1GiNKl1wFD7oCSybHu
	 9Iz5XqzmtqSWQw8t6ZhzH/TnvTthNbjtZjHOaJ4gppXAd598hfq+9p7TJXzVJzbPWQ
	 Jnzl1oOAoYwdMe9mFjwZnnv0sq51tiPz2SzAxvW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECF9FF80129;
	Tue, 15 Dec 2020 11:15:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E952F80278; Tue, 15 Dec 2020 11:15:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B88A3F8014B
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 11:15:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B88A3F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="nrG85v44"
IronPort-SDR: H/0tgbi7XwFRVZFg9lPAwDyFa7o+VMJKKVcwihhF+2C3B9SLNJN4q9kgfaPscseBUact7du/5u
 97z1Z0pr2ZCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="174964998"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="174964998"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 02:15:24 -0800
IronPort-SDR: R/Y7p9f/gqv1hMfEsIoBVX5Elb5OHNQL+dfy46By2XCIWC1i7AXA/rqLRnM5vSv/gAnqKCyTY0
 ZS48cgIHTWig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="336658242"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga003.jf.intel.com with ESMTP; 15 Dec 2020 02:15:19 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 15 Dec 2020 02:15:19 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 15 Dec 2020 02:15:18 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 15 Dec 2020 02:15:18 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 15 Dec 2020 02:15:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKHSO/BVEdvXeH/TbOLEay6HcFBpQw8/M5PQBUVlLU1uQrhLBxOxQLUQuuWye7YmFYD4ZIlTTRHufFRq078kkxX+RUjCMMfaeWrMb3NLyFHx22uQuxk0RdzWziBbIg6D8rZ53yht1u/v9VySwyfGy7HIMKzZAxL1wFMgrKLQVZr9IbLgTuH/+QpRGzqBvQjXUQ8axZS+SfcQ6SbbVmCEPrBsP/iqfBfurfTGM4GN/fl4AmdSzpx7UriMzQZU+GTTnpv29NzNQ/695YfPXdTyksGaGWMZ+skzuNO+qfuORf8PcUOkYKLaSPR1G8UU8aB+HZi7Sd6xj/pe6kyiXUzERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wfBSH4npzrm+wp/dnMgK4Um8Xl8eCBUw4J3stZlgs0=;
 b=MZcgV2wn624wkT0Hj3LB3bPdHDGWt9DXgbi0Bl0FrmLoVPnhUtwR4+uCEKxOmGrvB6AhB1URnEmz62JYt8xvBjtNb1dNx3MjN8nl7wtAxyN69SHUGEGXcN/nyJQxXu4ulz6z7mJVQdHFWSOeVc+319WwYBUc+QODgxgB+wC9KpnXHbV9guaPRHZU62/RG05c6eze25iPOov/RYSLhpMwwQvGNZyxVQ0UhDz+x+dReEh+1KAzYr5ZyH3mGG1BSKs8pYeSAKAPwvSxMZEEHoj/BtuC+1rzpEOjWWW3VgePWfl45IDkxvsvKEeuo8wC4suwUqqMeXCrCmR8onePEV/MoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wfBSH4npzrm+wp/dnMgK4Um8Xl8eCBUw4J3stZlgs0=;
 b=nrG85v4456OQv3Fq+KlmNBGVBV6mbcllHOeqP64/no9xKDkpNy+3uKcArlvTp3lmOGFOo0nmve8sUsoqLeRuSj1dEwtD4WguZE8I/Xw05VPj88Rgum6keelS57yFOGLJHFQNegQmVzy1NwtpN5dhAKE0XAFF/6VARipceCh9Ivc=
Received: from BYAPR11MB3046.namprd11.prod.outlook.com (2603:10b6:a03:86::18)
 by BY5PR11MB3944.namprd11.prod.outlook.com (2603:10b6:a03:18e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Tue, 15 Dec
 2020 10:15:16 +0000
Received: from BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::b544:5491:32e8:f230]) by BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::b544:5491:32e8:f230%3]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 10:15:16 +0000
From: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
To: Lars-Peter Clausen <lars@metafoo.de>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 2/2] ASoC: Intel: KMB: Enable DMA transfer mode
Thread-Topic: [PATCH 2/2] ASoC: Intel: KMB: Enable DMA transfer mode
Thread-Index: AQHW0qUVh+MvN2k9PUSVNs0IwqM8c6n354IAgAAH3zA=
Date: Tue, 15 Dec 2020 10:15:16 +0000
Message-ID: <BYAPR11MB3046A5DA6C08A7F1D29D152F9DC60@BYAPR11MB3046.namprd11.prod.outlook.com>
References: <20201215053307.24128-1-michael.wei.hong.sit@intel.com>
 <20201215053307.24128-3-michael.wei.hong.sit@intel.com>
 <b8c0cc0b-d355-7b28-093b-29e8629056b7@metafoo.de>
In-Reply-To: <b8c0cc0b-d355-7b28-093b-29e8629056b7@metafoo.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: metafoo.de; dkim=none (message not signed)
 header.d=none;metafoo.de; dmarc=none action=none header.from=intel.com;
x-originating-ip: [121.123.66.105]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6314dc1f-9bd0-437c-68d7-08d8a0e25164
x-ms-traffictypediagnostic: BY5PR11MB3944:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB394451D0CBBFEA847281DA539DC60@BY5PR11MB3944.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d6Y3WRoeCTSQMdzRogGuNE7kvq1cWStXe/GR5Yl5u155A8OZVwGFlRo4sloneGbZvhJe0jfv2xapop3O8f6u39BCPKOj0Vmvf1+uRz5tE/Axn72ZAk9+oh/5w/skylofPKnhLlgvgoJGkxDfXlTbJSfTf15wNf+htdJpjbgWb87450MdD1u/3HU41tVNT2pMnfwRnCDfO4Q1mx+VNxSGa/Th8x6eCrJO3+ybq6ZJKRTRhzHkke27arWiJUCtlTe8+tNCU2nbQWmV+5IU6dtL/ITsZ+78Vm7fTyOD80kUBOg/aOgnC5CJjv0Njq2bi+l7hgLoFDqHxvHljU1AcGYy4A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(54906003)(83380400001)(76116006)(4326008)(66556008)(86362001)(8936002)(66946007)(66446008)(6506007)(110136005)(64756008)(55016002)(186003)(9686003)(2906002)(508600001)(26005)(52536014)(66476007)(33656002)(8676002)(5660300002)(7696005)(71200400001)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SnV6aG92WFBQQm0rQllBNUJiaytua1l4MEtBV1JJTkRYYkxOclVlUUxxQk13?=
 =?utf-8?B?L2NYMVBTemVBckd0SXVPUks3YUorclVMejZjZ09lcFhnRDF4d0RuQVVCUGdF?=
 =?utf-8?B?Nm5xT2tPVi85OU14Y0NGWTZnSlRiVVV3Vnp1SFJTN2M1bWJFUS9iVW5xKzFE?=
 =?utf-8?B?MnRpYTVXRG1sQXdLQUdySmg5MmVwYnQ5ZkFzOUw4Y1duSmEwT0Q3TUZaUXlI?=
 =?utf-8?B?dFZNOWZzNkpwdGg0aVFrZWk4WlBJZmVhenVOWDZuT0VQM1pTN1lhcUlGOCtr?=
 =?utf-8?B?VzRuS0piYUlNS3hFNW0xMDZ0am5yV2pRbnRoWkQwbGg2SEFEK01zZVU0VmV0?=
 =?utf-8?B?b2NXYklMWmJ0M0NsSllqMEJTQTlLZGhFL3lmcUZ4eUV0QXJ4K0ZRelc5ZWtl?=
 =?utf-8?B?Zi9qYjJxTkxWSGh6UlA1QnFFNU83K3NJWHdzT0pveDhrVG5yYzNCdVdEdXBP?=
 =?utf-8?B?bGVLR2s1NEtwdGNYcDYxTW9LazRvdE5EU21haDRQRVpCZXR1Y0ZoNXMzS2Vw?=
 =?utf-8?B?aHVnQngxVTdFOWxjWUJocWkvSHl3d3JXeHlhTHpTL1V1dDZvSUNlUzdMN1Jo?=
 =?utf-8?B?WFFvK1JKWUx1N2JFVHVHeFZUMVR0YnJ1K29jRjhkTkovN1dUK2dncTVvY0FS?=
 =?utf-8?B?MmNCTkRvcXp4K3dNZGVPL2pSL0huSmVZcTIxbG5yanU5WnhpMklQaXVCYnJ1?=
 =?utf-8?B?M0xsejNlYkRrMnpTVWFLZmZvRGV0d3NONENnck8xWUdqaHVhYnJYQ2F6Qnpv?=
 =?utf-8?B?N3BiTDVYR1o3Rm1PZGJvQWd6R3VxVGcvRHN4VFdTOXozZ1VzcURiNlhyYk9H?=
 =?utf-8?B?TExWYnRKcXZCc05pS3JnOTkrVzVCRnBNS3J3eCtuenQ3dCt2UTY0OGFQc0ZV?=
 =?utf-8?B?M01kQVJESFdtVVVqQm4zemcxNFJvdVhEazZFVFB3MTdRbldla29Eb1hKdFdF?=
 =?utf-8?B?UUQ3bGFmZ1pmZGI4NW5hZkxCbUlZN2lFeWJnT05OV3ZRekw3QkJwQXQ4eXlD?=
 =?utf-8?B?QmVPQmMrblRHTXZmQ2RDcW1FMEJaTXVjOGpic0VXQjNQYkdvMzhMSXh1ZzR3?=
 =?utf-8?B?OXlYbHVzZzlGYUZNd0x6Q3I5R0ZXTWJNRWIzZ0xzTndPM3RlTzFaNlZhc2ZI?=
 =?utf-8?B?SnFJRExPaEU2dllpQVY4eTFnTVc3TVRLMkpHYkdpMGk4dyt5OGE0WkRrY1A5?=
 =?utf-8?B?M0QvMG9mTXViNUpKUURheVhnOXllM3oxNmlzVjlCQVNXYmVyWUV2bitnM0VD?=
 =?utf-8?B?RzlmYjNPU2ZWVDR4QU9lcVh0ZitjMk1QVzd2LzdvZWxmQjI5Nm44VDNIRmRJ?=
 =?utf-8?Q?itUyI/ZkeZybw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6314dc1f-9bd0-437c-68d7-08d8a0e25164
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2020 10:15:16.0583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a+SnqoSZLvVNTYuMv95LMQKe5Rdfyr2sf7aT2P6aZSv8O5zFgCtu/6SzjWYyQHR8H1LrswNvSzh+XaGQQxYAcbV2ok2i0UmoAJOCPOg6g1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3944
X-OriginatorOrg: intel.com
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "Sia, Jee Heng" <jee.heng.sia@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGFycy1QZXRlciBDbGF1
c2VuIDxsYXJzQG1ldGFmb28uZGU+DQo+IFNlbnQ6IFR1ZXNkYXksIDE1IERlY2VtYmVyLCAyMDIw
IDU6NDEgUE0NCj4gVG86IFNpdCwgTWljaGFlbCBXZWkgSG9uZyA8bWljaGFlbC53ZWkuaG9uZy5z
aXRAaW50ZWwuY29tPjsNCj4gYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnDQo+IENjOiBSb2pl
d3NraSwgQ2V6YXJ5IDxjZXphcnkucm9qZXdza2lAaW50ZWwuY29tPjsNCj4gdGl3YWlAc3VzZS5j
b207IFNpYSwgSmVlIEhlbmcgPGplZS5oZW5nLnNpYUBpbnRlbC5jb20+OyBwaWVycmUtDQo+IGxv
dWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tOyBsaWFtLnIuZ2lyZHdvb2RAbGludXguaW50ZWwu
Y29tOw0KPiBicm9vbmllQGtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIEFT
b0M6IEludGVsOiBLTUI6IEVuYWJsZSBETUEgdHJhbnNmZXINCj4gbW9kZQ0KPiANCj4gT24gMTIv
MTUvMjAgNjozMyBBTSwgTWljaGFlbCBTaXQgV2VpIEhvbmcgd3JvdGU6DQo+ID4gWy4uLl0NCj4g
PiArc3RhdGljIGlubGluZSB2b2lkIGttYl9pMnNfZW5hYmxlX2RtYShzdHJ1Y3Qga21iX2kyc19p
bmZvDQo+ICprbWJfaTJzLA0KPiA+ICt1MzIgc3RyZWFtKSB7DQo+ID4gKwl1MzIgZG1hX3JlZzsN
Cj4gPiArDQo+ID4gKwlkbWFfcmVnID0gcmVhZGwoa21iX2kycy0+aTJzX2Jhc2UgKyBJMlNfRE1B
Q1IpOw0KPiA+ICsJLyogRW5hYmxlIERNQSBoYW5kc2hha2UgZm9yIHN0cmVhbSAqLw0KPiA+ICsJ
aWYgKHN0cmVhbSA9PSBTTkRSVl9QQ01fU1RSRUFNX1BMQVlCQUNLKQ0KPiA+ICsJCWRtYV9yZWcg
fD0gSTJTX0RNQUVOX1RYQkxPQ0s7DQo+ID4gKwllbHNlDQo+ID4gKwkJZG1hX3JlZyB8PSBJMlNf
RE1BRU5fUlhCTE9DSzsNCj4gPiArDQo+ID4gKwl3cml0ZWwoZG1hX3JlZywga21iX2kycy0+aTJz
X2Jhc2UgKyBJMlNfRE1BQ1IpOyB9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQga21i
X2kyc19kaXNhYmxlX2RtYShzdHJ1Y3Qga21iX2kyc19pbmZvDQo+ICprbWJfaTJzLA0KPiA+ICt1
MzIgc3RyZWFtKSB7DQo+ID4gKwl1MzIgZG1hX3JlZzsNCj4gPiArDQo+ID4gKwlkbWFfcmVnID0g
cmVhZGwoa21iX2kycy0+aTJzX2Jhc2UgKyBJMlNfRE1BQ1IpOw0KPiA+ICsJLyogRGlzYWJsZSBE
TUEgaGFuZHNoYWtlIGZvciBzdHJlYW0gKi8NCj4gPiArCWlmIChzdHJlYW0gPT0gU05EUlZfUENN
X1NUUkVBTV9QTEFZQkFDSykgew0KPiA+ICsJCWRtYV9yZWcgJj0gfkkyU19ETUFFTl9UWEJMT0NL
Ow0KPiA+ICsJCXdyaXRlbCgxLCBrbWJfaTJzLT5pMnNfYmFzZSArIEkyU19SVFhETUEpOw0KPiA+
ICsJfSBlbHNlIHsNCj4gPiArCQlkbWFfcmVnICY9IH5JMlNfRE1BRU5fUlhCTE9DSzsNCj4gPiAr
CQl3cml0ZWwoMSwga21iX2kycy0+aTJzX2Jhc2UgKyBJMlNfUlJYRE1BKTsNCj4gPiArCX0NCj4g
PiArCXdyaXRlbChkbWFfcmVnLCBrbWJfaTJzLT5pMnNfYmFzZSArIEkyU19ETUFDUik7DQo+IA0K
PiBEb2VzIHRoaXMgbmVlZCBsb2NraW5nPyBJIGJlbGlldmUgaXQgaXMgcG9zc2libGUgZm9yIHRo
ZSBzdGFydHVwDQo+IGNhbGxiYWNrIG9mIHRoZSBwbGF5YmFjayBhbmQgY2FwdHVyZSBzdHJlYW0g
dG8gYmUgY2FsbGVkDQo+IGNvbmN1cnJlbnRseS4NCj4gDQpQaWVycmUgZGlkIHJhaXNlZCB0aGlz
IGNvbmNlcm4gcHJldmlvdXNseSBhbmQgY2hlY2tlZCB0aGF0IHRoZSB1cHBlciBsYXllcnMgaGFz
IGFscmVhZHkgYSBsb2NraW5nIG1lY2hhbmlzbSBpbiBwbGFjZSBiZWZvcmUgdGhpcyBpcyBjYWxs
ZWQuDQpJZiB3ZSBsb29rIGF0IHRoZSB1c2VzIG9mIHNuZF9zb2NfZGFpX3N0YXJ0dXAoKSBhbmQg
c25kX3NvY19kYWlfc2h1dGRvd24oKSwgdGhleSBhcmUgYWxsIHByb3RlY3RlZCBieSBtdXRleF9s
b2NrX25lc3RlZCgmcnRkLT5jYXJkLT5wY21fbXV0ZXgsIHJ0ZC0+Y2FyZC0+cGNtX3N1YmNsYXNz
KTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgIHN0YXRpYyB2b2lkIGttYl9pMnNfc3RhcnQoc3RydWN0
IGttYl9pMnNfaW5mbyAqa21iX2kycywNCj4gPiAgIAkJCSAgc3RydWN0IHNuZF9wY21fc3Vic3Ry
ZWFtICpzdWJzdHJlYW0pDQo+ID4gICB7DQo+ID4gQEAgLTM1Niw3ICs0MDUsMTEgQEAgc3RhdGlj
IHZvaWQga21iX2kyc19zdGFydChzdHJ1Y3QNCj4ga21iX2kyc19pbmZvICprbWJfaTJzLA0KPiA+
ICAgCWVsc2UNCj4gPiAgIAkJd3JpdGVsKDEsIGttYl9pMnMtPmkyc19iYXNlICsgSVJFUik7DQo+
ID4NCj4gPiAtCWttYl9pMnNfaXJxX3RyaWdnZXIoa21iX2kycywgc3Vic3RyZWFtLT5zdHJlYW0s
DQo+IGNvbmZpZy0+Y2hhbl9uciwgdHJ1ZSk7DQo+ID4gKwlpZiAoa21iX2kycy0+dXNlX3BpbykN
Cj4gPiArCQlrbWJfaTJzX2lycV90cmlnZ2VyKGttYl9pMnMsIHN1YnN0cmVhbS0NCj4gPnN0cmVh
bSwNCj4gPiArCQkJCSAgICBjb25maWctPmNoYW5fbnIsIHRydWUpOw0KPiA+ICsJZWxzZQ0KPiA+
ICsJCWttYl9pMnNfZW5hYmxlX2RtYShrbWJfaTJzLCBzdWJzdHJlYW0tDQo+ID5zdHJlYW0pOw0K
PiA+DQo+ID4gICAJaWYgKGttYl9pMnMtPm1hc3RlcikNCj4gPiAgIAkJd3JpdGVsKDEsIGttYl9p
MnMtPmkyc19iYXNlICsgQ0VSKTsNCj4gWy4uLl0NCg==
