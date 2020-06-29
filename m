Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFCB20CCA0
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 07:56:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BD881672;
	Mon, 29 Jun 2020 07:56:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BD881672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593410217;
	bh=+DigxnxghxIIiQOivboalklL1Oc1OvuiuJSJbBz3Yz4=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cy7FUV5M3p/mrTm4ryXNSgxpxKs+tuNYESfQ9BrLq4+H4AUC57w44rUa3oPaswEVW
	 7irG7bMoWUaXkGqCwXwE40pqcIlfCh7zybkCYp2Cq5TdMu0olnB1QgfYOTAFeDyeHE
	 Werhwb+2vQbimu5nEFGOCdCyxClr1vd2OyX3YYfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95E9CF80217;
	Mon, 29 Jun 2020 07:55:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77B87F8020C; Mon, 29 Jun 2020 07:55:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1504AF800EA
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 07:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1504AF800EA
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 05T5sx113012439,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 05T5sx113012439
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 29 Jun 2020 13:54:59 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 29 Jun 2020 13:54:59 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 29 Jun 2020 13:54:59 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8]) by
 RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8%5]) with mapi id
 15.01.1779.005; Mon, 29 Jun 2020 13:54:59 +0800
From: Kailang <kailang@realtek.com>
To: Hans de Goede <hdegoede@redhat.com>, Takashi Iwai <tiwai@suse.de>
Subject: RE: Fixing sound on Asus UX534F / some UX533 models
Thread-Topic: Fixing sound on Asus UX534F / some UX533 models
Thread-Index: AQHWONs22CJOa0S3f0amUcGxmmQQZKjIBMWAgB2OIACAAclNgIAH4+EQ
Date: Mon, 29 Jun 2020 05:54:58 +0000
Message-ID: <531e01c492be4534bf1d98e32f4ddf4b@realtek.com>
References: <808c7b46-c86f-a3de-b645-c47e658e8abb@redhat.com>
 <s5hr1uxhc6k.wl-tiwai@suse.de> <b647b169111f4c46a7c81ec80c551498@realtek.com>
 <1a98fc46-b22a-cc2d-8de9-c2e703b2206b@redhat.com>
 <f254a433-63b3-1322-1a85-9b1bdaa04c5b@redhat.com>
In-Reply-To: <f254a433-63b3-1322-1a85-9b1bdaa04c5b@redhat.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.211]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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

SGkgSGFucywNCg0KVGhlIGJlbGxvd2luZyB3YXMgR2VkaW1pbmFzIEFsZWtuYXZpY2l1cyAobGVr
dHV2KSBtZW50aW9uLiAoTGF1bmNocGFkICMxNzMpDQo9PT5BZnRlciBydW5uaW5nIHRoZSBhYm92
ZSBjb21tYW5kcyBzb3VuZCBhbmQgbWljIHdvcmtzIG9uIGJvdGggYnVpbHQtaW4gYW5kIGhlYWRz
ZXQgd2l0aCAyLjVtbSBjb25uZWN0b3IuIFRoZSBtb2RlbCBpcyBVWDUzM0ZUQy4NCg0KSW50ZXJu
YWwgTWljIHdhcyB3b3JrZWQuDQoNCkthaWxhbmcuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gU2Vu
dDogV2VkbmVzZGF5LCBKdW5lIDI0LCAyMDIwIDk6MTkgUE0NCj4gVG86IEthaWxhbmcgPGthaWxh
bmdAcmVhbHRlay5jb20+OyBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+DQo+IENjOiBjIDxr
YWkuaGVuZy5mZW5nQGNhbm9uaWNhbC5jb20+OyBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7
DQo+IG51bm8uZGlhc0BnbWFpbC5jb20NCj4gU3ViamVjdDogUmU6IEZpeGluZyBzb3VuZCBvbiBB
c3VzIFVYNTM0RiAvIHNvbWUgVVg1MzMgbW9kZWxzDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDYvMjMv
MjAgMTI6MDIgUE0sIEhhbnMgZGUgR29lZGUgd3JvdGU6DQo+ID4gSGksDQo+ID4NCj4gPiBPbiA2
LzQvMjAgODo0OSBBTSwgS2FpbGFuZyB3cm90ZToNCj4gPj4gSGkgSGFucyBkZSBHb2VkZSwNCj4g
Pj4NCj4gPj4gUGxlYXNlIHRlc3QgYmVsb3cuDQo+ID4+DQo+ID4+IGhkYS12ZXJiIC9kZXYvc25k
L2h3QzBEMCAweDIwIDB4NTAwIDB4ZiBoZGEtdmVyYiAvZGV2L3NuZC9od0MwRDANCj4gMHgyMA0K
PiA+PiAweDQwMCAweDc3NzQgaGRhLXZlcmIgL2Rldi9zbmQvaHdDMEQwIDB4MjAgMHg1MDAgMHg0
NSBoZGEtdmVyYg0KPiA+PiAvZGV2L3NuZC9od0MwRDAgMHgyMCAweDQwMCAweDUyODkNCj4gPj4N
Cj4gPj4gSSB0aGluayBIZWFkc2V0IE1pYyB3aWxsIHdvcmsuDQo+ID4NCj4gPiBUaGFuayB5b3Us
IGFuZCBzb3JyeSBmb3IgYmVpbmcgc29tZXdoYXQgc2xvdyB0byByZXNwb25kLg0KPiA+DQo+ID4g
SSBkbyBub3QgaGF2ZSBhY2Nlc3MgdG8gdGhlIGFmZmVjdGVkIGhhcmR3YXJlIG15c2VsZi4NCj4g
Pg0KPiA+IEkndmUgYXNrZWQgdXNlcnMgd2hvIGhhdmUgcmVwb3J0ZWQgYnVncyBhYm91dCB0aGlz
IHRvIHRlc3QgdGhlc2UNCj4gPiBzZXR0aW5nIGFuZCByZXBvcnQgYmFjayBpbiB0aGUgZm9sbG93
aW5nIGJ1Zy1yZXBvcnRzOg0KPiA+DQo+ID4gaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvdWJ1
bnR1Lytzb3VyY2UvbGludXgvK2J1Zy8xODUwNDM5DQo+ID4gaHR0cHM6Ly9idWd6aWxsYS5rZXJu
ZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDYyODkNCj4gPiBodHRwczovL2J1Z3ppbGxhLnJlZGhh
dC5jb20vc2hvd19idWcuY2dpP2lkPTE4MzQ3NTENCj4gPg0KPiA+IEkgd2lsbCBmb2xsb3ctdXAg
d2hlbiBJIGhhdmUgaGVhcmQgYmFjayBmcm9tIHRoZSBidWctcmVwb3J0ZXJzLg0KPiANCj4gT2ss
IEkndmUgZ290dGVuIHRoZSBmaXJzdCBmZWVkYmFjay4gSSB2ZSBhc2tlZCB0aGUgdXNlcnMgdG8g
dGVzdCB0aGUgZm9sbG93aW5nDQo+IGFmdGVyIHJ1bm5pbmcgdGhlIDQgc3VnZ2VzdGVkIGhkYS12
ZXJiIGNvbW1hbmRzOg0KPiANCj4gMS4gU3BlYWtlcnMNCj4gMi4gSGVhZHBob25lcyBvdXRwdXQN
Cj4gMy4gSW50ZXJuYWwgbWljLg0KPiA0LiBIZWFkc2V0IG1pYy4gKHVzaW5nIGEgcGhvbmUgaGVh
ZHNldCB3aXRoIGJ1aWx0aW4gbWljIHdpdGggYSBzaW5nbGUgVC1SLVItUw0KPiBjb25uZWN0b3Ip
DQo+IA0KPiBJJ3ZlIGdvdCBmZWVkYmFjayBmcm9tIGEgdXNlciB3aXRoIGEgVVg1MzNGVEMtQTgy
MjFSIGxhcHRvcDoNCj4gDQo+IDEuIFNwZWFrZXJzOiB3b3Jrcw0KPiAyLiBIZWFkcGhvbmVzIG91
dHB1dDogd29ya3MNCj4gMy4gSW50ZXJuYWwgbWljOiBkb2Vzbid0IHdvcmsNCj4gNC4gSGVhZHNl
dCBtaWM6IHdvcmtzDQo+IA0KPiBTbyB0aGluZ3MgYXJlIGxvb2tpbmcgb2ssIGJ1dCB3ZSBzdGls
bCBoYXZlIHNvbWUgd29yayB0byBkbyB0byBnZXQgdGhlIGludGVybmFsDQo+IG1pYyB0byB3b3Jr
Lg0KPiANCj4gS2FpbGFuZyBkbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnMgZm9yIGdldHRpbmcg
dGhlIGludGVybmFsIG1pYyB0byB3b3JrPw0KPiANCj4gUmVnYXJkcywNCj4gDQo+IEhhbnMNCj4g
DQo+IA0KPiANCj4gDQo+IA0KPiANCj4gPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4+PiBGcm9tOiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+DQo+ID4+PiBTZW50OiBUdWVz
ZGF5LCBKdW5lIDIsIDIwMjAgODo0MiBQTQ0KPiA+Pj4gVG86IEhhbnMgZGUgR29lZGUgPGhkZWdv
ZWRlQHJlZGhhdC5jb20+DQo+ID4+PiBDYzogS2FpbGFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT47
IGMgPGthaS5oZW5nLmZlbmdAY2Fub25pY2FsLmNvbT47DQo+ID4+PiBhbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmc7IG51bm8uZGlhc0BnbWFpbC5jb20NCj4gPj4+IFN1YmplY3Q6IFJlOiBGaXhp
bmcgc291bmQgb24gQXN1cyBVWDUzNEYgLyBzb21lIFVYNTMzIG1vZGVscw0KPiA+Pj4NCj4gPj4+
IE9uIFR1ZSwgMDIgSnVuIDIwMjAgMTE6NTE6NDkgKzAyMDAsDQo+ID4+PiBIYW5zIGRlIEdvZWRl
IHdyb3RlOg0KPiA+Pj4+DQo+ID4+Pj4gSGkgS2FpLUhlbmcgRmVuZywgVGFrYXNoaSwNCj4gPj4+
Pg0KPiA+Pj4+IEkgc2VlIHRoYXQgeW91IGFyZSBvbiB0aGUgbm90aWZpY2F0aW9uIGxpc3QgZm9y
IHRoaXMgYnVnOg0KPiA+Pj4+IGh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L3VidW50dS8rc291
cmNlL2xpbnV4LytidWcvMTg1MDQzOQ0KPiA+Pj4+DQo+ID4+Pj4gU28geW91IG1heSBoYXZlIGFs
cmVhZHkgc2VlbiB0aGlzLiBTb21lIG93bmVycyBvZiBhZmZlY3RlZCBsYXB0b3BzDQo+ID4+Pj4g
KHdoaWNoIGhhdmUgbm9uIHdvcmtpbmcgc3BlYWtlcnMgLyBoZWFkcGhvbmUgb3V0cHV0IGF0bSks
IGhhdmUgZG9uZQ0KPiA+Pj4+IHNvbWUgaGVyb2ljIGRlYnVnZ2luZyB3b3JrIGFuZCBjb21lIHVw
IHdpdGggYSBzZXQgb2YNCj4gPj4+PiAyIGhkYS12ZXJiIGNvbW1hbmRzIHdoaWNoIGZpeCB0aGlz
Lg0KPiA+Pj4+DQo+ID4+Pj4gSSdtIG5vdCBhbGwgdGhhdCBmYW1pbGlhciB3aXRoIHdyaXRpbmcg
aGRhIHF1aXJrcywgc28gSSB3YXMgaG9waW5nDQo+ID4+Pj4gdGhhdCBvbmUgb2YgeW91IDIgY2Fu
IGNvbWUgdXAgd2l0aCBhIHBhdGNoIHRvIGZpeCB0aGlzIGF0IHRoZQ0KPiA+Pj4+IGtlcm5lbCBs
ZXZlbC4NCj4gPj4+Pg0KPiA+Pj4+IFRoaXMgd291bGQgYWxzbyByZXNvbHZlIHRoZXNlIDIgYnVn
cywgd2hpY2ggSSBiZWxpZXZlIGFyZSB0aGUgc2FtZQ0KPiA+Pj4+IGJ1Zw0KPiA+Pj4+IHJlYWxs
eToNCj4gPj4+Pg0KPiA+Pj4+IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5j
Z2k/aWQ9MjA2Mjg5DQo+ID4+Pj4gaHR0cHM6Ly9idWd6aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVn
LmNnaT9pZD0xODM0NzUxDQo+ID4+Pg0KPiA+Pj4gQWRkaW5nIHZlcmJzIGFyZSB0cml2aWFsIGFu
ZCBpdCBjYW4gYmUgZG9uZSBldmVuIHdpdGhvdXQgcGF0Y2hpbmcNCj4gPj4+IGtlcm5lbCBidXQg
cHJvdmlkaW5nIGJ5IGEgcGF0Y2ggdmlhIHBhdGNoIG1vZHVsZSBvcHRpb24gb2Ygc25kLWhkYS1p
bnRlbA0KPiBkcml2ZXIuDQo+ID4+Pg0KPiA+Pj4gQnV0LCBiZWZvcmUgbW92aW5nIGZvcndhcmQs
IEknZCBsaWtlIHRvIGNvbmZpcm0gYWJvdXQgdGhlDQo+ID4+PiBjb3JyZWN0bmVzcyAoYW5kIHRo
ZQ0KPiA+Pj4gc2FmZW5lc3MpIG9mIHRob3NlIHZlcmJzLg0KPiA+Pj4NCj4gPj4+IEthaWxhbmcs
IGNvdWxkIHlvdSBjaGVjayB0aGUgQ09FRiB2ZXJicyBtZW50aW9uZWQgaW4gdGhlIGJ1ZyBlbnRy
eQ0KPiBhYm92ZT8NCj4gPj4+DQo+ID4+Pg0KPiA+Pj4gdGhhbmtzLA0KPiA+Pj4NCj4gPj4+IFRh
a2FzaGkNCj4gPj4+DQo+ID4+PiAtLS0tLS1QbGVhc2UgY29uc2lkZXIgdGhlIGVudmlyb25tZW50
IGJlZm9yZSBwcmludGluZyB0aGlzIGUtbWFpbC4NCj4gPj4NCg0K
