Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A5631E3DE
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 02:28:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21644165D;
	Thu, 18 Feb 2021 02:27:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21644165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613611717;
	bh=KgoB/kBw/bI+1uxolDSLCjf/aJE2iqy++oYscfCg+c4=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FMI/pXgDw6HYl2NHBLjY+sSFbgl1pps5WVUMdWNMj4420Kd7RzttGMYs3q3x+rTsW
	 1GLa5nCzBss9vodD+dbexCm9XgbQ7/AFXMkwaP/L8Fm/SAe7C9gWmTHmV8IFZG9Q8M
	 VRbHxKndTxFd2/wK1uehLUOMRal4pi4UY4CxHjzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BB8DF8020B;
	Thu, 18 Feb 2021 02:27:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE71AF80258; Thu, 18 Feb 2021 02:27:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71F51F800D0
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 02:26:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71F51F800D0
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 11I1QqHvA004880,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs02.realtek.com.tw[172.21.6.95])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 11I1QqHvA004880
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 18 Feb 2021 09:26:52 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Feb 2021 09:26:52 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Feb 2021 09:26:52 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::11a3:66f1:391c:a66]) by
 RTEXMBS01.realtek.com.tw ([fe80::11a3:66f1:391c:a66%7]) with mapi id
 15.01.2106.006; Thu, 18 Feb 2021 09:26:52 +0800
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH] ASoC: rt1316: Add RT1316 SDCA vendor-specific driver
Thread-Topic: [PATCH] ASoC: rt1316: Add RT1316 SDCA vendor-specific driver
Thread-Index: AQHW/fluE6xxc+NyJ06Pw/NFSJ2UIapNqGSAgAAzAQCAACjgAIABBs5wgADYoQCADUedYA==
Date: Thu, 18 Feb 2021 01:26:52 +0000
Message-ID: <61955293647745c987280464eb18b414@realtek.com>
References: <20210208090432.1078-1-shumingf@realtek.com>
 <20210208122337.GE8645@sirena.org.uk>
 <9eff4f09-b127-5912-f62f-ed1e48db2e36@linux.intel.com>
 <20210208175228.GJ8645@sirena.org.uk>
 <6b30d40f0eff42748fba7bec65baeaab@realtek.com>
 <20210209222826.GE4916@sirena.org.uk>
In-Reply-To: <20210209222826.GE4916@sirena.org.uk>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.209]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 "pierre-louis.bossart@intel.com" <pierre-louis.bossart@intel.com>
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

PiA+ID4gUmlnaHQsIHRoaXMgd2FzIG15IGV4cGVjdGF0aW9uIGZvciBob3cgdGhpcyB3b3VsZCB3
b3JrIC0gZHluYW1pYw0KPiA+ID4gY29udHJvbCBhdCBydW50aW1lIHNvIHlvdSBjYW4gZG8gc3R1
ZmYgbGlrZSB0aGF0IHJhdGhlciB0aGFuIGEgbW9yZQ0KPiA+ID4gc3RhdGljIHNldHVwIGxpa2Ug
c2xvdCBhc3NpZ25tZW50IGlzIG5vcm1hbGx5Li4NCj4gDQo+ID4gQWN0dWFsbHksIHRoZSAiUlgg
Q2hhbm5lbCBTZWxlY3QiIGNvbnRyb2wgY291bGQgc2VsZWN0IHRoZSBjaGFubmVsLg0KPiA+IFRo
aXMgY29udHJvbCBjb3VsZCBzZWxlY3QgdGhlIGRpZmZlcmVudCBjaGFubmVscyB0byBvdXRwdXQg
ZHluYW1pY2FsbHkuDQo+ID4gSG93ZXZlciwgY291bGQgSSBrZWVwIHRoZSBydDEzMTZfc2R3X3Nl
dF90ZG1fc2xvdCgpIGhlcmU/DQo+ID4gVGhlcmUgd2lsbCBiZSBtb3JlIG9wdGlvbnMgdG8gc2V0
IHRoaXMgY29uZmlndXJhdGlvbi4NCj4gDQo+IElmIHRoZXJlJ3MgYSBjb250cm9sIHRvIG92ZXJy
aWRlIGl0IGF0IHJ1bnRpbWUgdGhlbiBkdXBsaWNhdGluZyB0aGF0IHdpdGgNCj4gc2V0X3RkbV9z
bG90KCkgc2VlbXMgbGlrZSBpdCdzIGdvaW5nIHRvIGJlIGEgcm91dGUgdG8gY29uZnVzaW9uIGlm
IHBlb3BsZSBjaGFuZ2UNCj4gaXQ/DQoNClNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4NCk9rLCBJ
IHdpbGwgcmVtb3ZlIHRoZSBzZXRfdGRtX3Nsb3QoKSBhbmQgc2VuZCB2MiBwYXRjaC4NCg0K
