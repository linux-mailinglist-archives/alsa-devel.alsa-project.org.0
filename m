Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB31251E34
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 19:24:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF5EE1697;
	Tue, 25 Aug 2020 19:23:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF5EE1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598376263;
	bh=HJhKn9Onh7+pnqvE3cK60jWq5WIi+cYQrVA0xWVJkTU=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q7h9sdwKtGEB1yHSXt/zpapfmuH2mWVsiABnkDkVJDmCj4ZMf4kVtpwsCWFdJOL4K
	 sAD8DkLjmSa2diMadhRyHAkHnkHaU33tqR3hE5nHePkLG4kN0GG0ojxlhIcCfTvDr9
	 eb7NZ7I60kkc29VlQ5RCzkOu0+YIid833ODV1FG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1355EF80260;
	Tue, 25 Aug 2020 19:22:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40790F8025A; Tue, 25 Aug 2020 19:22:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17B52F80143
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 19:22:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17B52F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="ez02De1x"
IronPort-SDR: awdudarWxcrmr3Q4E2ePnzHXqMQf8b4mUf57QN1bKnE3TGZyEfmKzo1q/FB0pQ1tYuTG+mw7LW
 CKejygudbtnQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="143935721"
X-IronPort-AV: E=Sophos;i="5.76,353,1592895600"; d="scan'208";a="143935721"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 10:22:27 -0700
IronPort-SDR: jOSOAo//kOPitPcsm0Ke8HYVmxHYRItgXMYBfKCy1EKlZ3zk/0KGLDXs0I3QOvny+2EwJIhefn
 4N1kjxzcVwnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,353,1592895600"; d="scan'208";a="336562523"
Received: from orsmsx602-2.jf.intel.com (HELO ORSMSX602.amr.corp.intel.com)
 ([10.22.229.82])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Aug 2020 10:22:27 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 25 Aug 2020 10:22:26 -0700
Received: from orsmsx112.amr.corp.intel.com (10.22.240.13) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 25 Aug 2020 10:22:26 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX112.amr.corp.intel.com (10.22.240.13) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 25 Aug 2020 10:22:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 25 Aug 2020 10:22:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNQSV6I1ZPzXiYFsVJbhie+mflZnvkL5mIc14vQazzI/ZFnsR38EDATv6rBygqpd1XQn9FgxIXvE93R7EkKah8jaEX4KzqtBJGWX+aMFEAcxzm78zx7GYs9Nv1b6dtNqaaBntb0rJYSlqTqCpvXoAwdZWDw1FrDWDBHRf9xP5VlwBJL3UQuEh55SGUMdSlrqX1ZgY1ZjPhHmB1sfw70OxMg8rGj2g5SHwxYmEGCFJcektABxifftZI/fhoWtcuEsSUpBjhxFHqmxDC/5h41A2anIhri1Ynt5hHKSkNucfKHXjd+vKy5ypFuYLPhGvfGfyoV2f+LsUJEEuVqaJgCLJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJhKn9Onh7+pnqvE3cK60jWq5WIi+cYQrVA0xWVJkTU=;
 b=WBv9tllY8B4s0OOxZequFOXufY1qO6iigrgqkpNNXi8Vk7EB74QI4l7UmieVr9cMzhAHbcbAaBQw1ITdFg5OSbgGG5d2iUo0kkNMkmlU9Nz5biv9/MeRarVjvfA7aaYP0ywDyTkbmHU2QFHQKK14xvahWd9RQati7vS9LRZLBwft4FSyQd2I3jEZjx/oJQfutmKNUfentpNW4zRTJ+8s99xDBkHw2kZN21aYZEeZHRfaJWNii9MsxfQmioHpabRFPAyGua/h1ON0lfnxU1yDzC1ilx0agtulsrcryRiw6+8mjcvhF6XUq7lMH5digINE+IGuNB8EhYfI0TXObLc3Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJhKn9Onh7+pnqvE3cK60jWq5WIi+cYQrVA0xWVJkTU=;
 b=ez02De1xizAawOz2v2mpJJ8Bzk0bn2aMwq9qtFCQVH3QM148LbXhsxTv/wGxBn11b9zrs9HtPsSIcsII/fGBys+LbNHWMjgOH7++bUs7mGSLyxLCR8mNGwWG9HqkDp2B6qDfcnUBnwPwYyG9HHRiPs6z2l4f3u0e6GKO3fRkd9U=
Received: from BYAPR11MB3046.namprd11.prod.outlook.com (2603:10b6:a03:86::18)
 by BY5PR11MB4196.namprd11.prod.outlook.com (2603:10b6:a03:1ce::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 25 Aug
 2020 17:22:19 +0000
Received: from BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c]) by BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c%3]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 17:22:19 +0000
From: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [bug report] ASoC: Intel: KMB: Enable TDM audio capture
Thread-Topic: [bug report] ASoC: Intel: KMB: Enable TDM audio capture
Thread-Index: AQHWeuKlXabfYqCTjkSzu2rSWobUsalI11CQgAACZgCAAA3OF4AAE9WAgAAXc58=
Date: Tue, 25 Aug 2020 17:22:18 +0000
Message-ID: <EDE660AC-9B3C-4FBB-88F9-464A0D953EA7@intel.com>
References: <20200825132102.GA306074@mwanda>
 <CE6D3DA0-65A3-42BA-8341-13A3C6E80A55@intel.com>
 <20200825135800.GS5493@kadam>
 <2B5A2EFF-7391-4565-9B35-DCE395C7DD80@intel.com>,
 <5789a393-d2b7-4127-4875-2dbcb5a19bfc@linux.intel.com>
In-Reply-To: <5789a393-d2b7-4127-4875-2dbcb5a19bfc@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [2001:d08:db:bfac:c4b5:810:19b6:2a11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 018ac514-1654-4ddb-125c-08d8491b6bb4
x-ms-traffictypediagnostic: BY5PR11MB4196:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4196F65F7C770370F0B71EDB9D570@BY5PR11MB4196.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1YvBZC4X/SR/TqzbINVR30Yj6ZUOnzkVSQQxPwdlHrFhJqEvm6oMgCnZ3LURMXX1eynkcvOKXeJrBdHSO8OPDJdSkrSNxtpNwvNVV3czZv/SluAdUeUv5WOSiSMfwktgeUNwT/5HIaHGoimz0ZpnwB3CBZKIC0Q1Q6tr1fymTMUiosyyLzsuJOzdyQGrHy39k7x+lKB4oN73OEJoUGkz8ktYIMtUBw8Yb0cKEsm4UhPhEcJcE/IuZ2WGxnIRCARDs79OCRNsEdw2ItsW/rI37e8h9fhB75B7FnTznKY6XIIAYcM7NB77RUR94X1t0HT7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(53546011)(6506007)(76116006)(64756008)(66556008)(66476007)(66446008)(8676002)(6916009)(6486002)(316002)(66946007)(33656002)(4326008)(2906002)(54906003)(91956017)(478600001)(83380400001)(5660300002)(36756003)(86362001)(71200400001)(6512007)(8936002)(186003)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: TvVKTojyEuFlEa0jXLdh4TtSg1wr84viQs+MP+J2+bx8in6SvLtLCC3NRhPrhY5HSqy9OjCGiMs77iC27CpHwmlN+mc0FYhDdhpTW1a/zL2ee/mhBKwvUn/WPzoBwfXhBqP3r8pwkqXeiQ1TgkAUYoC6rxJ/yWPbKsPVPtsxV/qFmSwux1m657ScQSCnfeaIugR94YQq53wmKAbWwZ+AGk0UY1dhx22eUTEUwj4VhbTDqMk3U0/K97D8Vhhss8gYgD8xe3AIKx5wh6mI6m4q+KQ5LnWIoqaoaTkS0KwvNmmRiPLgxA1dB51FgzSNeTCT6f+BGsBm619WrCKyk2CObuQGHzC8I5DgApRL+g9TU2ACZnJ+vFbQ8QKeMO60dPA/TZMBB+In2Ur/RFXsTS9+IUueI5jEPuKRaxDGylzqikPqzSuXs+QZh2XbCXJwU6qLU/ZZ/I+UVCn0QePgPuFOb3Kzfpw6dyK4hxOoqHS8SMWOl15aWYNvzOMKlNMHhc97EPjejNa63CrxDXRuU5QtyBq2caPrBPqklismtwOnH0bkS8Om6F/Xj8O+WnTSgO5nSFGiiEuaDDujfGuiKejK5hZGVcRp5GMVEKfZRpvG+ZQ4YMg3vfz0X0VIsovJC6xrpD1rBESHG2kCyO9Q82WLQ3wu1G8elT/10SmCaLtF014c9k6lmIpuO3YJ2eOq7mq1LF9wjr8fUzUbddgNDpP/YA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 018ac514-1654-4ddb-125c-08d8491b6bb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2020 17:22:19.0044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kyH3wr2j/HrWmoX2D+uh9wUjQaT+W+8+3V26iB2b39zwLNGMrXDSpFq2q4XtHnNjQek5UydCyt4xqbEBZlv5M8lmcmnbHSJHJPXGY/R4RzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4196
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Sia,
 Jee Heng" <jee.heng.sia@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
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

DQoNCj4gT24gMjUgQXVnIDIwMjAsIGF0IDExOjU4IFBNLCBQaWVycmUtTG91aXMgQm9zc2FydCA8
cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPiB3cm90ZToNCj4gDQo+IO+7vw0K
Pj4+Pj4gIDUwNiAgICAgICAgICBzd2l0Y2ggKGNvbmZpZy0+Y2hhbl9ucikgew0KPj4+Pj4gIDUw
NyAgICAgICAgICBjYXNlIDg6DQo+Pj4+PiAgNTA4ICAgICAgICAgIGNhc2UgNDoNCj4+Pj4+ICA1
MDkgICAgICAgICAgICAgICAgICAvKg0KPj4+Pj4gIDUxMCAgICAgICAgICAgICAgICAgICAqIFBs
YXRmb3JtIGlzIG5vdCBjYXBhYmxlIG9mIHByb3ZpZGluZyBjbG9ja3MgZm9yDQo+Pj4+PiAgNTEx
ICAgICAgICAgICAgICAgICAgICogbXVsdGkgY2hhbm5lbCBhdWRpbw0KPj4+Pj4gIDUxMiAgICAg
ICAgICAgICAgICAgICAqLw0KPj4+Pj4gIDUxMyAgICAgICAgICAgICAgICAgIGlmIChrbWJfaTJz
LT5tYXN0ZXIpDQo+Pj4+PiAgNTE0ICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsNCj4+Pj4+ICA1MTUNCj4+Pj4+ICA1MTYgICAgICAgICAgICAgICAgICB3cml0ZV92YWwg
PSAoKGNvbmZpZy0+Y2hhbl9uciAvIDIpIDw8IFRETV9DSEFOTkVMX0NPTkZJR19CSVQpIHwNCj4+
Pj4+ICA1MTcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGNvbmZpZy0+ZGF0YV93
aWR0aCA8PCBEQVRBX1dJRFRIX0NPTkZJR19CSVQpIHwNCj4+Pj4+ICA1MTggICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIU1BU1RFUl9NT0RFIHwgVERNX09QRVJBVElPTjsNCj4+Pj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eDQo+Pj4+
PiBNQVNURVJfTU9ERSBpcyBCSVQoMTMpLiAgSXQncyB1bmNsZWFyIHdoYXQgdGhpcyBpcyBzdXBw
b3NlZCB0byBiZS4gIE15DQo+Pj4+PiBiZXN0IGd1ZXNzIGlzIHRoYXQgdGhlICEgc2hvdWxkIGp1
c3QgYmUgZGVsZXRlZC4NCj4+Pj4gDQo+Pj4+IFRoaXMgISBpcyBpbnRlbnRpb25hbCBiZWNhdXNl
IGl0IGlzIG1lYW50IHRvIGJlIFNsYXZlIG1vZGUuIFdvdWxkIGEgYmV0dGVyIGFwcHJvYWNoIGJl
IHRvIGNyZWF0ZSBhbm90aGVyICNkZWZpbmUgZm9yIHNsYXZlIG1vZGU/DQo+Pj4gDQo+Pj4gSW4g
bXkgb3BpbmlvbiwgaXQncyBiZXR0ZXIgdG8ganVzdCBsZWF2ZSBpdCBvdXQuICBPUmluZyB3aXRo
IHplcm8gY2F1c2VzDQo+Pj4gYSBkaWZmZXJlbnQgc3RhdGljIGNoZWNrZXIgd2FybmluZyBvbiBt
eSB1bnJlbGVhc2VkIGNoZWNrcy4uLiAgSXMgaXQNCj4+PiAwIDw8IDEzPyAgSSBmZWVsIGxpa2Ug
T1Jpbmcgd2l0aCB6ZXJvIGp1c3QgbWFrZXMgdGhpbmdzIG1vcmUgY29uZnVzaW5nLg0KPj4+IA0K
Pj4gSXQgaXMgMDw8MTMsIGluIHRoZSBldmVudCBpdCB3YXMgcHJldmlvdXNseSBjb25maWd1cmVk
IHRvIE1hc3RlciBJIHdvdWxkIG5lZWQgdG8gdW5zZXQgdGhlIGJpdA0KPiANCj4gWW91IGFyZSBh
c3NpZ25pbmcgdGhlIHJlc3VsdCB0byB3cml0ZV92YWwsIHNvIHRoZXJlJ3Mgbm8gbWVtb3J5IG9m
IHdoYXQgd2FzIGNvbmZpZ3VyZWQgYmVmb3JlPw0KDQpZZWEgeW91IGFyZSByaWdodCwgd291bGQg
bGVhdmluZyB0aGlzICFNQVNURVJfTU9ERSBvdXQgdGhlIGJlc3Qgc29sdXRpb24/
