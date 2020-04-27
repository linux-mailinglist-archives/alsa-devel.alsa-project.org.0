Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A051C1BA77F
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 17:12:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 484A41687;
	Mon, 27 Apr 2020 17:11:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 484A41687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588000361;
	bh=Ax/xBl4graRX2ZEgZ6kL7Mjyd2V6IbAxhIRJkNxS5jw=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aYXRbHxhRofwT1BJFGmgjQ3/wIeL4clVt9BjwgVKV7T1GJEP8rkG39gXyqXZuK0e5
	 sVxO6JJgC0JU5I7qBr4q4lxGjNXV7YIb7sVmofBbWuw/IAWE0JOhHLbSknd4Z7UvF4
	 F0y5yfBTia70ZOPNizLFAXsphZXqJRyNCabeXZKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA556F80232;
	Mon, 27 Apr 2020 17:10:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F4E1F8022B; Mon, 27 Apr 2020 17:10:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18A85F8010A
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 17:10:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18A85F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="jpEv9qVT"
IronPort-SDR: /06lJnUUCYscgg+2oB90mZKpwUEccmLD8Il9wAlMUqn3jSuE0RvhTGSTJyL1Aspe5B2NZcvoVZ
 rk1v0jR07uBw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 08:10:48 -0700
IronPort-SDR: wdlmObYwbkVYGyiD0n1ilmUGHOfipKS5vDbXzPE36zk6DX6VbyLkBjM50VZh2W1kEHVWrzvwaf
 5lZMufc/E9lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,324,1583222400"; d="scan'208";a="257295815"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
 by orsmga003.jf.intel.com with ESMTP; 27 Apr 2020 08:10:35 -0700
Received: from orsmsx126.amr.corp.intel.com (10.22.240.126) by
 ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 27 Apr 2020 08:10:35 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX126.amr.corp.intel.com (10.22.240.126) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 27 Apr 2020 08:10:35 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.56) by
 edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 27 Apr 2020 08:10:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiHEzJBHA5G2tw/AINJhTgAB4iVFF+nYzKiiHnO27ngj4DnmuBTtYz1ITg5NjRoHSdlcAA/5Jr0owJX3C0506XhW8lW0phbayy+JZrNfBp0UR5HWFYraVUYFVLWernxFu6esPHbqFDncoV2spb9sg/gE33ZL7s6jQxSPaYylezJKOWmxPOSWkQlxwuEQBfI6a0cJfrfIipuqshhWEFJCSeORA6gb5BeQMLHCI3PbjAkV244YzVp76hnoQ++Rvx/5LYqRoEK/cmFYfW9jU0vPx3+jOzDcgQC7FJq4tJsH5rYuNahRRYNF0dcLHyir86pK/6+9NVhJr9BUmIEcvwfsXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ax/xBl4graRX2ZEgZ6kL7Mjyd2V6IbAxhIRJkNxS5jw=;
 b=PHdU+ARvXaeMs9jd7+IYB35aMZwzZbrOEfF2kLz5W3HznFe4ToPki+pp3n3KCue3oQhxvnivvyFOXmngSuzcWiBgrnwv4qN1l5RSLv5je+NmQa0WB98yzM1/ZyDInSVMgMR39pdDaqjF6uXuWxW7BgLLstpa0LW8VKjoukKCbdNp8sge+1KRcVgbJm3N+oPCOfB1Kx0/TqnjZnfCRt+ZkDWm7DX4OYtbX/Qq/zR2+C9ZMBtzQTJYjGIf83f9rZa3EQTLNNJcNiLQfdjsGfoqTjq2h2322HvgwnXdtiocVbueCXGUDNez4uDsMgyTZPDRH+utTJmo2OwsgLAIWw+PtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ax/xBl4graRX2ZEgZ6kL7Mjyd2V6IbAxhIRJkNxS5jw=;
 b=jpEv9qVTLBu9jitelSidTsfxfuc2WecyTG19nfjLv48ygRvCeRcYfpFhkhHLhUxPKIKYTmmJaDJdgrzWrxwmPrlaDUmjN57VsgluLqGDjhdbJdyAFRwlmKRVMJdcNL0Nrz+Wr3WSr6TdRRrrOHmbxetVHsb3y6X1WwkGfoC+SXU=
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 (2603:10b6:405:5b::22) by BN6PR1101MB2307.namprd11.prod.outlook.com
 (2603:10b6:405:53::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Mon, 27 Apr
 2020 15:10:33 +0000
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::344b:59bc:1455:37a6]) by BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::344b:59bc:1455:37a6%11]) with mapi id 15.20.2937.023; Mon, 27 Apr
 2020 15:10:33 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 0/3] add channel constraint for BDW machine drivers
Thread-Topic: [PATCH 0/3] add channel constraint for BDW machine drivers
Thread-Index: AQHWHG/538arzRVuVUW0WV5CErDv0qiMzXUAgAAD8ICAAD9FwA==
Date: Mon, 27 Apr 2020 15:10:32 +0000
Message-ID: <BN6PR1101MB2132DEC140145F90645BF2B997AF0@BN6PR1101MB2132.namprd11.prod.outlook.com>
References: <1587976638-29806-1-git-send-email-brent.lu@intel.com>
 <1375d0b1-fafa-95b5-9a06-eefb1897ca42@intel.com>
 <1bcd3310-34c3-7d90-cb18-f474d9e30c25@intel.com>
In-Reply-To: <1bcd3310-34c3-7d90-cb18-f474d9e30c25@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=brent.lu@intel.com; 
x-originating-ip: [111.248.248.241]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ae111be-8b38-4db1-0b75-08d7eabd21ba
x-ms-traffictypediagnostic: BN6PR1101MB2307:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR1101MB230755E768D41036F3A2578497AF0@BN6PR1101MB2307.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0386B406AA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1101MB2132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(376002)(39860400002)(366004)(396003)(136003)(66556008)(66476007)(81156014)(7696005)(66446008)(8676002)(316002)(86362001)(33656002)(66946007)(8936002)(76116006)(64756008)(186003)(9686003)(6506007)(55016002)(26005)(5660300002)(2906002)(71200400001)(7416002)(4744005)(52536014)(110136005)(54906003)(478600001)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vQWn1bK5cuv+u+nzAYOmsXP6ivxfP8FvBoeYcWA58zlfqn996mNuhzCsK407GHHszwWaTejOFQgMH4meLoHhPSeXDRsdBlkWJRu/nET9nE3mpbEXWUb7Cr6qsxCQWwsaGsjzSOZHz6lkwIDIYOFyutl22G+hYtXnFLcc14PFzw/tI0NP1yYtqn5D3Q5oMY2m0NqA7AeSW1Hc4NOG78yZWjoIHaICgYCc1I03mKAlv7r+U/pvYsLOKD3Ezh2gp5hP8je9UVvIBMhJ2JA8MBH10Tt8+zkJUUapDepXdEXXli471nry1Le6LQIozsgPoArU42FgsWpvkB05phQa4ezgV509FL3q5ZnwHg2GEG3BKstY8C5XtpA2K/cpc/8wfVqBfFPLp6tmJ8J677wt0CWQXAodv/AujLRleWcmSJzzN/LuokzYKOIX6uK03uPAXhjw
x-ms-exchange-antispam-messagedata: XpOSEn6tZw/pWvGFoz+KWrycC2vXqPr0vRVqTlQIgatCOUqssMe6DKdxjFkyqfASjgkSE3YQoL/2KZftvwM0kMKHkPkh+kC9ISJE5Ax6oOfaQkdX2gyn30cuk2Mb7OmyBhoMkb94Dyc/WGzbcw9tCqcDoySVXdGqp07RJ4ETJUoLOrSKaCmdlhUvqZHvIZXJ/oub8Bqi4pZ50Es7HT5n94wA9U7l2iPS4Ps1jkkbt+kCTT716RpMPGY/fe0NkqXBFDgWo/WKQ819aMCE7NogNq7bVSL0CFT/Y99RmFmdsd9R3D/NB9NJ18Si1mocTBcWvFihos5bbDzb6c5NclKT92Kq8Xj41bUQ+md4wNBI5ACCnh8idbpo1tqw1cWKlg1EtEM3dNxJeU2Gjsjwm/Q2wSEzpO7XilVaxuHlfOAIg6qDWNXI+WVVkNBluwnqr1eWhZYv+8SK+561+0LZk9cbaHSX+6pF3vSix5SO4+ktlOSddvFjfFnDzCIpGjrwWYDP/hyzJTOuw49dxB1SjRjdrG3vZ+qubyicXQx9LM86rPDlq6RwG1NnBM75oGAKfyN97JLNY2QxRvY55a5EB6yDV2j+NWZ0E8RUDCpmt2saYr28f/bi2cC720+EkIuk65BEuIsqD/T3IZPs7Jxr/HqCPKlOwbtpi6Oyw3Z2XF6XdOH8HT7x3KH4Z6it04eTXbmFYTNSfxQEKw7bozBwGIFwzYtWXTIzxFjsmvoJOejRTFsohf/9HBGgEB37STtP3/36uoA7FQAXNkJ9HN0ZKJfHMIPvoa9eYIkNsKO3ODMNwn0qyIi3zIea25OKl6mjH2oS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae111be-8b38-4db1-0b75-08d7eabd21ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2020 15:10:32.8165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aep+3UsY6J1dZ5JKfedwjKQiv10g/qAqC5qVCKVcRuUIamM6FUvxQ06K2FPy0IJB/noBfxeqND+q/33snXwIwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2307
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, "Chiang, Mac" <mac.chiang@intel.com>,
 Mark Brown <broonie@kernel.org>
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

PiA+DQo+ID4gQXBhcnQgZnJvbSByZXZpZXcgZ2l2ZW4gZm9yIGVhY2ggYW5kIGV2ZXJ5IHBhdGNo
IChhbHRob3VnaCBtb3N0IGlzc3Vlcw0KPiA+IGFyZSBzaGFyZWQgc28gdGhlcmUgaXMgbm90IGFz
IG11Y2ggdG8gYWRkcmVzcykgbXkgcXVlc3Rpb24gaXM6DQo+ID4gLSBhcmUgdGhlc2UgaHcgbGlt
aXRhdGlvbnMgb3Igc29mdHdhcmUgKG1hY2hpbmUgYm9hcmQpIGxpbWl0YXRpb25zPw0KDQpUaGUg
bGltaXRhdGlvbiBjb21lcyBmcm9tIGJvYXJkLiBCZHctcnQ1Njc3IGFuZCBCcm9hZHdlbGwgYXJl
IHVzaW5nIEkyUyB3aXRoDQoyIG1pY3JvcGhvbmVzIHdoaWxlIEJkdy1ydDU2NTAgaXMgdXNpbmcg
UENNIFRETSB3aXRoIDQgbWljcm9waG9uZXMuIE91cg0KRFNQIHN1cHBvcnRzIHN0ZXJlbyBwbGF5
YmFjayBhbmQgMiBvciA0LWNoYW5uZWwgY2FwdHVyZSAoaGFzd2VsbC9zc3QtaGFzd2VsbC1wY20u
YykuDQoNCg0KPiA+DQo+ID4gQ3phcmVrDQo+ID4NCj4gPj4gQnJlbnQgTHUgKDMpOg0KPiA+PiDC
oMKgIEFTb0M6IGJkdy1ydDU2Nzc6IGNoYW5uZWwgY29uc3RyYWludCBzdXBwb3J0DQo+ID4+IMKg
wqAgQVNvQzogYmR3LXJ0NTY1MDogY2hhbm5lbCBjb25zdHJhaW50IHN1cHBvcnQNCj4gPj4gwqDC
oCBBU29DOiBicm9hZHdlbGw6IGNoYW5uZWwgY29uc3RyYWludCBzdXBwb3J0DQo+ID4+DQo+ID4+
IMKgIHNvdW5kL3NvYy9pbnRlbC9ib2FyZHMvYmR3LXJ0NTY1MC5jIHwgMzQNCj4gPj4gKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+PiDCoCBzb3VuZC9zb2MvaW50ZWwvYm9h
cmRzL2Jkdy1ydDU2NzcuYyB8IDMzDQo+ID4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KPiA+PiDCoCBzb3VuZC9zb2MvaW50ZWwvYm9hcmRzL2Jyb2Fkd2VsbC5jwqAgfCAzMw0K
PiA+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPj4gwqAgMyBmaWxlcyBj
aGFuZ2VkLCAxMDAgaW5zZXJ0aW9ucygrKQ0KPiA+Pg0K
