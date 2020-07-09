Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 043A1219B8A
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 10:55:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D8711655;
	Thu,  9 Jul 2020 10:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D8711655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594284926;
	bh=vM+a2m/GjK0bVPRb6AO8/gFdKRjuqYBi8ZVR9GZRPIY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VyoIpuZHSseqJ9eZl/i1GuasOeoTq8PQOEcxuyU4QA8kEWahfPbBatrMonvjKSN12
	 bPX3DbKgY1XqMzXUkBqRpRbz3tcreYHv9cr95oTVD+C2BQHsNkgykxb6jVvRn3IDJP
	 EeQqE4zn/WA3d8m3YUETI3nzTJJBKnGcmI/LImXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 884E5F800AE;
	Thu,  9 Jul 2020 10:53:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84382F80216; Thu,  9 Jul 2020 10:53:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80890F8011F
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 10:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80890F8011F
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 0698rMcrD019717,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 0698rMcrD019717
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 9 Jul 2020 16:53:22 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 9 Jul 2020 16:53:22 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 9 Jul 2020 16:53:21 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8]) by
 RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8%5]) with mapi id
 15.01.1779.005; Thu, 9 Jul 2020 16:53:21 +0800
From: Kailang <kailang@realtek.com>
To: Hans de Goede <hdegoede@redhat.com>, Takashi Iwai <tiwai@suse.de>
Subject: RE: Fixing sound on Asus UX534F / some UX533 models
Thread-Topic: Fixing sound on Asus UX534F / some UX533 models
Thread-Index: AQHWONs22CJOa0S3f0amUcGxmmQQZKjIBMWAgB2OIACAAclNgIAH4+EQgAZbV4CAAwxBgIAGgxtQ
Date: Thu, 9 Jul 2020 08:53:21 +0000
Message-ID: <f25abaf4afdb452a940c1e5cc8182eb8@realtek.com>
References: <808c7b46-c86f-a3de-b645-c47e658e8abb@redhat.com>
 <s5hr1uxhc6k.wl-tiwai@suse.de> <b647b169111f4c46a7c81ec80c551498@realtek.com>
 <1a98fc46-b22a-cc2d-8de9-c2e703b2206b@redhat.com>
 <f254a433-63b3-1322-1a85-9b1bdaa04c5b@redhat.com>
 <531e01c492be4534bf1d98e32f4ddf4b@realtek.com>
 <19136909-7041-46ff-9033-82e3619792bc@redhat.com>
 <fad71bc2-9b3d-196c-270f-8d078fef6b37@redhat.com>
In-Reply-To: <fad71bc2-9b3d-196c-270f-8d078fef6b37@redhat.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.211]
Content-Type: multipart/mixed;
 boundary="_002_f25abaf4afdb452a940c1e5cc8182eb8realtekcom_"
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 c <kai.heng.feng@canonical.com>,
 =?utf-8?B?TWF4Y1vpjKbmpq5d?= <maxc@realtek.com>,
 "nuno.dias@gmail.com" <nuno.dias@gmail.com>
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

--_002_f25abaf4afdb452a940c1e5cc8182eb8realtekcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSGFucywNCg0KUGxlYXNlIGxldCBpdCBhIHRyeS4NCg0KS2FpbGFuZy4NCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRo
YXQuY29tPg0KPiBTZW50OiBTdW5kYXksIEp1bHkgNSwgMjAyMCA5OjI1IFBNDQo+IFRvOiBLYWls
YW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPjsgVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPg0K
PiBDYzogYyA8a2FpLmhlbmcuZmVuZ0BjYW5vbmljYWwuY29tPjsgYWxzYS1kZXZlbEBhbHNhLXBy
b2plY3Qub3JnOw0KPiBudW5vLmRpYXNAZ21haWwuY29tOyBNYXhjW+mMpuamrl0gPG1heGNAcmVh
bHRlay5jb20+DQo+IFN1YmplY3Q6IFJlOiBGaXhpbmcgc291bmQgb24gQXN1cyBVWDUzNEYgLyBz
b21lIFVYNTMzIG1vZGVscw0KPiANCj4gSGksDQo+IA0KPiBPbiA3LzMvMjAgNDo1MiBQTSwgSGFu
cyBkZSBHb2VkZSB3cm90ZToNCj4gPiBIaSwNCj4gPg0KPiA+IE9uIDYvMjkvMjAgNzo1NCBBTSwg
S2FpbGFuZyB3cm90ZToNCj4gPj4gSGkgSGFucywNCj4gPj4NCj4gPj4gVGhlIGJlbGxvd2luZyB3
YXMgR2VkaW1pbmFzIEFsZWtuYXZpY2l1cyAobGVrdHV2KSBtZW50aW9uLiAoTGF1bmNocGFkDQo+
ID4+ICMxNzMpID09PkFmdGVyIHJ1bm5pbmcgdGhlIGFib3ZlIGNvbW1hbmRzIHNvdW5kIGFuZCBt
aWMgd29ya3Mgb24gYm90aA0KPiBidWlsdC1pbiBhbmQgaGVhZHNldCB3aXRoIDIuNW1tIGNvbm5l
Y3Rvci4gVGhlIG1vZGVsIGlzIFVYNTMzRlRDLg0KPiA+Pg0KPiA+PiBJbnRlcm5hbCBNaWMgd2Fz
IHdvcmtlZC4NCj4gPg0KPiA+IEkgc2VlIGFuZCBpbiAoTGF1bmNocGFkICMxNzQpIHRoZXJlIGlz
IGFub3RoZXIgY29uZmlybWF0aW9uIHRoYXQNCj4gPiBldmVyeXRoaW5nIHdvcmtzLCB0aGlzIHRp
bWUgd2l0aCBhbiBVWDUzNEZUQy4NCj4gPg0KPiA+IEkgYWxzbyBnb3QgYSByZXBvcnQgZnJvbSBh
IHVzZXIgaW4gdGhlIFJlZCBIYXQgYnVnemlsbGEgYWJvdXQgdGhpczoNCj4gPg0KPiA+IE9uIGFu
IFVYNTM0RiBqdXN0IHRoZXNlIDIgY29tbWFuZHMgYXJlIGVub3VnaCB0byBtYWtlIGV2ZXJ5dGhp
bmcgd29yazoNCj4gPg0KPiA+IGhkYS12ZXJiIC9kZXYvc25kL2h3QzBEMCAweDIwIDB4NTAwIDB4
ZiBoZGEtdmVyYiAvZGV2L3NuZC9od0MwRDAgMHgyMA0KPiA+IDB4NDAwIDB4Nzc3NA0KPiA+DQo+
ID4gSSdtIG5vdCBlbnRpcmVseSBzdXJlIGlmIHVzaW5nIHRoZSBvdGhlciAyIGNvbW1hbmRzIHlv
dSBnYXZlIG1lIGFyZQ0KPiA+IGFjdGl2ZWx5IGNhdXNpbmcgcHJvYmxlbXMgdGhlcmUsIG9yIGlm
IHRoZXkganVzdCBhcmUgbm90IG5lY2Vzc2FyeS4NCj4gPiBJJ3ZlIGFza2VkIHRoZSByZXBvcnRl
ciBhYm91dCB0aGlzLg0KPiA+DQo+ID4gU28gaXQgbG9va3MgbGlrZSBzb21lIG1vZGVscyBuZWVk
IGp1c3Q6DQo+ID4NCj4gPiBoZGEtdmVyYiAvZGV2L3NuZC9od0MwRDAgMHgyMCAweDUwMCAweGYg
aGRhLXZlcmIgL2Rldi9zbmQvaHdDMEQwIDB4MjANCj4gPiAweDQwMCAweDc3NzQNCj4gPg0KPiA+
IFdoaWxlIG90aGVycyBuZWVkIGFsbCA0IGNvbW1hbmRzOg0KPiA+DQo+ID4gaGRhLXZlcmIgL2Rl
di9zbmQvaHdDMUQwIDB4MjAgMHg1MDAgMHhmIGhkYS12ZXJiIC9kZXYvc25kL2h3QzFEMCAweDIw
DQo+ID4gMHg0MDAgMHg3Nzc0IGhkYS12ZXJiIC9kZXYvc25kL2h3QzFEMCAweDIwIDB4NTAwIDB4
NDUgaGRhLXZlcmINCj4gPiAvZGV2L3NuZC9od0MxRDAgMHgyMCAweDQwMCAweDUyODkNCj4gPg0K
PiA+IEthaWxhbmcsIGlzIHRoYXQgZW5vdWdoIHRvIHdyaXRlIGEga2VybmVsIHBhdGNoIGZvciB0
aGlzPyBJZiBub3Qgd2hhdA0KPiA+IG90aGVyIGluZm8gZG8geW91IG5lZWQgPw0KPiANCj4gQSBx
dWljayBmb2xsb3ctdXAgb24gdGhpcywgb25lIG9mIHRoZSByZXBvcnRlcnMgb2Y6DQo+IGh0dHBz
Oi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjA2Mjg5DQo+IA0KPiBTdGls
bCBoYXMgYSBwcm9ibGVtIHdpdGggdGhlIGludGVybmFsIG1pYyBub3Qgd29ya2luZy4NCj4gDQo+
IEhlIGhhcyB0cmllZCBib3RoIHVzaW5nIGFsbCA0IG9mIHRoZXNlOg0KPiANCj4gaGRhLXZlcmIg
L2Rldi9zbmQvaHdDMUQwIDB4MjAgMHg1MDAgMHhmDQo+IGhkYS12ZXJiIC9kZXYvc25kL2h3QzFE
MCAweDIwIDB4NDAwIDB4Nzc3NCBoZGEtdmVyYiAvZGV2L3NuZC9od0MxRDANCj4gMHgyMCAweDUw
MCAweDQ1IGhkYS12ZXJiIC9kZXYvc25kL2h3QzFEMCAweDIwIDB4NDAwIDB4NTI4OQ0KPiANCj4g
QXMgd2VsbCBhcyBqdXN0IHVzaW5nOg0KPiANCj4gaGRhLXZlcmIgL2Rldi9zbmQvaHdDMUQwIDB4
MjAgMHg1MDAgMHhmDQo+IGhkYS12ZXJiIC9kZXYvc25kL2h3QzFEMCAweDIwIDB4NDAwIDB4Nzc3
NA0KPiANCj4gV2hpY2ggc29tZSB1c2VycyByZXBvcnQgaXMgZW5vdWdoIGZvciB0aGVtLg0KPiBI
aXMgZXhhY3QgbW9kZWxpcyAiVVg1MzNGVEMtQTgyMjFSIg0KPiANCj4gU3RpbGwgdGhlIDIgLyA0
IGNvbW1hbmRzIChkZXBlbmRpbmcgb24gdGhlIGV4YWN0IG1vZGVsKSBkbyBoZWxwIGZvciB2YXJp
b3VzDQo+IG90aGVyIHVzZXJzL21vZGVscyBzbyBpdCB3b3VsZCBiZSBnb29kIHRvIGdldCB0aGVz
ZSBhZGRlZCBhcyBmaXh1cHMgdG8gdGhlDQo+IGtlcm5lbC4NCj4gDQo+IFRoZSBzcGVjaWZpYyBt
b2RlbCB3aXRoIHRoZSBpbnRlcm5hbC1taWMgaXNzdWUgd2lsbCBuZWVkIGZ1cnRoZXIgZXhhbWlu
YXRpb24uDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gSGFucw0KPiANCj4gDQo+IA0KPiA+Pj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+IEZyb206IEhhbnMgZGUgR29lZGUgPGhkZWdv
ZWRlQHJlZGhhdC5jb20+DQo+ID4+PiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMjQsIDIwMjAgOTox
OSBQTQ0KPiA+Pj4gVG86IEthaWxhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+OyBUYWthc2hpIEl3
YWkgPHRpd2FpQHN1c2UuZGU+DQo+ID4+PiBDYzogYyA8a2FpLmhlbmcuZmVuZ0BjYW5vbmljYWwu
Y29tPjsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnOw0KPiA+Pj4gbnVuby5kaWFzQGdtYWls
LmNvbQ0KPiA+Pj4gU3ViamVjdDogUmU6IEZpeGluZyBzb3VuZCBvbiBBc3VzIFVYNTM0RiAvIHNv
bWUgVVg1MzMgbW9kZWxzDQo+ID4+Pg0KPiA+Pj4gSGksDQo+ID4+Pg0KPiA+Pj4gT24gNi8yMy8y
MCAxMjowMiBQTSwgSGFucyBkZSBHb2VkZSB3cm90ZToNCj4gPj4+PiBIaSwNCj4gPj4+Pg0KPiA+
Pj4+IE9uIDYvNC8yMCA4OjQ5IEFNLCBLYWlsYW5nIHdyb3RlOg0KPiA+Pj4+PiBIaSBIYW5zIGRl
IEdvZWRlLA0KPiA+Pj4+Pg0KPiA+Pj4+PiBQbGVhc2UgdGVzdCBiZWxvdy4NCj4gPj4+Pj4NCj4g
Pj4+Pj4gaGRhLXZlcmIgL2Rldi9zbmQvaHdDMEQwIDB4MjAgMHg1MDAgMHhmIGhkYS12ZXJiIC9k
ZXYvc25kL2h3QzBEMA0KPiA+Pj4gMHgyMA0KPiA+Pj4+PiAweDQwMCAweDc3NzQgaGRhLXZlcmIg
L2Rldi9zbmQvaHdDMEQwIDB4MjAgMHg1MDAgMHg0NSBoZGEtdmVyYg0KPiA+Pj4+PiAvZGV2L3Nu
ZC9od0MwRDAgMHgyMCAweDQwMCAweDUyODkNCj4gPj4+Pj4NCj4gPj4+Pj4gSSB0aGluayBIZWFk
c2V0IE1pYyB3aWxsIHdvcmsuDQo+ID4+Pj4NCj4gPj4+PiBUaGFuayB5b3UsIGFuZCBzb3JyeSBm
b3IgYmVpbmcgc29tZXdoYXQgc2xvdyB0byByZXNwb25kLg0KPiA+Pj4+DQo+ID4+Pj4gSSBkbyBu
b3QgaGF2ZSBhY2Nlc3MgdG8gdGhlIGFmZmVjdGVkIGhhcmR3YXJlIG15c2VsZi4NCj4gPj4+Pg0K
PiA+Pj4+IEkndmUgYXNrZWQgdXNlcnMgd2hvIGhhdmUgcmVwb3J0ZWQgYnVncyBhYm91dCB0aGlz
IHRvIHRlc3QgdGhlc2UNCj4gPj4+PiBzZXR0aW5nIGFuZCByZXBvcnQgYmFjayBpbiB0aGUgZm9s
bG93aW5nIGJ1Zy1yZXBvcnRzOg0KPiA+Pj4+DQo+ID4+Pj4gaHR0cHM6Ly9idWdzLmxhdW5jaHBh
ZC5uZXQvdWJ1bnR1Lytzb3VyY2UvbGludXgvK2J1Zy8xODUwNDM5DQo+ID4+Pj4gaHR0cHM6Ly9i
dWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDYyODkNCj4gPj4+PiBodHRwczov
L2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTE4MzQ3NTENCj4gPj4+Pg0KPiA+
Pj4+IEkgd2lsbCBmb2xsb3ctdXAgd2hlbiBJIGhhdmUgaGVhcmQgYmFjayBmcm9tIHRoZSBidWct
cmVwb3J0ZXJzLg0KPiA+Pj4NCj4gPj4+IE9rLCBJJ3ZlIGdvdHRlbiB0aGUgZmlyc3QgZmVlZGJh
Y2suIEkgdmUgYXNrZWQgdGhlIHVzZXJzIHRvIHRlc3QgdGhlDQo+ID4+PiBmb2xsb3dpbmcgYWZ0
ZXIgcnVubmluZyB0aGUgNCBzdWdnZXN0ZWQgaGRhLXZlcmIgY29tbWFuZHM6DQo+ID4+Pg0KPiA+
Pj4gMS4gU3BlYWtlcnMNCj4gPj4+IDIuIEhlYWRwaG9uZXMgb3V0cHV0DQo+ID4+PiAzLiBJbnRl
cm5hbCBtaWMuDQo+ID4+PiA0LiBIZWFkc2V0IG1pYy4gKHVzaW5nIGEgcGhvbmUgaGVhZHNldCB3
aXRoIGJ1aWx0aW4gbWljIHdpdGggYQ0KPiA+Pj4gc2luZ2xlIFQtUi1SLVMNCj4gPj4+IGNvbm5l
Y3RvcikNCj4gPj4+DQo+ID4+PiBJJ3ZlIGdvdCBmZWVkYmFjayBmcm9tIGEgdXNlciB3aXRoIGEg
VVg1MzNGVEMtQTgyMjFSIGxhcHRvcDoNCj4gPj4+DQo+ID4+PiAxLiBTcGVha2Vyczogd29ya3MN
Cj4gPj4+IDIuIEhlYWRwaG9uZXMgb3V0cHV0OiB3b3Jrcw0KPiA+Pj4gMy4gSW50ZXJuYWwgbWlj
OiBkb2Vzbid0IHdvcmsNCj4gPj4+IDQuIEhlYWRzZXQgbWljOiB3b3Jrcw0KPiA+Pj4NCj4gPj4+
IFNvIHRoaW5ncyBhcmUgbG9va2luZyBvaywgYnV0IHdlIHN0aWxsIGhhdmUgc29tZSB3b3JrIHRv
IGRvIHRvIGdldA0KPiA+Pj4gdGhlIGludGVybmFsIG1pYyB0byB3b3JrLg0KPiA+Pj4NCj4gPj4+
IEthaWxhbmcgZG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zIGZvciBnZXR0aW5nIHRoZSBpbnRl
cm5hbCBtaWMgdG8gd29yaz8NCj4gPj4+DQo+ID4+PiBSZWdhcmRzLA0KPiA+Pj4NCj4gPj4+IEhh
bnMNCj4gPj4+DQo+ID4+Pg0KPiA+Pj4NCj4gPj4+DQo+ID4+Pg0KPiA+Pj4NCj4gPj4+Pj4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4+PiBGcm9tOiBUYWthc2hpIEl3YWkgPHRp
d2FpQHN1c2UuZGU+DQo+ID4+Pj4+PiBTZW50OiBUdWVzZGF5LCBKdW5lIDIsIDIwMjAgODo0MiBQ
TQ0KPiA+Pj4+Pj4gVG86IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+DQo+ID4+
Pj4+PiBDYzogS2FpbGFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT47IGMNCj4gPj4+Pj4+IDxrYWku
aGVuZy5mZW5nQGNhbm9uaWNhbC5jb20+OyBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7DQo+
ID4+Pj4+PiBudW5vLmRpYXNAZ21haWwuY29tDQo+ID4+Pj4+PiBTdWJqZWN0OiBSZTogRml4aW5n
IHNvdW5kIG9uIEFzdXMgVVg1MzRGIC8gc29tZSBVWDUzMyBtb2RlbHMNCj4gPj4+Pj4+DQo+ID4+
Pj4+PiBPbiBUdWUsIDAyIEp1biAyMDIwIDExOjUxOjQ5ICswMjAwLCBIYW5zIGRlIEdvZWRlIHdy
b3RlOg0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4gSGkgS2FpLUhlbmcgRmVuZywgVGFrYXNoaSwNCj4g
Pj4+Pj4+Pg0KPiA+Pj4+Pj4+IEkgc2VlIHRoYXQgeW91IGFyZSBvbiB0aGUgbm90aWZpY2F0aW9u
IGxpc3QgZm9yIHRoaXMgYnVnOg0KPiA+Pj4+Pj4+IGh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0
L3VidW50dS8rc291cmNlL2xpbnV4LytidWcvMTg1MDQzOQ0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4g
U28geW91IG1heSBoYXZlIGFscmVhZHkgc2VlbiB0aGlzLiBTb21lIG93bmVycyBvZiBhZmZlY3Rl
ZA0KPiA+Pj4+Pj4+IGxhcHRvcHMgKHdoaWNoIGhhdmUgbm9uIHdvcmtpbmcgc3BlYWtlcnMgLyBo
ZWFkcGhvbmUgb3V0cHV0DQo+ID4+Pj4+Pj4gYXRtKSwgaGF2ZSBkb25lIHNvbWUgaGVyb2ljIGRl
YnVnZ2luZyB3b3JrIGFuZCBjb21lIHVwIHdpdGggYQ0KPiA+Pj4+Pj4+IHNldCBvZg0KPiA+Pj4+
Pj4+IDIgaGRhLXZlcmIgY29tbWFuZHMgd2hpY2ggZml4IHRoaXMuDQo+ID4+Pj4+Pj4NCj4gPj4+
Pj4+PiBJJ20gbm90IGFsbCB0aGF0IGZhbWlsaWFyIHdpdGggd3JpdGluZyBoZGEgcXVpcmtzLCBz
byBJIHdhcw0KPiA+Pj4+Pj4+IGhvcGluZyB0aGF0IG9uZSBvZiB5b3UgMiBjYW4gY29tZSB1cCB3
aXRoIGEgcGF0Y2ggdG8gZml4IHRoaXMgYXQNCj4gPj4+Pj4+PiB0aGUga2VybmVsIGxldmVsLg0K
PiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4gVGhpcyB3b3VsZCBhbHNvIHJlc29sdmUgdGhlc2UgMiBidWdz
LCB3aGljaCBJIGJlbGlldmUgYXJlIHRoZQ0KPiA+Pj4+Pj4+IHNhbWUgYnVnDQo+ID4+Pj4+Pj4g
cmVhbGx5Og0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3Jn
L3Nob3dfYnVnLmNnaT9pZD0yMDYyODkNCj4gPj4+Pj4+PiBodHRwczovL2J1Z3ppbGxhLnJlZGhh
dC5jb20vc2hvd19idWcuY2dpP2lkPTE4MzQ3NTENCj4gPj4+Pj4+DQo+ID4+Pj4+PiBBZGRpbmcg
dmVyYnMgYXJlIHRyaXZpYWwgYW5kIGl0IGNhbiBiZSBkb25lIGV2ZW4gd2l0aG91dCBwYXRjaGlu
Zw0KPiA+Pj4+Pj4ga2VybmVsIGJ1dCBwcm92aWRpbmcgYnkgYSBwYXRjaCB2aWEgcGF0Y2ggbW9k
dWxlIG9wdGlvbiBvZg0KPiA+Pj4+Pj4gc25kLWhkYS1pbnRlbA0KPiA+Pj4gZHJpdmVyLg0KPiA+
Pj4+Pj4NCj4gPj4+Pj4+IEJ1dCwgYmVmb3JlIG1vdmluZyBmb3J3YXJkLCBJJ2QgbGlrZSB0byBj
b25maXJtIGFib3V0IHRoZQ0KPiA+Pj4+Pj4gY29ycmVjdG5lc3MgKGFuZCB0aGUNCj4gPj4+Pj4+
IHNhZmVuZXNzKSBvZiB0aG9zZSB2ZXJicy4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBLYWlsYW5nLCBj
b3VsZCB5b3UgY2hlY2sgdGhlIENPRUYgdmVyYnMgbWVudGlvbmVkIGluIHRoZSBidWcNCj4gPj4+
Pj4+IGVudHJ5DQo+ID4+PiBhYm92ZT8NCj4gPj4+Pj4+DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gdGhh
bmtzLA0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IFRha2FzaGkNCj4gPj4+Pj4+DQo+ID4+Pj4+PiAtLS0t
LS1QbGVhc2UgY29uc2lkZXIgdGhlIGVudmlyb25tZW50IGJlZm9yZSBwcmludGluZyB0aGlzIGUt
bWFpbC4NCj4gPj4+Pj4NCj4gPj4NCg0K

--_002_f25abaf4afdb452a940c1e5cc8182eb8realtekcom_
Content-Type: application/octet-stream; name="0000-asus-ux533-ux534.patch"
Content-Description: 0000-asus-ux533-ux534.patch
Content-Disposition: attachment; filename="0000-asus-ux533-ux534.patch";
	size=755; creation-date="Thu, 09 Jul 2020 08:51:48 GMT";
	modification-date="Thu, 09 Jul 2020 08:50:52 GMT"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hk
YS9wYXRjaF9yZWFsdGVrLmMKaW5kZXggYWQ0MzgxMmQ2M2I1Li4zOTMwMDVkZDUxM2IgMTAwNjQ0
Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEv
cGF0Y2hfcmVhbHRlay5jCkBAIC03MTE0LDcgKzcxMTQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGhkYV9maXh1cCBhbGMyNjlfZml4dXBzW10gPSB7CiAJCQl7IH0KIAkJfSwKIAkJLmNoYWluZWQg
PSB0cnVlLAotCQkuY2hhaW5faWQgPSBBTEMyNjlfRklYVVBfSEVBRFNFVF9NT0RFX05PX0hQX01J
QworCQkuY2hhaW5faWQgPSBBTEMyNjlfRklYVVBfSEVBRFNFVF9NSUMKIAl9LAogCVtBTEMyOTRf
RklYVVBfQVNVU19TUEtdID0gewogCQkudHlwZSA9IEhEQV9GSVhVUF9WRVJCUywKQEAgLTcxMjIs
NiArNzEyMiw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwIGFsYzI2OV9maXh1cHNb
XSA9IHsKIAkJCS8qIFNldCBFQVBEIGhpZ2ggKi8KIAkJCXsgMHgyMCwgQUNfVkVSQl9TRVRfQ09F
Rl9JTkRFWCwgMHg0MCB9LAogCQkJeyAweDIwLCBBQ19WRVJCX1NFVF9QUk9DX0NPRUYsIDB4ODgw
MCB9LAorCQkJeyAweDIwLCBBQ19WRVJCX1NFVF9DT0VGX0lOREVYLCAweDBmIH0sCisJCQl7IDB4
MjAsIEFDX1ZFUkJfU0VUX1BST0NfQ09FRiwgMHg3Nzc0IH0sCiAJCQl7IH0KIAkJfSwKIAkJLmNo
YWluZWQgPSB0cnVlLAo=

--_002_f25abaf4afdb452a940c1e5cc8182eb8realtekcom_--
