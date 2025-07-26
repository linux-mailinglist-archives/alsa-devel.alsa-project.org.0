Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF152B15FCB
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Jul 2025 13:51:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ABE46021C;
	Wed, 30 Jul 2025 13:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ABE46021C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753876269;
	bh=l6TuRz5EzLqeFVgvRZk84SkmxztLVYklXrBbwvkzRAk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T2DGZT3olgc/n89R3LqT7jvXVz9RI1dfkwlqfwU/uLzch0GqGJAueaxoOlGUl3NjE
	 Let/4zT7fgFsSbCB1qGIm8KyDyWqV1wPyOxZjRZn0nOYaYnQkfS6lUFu23VcbvZQng
	 34UuxVGZ0AQYJojx1i73i1EXLdeKySM4/qxxJS/g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6B3CF805C2; Wed, 30 Jul 2025 13:50:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F4CBF805BD;
	Wed, 30 Jul 2025 13:50:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97E4BF8053D; Sat, 26 Jul 2025 13:34:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9909FF800BF
	for <alsa-devel@alsa-project.org>; Sat, 26 Jul 2025 13:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9909FF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=jHNETpN5
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56QBYTIp1912008;
	Sat, 26 Jul 2025 06:34:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753529669;
	bh=l6TuRz5EzLqeFVgvRZk84SkmxztLVYklXrBbwvkzRAk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=jHNETpN5yGHM1rH/FSBAtl2HbNLrJDbJLc+EW/8a/sIrqx5V5W3yf1mJzQpRKdEvl
	 Y23ErP3Q1Ad+zhpaMqyxw/OjGcEztN7GPKzLMG48hUH6GcG1ACKC+q4pCuC9HSGs/h
	 9b0Khdtc5iSkU3UORwGvgWjCiYevWZ5wRM2LVLEU=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56QBYS6R3880166
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 26 Jul 2025 06:34:29 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 26
 Jul 2025 06:34:28 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
 DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
 15.01.2507.055; Sat, 26 Jul 2025 06:34:28 -0500
From: "Xu, Baojun" <baojun.xu@ti.com>
To: Takashi Iwai <tiwai@suse.de>
CC: "broonie@kernel.org" <broonie@kernel.org>,
        "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "Ding, Shenghao"
	<shenghao-ding@ti.com>,
        "13916275206@139.com" <13916275206@139.com>,
        "P O,
 Vijeth" <v-po@ti.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [EXTERNAL] Re: [PATCH v2] ALSA: hda: Add TAS2770 support
Thread-Topic: [EXTERNAL] Re: [PATCH v2] ALSA: hda: Add TAS2770 support
Thread-Index: AQHb+92VnCyYVy56v0qMsWwwberg3LRAG64AgAQtmUE=
Date: Sat, 26 Jul 2025 11:34:28 +0000
Message-ID: <cc99c78e042b47cca92f4a3050f36a9c@ti.com>
References: 
 <20250723142423.38768-1-baojun.xu@ti.com>,<87bjpbm0lj.wl-tiwai@suse.de>
In-Reply-To: <87bjpbm0lj.wl-tiwai@suse.de>
Accept-Language: en-GB, zh-CN, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.165.138]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WWBPKDUR7N44LXVHJ7VG2C22FJUAOI34
X-Message-ID-Hash: WWBPKDUR7N44LXVHJ7VG2C22FJUAOI34
X-Mailman-Approved-At: Wed, 30 Jul 2025 11:50:21 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WWBPKDUR7N44LXVHJ7VG2C22FJUAOI34/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBGcm9tOiBU
YWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+DQo+IFNlbnQ6IDIzIEp1bHkgMjAyNSAyMjo0MA0K
PiBUbzogWHUsIEJhb2p1bg0KPiBDYzogYnJvb25pZUBrZXJuZWwub3JnOyBhbmRyaXkuc2hldmNo
ZW5rb0BsaW51eC5pbnRlbC5jb207IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgRGluZywg
U2hlbmdoYW87IDEzOTE2Mjc1MjA2QDEzOS5jb207IFAgTywgVmlqZXRoOyBsaW51eC1zb3VuZEB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDog
W0VYVEVSTkFMXSBSZTogW1BBVENIIHYyXSBBTFNBOiBoZGE6IEFkZCBUQVMyNzcwIHN1cHBvcnQN
Cj4gDQo+IE9uIFdlZCwgMjMgSnVsIDIwMjUgMTY64oCKMjQ64oCKMjMgKzAyMDAsIEJhb2p1biBY
dSB3cm90ZTogPiA+IEFkZCBUQVMyNzcwIHN1cHBvcnQgaW4gVEkncyBIREEgZHJpdmVyLiBBbmQg
YWRkIGhkYV9jaGlwX2lkIGZvciA+IG1vcmUgcHJvZHVjdHMuIERpc3Rpbmd1aXNoIERTUCBhbmQg
bm9uLURTUCBpbiBmaXJtd2FyZSA+IGxvYWRpbmcgZnVuY3Rpb24uID4gPiBTaWduZWQtb2ZmLWJ5
OiBCYW9qdW4NCj4gWmpRY21RUllGcGZwdEJhbm5lclN0YXJ0DQo+IFRoaXMgbWVzc2FnZSB3YXMg
c2VudCBmcm9tIG91dHNpZGUgb2YgVGV4YXMgSW5zdHJ1bWVudHMuDQo+IERvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzb3VyY2Ug
b2YgdGhpcyBlbWFpbCBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiA8aHR0cHM6Ly91
cy1waGlzaGFsYXJtLWV3dC5wcm9vZnBvaW50LmNvbS9FV1QvdjEvRzN2SyF2eGRySGYzRVBtZFFp
ZzN2Znh0b1gwZ2EtWlcyZ3JiNHBKLTkweEVhb20tblZzSFQ4eEhZM0Qybks4djVtZFdsRXcwdDNR
JD4NCj4gUmVwb3J0IFN1c3BpY2lvdXMNCj4gDQo+IFpqUWNtUVJZRnBmcHRCYW5uZXJFbmQNCj4g
DQo+IE9uIFdlZCwgMjMgSnVsIDIwMjUgMTY6MjQ6MjMgKzAyMDAsDQo+IEJhb2p1biBYdSB3cm90
ZToNCj4gPg0KPiA+IEFkZCBUQVMyNzcwIHN1cHBvcnQgaW4gVEkncyBIREEgZHJpdmVyLiBBbmQg
YWRkIGhkYV9jaGlwX2lkIGZvcg0KPiA+IG1vcmUgcHJvZHVjdHMuIERpc3Rpbmd1aXNoIERTUCBh
bmQgbm9uLURTUCBpbiBmaXJtd2FyZQ0KPiA+IGxvYWRpbmcgZnVuY3Rpb24uDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBCYW9qdW4gWHUgPGJhb2p1bi54dUB0aS5jb20+DQo+IA0KPiBBcHBsaWVk
IG5vdywgdGhhbmtzLg0KPiANCj4gDQo+IEJUVywgaXMgaW5jbHVkZS9zb3VuZC90YXMyNzcwLXRs
di5oIHVzZWQgYnkgYW55IG90aGVyIGRyaXZlcj8NCj4gKEFsc28gaW5jbHVkZS9zb3VuZC90YXMy
NzgxLXRsdi5oKS4NCj4gDQo+IElmIHRob3NlIGFyZSB1c2VkIG9ubHkgYnkgdGFzMjc4MS1oZGEt
aTJzL3NwaSBkcml2ZXJzLCB0aGUgZmlsZXMgY2FuDQo+IGJlIG1vdmVkIHRvIHNvdW5kL2hkYS9j
b2RlY3Mvc2lkZS1jb2RlY3MgYXMgbG9jYWwgaGVhZGVycy4NCj4gDQo+IEluIGdlbmVyYWwsIGlu
Y2x1ZGUvc291bmQgaXMgcmF0aGVyIGZvciBwdWJsaWMgaGVhZGVycyB0aGF0IGFyZSByZWFkDQo+
IGJ5IG11bHRpcGxlIGRyaXZlcnMgaW4gZGlmZmVyZW50IHBsYWNlcy4NCg0KVGhhbmtzIGZvciB0
aGUgYXBwbHkhDQpZZXMsIGluY2x1ZGUvc291bmQvdGFzeHh4eC10bHYuaCB3aWxsIGFsc28gYmUg
dXNlZCBieSBvdGhlciBkcml2ZXJzDQooZm9yIGV4YW1wbGUsIHNvdW5kL3NvYy9jb2RlY3MvdGFz
Mnh4eC1pMmMuYykNCg0KPiANCj4gDQo+IHRoYW5rcywNCj4gDQo+IFRha2FzaGkNCj4gDQoNCkJl
c3QgUmVnYXJkcw0KSmltDQo=
