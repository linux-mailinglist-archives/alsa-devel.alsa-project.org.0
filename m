Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5752EBBC4
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jan 2021 10:41:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DF7E168C;
	Wed,  6 Jan 2021 10:40:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DF7E168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609926101;
	bh=7djTXpyMLxMrq6Q7b98dJ1WKbBNwMvmpNvsRcSrJFXw=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IDpNHfD8ynBRDfGXE5Ani+jDKI3XBOCRXfxVGxErXQGwjYoIchPZAf3oGmz43TMo3
	 UPuAMRmx0nlqKwDdJl44kKDNmzg4Iz18awJf7tNMxP2jLSXCjR+xY5DqU4Di5MKiKc
	 zXdd+we1p28EuP1u9LgpQKwfDtt+4UtCA4amuHUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67908F80165;
	Wed,  6 Jan 2021 10:40:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37CF7F80166; Wed,  6 Jan 2021 10:40:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0A15F800FD
 for <alsa-devel@alsa-project.org>; Wed,  6 Jan 2021 10:39:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0A15F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="pKFhFHNz"
IronPort-SDR: z5A+Bq2hmCPRGr6Qjz+gB6PR36CFhuhTjE7NEfAgspKMKMLJBGaL4JhGXfe/Gjibo0syy0JQ4v
 qFI09KJ8JN3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="238804102"
X-IronPort-AV: E=Sophos;i="5.78,479,1599548400"; d="scan'208";a="238804102"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2021 01:39:51 -0800
IronPort-SDR: RG2xzj1IjZR/8GH3hQh5lljzBJQPZrJNu3zVgPIXkQd1xrF8LBFrubMCeI4uVkGsj9z69DUamb
 UQ4J+RAovBaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,479,1599548400"; d="scan'208";a="350772810"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 06 Jan 2021 01:39:51 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 6 Jan 2021 01:39:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 6 Jan 2021 01:39:51 -0800
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.51) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 6 Jan 2021 01:39:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNuQZ3EnZaBKi38TBFvSmuAsFJU7QaDr0u4F0FkayXRFaUnh+KnwnvcwfRzYmqQqyL4kNDxSsQION0Z1tNhuNYz8zqjOTxK25R7CR4Ql05EDVxo72/vz76G2rx75LkWWH3QRHxhKpJwViYvRNzOEtoWk0nEEVa3B8jsqylpzZoNa4qRalTxGZgl35lmBUqMFnzqdXdOVx+JQcHB+Ac41jVAHfSTY2jJDXwcS5H5D+b2NT58GHLYk9BCfEkzGWCK50WTBl57nOt8iJy3z4hxScnxxgSWI5bY+//b+RApFAFdqhnxoHTm8h/Orf8aHA1FwqIbMXR5LQE3PLjFQZx9WjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7djTXpyMLxMrq6Q7b98dJ1WKbBNwMvmpNvsRcSrJFXw=;
 b=H7J1SJYA0DEmVq7RDcleN3HFQznw6JvUH+3Pu8G+ttO9AZwWHD9XnBesEkiUvC3PNifZZHJ7NUwR34Aci6gBXr7yyMJ3D0IkDpNZqE5z8N8FuF8u5xybgEpo9TedjvA+iPAT8ajYdp+iwo7+KI2VaPut+r3yB9EZyBbibmLcPmJezv5elkhMIjfiwhYT7vZlhfJiFhXZhvd3Yd/gy93cIOBNKRo3x382uit2V49CYujaPSkkPp4e0ChhRImnFUP4NZoGtJZlIo0pYMaxwASbQ6Ji6nTo52T6XQwPYJR5awBTnElozWOH+VlzrRh8IrX3HjucQB8s+foIpPfu1rJOZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7djTXpyMLxMrq6Q7b98dJ1WKbBNwMvmpNvsRcSrJFXw=;
 b=pKFhFHNziYFff+iq9Kh6URBEPJB+bEk+cpXLq95i4+LngKzcANxbYgB9upuevkAW9CiXrzVfyp9TQwf36gxUdGf1gmbYMwXedEYAjIVf07shrUAPc50hooiyB+4hzEAPOVuBL6pfVHcIw/TEK9sqceQA2HSxEIRChtnENEh3hOk=
Received: from PH0PR11MB5046.namprd11.prod.outlook.com (2603:10b6:510:3b::20)
 by PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 6 Jan
 2021 09:39:50 +0000
Received: from PH0PR11MB5046.namprd11.prod.outlook.com
 ([fe80::cc1:58e:2b52:e300]) by PH0PR11MB5046.namprd11.prod.outlook.com
 ([fe80::cc1:58e:2b52:e300%6]) with mapi id 15.20.3742.006; Wed, 6 Jan 2021
 09:39:50 +0000
From: "Yang, Libin" <libin.yang@intel.com>
To: Jack Yu <jack.yu@realtek.com>, Jaroslav Kysela <perex@perex.cz>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>
Subject: RE: [PATCH] ASoC: rt715: add main capture switch and main capture
 volume control
Thread-Topic: [PATCH] ASoC: rt715: add main capture switch and main capture
 volume control
Thread-Index: AQHW0eV09m89n6TiJEOuWxveV9zMx6n2M7iAgAB+OYCAABsJgIAAB80AgAEkcgCAAFnBgIAAB4eAgAAKwwCAAAcpAIAgZJcAgAF3v6A=
Date: Wed, 6 Jan 2021 09:39:50 +0000
Message-ID: <PH0PR11MB5046042ED34F28095C35A62990D00@PH0PR11MB5046.namprd11.prod.outlook.com>
References: <20201214064903.2746-1-jack.yu@realtek.com>
 <8eeddc8c-91cb-e62d-6114-547117d4d83e@perex.cz>
 <0096059b-de76-d9a3-2446-b4c3becabce8@linux.intel.com>
 <0b0afd81-0595-c661-ec1e-e81b7e8f8fec@perex.cz>
 <7d74544f-77f2-db01-db3d-d1d8a56d576d@linux.intel.com>
 <cb07f528-6c2f-1357-db54-e3d062ad6dd3@perex.cz>
 <bcdc2aba-ab7e-08bf-7e25-02e38c9d660d@linux.intel.com>
 <feb43fc8-39a3-9c50-1193-9115603c8fb8@perex.cz>
 <7bc9d35f-8bd6-4922-1900-8af729443377@linux.intel.com>
 <b25c849f-d1ed-f503-444f-3a49e0d03e7e@perex.cz>
 <0dad47e2445e474ea0a982163521f986@realtek.com>
In-Reply-To: <0dad47e2445e474ea0a982163521f986@realtek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: realtek.com; dkim=none (message not signed)
 header.d=none;realtek.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dddbeeb1-7cc9-41ce-8d9d-08d8b2270359
x-ms-traffictypediagnostic: PH0PR11MB4902:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR11MB49029FA4090D2ADA2FAA690290D00@PH0PR11MB4902.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gJbhqQY520jNfcdZHNDyT13JZQFw0RtXSRhaPCdbffXWWEkK6M5lEkE1VFUgu21cha5rvT1a44yWi6NXtA96PHedyOoJQsfsmtIM+kd99D7/XmRNvpUv5BH40fsv5kW7bWa2KfLO+37vozJECdvmQ1Y3Nrr/FUiT8W5YCwztLi4k0z1RjfvdfZzRnGyXOaAVbWcNGaAHf8jX2bl1MOtAxHp1UMYkKvkgrVRLVXNQDHQXpbRXeXXdX/FAZ8Ox13rcM3cSIQzRsSPKo3tFzR95Hti8aAX5sbSsDw7rJfRKkbZ5WKA1ZQZU0LDpJlt32RgMsIfxEP/e9IUbQEGLlNxfcCldGBup3+9iZCWKoiy5e8O1ssNHV8jsoxIyPnuVmkwXCO81rx1JeFNtin/AMK64319VJyYHeNFAv/kZ9wUAsmF7qT0VWK49ytttGwMiDlNxkiqzsaKLUd1Gbhm7aEZIKQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(186003)(26005)(6506007)(9686003)(110136005)(316002)(71200400001)(55016002)(966005)(8936002)(7696005)(4326008)(86362001)(2906002)(33656002)(66446008)(66556008)(7416002)(76116006)(66476007)(66946007)(64756008)(52536014)(54906003)(478600001)(5660300002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NCs5dzVRdXpNdTJTek4yQ0VRaGxjL3lZdFREZU96aUpZRStoUTBWckdVSTNs?=
 =?utf-8?B?YytKQjZQcVBMNEluOGExc1VPRDBFenJibnpZcjFnQVNUdEt3QnpyZUxqV3FS?=
 =?utf-8?B?WmdXd1pEcHdkZG5ld2tHeTlqc1RDdzZuWmF2OStXSkQyZzZMMEw4WFA4aHVW?=
 =?utf-8?B?SFByV1dtRjU0Rys0aEQ3MWZPRG9zeUp5ak5sSFE0T1F3UEV3NndZNC8wVVRs?=
 =?utf-8?B?RThkZ3Zac2tSNjhRdnlmbHkzZElzSEc2cWJoQTNUWGFWWlAwazFpaDRGVWlD?=
 =?utf-8?B?MWRQSTM5aDhyUG1nSThaTy9EY3FKdERNaGYxRFl4OWVJRHJZT09tOFlrbDVC?=
 =?utf-8?B?RmJmejBqMkRLWWFZNDJJazNHZDhzUUw1RWxXNGVXT0tlZW8zYXRRRklualIx?=
 =?utf-8?B?d09nK0l4dzNNMUdTb0hpYU5UQnNhSmlJVUtoK2FlSmpRdU9Uam1ra1BwNHYr?=
 =?utf-8?B?VE02c3VRZEgyRjRzVFV1WWxuQVBucjg1RmJKbmtEYjdzbElFRzFMU2hwU0xS?=
 =?utf-8?B?VW1UbUJ6N2EyTnFDMlFBd2IwZ2JGaWlsWHhxZVl2YmU0UDdCNXNwb1JqQktY?=
 =?utf-8?B?NUVFMGNqdXdERllBbGxLTmRHU3hmWi9wc0x1c2N0anFYSk1HcnQ4b2U1bGZy?=
 =?utf-8?B?THY4cStZZDlvZElSZ0pyaC9TY25BN05HNmZhODBkQTRSQk04bUlHOWRyTk9y?=
 =?utf-8?B?c2EyYWZnVFphTG93RS9FNkl4OTJGRkZjd001TXM5RkY0cVJ6bC9OVXhFdzV6?=
 =?utf-8?B?MmJoYTMzQUczNVJqQkl4Q2tIMlZIcWUzUHBBaW5DdkJuRi9jMmVMTk5kQTFq?=
 =?utf-8?B?eEt0WjhjRE51ekYxRzMvL2lFUEoxbWtsenl4V0trMVBiR294WENUbis5bzFD?=
 =?utf-8?B?L05nM0gzNWNQeTBadmFEUTJyYU05L1FVSXhRWGtDVXpkQWpQQ01WMFZxS0tH?=
 =?utf-8?B?bC9LU0krYjlla1FZTjM3VUxYZHB4VzdlNWlCQkJha0dUcE5wN0dJQkVPSXBh?=
 =?utf-8?B?UnR2VjFXcnJzV3dCM20xRU1RSWJuK0VqS3VKbExDWkd1TUhXaFNBQXZFYlJK?=
 =?utf-8?B?Ym5OdnJBTUdNM3J4WTlOcEdxbSt0c0oveThIbzlseHFITHlKRWJiNkFPWGNa?=
 =?utf-8?B?eVJWYm40UGIwSE5lRWVDWmVGdzUvb1FjeXpwdFdvNkNhSERmNk8yQURNa0Q2?=
 =?utf-8?B?cnAzc3RpSTJlUzcrRE1JMWFFb3JkUGo2aFRNNnBLQ2UrbkR0MGJCMC9yUlpQ?=
 =?utf-8?B?Tk9FRjdWRklhN3pnREdLMWxVb2p1TTVBV3FWTXNSa1p4ZDc3NDdkakFnNWFF?=
 =?utf-8?Q?Kyh12rzaSf2e0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dddbeeb1-7cc9-41ce-8d9d-08d8b2270359
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2021 09:39:50.1310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GwQCHIKJXNOCK0r+Z0FalawNylKLJ3tzQi5J8P+U9hXe2tH55d3O7hajp+AU9Pq6aMu+rnnmh/ZG5B0vv+niyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4902
X-OriginatorOrg: intel.com
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>, "Liao,
 Bard" <bard.liao@intel.com>,
 =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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

DQo+ID4NCj4gPiA+Pj4+IDMpIHdhaXQgdW50aWwgVUNNIGNhbiBkZXNjcmliZSB0aGlzIGhhcmR3
YXJlIGFuZCBzZXQgdGhlIERBQw0KPiA+ID4+Pj4gdmFsdWVzIG1hbnVhbGx5IHRvIGEgc2Vuc2li
bGUgdmFsdWUgdmlhIHNlcXVlbmNlcyAodGhlIHNwZWNpZmljDQo+ID4gPj4+PiBoYXJkd2FyZSBs
ZXZlbHMgY2FuIGJlIHNldCB1c2luZyB0aGUgY29uZGl0aW9ucyBpbiBVQ00pDQo+ID4gPj4+DQo+
ID4gPj4+IE5vdCBhbiBvcHRpb24sIHRoZXJlIGFyZSBwcm9kdWN0cyB0aGF0IG5lZWQgdG8gc2hp
cCBzb29uLg0KPiA+ID4+DQo+ID4gPj4gSXQncyB0aGUgZWFzaWVzdCBtZXRob2QgZm9yIG5vdy4g
SXQncyBqdXN0IGFib3V0IHRvIGNoYW5nZSB0aGUgVUNNDQo+ID4gPj4gZmlsZXMgd2l0aG91dCBh
bnkgb3RoZXIgY2hhbmdlcyBpbiB0aGUga2VybmVsIC8gdXNlciBzcGFjZS4gSXQncw0KPiA+ID4+
IGhlYXZpbHkgdXNlZCBmb3IgU1NUIGRyaXZlcnMsIGlzbid0Pw0KPiA+ID4+DQo+ID4gPj4gVGhl
IGN1cnJlbnQgVUNNIHVwc3RyZWFtIG1vZGlmaWVzIG9ubHkgU09GIHZvbHVtZSBsZXZlbHMgKFBH
QQ0KPiA+ID4+IE1hc3Rlcg0KPiA+IENhcHR1cmUpLg0KPiA+ID4NCj4gPiA+IHRoYXQncyBub3Qg
cmlnaHQsIHNlZSBhYm92ZS4NCj4gPiA+DQo+ID4gPiBJIG1heSBoYXZlIG1pc3VuZGVyc3Rvb2Qg
eW91ciBwb2ludCBmb3IgMykuIEkgYXNzdW1lZCB5b3UnZCBuZWVkIGENCj4gPiA+IGRlc2NyaXB0
aW9uIGNvbWluZyBmcm9tIHRoZSBrZXJuZWwsIGFzIHdlIGRpZCBiZWZvcmUgZm9yIHRoZQ0KPiA+
ID4gY29tcG9uZW50cyAoY2ZnLW1pY3MsIGV0YykuIEhvdyB3b3VsZCBVQ00ga25vdyB3aGljaCBv
ZiB0aGUgY29udHJvbHMNCj4gPiA+IHRvIHVzZSB3aXRob3V0IGFueSBjaGFuZ2UgdG8gdGhlIGtl
cm5lbD8NCj4gPg0KPiA+IElkZWFsbHksIHllcyAtIGl0IHdpbGwgaGVscCB0byByZWR1Y2UgdGhl
IGNvbmZpZ3VyYXRpb24gYW5kIHRoZSBkcml2ZXINCj4gPiBhbHJlYWR5IGtub3dzIG1vcmUgYWJv
dXQgdGhlIGhhcmR3YXJlLiBCdXQgd2UgY2FuIGRvIERNSSBtYXRjaGluZyBpbg0KPiA+IFVDTSBm
b3Igbm93LCB0b28uDQo+ID4NCj4gDQo+IEBMaWJpbiAgSXMgdGhpcyBtb2RpZmljYXRpb24gd29y
a2FibGUgZm9yIHlvdT8gSSdkIGxpa2UgdG8ga25vdyB5b3VyIG9waW5pb24NCj4gYWJvdXQgaXQu
IFRoYW5rcy4NCg0KSSB0aGluayBKYXJvc2xhdidzIHN1Z2dlc3Rpb24gb2YgbWF0Y2hpbmcgRE1J
IGlzIHJlYXNvbmFibGUuIA0KT25seSBzcGVjaWFsIHBsYXRmb3JtcyBzaG91bGQgdXNlIHRoaXMg
ZmVhdHVyZS4gTm9uLWRlbGwgb3IgDQpzb21lIG9sZCBkZWxsIHBsYXRmb3JtcyBzaG91bGQgbm90
IHVzZSB0aGlzIGZlYXR1cmUgaWYgSSB1bmRlcnN0YW5kIA0KY29ycmVjdGx5IGJhc2VkIG9uIA0K
aHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvYWxzYS1kZXZlbC9tc2cxMTgxMjMuaHRtbA0K
SW4gdGhlIGFib3ZlIGxpbmssIE1hcmlvIHNhaWQgdGhlIE1JQyBMRUQgaXMgY29udHJvbGxlZCBi
eSBIVywgbm90IHRoZSBTVy4NCg0KU28gdGhlIGNvZGVjIGRyaXZlciB3b24ndCBjb250cm9sIE1J
QyBMRUQuIEl0IG1lYW5zIG9uIG90aGVyIHBsYXRmb3JtcyANCndoaWNoIGRvZXNuJ3Qgc3VwcG9y
dCB0aGUgZmVhdHVyZSBvZiBIVyBjb250cm9sbGluZyBMRUQsIHVzaW5nIHRoZSBuZXcNCmtjb250
cm9sIGluIFVDTSB3aWxsIGNhdXNlIHNvbWUgaXNzdWVzLiBXaGVuIHVzZXIgcHJlc3MgdGhlIE1J
Qw0KbXV0ZSBrZXksIHRoZSBNSUMgTEVEIHdvbid0IGNoYW5nZSB0aGUgc3RhdHVzLg0KDQpSZWdh
cmRzLA0KTGliaW4NCg0KPiANCj4gPiBFeGFtcGxlIG9mIHRoZSBzeXNmcyBzdWJzdGl0dXRpb246
DQo+ID4NCj4gPiAgICR7c3lzOmNsYXNzL2RtaS9pZC9zeXNfdmVuZG9yfQ0KPiA+ICAgJHtzeXM6
Y2xhc3MvZG1pL2lkL3Byb2R1Y3RfdmVyc2lvbn0NCj4gPg0KPiA+IAkJCQkJCUphcm9zbGF2DQo+
ID4NCj4gPiAtLQ0KPiA+IEphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVyZXguY3o+DQo+ID4gTGlu
dXggU291bmQgTWFpbnRhaW5lcjsgQUxTQSBQcm9qZWN0OyBSZWQgSGF0LCBJbmMuDQo+ID4NCj4g
PiAtLS0tLS1QbGVhc2UgY29uc2lkZXIgdGhlIGVudmlyb25tZW50IGJlZm9yZSBwcmludGluZyB0
aGlzIGUtbWFpbC4NCg==
