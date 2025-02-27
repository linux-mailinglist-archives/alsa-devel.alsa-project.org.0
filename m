Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6918DA47CC1
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Feb 2025 13:00:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A910860358;
	Thu, 27 Feb 2025 12:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A910860358
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740657607;
	bh=/maE9eMGUUgpDyfxIsB3yIHPUQTHa1apjv1RNtbhnmo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R97YtOjI+x6f9/tAkjfdEZ6JRWZ/JspvfEKtybQS4hkPbZuf1pve1Mty+06ghtBgV
	 Tq1u06r5I2G5t7dt2jAtFRDFSRJ8G4mlluAMSv7x8y4S/vMdT+s2O+rbHTFtzQsamj
	 h6Yg7AFPPT/UMXwIGdnNF7uFqytFXK9qbJbq/mAY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2ED7F800BD; Thu, 27 Feb 2025 12:59:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24DFDF805BE;
	Thu, 27 Feb 2025 12:59:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72548F80169; Thu, 27 Feb 2025 12:58:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA177F800BD
	for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2025 12:58:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA177F800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=jbwGeJM9
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51RBwOed1838802
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Feb 2025 05:58:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740657504;
	bh=/maE9eMGUUgpDyfxIsB3yIHPUQTHa1apjv1RNtbhnmo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=jbwGeJM95W6PdhQTEq7yXBMm+cNdS/83yyPPafanS/hKjP3oWQsfi11iEpJAqXuBK
	 9P1aXrXEyvCFY74Zod155WBl5A1+bwJDFNQco/jNLQHaNVyPJHLDsGTBd1syFq4LCg
	 QVu7SiwGcg4Un6g0kYhsxHMv64/eA+2MKQAShhTE=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51RBwOFl119729
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Feb 2025 05:58:24 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Feb 2025 05:58:23 -0600
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Thu, 27 Feb 2025 05:58:24 -0600
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "broonie@kernel.org" <broonie@kernel.org>,
        "tiwai@suse.de"
	<tiwai@suse.de>,
        "13916275206@139.com" <13916275206@139.com>,
        "13564923607@139.com" <13564923607@139.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "Xu, Baojun" <baojun.xu@ti.com>
Subject: RE: [EXTERNAL] Re: [PATCH v3] ASoC: tas2781: Support dsp firmware
 Alpha and Beta seaies
Thread-Topic: [EXTERNAL] Re: [PATCH v3] ASoC: tas2781: Support dsp firmware
 Alpha and Beta seaies
Thread-Index: AQHbh44JO9W6zfoe3UKB+chbg5j7x7NYe+8AgAKMlbA=
Date: Thu, 27 Feb 2025 11:58:24 +0000
Message-ID: <bc2147c6f31d47afbec108cfdb5acfd2@ti.com>
References: <20250225140316.1049-1-shenghao-ding@ti.com>
 <Z73WZLrBrtVc69dn@smile.fi.intel.com>
In-Reply-To: <Z73WZLrBrtVc69dn@smile.fi.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.85.14.197]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: T4TAWXSRITFABG3CXHAH5QIXIARZ6NI6
X-Message-ID-Hash: T4TAWXSRITFABG3CXHAH5QIXIARZ6NI6
X-MailFrom: shenghao-ding@ti.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T4TAWXSRITFABG3CXHAH5QIXIARZ6NI6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgQW5keQ0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51
eC5pbnRlbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDI1LCAyMDI1IDEwOjQxIFBN
DQo+IFRvOiBEaW5nLCBTaGVuZ2hhbyA8c2hlbmdoYW8tZGluZ0B0aS5jb20+DQo+IENjOiBicm9v
bmllQGtlcm5lbC5vcmc7IHRpd2FpQHN1c2UuZGU7IDEzOTE2Mjc1MjA2QDEzOS5jb207DQo+IDEz
NTY0OTIzNjA3QDEzOS5jb207IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgWHUsIEJhb2p1
bg0KPiA8YmFvanVuLnh1QHRpLmNvbT4NCj4gU3ViamVjdDogW0VYVEVSTkFMXSBSZTogW1BBVENI
IHYzXSBBU29DOiB0YXMyNzgxOiBTdXBwb3J0IGRzcCBmaXJtd2FyZQ0KPiBBbHBoYSBhbmQgQmV0
YSBzZWFpZXMNCj4gDQo+IE9uIFR1ZSwgRmViIDI1LCAyMDI1IGF0IDEwOjAzOjE2UE0gKzA4MDAs
IFNoZW5naGFvIERpbmcgd3JvdGU6DQo+ID4gRm9yIGNhbGlicmF0aW9uLCBiYXNpYyB2ZXJzaW9u
IGRvZXMgbm90IGNvbnRhaW4gYW55IGNhbGlicmF0aW9uDQo+ID4gYWRkcmVzc2VzLCBpdCBkZXBl
bmRzIG9uIGNhbGlicmF0aW9uIHRvb2wgdG8gY29udmVyeSB0aGUgYWRkcmVzc2VzIHRvIHRoZQ0K
PiBkcml2ZXIuDQo+ID4gU2luY2UgQWxwaGEgYW5kIEJldGEgZmlybXdhcmUsIGFsbCB0aGUgY2Fs
aWJyYXRpb24gYWRkcmVzc2VzIGFyZSBzYXZlZA0KPiA+IGludG8gdGhlIGZpcm13YXJlLg0KPiAN
Cj4gLi4uDQo+IA0KPiA+ICsNCj4gPiArCWZvciAoaSA9IDA7IGkgPCAyMDsgaSsrKSB7DQo+ID4g
KwkJY29uc3QgdW5zaWduZWQgY2hhciAqZGF0ID0gJnAtPmRhdGFbMjQgKiBpXTsNCj4gDQo+IE9r
YXksIHlvdSBoYXZlIDI0LWJ5dGUgcmVjb3Jkcy4NCj4gDQo+ID4gKwkJaWYgKGRhdFsyM10gIT0g
MSkNCj4gPiArCQkJYnJlYWs7DQo+IA0KPiA+ICsJCWlmIChzdHJzdHIoZGF0LCAidW1nX1NzbUtF
R0N5ZSIpICE9IE5VTEwpIHsNCj4gDQo+IFRoZXNlIGNhbGxzIGJhc2ljYWxseSBzdWdnZXN0IHRo
YXQgdGhlIGRhdGEgbWF5IGJlIG5vdCBhdCB0aGUgc2FtZSBvZmZzZXQuDQo+IEJ1dCBhdCB0aGUg
c2FtZSB0aW1lIHRoZXkgZG9uJ3QgaGF2ZSBib3VuZGFyeSBjaGVja3MgYW5kIHRoZXJlIGlzIGEg
Y2hhbmNlDQo+IHRoYXQgdGhlIHRhaWwgb2Ygb25lIG9mIHRoZXNlIHN0cmluZyBjb21wYXJpc29u
cyBtYXkgdHJpZ2dlciBpZiB0aGUgdmFsdWUgYXBwZWFycw0KPiB0byBiZSB0aGUgc2FtZSwgbGlr
ZSAiQ3llIi4NCj4gDQo+IEluc3RlYWQsIGJldHRlciB0byBpbnRyb2R1Y2UgYSBzcGVjaWFsIGRh
dGEgdHlwZSBvciBldmVuIGRhdGEgdHlwZXMsIHdoZXJlIHlvdQ0KPiBwdXQgc3RyaW5nIHdpdGgg
bGltaXRlZCBsZW5ndGggYW5kIHJlc3BlY3RpdmUgZGF0YSwgbGlrZSB1MjQvaTggaW4geW91cg0K
PiB0ZXJtaW5vbG9neS4gV2l0aCB0aGF0IHRoaXMgY29kZSBiZWNvbWVzIG11Y2ggbW9yZSBjbGVh
cmVyLg0KDQpDYWxpYnJhdGlvbiBwYXJhbWV0ZXJzIGxvY2F0aW9ucyBhbmQgZGF0YSBzY2hlbWEg
aW4gZHNwIGZpcm13YXJlDQpUaGUgbnVtYmVyIG9mIGl0ZW1zIGFyZSBmbGV4aWJsZSwgYnV0IG5v
dCBtb3JlIHRoYW4gMjAuIFRoZSBkc3AgdG9vbA0Kd2lsbCByZXNlcnZlIDIwKjI0LWJ5dGUgc3Bh
Y2UgZm9yIGZjdCBwYXJhbXMuIEluIHNvbWUgY2FzZXMsIHRoZQ0KbnVtYmVyIG9mIGZjdCBwYXJh
bSBpcyBsZXNzIHRoYW4gMjAsIHRoZSBkYXRhIHdpbGwgYmUgc2F2ZWQgZnJvbSB0aGUNCmJlZ2lu
bmluZywgdGhlIHJlc3QgcGFydCB3aWxsIGJlIHN0dWZmZWQgd2l0aCB6ZXJvLg0KCWZjdF9wYXJh
bV9udW0gKG5vdCBtb3JlIHRoYW4gMjApDQoJZm9yIChpID0gMDsgaSA8IGZjdF9wYXJhbV9udW07
IGkrKykgew0KCQlBbGlhcyBvZiBmY3QgcGFyYW0gKDIwIGJ5dGVzKQ0KCQlCb29rICgxIGJ5dGUp
DQoJUGFnZSAoMSBieXRlKQ0KCU9mZnNldCAoMSBieXRlKQ0KCUNvZWZmTGVuZ3RoICgxIGJ5dGUp
ID0gMHgxDQoJfQ0KCWlmICgyMCAtIGZjdF9wYXJhbV9udW0pDQoJCTI0KigyMCAtIGZjdF9wYXJh
bV9udW0pIHBpZWNlcyBvZiAnMCcgYXMgc3R1ZmZpbmcNCkFzIGZvbGxvdw0KdW1nX1NzbUtFR0N5
ZQkgPSBCb29rLCBQYWdlLCBPZmZzZXQsIENvZWZmTGVuZ3RoDQppa3NfRTAgCQkgPSBCb29rLCBQ
YWdlLCBPZmZzZXQsIENvZWZmTGVuZ3RoDQp5ZXBfTHNxTTAJCSA9IEJvb2ssIFBhZ2UsIE9mZnNl
dCwgQ29lZmZMZW5ndGgNCm95el9VMF91angJCSA9IEJvb2ssIFBhZ2UsIE9mZnNldCwgQ29lZmZM
ZW5ndGgNCmlrc19HQ19HTWdxCQkgPSBCb29rLCBQYWdlLCBPZmZzZXQsIENvZWZmTGVuZ3RoDQpn
b3VfWWFvCQkgPSBCb29rLCBQYWdlLCBPZmZzZXQsIENvZWZmTGVuZ3RoDQprZ2RfV3NjX1FzYnAJ
CSA9IEJvb2ssIFBhZ2UsIE9mZnNldCwgQ29lZmZMZW5ndGgNCnllY19DcXNlU3NxcwkJID0gQm9v
aywgUGFnZSwgT2Zmc2V0LCBDb2VmZkxlbmd0aA0KaWtzX1NvZ2tHZ29nMgkgPSBCb29rLCBQYWdl
LCBPZmZzZXQsIENvZWZmTGVuZ3RoDQp5ZWNfU2FlX1kJCSA9IEJvb2ssIFBhZ2UsIE9mZnNldCwg
Q29lZmZMZW5ndGgNClJlX0ludAkJID0gQm9vaywgUGFnZSwgT2Zmc2V0LCBDb2VmZkxlbmd0aA0K
U2lnRmxhZwkJID0gQm9vaywgUGFnZSwgT2Zmc2V0LCBDb2VmZkxlbmd0aA0KYTFfSW50CQkgPSBC
b29rLCBQYWdlLCBPZmZzZXQsIENvZWZmTGVuZ3RoDQphMl9JbnQJCSA9IEJvb2ssIFBhZ2UsIE9m
ZnNldCwgQ29lZmZMZW5ndGgNCg0KRG8geW91IG1lYW4gdG8gdXNlICBzdHJuY21wIGluc3RlYWQg
b2Ygc3Ryc3RyPw0KRHVlIHRvIHRoZSBkaWZmZXJlbnQgbGVuZ3RoIG9mIHRoZSBhbGlhcyBvZiBm
Y3QgcGFyYW1zLCANCkkgaGF2ZSB0byBwYXNzIHRoZSBtYXggbGVuLCAyMCBieXRlcywgYXMgdGhl
IHN0ciBsZW4uDQo+IA0KPiA+ICsJCQloZXhfcGFyc2VfdTI0KCZyLT5wb3dfcmVnLCAmZGF0WzIw
XSk7DQo+ID4gKwkJCWNvbnRpbnVlOw0KPiA+ICsJCX0NCj4gPiArCQlpZiAoc3Ryc3RyKGRhdCwg
Imlrc19FMCIpICE9IE5VTEwpIHsNCj4gPiArCQkJaGV4X3BhcnNlX3UyNCgmci0+cjBfcmVnLCAm
ZGF0WzIwXSk7DQo+ID4gKwkJCWNvbnRpbnVlOw0KPiA+ICsJCX0NCj4gPiArCQlpZiAoc3Ryc3Ry
KGRhdCwgInllcF9Mc3FNMCIpICE9IE5VTEwpIHsNCj4gPiArCQkJaGV4X3BhcnNlX3UyNCgmci0+
aW52cjBfcmVnLCAmZGF0WzIwXSk7DQo+ID4gKwkJCWNvbnRpbnVlOw0KPiA+ICsJCX0NCj4gPiAr
CQlpZiAoc3Ryc3RyKGRhdCwgIm95el9VMF91angiKSAhPSBOVUxMKSB7DQo+ID4gKwkJCWhleF9w
YXJzZV91MjQoJnItPnIwX2xvd19yZWcsICZkYXRbMjBdKTsNCj4gPiArCQkJY29udGludWU7DQo+
ID4gKwkJfQ0KPiA+ICsJCWlmIChzdHJzdHIoZGF0LCAiaWtzX0dDX0dNZ3EiKSAhPSBOVUxMKSB7
DQo+ID4gKwkJCWhleF9wYXJzZV91MjQoJnItPnRsaW1pdF9yZWcsICZkYXRbMjBdKTsNCj4gPiAr
CQkJY29udGludWU7DQo+ID4gKwkJfQ0KPiA+ICsJCWlmIChzdHJzdHIoZGF0LCAiZ291X1lhbyIp
ICE9IE5VTEwpIHsNCj4gPiArCQkJaGV4X3BhcnNlX3U4KHAtPnRociwgJmRhdFsyMF0sIDMpOw0K
PiA+ICsJCQljb250aW51ZTsNCj4gPiArCQl9DQo+ID4gKwkJaWYgKHN0cnN0cihkYXQsICJrZ2Rf
V3NjX1FzYnAiKSAhPSBOVUxMKSB7DQo+ID4gKwkJCWhleF9wYXJzZV91OChwLT5wbHRfZmxnLCAm
ZGF0WzIwXSwgMyk7DQo+ID4gKwkJCWNvbnRpbnVlOw0KPiA+ICsJCX0NCj4gPiArCQlpZiAoc3Ry
c3RyKGRhdCwgInllY19DcXNlU3NxcyIpICE9IE5VTEwpIHsNCj4gPiArCQkJaGV4X3BhcnNlX3U4
KHAtPnNpbl9nbiwgJmRhdFsyMF0sIDMpOw0KPiA+ICsJCQljb250aW51ZTsNCj4gPiArCQl9DQo+
ID4gKwkJaWYgKHN0cnN0cihkYXQsICJpa3NfU29na0dnb2cyIikgIT0gTlVMTCkgew0KPiA+ICsJ
CQloZXhfcGFyc2VfdTgocC0+c2luX2duMiwgJmRhdFsyMF0sIDMpOw0KPiA+ICsJCQljb250aW51
ZTsNCj4gPiArCQl9DQo+ID4gKwkJaWYgKHN0cnN0cihkYXQsICJ5ZWNfU2FlX1kiKSAhPSBOVUxM
KSB7DQo+ID4gKwkJCWhleF9wYXJzZV91OChwLT50aHIyLCAmZGF0WzIwXSwgMyk7DQo+ID4gKwkJ
CWNvbnRpbnVlOw0KPiA+ICsJCX0NCj4gPiArCQlpZiAoc3Ryc3RyKGRhdCwgIlJlX0ludCIpICE9
IE5VTEwpIHsNCj4gPiArCQkJaGV4X3BhcnNlX3U4KHAtPnIwX3JlZywgJmRhdFsyMF0sIDMpOw0K
PiA+ICsJCQljb250aW51ZTsNCj4gPiArCQl9DQo+ID4gKwkJLyogQ2hlY2sgd2hldGhlciB0aGUg
c3BrIGNvbm5lY3Rpb24gaXMgb3BlbiAqLw0KPiA+ICsJCWlmIChzdHJzdHIoZGF0LCAiU2lnRmxh
ZyIpICE9IE5VTEwpIHsNCj4gPiArCQkJaGV4X3BhcnNlX3U4KHAtPnRmX3JlZywgJmRhdFsyMF0s
IDMpOw0KPiA+ICsJCQljb250aW51ZTsNCj4gPiArCQl9DQo+ID4gKwkJaWYgKHN0cnN0cihkYXQs
ICJhMV9JbnQiKSAhPSBOVUxMKSB7DQo+ID4gKwkJCWhleF9wYXJzZV91OChwLT5hMV9yZWcsICZk
YXRbMjBdLCAzKTsNCj4gPiArCQkJY29udGludWU7DQo+ID4gKwkJfQ0KPiA+ICsJCWlmIChzdHJz
dHIoZGF0LCAiYTJfSW50IikgIT0gTlVMTCkgew0KPiA+ICsJCQloZXhfcGFyc2VfdTgocC0+YTJf
cmVnLCAmZGF0WzIwXSwgMyk7DQo+ID4gKwkJCWNvbnRpbnVlOw0KPiA+ICsJCX0NCj4gPiArCX0N
Cj4gPiArfQ0KPiANCj4gLi4uDQo+IA0KPiAtLQ0KPiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gQW5k
eSBTaGV2Y2hlbmtvDQo+IA0KDQo=
