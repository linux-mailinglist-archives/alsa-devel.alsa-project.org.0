Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5239111CFC6
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 15:28:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8BF316D6;
	Thu, 12 Dec 2019 15:27:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8BF316D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576160908;
	bh=LSuLduJ8D7DHAUSNPcFl9AC8qrRk4SNYPusw0lkHtoo=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qkAsEZYsPwXMmwy5hHYMP7jYRmTrVITVCM5w/rc+lQ5gfeB2KjaG1xNVq7B6tCYW/
	 UPcWtp7T0aZTeIcGyYZxil/tDa+3yFMFLL4uTRGx9gShBSrZEToB0cTH0BGLOH/WkC
	 xspi52IWiZfd5YcrjLKn4D7Nrp4gWKRTlGPFd76c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BA55F802C4;
	Thu, 12 Dec 2019 15:19:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1DC0F8020C; Thu, 12 Dec 2019 12:06:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
 by alsa1.perex.cz (Postfix) with ESMTP id 020C3F80139
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 12:06:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 020C3F80139
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
 LIVER,40,3)
Received: from 192.168.8.45
 by mg.richtek.com with MailGates ESMTP Server V5.0(11221:0:AUTH_RELAY)
 (envelope-from <jeff_chang@richtek.com>); Thu, 12 Dec 2019 19:05:13 +0800 (CST)
Received: from ex1.rt.l (192.168.8.44) by ex2.rt.l (192.168.8.45) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 12 Dec 2019 19:05:13 +0800
Received: from ex1.rt.l ([fe80::557d:30f0:a3f8:3efc]) by ex1.rt.l
 ([fe80::557d:30f0:a3f8:3efc%15]) with mapi id 15.00.1497.000; Thu, 12 Dec
 2019 19:05:13 +0800
From: =?utf-8?B?amVmZl9jaGFuZyjlvLXkuJbkvbMp?= <jeff_chang@richtek.com>
To: Jaroslav Kysela <perex@perex.cz>, Jeff Chang
 <richtek.jeff.chang@gmail.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Thread-Topic: [PATCH] ASoC: Add MediaTek MT6660 Speaker Amp Driver
Thread-Index: AQHVsMxKnUingQDq7kOh2OiLs82I06e1yEOAgACNe2A=
Date: Thu, 12 Dec 2019 11:05:13 +0000
Message-ID: <33393c67cee243a59fb0043a276f4e4a@ex1.rt.l>
References: <1576141937-13199-1-git-send-email-richtek.jeff.chang@gmail.com>
 <02c25504-dec5-4026-6e2b-d3763e70663a@perex.cz>
In-Reply-To: <02c25504-dec5-4026-6e2b-d3763e70663a@perex.cz>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.95.168]
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Dec 2019 15:19:28 +0100
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Add MediaTek MT6660 Speaker Amp
	Driver
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

RGVhciBKYXJzb2xhdjoNCg0KVGhhbmtzIGZvciB5b3VyIHJlcGx5Lg0KDQpJIHdpbGwgc2VuZCBh
IG5ldyBwYXRjaCBsYXRlci4NCg0KDQpUaGFua3MgJiBCUnMNCkplZmYgQ2hhbmcNClRlbCA4ODYt
My01NTI2Nzg5IEV4dCAyMzU3DQoxNEYsIE5vLiA4LCBUYWl5dWVuIDFzdCBzdC4sIFpodWJlaSBD
aXR5LA0KSHNpbmNodSBDb3VudHksIFRhaXdhbiAzMDI4OA0KDQoNCg0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IEphcm9zbGF2IEt5c2VsYSBbbWFpbHRvOnBlcmV4QHBlcmV4LmN6
XQ0KU2VudDogVGh1cnNkYXksIERlY2VtYmVyIDEyLCAyMDE5IDY6MzYgUE0NClRvOiBKZWZmIENo
YW5nIDxyaWNodGVrLmplZmYuY2hhbmdAZ21haWwuY29tPjsgbGdpcmR3b29kQGdtYWlsLmNvbQ0K
Q2M6IGJyb29uaWVAa2VybmVsLm9yZzsgdGl3YWlAc3VzZS5jb207IG1hdHRoaWFzLmJnZ0BnbWFp
bC5jb207IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBqZWZmX2NoYW5n
KOW8teS4luS9sykgPGplZmZfY2hhbmdAcmljaHRlay5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENI
XSBBU29DOiBBZGQgTWVkaWFUZWsgTVQ2NjYwIFNwZWFrZXIgQW1wIERyaXZlcg0KDQpEbmUgMTIu
IDEyLiAxOSB2IDEwOjEyIEplZmYgQ2hhbmcgbmFwc2FsKGEpOg0KPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBzbmRfa2NvbnRyb2xfbmV3IG10NjY2MF9jb21wb25lbnRfc25kX2NvbnRyb2xzW10gPSB7
DQo+ICtTT0NfU0lOR0xFX0VYVF9UTFYoIkRpZ2l0YWwgVm9sdW1lIiwgTVQ2NjYwX1JFR19WT0xf
Q1RSTCwgMCwgMjU1LA0KPiArICAgMSwgc25kX3NvY19nZXRfdm9sc3csIG10NjY2MF9jb21wb25l
bnRfcHV0X3ZvbHN3LA0KPiArICAgdm9sX2N0bF90bHYpLA0KPiArU09DX1NJTkdMRV9FWFQoIldE
VCBTd2l0Y2giLCBNVDY2NjBfUkVHX1dEVF9DVFJMLCA3LCAxLCAwLA0KPiArICAgICAgIHNuZF9z
b2NfZ2V0X3ZvbHN3LCBtdDY2NjBfY29tcG9uZW50X3B1dF92b2xzdyksDQo+ICtTT0NfU0lOR0xF
X0VYVCgiSGFyZF9DbGlwIFN3aXRjaCIsIE1UNjY2MF9SRUdfSENMSVBfQ1RSTCwgOCwgMSwgMCwN
Cj4gKyAgICAgICBzbmRfc29jX2dldF92b2xzdywgbXQ2NjYwX2NvbXBvbmVudF9wdXRfdm9sc3cp
LA0KPiArU09DX1NJTkdMRV9FWFQoIkNsaXAgU3dpdGNoIiwgTVQ2NjYwX1JFR19TUFNfQ1RSTCwg
MCwgMSwgMCwNCj4gKyAgICAgICBzbmRfc29jX2dldF92b2xzdywgbXQ2NjYwX2NvbXBvbmVudF9w
dXRfdm9sc3cpLA0KPiArU09DX1NJTkdMRV9FWFQoIkJvb3N0TW9kZSIsIE1UNjY2MF9SRUdfQlNU
X0NUUkwsIDAsIDMsIDAsDQo+ICsgICAgICAgc25kX3NvY19nZXRfdm9sc3csIG10NjY2MF9jb21w
b25lbnRfcHV0X3ZvbHN3KSwNCj4gK1NPQ19TSU5HTEVfRVhUKCJEUkUgU3dpdGNoIiwgTVQ2NjYw
X1JFR19EUkVfQ1RSTCwgMCwgMSwgMCwNCj4gKyAgICAgICBzbmRfc29jX2dldF92b2xzdywgbXQ2
NjYwX2NvbXBvbmVudF9wdXRfdm9sc3cpLA0KPiArU09DX1NJTkdMRV9FWFQoIkRDX1Byb3RlY3Qg
U3dpdGNoIiwNCj4gK01UNjY2MF9SRUdfRENfUFJPVEVDVF9DVFJMLCAzLCAxLCAwLA0KPiArc25k
X3NvY19nZXRfdm9sc3csIG10NjY2MF9jb21wb25lbnRfcHV0X3ZvbHN3KSwNCj4gK1NPQ19TSU5H
TEVfRVhUKCJhdWRpbyBpbnB1dCBzZWxlY3Rpb24iLCBNVDY2NjBfUkVHX0RBVEFPX1NFTCwgNiwg
MywgMCwNCj4gKyAgICAgICBzbmRfc29jX2dldF92b2xzdywgbXQ2NjYwX2NvbXBvbmVudF9wdXRf
dm9sc3cpLA0KPiArU09DX1NJTkdMRV9FWFQoIkRhdGEgT3V0cHV0IExlZnQgQ2hhbm5lbCBTZWxl
Y3Rpb24iLA0KPiArICAgICAgIE1UNjY2MF9SRUdfREFUQU9fU0VMLCAzLCA3LCAwLA0KPiArICAg
ICAgIHNuZF9zb2NfZ2V0X3ZvbHN3LCBtdDY2NjBfY29tcG9uZW50X3B1dF92b2xzdyksDQo+ICtT
T0NfU0lOR0xFX0VYVCgiRGF0YSBPdXRwdXQgUmlnaHQgQ2hhbm5lbCBTZWxlY3Rpb24iLA0KPiAr
ICAgICAgIE1UNjY2MF9SRUdfREFUQU9fU0VMLCAwLCA3LCAwLA0KPiArICAgICAgIHNuZF9zb2Nf
Z2V0X3ZvbHN3LCBtdDY2NjBfY29tcG9uZW50X3B1dF92b2xzdyksDQo+ICsvKiBmb3IgZGVidWcg
cHVycG9zZSAqLw0KPiArU09DX1NJTkdMRV9FWFQoIkhQRl9BVURfSU4gU3dpdGNoIiwgTVQ2NjYw
X1JFR19IUEZfQ1RSTCwgMCwgMSwgMCwNCj4gKyAgICAgICBzbmRfc29jX2dldF92b2xzdywgbXQ2
NjYwX2NvbXBvbmVudF9wdXRfdm9sc3cpLA0KPiArU09DX1NJTkdMRV9FWFQoIkFVRF9MT09QX0JB
Q0sgU3dpdGNoIiwgTVQ2NjYwX1JFR19QQVRIX0JZUEFTUywgNCwgMSwgMCwNCj4gKyAgICAgICBz
bmRfc29jX2dldF92b2xzdywgbXQ2NjYwX2NvbXBvbmVudF9wdXRfdm9sc3cpLA0KPiArU09DX1NJ
TkdMRV9FWFQoIk11dGUgU3dpdGNoIiwgTVQ2NjYwX1JFR19TWVNURU1fQ1RSTCwgMSwgMSwgMCwN
Cj4gKyAgICAgICBzbmRfc29jX2dldF92b2xzdywgbXQ2NjYwX2NvbXBvbmVudF9wdXRfdm9sc3cp
LA0KPiArU09DX1NJTkdMRV9FWFQoIkJ5cGFzcyBDUyBDb21wIFN3aXRjaCIsIE1UNjY2MF9SRUdf
UEFUSF9CWVBBU1MsIDIsIDEsIDAsDQo+ICsgICAgICAgc25kX3NvY19nZXRfdm9sc3csIG10NjY2
MF9jb21wb25lbnRfcHV0X3ZvbHN3KSwNCj4gK1NPQ19TSU5HTEVfRVhUKCJUMF9TRUwiLCBNVDY2
NjBfUkVHX0NBTElfVDAsIDAsIDcsIDAsDQo+ICsgICAgICAgc25kX3NvY19nZXRfdm9sc3csIE5V
TEwpLA0KPiArU09DX1NJTkdMRV9FWFQoIkNoaXBfUmV2IiwgU05EX1NPQ19OT1BNLCAwLCAxNiwg
MCwNCj4gKyAgICAgICBtdDY2NjBfY29tcG9uZW50X2dldF92b2xzdywgTlVMTCksDQoNClRoZSBj
b250cm9sIG5hbWVzIGxvb2tzIHJlYWxseSBzdHJhbmdlIGxpa2UgYWx3YXlzIGZvciB0aGUgQVNv
QyB0cmVlLiBXZSBzaG91bGQgdGFsayBhYm91dCBhIHN0YW5kYXJkaXphdGlvbiBoZXJlLiBBdCBs
ZWFzdCB1bmlmeSBzcGFjZXMsIHVuZGVyc2NvcmVzIGFuZCBzdWNoIGNoYXJhY3RlcnMgYW5kIGFi
YnJldmlhdGlvbnMuDQoNClRoYW5rcywNCkphcm9zbGF2DQoNCi0tDQpKYXJvc2xhdiBLeXNlbGEg
PHBlcmV4QHBlcmV4LmN6Pg0KTGludXggU291bmQgTWFpbnRhaW5lcjsgQUxTQSBQcm9qZWN0OyBS
ZWQgSGF0LCBJbmMuDQoqKioqKioqKioqKioqIEVtYWlsIENvbmZpZGVudGlhbGl0eSBOb3RpY2Ug
KioqKioqKioqKioqKioqKioqKioNCg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlz
IGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlk
ZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlIGV4ZW1wdCBmcm9t
IGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSBj
b252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlz
c2VtaW5hdGlvbiwgZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcg
b2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQg
cmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSBiZSB1bmxhd2Z1bC4g
SWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBi
ZWxpZXZlIHRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFz
ZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1h
aWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcg
YW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90IGRpc2Nsb3NlIHRo
ZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSEN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2
ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxt
YW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
