Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB982DFC90
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Dec 2020 15:10:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 295691752;
	Mon, 21 Dec 2020 15:09:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 295691752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608559848;
	bh=eO4df1psemoPpC3SJFWPA7cagHdHZlJnBQk8woHAPso=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n8rjkn3fiHSyfMNIKl8Ge5m8PzNujBSLzuB3cXW2+4A376es8Z9UU0TksyAH4UU8H
	 U0WOVumkEq8RK3qqzykPnKH1YYevOisGqMyM97i3LhNxuYPsk8+nqs9sqy82cs+5Ux
	 UPpVFMhhg08712bz0TnAPMOq9fTfJ/nrf7wANbf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF9D4F800E4;
	Mon, 21 Dec 2020 15:09:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55B74F801D5; Mon, 21 Dec 2020 15:09:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CC99F80116
 for <alsa-devel@alsa-project.org>; Mon, 21 Dec 2020 15:08:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CC99F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="ylHTbrsK"
IronPort-SDR: 0FNY9U27sPan+/dD49Ag8vPIK3F4T+EHWiz6b1cWsepDjA0CA0ZJBH1Caf7mi597jeXzkOEvyK
 nFR3IAMD+Wyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9841"; a="175829711"
X-IronPort-AV: E=Sophos;i="5.78,436,1599548400"; d="scan'208";a="175829711"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2020 06:07:19 -0800
IronPort-SDR: OwEg/s7NIhpd/ZadIR/+FcaIMWWSdotd4iva01haQN+9sJYTB7p5BmLQADpgaGvSf8fk910OAC
 bCuKb37oTr5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,436,1599548400"; d="scan'208";a="337465307"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga007.fm.intel.com with ESMTP; 21 Dec 2020 06:07:16 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 21 Dec 2020 06:07:15 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 21 Dec 2020 06:07:15 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 21 Dec 2020 06:07:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnTofot172Z1WZiYl/7B0K06obeIYWWAXpRL2nRUIg2TevOlmBJwl4RkuLrsZouQ0eR8YymarCyX6MY7c6sNv0ub3EvAa7NTbw+a8wGeJHMY4BXFUt7hfU0ebY8I1L4QXVa/NHKxQ1a6jXZ0UtOy82C9kHyXeD/wycJxzAsMIK12X3PmIJv+Xm+8vx97DVL988dPdoTVZ1LkBL3a9FKVuTk30qcmcnzjhuLu2dok14RaHwWVSCkld14MsXmpL/0Yks10S9y9fs90rUQmzOOwSRMcBRXCLOufVJRvCt7fWFtYowh2eLJW8kHnyQn/f9owHGvc/GNeuV041ftOFVnSZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eO4df1psemoPpC3SJFWPA7cagHdHZlJnBQk8woHAPso=;
 b=IqodicSUwEOvYqj+lfLzGJQPDCu24m2R3+khASu0v/KFZRaDmvHJaR1ZO+fdGEJ7b4IKNjEHJ8dLVaNtOiGO6QJ0QwCgQZNTVzTTNubqJwH38mVQ65Vn0zQel8HOrRl+Rv6ONTcMntuNtpLkYcd0V9wsQxUI2QYwUeGiN9w8DRTeNiUVAR79q0mfk3Xj8hllV5ON5h+UNxdDqvgBDhUwd49TX/KkYkBl+2VK0DgkvNIvI2TdhXLyt5B7Zmx8Va/ExxVB/nYMrqumKdhRzuh625dZ2ZRZQxqfUaESTzfenDsPhMYfWKTwE2CE0+TF8XrMXSOh+XOmyhfxzbDEtLRIRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eO4df1psemoPpC3SJFWPA7cagHdHZlJnBQk8woHAPso=;
 b=ylHTbrsKXsxbc/loc6VfcajYs6gqBBvg0WnzXa05VTbkn6WM19Ywrzs9Wi3/SNlP2YXfoeGywVdmmEq3wnYigN15vyADGo9aOj7ZDnI5LE/D3+w9FSDOdHGxx9bR0R1fhQm1acGbnDB2C0+eQWwYgsjZZI5FIf4ySPPWgHShh3Y=
Received: from BYAPR11MB3046.namprd11.prod.outlook.com (2603:10b6:a03:86::18)
 by BYAPR11MB2710.namprd11.prod.outlook.com (2603:10b6:a02:c7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.25; Mon, 21 Dec
 2020 14:07:09 +0000
Received: from BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::b544:5491:32e8:f230]) by BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::b544:5491:32e8:f230%3]) with mapi id 15.20.3654.034; Mon, 21 Dec 2020
 14:07:09 +0000
From: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
To: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>, "Lars-Peter
 Clausen" <lars@metafoo.de>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 2/2] ASoC: Intel: KMB: Enable DMA transfer mode
Thread-Topic: [PATCH 2/2] ASoC: Intel: KMB: Enable DMA transfer mode
Thread-Index: AQHW0qUVh+MvN2k9PUSVNs0IwqM8c6n354IAgAAH3zCACbBXMA==
Date: Mon, 21 Dec 2020 14:07:09 +0000
Message-ID: <BYAPR11MB30463432C9EAEB4B24F953AF9DC00@BYAPR11MB3046.namprd11.prod.outlook.com>
References: <20201215053307.24128-1-michael.wei.hong.sit@intel.com>
 <20201215053307.24128-3-michael.wei.hong.sit@intel.com>
 <b8c0cc0b-d355-7b28-093b-29e8629056b7@metafoo.de>
 <BYAPR11MB3046A5DA6C08A7F1D29D152F9DC60@BYAPR11MB3046.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB3046A5DA6C08A7F1D29D152F9DC60@BYAPR11MB3046.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [121.122.94.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2877dccf-ee4d-4586-f5fc-08d8a5b9b4e7
x-ms-traffictypediagnostic: BYAPR11MB2710:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB2710CA5070F194E0CEC9AD6A9DC00@BYAPR11MB2710.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PeG6r5avOH6qJdmO2iBVNydwLJ35n/pktpFLL3Hc+WDu/yGi+YlM9h51GvS0Fcru5Avp9l01htp29IoVS5zu024x1dn2wnhQziqQ1IxkizUaI53Lt1N2WYP5kf8IVkoIoqgST6SYGWxlNJSWITEWvTMIDfgFEnBq9W1sq7Dzl8GVab4HE5SqfKSPmW1n05r/lWuc61bPP+gzm5iHE2CF54moH7CUnYJDi6IL9zobqnhTR7kNw9p+/JaQGjg52dN+j4mZ8+tbsEf+vBRa1TaX35p2BKeM+UJanYZQPla/13LEzBOZB85iF4oR50QPneJL75/ARoUsEbCnTtIMuD/TZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(478600001)(186003)(6506007)(8936002)(2906002)(53546011)(7696005)(26005)(83380400001)(66556008)(66476007)(8676002)(5660300002)(66946007)(52536014)(64756008)(66446008)(71200400001)(316002)(110136005)(54906003)(76116006)(4326008)(55016002)(9686003)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Y1daY0ZxalZ6M0dLMkxZd3dKMVhXellWVDJVWDdxTXBsZTJLZGgrSWZpMi9J?=
 =?utf-8?B?ZGpUenc5aHNhR3Judm5TdHJZajFoT0ExaTRha3VCTEtUL2o0TEhoMDg4U0Y3?=
 =?utf-8?B?TWhaUGpCTUo4WmxKMWczVTdtclJHNWRoaG1UMWZ0U2FYRVpIb1BGUlNTVjlk?=
 =?utf-8?B?bE1vU051QWlwTko0NlJES1dtbFA1UEQzTDQ1dmN0NFdrTFVuOVV6K0VOUlZ1?=
 =?utf-8?B?T3ZqdFZsRE1ycVdGWWtzWFVHc3BDdXIybXk2d21oUSsxVERIckNFNlczd0pV?=
 =?utf-8?B?d3FEQWZyaXVUTWx2OWl3ZUVJSStOeENOdlljR0pLU3F4czdjc2YxWERQVTUy?=
 =?utf-8?B?T2d1OEFGejV4L0NwQmJJRmhtaVhPTGVrMGdGZ1R6bFNtZEFGZWZvNnBZNlEv?=
 =?utf-8?B?eTdUaVBjMEp4ZEdmWGp2SnNITnlCZDJGNXRUeVVvSUxhU0QzVWFGZkNxcS9G?=
 =?utf-8?B?RWdMaEMvU2VVeVh4dVhzNnZFcE1zVU8xTFdFRXBmQS9MM2pETTc2RlkzQkw4?=
 =?utf-8?B?NGVQeHBsT2wvdTdzVHk0cDdrdGJkWHJOVjN6RlFQZ1dEQzg2bFBVa084bWky?=
 =?utf-8?B?QldQQmJUVXdqMnZQS3dTL3dwWlNVS0JDdUNQN1ltS1QvMnlTOU1uTVNBVDJY?=
 =?utf-8?B?SzhTS2RkSGlwYXAybTNRZ0gyTXlNbTJzU3UyVkJRRkZscXpXQ1FCWUltbUNR?=
 =?utf-8?B?OHRKN0tpaDV2bGNITlZVRXhKSzlkWFVsZzdKUFhncjRWZ3puckJjMktQeG95?=
 =?utf-8?B?dVVzWjFVbDAwblc3R25Va0ViYU9PS0huL1JkcG95RUNpdm9wUHpaV0JyMlpw?=
 =?utf-8?B?eVIzSEhtc2l0K1Y5QnZsbS81SzlTV0VYd05ET2Q2S1F2TSsvVDlIR2hqSkdL?=
 =?utf-8?B?OXdQem55OW01VVUyWG0vSUdjeGF5TkZuRmd3WHR0WUZPaGVFVVl6V0RyQ00z?=
 =?utf-8?B?U0I0eDNLSU5VUFVqcmJOd2gzbVp2RXpFUnU0T1B0MUNVQUNlT2FQSUlVNlJm?=
 =?utf-8?B?dmd0a05hVHZYZ2pFdVBOUVRiUTV2SktnUTFGVjdSNGZTbDkxbmF6d1BZWGxB?=
 =?utf-8?B?V3ZoZWZvL09VOGxnNzVYOUtnd3RweWhnejVTZWNCblhSeWowcHFoMW5QcCtv?=
 =?utf-8?B?dElCd21FRWZTNW9sQTU3RzYyeHpaWHMxQUJNV2xsdndPMGRLOHl5WlJwOFFT?=
 =?utf-8?B?WDkrL2Uxekk5emhUVUw0VTJCaFFkenVmMDMwRmJSMUVpcEk0S05nV2JxVXFI?=
 =?utf-8?B?RndRLzIxL3ZPM3hFQXl0WndrMGpCNmd1cEtmZ2UxblpEZGdGdmVIRnFVcWNT?=
 =?utf-8?Q?qamh3RBQ0alXI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2877dccf-ee4d-4586-f5fc-08d8a5b9b4e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2020 14:07:09.4339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2EG8ULf6BssZhp9cKxjb1pVX4W9fls/9gBC9oOqAf248yqCXSpAmugYGQsvmZVr4dBikmNxQvwjpZhcyEvuKz8kitoLyxbp6oIsUHgvgTWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2710
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxzYS1kZXZlbCA8YWxz
YS1kZXZlbC1ib3VuY2VzQGFsc2EtcHJvamVjdC5vcmc+IE9uDQo+IEJlaGFsZiBPZiBTaXQsIE1p
Y2hhZWwgV2VpIEhvbmcNCj4gU2VudDogVHVlc2RheSwgMTUgRGVjZW1iZXIsIDIwMjAgNjoxNSBQ
TQ0KPiBUbzogTGFycy1QZXRlciBDbGF1c2VuIDxsYXJzQG1ldGFmb28uZGU+OyBhbHNhLWRldmVs
QGFsc2EtDQo+IHByb2plY3Qub3JnDQo+IENjOiBSb2pld3NraSwgQ2V6YXJ5IDxjZXphcnkucm9q
ZXdza2lAaW50ZWwuY29tPjsNCj4gdGl3YWlAc3VzZS5jb207IFNpYSwgSmVlIEhlbmcgPGplZS5o
ZW5nLnNpYUBpbnRlbC5jb20+OyBwaWVycmUtDQo+IGxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwu
Y29tOyBsaWFtLnIuZ2lyZHdvb2RAbGludXguaW50ZWwuY29tOw0KPiBicm9vbmllQGtlcm5lbC5v
cmcNCj4gU3ViamVjdDogUkU6IFtQQVRDSCAyLzJdIEFTb0M6IEludGVsOiBLTUI6IEVuYWJsZSBE
TUEgdHJhbnNmZXINCj4gbW9kZQ0KPiANCj4gDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4gRnJvbTogTGFycy1QZXRlciBDbGF1c2VuIDxsYXJzQG1ldGFmb28uZGU+DQo+
ID4gU2VudDogVHVlc2RheSwgMTUgRGVjZW1iZXIsIDIwMjAgNTo0MSBQTQ0KPiA+IFRvOiBTaXQs
IE1pY2hhZWwgV2VpIEhvbmcgPG1pY2hhZWwud2VpLmhvbmcuc2l0QGludGVsLmNvbT47DQo+ID4g
YWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnDQo+ID4gQ2M6IFJvamV3c2tpLCBDZXphcnkgPGNl
emFyeS5yb2pld3NraUBpbnRlbC5jb20+Ow0KPiB0aXdhaUBzdXNlLmNvbTsgU2lhLA0KPiA+IEpl
ZSBIZW5nIDxqZWUuaGVuZy5zaWFAaW50ZWwuY29tPjsgcGllcnJlLQ0KPiA+IGxvdWlzLmJvc3Nh
cnRAbGludXguaW50ZWwuY29tOyBsaWFtLnIuZ2lyZHdvb2RAbGludXguaW50ZWwuY29tOw0KPiA+
IGJyb29uaWVAa2VybmVsLm9yZw0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBBU29DOiBJ
bnRlbDogS01COiBFbmFibGUgRE1BDQo+IHRyYW5zZmVyIG1vZGUNCj4gPg0KPiA+IE9uIDEyLzE1
LzIwIDY6MzMgQU0sIE1pY2hhZWwgU2l0IFdlaSBIb25nIHdyb3RlOg0KPiA+ID4gWy4uLl0NCj4g
PiA+ICtzdGF0aWMgaW5saW5lIHZvaWQga21iX2kyc19lbmFibGVfZG1hKHN0cnVjdCBrbWJfaTJz
X2luZm8NCj4gPiAqa21iX2kycywNCj4gPiA+ICt1MzIgc3RyZWFtKSB7DQo+ID4gPiArCXUzMiBk
bWFfcmVnOw0KPiA+ID4gKw0KPiA+ID4gKwlkbWFfcmVnID0gcmVhZGwoa21iX2kycy0+aTJzX2Jh
c2UgKyBJMlNfRE1BQ1IpOw0KPiA+ID4gKwkvKiBFbmFibGUgRE1BIGhhbmRzaGFrZSBmb3Igc3Ry
ZWFtICovDQo+ID4gPiArCWlmIChzdHJlYW0gPT0gU05EUlZfUENNX1NUUkVBTV9QTEFZQkFDSykN
Cj4gPiA+ICsJCWRtYV9yZWcgfD0gSTJTX0RNQUVOX1RYQkxPQ0s7DQo+ID4gPiArCWVsc2UNCj4g
PiA+ICsJCWRtYV9yZWcgfD0gSTJTX0RNQUVOX1JYQkxPQ0s7DQo+ID4gPiArDQo+ID4gPiArCXdy
aXRlbChkbWFfcmVnLCBrbWJfaTJzLT5pMnNfYmFzZSArIEkyU19ETUFDUik7IH0NCj4gPiA+ICsN
Cj4gPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQga21iX2kyc19kaXNhYmxlX2RtYShzdHJ1Y3Qga21i
X2kyc19pbmZvDQo+ID4gKmttYl9pMnMsDQo+ID4gPiArdTMyIHN0cmVhbSkgew0KPiA+ID4gKwl1
MzIgZG1hX3JlZzsNCj4gPiA+ICsNCj4gPiA+ICsJZG1hX3JlZyA9IHJlYWRsKGttYl9pMnMtPmky
c19iYXNlICsgSTJTX0RNQUNSKTsNCj4gPiA+ICsJLyogRGlzYWJsZSBETUEgaGFuZHNoYWtlIGZv
ciBzdHJlYW0gKi8NCj4gPiA+ICsJaWYgKHN0cmVhbSA9PSBTTkRSVl9QQ01fU1RSRUFNX1BMQVlC
QUNLKSB7DQo+ID4gPiArCQlkbWFfcmVnICY9IH5JMlNfRE1BRU5fVFhCTE9DSzsNCj4gPiA+ICsJ
CXdyaXRlbCgxLCBrbWJfaTJzLT5pMnNfYmFzZSArIEkyU19SVFhETUEpOw0KPiA+ID4gKwl9IGVs
c2Ugew0KPiA+ID4gKwkJZG1hX3JlZyAmPSB+STJTX0RNQUVOX1JYQkxPQ0s7DQo+ID4gPiArCQl3
cml0ZWwoMSwga21iX2kycy0+aTJzX2Jhc2UgKyBJMlNfUlJYRE1BKTsNCj4gPiA+ICsJfQ0KPiA+
ID4gKwl3cml0ZWwoZG1hX3JlZywga21iX2kycy0+aTJzX2Jhc2UgKyBJMlNfRE1BQ1IpOw0KPiA+
DQo+ID4gRG9lcyB0aGlzIG5lZWQgbG9ja2luZz8gSSBiZWxpZXZlIGl0IGlzIHBvc3NpYmxlIGZv
ciB0aGUgc3RhcnR1cA0KPiA+IGNhbGxiYWNrIG9mIHRoZSBwbGF5YmFjayBhbmQgY2FwdHVyZSBz
dHJlYW0gdG8gYmUgY2FsbGVkDQo+IGNvbmN1cnJlbnRseS4NCj4gPg0KPiBQaWVycmUgZGlkIHJh
aXNlZCB0aGlzIGNvbmNlcm4gcHJldmlvdXNseSBhbmQgY2hlY2tlZCB0aGF0IHRoZQ0KPiB1cHBl
ciBsYXllcnMgaGFzIGFscmVhZHkgYSBsb2NraW5nIG1lY2hhbmlzbSBpbiBwbGFjZSBiZWZvcmUg
dGhpcw0KPiBpcyBjYWxsZWQuDQo+IElmIHdlIGxvb2sgYXQgdGhlIHVzZXMgb2Ygc25kX3NvY19k
YWlfc3RhcnR1cCgpIGFuZA0KPiBzbmRfc29jX2RhaV9zaHV0ZG93bigpLCB0aGV5IGFyZSBhbGwg
cHJvdGVjdGVkIGJ5DQo+IG11dGV4X2xvY2tfbmVzdGVkKCZydGQtPmNhcmQtPnBjbV9tdXRleCwg
cnRkLT5jYXJkLQ0KPiA+cGNtX3N1YmNsYXNzKTsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiAg
IHN0YXRpYyB2b2lkIGttYl9pMnNfc3RhcnQoc3RydWN0IGttYl9pMnNfaW5mbyAqa21iX2kycywN
Cj4gPiA+ICAgCQkJICBzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSkNCj4gPiA+
ICAgew0KPiA+ID4gQEAgLTM1Niw3ICs0MDUsMTEgQEAgc3RhdGljIHZvaWQga21iX2kyc19zdGFy
dChzdHJ1Y3QNCj4gPiBrbWJfaTJzX2luZm8gKmttYl9pMnMsDQo+ID4gPiAgIAllbHNlDQo+ID4g
PiAgIAkJd3JpdGVsKDEsIGttYl9pMnMtPmkyc19iYXNlICsgSVJFUik7DQo+ID4gPg0KPiA+ID4g
LQlrbWJfaTJzX2lycV90cmlnZ2VyKGttYl9pMnMsIHN1YnN0cmVhbS0+c3RyZWFtLA0KPiA+IGNv
bmZpZy0+Y2hhbl9uciwgdHJ1ZSk7DQo+ID4gPiArCWlmIChrbWJfaTJzLT51c2VfcGlvKQ0KPiA+
ID4gKwkJa21iX2kyc19pcnFfdHJpZ2dlcihrbWJfaTJzLCBzdWJzdHJlYW0tDQo+ID4gPnN0cmVh
bSwNCj4gPiA+ICsJCQkJICAgIGNvbmZpZy0+Y2hhbl9uciwgdHJ1ZSk7DQo+ID4gPiArCWVsc2UN
Cj4gPiA+ICsJCWttYl9pMnNfZW5hYmxlX2RtYShrbWJfaTJzLCBzdWJzdHJlYW0tDQo+ID4gPnN0
cmVhbSk7DQo+ID4gPg0KPiA+ID4gICAJaWYgKGttYl9pMnMtPm1hc3RlcikNCj4gPiA+ICAgCQl3
cml0ZWwoMSwga21iX2kycy0+aTJzX2Jhc2UgKyBDRVIpOw0KPiA+IFsuLi5dDQpBbnkgZnVydGhl
ciBjb21tZW50cyBvbiB0aGlzIHBhdGNoIHNldD8NCg==
