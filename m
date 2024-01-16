Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCF283DE6D
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jan 2024 17:17:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E53F01DC;
	Fri, 26 Jan 2024 17:17:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E53F01DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706285854;
	bh=m7wSxdVOaZ1i1jVeM8/JbhFQZmZwRKPRQYMQT50flwU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mjvSKOPMXI0++CESG2JT1pdebqiwo8OcR4wZTc814gZmB2A7WWPcUrhNkRS79nV9k
	 Cu8wMXyjz12D1RoX2ZwkQFIyAsn5uv+aKPU4vgB4xufuBbdGa/CO9lrM0X4ZGUzxe9
	 RcPws2IFF/tekBsWWcP2f8o1WWPUsx0GVsWMzBkU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D393F805F6; Fri, 26 Jan 2024 17:16:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DA42F805DF;
	Fri, 26 Jan 2024 17:16:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2330F801F5; Tue, 16 Jan 2024 20:58:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20ECDF800F5
	for <alsa-devel@alsa-project.org>; Tue, 16 Jan 2024 20:58:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20ECDF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=gwHVhC2C
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5834C2C02A8;
	Wed, 17 Jan 2024 08:58:13 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1705435093;
	bh=m7wSxdVOaZ1i1jVeM8/JbhFQZmZwRKPRQYMQT50flwU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=gwHVhC2C8PVwAw1SsadeAGITsha9gBemsoDBN3M5NGrIF0pmT9cn1uJUPjn+slUGC
	 TuvMsU4ACftQE4X+O2GhlTeIEswZ2W5EhRG8nuylzIETYgHFZszY556x/noevyfH7+
	 MyZ3iVOuyD39zhwtCyzrTtdbUnvnuczJPgedUZQUrKr5SqydQ7U8fnCyY+Nk3QOJMh
	 ZKjJbuVezl75h+aLzTWSVOvkDMPp1q2boLyhEPgP8AY5RM4zZz3ErsWI8Atp+QQDRJ
	 Y2Sv5qLBi/nMCGp8pK1VguaHEJ3y0bUl7O2eXTxOKXN/uuIGhGOVnLKyd7Y/VUgIf9
	 kyp7bLL5BJ+NA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by
 svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B65a6dfd50000>; Wed, 17 Jan 2024 08:58:13 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 17 Jan 2024 08:58:13 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.040; Wed, 17 Jan 2024 08:58:13 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Peter Rosin <peda@axentia.se>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>, Sean Anderson
	<sean.anderson@seco.com>
Subject: Re: [PATCH v3 5/5] i2c: muxes: pca954x: Allow sharing reset GPIO
Thread-Topic: [PATCH v3 5/5] i2c: muxes: pca954x: Allow sharing reset GPIO
Thread-Index: AQHaRXWBLMixCZ8WK0+mNOuBScg1h7DbubEAgABOIQA=
Date: Tue, 16 Jan 2024 19:58:12 +0000
Message-ID: <4c6c5d07-ac53-4da9-93e0-1286ca5eb44b@alliedtelesis.co.nz>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
 <20240112163608.528453-6-krzysztof.kozlowski@linaro.org>
 <800d202864c1730622a19998728c5a8b576d1931.camel@pengutronix.de>
In-Reply-To: <800d202864c1730622a19998728c5a8b576d1931.camel@pengutronix.de>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5E79E64E8AE744098FF4C08FB92D028@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=LZFCFQXi c=1 sm=1 tr=0
 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10
 a=IkcTkHD0fZMA:10 a=dEuoMetlWLkA:10 a=KKAkSRfTAAAA:8 a=62ntRvTiAAAA:8
 a=VwQbUJbxAAAA:8 a=vE6nA0IPAAAA:8 a=uLhZSfaJXi4u2qP_6tYA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=pToNdpNmrtiFLRE6bQ9Z:22 a=AjGcO6oz07-iQ99wixmX:22
 a=_s8P6U4_B6QeRRtK5oEG:22
X-SEG-SpamProfiler-Score: 0
X-MailFrom: Chris.Packham@alliedtelesis.co.nz
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KAYZKJXZBCWYGI45LRZL63SBQML2W5PL
X-Message-ID-Hash: KAYZKJXZBCWYGI45LRZL63SBQML2W5PL
X-Mailman-Approved-At: Fri, 26 Jan 2024 16:16:26 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KAYZKJXZBCWYGI45LRZL63SBQML2W5PL/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpPbiAxNy8wMS8yNCAwNDoxOCwgUGhpbGlwcCBaYWJlbCB3cm90ZToNCj4gT24gRnIsIDIwMjQt
MDEtMTIgYXQgMTc6MzYgKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+PiBGcm9t
OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+Pg0K
Pj4gU29tZSBoYXJkd2FyZSBkZXNpZ25zIHdpdGggbXVsdGlwbGUgUENBOTU0eCBkZXZpY2VzIHVz
ZSBhIHJlc2V0IEdQSU8NCj4+IGNvbm5lY3RlZCB0byBhbGwgdGhlIG11eGVzLiBTdXBwb3J0IHRo
aXMgY29uZmlndXJhdGlvbiBieSBtYWtpbmcgdXNlIG9mDQo+PiB0aGUgcmVzZXQgY29udHJvbGxl
ciBmcmFtZXdvcmsgd2hpY2ggY2FuIGRlYWwgd2l0aCB0aGUgc2hhcmVkIHJlc2V0DQo+PiBHUElP
cy4gRmFsbCBiYWNrIHRvIHRoZSBvbGQgR1BJTyBkZXNjcmlwdG9yIG1ldGhvZCBpZiB0aGUgcmVz
ZXQNCj4+IGNvbnRyb2xsZXIgZnJhbWV3b3JrIGlzIG5vdCBlbmFibGVkLg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5u
ej4NCj4+IEFja2VkLWJ5OiBQZXRlciBSb3NpbiA8cGVkYUBheGVudGlhLnNlPg0KPj4gUmV2aWV3
ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9y
Zz4NCj4+IExpbms6IGh0dHBzOi8vc2Nhbm1haWwudHJ1c3R3YXZlLmNvbS8/Yz0yMDk4OCZkPThw
Nm01VGZpMnlZSldZVjl4WUdjWW56N1VZeEI2V1RHVFBrbUd1N2I4QSZ1PWh0dHBzJTNhJTJmJTJm
bG9yZSUyZWtlcm5lbCUyZW9yZyUyZnIlMmYyMDI0MDEwODA0MTkxMyUyZTcwNzgtMS1jaHJpcyUy
ZXBhY2toYW0lNDBhbGxpZWR0ZWxlc2lzJTJlY28lMmVueg0KPj4gU2lnbmVkLW9mZi1ieTogS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPj4NCj4+
IC0tLQ0KPj4NCj4+IElmIHByZXZpb3VzIHBhdGNoZXMgYXJlIGZpbmUsIHRoZW4gdGhpcyBjb21t
aXQgaXMgaW5kZXBlbmRlbnQgYW5kIGNvdWxkDQo+PiBiZSB0YWtlbiB2aWEgSTJDLg0KPj4NCj4+
IENjOiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+
PiBDYzogQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4+IENjOiBTZWFuIEFu
ZGVyc29uIDxzZWFuLmFuZGVyc29uQHNlY28uY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvaTJj
L211eGVzL2kyYy1tdXgtcGNhOTU0eC5jIHwgNDYgKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL211eGVzL2kyYy1tdXgtcGNhOTU0eC5j
IGIvZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1wY2E5NTR4LmMNCj4+IGluZGV4IDIyMTkwNjIx
MDRmYi4uMTcwMmU4ZDQ5YjkxIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9pMmMvbXV4ZXMvaTJj
LW11eC1wY2E5NTR4LmMNCj4+ICsrKyBiL2RyaXZlcnMvaTJjL211eGVzL2kyYy1tdXgtcGNhOTU0
eC5jDQo+PiBAQCAtNDksNiArNDksNyBAQA0KPj4gICAjaW5jbHVkZSA8bGludXgvcG0uaD4NCj4+
ICAgI2luY2x1ZGUgPGxpbnV4L3Byb3BlcnR5Lmg+DQo+PiAgICNpbmNsdWRlIDxsaW51eC9yZWd1
bGF0b3IvY29uc3VtZXIuaD4NCj4+ICsjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4NCj4+ICAgI2lu
Y2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4+ICAgI2luY2x1ZGUgPGxpbnV4L3NwaW5sb2NrLmg+DQo+
PiAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9tdXgvbXV4Lmg+DQo+PiBAQCAtMTAyLDYgKzEwMyw5
IEBAIHN0cnVjdCBwY2E5NTR4IHsNCj4+ICAgCXVuc2lnbmVkIGludCBpcnFfbWFzazsNCj4+ICAg
CXJhd19zcGlubG9ja190IGxvY2s7DQo+PiAgIAlzdHJ1Y3QgcmVndWxhdG9yICpzdXBwbHk7DQo+
PiArDQo+PiArCXN0cnVjdCBncGlvX2Rlc2MgKnJlc2V0X2dwaW87DQo+PiArCXN0cnVjdCByZXNl
dF9jb250cm9sICpyZXNldF9jb250Ow0KPj4gICB9Ow0KPj4gICANCj4+ICAgLyogUHJvdmlkZSBz
cGVjcyBmb3IgdGhlIE1BWDczNXgsIFBDQTk1NHggYW5kIFBDQTk4NHggdHlwZXMgd2Uga25vdyBh
Ym91dCAqLw0KPj4gQEAgLTQ3Nyw2ICs0ODEsMzUgQEAgc3RhdGljIGludCBwY2E5NTR4X2luaXQo
c3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwgc3RydWN0IHBjYTk1NHggKmRhdGEpDQo+PiAgIAly
ZXR1cm4gcmV0Ow0KPj4gICB9DQo+PiAgIA0KPj4gK3N0YXRpYyBpbnQgcGNhOTU0eF9nZXRfcmVz
ZXQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgcGNhOTU0eCAqZGF0YSkNCj4+ICt7DQo+PiAr
CWRhdGEtPnJlc2V0X2NvbnQgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X29wdGlvbmFsX3NoYXJl
ZChkZXYsIE5VTEwpOw0KPj4gKwlpZiAoSVNfRVJSKGRhdGEtPnJlc2V0X2NvbnQpKQ0KPj4gKwkJ
cmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGRhdGEtPnJlc2V0X2NvbnQpLA0KPj4g
KwkJCQkgICAgICJGYWlsZWQgdG8gZ2V0IHJlc2V0XG4iKTsNCj4+ICsJZWxzZSBpZiAoZGF0YS0+
cmVzZXRfY29udCkNCj4+ICsJCXJldHVybiAwOw0KPj4gKw0KPj4gKwkvKg0KPj4gKwkgKiBmYWxs
YmFjayB0byBsZWdhY3kgcmVzZXQtZ3Bpb3MNCj4+ICsJICovDQo+IGRldm1fcmVzZXRfY29udHJv
bF9nZXRfb3B0aW9uYWxfc2hhcmVkKCkgd29uJ3QgcmV0dXJuIE5VTEwgaWYgdGhlDQo+ICJyZXNl
dC1ncGlvcyIgcHJvcGVydHkgaXMgZm91bmQgaW4gdGhlIGRldmljZSB0cmVlLCBzbyB0aGUgR1BJ
Tw0KPiBmYWxsYmFjayBpcyBkZWFkIGNvZGUuDQoNCkhtbSwgSSB3YXMgYXR0ZW1wdGluZyB0byBo
YW5kbGUgdGhlIGNhc2Ugd2hlcmUgQ09ORklHX1JFU0VUX0dQSU8gd2Fzbid0IA0Kc2V0IG9yIHRo
ZSByZXNldCBjb3JlIHdhc24ndCBlbmFibGVkLiBJdCBkb2Vzbid0IGFwcGVhciB0aGF0IHRoZSBs
YXR0ZXIgDQppcyBldmVuIHBvc3NpYmxlIHNvIG5vIG5lZWQgdG8gd29ycnkgYWJvdXQgdGhhdC4g
Rm9yIHRoZSBmb3JtZXIgaXQgbG9va3MgDQpsaWtlIHdlJ2QgZ2V0IC1FUFJPQkVfREVGRVIuIEkg
Y291bGQgY2hhbmdlIHRvIGNoZWNrIGZvciB0aGF0IG9yIGp1c3QgDQpyZW1vdmUgdGhlIEdQSU8g
ZmFsbGJhY2sgZW50aXJlbHkuIEFueSBwcmVmZXJlbmNlPw0KDQo+DQo+PiArCWRhdGEtPnJlc2V0
X2dwaW8gPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbChkZXYsICJyZXNldCIsIEdQSU9EX09VVF9I
SUdIKTsNCj4+ICsJaWYgKElTX0VSUihkYXRhLT5yZXNldF9ncGlvKSkgew0KPj4gKwkJcmV0dXJu
IGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGRhdGEtPnJlc2V0X2dwaW8pLA0KPj4gKwkJCQkg
ICAgICJGYWlsZWQgdG8gZ2V0IHJlc2V0IGdwaW8iKTsNCj4+ICsJfQ0KPj4gKw0KPj4gKwlyZXR1
cm4gMDsNCj4+ICt9DQo+PiArDQo+IHJlZ2FyZHMNCj4gUGhpbGlwcA==
