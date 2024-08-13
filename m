Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D60AF950AD7
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 18:56:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76A2C23D1;
	Tue, 13 Aug 2024 18:56:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76A2C23D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723568203;
	bh=KW5EfEHSOUxbEYzk6bHnIckMyJmixciHYmxkLH+1xWo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bdrnU2DyxBwl7+oBxwmQs86HYW9XBeCirBBLcrROcJIZRkkNPp7RZxWtLTlE73TbC
	 /poY4AJDCsYsh7qd9qhCGZcOjaxykryUdg0LNvw+IcXXOUZYa5UUzv94DLz5PySU/a
	 q9wB6Qsvu6QIc9ACIS5B/ZVvb29NFSYxFgVLSwas=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F207F805AF; Tue, 13 Aug 2024 18:56:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CC5DF80301;
	Tue, 13 Aug 2024 18:55:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD487F80423; Tue, 13 Aug 2024 18:52:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_FONT_LOW_CONTRAST,
	HTML_MESSAGE,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,TRACKER_ID,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CACDF800BF
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 18:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CACDF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=XyamGKBo
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47DEbwD1097317;
	Tue, 13 Aug 2024 09:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723559878;
	bh=qGg5EmabbSuan3+V8EHo47oJkSHNEhF3ueXhDBO4PCQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=XyamGKBouaijMqd0quaiUFtBSurGENKRLWa6g0VCWv2bzzCUTYVjYDOmka9wsODBd
	 W+pCA/7sInyfOeze3ovf+dUkfB8oYR17MiOi31Y9PFdXmjLjWWVXJVGSHW3XWMk0bm
	 6an/1AbQ2qCMAcx8ZLGxZsNatlZAB9z+FfqCcIuY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47DEbw35067314
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Aug 2024 09:37:58 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 Aug 2024 09:37:58 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Tue, 13 Aug 2024 09:37:58 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>,
        "perex@perex.cz" <perex@perex.cz>,
        "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>,
        "13916275206@139.com"
	<13916275206@139.com>,
        "zhourui@huaqin.com" <zhourui@huaqin.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "Salazar, Ivan"
	<i-salazar@ti.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Chadha, Jasjot Singh" <j-chadha@ti.com>,
        "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
        "Yue, Jaden"
	<jaden-yue@ti.com>,
        "yung-chuan.liao@linux.intel.com"
	<yung-chuan.liao@linux.intel.com>,
        "Rao, Dipa" <dipa@ti.com>, "yuhsuan@google.com" <yuhsuan@google.com>,
        "Lo, Henry" <henry.lo@ti.com>, "tiwai@suse.de" <tiwai@suse.de>,
        "Xu, Baojun" <baojun.xu@ti.com>, "soyer@irl.hu" <soyer@irl.hu>,
        "Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
        "judyhsiao@google.com" <judyhsiao@google.com>,
        "Navada Kanyana, Mukund"
	<navada@ti.com>,
        "cujomalainey@google.com" <cujomalainey@google.com>,
        "Kutty,
 Aanya" <aanya@ti.com>,
        "Mahmud, Nayeem" <nayeem.mahmud@ti.com>,
        "savyasanchi.shukla@netradyne.com" <savyasanchi.shukla@netradyne.com>,
        "flaviopr@microsoft.com" <flaviopr@microsoft.com>,
        "Ji, Jesse"
	<jesse-ji@ti.com>,
        "darren.ye@mediatek.com" <darren.ye@mediatek.com>,
        "antheas.dk@gmail.com" <antheas.dk@gmail.com>,
        "Jerry2.Huang@lcfuturecenter.com" <Jerry2.Huang@lcfuturecenter.com>
Subject: RE: [EXTERNAL] Re: [PATCH] ASoc: tas2781: Rename dai_driver name to
 unify the name between TAS2563 and TAS2781
Thread-Topic: [EXTERNAL] Re: [PATCH] ASoc: tas2781: Rename dai_driver name to
 unify the name between TAS2563 and TAS2781
Thread-Index: AQHa57eQ4W2xJ15Lw0CjiG/WDLBxULIkOeWAgAERohA=
Date: Tue, 13 Aug 2024 14:37:57 +0000
Message-ID: <ee7ff2bd65b54c10813ecee68c34ba78@ti.com>
References: <20240806041719.1477-1-shenghao-ding@ti.com>
 <ZrpCZfuNOdBhRMh4@smile.fi.intel.com>
In-Reply-To: <ZrpCZfuNOdBhRMh4@smile.fi.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.160.152]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Message-ID-Hash: HS2AGVF76IJDTC4DPKDDNC27NTJYRC4D
X-Message-ID-Hash: HS2AGVF76IJDTC4DPKDDNC27NTJYRC4D
X-MailFrom: shenghao-ding@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HS2AGVF76IJDTC4DPKDDNC27NTJYRC4D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgQW5keQ0KQW5zd2VyIGlubGluZQ0KRnJvbTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hl
dmNoZW5rb0BsaW51eC5pbnRlbC5jb20+DQpTZW50OiBUdWVzZGF5LCBBdWd1c3QgMTMsIDIwMjQg
MToxMiBBTQ0KVG86IERpbmcsIFNoZW5naGFvIDxzaGVuZ2hhby1kaW5nQHRpLmNvbT4NCkNjOiBi
cm9vbmllQGtlcm5lbC5vcmc7IGxnaXJkd29vZEBnbWFpbC5jb207IHBlcmV4QHBlcmV4LmN6OyBw
aWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb207IDEzOTE2Mjc1MjA2QDEzOS5jb207
IHpob3VydWlAaHVhcWluLmNvbTsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnOyBTYWxhemFy
LCBJdmFuIDxpLXNhbGF6YXJAdGkuY29tPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsg
Q2hhZGhhLCBKYXNqb3QgU2luZ2ggPGotY2hhZGhhQHRpLmNvbT47IGxpYW0uci5naXJkd29vZEBp
bnRlbC5jb207IFl1ZSwgSmFkZW4gPGphZGVuLXl1ZUB0aS5jb20+OyB5dW5nLWNodWFuLmxpYW9A
bGludXguaW50ZWwuY29tOyBSYW8sIERpcGEgPGRpcGFAdGkuY29tPjsgeXVoc3VhbkBnb29nbGUu
Y29tOyBMbywgSGVucnkgPGhlbnJ5LmxvQHRpLmNvbT47IHRpd2FpQHN1c2UuZGU7IFh1LCBCYW9q
dW4gPGJhb2p1bi54dUB0aS5jb20+OyBzb3llckBpcmwuaHU7IEJhb2p1bi5YdUBmcHQuY29tOyBq
dWR5aHNpYW9AZ29vZ2xlLmNvbTsgTmF2YWRhIEthbnlhbmEsIE11a3VuZCA8bmF2YWRhQHRpLmNv
bT47IGN1am9tYWxhaW5leUBnb29nbGUuY29tOyBLdXR0eSwgQWFueWEgPGFhbnlhQHRpLmNvbT47
IE1haG11ZCwgTmF5ZWVtIDxuYXllZW0ubWFobXVkQHRpLmNvbT47IHNhdnlhc2FuY2hpLnNodWts
YUBuZXRyYWR5bmUuY29tOyBmbGF2aW9wckBtaWNyb3NvZnQuY29tOyBKaSwgSmVzc2UgPGplc3Nl
LWppQHRpLmNvbT47IGRhcnJlbi55ZUBtZWRpYXRlay5jb207IGFudGhlYXMuZGtAZ21haWwuY29t
OyBKZXJyeTIuSHVhbmdAbGNmdXR1cmVjZW50ZXIuY29tDQpTdWJqZWN0OiBbRVhURVJOQUxdIFJl
OiBbUEFUQ0hdIEFTb2M6IHRhczI3ODE6IFJlbmFtZSBkYWlfZHJpdmVyIG5hbWUgdG8gdW5pZnkg
dGhlIG5hbWUgYmV0d2VlbiBUQVMyNTYzIGFuZCBUQVMyNzgxDQoNCk9uIFR1ZSwgQXVnIDA2LCAy
MDI0IGF0IDEyOuKAijE3OuKAijE3UE0gKzA4MDAsIFNoZW5naGFvIERpbmcgd3JvdGU6ID4gUmVu
YW1lIGRhaV9kcml2ZXIgbmFtZSB0byB1bmlmeSB0aGUgbmFtZSBiZXR3ZWVuIFRBUzI1NjMgYW5k
ID4gVEFTMjc4MS4gSSBhbSBub3Qgc3VyZSB0aGlzIGlzIGEgZ29vZCBjaGFuZ2UuIFRoZW9yZXRp
Y2FsbHkgb25lIHdpdGggdGhlIHBsYXRmb3JtIHRoYXQgaGFzIGEgY2VydGFpbiBjb2RlYw0KWmpR
Y21RUllGcGZwdEJhbm5lclN0YXJ0DQpUaGlzIG1lc3NhZ2Ugd2FzIHNlbnQgZnJvbSBvdXRzaWRl
IG9mIFRleGFzIEluc3RydW1lbnRzLg0KDQpEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc291cmNlIG9mIHRoaXMgZW1haWwgYW5k
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCg0KICAgIFJlcG9ydCBTdXNwaWNpb3VzICA8aHR0
cHM6Ly91cy1waGlzaGFsYXJtLWV3dC5wcm9vZnBvaW50LmNvbS9FV1QvdjEvRzN2SyF1QmRuVlYt
Qkd5ZlRoY21Pc3BpUGtfNm1ndmlESXBNcFU5bE5hU3RIT2xBbm1sT1J0WWcwS1RuTWhmU1NJNWFj
eDBrazJDYk1ubnNqb1dVLW84VSQ+ICAg4oCMDQoNCg0KDQpaalFjbVFSWUZwZnB0QmFubmVyRW5k
DQoNCk9uIFR1ZSwgQXVnIDA2LCAyMDI0IGF0IDEyOjE3OjE3UE0gKzA4MDAsIFNoZW5naGFvIERp
bmcgd3JvdGU6DQoNCj4gUmVuYW1lIGRhaV9kcml2ZXIgbmFtZSB0byB1bmlmeSB0aGUgbmFtZSBi
ZXR3ZWVuIFRBUzI1NjMgYW5kDQoNCj4gVEFTMjc4MS4NCg0KDQoNCkkgYW0gbm90IHN1cmUgdGhp
cyBpcyBhIGdvb2QgY2hhbmdlLiBUaGVvcmV0aWNhbGx5IG9uZSB3aXRoIHRoZSBwbGF0Zm9ybSB0
aGF0DQoNCmhhcyBhIGNlcnRhaW4gY29kZWMgbWF5IGNvbm5lY3QgdGhlIG90aGVyIG9uZS4gSG93
IHRoYXQgd2lsbCBiZSBkaXN0aW5ndWlzaGVkPw0KDQpbRElOR10gQXMgeW91IGtub3csIHRoaXMg
ZHJpdmVyIGNvZGUgY2FuIHN1cHBvcnQgYm90aCB0YXMyNTYzIGFuZCB0YXMyNzgxLg0KDQpCdXQg
c29tZSB0YXMyNTYzIGN1c3RvbWVycyBmZWVsIGNvbmZ1c2VkIGFuZCB1bmNvbWZvcnRhYmxlLCB3
aGVuIHRoZXkNCg0KZm91bmQgdGhlIGRhaV9kcml2ZXIgbmFtZSBpcyBzdGlsbCB0YXMyNzgxLiBT
bywgdXBkYXRlIHRoZSBuYW1lIGZvciB0aGVtDQoNCg0KDQpJZiB0aGVyZSBpcyBubyBpc3N1ZSBm
b3Igc3VjaCBjb25maWd1cmF0aW9ucywgcGxlYXNlIG1lbnRpb24gdGhpcyBmYWN0IGluIHRoZQ0K
DQpjb21taXQgbWVzc2FnZS4NCg0KW0RJTkddIEFjY2VwdA0KDQotLQ0KDQpXaXRoIEJlc3QgUmVn
YXJkcywNCg0KQW5keSBTaGV2Y2hlbmtvDQoNCg0KDQoNCg==
