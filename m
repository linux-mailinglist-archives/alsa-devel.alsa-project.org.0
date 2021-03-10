Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB843332FE
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 03:11:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1C741790;
	Wed, 10 Mar 2021 03:10:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1C741790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615342292;
	bh=buaCGynwgAGFV8iCdPJ6lsjKrMJ2nkq7bpoYpeUB5UM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g1spVP/861sAlWVYXrmvWd4FK7XL/uyedGPvCSqJHbZcfwwQxeLMzGmGw8eg/PZ1z
	 ixY9I40ATl8BscZA4W3QzlBTpDCWv0b4kde3dfHH5qw0uroABn4/niAcZg0DkiwLO4
	 RNVdkBgv+oWVu/Fr83wlLxHC9S8rEYFNTo9+M2Wc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2A12F801D8;
	Wed, 10 Mar 2021 03:10:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C23EDF801D8; Wed, 10 Mar 2021 03:09:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2152F8012F
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 03:09:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2152F8012F
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 12A29bnH6013911,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs02.realtek.com.tw[172.21.6.95])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 12A29bnH6013911
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 10 Mar 2021 10:09:37 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 10 Mar 2021 10:09:37 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::6caa:5fa6:24e2:bbef]) by
 RTEXMBS01.realtek.com.tw ([fe80::6caa:5fa6:24e2:bbef%7]) with mapi id
 15.01.2106.013; Wed, 10 Mar 2021 10:09:37 +0800
From: Jack Yu <jack.yu@realtek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>
Subject: RE: [PATCH] ASoC: rt1015p: add acpi device id for rt1015p
Thread-Topic: [PATCH] ASoC: rt1015p: add acpi device id for rt1015p
Thread-Index: AQHXC+PZieNKkxQzvkm2O9jKbm5rKqpqdDYAgA824kCAAfwMAIAA4lOA
Date: Wed, 10 Mar 2021 02:09:36 +0000
Message-ID: <eeb69d18b3a5449a9a3497777afda052@realtek.com>
References: <20210226020517.17124-1-jack.yu@realtek.com>
 <b4af8c40-d1c6-35f2-0f70-3032fd04697f@linux.intel.com>
 <2e2eaa61cdcd44529f379085c615a4c9@realtek.com>
 <f4327b67-7202-0a4c-69af-93a4a1982dfe@linux.intel.com>
In-Reply-To: <f4327b67-7202-0a4c-69af-93a4a1982dfe@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.167]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?utf-8?B?a2VudF9jaGVuQHJlYWx0ZWsuY29tIFvpmbPlu7rlro9d?=
 <kent_chen@realtek.com>, =?utf-8?B?6Zmz5pi25b+X?= <kenny_chen@realtek.com>,
 =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
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

PiA+Pj4gKyNpZmRlZiBDT05GSUdfQUNQSQ0KPiA+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYWNw
aV9kZXZpY2VfaWQgcnQxMDE1cF9hY3BpX21hdGNoW10gPSB7DQo+ID4+PiArCXsgIkFMQ1AxMDE1
IiwgMH0sDQo+ID4+DQo+ID4+IFRoaXMgaXNuJ3QgbXVjaCBiZXR0ZXIsIEFMQyBpcyBub3QgYSB2
ZW5kb3IgSUQgYXMgZGVmaW5lZCBieQ0KPiA+PiBodHRwczovL3VlZmkub3JnL1BOUF9BQ1BJX1Jl
Z2lzdHJ5DQo+ID4+DQo+ID4+IEkndmUgYXNrIGZvciBndWlkYW5jZSBmcm9tIEludGVsIEFDUEkg
Zm9sa3Mgb24gdGhpcywgcGxlYXNlIHN0YXkgdHVuZWQuDQo+ID4+DQo+ID4NCj4gPiBIaSBQaWVy
cmUsDQo+ID4NCj4gPiBJcyB0aGVyZSBhbnkgdXBkYXRlIGZyb20gSW50ZWwgQUNQSSB0ZWFtIHJl
Z2FyZGluZyB0byB0aGlzIElEIGZvcm1hdCBpc3N1ZT8NCj4gDQo+IFNvcnJ5IGFib3V0IHRoZSBk
ZWxheS4NCj4gDQo+IEl0IHNlZW1zIHRoYXQgdGhlIG9wdGlvbnMgYXJlIGxpbWl0ZWQuIFRoZSBI
SUQgbmVlZHMgdG8gYmUgbWFkZSBvZiB0d28gcGFydHMsDQo+IHZlbmRvciBJRCBhbmQgcGFydCBJ
RC4NCj4gDQo+IEZvciB0aGUgdmVuZG9yIElELCB5b3UgbWF5IHVzZSB0aGUgUE5QIElEIChSVEwp
IG9yIHRoZSBQQ0kgSUQgKDEwRUMpLg0KPiANCj4gRm9yIHRoZSBwYXJ0IElELCB5b3UgYXJlIGxp
bWl0ZWQgdG8gNCBoZXgtZGlnaXRzLiBJIGRpZG4ndCBnZXQgYW55IHBvc2l0aXZlIGFuc3dlcnMN
Cj4gb24gaG93IHRvIHN1cHBvcnQgJzEwMTVQJywgdGhlIG9ubHkgc29sdXRpb24gc2VlbXMgdG8g
YmUgdG8gY3JlYXRlIGEgbmV3IHBhcnQNCj4gbnVtYmVyLCBvciBkZXRlY3QgYXQgcnVuLXRpbWUg
d2hpY2ggb2YgdGhlICcxMDE1JyBza2V3cyBpcyBhY3R1YWxseSB1c2VkLg0KPiANCg0KQWN0dWFs
bHkgdGhpcyBkcml2ZXIgaXMgYWxzbyB1c2VkIGZvciBydDEwMTUgSUMsIHRoZSBvbmx5IGRpZmZl
cmVuY2UgaXMgdGhhdCBydDEwMTUuYyBpcyBmb3IgaTJjIG1vZGUNCmFuZCBydDEwMTVwIGlzIGZv
ciBub24taTJjIG1vZGUgb2YgcnQxMDE1IElDLCBzbyBJIHRoaW5rIGl0J3Mgb2sgdG8gdXNlIHRo
ZSBzYW1lIHBhcnQgSUQgKGRpZmZlcmVudCB2ZW5kb3IgSUQpIGZvciB0d28gZHJpdmVycy4NCkhv
dyBkbyB5b3UgdGhpbmsgaWYgd2UgdXNlICJSVEwxMDE1IiBpbnN0ZWFkPw0KDQo=
