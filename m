Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBA3181C79
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 16:38:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AE251663;
	Wed, 11 Mar 2020 16:38:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AE251663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583941134;
	bh=u63TEdJ10J2us4hSAuYiOHvOIMguRMztS88+drjyDZw=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IqfxJywKPL9wj3zvCvYYTw5ESwYZDayJNjYh3eoOyXw3TNwYMmH1Hsv9EMXnPmXfZ
	 kSbzdbS75f1YbuK1PDjaosyT5akwYLeGs5deReaSjMCQzgQd3QRdt+Rfwa7ZXVbQAI
	 4Fwqy5vtc5nXYxOuYnbk/myzsAWQOGTUGQbLdz/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAE2BF800B5;
	Wed, 11 Mar 2020 16:37:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AB65F801EB; Wed, 11 Mar 2020 16:37:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10219F800BE
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 16:37:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10219F800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="HjGJVrAW"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02BFSPxx026781; Wed, 11 Mar 2020 16:37:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=u63TEdJ10J2us4hSAuYiOHvOIMguRMztS88+drjyDZw=;
 b=HjGJVrAW31p7gwahbFPcZxSlROIX/swYnqb52tJgFeutkdeArCT5ZYgmjy/2sFfGt1ek
 DpapKTeYa9pi+gDpXKA2KbJvXErQh6rUgdaiW3M1X3TXpA7HjuUCzD2zsnOAXz1s6LRY
 jENYvFKNYjA3OGTkkG9+11n2fMI67fG8ahuNh9YMlzuhqkDkFD3jD34XbitHG6Jw4wPA
 sZs55nMDeUqViHtIYCQKEahtQPbUc6Yx3sBu3nkE7wIdvQW2UUCmoc5uml+C7EzGOOLf
 uMIhwKGpQmS8juckdm0HhAJ1JVO4rQ1+tj22dm0UzX2SNxtcJNLWD52bboXM6ZINT+WC gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ym1mh3ufu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Mar 2020 16:37:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C8AF6100034;
 Wed, 11 Mar 2020 16:37:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8897A2BE238;
 Wed, 11 Mar 2020 16:37:01 +0100 (CET)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 11 Mar
 2020 16:37:01 +0100
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
 SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
 15.00.1347.000; Wed, 11 Mar 2020 16:37:01 +0100
From: Olivier MOYSAN <olivier.moysan@st.com>
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
 <tiwai@suse.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "robh@kernel.org" <robh@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] ASoC: dt-bindings: stm32: convert spdfirx to
 json-schema
Thread-Topic: [PATCH v3] ASoC: dt-bindings: stm32: convert spdfirx to
 json-schema
Thread-Index: AQHVzVgef9G3dBVxwE2KXAseUjc6eKhDylsA
Date: Wed, 11 Mar 2020 15:37:01 +0000
Message-ID: <d792a2b8-3b59-f04e-c24d-06185d60c734@st.com>
References: <20200117170352.16040-1-olivier.moysan@st.com>
In-Reply-To: <20200117170352.16040-1-olivier.moysan@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE5E72739C615C4AACA966C364D359B6@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-11_05:2020-03-11,
 2020-03-11 signatures=0
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

SGksDQpLaW5kIHJlbWluZGVyIGZvciB0aGlzIHBhdGNoLg0KVGhhbmtzDQpPbGl2aWVyDQoNCk9u
IDEvMTcvMjAgNjowMyBQTSwgT2xpdmllciBNb3lzYW4gd3JvdGU6DQo+IENvbnZlcnQgdGhlIFNU
TTMyIFNQRElGUlggYmluZGluZ3MgdG8gRFQgc2NoZW1hIGZvcm1hdCB1c2luZyBqc29uLXNjaGVt
YS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogT2xpdmllciBNb3lzYW4gPG9saXZpZXIubW95c2FuQHN0
LmNvbT4NCj4gLS0tDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gQWRkICJhZGRpdGlvbmFsUHJvcGVy
dGllczogZmFsc2UiDQo+IC0gQWxzbyBjaGFuZ2UgbWluSXRlbXMgdG8gMiBmb3IgZG1hcyBwcm9w
ZXJ0eSwgYXMgYm90aCBETUFzIGFyZSByZXF1aXJlZC4NCj4NCj4gQ2hhbmdlcyBpbiB2MzoNCj4g
LSBEcm9wIG1pbkl0ZW1zL21heEl0ZW1zIGZvciBkbWFzIHByb3BlcnR5LCByZW1vdmUgcmVmIHRv
IHN0bTMyLWRtYS50eHQuDQo+IC0tLQ0KPiAgIC4uLi9iaW5kaW5ncy9zb3VuZC9zdCxzdG0zMi1z
cGRpZnJ4LnR4dCAgICAgICB8IDU2IC0tLS0tLS0tLS0tLS0NCj4gICAuLi4vYmluZGluZ3Mvc291
bmQvc3Qsc3RtMzItc3BkaWZyeC55YW1sICAgICAgfCA4MCArKysrKysrKysrKysrKysrKysrDQo+
ICAgMiBmaWxlcyBjaGFuZ2VkLCA4MCBpbnNlcnRpb25zKCspLCA1NiBkZWxldGlvbnMoLSkNCj4g
ICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nv
dW5kL3N0LHN0bTMyLXNwZGlmcngudHh0DQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9zdCxzdG0zMi1zcGRpZnJ4LnlhbWwNCj4N
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9z
dCxzdG0zMi1zcGRpZnJ4LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
b3VuZC9zdCxzdG0zMi1zcGRpZnJ4LnR4dA0KPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4g
aW5kZXggMzM4MjZmMjQ1OWZhLi4wMDAwMDAwMDAwMDANCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3N0LHN0bTMyLXNwZGlmcngudHh0DQo+ICsrKyAvZGV2
L251bGwNCj4gQEAgLTEsNTYgKzAsMCBAQA0KPiAtU1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyIFMv
UERJRiByZWNlaXZlciAoU1BESUZSWCkuDQo+IC0NCj4gLVRoZSBTUERJRlJYIHBlcmlwaGVyYWws
IGlzIGRlc2lnbmVkIHRvIHJlY2VpdmUgYW4gUy9QRElGIGZsb3cgY29tcGxpYW50IHdpdGgNCj4g
LUlFQy02MDk1OCBhbmQgSUVDLTYxOTM3Lg0KPiAtDQo+IC1SZXF1aXJlZCBwcm9wZXJ0aWVzOg0K
PiAtICAtIGNvbXBhdGlibGU6IHNob3VsZCBiZSAic3Qsc3RtMzJoNy1zcGRpZnJ4Ig0KPiAtICAt
IHJlZzogY3B1IERBSSBJUCBiYXNlIGFkZHJlc3MgYW5kIHNpemUNCj4gLSAgLSBjbG9ja3M6IG11
c3QgY29udGFpbiBhbiBlbnRyeSBmb3Iga2NsayAodXNlZCBhcyBTL1BESUYgc2lnbmFsIHJlZmVy
ZW5jZSkNCj4gLSAgLSBjbG9jay1uYW1lczogbXVzdCBjb250YWluICJrY2xrIg0KPiAtICAtIGlu
dGVycnVwdHM6IGNwdSBEQUkgaW50ZXJydXB0IGxpbmUNCj4gLSAgLSBkbWFzOiBETUEgc3BlY2lm
aWVycyBmb3IgYXVkaW8gZGF0YSBETUEgYW5kIGllYyBjb250cm9sIGZsb3cgRE1BDQo+IC0gICAg
U2VlIFNUTTMyIERNQSBiaW5kaW5ncywgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2RtYS9zdG0zMi1kbWEudHh0DQo+IC0gIC0gZG1hLW5hbWVzOiB0d28gZG1hcyBoYXZlIHRvIGJl
IGRlZmluZWQsICJyeCIgYW5kICJyeC1jdHJsIg0KPiAtDQo+IC1PcHRpb25hbCBwcm9wZXJ0aWVz
Og0KPiAtICAtIHJlc2V0czogUmVmZXJlbmNlIHRvIGEgcmVzZXQgY29udHJvbGxlciBhc3NlcnRp
bmcgdGhlIFNQRElGUlgNCj4gLQ0KPiAtVGhlIGRldmljZSBub2RlIHNob3VsZCBjb250YWluIG9u
ZSAncG9ydCcgY2hpbGQgbm9kZSB3aXRoIG9uZSBjaGlsZCAnZW5kcG9pbnQnDQo+IC1ub2RlLCBh
Y2NvcmRpbmcgdG8gdGhlIGJpbmRpbmdzIGRlZmluZWQgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzLw0KPiAtZ3JhcGgudHh0Lg0KPiAtDQo+IC1FeGFtcGxlOg0KPiAtc3BkaWZy
eDogc3BkaWZyeEA0MDAwNDAwMCB7DQo+IC0JY29tcGF0aWJsZSA9ICJzdCxzdG0zMmg3LXNwZGlm
cngiOw0KPiAtCXJlZyA9IDwweDQwMDA0MDAwIDB4NDAwPjsNCj4gLQljbG9ja3MgPSA8JnJjYyBT
UERJRlJYX0NLPjsNCj4gLQljbG9jay1uYW1lcyA9ICJrY2xrIjsNCj4gLQlpbnRlcnJ1cHRzID0g
PDk3PjsNCj4gLQlkbWFzID0gPCZkbWFtdXgxIDIgOTMgMHg0MDAgMHgwPiwNCj4gLQkgICAgICAg
PCZkbWFtdXgxIDMgOTQgMHg0MDAgMHgwPjsNCj4gLQlkbWEtbmFtZXMgPSAicngiLCAicngtY3Ry
bCI7DQo+IC0JcGluY3RybC0wID0gPCZzcGRpZnJ4X3BpbnM+Ow0KPiAtCXBpbmN0cmwtbmFtZXMg
PSAiZGVmYXVsdCI7DQo+IC0NCj4gLQlzcGRpZnJ4X3BvcnQ6IHBvcnQgew0KPiAtCQljcHVfZW5k
cG9pbnQ6IGVuZHBvaW50IHsNCj4gLQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmY29kZWNfZW5kcG9p
bnQ+Ow0KPiAtCQl9Ow0KPiAtCX07DQo+IC19Ow0KPiAtDQo+IC1zcGRpZl9pbjogc3BkaWYtaW4g
ew0KPiAtCWNvbXBhdGlibGUgPSAibGludXgsc3BkaWYtZGlyIjsNCj4gLQ0KPiAtCWNvZGVjX3Bv
cnQ6IHBvcnQgew0KPiAtCQljb2RlY19lbmRwb2ludDogZW5kcG9pbnQgew0KPiAtCQkJcmVtb3Rl
LWVuZHBvaW50ID0gPCZjcHVfZW5kcG9pbnQ+Ow0KPiAtCQl9Ow0KPiAtCX07DQo+IC19Ow0KPiAt
DQo+IC1zb3VuZGNhcmQgew0KPiAtCWNvbXBhdGlibGUgPSAiYXVkaW8tZ3JhcGgtY2FyZCI7DQo+
IC0JZGFpcyA9IDwmc3BkaWZyeF9wb3J0PjsNCj4gLX07DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvc3Qsc3RtMzItc3BkaWZyeC55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3N0LHN0bTMyLXNwZGlmcngu
eWFtbA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmI3Zjdk
YzQ1MjIzMQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb3VuZC9zdCxzdG0zMi1zcGRpZnJ4LnlhbWwNCj4gQEAgLTAsMCArMSw4MCBA
QA0KPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1D
bGF1c2UpDQo+ICslWUFNTCAxLjINCj4gKy0tLQ0KPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvc2NoZW1hcy9zb3VuZC9zdCxzdG0zMi1zcGRpZnJ4LnlhbWwjDQo+ICskc2NoZW1hOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gKw0KPiArdGl0bGU6
IFNUTWljcm9lbGVjdHJvbmljcyBTVE0zMiBTL1BESUYgcmVjZWl2ZXIgKFNQRElGUlgpDQo+ICsN
Cj4gK21haW50YWluZXJzOg0KPiArICAtIE9saXZpZXIgTW95c2FuIDxvbGl2aWVyLm1veXNhbkBz
dC5jb20+DQo+ICsNCj4gK2Rlc2NyaXB0aW9uOiB8DQo+ICsgIFRoZSBTUERJRlJYIHBlcmlwaGVy
YWwsIGlzIGRlc2lnbmVkIHRvIHJlY2VpdmUgYW4gUy9QRElGIGZsb3cgY29tcGxpYW50IHdpdGgN
Cj4gKyAgSUVDLTYwOTU4IGFuZCBJRUMtNjE5MzcuDQo+ICsNCj4gK3Byb3BlcnRpZXM6DQo+ICsg
IGNvbXBhdGlibGU6DQo+ICsgICAgZW51bToNCj4gKyAgICAgIC0gc3Qsc3RtMzJoNy1zcGRpZnJ4
DQo+ICsNCj4gKyAgIiNzb3VuZC1kYWktY2VsbHMiOg0KPiArICAgIGNvbnN0OiAwDQo+ICsNCj4g
KyAgcmVnOg0KPiArICAgIG1heEl0ZW1zOiAxDQo+ICsNCj4gKyAgY2xvY2tzOg0KPiArICAgIG1h
eEl0ZW1zOiAxDQo+ICsNCj4gKyAgY2xvY2stbmFtZXM6DQo+ICsgICAgaXRlbXM6DQo+ICsgICAg
ICAtIGNvbnN0OiBrY2xrDQo+ICsNCj4gKyAgaW50ZXJydXB0czoNCj4gKyAgICBtYXhJdGVtczog
MQ0KPiArDQo+ICsgIGRtYXM6DQo+ICsgICAgaXRlbXM6DQo+ICsgICAgICAtIGRlc2NyaXB0aW9u
OiBhdWRpbyBkYXRhIGNhcHR1cmUgRE1BDQo+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBJRUMgc3Rh
dHVzIGJpdHMgY2FwdHVyZSBETUENCj4gKw0KPiArICBkbWEtbmFtZXM6DQo+ICsgICAgaXRlbXM6
DQo+ICsgICAgICAtIGNvbnN0OiByeA0KPiArICAgICAgLSBjb25zdDogcngtY3RybA0KPiArDQo+
ICsgIHJlc2V0czoNCj4gKyAgICBtYXhJdGVtczogMQ0KPiArDQo+ICtyZXF1aXJlZDoNCj4gKyAg
LSBjb21wYXRpYmxlDQo+ICsgIC0gIiNzb3VuZC1kYWktY2VsbHMiDQo+ICsgIC0gcmVnDQo+ICsg
IC0gY2xvY2tzDQo+ICsgIC0gY2xvY2stbmFtZXMNCj4gKyAgLSBpbnRlcnJ1cHRzDQo+ICsgIC0g
ZG1hcw0KPiArICAtIGRtYS1uYW1lcw0KPiArDQo+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFs
c2UNCj4gKw0KPiArZXhhbXBsZXM6DQo+ICsgIC0gfA0KPiArICAgICNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+DQo+ICsgICAgI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL2Nsb2NrL3N0bTMybXAxLWNsa3MuaD4NCj4gKyAgICBzcGRpZnJ4OiBzcGRpZnJ4
QDQwMDA0MDAwIHsNCj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJzdCxzdG0zMmg3LXNwZGlmcngi
Ow0KPiArICAgICAgICAjc291bmQtZGFpLWNlbGxzID0gPDA+Ow0KPiArICAgICAgICByZWcgPSA8
MHg0MDAwNDAwMCAweDQwMD47DQo+ICsgICAgICAgIGNsb2NrcyA9IDwmcmNjIFNQRElGX0s+Ow0K
PiArICAgICAgICBjbG9jay1uYW1lcyA9ICJrY2xrIjsNCj4gKyAgICAgICAgaW50ZXJydXB0cyA9
IDxHSUNfU1BJIDk3IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiArICAgICAgICBkbWFzID0gPCZk
bWFtdXgxIDIgOTMgMHg0MDAgMHgwPiwNCj4gKyAgICAgICAgICAgICAgIDwmZG1hbXV4MSAzIDk0
IDB4NDAwIDB4MD47DQo+ICsgICAgICAgIGRtYS1uYW1lcyA9ICJyeCIsICJyeC1jdHJsIjsNCj4g
KyAgICAgICAgcGluY3RybC0wID0gPCZzcGRpZnJ4X3BpbnM+Ow0KPiArICAgICAgICBwaW5jdHJs
LW5hbWVzID0gImRlZmF1bHQiOw0KPiArICAgIH07DQo+ICsNCj4gKy4uLg0K
