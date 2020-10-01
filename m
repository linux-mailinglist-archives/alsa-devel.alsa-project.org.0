Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 694A327FCD0
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 12:07:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3D571804;
	Thu,  1 Oct 2020 12:06:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3D571804
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601546839;
	bh=6WXjshtSMkbd8lRAij7Js+Q3sAcTAGUmW3p28KrPFME=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kl8N2TkTkgAwekN57vNojn6+0f2VwJV6JOYYBREWpcdHcUuO1h1hsK3YKjqsneWQw
	 JDwcaHu09s3i7RwfImtbvw6wRSPCwltQjmwXIQXfs6xH93Z6hz2t4OtRB1T3879Z+J
	 JNPxGX5asl2xtA3i791Mcg5oSI+MW50EgdSyLxnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C770BF80105;
	Thu,  1 Oct 2020 12:05:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F2A8F801F5; Thu,  1 Oct 2020 12:05:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F1DFF80105
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 12:05:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F1DFF80105
IronPort-SDR: mpqARpQsKkuKWPPkX4tD+7CnxCQNRa5+XhfwsHzAo1jgCSmsuo24eYPWc5PdvlXZl6KWhfn1tR
 SlY1OnVGiZlw==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="150475108"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="150475108"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 03:05:16 -0700
IronPort-SDR: ag3sCVjuLz11lKzJSnowcbKodyHTYdHf/6Q9XdiVlwf43Xkgr7c76crW/BuRxU7EoKlODl53F9
 DNcQ7UoVhAlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="458060173"
Received: from irsmsx602.ger.corp.intel.com ([163.33.146.8])
 by orsmga004.jf.intel.com with ESMTP; 01 Oct 2020 03:05:14 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 11:05:13 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Thu, 1 Oct 2020 11:05:13 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: "Ertman, David M" <david.m.ertman@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Topic: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Thread-Index: AQHWl3yerWanNFdKkEqDGy6MMnYs+amChDtQ
Date: Thu, 1 Oct 2020 10:05:13 +0000
Message-ID: <8f34ae733db0447d93736f4f3f7524f9@intel.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
In-Reply-To: <20200930225051.889607-1-david.m.ertman@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [163.33.253.164]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "parav@nvidia.com" <parav@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>
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

T24gMjAyMC0xMC0wMSAxMjo1MCBBTSwgRGF2ZSBFcnRtYW4gd3JvdGU6DQo+IEJyaWVmIGhpc3Rv
cnkgb2YgQW5jaWxsYXJ5IEJ1cw0KPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4g
VGhlIGFuY2lsbGFyeSBidXMgY29kZSB3YXMgb3JpZ2luYWxseSBzdWJtaXR0ZWQgdXBzdHJlYW0g
YXMgdmlydHVhbA0KPiBidXMsIGFuZCB3YXMgc3VibWl0dGVkIHRocm91Z2ggdGhlIG5ldGRldiB0
cmVlLiDigK9UaGlzIHByb2Nlc3MgZ2VuZXJhdGVkDQo+IHVwIHRvIHY0LiDigK9UaGlzIGRpc2N1
c3Npb24gY2FuIGJlIGZvdW5kIGhlcmU6DQo+ICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0
ZGV2LzAyMDA1MjAwNzAyMjcuMzM5MjEwMC0yLWplZmZyZXkudC5raXJzaGVyQGludGVsLmNvbS9U
LyN1DQo+IA0KPiBBdCB0aGlzIHBvaW50LCBHcmVnS0ggcmVxdWVzdGVkIHRoYXQgd2UgdGFrZSB0
aGUgcmV2aWV3IGFuZCByZXZpc2lvbg0KPiBwcm9jZXNzIHRvIGFuIGludGVybmFsIG1haWxpbmcg
bGlzdCBhbmQgZ2FybmVyIHRoZSBidXktaW4gb2YgYSByZXNwZWN0ZWQNCj4ga2VybmVsIGNvbnRy
aWJ1dG9yLg0KPiANCj4gVGhlIGFuY2lsbGFyeSBidXMgKHRoZW4ga25vd24gYXMgdmlydHVhbCBi
dXMpIHdhcyBvcmlnaW5hbGx5IHN1Ym1pdHRlZA0KPiBhbG9uZyB3aXRoIGltcGxlbWVudGF0aW9u
IGNvZGUgZm9yIHRoZSBpY2UgZHJpdmVyIGFuZCBpcmRtYSBkcml2ZSwNCj4gY2F1c2luZyB0aGUg
Y29tcGxpY2F0aW9uIG9mIGFsc28gaGF2aW5nIGRlcGVuZGVuY2llcyBpbiB0aGUgcmRtYSB0cmVl
Lg0KPiBUaGlzIG5ldyBzdWJtaXNzaW9uIGlzIHV0aWxpemluZyBhbiBhbmNpbGxhcnkgYnVzIGNv
bnN1bWVyIGluIG9ubHkgdGhlDQo+IHNvdW5kIGRyaXZlciB0cmVlIHRvIGNyZWF0ZSB0aGUgaW5p
dGlhbCBpbXBsZW1lbnRhdGlvbiBhbmQgYSBzaW5nbGUNCj4gdXNlci4NCj4gDQo+IFNpbmNlIGlt
cGxlbWVudGF0aW9uIHdvcmsgaGFzIHN0YXJ0ZWQgb24gdGhpcyBwYXRjaCBzZXQsIHRoZXJlIGhh
dmUgYmVlbg0KPiBtdWx0aXBsZSBpbnF1aXJpZXMgYWJvdXQgdGhlIHRpbWUgZnJhbWUgb2YgaXRz
IGNvbXBsZXRpb24uICBJdCBhcHBlYXJzDQo+IHRoYXQgdGhlcmUgd2lsbCBiZSBudW1lcm91cyBj
b25zdW1lcnMgb2YgdGhpcyBmdW5jdGlvbmFsaXR5Lg0KPiANCj4gVGhlIHByb2Nlc3Mgb2YgaW50
ZXJuYWwgcmV2aWV3IGFuZCBpbXBsZW1lbnRhdGlvbiB1c2luZyB0aGUgc291bmQNCj4gZHJpdmVy
cyBnZW5lcmF0ZWQgMTkgaW50ZXJuYWwgdmVyc2lvbnMuIOKAr1RoZSBjaGFuZ2VzLCBpbmNsdWRp
bmcgdGhlIG5hbWUNCj4gY2hhbmdlIGZyb20gdmlydHVhbCBidXMgdG8gYW5jaWxsYXJ5IGJ1cywg
ZnJvbSB0aGVzZSB2ZXJzaW9ucyBjYW4gYmUNCj4gc3VtbWFyaXplZCBhcyB0aGUgZm9sbG93aW5n
Og0KPiANCj4gLSBGaXhlZCBjb21waWxhdGlvbiBhbmQgY2hlY2twYXRjaCBlcnJvcnMNCj4gLSBJ
bXByb3ZlZCBkb2N1bWVudGF0aW9uIHRvIGFkZHJlc3MgdGhlIG1vdGl2YXRpb24gZm9yIHZpcnR1
YWwgYnVzLg0KPiAtIFJlbmFtZWQgdmlydHVhbCBidXMgdG8gYW5jaWxsYXJ5IGJ1cw0KPiAtIGlu
Y3JlYXNlZCBtYXhpbXVtIGRldmljZSBuYW1lIHNpemUNCj4gLSBDb3JyZWN0IG9yZGVyIGluIEtj
b25maWcgYW5kIE1ha2VmaWxlDQo+IC0gcmVtb3ZlZCB0aGUgbWlkLWxheWVyIGFkZXYtPnJlbGVh
c2UgbGF5ZXIgZm9yIGRldmljZSB1bnJlZ2lzdGVyDQo+IC0gcHVzaGVkIGFkZXYtPmlkIG1hbmFn
ZW1lbnQgdG8gcGFyZW50IGRyaXZlcg0KPiAtIGFsbCBlcnJvciBwYXRocyBvdXQgb2YgYW5jaWxs
YXJ5X2RldmljZV9yZWdpc3RlciByZXR1cm4gZXJyb3IgY29kZQ0KPiAtIGFsbCBlcnJvciBwYXRo
cyBvdXQgb2YgYW5jaWxsYXJ5X2RldmljZV9yZWdpc3RlciB1c2UgcHV0X2RldmljZQ0KPiAtIGFk
ZGVkIGFkZXYtPm5hbWUgZWxlbWVudA0KPiAtIG1vZG5hbWUgaW4gcmVnaXN0ZXIgY2Fubm90IGJl
IE5VTEwNCj4gLSBhZGRlZCBLQlVJTERfTU9ETkFNRSBhcyBwcmVmaXggZm9yIG1hdGNoX25hbWUN
Cj4gLSBwdXNoIGFkZXYtPmlkIHJlc3BvbnNpYmlsaXR5IHRvIHJlZ2lzdGVyaW5nIGRyaXZlcg0K
PiAtIHVldmVudCBub3cgcGFyc2VzIGFkZXYtPmRldiBuYW1lDQo+IC0gbWF0Y2hfaWQgZnVuY3Rp
b24gbm93IHBhcnNlcyBhZGV2LT5kZXYgbmFtZQ0KPiAtIGNoYW5nZWQgZHJpdmVycyBwcm9iZSBm
dW5jdGlvbiB0byBhbHNvIHRha2UgYW4gYW5jaWxsYXJ5X2RldmljZV9pZCBwYXJhbQ0KPiAtIHNw
bGl0IGFuY2lsbGFyeV9kZXZpY2VfcmVnaXN0ZXIgaW50byBkZXZpY2VfaW5pdGlhbGl6ZSBhbmQg
ZGV2aWNlX2FkZA0KPiAtIGFkanVzdGVkIHdoYXQgaXMgZG9uZSBpbiBkZXZpY2VfaW5pdGlhbGl6
ZSBhbmQgZGV2aWNlX2FkZA0KPiAtIGNoYW5nZSBhZGV2IHRvIGFuY2lsZGV2IGFuZCBhZHJ2IHRv
IGFuY2lsZHJ2DQo+IC0gY2hhbmdlIGFkZXYgdG8gYW5jaWxkZXYgaW4gZG9jdW1lbnRhdGlvbg0K
PiANCj4gVGhpcyBzdWJtaXNzaW9uIGlzIHRoZSBmaXJzdCB0aW1lIHRoYXQgdGhpcyBwYXRjaCBz
ZXQgd2lsbCBiZSBzZW50IHRvDQo+IHRoZSBhbHNhLWRldmVsIG1haWxpbmcgbGlzdCwgc28gaXQg
aXMgY3VycmVudGx5IGJlaW5nIHN1Ym1pdHRlZCBhcw0KPiB2ZXJzaW9uIDEuDQo+IA0KDQpHaXZl
biB0aGUgZGVzY3JpcHRpb24gYW5kIG51bWJlciBvZiBwb3NzaWJsZSB1c2Vycywgb25lIGNvdWxk
IHNhZmVseQ0Kc2F5OiB1c2FnZSBpcyBhc3N1cmVkLiBTbywgd2h5IG5vdCBzdWJtaXQgdGhpcyBi
dXMgYXMgYSBzdGFuZGFsb25lDQpwYXRjaD8gSXNuJ3QgaXQgYmV0dGVyIHRvIGZpcnN0IGhhdmUg
YSBzdGFibGUsIGNvbXBsZXRlIHZlcnNpb24gcHJlc2VudA0KaW4gTGludXMnIHRyZWUgYW5kIG9u
bHkgdGhlbiBhcHBlbmQgdGhlIHVzYWdlPw0KDQpBbGwgb3RoZXIgcGF0Y2hlcyB0YXJnZXQgQVNv
QyBTT0Ygc29sdXRpb24gZGlyZWN0bHkgd2hpbGUgYXMgc3RhdGVkIGluDQp0aGUgY29tbWl0J3Mg
bWVzc2FnZSwgdGhpcyBpc24ndCBTT0Ygc3BlY2lmaWMgLSBzZWUgdGhlIGRlbHRhIHByb3ZpZGVk
DQphdCB0aGUgYm90dG9tIG9mIGNvdmVyLWxldHRlciBhbmQgYSB3aWRlIHJhbmdlIG9mIFNPRiBm
aWxlcyBpdCB0b3VjaGVzLg0KDQpDemFyZWsNCg0KDQo+ICAgRG9jdW1lbnRhdGlvbi9kcml2ZXIt
YXBpL2FuY2lsbGFyeV9idXMucnN0IHwgMjMwICsrKysrKysrKysrKysrKw0KPiAgIERvY3VtZW50
YXRpb24vZHJpdmVyLWFwaS9pbmRleC5yc3QgICAgICAgICB8ICAgMSArDQo+ICAgZHJpdmVycy9i
dXMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzICsNCj4gICBkcml2ZXJzL2J1
cy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKw0KPiAgIGRyaXZlcnMvYnVz
L2FuY2lsbGFyeS5jICAgICAgICAgICAgICAgICAgICB8IDE5MSArKysrKysrKysrKysrDQo+ICAg
aW5jbHVkZS9saW51eC9hbmNpbGxhcnlfYnVzLmggICAgICAgICAgICAgIHwgIDU4ICsrKysNCj4g
ICBpbmNsdWRlL2xpbnV4L21vZF9kZXZpY2V0YWJsZS5oICAgICAgICAgICAgfCAgIDggKw0KPiAg
IHNjcmlwdHMvbW9kL2RldmljZXRhYmxlLW9mZnNldHMuYyAgICAgICAgICB8ICAgMyArDQo+ICAg
c2NyaXB0cy9tb2QvZmlsZTJhbGlhcy5jICAgICAgICAgICAgICAgICAgIHwgICA4ICsNCj4gICBz
b3VuZC9zb2Mvc29mL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAgMjkgKy0NCj4gICBz
b3VuZC9zb2Mvc29mL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAgIDcgKw0KPiAgIHNv
dW5kL3NvYy9zb2YvY29yZS5jICAgICAgICAgICAgICAgICAgICAgICB8ICAxMiArDQo+ICAgc291
bmQvc29jL3NvZi9kZWJ1Zy5jICAgICAgICAgICAgICAgICAgICAgIHwgMjMwIC0tLS0tLS0tLS0t
LS0tLQ0KPiAgIHNvdW5kL3NvYy9zb2YvaW50ZWwvS2NvbmZpZyAgICAgICAgICAgICAgICB8ICAg
OSArDQo+ICAgc291bmQvc29jL3NvZi9pbnRlbC9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgICAz
ICsNCj4gICBzb3VuZC9zb2Mvc29mL2ludGVsL2FwbC5jICAgICAgICAgICAgICAgICAgfCAgMTgg
KysNCj4gICBzb3VuZC9zb2Mvc29mL2ludGVsL2Jkdy5jICAgICAgICAgICAgICAgICAgfCAgMTgg
KysNCj4gICBzb3VuZC9zb2Mvc29mL2ludGVsL2J5dC5jICAgICAgICAgICAgICAgICAgfCAgMjIg
KysNCj4gICBzb3VuZC9zb2Mvc29mL2ludGVsL2NubC5jICAgICAgICAgICAgICAgICAgfCAgMTgg
KysNCj4gICBzb3VuZC9zb2Mvc29mL2ludGVsL2ludGVsLWNsaWVudC5jICAgICAgICAgfCAgNDkg
KysrKw0KPiAgIHNvdW5kL3NvYy9zb2YvaW50ZWwvaW50ZWwtY2xpZW50LmggICAgICAgICB8ICAy
NiArKw0KPiAgIHNvdW5kL3NvYy9zb2Yvb3BzLmggICAgICAgICAgICAgICAgICAgICAgICB8ICAx
NCArDQo+ICAgc291bmQvc29jL3NvZi9zb2YtY2xpZW50LmMgICAgICAgICAgICAgICAgIHwgMTE3
ICsrKysrKysrDQo+ICAgc291bmQvc29jL3NvZi9zb2YtY2xpZW50LmggICAgICAgICAgICAgICAg
IHwgIDY1ICsrKysrDQo+ICAgc291bmQvc29jL3NvZi9zb2YtaXBjLXRlc3QtY2xpZW50LmMgICAg
ICAgIHwgMzE0ICsrKysrKysrKysrKysrKysrKysrKw0KPiAgIHNvdW5kL3NvYy9zb2Yvc29mLXBy
aXYuaCAgICAgICAgICAgICAgICAgICB8ICAxNiArLQ0KPiAgIDI2IGZpbGVzIGNoYW5nZWQsIDEy
MzMgaW5zZXJ0aW9ucygrKSwgMjM5IGRlbGV0aW9ucygtKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvYW5jaWxsYXJ5X2J1cy5yc3QNCj4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9idXMvYW5jaWxsYXJ5LmMNCj4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgaW5jbHVkZS9saW51eC9hbmNpbGxhcnlfYnVzLmgNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
c291bmQvc29jL3NvZi9pbnRlbC9pbnRlbC1jbGllbnQuYw0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBzb3VuZC9zb2Mvc29mL2ludGVsL2ludGVsLWNsaWVudC5oDQo+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHNvdW5kL3NvYy9zb2Yvc29mLWNsaWVudC5jDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNv
dW5kL3NvYy9zb2Yvc29mLWNsaWVudC5oDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3Nv
Yy9zb2Yvc29mLWlwYy10ZXN0LWNsaWVudC5jDQo+DQo=
