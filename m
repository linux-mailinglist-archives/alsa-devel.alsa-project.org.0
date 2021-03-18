Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C29A33FC9E
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 02:22:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9078E16BC;
	Thu, 18 Mar 2021 02:22:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9078E16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616030576;
	bh=IydnTVAtLIWBb8yrQpqrjjZfJ7co0mi/xeB/Apvs4qk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ry3Gop1ADrHb0QS2c7vVViwWEt7a0t/7M0bN7FUoJyw4cYu4xCtiywSvRvXl7i1cU
	 HMmbT6Fk80dEPMZ2xGyhEBIrxkjCk5q8RD2GYv2KqsGLPDLvd53TpUfnX0G+YeVE5t
	 aKvlf1fuhlBpKbIdZRej45cJIAj70n8sBIOXHxro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2544F8023C;
	Thu, 18 Mar 2021 02:21:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8B68F8021C; Thu, 18 Mar 2021 02:21:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0BF9F80148
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 02:21:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0BF9F80148
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 12I1L4CG0017885,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs02.realtek.com.tw[172.21.6.95])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 12I1L4CG0017885
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 18 Mar 2021 09:21:04 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 09:21:03 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::6caa:5fa6:24e2:bbef]) by
 RTEXMBS01.realtek.com.tw ([fe80::6caa:5fa6:24e2:bbef%7]) with mapi id
 15.01.2106.013; Thu, 18 Mar 2021 09:21:03 +0800
From: Jack Yu <jack.yu@realtek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Brent Lu
 <brent.lu@intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>,
 =?utf-8?B?a2VudF9jaGVuQHJlYWx0ZWsuY29tIFvpmbPlu7rlro9d?=
 <kent_chen@realtek.com>
Subject: RE: [PATCH v3] ASoC: Intel: sof_rt5682: Add ALC1015Q-VB speaker amp
 support
Thread-Topic: [PATCH v3] ASoC: Intel: sof_rt5682: Add ALC1015Q-VB speaker amp
 support
Thread-Index: AQHXGzY5g4Pry5OlPUKQGENVoO6uRKqI8mXQ
Date: Thu, 18 Mar 2021 01:21:03 +0000
Message-ID: <7f91482a93aa4d429ee574d730eeca6a@realtek.com>
References: <20210317110824.20814-1-brent.lu@intel.com>
 <af990f6f-3a8b-3a1e-a02a-3bfe96e4d80a@linux.intel.com>
In-Reply-To: <af990f6f-3a8b-3a1e-a02a-3bfe96e4d80a@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.167]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Dharageswari R <dharageswari.r@intel.com>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi
 Iwai <tiwai@suse.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Fred Oh <fred.oh@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Libin Yang <libin.yang@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>
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

PiA+IFRoaXMgcGF0Y2ggYWRkcyBqc2xfcnQ1NjgyX3J0MTAxNXAgd2hpY2ggc3VwcG9ydHMgdGhl
IFJUNTY4MiBoZWFkc2V0DQo+ID4gY29kZWMgYW5kIEFMQzEwMTVRLVZCIHNwZWFrZXIgYW1wbGlm
aWVyIGNvbWJpbmF0aW9uIG9uIEphc3Blckxha2UNCj4gPiBwbGF0Zm9ybS4NCj4gPg0KPiA+IFRo
aXMgZHJpdmVyIGFsc28gc3VwcG9ydHMgQUxDMTAxNVEtQ0cgaWYgcnVubmluZyBpbiBhdXRvLW1v
ZGUuDQo+ID4gRm9sbG93aW5nIHRhYmxlIHNob3dzIHRoZSBhdWRpbyBpbnRlcmZhY2Ugc3VwcG9y
dCBvZiB0aGUgdHdvDQo+ID4gYW1wbGlmaWVycy4NCj4gPg0KPiA+ICAgICAgICAgICAgfCBBTEMx
MDE1US1DRyB8IEFMQzEwMTVRLVZCDQo+ID4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQ0KPiA+IEkyQyAgICAgICB8IFllcyAgICAgICAgIHwgTm8NCj4gPiBBdXRvLW1vZGUg
fCA0OEssIDY0ZnMgICB8IDE2aywgMzJmcw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDQ4aywgMzJmcw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQ4aywgNjRmcw0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQnJlbnQgTHUgPGJyZW50Lmx1QGludGVsLmNvbT4NCj4gDQo+
IFRoZSBjb2RlIGlzIGxvb2tzIGZpbmUsIGJ1dCBKYWNrIFl1IGFkZGVkIGEgc2VwYXJhdGUgcGF0
Y2ggdGhhdCBtYWtlcw0KPiBSVEwxMDE5IGVxdWl2YWxlbnQgdG8gUlRMMTAxNSwgc28gc2hvdWxk
IHRoaXMgcGF0Y2ggYWxzbyBoYW5kbGUgdGhlDQo+IFJUTDEwMTkgY2FzZT8NCj4gDQpGb3IgcnQx
MDE5IG5vbi1pMmMgbW9kZSAoYXV0byBtb2RlKSwgaXQgdXNlcyB0aGUgc2RiIHBpbiB0byBlbmFi
bGUgYW1wLCB0aGUgc2FtZSBhcyBydDEwMTUgbm9uLWkyYyBtb2RlLA0KdGhlcmVmb3JlIHdlIHBy
b3Bvc2UgcnQxMDE5KGF1dG8gbW9kZSkgdG8gdXNlIHJ0MTAxNXAgaW5zdGVhZCBvZiBhZGRpbmcg
YSBuZXcgZHJpdmVyIGZvciBpdC4NCg==
