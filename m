Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 231CB3401E2
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 10:22:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B549216E0;
	Thu, 18 Mar 2021 10:21:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B549216E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616059345;
	bh=ZwvN+uP0K9y3cmvxkk8XuEtCumRxIONXphHZXmcRVfc=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m5bKEiKURX9k7hydXSaV+RAzrfG9C2X9LdakZlk8VRviVuiT99QDW4tItcncOauKk
	 g4YNrW2feRmUcp84BGDMEYn3y3pud1+HxXYYV7T/EFP82gIJ2k+uQW2dowBTQmKlJp
	 iFlqFlpME7lhm/0MXAj+viv57lrWBtW9ssfFOUyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D1D9F804FA;
	Thu, 18 Mar 2021 10:16:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9109AF80165; Thu, 18 Mar 2021 03:19:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8390BF800E0
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 03:19:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8390BF800E0
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 12I2JJ460004207,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 12I2JJ460004207
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 18 Mar 2021 10:19:19 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 10:19:19 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 10:19:19 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::6caa:5fa6:24e2:bbef]) by
 RTEXMBS01.realtek.com.tw ([fe80::6caa:5fa6:24e2:bbef%7]) with mapi id
 15.01.2106.013; Thu, 18 Mar 2021 10:19:19 +0800
From: =?utf-8?B?a2VudF9jaGVuQHJlYWx0ZWsuY29tIFvpmbPlu7rlro9d?=<kent_chen@realtek.com>
To: Jack Yu <jack.yu@realtek.com>, "Lu, Brent" <brent.lu@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH v3] ASoC: Intel: sof_rt5682: Add ALC1015Q-VB speaker amp
 support
Thread-Topic: [PATCH v3] ASoC: Intel: sof_rt5682: Add ALC1015Q-VB speaker amp
 support
Thread-Index: AQHXGzY5g4Pry5OlPUKQGENVoO6uRKqHynaAgAEpDaCAAA4VgA==
Date: Thu, 18 Mar 2021 02:19:19 +0000
Message-ID: <d306b9a317f644b8becd1185093696ba@realtek.com>
References: <20210317110824.20814-1-brent.lu@intel.com>
 <af990f6f-3a8b-3a1e-a02a-3bfe96e4d80a@linux.intel.com>
 <DM6PR11MB364290806B23636B6D0618DF976A9@DM6PR11MB3642.namprd11.prod.outlook.com>
 <5c750391ceb349d2aaf403f038fc7394@realtek.com>
In-Reply-To: <5c750391ceb349d2aaf403f038fc7394@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.237.21]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Mar 2021 10:16:09 +0100
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, "R,
 Dharageswari" <dharageswari.r@intel.com>, "Nujella,
 Sathyanarayana" <sathyanarayana.nujella@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jie
 Yang <yang.jie@linux.intel.com>, Takashi
 Iwai <tiwai@suse.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Fred Oh <fred.oh@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Libin Yang <libin.yang@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, "Zhi, Yong" <yong.zhi@intel.com>
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

VXBkYXRlIG1vcmUgQUxDMTAxOSBzYW1wbGUgcmF0ZQ0KMTZLLzQ0LjFLLzQ4Sy85NksNCjMyZnMv
NjRmcw0KSTJTIGZvcm1hdA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSmFj
ayBZdSA8amFjay55dUByZWFsdGVrLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgTWFyY2ggMTgsIDIw
MjEgOToyMiBBTQ0KVG86IEx1LCBCcmVudCA8YnJlbnQubHVAaW50ZWwuY29tPjsgUGllcnJlLUxv
dWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT47IGFsc2Et
ZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsga2VudF9jaGVuQHJlYWx0ZWsuY29tIFvpmbPlu7rlro9d
IDxrZW50X2NoZW5AcmVhbHRlay5jb20+DQpDYzogT2RlciBDaGlvdSA8b2Rlcl9jaGlvdUByZWFs
dGVrLmNvbT47IExpYW0gR2lyZHdvb2QgPGxnaXJkd29vZEBnbWFpbC5jb20+OyBNYXJrIEJyb3du
IDxicm9vbmllQGtlcm5lbC5vcmc+OyBKYXJvc2xhdiBLeXNlbGEgPHBlcmV4QHBlcmV4LmN6Pjsg
VGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmNvbT47IFJvamV3c2tpLCBDZXphcnkgPGNlemFyeS5y
b2pld3NraUBpbnRlbC5jb20+OyBKaWUgWWFuZyA8eWFuZy5qaWVAbGludXguaW50ZWwuY29tPjsg
S2FpIFZlaG1hbmVuIDxrYWkudmVobWFuZW5AbGludXguaW50ZWwuY29tPjsgR3Vlbm5hZGkgTGlh
a2hvdmV0c2tpIDxndWVubmFkaS5saWFraG92ZXRza2lAbGludXguaW50ZWwuY29tPjsgUmFuZGVy
IFdhbmcgPHJhbmRlci53YW5nQGxpbnV4LmludGVsLmNvbT47IFpoaSwgWW9uZyA8eW9uZy56aGlA
aW50ZWwuY29tPjsgTGliaW4gWWFuZyA8bGliaW4ueWFuZ0BsaW51eC5pbnRlbC5jb20+OyBSYW5q
YW5pIFNyaWRoYXJhbiA8cmFuamFuaS5zcmlkaGFyYW5AbGludXguaW50ZWwuY29tPjsgTnVqZWxs
YSwgU2F0aHlhbmFyYXlhbmEgPHNhdGh5YW5hcmF5YW5hLm51amVsbGFAaW50ZWwuY29tPjsgUiwg
RGhhcmFnZXN3YXJpIDxkaGFyYWdlc3dhcmkuckBpbnRlbC5jb20+OyBLdW5pbm9yaSBNb3JpbW90
byA8a3VuaW5vcmkubW9yaW1vdG8uZ3hAcmVuZXNhcy5jb20+OyBGcmVkIE9oIDxmcmVkLm9oQGxp
bnV4LmludGVsLmNvbT47IFR6dW5nLUJpIFNoaWggPHR6dW5nYmlAZ29vZ2xlLmNvbT47IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNClN1YmplY3Q6IFJFOiBbUEFUQ0ggdjNdIEFTb0M6IElu
dGVsOiBzb2ZfcnQ1NjgyOiBBZGQgQUxDMTAxNVEtVkIgc3BlYWtlciBhbXAgc3VwcG9ydA0KDQo+
ID4gVGhlIGNvZGUgaXMgbG9va3MgZmluZSwgYnV0IEphY2sgWXUgYWRkZWQgYSBzZXBhcmF0ZSBw
YXRjaCB0aGF0IA0KPiA+IG1ha2VzDQo+ID4gUlRMMTAxOSBlcXVpdmFsZW50IHRvIFJUTDEwMTUs
IHNvIHNob3VsZCB0aGlzIHBhdGNoIGFsc28gaGFuZGxlIHRoZQ0KPiA+IFJUTDEwMTkgY2FzZT8N
Cj4gDQo+IFRoZSB0b3BvbG9neSB1c2VkIGJ5IHRoaXMgbWFjaGluZSBkcml2ZXIgaXMgdXNpbmcg
NDhrLCA2NGZzIEkyUyBmb3JtYXQuDQo+IFJUMTAxOSBuZWVkcyB0byBzdXBwb3J0IHRoaXMgY29u
ZmlndXJhdGlvbi4gTm90IHN1cmUgaWYgUlQxMDE5IGNvdWxkIA0KPiBzdXBwb3J0IHRoYXQuDQo+
IA0KDQpZZXMsIFJUMTAxOSBzdXBwb3J0cyA0OGssIDY0ZnMgSTJTIGZvcm1hdC4NCg==
