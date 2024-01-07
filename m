Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3A48274FF
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jan 2024 17:23:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A5C883E;
	Mon,  8 Jan 2024 17:23:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A5C883E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704731037;
	bh=q8L8GGjcdhecGc36tfxiOQfbebJzTJwl/eJFGBs9nvA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=otcmdDqbO3BgNVDIQjfFoGOfE1ZWsLzcGji+fXHhb0vKcG9zOcgITXYee4v8ANzAn
	 aHjVJ1ylWAmQEqSwN7LtqrX+pBztWBOg+DW9sL6CO9y9iLCQ1Bhw8wku5tnCgCySaC
	 QUKdXUowsnkbgmxph8E6juidkpULLsH+PSvxC4vU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CB6EF80698; Mon,  8 Jan 2024 17:22:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 408F5F80679;
	Mon,  8 Jan 2024 17:22:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26802F80254; Sun,  7 Jan 2024 22:35:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [IPv6:2001:df5:b000:5::4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A86E7F800F5
	for <alsa-devel@alsa-project.org>; Sun,  7 Jan 2024 22:35:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A86E7F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=aqTvxNtL
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C30F92C0778;
	Mon,  8 Jan 2024 10:35:01 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1704663301;
	bh=TnYYe5Ik8V8NQEU6s3jXxwZQ8YygUV7ZxdlPvpcWlM8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=aqTvxNtLaeFT0CIoy0nSJHS3gI02IUvlfNf0UL+r6mfnKUZTNrvEZg4KrPyXmqzF7
	 fVgOXFjaxKT8IMQ5uXwt4BtpMtQTA3yzT6iKNdo2h9Z6duC1YEEROdBQNiZxTOR1UI
	 ptg8ziTloMj6SrIsFQ3TMbSXMqeWxMHFRP9dr0jAkcVDQ2EizIUGDd0AIJY5GiMc4A
	 uPtgkTZn3xaidTp4mntvflbIM4npJC+Y0/5Svm46OeRfsLQxFvnSjmiCxyuJXMvJEI
	 WVOyAgityYMm64UXwOuFigaOGVbXAAhZ9XVtKUYacsDuQ0P9DYa/tce0ig7kyGfJF5
	 GUURQmMgrMhdQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by
 svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B659b19050000>; Mon, 08 Jan 2024 10:35:01 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.40; Mon, 8 Jan 2024 10:35:01 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Mon, 8 Jan 2024 10:35:01 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.040; Mon, 8 Jan 2024 10:35:01 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konrad.dybcio@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>, Sean Anderson
	<sean.anderson@seco.com>
Subject: Re: [PATCH v2 0/4] reset: gpio: ASoC: shared GPIO resets
Thread-Topic: [PATCH v2 0/4] reset: gpio: ASoC: shared GPIO resets
Thread-Index: AQHaP/Aqq7L7gochO0ekRf3UAMpbALDOCO0A
Date: Sun, 7 Jan 2024 21:35:01 +0000
Message-ID: <d86f0d2c-40fc-44d2-94f6-e67068e55594@alliedtelesis.co.nz>
References: <20240105155918.279657-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240105155918.279657-1-krzysztof.kozlowski@linaro.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=CYB2G4jl c=1 sm=1 tr=0
 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10
 a=dEuoMetlWLkA:10 a=vE6nA0IPAAAA:8 a=6On8Lo5iK3YeLNhOxggA:9 a=QEXdDO2ut3YA:10
 a=KKAkSRfTAAAA:8 a=9xXEWPmocA81tVRg:21 a=_W_S_7VecoQA:10
 a=rVnDm9A_-c-k2ki-JAcA:9 a=_s8P6U4_B6QeRRtK5oEG:22 a=cvBusfyB2V15izCimMoJ:22
X-SEG-SpamProfiler-Score: 0
X-MailFrom: Chris.Packham@alliedtelesis.co.nz
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 325X2DHNTEN6GNSNNWG75BJNXHW7MIOJ
X-Message-ID-Hash: 325X2DHNTEN6GNSNNWG75BJNXHW7MIOJ
X-Mailman-Approved-At: Mon, 08 Jan 2024 16:21:52 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/325X2DHNTEN6GNSNNWG75BJNXHW7MIOJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgS3J6eXN6dG9mLA0KDQpPbiA2LzAxLzI0IDA0OjU5LCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KDQpIaSwNCg0KQ2hhbmdlcyBpbiB2Mg0KPT09PT09PT09PT09PQ0KMS4gd3NhODg0eC5j
OiBhZGQgbWlzc2luZyByZXR1cm4gaW4gd3NhODg0eF9nZXRfcmVzZXQoKSwgY29ycmVjdCBjb21t
ZW50Lg0KMi4gcWNvbSx3c2E4ODQwLnlhbWw6IGZpeCBvbmVPZiBzeW50YXguDQozLiByZXNldC9j
b3JlLmM6DQogICAtIFJldmlzZSBhcHByb2FjaCBiYXNlZCBvbiBCYXJ0b3N6IGNvbW1lbnRzOiBw
YXJzZSB0aGUgcmVzZXQtZ3Bpb3MgcGhhbmRsZQ0KICAgICB3aXRoIGFyZ3VtZW50cywgZG8gbm90
IHVzZSBkZXByZWNhdGVkIEFQSSBhbmQgZG8gbm90IHJlbHkgb24gZ3Bpb19kZXNjDQogICAgIHBv
aW50ZXIuDQogICAtIENyZWF0ZSBhIGxpc3Qgb2YgaW5zdGFudGlhdGVkIHBsYXRmb3JtIGRldmlj
ZXMgdG8gYXZvaWQgYW55IGR1cGxpY2F0ZXMuDQogICAtIEFmdGVyIGNyZWF0aW5nIHJlc2V0LWdw
aW8gcGxhdGZvcm0gZGV2aWNlLCB0cnkgdG8gZ2V0IG5ldyByZXNldCBjb250cm9sbGVyDQogICAg
IG9yIHJldHVybiBFUFJPQkVfREVGRVIuDQogICAtIERyb3AgdGhlICJjb29raWUiIG1lbWJlciBh
bmQgYWRkIG5ldyAib2ZfYXJncyIgdG8gInN0cnVjdA0KICAgICByZXNldF9jb250cm9sbGVyX2Rl
diIuDQo0LiByZXNldC1ncGlvLmM6DQogICAtIEZpeCBzbWF0Y2ggd2FybmluZyBvbiBwbGF0ZGF0
YSBldmFsdWF0aW9uLg0KICAgLSBQYXJzZSBHUElPIGFyZ3MgYW5kIHN0b3JlIHRoZW0gaW4gcmMu
b2ZfYXJncy4NCg0KRGVzY3JpcHRpb24NCj09PT09PT09PT09DQoNCldlIGhhdmUgYXQgbGVhc3Qg
ZmV3IGNhc2VzIHdoZXJlIGhhcmR3YXJlIGVuZ2luZWVycyBkZWNpZGVkIHRvIHVzZSBvbmUNCnBv
d2VyZG93bi9zaHV0ZG93bi9yZXNldCBHUElPIGxpbmUgZm9yIG11bHRpcGxlIGRldmljZXM6DQoN
Cg0KKGNwOiBsaW5rcyByZW1vdmVkIGR1ZSB0byBjb3JwIGVtYWlsIG11bmdpbmcgdGhlbSBhbmQg
bWFraW5nIHRoZW0gbG9vayBsaWtlIGEgcGhpc2hpbmcgYXR0ZW1wdCkNCg0KSSB0cnkgdG8gc29s
dmUgbXkgY2FzZSwgaG9wZWZ1bHkgQ2hyaXMnICgyKSwgcGFydGlhbGx5IFNlYW4ncyAoNCkgYW5k
IG1heWJlDQpIZWN0b3JzICg1KSwgdXNpbmcgUm9iJ3Mgc3VnZ2VzdGlvbjoNCg0KDQoNCihjcDog
bGluayByZW1vdmVkIGhlcmUpDQoNCg0KQmVzdCByZWdhcmRzLA0KS3J6eXN6dG9mDQoNCkNjOiBD
aHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+PG1haWx0bzpj
aHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQpDYzogQmFydG9zeiBHb2xhc3pld3Nr
aSA8YnJnbEBiZ2Rldi5wbD48bWFpbHRvOmJyZ2xAYmdkZXYucGw+DQpDYzogU2VhbiBBbmRlcnNv
biA8c2Vhbi5hbmRlcnNvbkBzZWNvLmNvbT48bWFpbHRvOnNlYW4uYW5kZXJzb25Ac2Vjby5jb20+
DQoNCktyenlzenRvZiBLb3psb3dza2kgKDQpOg0KICByZXNldDogZ3BpbzogQWRkIEdQSU8tYmFz
ZWQgcmVzZXQgY29udHJvbGxlcg0KICByZXNldDogSW5zdGFudGlhdGUgcmVzZXQgR1BJTyBjb250
cm9sbGVyIGZvciBzaGFyZWQgcmVzZXQtZ3Bpb3MNCiAgQVNvQzogZHQtYmluZGluZ3M6IHFjb20s
d3NhODg0MDogQWRkIHJlc2V0LWdwaW9zIGZvciBzaGFyZWQgbGluZQ0KICBBU29DOiBjb2RlY3M6
IHdzYTg4NHg6IEFsbG93IHNoYXJpbmcgcmVzZXQgR1BJTw0KDQogLi4uL2JpbmRpbmdzL3NvdW5k
L3Fjb20sd3NhODg0MC55YW1sICAgICAgICAgIHwgIDExICstDQogTUFJTlRBSU5FUlMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICsNCiBkcml2ZXJzL3Jlc2V0L0tjb25m
aWcgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDkgKw0KIGRyaXZlcnMvcmVzZXQvTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQogZHJpdmVycy9yZXNldC9jb3JlLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTc2ICsrKysrKysrKysrKysrKystLQ0KIGRyaXZl
cnMvcmVzZXQvcmVzZXQtZ3Bpby5jICAgICAgICAgICAgICAgICAgICB8IDEyMSArKysrKysrKysr
KysNCiBpbmNsdWRlL2xpbnV4L3Jlc2V0LWNvbnRyb2xsZXIuaCAgICAgICAgICAgICAgfCAgIDQg
Kw0KIHNvdW5kL3NvYy9jb2RlY3Mvd3NhODg0eC5jICAgICAgICAgICAgICAgICAgICB8ICA1MyAr
KysrKy0NCiA4IGZpbGVzIGNoYW5nZWQsIDM1NiBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMo
LSkNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9yZXNldC9yZXNldC1ncGlvLmMNCg0KDQoN
CkknbGwgdHJ5IGFuZCB0YWtlIHRoZXNlIGZvciBhIHNwaW4gb24gbXkgaGFyZHdhcmUuIEkgdGhp
bmsgSSdsbCBuZWVkIHRvIHVwZGF0ZSB0aGUgcGNhOTU0eCBtdXggZHJpdmVyIGFsb25nIHNpbWls
YXIgbGluZXMgdG8geW91ciBjaGFuZ2VzIHRvIHRoZSB3c2E4ODR4LiBEbyB5b3UgaGFwcGVuIHRv
IGhhdmUgYW4gZXhhbXBsZSBvZiB3aGF0IHRoZSByZXNldC1jb250cm9sbGVyIHVzYWdlIGxvb2tz
IGxpa2UgaW4gYSBkZXZpY2V0cmVlPyBJIGNhbiBwcm9iYWJseSBmaWd1cmUgaXQgb3V0IGJhc2Vk
IG9uIHRoZSBjb2RlIGJ1dCBJIGZpZ3VyZWQgSSdkIGFzayBqdXN0IGluIGNhc2UgeW91IGFscmVh
ZHkgaGFkIGFuIGV4YW1wbGUgaGFuZHkuDQo=
