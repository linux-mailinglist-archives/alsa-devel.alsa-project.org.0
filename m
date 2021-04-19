Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7492363AF3
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 07:16:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4931B1695;
	Mon, 19 Apr 2021 07:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4931B1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618809383;
	bh=mn+ZNpp6byVFTCrzKIIng6HQXZxpVUQMiVdPNpRdczw=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U2FS49E8+1M76PIbbnGBAqqR1VBYAFRsjroLRitfFpZeGUcAEZrRoiHwrAdeTM11p
	 PfpVPgjNA40XLtUWxMiDcy/838BWrFvd95fVUtpbyzIvTGk2hhCLsuKL/E6I1EO+M5
	 1PuAjmeJ5c2Izn6TX63TAWhJRwAXIkHfJt3KBPPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FD5BF800C5;
	Mon, 19 Apr 2021 07:14:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40F26F80227; Mon, 19 Apr 2021 07:14:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F9FDF8014D
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 07:14:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F9FDF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="N8LsUcuX"
IronPort-SDR: Qh1W0kYzieWQkZJCZvMeZEmJcecveZhLiAe9aryTISZRAQfXSkua26EoKG0iJNzq1cZQKgkGnK
 RFPoc6n5bWxg==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="174758517"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="174758517"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 22:14:40 -0700
IronPort-SDR: 1X8PIhNSnpGxMicDl2gL37HxQea6mR6mnxCQG34wX2L5so8ulcUtKbRUnb8GeuUv3mBDAUAP8x
 hx4fUsqGtF9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="602038616"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga005.jf.intel.com with ESMTP; 18 Apr 2021 22:14:39 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 18 Apr 2021 22:14:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Sun, 18 Apr 2021 22:14:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Sun, 18 Apr 2021 22:14:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2xDOwHiYLSCaTylsTZjgWyHvdA2PHRMivRQ4gzIY9HeTfB0d6x2C7/v8pp8P5H02qkxe+Y7rhbc4M/LhahTUVm4E6zxACOx9mg/tNiXXCtYsSQlPX0q8nnmLLGQsPkt4beIWHKi2Nc4DcpePd/pa0KBMHiCE7H3zhZN4zt44uJJt/+jW2oDJ4PVOTY3AEEAKlUshaH3lnOVYMX5y9z8+4whmJtaZ9ojjUwZzun8i6Ep3YCDQQmHLqYwDNmmM3yVJQhv2hEeuXIfQK9tagISY46hhPxIJDq2BHnAxUnavV/USN3/YAlEtu99lXtrD4XoYvPBa2jrjwjp4S2P0XXt2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mn+ZNpp6byVFTCrzKIIng6HQXZxpVUQMiVdPNpRdczw=;
 b=nKw7D5kjjLq4BxRfJqErdMKbbIDivlB6VOuT+oPZugMAXJDglUDlpD5i5GsT8reOojwpJLf5Y3sIilNJYkweUsfiGcFqjF/DVIC8HaQ2iUbZOyBLkbHBGq2damIT5HJtsGyrN04clsIO6F4iAAtA95A3f84fvEa24UKF8bYSI+iUqr6CjhQbXjORA9gDuhlpB62WmmybAsJ74iNqi+dDR3o/uBvrnwklx7rMg7EPPtCxOMermGEWkc6/iMSJaR/SEogvPT1p1l7hZ+Jt/ZaiP6vxtrFyUTJTvWYo95HWPMZkZprV4Epn0K5Y+HSkthb1QuJIYyINhhZ+Y3lntrHYCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mn+ZNpp6byVFTCrzKIIng6HQXZxpVUQMiVdPNpRdczw=;
 b=N8LsUcuX+id445p7a/hRidS0cMJbCzrDuqjwYmlGNZW24cPs//MDYB8S3bJCwDk+8M+S0+U7X1sdfCBe5+o/jB1WuL6KGIWq61+dlWGGbo411PqRS5noG7sr+SJCMHiNiepcL+iI9N3ZLn6pUBzeznk5y+fAIUidhX0s7lwlayY=
Received: from BN6PR11MB1652.namprd11.prod.outlook.com (2603:10b6:405:10::13)
 by BN9PR11MB5228.namprd11.prod.outlook.com (2603:10b6:408:135::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 05:14:36 +0000
Received: from BN6PR11MB1652.namprd11.prod.outlook.com
 ([fe80::9863:5eed:596a:e4c3]) by BN6PR11MB1652.namprd11.prod.outlook.com
 ([fe80::9863:5eed:596a:e4c3%4]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 05:14:35 +0000
From: "Yang, Libin" <libin.yang@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "shumingf@realtek.com" <shumingf@realtek.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Subject: RE: [PATCH] ASoC: rt711-sdca: remove capture switch controls
Thread-Topic: [PATCH] ASoC: rt711-sdca: remove capture switch controls
Thread-Index: AQHXMdgjKGxZxqCQzUO3d8W4zJrgf6q1cGQAgAXfzHA=
Date: Mon, 19 Apr 2021 05:14:35 +0000
Message-ID: <BN6PR11MB1652220DB80760FD18B8308290499@BN6PR11MB1652.namprd11.prod.outlook.com>
References: <20210415091609.13695-1-shumingf@realtek.com>
 <6c5b52e2-c875-9b30-60dd-d4bec77a9215@linux.intel.com>
In-Reply-To: <6c5b52e2-c875-9b30-60dd-d4bec77a9215@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.223]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6612043-ec35-47e1-843e-08d902f20606
x-ms-traffictypediagnostic: BN9PR11MB5228:
x-microsoft-antispam-prvs: <BN9PR11MB52287D5944720D1AE9447B4990499@BN9PR11MB5228.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:139;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GKpHvZfLbTjx9Z6/VqUASJV3erJxlN8S8EujkYkSrNJO3AYSmpwnGGdJstNl5E4Z39bnObv9UPmVNBSSmsh4j5rITFv75MbpJ4tc1kaA3Exf01+cvJQPdkThWxTjJZ0i4rILBLIUB0Cdbh9DhJ/ynVlKUIdR4H3aIV+Vri+JE1XFmkOT9DyJHg8SOtLvrpjKpXV6oc+o8OXr1G+GLt/zTF1AxzWNnpd0MJC4B9oBxI9DC8eY0preZ4zfG63jaEgq2BNx/HnCLGHvLaLBMCq8VMmvGLeRxuhFuHn48zHOSiIIGkLIjKoM+RAK/B0p+NipfGCgL/gsxF/VR0XPJtzDPWmt63k6Sa+mt1jdpLv+PsKY18/grO5aTGU1cJ5DAuuzHwav4XQBTrX/A2YIy0tJyvAOjujYi1DEg8OpOQBN0GcxyQaVxjgRlDYgeS1xS7yHWO7UOc+Px+AniMnCR4IrwScbEj+XuJW3HBMgDgSKEPgxH3I8WjPyOsi5QaTu6pDOvgowroP8kt0gUSOFTjJO8S2WjqrF66RGhgBpkpXXTNWKa0vu2Pf0navuV+1BaRZP4frGPp+zmdJJiid2q9wNvoG9OzG1oihTn/wu6gPCmHmnaFCNpGKvLF8QuCB3NQNRtCacNpZnCA/syNRRkaZYNnp+KgafDG1nBbnJGGsNSQ0QBmpQootHyXwqFljzYGfP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1652.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(376002)(39860400002)(136003)(346002)(7696005)(38100700002)(86362001)(8936002)(110136005)(2906002)(76116006)(122000001)(26005)(33656002)(6506007)(5660300002)(83380400001)(186003)(4326008)(966005)(54906003)(52536014)(8676002)(66946007)(316002)(64756008)(66476007)(71200400001)(478600001)(66446008)(55016002)(53546011)(9686003)(66556008)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Y25Idm1vSXhDNjdwLzlubzdaZVpoWlZycTB1NWlOVG16NGcwdERZMXV4UFZB?=
 =?utf-8?B?Q3Q2RUFPeGlQbWRMTnlKMDhFOER6WjZRbitnWEwrWWM5QWw1Vkp0YTBsK2o2?=
 =?utf-8?B?NnF0TENOUG9OYjgxSTc2NnhRenJuazBwMHZ4SDBQYjJvNnBQbVg1QWpUdHZj?=
 =?utf-8?B?NHZsNDFyNG95cVlwNUtVcDJ1V3pGWnVjOFlCdVd4dUN2NjRzY0o4VkxMWkdm?=
 =?utf-8?B?a3lVZlUwcmhMNU8vZ092ZHByKy9DTEFQM1N2SXdiR1RoeGxPTHhzRGEwWHho?=
 =?utf-8?B?RmxhREo4aGdoT0dzRUFML3F4eUlUT3lyV3Q5cHpyVW1SSW5zcUhiWWdyOUFH?=
 =?utf-8?B?eGx1aU56YThkNzVydG5VaHY1aHBvejB4MFNIdzRuYXVMOThNYk81V1UzSWox?=
 =?utf-8?B?bEtzcGgzdFFYQzFwQ2FkQWVoYXo5S0w1Y2RYVjVTaGJSaU55dGsvcTZ2c2Iw?=
 =?utf-8?B?M2NjclpBYnFPdUI5MHppbXE0QW5hVjJoUm1QeGpWcld4dTdkSDY3OXRweVRo?=
 =?utf-8?B?cExMTFZMdVROSERVbHdDVUNJbFlpSnE5SUo5Mk93cFFDbUM1U205QTExTzNs?=
 =?utf-8?B?Z2hMd2xFbTRJR1VIUGlQd21Vd3BaV3NaTDUwbEpYMTlyUUxWUndrYkp6cU4y?=
 =?utf-8?B?cFdIWkErZGlFdldKWnNVSU9ocW5MOUpRK2pJSHpEWHJRcm51Q045ZG5kZlp3?=
 =?utf-8?B?RmFrRjRReG1VcnhzRC9tR0JrOERMcWt0MUc2Z2EzQVBpcjBQRy9zWSt0L3hj?=
 =?utf-8?B?cXNQRUZSVDAzKzlxU0NmbEFjT29YcFFQaTFndjh4WlpDMU9ZYk9RZWhCMFM0?=
 =?utf-8?B?UXo5U0d5Rkk0MlV1ZGN0MENaNm9jUlM4aXhNckJIVER2UC9KTGF6VUVSSms2?=
 =?utf-8?B?RXNtaU5GL0lXdGlyMWJLNzZkeG5lSjEwanJZOEVMMGF1RmM3RklGWWh3aXA3?=
 =?utf-8?B?ck1rNkY3WGZPcHM3eFc3QS81RDlQU0UxdGd1ZzNhSDZOWnlWRm5idS9lT252?=
 =?utf-8?B?dmtqWjRQZmlLV09YYWJMT3hBcjhWUnoyY0hld3Y1K2JDeFFEdzl6cm9vNFM4?=
 =?utf-8?B?MzhoejVpSWo2S3kwRlJWa1RXd3VXdER0cUVmL2lkY3ZzZFVYVXRxTlBsWFJF?=
 =?utf-8?B?RHZKK2E5a3FWS0w5UERWdFdXM01rMG4zRlJLaExIMjNSeFo3U056elBaYXhX?=
 =?utf-8?B?NnhTSlBhQ0szLzNoeHU2bnFjSEQ4elJCaDdaZWR1RngyZWwxalVPSVBjc2p3?=
 =?utf-8?B?NG1CSEFGNEFIQk9mblRvRjJHUTI4d05jSUFkUXRmdTU0OEJzbmFKU0ZLaDMr?=
 =?utf-8?B?NElCbDQvUm9LRGVZTlpOb3Z0WjVtWUJTS2pSOTNZTUZHMEwxMEMweloybXM1?=
 =?utf-8?B?ZXdSQUhEdm53NllOSzEvVmlmVm9iUWc4aThTNytGUnFmL2swZjZkTlFXQUhm?=
 =?utf-8?B?eEIydVdZZFlWcTgyZGpOY01rMGd0cGZEQzVRZno5czNvZU9aQzRDS1V5WWJL?=
 =?utf-8?B?SXRha2lqUEVGT2FJYW02eXpkRFpPOUFueDhCVnJTTDVwMWdXS1FCQ01TTkxR?=
 =?utf-8?B?c3R6cG9SbjRhby9XZ3lSMXJoaXIxMjljQ3VlQitGb3RxdmY5Z3l2M3o0bjNE?=
 =?utf-8?B?Nmx0WjgwM2VpenU4ZFBEU21LY0lnNURwd001K01zb2hMY3ZSeW9vQU4zR3gw?=
 =?utf-8?B?MXBITWdPYWM4dzA4QVBpWWJZYUVzVm12N0h0QnJmM1RzNmw2ZWtPMUN1VkNW?=
 =?utf-8?Q?LHFZwSbUqdbmy1Qv1mXJ/CDIaMbxW2OdvVio1QU?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1652.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6612043-ec35-47e1-843e-08d902f20606
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 05:14:35.4977 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FyhkoEtwhaTO+/jPNwunorA+Z5nQ0QJnvqX/Ohgl3XUO1A7emfCGCjZoE+HNJMSEAd/mvTlkj4MdoJO1639LeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5228
X-OriginatorOrg: intel.com
Cc: "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "jack.yu@realtek.com" <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "derek.fang@realtek.com" <derek.fang@realtek.com>,
 "flove@realtek.com" <flove@realtek.com>
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

SGkgUGllcnJlLA0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGll
cnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4N
Cj4gU2VudDogMjAyMeW5tDTmnIgxNeaXpSAxOToyNg0KPiBUbzogc2h1bWluZ2ZAcmVhbHRlay5j
b207IGJyb29uaWVAa2VybmVsLm9yZzsgbGdpcmR3b29kQGdtYWlsLmNvbQ0KPiBDYzogb2Rlcl9j
aGlvdUByZWFsdGVrLmNvbTsgamFjay55dUByZWFsdGVrLmNvbTsgYWxzYS1kZXZlbEBhbHNhLQ0K
PiBwcm9qZWN0Lm9yZzsgbGFyc0BtZXRhZm9vLmRlOyBZYW5nLCBMaWJpbiA8bGliaW4ueWFuZ0Bp
bnRlbC5jb20+Ow0KPiBkZXJlay5mYW5nQHJlYWx0ZWsuY29tOyBmbG92ZUByZWFsdGVrLmNvbQ0K
PiBTdWJqZWN0OiBSZTogW1BBVENIXSBBU29DOiBydDcxMS1zZGNhOiByZW1vdmUgY2FwdHVyZSBz
d2l0Y2ggY29udHJvbHMNCj4gDQo+IA0KPiANCj4gT24gNC8xNS8yMSA0OjE2IEFNLCBzaHVtaW5n
ZkByZWFsdGVrLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBTaHVtaW5nIEZhbiA8c2h1bWluZ2ZAcmVh
bHRlay5jb20+DQo+ID4NCj4gPiBUaGUgc2V0dGluZ3Mgb2YgdGhlIHN3aXRjaCBjb250cm9sIGFs
cmVhZHkgc2V0IGJ5IERBUE0gZXZlbnQuDQo+ID4gVGhlc2Ugc3dpdGNoIGNvbnRyb2xzIG1pZ2h0
IHRoZSB1c2VyIGNvbmZ1c2VkIHdoeSBpdCBjYW4ndCBkaXNhYmxlIHRoZQ0KPiBjYXB0dXJlLg0K
PiANCj4gU29ycnksIG5vdCBmb2xsb3dpbmcuIFRoaXMgY29udHJvbCBpcyB1c2VkIGluIHRoZSBh
bHNhLXVjbS1jb25mIHRoYXQgd2FzIGp1c3QNCj4gbWVyZ2VkDQo+IA0KPiBodHRwczovL2dpdGh1
Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdWNtLQ0KPiBjb25mL2NvbW1pdC8xOTcwMjU2NTZlYzQ1
NjMzMWQxYTM0MzU3YjExMzkxM2VjM2IxODdmI2RpZmYtDQo+IDBlMWM2MjdlYTg5ZWUxNDhmZGI0
MWFhNmIzYmE3ODUxYmE5YzIwZWI0M2MxYjg3YjllMGNlOTIxNjQyNzNkYzNSDQo+IDcNCj4gDQo+
IElzIHRoaXMgc2F5aW5nIHRoaXMgY29tbWl0IG5lZWRzIHRvIGJlIGZpeGVkIHdpdGggYSBmb2xs
b3ctdXAgUFI/IExpYmluLCBhcmUNCj4geW91IHdvcmtpbmcgb24gdGhpcz8NCg0KWWVzLCBJIHdp
bGwgc3VibWl0IGEgcGF0Y2ggZm9yIFVDTSBhZnRlciB0aGlzIHBhdGNoIGlzIG1lcmdlZC4NCg0K
VGhlIGJhY2tncm91bmQgaXMgSmFyb3NsYXYgcmVxdWlyZXMgdXNpbmcgY29kZWMgSFcga2NvbnRy
b2wgZm9yIGNhcHR1cmUNCnZvbHVtZS9zd2l0Y2guIFNodW1pbmcgYW5kIEkgd29ya2VkIG9uIGl0
LiBBdCBmaXJzdCB3ZSB3YW50ZWQgdG8gdXNlDQpGVTBGIHRvIHJlcGxhY2UgUEdBIGtjb250cm9s
LiBCdXQgU2h1bWluZyBmb3VuZCBGVTBGIGlzIHVzZWQgaW4gREFQTS4NClNvIGl0IGlzIG5vdCBw
cm9wZXIgZm9yIHRoZSBjYXB0dXJlIHZvbHVtZS9zd2l0Y2guIEFuZCBTaHVtaW5nIHdpbGwgcmVt
b3ZlDQp0aGUgRlUwRiBrY29udHJvbC4NCg0KUmVnYXJkcywNCkxpYmluDQoNCj4gDQo+IA0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogU2h1bWluZyBGYW4gPHNodW1pbmdmQHJlYWx0ZWsuY29tPg0K
PiA+IC0tLQ0KPiA+ICAgc291bmQvc29jL2NvZGVjcy9ydDcxMS1zZGNhLmMgfCA4IC0tLS0tLS0t
DQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgOCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9zb3VuZC9zb2MvY29kZWNzL3J0NzExLXNkY2EuYyBiL3NvdW5kL3NvYy9jb2RlY3MvcnQ3
MTEtDQo+IHNkY2EuYw0KPiA+IGluZGV4IGJmYjdmMWM4ZWM4Zi4uMmEwOWMzMDVmNGU0IDEwMDY0
NA0KPiA+IC0tLSBhL3NvdW5kL3NvYy9jb2RlY3MvcnQ3MTEtc2RjYS5jDQo+ID4gKysrIGIvc291
bmQvc29jL2NvZGVjcy9ydDcxMS1zZGNhLmMNCj4gPiBAQCAtNjUyLDE0ICs2NTIsNiBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHNuZF9rY29udHJvbF9uZXcNCj4gcnQ3MTFfc2RjYV9zbmRfY29udHJv
bHNbXSA9IHsNCj4gPiAgIAkJU0RXX1NEQ0FfQ1RMKEZVTkNfTlVNX0pBQ0tfQ09ERUMsDQo+IFJU
NzExX1NEQ0FfRU5UX1VTRVJfRlUwNSwgUlQ3MTFfU0RDQV9DVExfRlVfVk9MVU1FLCBDSF9SKSwN
Cj4gPiAgIAkJMHg1NywgMHg1NywgMCwNCj4gPiAgIAkJcnQ3MTFfc2RjYV9zZXRfZ2Fpbl9nZXQs
IHJ0NzExX3NkY2Ffc2V0X2dhaW5fcHV0LA0KPiBvdXRfdm9sX3RsdiksDQo+ID4gLQlTT0NfRE9V
QkxFX1IoIkZVMUUgQ2FwdHVyZSBTd2l0Y2giLA0KPiA+IC0JCVNEV19TRENBX0NUTChGVU5DX05V
TV9NSUNfQVJSQVksDQo+IFJUNzExX1NEQ0FfRU5UX1VTRVJfRlUxRSwgUlQ3MTFfU0RDQV9DVExf
RlVfTVVURSwgQ0hfTCksDQo+ID4gLQkJU0RXX1NEQ0FfQ1RMKEZVTkNfTlVNX01JQ19BUlJBWSwN
Cj4gUlQ3MTFfU0RDQV9FTlRfVVNFUl9GVTFFLCBSVDcxMV9TRENBX0NUTF9GVV9NVVRFLCBDSF9S
KSwNCj4gPiAtCQkwLCAxLCAxKSwNCj4gPiAtCVNPQ19ET1VCTEVfUigiRlUwRiBDYXB0dXJlIFN3
aXRjaCIsDQo+ID4gLQkJU0RXX1NEQ0FfQ1RMKEZVTkNfTlVNX0pBQ0tfQ09ERUMsDQo+IFJUNzEx
X1NEQ0FfRU5UX1VTRVJfRlUwRiwgUlQ3MTFfU0RDQV9DVExfRlVfTVVURSwgQ0hfTCksDQo+ID4g
LQkJU0RXX1NEQ0FfQ1RMKEZVTkNfTlVNX0pBQ0tfQ09ERUMsDQo+IFJUNzExX1NEQ0FfRU5UX1VT
RVJfRlUwRiwgUlQ3MTFfU0RDQV9DVExfRlVfTVVURSwgQ0hfUiksDQo+ID4gLQkJMCwgMSwgMSks
DQo+ID4gICAJU09DX0RPVUJMRV9SX0VYVF9UTFYoIkZVMUUgQ2FwdHVyZSBWb2x1bWUiLA0KPiA+
ICAgCQlTRFdfU0RDQV9DVEwoRlVOQ19OVU1fTUlDX0FSUkFZLA0KPiBSVDcxMV9TRENBX0VOVF9V
U0VSX0ZVMUUsIFJUNzExX1NEQ0FfQ1RMX0ZVX1ZPTFVNRSwgQ0hfTCksDQo+ID4gICAJCVNEV19T
RENBX0NUTChGVU5DX05VTV9NSUNfQVJSQVksDQo+IFJUNzExX1NEQ0FfRU5UX1VTRVJfRlUxRSwg
UlQ3MTFfU0RDQV9DVExfRlVfVk9MVU1FLCBDSF9SKSwNCj4gPg0K
