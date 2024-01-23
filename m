Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F3B83DE7A
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jan 2024 17:19:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33B5CE65;
	Fri, 26 Jan 2024 17:19:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33B5CE65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706285985;
	bh=x8IFdXnCeGIrbJjs7/ipMSRqhAWyyhvahEUt53Kfbz8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kAJzTGAkCeMh0cYez9cphxzyWBtSTAZxtwpKomOjvvDnBX1ja2oVh8LiHUE1/Rjon
	 5Nr+APC8DlEeZc3Icxofml/iZDKe3peh/5RTFgWJFmCypBLgDwbGfses969qD+PVbI
	 Y0Q+n0tQnSlFY/I+9WOaYg/+mrkDlPc++X+TEozY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88723F8065B; Fri, 26 Jan 2024 17:18:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97594F80622;
	Fri, 26 Jan 2024 17:18:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79712F800C1; Tue, 23 Jan 2024 20:28:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E91A4F800C1
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 20:28:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E91A4F800C1
Received: from svr-chch-seg1.atlnz.lc (unknown [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E88B22C0733;
	Wed, 24 Jan 2024 08:28:08 +1300 (NZDT)
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by
 svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B65b013480000>; Wed, 24 Jan 2024 08:28:08 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.40; Wed, 24 Jan 2024 08:28:08 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.48; Wed, 24 Jan 2024 08:28:08 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.040; Wed, 24 Jan 2024 08:28:08 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bjorn Andersson
	<andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, "Srinivas
 Kandagatla" <srinivas.kandagatla@linaro.org>, Banajit Goswami
	<bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Frank Rowand
	<frowand.list@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>, Sean Anderson
	<sean.anderson@seco.com>
Subject: Re: [PATCH v4 0/6] reset: gpio: ASoC: shared GPIO resets
Thread-Topic: [PATCH v4 0/6] reset: gpio: ASoC: shared GPIO resets
Thread-Index: AQHaTgZcl1ULQf9J4Eqr3ug6OQdT9LDm7pqA
Date: Tue, 23 Jan 2024 19:28:08 +0000
Message-ID: <6c3e4b71-c92f-4f1e-8435-b5cfb7f47117@alliedtelesis.co.nz>
References: <20240123141311.220505-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240123141311.220505-1-krzysztof.kozlowski@linaro.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-Type: text/plain; charset="utf-8"
Content-ID: <6388DE1362E6534FADA1D4908BCF3227@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=LZFCFQXi c=1 sm=1 tr=0
 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10
 a=IkcTkHD0fZMA:10 a=dEuoMetlWLkA:10 a=35lJjsoYTdPToEE-BswA:9
 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-MailFrom: Chris.Packham@alliedtelesis.co.nz
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QWB43SFEUOEOQLPTE3D64V455FZMWTRG
X-Message-ID-Hash: QWB43SFEUOEOQLPTE3D64V455FZMWTRG
X-Mailman-Approved-At: Fri, 26 Jan 2024 16:17:53 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QWB43SFEUOEOQLPTE3D64V455FZMWTRG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpPbiAyNC8wMS8yNCAwMzoxMywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gSGksDQo+
DQo+IFBhdGNoICMyIChjcHVmcmVxOiBkbyBub3Qgb3Blbi1jb2RlIG9mX3BoYW5kbGVfYXJnc19l
cXVhbCgpKSBhbmQgcGF0Y2ggIzQNCj4gKHJlc2V0OiBJbnN0YW50aWF0ZSByZXNldCBHUElPIGNv
bnRyb2xsZXIgZm9yIHNoYXJlZCByZXNldC1ncGlvcykgZGVwZW5kIG9uIE9GDQo+IGNoYW5nZSAo
cGF0Y2ggIzEpLg0KPg0KPiBDaGFuZ2VzIGluIHY0DQo+ID09PT09PT09PT09PT0NCj4gMS4gTmV3
IHBhdGNoZXM6DQo+ICAgICBvZjogYWRkIG9mX3BoYW5kbGVfYXJnc19lcXVhbCgpIGhlbHBlcg0K
PiAgICAgY3B1ZnJlcTogZG8gbm90IG9wZW4tY29kZSBvZl9waGFuZGxlX2FyZ3NfZXF1YWwoKQ0K
Pg0KPiAyLiByZXNldC1ncGlvLmM6DQo+ICAgICAtIERyb3AgdW5uZWVkZWQgY29tbWVudCAoQmFy
dG9zeiksIGFkZCBSYiB0YWcuDQo+ICAgICAtIERvIG5vdCBhc3NpZ24gb2Zfbm9kZS4NCj4NCj4g
My4gcmVzZXQvY29yZS5jOg0KPiAgICAgLSBJbXBsZW1lbnQgbW9zdCBvZiBCYXJ0b3N6IGZlZWRi
YWNrIChJIHJlc3BvbmRlZCB0byBvbmUgd2hpY2ggSSBkaWQgbm90DQo+ICAgICAgIGltcGxlbWVu
dCkgYW5kIGNvbW1lbnRzIGZyb20gUGhpbGlwcC4NCj4gICAgIC0gRXhwZWN0IGVpdGhlciByY2Rl
di0+b2ZfYXJncyBvciByY2Rldi0+b2Zfbm9kZS4NCj4gICAgIC0gRHJvcCBfX3Jlc2V0X2dwaW9z
X2FyZ3NfbWF0Y2goKSBhbmQgdXNlIGNvbW1vbiBoZWxwZXIgKFBoaWxpcHApLg0KPiAgICAgLSBN
b3ZlIGRlY2xhcmF0aW9ucyBvZiBhdXRvbWF0aWMtY2xlYW51cCB2YXJpYWJsZXMgaW4NCj4gICAg
ICAgX19yZXNldF9hZGRfcmVzZXRfZ3Bpb19sb29rdXAoKSB0byBwbGFjZSBvZiB1c2UgKEJhcnRv
c3opLg0KPiAgICAgLSBTZXBhcmF0ZSBncGlvX2RldmljZV9nZXRfbGFiZWwoKSBhbmQga3N0cmR1
cCgpIChQaGlsaXBwKS4NCj4gICAgIC0gQ29ycmVjdCBkb2MgZm9yIF9fcmVzZXRfYWRkX3Jlc2V0
X2dwaW9fZGV2aWNlKCksIHJld3JpdGUgZmV3IGNvbW1lbnRzLg0KPiAgICAgLSBEcm9wIHVubmVl
ZGVkICJyIiB2YXJpYWJsZSBpbiBfX3Jlc2V0X2ZpbmRfcmNkZXYoKSAoUGhpbGlwcCkuDQo+ICAg
ICAtIERyb3Agb2ZfcGhhbmRsZV9hcmdzIGluaXRpYWxpemF0aW9uIGluIF9fb2ZfcmVzZXRfY29u
dHJvbF9nZXQgKFBoaWxpcHApLg0KPiAgICAgLSBDaGVjayBpZiBDT05GSUdfUkVTRVRfR1BJTyBp
cyBlbmFibGVkIGJlZm9yZSB0cnlpbmcgdG8gbG9vayB1cCByZXNldC1ncGlvcy4NCj4NCj4gNC4g
RHJvcCBDaHJpcycgcGF0Y2g6ICJpMmM6IG11eGVzOiBwY2E5NTR4OiBBbGxvdyBzaGFyaW5nIHJl
c2V0IEdQSU8iLCBiZWNhdXNlDQo+ICAgICBkaXNjdXNzaW9uIGlzIG9uIGdvaW5nLg0KDQpJIGFj
dHVhbGx5IHRoaW5rIGl0IHdvdWxkIGhhdmUgYmVlbiBPSyBhcy1pcyB3aXRoIHlvdXIgbGF0ZXN0
IGNoYW5nZSB0byANCnJldHVybiBOVUxMIHdoZW4gQ09ORklHX1JFU0VUX0dQSU8gaXMgbm90IGVu
YWJsZWQuIEJ1dCBJJ20gaGFwcHkgdG8gDQpzdWJtaXQgaXQgaW5kZXBlbmRlbnRseSBhZnRlciB0
aGlzIHNlcmllcyBsYW5kcy4gSXQnbGwgZ2l2ZSBtZSBhIGNoYW5jZSANCnRvIGRvIGEgYml0IG1v
cmUgdGVzdGluZy4NCg0K
