Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B75CE2AFD
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 09:22:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2DFD1666;
	Thu, 24 Oct 2019 09:21:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2DFD1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571901747;
	bh=8aiJRltnIv0+bmX5tCp5gxoSTXfjt7eKcWMXj0oijrA=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M24YFFjJSyLTMOD2h8tuEYuYNBJwnH1NoqFHFItv1SQkDgbup/15rSZSO/qhmMb+f
	 ShPymA893aiNeP0f0GIALimLpzv6RXoYzUOWxe2ZDMIhSwl+gZPpMNkZ3Qe31CmPEU
	 o/uA/NhBT0+AvHnROLu/rPSZSA07n5N1QYoKn1zI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3552FF80377;
	Thu, 24 Oct 2019 09:20:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADECFF8036B; Thu, 24 Oct 2019 09:20:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BA9EF80137
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 09:20:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BA9EF80137
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x9O7KK2a031046,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x9O7KK2a031046
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 24 Oct 2019 15:20:20 +0800
Received: from RTEXMB03.realtek.com.tw (172.21.6.96) by
 RTITCASV01.realtek.com.tw (172.21.6.18) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Thu, 24 Oct 2019 15:20:19 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 24 Oct 2019 15:20:19 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::6d88:58e2:6d4b:ff7c]) by
 RTEXMB01.realtek.com.tw ([fe80::6d88:58e2:6d4b:ff7c%13]) with mapi id
 15.01.1779.005; Thu, 24 Oct 2019 15:20:19 +0800
From: Kailang <kailang@realtek.com>
To: Aaron Ma <aaron.ma@canonical.com>, Takashi Iwai <tiwai@suse.de>
Thread-Topic: [PATCH] ALSA: hda/realtek - Fix 2 front mics of codec 0x623
Thread-Index: AQHViO7vxXHEn3Xl7Ee6N1/g4hdxKqdmTdyAgAGbrzD//5F4gIAB6clQ
Date: Thu, 24 Oct 2019 07:20:19 +0000
Message-ID: <ed97b6a8bd9445ecb48bc763d9aaba7a@realtek.com>
References: <20191022153855.14368-1-aaron.ma@canonical.com>
 <s5hpniodaq4.wl-tiwai@suse.de> <848ebd7fd86e4c05936e70f500f718e9@realtek.com>
 <892889ae-0ce1-fbf6-d19f-50a5686e84c2@canonical.com>
In-Reply-To: <892889ae-0ce1-fbf6-d19f-50a5686e84c2@canonical.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
Content-Type: multipart/mixed;
 boundary="_002_ed97b6a8bd9445ecb48bc763d9aaba7arealtekcom_"
MIME-Version: 1.0
Cc: "hui.wang@canonical.com" <hui.wang@canonical.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda/realtek - Fix 2 front mics of
	codec 0x623
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

--_002_ed97b6a8bd9445ecb48bc763d9aaba7arealtekcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgVGFrYXNoaSwNCg0KQXR0YWNoIHBhdGNoIHdhcyBzdXBwb3J0IEFMQzYyMy4NCg0KQlIsDQpL
YWlsYW5nDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWFyb24gTWEg
PGFhcm9uLm1hQGNhbm9uaWNhbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyMywg
MjAxOSA2OjA2IFBNDQo+IFRvOiBLYWlsYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPjsgVGFrYXNo
aSBJd2FpIDx0aXdhaUBzdXNlLmRlPg0KPiBDYzogcGVyZXhAcGVyZXguY3o7IGh1aS53YW5nQGNh
bm9uaWNhbC5jb207IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsNCj4gbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBBTFNBOiBoZGEvcmVhbHRl
ayAtIEZpeCAyIGZyb250IG1pY3Mgb2YgY29kZWMgMHg2MjMNCj4gDQo+IE9uIDEwLzIzLzE5IDQ6
NDQgUE0sIEthaWxhbmcgd3JvdGU6DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+PiBGcm9tOiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+DQo+ID4+IFNl
bnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyMywgMjAxOSAxMjowOCBBTQ0KPiA+PiBUbzogQWFyb24g
TWEgPGFhcm9uLm1hQGNhbm9uaWNhbC5jb20+DQo+ID4+IENjOiBwZXJleEBwZXJleC5jejsgS2Fp
bGFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT47DQo+ID4+IGh1aS53YW5nQGNhbm9uaWNhbC5jb207
IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsNCj4gPj4gbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZw0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBBTFNBOiBoZGEvcmVhbHRlayAtIEZp
eCAyIGZyb250IG1pY3Mgb2YgY29kZWMNCj4gPj4gMHg2MjMNCj4gPj4NCj4gPj4gT24gVHVlLCAy
MiBPY3QgMjAxOSAxNzozODo1NSArMDIwMCwNCj4gPj4gQWFyb24gTWEgd3JvdGU6DQo+ID4+Pg0K
PiA+Pj4gVGhlc2UgMiBUaGlua0NlbnRyZXMgaW5zdGFsbGVkIGEgbmV3IHJlYWx0ZWsgY29kZWMg
SUQgMHg2MjMsIGl0IGhhcw0KPiA+Pj4gMiBmcm9udCBtaWNzIHdpdGggdGhlIHNhbWUgbG9jYXRp
b24gb24gcGluIDB4MTggYW5kIDB4MTkuDQo+ID4+Pg0KPiA+Pj4gQXBwbHkgZml4dXAgQUxDMjgz
X0ZJWFVQX0hFQURTRVRfTUlDIHRvIGNoYW5nZSAxIGZyb250IG1pYyBsb2NhdGlvbg0KPiA+Pj4g
dG8gcmlnaHQsIHRoZW4gcHVsc2VhdWRpbyBjYW4gaGFuZGxlIHRoZW0uDQo+ID4+PiBPbmUgIkZy
b250IE1pYyIgYW5kIG9uZSAiTWljIiB3aWxsIGJlIHNob3duLCBhbmQgYXVkaW8gb3V0cHV0IHdv
cmtzDQo+ID4+PiBmaW5lLg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IEFhcm9uIE1hIDxh
YXJvbi5tYUBjYW5vbmljYWwuY29tPg0KPiA+Pg0KPiA+PiBJJ2QgbGlrZSB0byBoYXZlIEthaWxh
bmcncyByZXZpZXcgYWJvdXQgdGhlIG5ldyBjb2RlYyBiZWZvcmUgYXBwbHlpbmcuDQo+ID4+DQo+
ID4+IEthaWxhbmcsIGNvdWxkIHlvdSB0YWtlIGEgbG9vaz8NCj4gPiBPSy4NCj4gPiBJIHdpbGwg
cG9zdCB5b3UgdGhlIHBhdGNoIGZvciBBTEM2MjMgY29kZWMgdG9tb3Jyb3cuDQo+ID4gVGhhbmtz
Lg0KPiANCj4gQ2MgbWUgdG9vLg0KPiANCj4gVGhhbmsgeW91Lg0KPiBBYXJvbg0KPiANCj4gPg0K
PiA+Pg0KPiA+Pg0KPiA+PiB0aGFua3MsDQo+ID4+DQo+ID4+IFRha2FzaGkNCj4gPj4NCj4gPj4+
IC0tLQ0KPiA+Pj4gIHNvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIHwgMyArKysNCj4gPj4+
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdp
dCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jDQo+ID4+PiBiL3NvdW5kL3BjaS9oZGEv
cGF0Y2hfcmVhbHRlay5jIGluZGV4IGIwMDBiMzZhYzNjNi4uYzM0ZDhiNDM1ZjU4DQo+ID4+PiAx
MDA2NDQNCj4gPj4+IC0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jDQo+ID4+PiAr
KysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYw0KPiA+Pj4gQEAgLTcxODYsNiArNzE4
Niw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3BjaV9xdWlyaw0KPiA+Pj4gYWxjMjY5X2Zp
eHVwX3RibFtdDQo+ID4+ID0gew0KPiA+Pj4gIAlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgzMTJm
LCAiVGhpbmtDZW50cmUgU3RhdGlvbiIsDQo+ID4+IEFMQzI5NF9GSVhVUF9MRU5PVk9fTUlDX0xP
Q0FUSU9OKSwNCj4gPj4+ICAJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MzEzYywgIlRoaW5rQ2Vu
dHJlIFN0YXRpb24iLA0KPiA+PiBBTEMyOTRfRklYVVBfTEVOT1ZPX01JQ19MT0NBVElPTiksDQo+
ID4+PiAgCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDMxNTEsICJUaGlua0NlbnRyZSBTdGF0aW9u
IiwNCj4gPj4+IEFMQzI4M19GSVhVUF9IRUFEU0VUX01JQyksDQo+ID4+PiArCVNORF9QQ0lfUVVJ
UksoMHgxN2FhLCAweDMxNzgsICJUaGlua0NlbnRyZSBTdGF0aW9uIiwNCj4gPj4gQUxDMjgzX0ZJ
WFVQX0hFQURTRVRfTUlDKSwNCj4gPj4+ICsJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MzE3Niwg
IlRoaW5rQ2VudHJlIFN0YXRpb24iLA0KPiA+Pj4gK0FMQzI4M19GSVhVUF9IRUFEU0VUX01JQyks
DQo+ID4+PiAgCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDM5MDIsICJMZW5vdm8gRTUwLTgwIiwN
Cj4gPj4gQUxDMjY5X0ZJWFVQX0RNSUNfVEhJTktQQURfQUNQSSksDQo+ID4+PiAgCVNORF9QQ0lf
UVVJUksoMHgxN2FhLCAweDM5NzcsICJJZGVhUGFkIFMyMTAiLA0KPiA+PiBBTEMyODNfRklYVVBf
SU5UX01JQyksDQo+ID4+PiAgCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDM5NzgsICJMZW5vdm8g
QjUwLTcwIiwNCj4gPj4+IEFMQzI2OV9GSVhVUF9ETUlDX1RISU5LUEFEX0FDUEkpLCBAQCAtOTE4
Nyw2ICs5MTg5LDcgQEAgc3RhdGljDQo+ID4+IGNvbnN0IHN0cnVjdCBoZGFfZGV2aWNlX2lkIHNu
ZF9oZGFfaWRfcmVhbHRla1tdID0gew0KPiA+Pj4gIAlIREFfQ09ERUNfRU5UUlkoMHgxMGVjMDI5
OCwgIkFMQzI5OCIsIHBhdGNoX2FsYzI2OSksDQo+ID4+PiAgCUhEQV9DT0RFQ19FTlRSWSgweDEw
ZWMwMjk5LCAiQUxDMjk5IiwgcGF0Y2hfYWxjMjY5KSwNCj4gPj4+ICAJSERBX0NPREVDX0VOVFJZ
KDB4MTBlYzAzMDAsICJBTEMzMDAiLCBwYXRjaF9hbGMyNjkpLA0KPiA+Pj4gKwlIREFfQ09ERUNf
RU5UUlkoMHgxMGVjMDYyMywgIkFMQzYyMyIsIHBhdGNoX2FsYzI2OSksDQo+ID4+PiAgCUhEQV9D
T0RFQ19SRVZfRU5UUlkoMHgxMGVjMDg2MSwgMHgxMDAzNDAsICJBTEM2NjAiLA0KPiA+PiBwYXRj
aF9hbGM4NjEpLA0KPiA+Pj4gIAlIREFfQ09ERUNfRU5UUlkoMHgxMGVjMDY2MCwgIkFMQzY2MC1W
RCIsIHBhdGNoX2FsYzg2MXZkKSwNCj4gPj4+ICAJSERBX0NPREVDX0VOVFJZKDB4MTBlYzA4NjEs
ICJBTEM4NjEiLCBwYXRjaF9hbGM4NjEpLA0KPiA+Pj4gLS0NCj4gPj4+IDIuMTcuMQ0KPiA+Pj4N
Cj4gPj4NCj4gPj4gLS0tLS0tUGxlYXNlIGNvbnNpZGVyIHRoZSBlbnZpcm9ubWVudCBiZWZvcmUg
cHJpbnRpbmcgdGhpcyBlLW1haWwuDQo=

--_002_ed97b6a8bd9445ecb48bc763d9aaba7arealtekcom_
Content-Type: application/octet-stream; name="0000-add-support-alc623.patch"
Content-Description: 0000-add-support-alc623.patch
Content-Disposition: attachment; filename="0000-add-support-alc623.patch";
	size=1990; creation-date="Thu, 24 Oct 2019 07:18:58 GMT";
	modification-date="Thu, 24 Oct 2019 07:18:35 GMT"
Content-Transfer-Encoding: base64

RnJvbSAzMTAzZjY2ODMwOTNlNDczNjhkODc2NzFmMzcyNmYxYTExZjllZjI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMjQgT2N0IDIwMTkgMTU6MTM6MzIgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEFkZCBzdXBwb3J0IGZvciBBTEM2MjMKClN1cHBvcnQgbmV3IGNvZGVj
IEFMQzYyMy4KClNpZ25lZC1vZmYtYnk6IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNv
bT4KCmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3Bj
aS9oZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4IDA4NWEyZjk1ZTA3Ni4uYTBjMjM3Y2MxM2Q0IDEw
MDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kv
aGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAtNDA5LDYgKzQwOSw5IEBAIHN0YXRpYyB2b2lkIGFsY19m
aWxsX2VhcGRfY29lZihzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAljYXNlIDB4MTBlYzA2NzI6
CiAJCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4ZCwgMCwgMTw8MTQpOyAvKiBFQVBEIEN0
cmwgKi8KIAkJYnJlYWs7CisJY2FzZSAweDEwZWMwNjIzOgorCQlhbGNfdXBkYXRlX2NvZWZfaWR4
KGNvZGVjLCAweDE5LCAxPDwxMywgMCk7CisJCWJyZWFrOwogCWNhc2UgMHgxMGVjMDY2ODoKIAkJ
YWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHg3LCAzPDwxMywgMCk7CiAJCWJyZWFrOwpAQCAt
MjkyMCw2ICsyOTIzLDcgQEAgZW51bSB7CiAJQUxDMjY5X1RZUEVfQUxDMjI1LAogCUFMQzI2OV9U
WVBFX0FMQzI5NCwKIAlBTEMyNjlfVFlQRV9BTEMzMDAsCisJQUxDMjY5X1RZUEVfQUxDNjIzLAog
CUFMQzI2OV9UWVBFX0FMQzcwMCwKIH07CiAKQEAgLTI5NTUsNiArMjk1OSw3IEBAIHN0YXRpYyBp
bnQgYWxjMjY5X3BhcnNlX2F1dG9fY29uZmlnKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCWNh
c2UgQUxDMjY5X1RZUEVfQUxDMjI1OgogCWNhc2UgQUxDMjY5X1RZUEVfQUxDMjk0OgogCWNhc2Ug
QUxDMjY5X1RZUEVfQUxDMzAwOgorCWNhc2UgQUxDMjY5X1RZUEVfQUxDNjIzOgogCWNhc2UgQUxD
MjY5X1RZUEVfQUxDNzAwOgogCQlzc2lkcyA9IGFsYzI2OV9zc2lkczsKIAkJYnJlYWs7CkBAIC04
MDE3LDYgKzgwMjIsOSBAQCBzdGF0aWMgaW50IHBhdGNoX2FsYzI2OShzdHJ1Y3QgaGRhX2NvZGVj
ICpjb2RlYykKIAkJc3BlYy0+Y29kZWNfdmFyaWFudCA9IEFMQzI2OV9UWVBFX0FMQzMwMDsKIAkJ
c3BlYy0+Z2VuLm1peGVyX25pZCA9IDA7IC8qIG5vIGxvb3BiYWNrIG9uIEFMQzMwMCAqLwogCQli
cmVhazsKKwljYXNlIDB4MTBlYzA2MjM6CisJCXNwZWMtPmNvZGVjX3ZhcmlhbnQgPSBBTEMyNjlf
VFlQRV9BTEM2MjM7CisJCWJyZWFrOwogCWNhc2UgMHgxMGVjMDcwMDoKIAljYXNlIDB4MTBlYzA3
MDE6CiAJY2FzZSAweDEwZWMwNzAzOgpAQCAtOTIxOCw2ICs5MjI2LDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBoZGFfZGV2aWNlX2lkIHNuZF9oZGFfaWRfcmVhbHRla1tdID0gewogCUhEQV9DT0RF
Q19FTlRSWSgweDEwZWMwMjk4LCAiQUxDMjk4IiwgcGF0Y2hfYWxjMjY5KSwKIAlIREFfQ09ERUNf
RU5UUlkoMHgxMGVjMDI5OSwgIkFMQzI5OSIsIHBhdGNoX2FsYzI2OSksCiAJSERBX0NPREVDX0VO
VFJZKDB4MTBlYzAzMDAsICJBTEMzMDAiLCBwYXRjaF9hbGMyNjkpLAorCUhEQV9DT0RFQ19FTlRS
WSgweDEwZWMwNjIzLCAiQUxDNjIzIiwgcGF0Y2hfYWxjMjY5KSwKIAlIREFfQ09ERUNfUkVWX0VO
VFJZKDB4MTBlYzA4NjEsIDB4MTAwMzQwLCAiQUxDNjYwIiwgcGF0Y2hfYWxjODYxKSwKIAlIREFf
Q09ERUNfRU5UUlkoMHgxMGVjMDY2MCwgIkFMQzY2MC1WRCIsIHBhdGNoX2FsYzg2MXZkKSwKIAlI
REFfQ09ERUNfRU5UUlkoMHgxMGVjMDg2MSwgIkFMQzg2MSIsIHBhdGNoX2FsYzg2MSksCg==

--_002_ed97b6a8bd9445ecb48bc763d9aaba7arealtekcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_002_ed97b6a8bd9445ecb48bc763d9aaba7arealtekcom_--
