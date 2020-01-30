Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA26814D59F
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 05:32:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EDF21674;
	Thu, 30 Jan 2020 05:32:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EDF21674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580358779;
	bh=dV5AwsaNJ/g2KDiS6I0IdYnqfSsDrtzHQAynFkq56rg=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BCAuGuKe2UDvf/5T77Ok0LirukjUq6Dt+3QMt2+wreUtJrIwXsRRHsXefxBQkFDmW
	 BuNx5AWYiT4qX7oEhNorheiUsI7LCB/zfCgflLMrfltDJqqtpHBrjx/RWX6yySThI/
	 NW45uffkG+O8Yoa2orehkljV5hVzgOeW8LH8NZQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A3CCF80082;
	Thu, 30 Jan 2020 05:31:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C08B5F80082; Thu, 30 Jan 2020 05:31:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1480F80082
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 05:31:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1480F80082
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 00U4UvjT019749,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTEXMB06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 00U4UvjT019749
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jan 2020 12:30:57 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 30 Jan 2020 12:30:57 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 30 Jan 2020 12:30:57 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f]) by
 RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f%6]) with mapi id
 15.01.1779.005; Thu, 30 Jan 2020 12:30:57 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: Sameer Pujar <spujar@nvidia.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "perex@perex.cz" <perex@perex.cz>
Thread-Topic: [PATCH] ASoC: rt5659: add S32_LE format
Thread-Index: AQHVz1lcdsPxKVEECkqlysxhWjZRR6fyj7wAgANoewCADLS34A==
Date: Thu, 30 Jan 2020 04:30:57 +0000
Message-ID: <67328e51035e4eb5a6a78c3156e5d11f@realtek.com>
References: <1579501059-27936-1-git-send-email-spujar@nvidia.com>
 <74a42452-f19c-1175-9928-da12ccad621d@nvidia.com>
 <c700f22c-a053-7f39-dddf-41abe52cad77@nvidia.com>
In-Reply-To: <c700f22c-a053-7f39-dddf-41abe52cad77@nvidia.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [60.250.204.174]
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt5659: add S32_LE format
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

QWNrZWQtYnk6IE9kZXIgQ2hpb3UgPG9kZXJfY2hpb3VAcmVhbHRlay5jb20+DQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2FtZWVyIFB1amFyIFttYWlsdG86c3B1amFy
QG52aWRpYS5jb21dDQo+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAyMiwgMjAyMCA2OjI3IFBN
DQo+IFRvOiBPZGVyIENoaW91OyB0aXdhaUBzdXNlLmNvbTsgcGVyZXhAcGVyZXguY3oNCj4gQ2M6
IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
Zw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBBU29DOiBydDU2NTk6IGFkZCBTMzJfTEUgZm9ybWF0
DQo+IA0KPiBIaSBSZXZpZXdlcnMsDQo+IA0KPiBLaW5kbHkgcmV2aWV3LiBUaGFua3MuDQo+IA0K
PiBPbiAxLzIwLzIwMjAgMTE6NTQgQU0sIFNhbWVlciBQdWphciB3cm90ZToNCj4gPiBSZW1vdmlu
ZyBCYXJkKGJhcmRsaWFvQHJlYWx0ZWsuY29tKSBmcm9tICJ0byIgbGlzdCBzaW5jZSBJIGFtIGdl
dHRpbmcNCj4gPiB1bmRlbGl2ZXJlZCBtZXNzYWdlLg0KPiA+DQo+ID4gT2RlciwNCj4gPiBQbGVh
c2UgYWRkIHJpZ2h0IGZvbGtzIGFzIHlvdSBmZWVsIG5lY2Vzc2FyeS4gVGhhbmtzLg0KPiA+DQo+
ID4gT24gMS8yMC8yMDIwIDExOjQ3IEFNLCBTYW1lZXIgUHVqYXIgd3JvdGU6DQo+ID4+IEFMQzU2
NTkgc3VwcG9ydHMgbWF4aW11bSBkYXRhIGxlbmd0aCBvZiAyNC1iaXQuIEN1cnJlbnRseSBkcml2
ZXINCj4gPj4gc3VwcG9ydHMNCj4gPj4gUzI0X0xFIHdoaWNoIGlzIGEgMzItYml0IGNvbnRhaW5l
ciB3aXRoIHZhbGlkIGRhdGEgaW4gWzIzOjBdIGFuZCAwcw0KPiA+PiBpbiBNU0IuDQo+ID4+IFMy
NF8zTEUgaXMgbm90IGNvbW1vbmx5IHVzZWQgYW5kIGlzIGhhcmQgdG8gZmluZCBhdWRpbyBzdHJl
YW1zIHdpdGggdGhpcw0KPiA+PiBmb3JtYXQuIEFsc28gbWFueSBTb0MgSFcgZG8gbm90IHN1cHBv
cnQgUzI0X0xFIGFuZCBTMzJfTEUgaXMgdXNlZCBpbg0KPiA+PiBnZW5lcmFsLiBUaGUgMjQtYml0
IGRhdGEgY2FuIGJlIHJlcHJlc2VudGVkIGluIFMzMl9MRSBbMzE6OF0gYW5kIDBzIGFyZQ0KPiA+
PiBwYWRkZWQgaW4gTFNCLg0KPiA+Pg0KPiA+PiBUaGlzIHBhdGNoIGFkZHMgUzMyX0xFIHRvIEFM
QzU2NTkgZHJpdmVyIGFuZCBkYXRhIGxlbmd0aCBmb3IgdGhpcyBpcyBzZXQNCj4gPj4gdG8gMjQg
YXMgcGVyIGNvZGVjJ3MgbWF4aW11bSBkYXRhIGxlbmd0aCBzdXBwb3J0LiBUaGlzIGhlbHBzIHRv
IHBsYXkNCj4gPj4gMjQtYml0IGF1ZGlvLCBwYWNrZWQgaW4gUzMyX0xFLCBvbiBIVyB3aGljaCBk
byBub3Qgc3VwcG9ydCBTMjRfTEUuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFNhbWVlciBQ
dWphciA8c3B1amFyQG52aWRpYS5jb20+DQo+ID4+IC0tLQ0KPiA+PiDCoCBzb3VuZC9zb2MvY29k
ZWNzL3J0NTY1OS5jIHwgNCArKystDQo+ID4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9j
b2RlY3MvcnQ1NjU5LmMgYi9zb3VuZC9zb2MvY29kZWNzL3J0NTY1OS5jDQo+ID4+IGluZGV4IGZj
NzRkZDYzLi5mOTEwZGRmIDEwMDY0NA0KPiA+PiAtLS0gYS9zb3VuZC9zb2MvY29kZWNzL3J0NTY1
OS5jDQo+ID4+ICsrKyBiL3NvdW5kL3NvYy9jb2RlY3MvcnQ1NjU5LmMNCj4gPj4gQEAgLTMzMzks
NiArMzMzOSw3IEBAIHN0YXRpYyBpbnQgcnQ1NjU5X2h3X3BhcmFtcyhzdHJ1Y3QNCj4gPj4gc25k
X3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwNCj4gPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHZhbF9s
ZW4gfD0gUlQ1NjU5X0kyU19ETF8yMDsNCj4gPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0K
PiA+PiDCoMKgwqDCoMKgIGNhc2UgMjQ6DQo+ID4+ICvCoMKgwqAgY2FzZSAzMjoNCj4gPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIHZhbF9sZW4gfD0gUlQ1NjU5X0kyU19ETF8yNDsNCj4gPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIGJyZWFrOw0KPiA+PiDCoMKgwqDCoMKgIGNhc2UgODoNCj4gPj4gQEAgLTM3
MzMsNyArMzczNCw4IEBAIHN0YXRpYyBpbnQgcnQ1NjU5X3Jlc3VtZShzdHJ1Y3QNCj4gPj4gc25k
X3NvY19jb21wb25lbnQgKmNvbXBvbmVudCkNCj4gPj4gwqAgwqAgI2RlZmluZSBSVDU2NTlfU1RF
UkVPX1JBVEVTIFNORFJWX1BDTV9SQVRFXzgwMDBfMTkyMDAwDQo+ID4+IMKgICNkZWZpbmUgUlQ1
NjU5X0ZPUk1BVFMgKFNORFJWX1BDTV9GTVRCSVRfUzE2X0xFIHwNCj4gPj4gU05EUlZfUENNX0ZN
VEJJVF9TMjBfM0xFIHwgXA0KPiA+PiAtwqDCoMKgwqDCoMKgwqAgU05EUlZfUENNX0ZNVEJJVF9T
MjRfTEUgfCBTTkRSVl9QQ01fRk1UQklUX1M4KQ0KPiA+PiArwqDCoMKgwqDCoMKgwqAgU05EUlZf
UENNX0ZNVEJJVF9TMjRfTEUgfCBTTkRSVl9QQ01fRk1UQklUX1MzMl9MRSB8IFwNCj4gPj4gK8Kg
wqDCoMKgwqDCoMKgIFNORFJWX1BDTV9GTVRCSVRfUzgpDQo+ID4+IMKgIMKgIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgc25kX3NvY19kYWlfb3BzIHJ0NTY1OV9haWZfZGFpX29wcyA9IHsNCj4gPj4gwqDC
oMKgwqDCoCAuaHdfcGFyYW1zID0gcnQ1NjU5X2h3X3BhcmFtcywNCj4gDQo+IA0KPiAtLS0tLS1Q
bGVhc2UgY29uc2lkZXIgdGhlIGVudmlyb25tZW50IGJlZm9yZSBwcmludGluZyB0aGlzIGUtbWFp
bC4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2Et
ZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21h
aWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
