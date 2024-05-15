Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED71D8C6227
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2024 09:53:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7BEF209;
	Wed, 15 May 2024 09:53:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7BEF209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715759596;
	bh=a6soEbL7FtyNIzoGhXBWsnlziRZrsi4b3UGpIWXWKtA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iTXi5If9+uMpIjGyVE5qaV1Fdn3BC7h1D7OaJDD7p1gfceZO8vtS6SwMWOEwaarie
	 6rXCbTW/lcwAV1s/ZhrSzDgR+bPef3eHDRDHCHI8zNWuJru+997aRLksA+ddqXvWR3
	 CXcq56ZoiD4i37OyJJ8X8mECmGRHq+3q+pXHfMP4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84767F80578; Wed, 15 May 2024 09:52:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7308F8059F;
	Wed, 15 May 2024 09:52:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17C11F80224; Wed, 15 May 2024 09:50:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC0D7F800F5
	for <alsa-devel@alsa-project.org>; Wed, 15 May 2024 09:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC0D7F800F5
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 44F7nfhrF3846071,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (mapi.realtek.com[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 44F7nfhrF3846071
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 May 2024 15:49:42 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 15 May 2024 15:49:42 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 15:49:41 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975]) by
 RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975%5]) with mapi id
 15.01.2507.035; Wed, 15 May 2024 15:49:41 +0800
From: =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>
To: "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "Flove(HsinFu)" <flove@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
        =?big5?B?RGVyZWsgW6TovHe4cV0=?= <derek.fang@realtek.com>,
        "pierre-louis.bossart@intel.com" <pierre-louis.bossart@intel.com>,
        "fred.oh@intel.com" <fred.oh@intel.com>,
        "marc.herbert@intel.com"
	<marc.herbert@intel.com>
Subject: RE: [PATCH] ASoC: rt711-sdca: add GE selected mode control
Thread-Topic: [PATCH] ASoC: rt711-sdca: add GE selected mode control
Thread-Index: AQHaoe/JMiJrwj6yOU+GBdbsXhyhZ7GX9G3w
Date: Wed, 15 May 2024 07:49:41 +0000
Message-ID: <7fb20320d4be4214a345b0627bf62b6d@realtek.com>
References: <20240509090335.2300516-1-shumingf@realtek.com>
In-Reply-To: <20240509090335.2300516-1-shumingf@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.22.102.209]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: VWHNJ74HHWKTH6AZNBWATLQK23XX74CY
X-Message-ID-Hash: VWHNJ74HHWKTH6AZNBWATLQK23XX74CY
X-MailFrom: shumingf@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VWHNJ74HHWKTH6AZNBWATLQK23XX74CY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiBUaGUgU0RDQSBzcGVjIGRlZmluZXMgYSAnc2VsZWN0ZWRfbW9kZScgY29udHJvbCB3aGljaCBj
YW4gb3ZlcnJpZGUgdGhlDQo+ICdkZXRlY3RlZF9tb2RlJyByZXBvcnRlZCBieSBoYXJkd2FyZS4N
Cj4gVGhpcyBpcyB1c2VmdWwgZm9yIHBsYXRmb3JtIGludGVncmF0aW9uIGFzIHdlbGwgYXMgaW4g
Y2FzZXMgd2hlcmUgdGhlIGhhcmR3YXJlIGlzDQo+IG5vdCBhYmxlIHRvIGFjY3VyYXRlbHkgZGV0
ZWN0IHRoZSBqYWNrIHR5cGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTaHVtaW5nIEZhbiA8c2h1
bWluZ2ZAcmVhbHRlay5jb20+DQo+IC0tLQ0KPiAgc291bmQvc29jL2NvZGVjcy9ydDcxMS1zZGNh
LmMgfCA3OQ0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgc291bmQv
c29jL2NvZGVjcy9ydDcxMS1zZGNhLmggfCAgMSArDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDgwIGlu
c2VydGlvbnMoKykNCg0KRG9uJ3QgcmV2aWV3IHRoaXMgcGF0Y2guIA0KV2lsbCBzZW5kIHYyIHBh
dGNoLiBUaGFua3MuDQoNCg==
