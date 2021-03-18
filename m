Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE4A33FC9F
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 02:23:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0458C16C7;
	Thu, 18 Mar 2021 02:22:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0458C16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616030590;
	bh=6TL3q/Z/gx7iwbQlwuQ4Otlg3YFkAtIjFfq+MDs2b5g=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PCFGp64W+YkWRAbFqCTneiQI3CjlI1Ah0xFYvdYDnE+VQu7nZFrYvosTXrEBqQ6d9
	 qHbKce7j7h6QgeYsQjLpXFVfLhMokiPhG9Frrpt7P3w76cqdZPRLV8kj/e668fILLv
	 PoNsgkQ9csy0jh9Khaqo0VclUkXKaXk1fNbsO5Tc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CE96F80254;
	Thu, 18 Mar 2021 02:21:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6614F80253; Thu, 18 Mar 2021 02:21:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C273EF80124
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 02:21:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C273EF80124
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 12I1LkGY2017919,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs03.realtek.com.tw[172.21.6.96])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 12I1LkGY2017919
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 18 Mar 2021 09:21:46 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 09:21:46 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 09:21:45 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::6caa:5fa6:24e2:bbef]) by
 RTEXMBS01.realtek.com.tw ([fe80::6caa:5fa6:24e2:bbef%7]) with mapi id
 15.01.2106.013; Thu, 18 Mar 2021 09:21:45 +0800
From: Jack Yu <jack.yu@realtek.com>
To: "Lu, Brent" <brent.lu@intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>,
 =?utf-8?B?a2VudF9jaGVuQHJlYWx0ZWsuY29tIFvpmbPlu7rlro9d?=
 <kent_chen@realtek.com>
Subject: RE: [PATCH v3] ASoC: Intel: sof_rt5682: Add ALC1015Q-VB speaker amp
 support
Thread-Topic: [PATCH v3] ASoC: Intel: sof_rt5682: Add ALC1015Q-VB speaker amp
 support
Thread-Index: AQHXGzY5g4Pry5OlPUKQGENVoO6uRKqHynaAgAEpDaA=
Date: Thu, 18 Mar 2021 01:21:45 +0000
Message-ID: <5c750391ceb349d2aaf403f038fc7394@realtek.com>
References: <20210317110824.20814-1-brent.lu@intel.com>
 <af990f6f-3a8b-3a1e-a02a-3bfe96e4d80a@linux.intel.com>
 <DM6PR11MB364290806B23636B6D0618DF976A9@DM6PR11MB3642.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB364290806B23636B6D0618DF976A9@DM6PR11MB3642.namprd11.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.167]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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

PiA+IFRoZSBjb2RlIGlzIGxvb2tzIGZpbmUsIGJ1dCBKYWNrIFl1IGFkZGVkIGEgc2VwYXJhdGUg
cGF0Y2ggdGhhdCBtYWtlcw0KPiA+IFJUTDEwMTkgZXF1aXZhbGVudCB0byBSVEwxMDE1LCBzbyBz
aG91bGQgdGhpcyBwYXRjaCBhbHNvIGhhbmRsZSB0aGUNCj4gPiBSVEwxMDE5IGNhc2U/DQo+IA0K
PiBUaGUgdG9wb2xvZ3kgdXNlZCBieSB0aGlzIG1hY2hpbmUgZHJpdmVyIGlzIHVzaW5nIDQ4aywg
NjRmcyBJMlMgZm9ybWF0Lg0KPiBSVDEwMTkgbmVlZHMgdG8gc3VwcG9ydCB0aGlzIGNvbmZpZ3Vy
YXRpb24uIE5vdCBzdXJlIGlmIFJUMTAxOSBjb3VsZCBzdXBwb3J0DQo+IHRoYXQuDQo+IA0KDQpZ
ZXMsIFJUMTAxOSBzdXBwb3J0cyA0OGssIDY0ZnMgSTJTIGZvcm1hdC4NCg==
