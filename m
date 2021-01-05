Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4DF2EA657
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 09:13:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 255BD1677;
	Tue,  5 Jan 2021 09:12:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 255BD1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609834423;
	bh=XJ/ZIzxSvgVbm1UQBa39Har+vghnjhOVodMKeDqGtQA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sg94wlHnREAa7KmQ+CcjRfFHbUTKj+MYaHqXluRR0oY4i9zE04QcrrNYa+X4ed8uN
	 epS7Dx18PBnKdMcMeU29Rpa42l2tUJcC9g8wO/JARnhZ6pta32TnMR2+xjjg30V8OU
	 Tp8CG8YPM8+vWHyeQh/mMYRmgYJVleChyKirx0HE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7646F80268;
	Tue,  5 Jan 2021 09:12:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35440F80258; Tue,  5 Jan 2021 09:12:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C34AF8015B
 for <alsa-devel@alsa-project.org>; Tue,  5 Jan 2021 09:11:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C34AF8015B
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1058BjXdA024170,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs02.realtek.com.tw[172.21.6.95])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 1058BjXdA024170
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 5 Jan 2021 16:11:45 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 5 Jan 2021 16:11:45 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 5 Jan 2021 16:11:44 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::5d07:e256:a2a2:81ee]) by
 RTEXMBS01.realtek.com.tw ([fe80::5d07:e256:a2a2:81ee%5]) with mapi id
 15.01.2106.006; Tue, 5 Jan 2021 16:11:44 +0800
From: Jack Yu <jack.yu@realtek.com>
To: Jaroslav Kysela <perex@perex.cz>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "Takashi
 Iwai" <tiwai@suse.de>, Jack Yu <jack.yu@realtek.com>
Subject: RE: [PATCH] ASoC: rt715: add main capture switch and main capture
 volume control
Thread-Topic: [PATCH] ASoC: rt715: add main capture switch and main capture
 volume control
Thread-Index: AQHW0eU5Vymhs5sNg0S4d81mV81ey6n2sgAFgAAi1RyAAJ5IAIAAWcGAgAAHh4CAAArDAIAABykAgCDd4ZA=
Date: Tue, 5 Jan 2021 08:11:44 +0000
Message-ID: <0dad47e2445e474ea0a982163521f986@realtek.com>
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
In-Reply-To: <b25c849f-d1ed-f503-444f-3a49e0d03e7e@perex.cz>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.167]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "libin.yang@intel.com" <libin.yang@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
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

KyBJbnRlbCBMaWJpbg0KDQpIaSBKYXJvc2xhdiBhbmQgSW50ZWwgdGVhbSwNCg0KPiA+DQo+ID4+
Pj4gTXkgc3VnZ2VzdGlvbnMgYXJlIChwaWNrIG9uZSk6DQo+ID4+Pj4NCj4gPj4+PiAxKSBjcmVh
dGUgb25lIG11bHRpY2hhbm5lbCBjb250cm9sIGFuZCByZW1vdmUgdGhlIHN0ZXJlbyBjb250cm9s
cw0KPiA+Pj4+IHdoZW4gdGhlIGhhcmR3YXJlIGlzIGRldGVjdGVkIChubyBmdW5jdGlvbmFsaXR5
IGR1cCkNCj4gPj4+DQo+ID4+PiB3ZSBjYW4ndCByZW1vdmUgY29udHJvbHMgdGhhdCBleGlzdGVk
IGJlZm9yZSwgdGhpcyBtaWdodCBicmVhaw0KPiA+Pj4gdXNlcnNwYWNlDQo+ID4+DQoNCiJjcmVh
dGUgb25lIG11bHRpY2hhbm5lbCBjb250cm9sIGFuZCByZW1vdmUgdGhlIHN0ZXJlbyBjb250cm9s
cyIgDQpUaGlzIG1pZ2h0IGJlIHRoZSBlYXNpZXN0IHdheSBmb3IgaW1wbGVtZW50YXRpb24gb24g
ZHJpdmVyLCBidXQgaXQgbWlnaHQgYWZmZWN0IGN1cnJlbnQgdWNtIHN0cnVjdHVyZS4NCg0KQmVz
aWRlcywgcGVyIHByZXZpb3VzIGRpc2N1c3Npb24gKG9uIERFQyAxNSwyMDIwKSAsDQpyZW1vdmUg
Ik1haW4iIGZyb20gIk1haW4gQ2FwdHVyZSBTd2l0Y2gvVm9sdW1lIiBhbmQga2VlcCB0aGUgcmVz
dCBjb250cm9scyBpcyBhbHNvIGFuIG9wdGlvbiwgaXMgaXQ/DQoNCkZvciBtZSwgYm90aCBhYm92
ZSBzdWdnZXN0aW9ucyBhcmUgZG9hYmxlLCB3aGF0J3MgaW50ZWwgdGVhbSdzIG9waW5pb24/IA0K
DQo+ID4+IEl0J3Mgbm90IHdpZGVseSB1c2VkLCBzbyBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gYnJl
YWsgdGhpbmdzIG5vdyB0aGFuIGxhdGVyLg0KPiA+DQo+ID4gcnQ3MTUgaGFzIGJlZW4gdXNlZCBv
biBDb21ldExha2UtYmFzZWQgZGV2aWNlcyBmb3IgYSB3aGlsZSAoMS41IHllYXJzPykuDQo+IA0K
PiBCdXQgU0RXIGlzIHN1cHBvcnRlZCByZWNlbnRseSBpbiB0aGUgdXBzdHJlYW0gTGludXgga2Vy
bmVsLiBTbyB0aGVyZSBhcmUgbm8NCj4gdXNlcnMuDQo+IA0KPiA+PiBCdXQgSSBzZWUgdGhhdCBv
dGhlcnMgYXJlIGEgYml0IGNvbnNlcnZhdGl2ZS4NCj4gPj4NCj4gPj4+IHdpdGggb2xkZXIgVUNN
IGZpbGVzIHRoYXQgdG91Y2ggdGhvc2UgQURDMDcgYW5kIEFEQzI3LiBUaGF0J3Mgd2h5IHdlDQo+
ID4+DQo+ID4+IFRoZSB1cHN0cmVhbSBVQ00gZmlsZXMgZG9uJ3QgcmVmZXIgdG8gdGhvc2UgY29u
dHJvbHMuDQo+ID4NCj4gPiB0aGV5IGRvLCB1bmZvcnR1bmF0ZWx5LCBzZWUgdWNtMi9jb2RlY3Mv
cnQ3MTUvaW5pdC5jb25mDQo+ID4NCj4gPiBjc2V0ICJuYW1lPSdydDcxNSBBREMgMjcgQ2FwdHVy
ZSBTd2l0Y2gnIDEiDQo+ID4gY3NldCAibmFtZT0ncnQ3MTUgQURDIDA3IENhcHR1cmUgU3dpdGNo
JyAxIg0KPiA+IGNzZXQgIm5hbWU9J3J0NzE1IEFEQyAwNyBDYXB0dXJlIFZvbHVtZScgNTgiDQo+
ID4NCj4gPj4+IGFkZGVkIGEgbmV3IG9uZSwgdG8gYmUgYmFja3dhcmRzIGNvbXBhdGlibGUgd2l0
aCBhIHVzZXIgdXBkYXRlcw0KPiA+Pj4gdGhlaXIga2VybmVsLg0KPiA+Pg0KPiA+PiBFdmVuIGlm
IHlvdSBkb24ndCByZW1vdmUgdGhlIGR1cGxpY2F0ZSBjb250cm9scywgdGhlIHJpZ2h0DQo+ID4+
IGFic3RyYWN0aW9uIGlzIG1vcmUgYXBwcm9wcmlhdGUgaW4gbXkgZXllcyAoYmV0dGVyIHRoYW4g
dm1hc3Rlcg0KPiA+PiBleHRlbnNpb24pLiBUaGUgZG91YmxlIHN0ZXJlbyAtPiA0IGNoYW5uZWwg
YXJyYXkgbWFwcGluZyBpcyBub3QgZnVsbHkNCj4gY29ycmVjdCAodm1hc3RlciwgcHJvcG9zZWQg
cGF0Y2gpLg0KPiA+DQo+ID4gVGhlIGhhcmR3YXJlIGV4cG9zZXMgcmVnaXN0ZXJzIHRvIGRlYWwg
d2l0aCB0d28gaW5wdXRzIHNlcGFyYXRlbHksDQo+ID4gdGhleSBhcmUgbm90IGR1cGxpY2F0ZXMu
IFRoZSBwb2ludCBoZXJlIGlzIHRoYXQgd2UgbmVlZCBhIG1hcHBpbmcgdG8gYQ0KPiA+IHNpbXBs
ZXIgdmlldyB3aGVyZSB0aG9zZSB0d28gaW5wdXRzIGFyZSBtZXJnZWQgbG9naWNhbGx5Lg0KPiAN
Cj4gWWVzLCBidXQgd2h5IHRvIGZvcmNlIHN0ZXJlbyBncm91cGluZyB3aGVuIHlvdSBuZWVkIHRv
IGNvbnRyb2wgNCBpbmRlcGVuZGVudA0KPiBjaGFubmVscyBmcm9tIHRoZSB1c2VyIHNwYWNlIFBP
Vj8gSSdtIHNwZWFraW5nIGFib3V0IHRoZSBmb3JjZWQgJ3N0ZXJlbyAtPiA0DQo+IGNoYW5uZWxz
IHZvbHVtZSAvIHN3aXRjaCcgbWFwcGluZy4NCj4gDQo+ID4+Pj4gMykgd2FpdCB1bnRpbCBVQ00g
Y2FuIGRlc2NyaWJlIHRoaXMgaGFyZHdhcmUgYW5kIHNldCB0aGUgREFDIHZhbHVlcw0KPiA+Pj4+
IG1hbnVhbGx5IHRvIGEgc2Vuc2libGUgdmFsdWUgdmlhIHNlcXVlbmNlcyAodGhlIHNwZWNpZmlj
IGhhcmR3YXJlDQo+ID4+Pj4gbGV2ZWxzIGNhbiBiZSBzZXQgdXNpbmcgdGhlIGNvbmRpdGlvbnMg
aW4gVUNNKQ0KPiA+Pj4NCj4gPj4+IE5vdCBhbiBvcHRpb24sIHRoZXJlIGFyZSBwcm9kdWN0cyB0
aGF0IG5lZWQgdG8gc2hpcCBzb29uLg0KPiA+Pg0KPiA+PiBJdCdzIHRoZSBlYXNpZXN0IG1ldGhv
ZCBmb3Igbm93LiBJdCdzIGp1c3QgYWJvdXQgdG8gY2hhbmdlIHRoZSBVQ00NCj4gPj4gZmlsZXMg
d2l0aG91dCBhbnkgb3RoZXIgY2hhbmdlcyBpbiB0aGUga2VybmVsIC8gdXNlciBzcGFjZS4gSXQn
cw0KPiA+PiBoZWF2aWx5IHVzZWQgZm9yIFNTVCBkcml2ZXJzLCBpc24ndD8NCj4gPj4NCj4gPj4g
VGhlIGN1cnJlbnQgVUNNIHVwc3RyZWFtIG1vZGlmaWVzIG9ubHkgU09GIHZvbHVtZSBsZXZlbHMg
KFBHQSBNYXN0ZXINCj4gQ2FwdHVyZSkuDQo+ID4NCj4gPiB0aGF0J3Mgbm90IHJpZ2h0LCBzZWUg
YWJvdmUuDQo+ID4NCj4gPiBJIG1heSBoYXZlIG1pc3VuZGVyc3Rvb2QgeW91ciBwb2ludCBmb3Ig
MykuIEkgYXNzdW1lZCB5b3UnZCBuZWVkIGENCj4gPiBkZXNjcmlwdGlvbiBjb21pbmcgZnJvbSB0
aGUga2VybmVsLCBhcyB3ZSBkaWQgYmVmb3JlIGZvciB0aGUNCj4gPiBjb21wb25lbnRzIChjZmct
bWljcywgZXRjKS4gSG93IHdvdWxkIFVDTSBrbm93IHdoaWNoIG9mIHRoZSBjb250cm9scw0KPiA+
IHRvIHVzZSB3aXRob3V0IGFueSBjaGFuZ2UgdG8gdGhlIGtlcm5lbD8NCj4gDQo+IElkZWFsbHks
IHllcyAtIGl0IHdpbGwgaGVscCB0byByZWR1Y2UgdGhlIGNvbmZpZ3VyYXRpb24gYW5kIHRoZSBk
cml2ZXIgYWxyZWFkeQ0KPiBrbm93cyBtb3JlIGFib3V0IHRoZSBoYXJkd2FyZS4gQnV0IHdlIGNh
biBkbyBETUkgbWF0Y2hpbmcgaW4gVUNNIGZvciBub3csDQo+IHRvby4NCj4gDQoNCkBMaWJpbiAg
SXMgdGhpcyBtb2RpZmljYXRpb24gd29ya2FibGUgZm9yIHlvdT8gSSdkIGxpa2UgdG8ga25vdyB5
b3VyIG9waW5pb24gYWJvdXQgaXQuIFRoYW5rcy4NCg0KPiBFeGFtcGxlIG9mIHRoZSBzeXNmcyBz
dWJzdGl0dXRpb246DQo+IA0KPiAgICR7c3lzOmNsYXNzL2RtaS9pZC9zeXNfdmVuZG9yfQ0KPiAg
ICR7c3lzOmNsYXNzL2RtaS9pZC9wcm9kdWN0X3ZlcnNpb259DQo+IA0KPiAJCQkJCQlKYXJvc2xh
dg0KPiANCj4gLS0NCj4gSmFyb3NsYXYgS3lzZWxhIDxwZXJleEBwZXJleC5jej4NCj4gTGludXgg
U291bmQgTWFpbnRhaW5lcjsgQUxTQSBQcm9qZWN0OyBSZWQgSGF0LCBJbmMuDQo+IA0KPiAtLS0t
LS1QbGVhc2UgY29uc2lkZXIgdGhlIGVudmlyb25tZW50IGJlZm9yZSBwcmludGluZyB0aGlzIGUt
bWFpbC4NCg==
