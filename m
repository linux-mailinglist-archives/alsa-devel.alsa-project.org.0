Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAC1232B8E
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 07:48:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A76F174B;
	Thu, 30 Jul 2020 07:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A76F174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596088106;
	bh=1dbvIUep3N/SMuZFenB3fqhCSREGJ2fB0WpyE8EHgdM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r23Y0D9XBhQtV2jIH4z2g6Eps/yaQVAs2HJkXcnmaB8A6G3qCD2YbmgRc0AZT3HV/
	 6UPxh+PaFD0KtbC84qCWhR5IkN94TBOBdB287kK2sg7s67Fa9UqdPFI832Ab+zQee2
	 i7UHkqPihgUXdvdH7N3wjrehJqbCAECvPda8hxQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A70DF8012F;
	Thu, 30 Jul 2020 07:46:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBFB7F8021E; Thu, 30 Jul 2020 07:46:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 130E5F8012F
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 07:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 130E5F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="KzVKhKJA"
IronPort-SDR: 3j6OKkx3IeAc5MQFopyEj6eTUY+8ar2L6fe+5WvVaVb8I9oObrOXCmR35dxQq6FJWQGMIUQMhq
 fZrdyxqx+bEA==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="149375239"
X-IronPort-AV: E=Sophos;i="5.75,413,1589266800"; d="scan'208";a="149375239"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 22:46:25 -0700
IronPort-SDR: NewX4ZP8RJbt5ZVkuxqIXxpmGIVPzXtwKDjVeBVoxIgHbl65KqxwoEpA1zvPLpjZgmdGfzx35Z
 wBqBlo2T2yUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,413,1589266800"; d="scan'208";a="313294526"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga004.fm.intel.com with ESMTP; 29 Jul 2020 22:46:26 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 29 Jul 2020 22:46:25 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 29 Jul 2020 22:46:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 29 Jul 2020 22:46:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLO1G5OwwD61rmMRhCz3vh8cSogjDhWfyzfR/D27miEch+ji+0A3rQ3EnTm2sieviss7Ye+WShsmjDAacbJFtV/WyW902IfKCc1rTTEbovkoHDTIsLeZZct5Saq+Ffv1D8K0/25Zh5SSLtzvxYWCJUAOgPxJ+5kHiX67IYvph1tw2PpH+vdn/X8bGHEN5zQtgYJ7FK6EbGPMGx1Na/qKk/X6l53kheZF8isNuxZw06vt0e9rScCOumSfZuzR2Fjivth4D2LthWl2EBm1hQ9Fy6Bj/a5kn/YFTDcqfjrRT36/HX1sklyU/p0kU5o09aGSo3JaTgn9W8+HjDUs6ATbKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dbvIUep3N/SMuZFenB3fqhCSREGJ2fB0WpyE8EHgdM=;
 b=Eymo4hNxqtmmYrw75xkx/VlFJ7oyWx2XyMq9nFmGts1SyGIHVcvIPU6BdeIyGpoyFLs/I8AZ2FKAq+Xl95BMXb0+xPe2X8LRY1HeV9mitiK9vjRZCH2yFal3rzxfyLX7/qDCMG4ZP2ChMK3PhnqoDCvuSPqyS97mCsoOoM82GFuliZu0VcxuUbfZL91UQxHidMtUKfvbv9lVlOFpiAnKXhquQhtDH3f7DCkmthtOboFYCQ9gn56wPqQxw2LDjtN+ZdVz6qyfvFZqqtMQXlRCZU1YljnZ6l2Hh3CzJb9Bxv9wGYTwKFTmU56ln4nRamVZY55y6TlIpHv3irDdAv9LKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dbvIUep3N/SMuZFenB3fqhCSREGJ2fB0WpyE8EHgdM=;
 b=KzVKhKJAAj1J1csrENYj/OSpvb5L7oZk2j3fzXTArZ2Jm8LTjvNWRWJzUCTPDbPW3v8NxB4mGGPx1HQw/2Z4wSx7ENXbLndKOYVrTgt0JPBAXYRdhNTrOA8lPRf493zDDuK76VL4XIB6UWSRZi+0cTVFCYF0DACIHl6OuPhbME0=
Received: from BYAPR11MB3046.namprd11.prod.outlook.com (2603:10b6:a03:86::18)
 by BY5PR11MB4040.namprd11.prod.outlook.com (2603:10b6:a03:186::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.26; Thu, 30 Jul
 2020 05:46:20 +0000
Received: from BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c]) by BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c%3]) with mapi id 15.20.3239.017; Thu, 30 Jul 2020
 05:46:20 +0000
From: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
To: Dan Murphy <dmurphy@ti.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 3/3] ASoC: codec: tlv3204: Moving GPIO reset and add ADC
 reset
Thread-Topic: [PATCH 3/3] ASoC: codec: tlv3204: Moving GPIO reset and add ADC
 reset
Thread-Index: AQHWZXvDcvGwDy8t9k+SLydfK9jkJakefUMAgAEgZvA=
Date: Thu, 30 Jul 2020 05:46:20 +0000
Message-ID: <BYAPR11MB30468CC46295BBA5BEF0FB0C9D710@BYAPR11MB3046.namprd11.prod.outlook.com>
References: <20200729073256.24028-1-michael.wei.hong.sit@intel.com>
 <20200729073256.24028-4-michael.wei.hong.sit@intel.com>
 <e97b37d1-548e-6ede-4015-563d4f67f5e6@ti.com>
In-Reply-To: <e97b37d1-548e-6ede-4015-563d4f67f5e6@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [121.121.136.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2e55798-2eed-4a21-0e9b-08d8344be2ce
x-ms-traffictypediagnostic: BY5PR11MB4040:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB40407A10850F73FC1423587F9D710@BY5PR11MB4040.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qB5oZ4q0jRxmmRXdt8L1Tx6jAdrIAlETH2WvWI3FR8546vPqEgXeRFyNnoCMCGr+qemBFsofDWyRwbt1CaZPVRBxYlHidNWNK84wknGJNsRWx2m4uGp6LwfMWHLGw0xVw7W9R6djTCNM0w5OHIGZfiJaIqw25aCmhUw2nMhme8yBzxFdfnnDKD/1qLT3ig8/iM1e9pwbq+pzwHDBu9Pz5XZctjf9XM6dVklaKXj2OTNJFX7ILiqxMsKok3Iy1Gy62smSkdc7tUpI3b1NID+1lumMvtPhw8U7ALHUGvNvAx3No0Zrzya8ry9oQqQwLXmdVqBpRcqD19+I/KKaZol43A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(52536014)(478600001)(86362001)(55016002)(66556008)(66476007)(53546011)(66446008)(7696005)(186003)(8676002)(64756008)(9686003)(8936002)(5660300002)(6506007)(66946007)(71200400001)(26005)(33656002)(76116006)(83380400001)(2906002)(316002)(110136005)(4326008)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: epyyBvpaci/AgOeTIFs1A+EIRLISvUDRGOVnP9h/qMOeoXVN9T28bSAurttxHrtdWXUTLLfTViAHkhyS2JLa3B7mZastUfMENva6cQxYdBS6o62I5X9RsviarbXmRYODfvtnUlv+COtj3/jQBqJ+kCBcOJXdvPBb/Yh8gcYHNEgKn9qu+EcczVLElUL1tSMUK35VcnG+b6mA1hJF0vvidIrsChUDq+n8CFfKrMr7UoECOl5lYsquqinuIhQyqdGSiPsMAdQTo5KW6JrQESK7kpOHt4b7s59nQo0zok+K0Y7MYXdv4CO9gmdnrMB6AfQzW/pp3hej9QK30NBk0k5zPoIqFfo/f8tt2l+nt7l++WyVdMt3rGHX1/BwuvT/sSpBfgyHR8GvthMD9sjtSf6Wn4/5n/yGpyGbJ+R52WBPZvROAd+fUrebG3pi/94M6pEqBULBgOrZ/syskalcb/mNwoX9H/9H8dyu26GElJleD8gbbo7xf2aw/2ihREHWtE5k
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e55798-2eed-4a21-0e9b-08d8344be2ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 05:46:20.3622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mKy48OG39eORp65nziGhGequVDyp4Bu4Pe/jn5j/Beq4/9r63B3NeR/CXV5KrpGBC4O7gsTTvPavE2i4e0Y5umN/CFrmBgTxmB6dh35DG9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4040
X-OriginatorOrg: intel.com
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "a-estrada@ti.com" <a-estrada@ti.com>, "Shevchenko,
 Andriy" <andriy.shevchenko@intel.com>, "tiwai@suse.com" <tiwai@suse.com>, "Sia,
 Jee Heng" <jee.heng.sia@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "zakkaye@ti.com" <zakkaye@ti.com>
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

SGkgRGFuLA0KDQpUaGUgY29kZSBzbmlwcGV0IGlzIHRha2VuIGZyb20gdGhlIGFpYzMyeDRfY29t
cG9uZW50X3Byb2JlIGZ1bmN0aW9uIG9mIHRoZSBkcml2ZXIgaW4gNS44Lg0KDQpDb3VsZCB5b3Ug
aGF2ZSBhIGxvb2sgYXQgdGhhdCBwb3J0aW9uIGFuZCBzZWUgaWYgaXQgaXMgdGhlIHNhbWU/DQoN
ClRoYW5rcywNClJlZ2FyZHMsDQpNaWNoYWVsDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQpGcm9tOiBEYW4gTXVycGh5IDxkbXVycGh5QHRpLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIDI5
IEp1bHksIDIwMjAgODozMSBQTQ0KVG86IFNpdCwgTWljaGFlbCBXZWkgSG9uZyA8bWljaGFlbC53
ZWkuaG9uZy5zaXRAaW50ZWwuY29tPjsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnDQpDYzog
dGl3YWlAc3VzZS5jb207IGJyb29uaWVAa2VybmVsLm9yZzsgcGllcnJlLWxvdWlzLmJvc3NhcnRA
bGludXguaW50ZWwuY29tOyBSb2pld3NraSwgQ2V6YXJ5IDxjZXphcnkucm9qZXdza2lAaW50ZWwu
Y29tPjsgU2hldmNoZW5rbywgQW5kcml5IDxhbmRyaXkuc2hldmNoZW5rb0BpbnRlbC5jb20+OyBs
aWFtLnIuZ2lyZHdvb2RAbGludXguaW50ZWwuY29tOyBTaWEsIEplZSBIZW5nIDxqZWUuaGVuZy5z
aWFAaW50ZWwuY29tPjsgYS1lc3RyYWRhQHRpLmNvbTsgemFra2F5ZUB0aS5jb20NClN1YmplY3Q6
IFJlOiBbUEFUQ0ggMy8zXSBBU29DOiBjb2RlYzogdGx2MzIwNDogTW92aW5nIEdQSU8gcmVzZXQg
YW5kIGFkZCBBREMgcmVzZXQNCg0KSGVsbG8NCg0KT24gNy8yOS8yMCAyOjMyIEFNLCBNaWNoYWVs
IFNpdCBXZWkgSG9uZyB3cm90ZToNCj4gTW92aW5nIEdQSU8gcmVzZXQgdG8gYSBsYXRlciBzdGFn
ZSBhbmQgYmVmb3JlIGNsb2NrIHJlZ2lzdHJhdGlvbiB0byANCj4gZW5zdXJlIHRoYXQgdGhlIGhv
c3Qgc3lzdGVtIGFuZCBjb2RlYyBjbG9ja3MgYXJlIGluIHN5bmMuIElmIHRoZSBob3N0IA0KPiBy
ZWdpc3RlciBjbG9jayB2YWx1ZXMgcHJpb3IgdG8gZ3BpbyByZXNldCwgdGhlIGxhc3QgY29uZmln
dXJlZCBjb2RlYyANCj4gY2xvY2sgaXMgcmVnaXN0ZXJlZCB0byB0aGUgaG9zdC4gVGhlIGNvZGVj
IHRoZW4gZ2V0cyBncGlvIHJlc2V0dGVkIA0KPiBzZXR0aW5nIHRoZSBjb2RlYyBjbG9ja3MgdG8g
dGhlaXIgZGVmYXVsdCB2YWx1ZSwgY2F1c2luZyBhIG1pc21hdGNoLiANCj4gSG9zdCBzeXN0ZW0g
d2lsbCBza2lwIGNsb2NrIHNldHRpbmcgdGhpbmtpbmcgdGhlIGNvZGVjIGNsb2NrcyBhcmUgDQo+
IGFscmVhZHkgYXQgdGhlIHJlcXVlc3RlZCByYXRlLg0KPg0KPiBBREMgcmVzZXQgaXMgYWRkZWQg
dG8gZW5zdXJlIHRoZSBuZXh0IGF1ZGlvIGNhcHR1cmUgZG9lcyBub3QgaGF2ZSANCj4gdW5kZXNp
cmVkIGFydGlmYWN0cy4gSXQgaXMgcHJvYmFibHkgcmVsYXRlZCB0byB0aGUgb3JpZ2luYWwgY29k
ZSB3aGVyZSANCj4gdGhlIHByb2JlIGZ1bmN0aW9uIHJlc2V0cyB0aGUgQURDIHByaW9yIHRvIDFz
dCByZWNvcmQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgU2l0IFdlaSBIb25nIDxtaWNo
YWVsLndlaS5ob25nLnNpdEBpbnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBTaWEgSmVlIEhlbmcg
PGplZS5oZW5nLnNpYUBpbnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBQaWVycmUtTG91aXMgQm9z
c2FydCANCj4gPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+
ICAgc291bmQvc29jL2NvZGVjcy90bHYzMjBhaWMzMng0LmMgfCA0NyArKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAx
MiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvdGx2MzIw
YWljMzJ4NC5jIA0KPiBiL3NvdW5kL3NvYy9jb2RlY3MvdGx2MzIwYWljMzJ4NC5jDQo+IGluZGV4
IDVhZjQzOGEwMGY5NS4uMzdlMTQ1NThkN2MwIDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvY29k
ZWNzL3RsdjMyMGFpYzMyeDQuYw0KPiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3RsdjMyMGFpYzMy
eDQuYw0KPiBAQCAtNTAsNiArNTAsMjggQEAgc3RydWN0IGFpYzMyeDRfcHJpdiB7DQo+ICAgCXN0
cnVjdCBkZXZpY2UgKmRldjsNCj4gICB9Ow0KPiAgIA0KPiArc3RhdGljIGludCBhaWMzMng0X3Jl
c2V0X2FkYyhzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldCAqdywNCj4gKwkJCSAgICAgc3RydWN0
IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsIGludCBldmVudCkgew0KPiArCXN0cnVjdCBzbmRfc29j
X2NvbXBvbmVudCAqY29tcG9uZW50ID0gc25kX3NvY19kYXBtX3RvX2NvbXBvbmVudCh3LT5kYXBt
KTsNCj4gKwl1MzIgYWRjX3JlZzsNCj4gKw0KPiArCS8qDQo+ICsJICogV29ya2Fyb3VuZDogdGhl
IGRhdGFzaGVldCBkb2VzIG5vdCBtZW50aW9uIGEgcmVxdWlyZWQgcHJvZ3JhbW1pbmcNCj4gKwkg
KiBzZXF1ZW5jZSBidXQgZXhwZXJpbWVudHMgc2hvdyB0aGUgQURDIG5lZWRzIHRvIGJlIHJlc2V0
IGFmdGVyIGVhY2gNCj4gKwkgKiBjYXB0dXJlIHRvIGF2b2lkIGF1ZGlibGUgYXJ0aWZhY3RzLg0K
PiArCSAqLw0KPiArCXN3aXRjaCAoZXZlbnQpIHsNCj4gKwljYXNlIFNORF9TT0NfREFQTV9QT1NU
X1BNRDoNCj4gKwkJYWRjX3JlZyA9IHNuZF9zb2NfY29tcG9uZW50X3JlYWQzMihjb21wb25lbnQs
IEFJQzMyWDRfQURDU0VUVVApOw0KDQpUaGlzIGdpdmVzIG1lIGEgYnVpbGQgZXJyb3INCg0Kc291
bmQvc29jL2NvZGVjcy90bHYzMjBhaWMzMng0LmM6IEluIGZ1bmN0aW9uIOKAmGFpYzMyeDRfcmVz
ZXRfYWRj4oCZOg0Kc291bmQvc29jL2NvZGVjcy90bHYzMjBhaWMzMng0LmM6NjY6MTM6IGVycm9y
OiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhzbmRfc29jX2NvbXBvbmVudF9y
ZWFkMzLigJk7IGRpZCB5b3UgbWVhbiDigJhzbmRfc29jX2NvbXBvbmVudF9yZWFk4oCZPyBbLVdl
cnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0NCiDCoMKgIDY2IHzCoMKgIGFkY19y
ZWcgPSBzbmRfc29jX2NvbXBvbmVudF9yZWFkMzIoY29tcG9uZW50LCBBSUMzMlg0X0FEQ1NFVFVQ
KTsNCiDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+DQogwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNuZF9zb2Nf
Y29tcG9uZW50X3JlYWQNCg0KQWxzbyB5b3Ugc2hvdWxkIGNoZWNrIHRoZSByZXR1cm4gdG8gbWFr
ZSBzdXJlIGl0IGlzIHZhbGlkLg0KDQpEYW4NCg0KDQo=
