Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA5977C933
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 10:14:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95D3B3E8;
	Tue, 15 Aug 2023 10:13:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95D3B3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692087242;
	bh=LyJzanHJ31sHnRqk+wcoDSBA+HHbeDd+mdiKqMbxfdA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oHzRUl16zsbm9ubzL6y5C+x51qjZtmczzJTOfRkstdfWre1jYFXD0GwUXV4LRAPkI
	 S74PChGAY8aRge+tP+QMFe4bZeMtXxata6u4TPbatvGSuVmv7zdfXevhrWpUr7lf6R
	 ek5g+Iq16K48rOBy/3z+wPNKMhevhMe8WrwuLgDo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4D35F801EB; Tue, 15 Aug 2023 10:13:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F50FF801EB;
	Tue, 15 Aug 2023 10:13:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9F19F80254; Tue, 15 Aug 2023 10:10:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BF8CF800EE
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 10:09:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BF8CF800EE
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 37F88bUU2022805,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 37F88bUU2022805
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Aug 2023 16:08:37 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Tue, 15 Aug 2023 16:08:48 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 15 Aug 2023 16:08:48 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b]) by
 RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b%5]) with mapi id
 15.01.2375.007; Tue, 15 Aug 2023 16:08:48 +0800
From: Kailang <kailang@realtek.com>
To: "Joseph C. Sible" <josephcsible@gmail.com>, Takashi Iwai <tiwai@suse.de>
CC: Bagas Sanjaya <bagasdotme@gmail.com>,
        "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>,
        "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>
Subject: RE: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
Thread-Topic: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
Thread-Index: 
 AQHZhdSOD7kY6mXBDkGA3ryhp811r69Yu5SAgAASNACAAA22gIAA7n+AgAEJrYCABLe/YIAJNIWAgAIHAcD//4tyAIAB8UZw///vxgCADzWhgIABfgWAgACUPoCAAPnsAIAAmlKwgAA8s4CAAQ8boP//kIuAABWnYVAAAIR9gAAqhW/A//+7roD//3k98IAAkYyAgAAKhQCAAAZZgIAAiY6AgADw04CAALC0AIAA6TqAgBQJp4CAAhpFAP/xaKKggBysdYD/8VrnoAO7qooA//9fxND//w9ZgP/iuwIA/79IlID/bS7yQA==
Date: Tue, 15 Aug 2023 08:08:48 +0000
Message-ID: <01e212a538fc407ca6edd10b81ff7b05@realtek.com>
References: <87o7jshxch.wl-tiwai@suse.de>
 <CABpewhEG9ViuoCwZHmTN0Up-3jwZ1M-jfC+dAqo0zhqLOZtQ6g@mail.gmail.com>
In-Reply-To: 
 <CABpewhEG9ViuoCwZHmTN0Up-3jwZ1M-jfC+dAqo0zhqLOZtQ6g@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXDAG01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_01e212a538fc407ca6edd10b81ff7b05realtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: 6Z3B5NV2FX73HNR7GCQBJT3Y5STULBGG
X-Message-ID-Hash: 6Z3B5NV2FX73HNR7GCQBJT3Y5STULBGG
X-MailFrom: kailang@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6Z3B5NV2FX73HNR7GCQBJT3Y5STULBGG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_01e212a538fc407ca6edd10b81ff7b05realtekcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgVGFrYXNoaSwNCg0KSSB0aGluayBtYXliZSBhdHRhY2ggcGF0Y2ggaXMgd2hhdCB5b3Ugd2Fu
dC4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb3NlcGggQy4gU2li
bGUgPGpvc2VwaGNzaWJsZUBnbWFpbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDQsIDIw
MjMgMTA6MzUgUE0NCj4gVG86IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4NCj4gQ2M6IEth
aWxhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+OyBCYWdhcyBTYW5qYXlhIDxiYWdhc2RvdG1lQGdt
YWlsLmNvbT47DQo+IHJlZ3Jlc3Npb25zQGxpc3RzLmxpbnV4LmRldjsgcGVyZXhAcGVyZXguY3o7
IHRpd2FpQHN1c2UuY29tOw0KPiBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcNCj4gU3ViamVj
dDogUmU6IEZ3ZDogW0J1ZyAyMTc0NDBdIE5ldzogQUxDMjM2IGF1ZGlvIGRpc2FwcGVhcnMgZnJv
bSBIUA0KPiAxNXotZmMwMDAgb24gd2FybSBib290DQo+IA0KPiANCj4gRXh0ZXJuYWwgbWFpbC4N
Cj4gDQo+IA0KPiANCj4gT24gTW9uLCBKdWwgMzEsIDIwMjMgYXQgMTI6MTTigK9QTSBUYWthc2hp
IEl3YWkgPHRpd2FpQHN1c2UuZGU+IHdyb3RlOg0KPiA+DQo+ID4gLi4uIGFuZCBub3cgd2UgcmVj
ZWl2ZSBhIHJlZ3Jlc3Npb24gcmVwb3J0IGR1ZSB0byB0aGlzIGNoYW5nZSA6LTwNCj4gPiAgIGh0
dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE3NzMyDQo+ID4NCj4g
PiBJIGJlbGlldmUgdGhlIHByb2JsZW0gaXMgdGhhdCB0aGUgcGF0Y2ggZGlzYWJsZWQgdGhlIDNr
cHVsbC1sb3cNCj4gPiBiZWhhdmlvciB0b28gbXVjaCB3aGlsZSBzb21lIGNvZGVjcyBzdGlsbCBu
ZWVkIGl0Lg0KPiA+DQo+ID4gVGhlIHBhdGNoIGNoYW5nZXMgbGlrZToNCj4gPg0KPiA+IEBAIC0z
NjM4LDggKzM2NDAsNyBAQCBzdGF0aWMgdm9pZCBhbGMyNTZfc2h1dHVwKHN0cnVjdCBoZGFfY29k
ZWMNCj4gKmNvZGVjKQ0KPiA+ICAgICAgICAgLyogSWYgZGlzYWJsZSAzayBwdWxsZG93biBjb250
cm9sIGZvciBhbGMyNTcsIHRoZSBNaWMgZGV0ZWN0aW9uIHdpbGwNCj4gbm90IHdvcmsgY29ycmVj
dGx5DQo+ID4gICAgICAgICAgKiB3aGVuIGJvb3Rpbmcgd2l0aCBoZWFkc2V0IHBsdWdnZWQuIFNv
IHNraXAgc2V0dGluZyBpdCBmb3IgdGhlDQo+IGNvZGVjIGFsYzI1Nw0KPiA+ICAgICAgICAgICov
DQo+ID4gLSAgICAgICBpZiAoY29kZWMtPmNvcmUudmVuZG9yX2lkICE9IDB4MTBlYzAyMzYgJiYN
Cj4gPiAtICAgICAgICAgICBjb2RlYy0+Y29yZS52ZW5kb3JfaWQgIT0gMHgxMGVjMDI1NykNCj4g
PiArICAgICAgIGlmIChzcGVjLT5lbl8za3B1bGxfbG93KQ0KPiA+ICAgICAgICAgICAgICAgICBh
bGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDQ2LCAwLCAzIDw8IDEyKTsNCj4gPg0KPiA+ICAg
ICAgICAgaWYgKCFzcGVjLT5ub19zaHV0dXBfcGlucykNCj4gPg0KPiA+IC4uLiB3aGlsZSB0aGUg
b25seSBwbGFjZSBzZXR0aW5nIHNwZWMtPmVuXzNrcHVsbF9sb3cgaXM6DQo+ID4NCj4gPiBAQCAt
MTA2ODIsNiArMTA2ODMsOCBAQCBzdGF0aWMgaW50IHBhdGNoX2FsYzI2OShzdHJ1Y3QgaGRhX2Nv
ZGVjDQo+ICpjb2RlYykNCj4gPiAgICAgICAgICAgICAgICAgc3BlYy0+c2h1dHVwID0gYWxjMjU2
X3NodXR1cDsNCj4gPiAgICAgICAgICAgICAgICAgc3BlYy0+aW5pdF9ob29rID0gYWxjMjU2X2lu
aXQ7DQo+ID4gICAgICAgICAgICAgICAgIHNwZWMtPmdlbi5taXhlcl9uaWQgPSAwOyAvKiBBTEMy
NTYgZG9lcyBub3QgaGF2ZSBhbnkNCj4gPiBsb29wYmFjayBtaXhlciBwYXRoICovDQo+ID4gKyAg
ICAgICAgICAgICAgIGlmIChjb2RlYy0+YnVzLT5wY2ktPnZlbmRvciA9PSBQQ0lfVkVORE9SX0lE
X0FNRCkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBzcGVjLT5lbl8za3B1bGxfbG93ID0g
dHJ1ZTsNCj4gPiAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gICAgICAgICBjYXNlIDB4MTBl
YzAyNTc6DQo+ID4gICAgICAgICAgICAgICAgIHNwZWMtPmNvZGVjX3ZhcmlhbnQgPSBBTEMyNjlf
VFlQRV9BTEMyNTc7DQo+ID4NCj4gPiBTaW5jZSBzcGVjLT4zbl8za3B1bGxfbG93IGlzIGZhbHNl
IGFzIGRlZmF1bHQsIGl0IG1lYW5zIHRoYXQsIGV4Y2VwdA0KPiA+IGZvciBBTEMyMzAvMjM2LzI1
NiBhbmQgUENJIHZlbmRvciBBTUQsIHRoZSBmbGFnIGlzIG5ldmVyIHNldCwgaGVuY2UNCj4gPiBp
dCdzIG5vIGxvbmdlciBjYWxsZWQuDQo+ID4NCj4gPiBTaG91bGRuJ3Qgc3BlYy0+ZW5fM2twdWxs
X2xvdyBiZSBlbmFibGVkIHJhdGhlciBhcyBkZWZhdWx0PyAgT3Igd2hpY2gNCj4gPiBtb2RlbHMg
Y2FuIHNldCBpdD8NCj4gDQo+IEluIGJvdGggbXkgb3JpZ2luYWwgYnVnIGFuZCB0aGlzIG5ldyBi
dWcsIHRoZSBwcm9ibGVtIHdhcyB0aGF0IHdlJ3JlIG5vdA0KPiBjYWxsaW5nIGl0IHdoZW4gd2Ug
c2hvdWxkIGJlLiBHaXZlbiB0aGF0LCB3b3VsZG4ndCBhIHNpbXBsZSBmaXggYmUgdG8gY2FsbCBp
dCBpZg0KPiBlaXRoZXIgdGhlIG9sZCBjb25kaXRpb24gb3IgdGhlIG5ldyBjb25kaXRpb24gaXMg
dHJ1ZT8NCj4gRS5nLiwgc29tZXRoaW5nIGxpa2UgdGhpczoNCj4gDQo+IGlmICgoY29kZWMtPmNv
cmUudmVuZG9yX2lkICE9IDB4MTBlYzAyMzYgJiYgY29kZWMtPmNvcmUudmVuZG9yX2lkICE9DQo+
IDB4MTBlYzAyNTcpIHx8IHNwZWMtPmVuXzNrcHVsbF9sb3cpDQo+IA0KPiBKb3NlcGggQy4gU2li
bGUNCj4gDQo+IC0tLS0tLVBsZWFzZSBjb25zaWRlciB0aGUgZW52aXJvbm1lbnQgYmVmb3JlIHBy
aW50aW5nIHRoaXMgZS1tYWlsLg0KDQo=

--_002_01e212a538fc407ca6edd10b81ff7b05realtekcom_
Content-Type: application/octet-stream; name="0000-redit-3k-pull-low.patch"
Content-Description: 0000-redit-3k-pull-low.patch
Content-Disposition: attachment; filename="0000-redit-3k-pull-low.patch";
	size=1482; creation-date="Tue, 15 Aug 2023 07:56:18 GMT";
	modification-date="Tue, 15 Aug 2023 08:02:02 GMT"
Content-Transfer-Encoding: base64

RnJvbSAzYTIwYTViMTg5YTMwM2EzOTdkNjQ4MDA4ZTFiODZhNzJkZmY1ZjhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFR1ZSwgMTUgQXVnIDIwMjMgMTU6NTQ6MjMgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIFJlbW9kaWZpZWQgM2sgcHVsbCBsb3cgcHJvY2VkdXJlCgpTZXQgc3Bl
Yy0+ZW5fM2twdWxsX2xvdyBkZWZhdWx0IHRvIHRydWUuClRoZW4gZmlsbGJhY2sgQUxDMjM2IGFu
ZCBBTEMyNTcgdG8gZmFsc2UuCgpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdA
cmVhbHRlay5jb20+CmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBi
L3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4IDNiYjc2ZjhiOTYwNy4uY2M1NWNm
N2Y2NWU1IDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYworKysgYi9z
b3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAtMTA2NTEsNiArMTA2NTEsNyBAQCBzdGF0
aWMgaW50IHBhdGNoX2FsYzI2OShzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAlzcGVjID0gY29k
ZWMtPnNwZWM7CiAJc3BlYy0+Z2VuLnNoYXJlZF9taWNfdnJlZl9waW4gPSAweDE4OwogCWNvZGVj
LT5wb3dlcl9zYXZlX25vZGUgPSAwOworCXNwZWMtPmVuXzNrcHVsbF9sb3cgPSB0cnVlOwogCiAj
aWZkZWYgQ09ORklHX1BNCiAJY29kZWMtPnBhdGNoX29wcy5zdXNwZW5kID0gYWxjMjY5X3N1c3Bl
bmQ7CkBAIC0xMDczMywxNCArMTA3MzQsMTUgQEAgc3RhdGljIGludCBwYXRjaF9hbGMyNjkoc3Ry
dWN0IGhkYV9jb2RlYyAqY29kZWMpCiAJCXNwZWMtPnNodXR1cCA9IGFsYzI1Nl9zaHV0dXA7CiAJ
CXNwZWMtPmluaXRfaG9vayA9IGFsYzI1Nl9pbml0OwogCQlzcGVjLT5nZW4ubWl4ZXJfbmlkID0g
MDsgLyogQUxDMjU2IGRvZXMgbm90IGhhdmUgYW55IGxvb3BiYWNrIG1peGVyIHBhdGggKi8KLQkJ
aWYgKGNvZGVjLT5idXMtPnBjaS0+dmVuZG9yID09IFBDSV9WRU5ET1JfSURfQU1EKQotCQkJc3Bl
Yy0+ZW5fM2twdWxsX2xvdyA9IHRydWU7CisJCWlmIChjb2RlYy0+Y29yZS52ZW5kb3JfaWQgPT0g
MHgxMGVjMDIzNiAmJiBjb2RlYy0+YnVzLT5wY2ktPnZlbmRvciAhPSBQQ0lfVkVORE9SX0lEX0FN
RCkKKwkJCXNwZWMtPmVuXzNrcHVsbF9sb3cgPSBmYWxzZTsKIAkJYnJlYWs7CiAJY2FzZSAweDEw
ZWMwMjU3OgogCQlzcGVjLT5jb2RlY192YXJpYW50ID0gQUxDMjY5X1RZUEVfQUxDMjU3OwogCQlz
cGVjLT5zaHV0dXAgPSBhbGMyNTZfc2h1dHVwOwogCQlzcGVjLT5pbml0X2hvb2sgPSBhbGMyNTZf
aW5pdDsKIAkJc3BlYy0+Z2VuLm1peGVyX25pZCA9IDA7CisJCXNwZWMtPmVuXzNrcHVsbF9sb3cg
PSBmYWxzZTsKIAkJYnJlYWs7CiAJY2FzZSAweDEwZWMwMjE1OgogCWNhc2UgMHgxMGVjMDI0NToK

--_002_01e212a538fc407ca6edd10b81ff7b05realtekcom_--
