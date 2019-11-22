Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A329105F27
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 05:10:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B31917C7;
	Fri, 22 Nov 2019 05:09:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B31917C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574395846;
	bh=e7bRdXxPRFr3DQS0yb9zS+JUXgJHROUNg9aZnEnPcvM=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cQr57qwgmEDNnniuVZPYZEgCepRoj2x20MtinxlIu/GmOKOzfiS0Cf6nSmxKG+pBq
	 IxHhn2aULytyihTEGZuXKEhPd9vFcC8OqQEDOqPOMpVG25RwAz/XkWppA0JxCeJe5U
	 8kC0GIqPKHdhrRl6SLJ0PwIa9OsuxK1LPXw+EToA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19635F80150;
	Fri, 22 Nov 2019 05:09:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11CE3F80140; Fri, 22 Nov 2019 05:08:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 493F6F800EE
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 05:08:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 493F6F800EE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Nov 2019 20:08:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,228,1571727600"; d="scan'208";a="210309007"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga006.jf.intel.com with ESMTP; 21 Nov 2019 20:08:40 -0800
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 21 Nov 2019 20:08:40 -0800
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 21 Nov 2019 20:08:40 -0800
Received: from shsmsx105.ccr.corp.intel.com ([169.254.11.225]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.2]) with mapi id 14.03.0439.000;
 Fri, 22 Nov 2019 12:08:38 +0800
From: "Jie, Yang" <yang.jie@intel.com>
To: Takashi Iwai <tiwai@suse.de>, "Sridharan, Ranjani"
 <ranjani.sridharan@intel.com>, "Uimonen, Jaska" <jaska.uimonen@intel.com>
Thread-Topic: [alsa-devel] [PATCH 7/8] ALSA: pcm: Add card sync_irq field
Thread-Index: AQHVnSUbKG8r8y0H2ECicwqhEBHXH6eQnOiAgAAlPQCAAAf8gIAACAyAgAABoYCAAAykgIAANFeAgAB0aICAAA+egIAADFWAgACJhgCAAFFPgIAABHSAgAL9FICAABQ3AIAAA1KAgAAHl4CAAPbKsA==
Date: Fri, 22 Nov 2019 04:08:37 +0000
Message-ID: <E7B1D079BA13FB44A978CC8F69C7D6A9610EA113@SHSMSX105.ccr.corp.intel.com>
References: <20191117085308.23915-1-tiwai@suse.de>
 <20191117085308.23915-8-tiwai@suse.de>
 <3b407a02-b791-52a4-2335-e21d8ab732dd@linux.intel.com>
 <s5hy2wdyq3t.wl-tiwai@suse.de>
 <CAFQqKeWgqHwrCSSbLrkuCHkBww2g4dsBcF93SDN_ZK_-KSe5tg@mail.gmail.com>
 <s5hpnhpyng6.wl-tiwai@suse.de>
 <CAFQqKeWPgPWpDgZUPvOqSFUY2Zq=8zW-=LhYimtg0S0Hqpc43A@mail.gmail.com>
 <s5hmucszzni.wl-tiwai@suse.de>
 <3fc820272992362a56881abf7230f1500fdfdd2a.camel@linux.intel.com>
 <s5hblt8z7ow.wl-tiwai@suse.de>
 <030249cd63d754bd70ce5de5c58e04784eecebff.camel@linux.intel.com>
 <s5hv9rgxohq.wl-tiwai@suse.de>
 <ce61828881dea0fffd2c26a92ad2571ab3565404.camel@linux.intel.com>
 <s5hy2wbwo8c.wl-tiwai@suse.de>
 <CAFQqKeVsQ1AjjKgS-HJ0-mg7JbbmMVjJcUB7wbvsbyz9e2TqLg@mail.gmail.com>
 <CAFQqKeWVuJs+bnZsrYAHdke0pZpBSmP71RFVrfwVE3=P4A7hsw@mail.gmail.com>
 <s5himndrmsv.wl-tiwai@suse.de>
 <CAFQqKeUimt32z1myzL+JOXoCUhn7jU1=Mj8e6egQKs+c5CY0pA@mail.gmail.com>
 <s5hftihrkzs.wl-tiwai@suse.de>
In-Reply-To: <s5hftihrkzs.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzExNjI3M2UtZmQwMi00NGU5LWFlOGQtMTVmYzM3MzJkZjVlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiaDBLUU5SdkNRQUk3bTNLVXRRcnJTTlhJbUJNQllSQXZ4RWNZbEVKaUloXC9GTWFKVlhHOFJ1R0hmcFJEeFRDbHIifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 7/8] ALSA: pcm: Add card sync_irq field
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogVGFrYXNoaSBJd2FpIDx0aXdhaUBz
dXNlLmRlPg0KPlNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAyMSwgMjAxOSAxOjEzIFBNDQo+VG86
IFNyaWRoYXJhbiwgUmFuamFuaSA8cmFuamFuaS5zcmlkaGFyYW5AaW50ZWwuY29tPg0KPkNjOiBK
aWUsIFlhbmcgPHlhbmcuamllQGludGVsLmNvbT47IFJhbmphbmkgU3JpZGhhcmFuDQo+PHJhbmph
bmkuc3JpZGhhcmFuQGxpbnV4LmludGVsLmNvbT47IExpbnV4LUFMU0EgPGFsc2EtZGV2ZWxAYWxz
YS1wcm9qZWN0Lm9yZz47DQo+UGllcnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3Nz
YXJ0QGxpbnV4LmludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW2Fsc2EtZGV2ZWxdIFtQQVRDSCA3
LzhdIEFMU0E6IHBjbTogQWRkIGNhcmQgc3luY19pcnEgZmllbGQNCj4NCj5PbiBUaHUsIDIxIE5v
diAyMDE5IDIxOjQ2OjE3ICswMTAwLA0KPlNyaWRoYXJhbiwgUmFuamFuaSB3cm90ZToNCj4+DQo+
PiAgICAgPg0KPj4gICAgID4gSGkgVGFrYXNoaSwNCj4+ICAgICA+DQo+PiAgICAgPiBTb3JyeSB0
aGUgc3RyZXNzIHRlc3RzIHRvb2sgYSB3aGlsZS4NCj4+ICAgICA+IEFzIHdlIGRpc2N1c3NlZCBl
YXJsaWVyLCBhZGRpbmcgdGhlIHN5bmNfc3RvcCgpIG9wIGRpZG50IHF1aXRlIGhlbHAgdGhlDQo+
PiAgICAgU09GDQo+PiAgICAgPiBkcml2ZXIgaW4gcmVtb3ZpbmcgdGhlIGRlbGF5ZWQgd29yayBm
b3INCj4+IHNuZF9wY21fcGVyaW9kX2VsYXBzZWQoKS4NCj4+DQo+PiAgICAgWWVhaCwgdGhhdCdz
IHVuZGVyc3RhbmRhYmxlLsKgIElmIHRoZSBzdG9wIG9wZXJhdGlvbiBpdHNlbGYgbmVlZHMgc29t
ZQ0KPj4gICAgIHNlcmlhbGl6YXRpb24sIHN5bmNfc3RvcCgpIHdvbid0IGluZmx1ZW5jZSBhdCBh
bGwuDQo+Pg0KPj4gICAgIEhvd2V2ZXIsIG5vdyBhZnRlciB0aGVzZSBkaXNjdXNzaW9ucywgSSBo
YXZlIHNvbWUgY29uY2VybnMgaW4gdGhlDQo+PiAgICAgY3VycmVudCBjb2RlOg0KPj4NCj4+ICAg
ICAtIFRoZSBhc3luYyB3b3JrIHN0YXJ0ZWQgYnkgc2NoZWR1bGVfd29yaygpIG1heSBiZSBleGVj
dXRlZA0KPj4gICAgIMKgIChsaXRlcmFsbHkpIGltbWVkaWF0ZWx5LsKgIFNvIGlmIHRoZSB0aW1p
bmcgb3IgdGhlIHNlcmlhbGl6YXRpb24NCj4+ICAgICDCoCBtYXR0ZXJzLCBpdCBkb2Vzbid0IGd1
YXJhbnRlZSBhdCBhbGwuwqAgVGhlIHNhbWUgbGV2ZWwgb2YgY29uY3VycmVuY3kNCj4+ICAgICDC
oCBjYW4gaGFwcGVuIGF0IGFueSB0aW1lLg0KPj4NCj4+ICAgICAtIFRoZSBwZXJpb2RfZWxhcHNl
ZCB3b3JrIG1pZ2h0IGJlIHBlbmRpbmcgYXQgcHJlcGFyZSBvciBvdGhlcg0KPj4gICAgIMKgIG9w
ZXJhdGlvbjsNCj4+ICAgICDCoCB0aGUgYXN5bmMgd29yayBtZWFucyBhbHNvIHRoYXQgaXQgZG9l
c24ndCBndWFyYW50ZWUgaXRzIGV4ZWN1dGlvbiBpbg0KPj4gICAgIMKgIHRpbWUsIGFuZCBpdCBt
aWdodCBiZSBkZWxheWVkIG11Y2gsIGFuZCB0aGUgUENNIGNvcmUgbWlnaHQgZ28gdG8NCj4+ICAg
ICDCoCBwcmVwYXJlIG9yIG90aGVyIHN0YXRlIGV2ZW4gYmVmb3JlIHRoZSB3b3JrIGlzIGV4ZWN1
dGVkLg0KPj4NCj4+ICAgICBUaGUgc2Vjb25kIHBvaW50IGNhbiBiZSBmaXhlZCBlYXNpbHkgbm93
IHdpdGggc3luY19zdG9wLsKgIFlvdSBjYW4ganVzdA0KPj4gICAgIHB1dCBmbHVzaF93b3JrKCkg
aW4gc3luY19zdG9wIGluIGFkZGl0aW9uIHRvIHN5bmNocm9uaXplX2lycSgpLg0KPj4NCj4+ICAg
ICBCdXQgdGhlIGZpcnN0IHBvaW50IGlzIHN0aWxsIHVuY2xlYXIuwqAgTW9yZSBleGFjdGx5LCB3
aGljaCBvcGVyYXRpb24NCj4+ICAgICBkb2VzIGl0IGNvbmZsaWN0P8KgIERvZXMgaXQgdGhlIHBs
YXliYWNrIGRyYWluP8KgIFRoZW4gaXQgbWlnaHQgdGFrZQ0KPj4gICAgIHZlcnkgbG9uZyAodXAg
dG8gc2Vjb25kcykgdG8gYmxvY2sgdGhlIG5leHQgb3BlcmF0aW9uPw0KPj4NCj4+IEhpIFRha2Fz
aGksDQo+Pg0KPj4gQXMgSSB1bmRlcnN0YW5kIHRoZSBvcmlnaW5hbCBpbnRlbnRpb24gZm9yIGFk
ZGluZyB0aGUNCj4+IHBlcmlvZF9lbGFwc2VkX3dvcmsoKSB3YXPCoCB0aGF0IHNuZF9wY21fcGVy
aW9kX2VsYXBzZWQoKSBjb3VsZCBjYXVzZSBhDQo+PiBTVE9QIHRyaWdnZXIgd2hpbGUgdGhlIGN1
cnJlbnQgSVBDIGludGVycnVwdCBpcyBzdGlsbCBiZWluZyBoYW5kbGVkLg0KPj4gSW4gdGhpcyBj
YXNlLCB0aGUgU1RPUCB0cmlnZ2VyIGdlbmVyYXRlcyBhbiBJUEMgdG8gdGhlIERTUCBidXQgdGhl
DQo+PiBob3N0IG5ldmVyIG1pc3NlcyB0aGUgSVBDIHJlc3BvbnNlIGZyb20gdGhlIERTUCBiZWNh
dXNlIGl0IGlzIHN0aWxsDQo+PiBoYW5kbGluZyB0aGUgcHJldmlvdXMgaW50ZXJydXB0Lg0KPg0K
Pk9LLCB0aGF0IG1ha2VzIHNlbnNlLiAgU28gdGhlIGlzc3VlIGlzIHRoYXQgdGhlIHRyaWdnZXIg
c3RvcCBpdHNlbGYgcmVxdWlyZXMgdGhlIGFjaw0KPnZpYSB0aGUgaW50ZXJydXB0IGFuZCBpdCBj
YW4ndCBiZSBjYXVnaHQgYmVjYXVzZSBpdCdzIGJlaW5nIGNhbGxlZCBmcm9tIHRoZSBpcnENCj5o
YW5kbGVyIGl0c2VsZi4NCj4NCj5JbiB0aGF0IGNhc2UsIHRob3VnaCwgYW5vdGhlciBzb2x1dGlv
biB3b3VsZCBiZSB0byBtYWtlIHRoZSB0cmlnZ2VyLSBzdG9wIGFuDQo+YXN5bmMgd29yayAoYnV0
IGNvbmRpdGlvbmFsbHkpIHdoaWxlIHByb2Nlc3NpbmcgdGhlIG5vcm1hbCBwZXJpb2RfZWxhcHNl
ZCBpbiB0aGUNCj5pcnEgaGFuZGxlci4gIFRoYXQgaXMsIHNldCBzb21lIGZsYWcgYmVmb3JlIGNh
bGxpbmcgc25kX3BjbV9wZXJpb2RfZWxhcHNlZCgpLCBhbmQNCj5pbiB0aGUgdHJpZ2dlci1zdG9w
LCBjaGVjayB0aGUgZmxhZy4gIElmIHRoZSBmbGFnIGlzIHNldCwgc2NoZWR1bGUgdGhlIHdvcmsg
YW5kIHJldHVybi4NCj5BbmQsIHlvdSdsbCBzeW5jIHRoaXMgYXN5bmMgd29yayB3aXRoIHN5bmNf
c3RvcCgpLiAgSW4gdGhhdCB3YXksIHRoZSBwZXJpb2QgaGFuZGxpbmcNCj5pcyBwcm9jZXNzZWQg
d2l0aG91dCBhbnkgZGVsYXkgbW9yZSBsaWdodGx5Lg0KDQpZZXMsIHRoaXMgd2FzIGFjdHVhbGx5
IHRoZSBtZXRob2QgQFVpbW9uZW4sIEphc2thIHN1Z2dlc3RlZCBvbiBBcHJpbCwgc2luY2Ugd2Ug
aGF2ZQ0Kc3luY19zdG9wKCkgdG8gZmx1c2ggdGhlIHBvdGVudGlhbCB1bi1maW5pc2hlZCBhc3lu
YyB0cmlnZ2VyX3N0b3AgdGFzayBub3csIGl0J3MgdGltZQ0KdG8gc3dpdGNoIHRvIHVzZSB0aGlz
IHNvbHV0aW9uIG5vdy4NCg0KVGhhbmtzLA0KfktleW9uDQoNCj4NCj4NCj50aGFua3MsDQo+DQo+
VGFrYXNoaQ0KPg0KPj4gQWRkaW5nIEtleW9uIHdobyBhZGRlZCB0aGlzIGNoYW5nZSB0byBhZGQg
bW9yZSBhbmQgY2xhcmlmeSB5b3VyIGNvbmNlcm5zLg0KPj4NCj4+IFRoYW5rcywNCj4+IFJhbmph
bmkNCj4+DQo+PiAgICAgdGhhbmtzLA0KPj4NCj4+ICAgICBUYWthc2hpDQo+Pg0KPj4NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFp
bGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxz
YS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
