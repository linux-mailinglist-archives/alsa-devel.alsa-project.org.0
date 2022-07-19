Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A154579C8E
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 14:40:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DEF616D9;
	Tue, 19 Jul 2022 14:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DEF616D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658234454;
	bh=ETMpmzJg6IfMA9Rra/gyQD83utdYYdZ2Itqobxk2WwQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mx/bK6AccLtl76rE50ttIbfEAIZT3fL4wDv4Efe2lSXxMNDjL18v+iScRSNTgkQLd
	 +BHHVv5eW+VTt+sXJ/oUsHjgxD46Es9f0o4N8qWvZAPlVEBSg7UZKZCzb076ISvrTy
	 OPsQ2JbvRBQ1GyhGgBH4At9k528+xdIUrTYm0Cr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AB5CF80224;
	Tue, 19 Jul 2022 14:39:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48E4AF80125; Tue, 19 Jul 2022 14:39:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HTML_MESSAGE,PRX_BODY_135,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1DE9F80125
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 14:39:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1DE9F80125
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-314-LGKyWH96MHuXfDktH0oilQ-1; Tue, 19 Jul 2022 13:39:43 +0100
X-MC-Unique: LGKyWH96MHuXfDktH0oilQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.36; Tue, 19 Jul 2022 13:39:42 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.036; Tue, 19 Jul 2022 13:39:42 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Shengjiu Wang' <shengjiu.wang@gmail.com>
Subject: RE: [PATCH -next 2/5] ASoC: fsl_asrc: force cast the asrc_format type
Thread-Topic: [PATCH -next 2/5] ASoC: fsl_asrc: force cast the asrc_format type
Thread-Index: AQHYm1RF9VBLG0gK5ky/ItlmeeUnS62FdfSA///0CICAABRvQP//+YgAgAAnNdA=
Date: Tue, 19 Jul 2022 12:39:42 +0000
Message-ID: <c9231becb2cd4e2999ec631f9d2171c3@AcuMS.aculab.com>
References: <1658222864-25378-1-git-send-email-shengjiu.wang@nxp.com>
 <1658222864-25378-3-git-send-email-shengjiu.wang@nxp.com>
 <f2609401c8834e8bbe926200bfc87971@AcuMS.aculab.com>
 <YtaEpf6Cd7KH7wH4@sirena.org.uk>
 <20cfcc8e59a74166846cff028cd2c4e8@AcuMS.aculab.com>
 <CAA+D8AO6P2AcOJ+E97Y1=P72Qa1wjtMGMneWnsP+VcdnCzzYuw@mail.gmail.com>
In-Reply-To: <CAA+D8AO6P2AcOJ+E97Y1=P72Qa1wjtMGMneWnsP+VcdnCzzYuw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Z3Jyci4uLiB0b3AtcG9zdGluZyBiZWNhdXNlIG91dGx1Y2sgaXMgcmVhbGx5IHN0dXBpZCA6LSgN
Cg0KVGhlIGRlZmluaXRpb24gc2VlbXMgdG8gYmU6DQp0eXBlZGVmIGludCBfX2JpdHdpc2U8aHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTktcmM3L0MvaWRlbnQvX19iaXR3aXNl
PiBzbmRfcGNtX2Zvcm1hdF90PGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE5
LXJjNy9DL2lkZW50L3NuZF9wY21fZm9ybWF0X3Q+Ow0KI2RlZmluZSBTTkRSVl9QQ01fRk9STUFU
X1M4PGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE5LXJjNy9DL2lkZW50L1NO
RFJWX1BDTV9GT1JNQVRfUzg+ICAgICgoX19mb3JjZTxodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC92NS4xOS1yYzcvQy9pZGVudC9fX2ZvcmNlPiBzbmRfcGNtX2Zvcm1hdF90PGh0dHBz
Oi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE5LXJjNy9DL2lkZW50L3NuZF9wY21fZm9y
bWF0X3Q+KSAwKQ0KI2RlZmluZSBTTkRSVl9QQ01fRk9STUFUX1U4PGh0dHBzOi8vZWxpeGlyLmJv
b3RsaW4uY29tL2xpbnV4L3Y1LjE5LXJjNy9DL2lkZW50L1NORFJWX1BDTV9GT1JNQVRfVTg+ICAg
ICgoX19mb3JjZTxodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xOS1yYzcvQy9p
ZGVudC9fX2ZvcmNlPiBzbmRfcGNtX2Zvcm1hdF90PGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L3Y1LjE5LXJjNy9DL2lkZW50L3NuZF9wY21fZm9ybWF0X3Q+KSAxKQ0KI2RlZmluZSBT
TkRSVl9QQ01fRk9STUFUX1MxNl9MRTxodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92
NS4xOS1yYzcvQy9pZGVudC9TTkRSVl9QQ01fRk9STUFUX1MxNl9MRT4gICAgICAgICgoX19mb3Jj
ZTxodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xOS1yYzcvQy9pZGVudC9fX2Zv
cmNlPiBzbmRfcGNtX2Zvcm1hdF90PGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1
LjE5LXJjNy9DL2lkZW50L3NuZF9wY21fZm9ybWF0X3Q+KSAyKQ0KLi4uDQooZ29lcyBhd2F5IGFu
ZCBsb29rcyB1cCBfX2JpdHdJc2UpDQoNCkkgdGhpbmsgSeKAmWQgYWRkOg0KI2RlZmluZSBzbmRf
cGNtX2Zvcm1hdCh2YWwpICgoX19mb3JjZSBzbmRfcGNtX2Zvcm1hdF90KSh2YWwpKQ0KYW5kIHVz
ZSB0aGF0IHRvIHJlbW92ZSBtb3N0IG9mIHRoZSBjYXN0cy4NCkJ1dCB0aGUgb25lcyB3aGVyZSB5
b3UgaGF2ZSAodTMyICopJnh4eCBhcmUgb25seSB2YWxpZCBiZWNhdXNlIHUzMiBhbmQgaW50IGFy
ZSB0aGUgc2FtZSBzaXplLg0KVGhhdCBkb2VzIHNvcnQgb2YgaGFwcGVuIHRvIGJlIHRydWUsIGJ1
dCBzb21lb25lIG1pZ2h0IGxvb2sgYXQgYWxsIHRoZSB2YWx1ZXMgYW5kDQpkZWNpZGUgdGhhdCB1
OCBpcyBiaWcgZW5vdWdoLg0KQWZ0ZXIgd2hpY2ggdGhlIGNvZGUgd2lsbCBzdGlsbCBjb21waWxl
LCBidXQgdGhlIGRhdGEgYXJlYXMgZ2V0IGNvcnJ1cHRlZC4NClNvIHlvdSByZWFsbHkgbmVlZCB0
byB1c2UgYSB1MzIg4oCYdGVtcOKAmSB2YXJpYWJsZS4NCg0KSXQgd291bGQgYWxsIGJlIHNsaWdo
dGx5IGxlc3MgcHJvYmxlbWF0aWMgaWYgdGhlIOKAmGZvcmNl4oCZIGNhc3RzIGNvdWxkIGJlIHNw
YXJzZSBvbmx5DQooaWUgbm90IHNlZW4gYnkgdGhlIGNvbXBpbGVyKSDigJMgc28gdGhlIGNvbXBp
bGVyIHdvdWxkIGRvIHRoZSB0eXBlIGNoZWNraW5nLg0KDQogICAgICAgICAgICAgICAgRGF2aWQN
Cg0KRnJvbTogU2hlbmdqaXUgV2FuZyA8c2hlbmdqaXUud2FuZ0BnbWFpbC5jb20+DQpTZW50OiAx
OSBKdWx5IDIwMjIgMTI6MDcNClRvOiBEYXZpZCBMYWlnaHQgPERhdmlkLkxhaWdodEBBQ1VMQUIu
Q09NPg0KQ2M6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz47IFNoZW5naml1IFdhbmcg
PHNoZW5naml1LndhbmdAbnhwLmNvbT47IFhpdWJvLkxlZUBnbWFpbC5jb207IGZlc3RldmFtQGdt
YWlsLmNvbTsgbmljb2xlb3RzdWthQGdtYWlsLmNvbTsgbGdpcmR3b29kQGdtYWlsLmNvbTsgcGVy
ZXhAcGVyZXguY3o7IHRpd2FpQHN1c2UuY29tOyBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7
IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnDQpTdWJqZWN0OiBSZTogW1BBVENIIC1uZXh0IDIvNV0gQVNvQzogZnNsX2FzcmM6IGZvcmNl
IGNhc3QgdGhlIGFzcmNfZm9ybWF0IHR5cGUNCg0KDQoNCk9uIFR1ZSwgSnVsIDE5LCAyMDIyIGF0
IDY6MzQgUE0gRGF2aWQgTGFpZ2h0IDxEYXZpZC5MYWlnaHRAYWN1bGFiLmNvbTxtYWlsdG86RGF2
aWQuTGFpZ2h0QGFjdWxhYi5jb20+PiB3cm90ZToNCkZyb206IE1hcmsgQnJvd24NCj4gU2VudDog
MTkgSnVseSAyMDIyIDExOjE3DQo+DQo+IE9uIFR1ZSwgSnVsIDE5LCAyMDIyIGF0IDEwOjAxOjU0
QU0gKzAwMDAsIERhdmlkIExhaWdodCB3cm90ZToNCj4gPiBGcm9tOiBTaGVuZ2ppdSBXYW5nDQo+
DQo+ID4gPiAtIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAiZnNsLGFzcmMtZm9ybWF0
IiwgJmFzcmMtPmFzcmNfZm9ybWF0KTsNCj4gPiA+ICsgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91
MzIobnAsICJmc2wsYXNyYy1mb3JtYXQiLCAodTMyICopJmFzcmMtPmFzcmNfZm9ybWF0KTsNCj4N
Cj4gPiBVZ2csIHlvdSByZWFsbHkgc2hvdWxkbid0IG5lZWQgdG8gZG8gdGhhdC4NCj4gPiBJdCBt
ZWFucyB0aGF0IHNvbWV0aGluZyBpcyBiYWRseSB3cm9uZyBzb21ld2hlcmUuDQo+ID4gQ2FzdGlu
ZyBwb2ludGVycyB0byBpbnRlZ2VyIHR5cGVzIGlzIGp1c3QgYXNraW5nIGZvciBhIGJ1Zy4NCj4N
Cj4gVGhhdCdzIGNhc3Rpbmcgb25lIHBvaW50ZXIgdHlwZSB0byBhbm90aGVyIHBvaW50ZXIgdHlw
ZS4NCg0KSXQgaXMgY2FzdGluZyB0aGUgYWRkcmVzcyBvZiBzb21lIHR5cGUgdG8gYSAndTMyICon
Lg0KVGhpcyB3aWxsIHRoZW4gYmUgZGVyZWZlcmVuY2VkIGJ5IHRoZSBjYWxsZWQgZnVuY3Rpb24u
DQpTbyB0aGUgb3JpZ2luYWwgdHlwZSBiZXR0ZXIgYmUgMzIgYml0cy4NCg0KSSdtIGFsc28gZ3Vl
c3NpbmcgdGhhdCBzcGFyc2Ugd2FzIGNvbXBsYWluaW5nIGFib3V0IGVuZGlhbm5lc3M/DQpJdCBp
c24ndCBhdCBhbGwgY2xlYXIgdGhhdCB0aGVzZSBjYXN0cyBhY3R1YWxseSBmaXggaXQuDQpUaGUg
c3BhcnNlIGlzIGNvbXBsYWluaW5nIGFib3V0IHRoZSBzbmRfcGNtX2Zvcm1hdF90IGNhc3QgdG8g
dTMyL2ludCB0eXBlLg0KDQpUaGUgY29kZSBpbiBpbmNsdWRlL3NvdW5kL3BjbS5oIGFsc28gZG9l
cyBzdWNoIF9fZm9yY2UgY2FzdC4NCiNkZWZpbmUgX1NORFJWX1BDTV9GTVRCSVQoZm10KSAgICAg
ICAgICAoMVVMTCA8PCAoX19mb3JjZSBpbnQpU05EUlZfUENNX0ZPUk1BVF8jI2ZtdCkNCg0KVGhl
IGNoYW5nZSBJIGhhdmUgbWFkZSBkb2VzIG5vdCBjYXVzZSBhbiBpc3N1ZS4NCg0KQmVzdCByZWdh
cmRzDQpXYW5nIHNoZW5naml1DQoNCihNYXJrOiBZb3UnbGwgYmUgZ2xhZCB0byBoZWFyIHRoYXQg
dGhlIG9mZmljZSBhaXJjb24gaXMNCmJyb2tlbiBhZ2FpbiAtIHR3byB3ZWVrcyBsZWFkIHRpbWUg
b24gdGhlIHNwYXJlIHBhcnQuKQ0KDQogICAgICAgIERhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRk
cmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBN
SzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg0KLQ0KUmVnaXN0
ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBL
ZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K
