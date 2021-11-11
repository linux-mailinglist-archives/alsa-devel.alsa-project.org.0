Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE4644D531
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Nov 2021 11:41:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 851BC1662;
	Thu, 11 Nov 2021 11:40:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 851BC1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636627298;
	bh=VsajtJ+hQ5239gNSzSQ4wUEtEAEXwPtn693JeVo4Ko4=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=TtCwWh9my8jj00olWD7OCbYUkVgEhW4W0Y1rrE26IJesAFAJ8eHB5jySrC75tKiIH
	 bs5824zO2As9pTlb3YZNacTEdNPz2b5lGjIdjZYOzI6GjexOjptJgAVDBOY+Zr/dBF
	 AU3beUe3MnLfvHJ6MFv9VQqX17mTZogHuCF9cf+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D614CF80086;
	Thu, 11 Nov 2021 11:40:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF2D4F802D2; Thu, 11 Nov 2021 11:40:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68E37F80054
 for <alsa-devel@alsa-project.org>; Thu, 11 Nov 2021 11:40:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68E37F80054
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1ABAe2Dm9032315,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36504.realtek.com.tw[172.21.6.27])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 1ABAe2Dm9032315
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 11 Nov 2021 18:40:02 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36504.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 18:40:01 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 11 Nov 2021 05:40:01 -0500
Received: from RTEXMBS01.realtek.com.tw ([fe80::301d:c3e3:433e:d34e]) by
 RTEXMBS01.realtek.com.tw ([fe80::301d:c3e3:433e:d34e%5]) with mapi id
 15.01.2308.015; Thu, 11 Nov 2021 05:40:01 -0500
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: Jaroslav Kysela <perex@perex.cz>, "broonie@kernel.org"
 <broonie@kernel.org>, "tiwai@suse.de" <tiwai@suse.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Subject: RE: [PATCH] ALSA: usb-audio: add the profile name of Dell desktop
Thread-Topic: [PATCH] ALSA: usb-audio: add the profile name of Dell desktop
Thread-Index: AQHX1t01ldBW7dWZzEeTxd7L+bgC+6v+ZNgAgAAFvwD//6xucIAAB5TA
Date: Thu, 11 Nov 2021 10:40:01 +0000
Message-ID: <7be27e54d3ce41b2ade3e062c939ece2@realtek.com>
References: <20211111091914.20917-1-shumingf@realtek.com>
 <7e82a4cd-ed51-e853-7338-eb570c88cb68@perex.cz>
 <3654e59d-52bd-5442-39d1-f017f5a14b2b@perex.cz> 
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.209]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzExLzExIOS4iuWNiCAwOToxMzowMA==?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36504.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 11/11/2021 10:23:35
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 167202 [Nov 11 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: shumingf@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 465 465 eb31509370142567679dd183ac984a0cb2ee3296
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 127.0.0.199:7.1.2; realtek.com:7.1.1; github.com:7.1.1
X-KSE-AntiSpam-Info: {Track_Chinese_Simplified, from}
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/11/2021 10:25:00
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, Hui Wang <hui.wang@canonical.com>,
 =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Yijun.Shen@dell.com" <Yijun.Shen@dell.com>,
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

SGkgSmFyb3NsYXYsDQoNCj4gPiA+PiBBZGQgdGhlIHByb2ZpbGUgbmFtZSB0byBsZXQgdXNlcnNw
YWNlIHBpY2sgY29ycmVjdCBVQ00gcHJvZmlsZQ0KPiA+ID4NCj4gPiA+IEl0J3Mgbm8gbG9uZ2Vy
IG5lY2Vzc2FyeSB0byBmb3JjZSB0aGUgY2FyZCBuYW1lcyBpbiB0aGUgZHJpdmVycy4gVUNNDQo+
ID4gPiBjYW4gbWF0Y2ggdGhlIFVTQiB2ZW5kb3IgLyBkZXZpY2UgSURzIGZyb20gdGhlICdjb21w
b25lbnRzJyBzdHJpbmcsIHRvby4NCj4gPiA+DQo+ID4gPiBJIHRoaW5rIHRoYXQgd2Ugc2hvdWxk
IGFiYW5kb24gdGhpcyB3YXkgb2YgdGhlIFVDTSBjb25maWd1cmF0aW9uDQo+ID4gPiBzZWxlY3Rp
b24gZm9yIG5ldyBkZXZpY2VzIHdpdGggZGV2aWNlIElEcy4gVGhlIGtlcm5lbCBhbHJlYWR5DQo+
ID4gPiBleHBvcnRzIG5lY2Vzc2FyeSBpbmZvcm1hdGlvbiB0byBzZWxlY3QgdGhlIHJpZ2h0IFVD
TSBjb25maWd1cmF0aW9uDQo+ID4gPiBpbiB0aGUgdXNlcg0KPiA+IHNwYWNlLg0KPiA+DQo+ID4g
VW50ZXN0ZWQgZXhhbXBsZToNCj4gPg0KPiA+DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9wZXJleGcv
YWxzYS11Y20tY29uZi9jb21taXQvNzRjZWQ2NTQ0MGI1MDExYmJlYzE2ODANCj4gPiBiMjgwNGM4
YTljODJiNTE1Mg0KPiA+DQo+ID4gCQkJCQlKYXJvc2xhdg0KPiANCj4gVGhhbmtzIGEgbG90LiBJ
IHdpbGwgdGFrZSB5b3VyIGV4YW1wbGUgdG8gdGVzdC4NCg0KSSBoYWQgdGVzdGVkIHdpdGggVVNC
LUF1ZGlvLmNvbmYgdGhhdCB0aGUgc3lzdGVtIHNlZW1zIG5vdCB0byBhcHBseSB0aGUgVUNNIGNv
bmZpZy4NCg0KVGhlIHJlbGF0ZWQgaW5mbyBvZiB0aGUgdGVzdCBtYWNoaW5lIHNob3dzIGJlbG93
Lg0Kcm9vdEBMYXRpdHVkZS01NDEwOi91c3Ivc2hhcmUvYWxzYS91Y20yL1VTQi1BdWRpbyMgY2F0
IC9wcm9jL2Fzb3VuZC9jYXJkcw0KIDAgW1BDSCAgICAgICAgICAgIF06IEhEQS1JbnRlbCAtIEhE
QSBJbnRlbCBQQ0gNCiAgICAgICAgICAgICAgICAgICAgICBIREEgSW50ZWwgUENIIGF0IDB4Y2Mz
MzgwMDAgaXJxIDE1Mw0KIDEgW1JlYXIgICAgICAgICAgIF06IFVTQi1BdWRpbyAtIFVTQiBhdWRp
byBSZWFyDQogICAgICAgICAgICAgICAgICAgICAgR2VuZXJpYyBVU0IgYXVkaW8gUmVhciBhdCB1
c2ItMDAwMDowMDoxNC4wLTIuMiwgaGlnaCBzcGVlZA0KIDIgW0ZST05UICAgICAgICAgIF06IFVT
Qi1BdWRpbyAtIFVTQiBhdWRpbyBGUk9OVA0KICAgICAgICAgICAgICAgICAgICAgIEdlbmVyaWMg
VVNCIGF1ZGlvIEZST05UIGF0IHVzYi0wMDAwOjAwOjE0LjAtMi4xLCBoaWdoIHNwZWVkDQoNCnJv
b3RATGF0aXR1ZGUtNTQxMDovdXNyL3NoYXJlL2Fsc2EvdWNtMi9VU0ItQXVkaW8jIGFsc2F1Y20g
LS12ZXJzaW9uDQphbHNhdWNtOiB2ZXJzaW9uIDEuMi4yDQoNCnJvb3RATGF0aXR1ZGUtNTQxMDov
dXNyL3NoYXJlL2Fsc2EvdWNtMi9VU0ItQXVkaW8jIGxzdXNiDQpCdXMgMDA0IERldmljZSAwMDE6
IElEIDFkNmI6MDAwMyBMaW51eCBGb3VuZGF0aW9uIDMuMCByb290IGh1Yg0KQnVzIDAwMyBEZXZp
Y2UgMDAxOiBJRCAxZDZiOjAwMDIgTGludXggRm91bmRhdGlvbiAyLjAgcm9vdCBodWINCkJ1cyAw
MDIgRGV2aWNlIDAwMjogSUQgODU2NDo0MDAwIFRyYW5zY2VuZCBJbmZvcm1hdGlvbiwgSW5jLiBS
REY4DQpCdXMgMDAyIERldmljZSAwMDE6IElEIDFkNmI6MDAwMyBMaW51eCBGb3VuZGF0aW9uIDMu
MCByb290IGh1Yg0KQnVzIDAwMSBEZXZpY2UgMDAzOiBJRCAwYTVjOjU4NDIgQnJvYWRjb20gQ29y
cC4gNTgyMDANCkJ1cyAwMDEgRGV2aWNlIDAwMjogSUQgMGJkYTo1NTMyIFJlYWx0ZWsgU2VtaWNv
bmR1Y3RvciBDb3JwLiBJbnRlZ3JhdGVkX1dlYmNhbV9IRA0KQnVzIDAwMSBEZXZpY2UgMDA4OiBJ
RCAwNGYzOjAyMzUgRWxhbiBNaWNyb2VsZWN0cm9uaWNzIENvcnAuIE9wdGljYWwgTW91c2UNCkJ1
cyAwMDEgRGV2aWNlIDAwNzogSUQgMWM0ZjowMDAyIFNpR21hIE1pY3JvIEtleWJvYXJkIFRSQUNF
UiBHYW1tYSBJdm9yeQ0KQnVzIDAwMSBEZXZpY2UgMDA2OiBJRCAwYmRhOjRjNTUgUmVhbHRlayBT
ZW1pY29uZHVjdG9yIENvcnAuIFVTQjIuMCBIdWINCkJ1cyAwMDEgRGV2aWNlIDAwOTogSUQgMGJk
YTo0YzU0IFJlYWx0ZWsgU2VtaWNvbmR1Y3RvciBDb3JwLg0KDQpNYXkgSSBhc2sgeW91IHRvIGdp
dmUgbWUgc29tZSBzdWdnZXN0aW9ucz8NCg0KDQo=
