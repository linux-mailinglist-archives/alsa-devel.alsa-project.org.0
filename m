Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B4E2B1638
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Nov 2020 08:13:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C80B1865;
	Fri, 13 Nov 2020 08:12:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C80B1865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605251615;
	bh=OE+BJOn0GkYQzflCus3kCNMYVFntzjOXWdjbwUyFp7U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B2dOyw1QX/osQ8FjoXjf8wPk/1w66+O/fSdruyLJ8Cojo+/daVYTMK0GGzefEIV2h
	 mQQpyyLSI2FLYKmLPVB4mqnUYy3AEM6ntjjo25Al9pk9lzgG5oqz9qTNY6JVZ8JKNV
	 zrpZSBw7L4Vy+qQYjY4zqW6Aq1y4BoIGFEPIcESI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8FF7F80086;
	Fri, 13 Nov 2020 08:12:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E67ABF8020C; Fri, 13 Nov 2020 08:11:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72667F800D1
 for <alsa-devel@alsa-project.org>; Fri, 13 Nov 2020 08:11:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72667F800D1
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0AD7BkObA021500,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0AD7BkObA021500
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 13 Nov 2020 15:11:46 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.36) by
 RTEXMB01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Fri, 13 Nov 2020 15:11:46 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2]) by
 RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2%8]) with mapi id
 15.01.2106.003; Fri, 13 Nov 2020 15:11:46 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: HP mute led support
Thread-Topic: HP mute led support
Thread-Index: Ada5jAOicvvaFp/mTWqG61/9l4lzMg==
Date: Fri, 13 Nov 2020 07:11:46 +0000
Message-ID: <086c865222fb4ebf8bb8fd697ae8974c@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.96]
Content-Type: multipart/mixed;
 boundary="_002_086c865222fb4ebf8bb8fd697ae8974crealtekcom_"
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
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

--_002_086c865222fb4ebf8bb8fd697ae8974crealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

HP machine have mute led support.
Attach patch will enable it.

Many Thanks.

BR,
Kailang

--_002_086c865222fb4ebf8bb8fd697ae8974crealtekcom_
Content-Type: application/octet-stream; name="0000-hp-mute-led-gpio4.patch"
Content-Description: 0000-hp-mute-led-gpio4.patch
Content-Disposition: attachment; filename="0000-hp-mute-led-gpio4.patch";
	size=2197; creation-date="Fri, 06 Nov 2020 07:23:03 GMT";
	modification-date="Fri, 13 Nov 2020 07:09:22 GMT"
Content-Transfer-Encoding: base64

RnJvbSA5NTBjMDhlMWM3NTg0MzQ3YzRmOGM3Zjg0MDc4ZjQ1Mzg4NmU2MzUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBrYWlsYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgpEYXRlOiBG
cmksIDYgTm92IDIwMjAgMTU6MjA6MzggKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNBOiBoZGEv
cmVhbHRlayAtIEFkZCBzdXBwb3J0ZWQgbXV0ZSBMZWQgZm9yIEhQCgpIUCBQYXZpbGlvbiB4MzYw
IENvbnZlcnRpYmxlIG1hY2hpbmUsIGl0IHN1cHBvcnRlZCBtdXRlIGxlZC4KR1BJTzQgaGlnaCB3
aWxsIHR1cm4gb24gbGVkLgpUaGUgcGF0Y2ggd2lsbCBlbmFibGUgY29udHJvbCBsZWQgdmlhIEdQ
SU80IHBpbi4KClNpZ25lZC1vZmYtYnk6IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNv
bT4KCgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9zb3VuZC9w
Y2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCA0ZjBlYTgwMTNiZjYuLmNkZGNhODA2MTcwOCAx
MDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysrIGIvc291bmQvcGNp
L2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTQyMTYsNiArNDIxNiwxMiBAQCBzdGF0aWMgdm9pZCBh
bGMyODZfZml4dXBfaHBfZ3Bpb19sZWQoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMsCiAJYWxjX2Zp
eHVwX2hwX2dwaW9fbGVkKGNvZGVjLCBhY3Rpb24sIDB4MDIsIDB4MjApOwogfQogCitzdGF0aWMg
dm9pZCBhbGMyODdfZml4dXBfaHBfZ3Bpb19sZWQoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMsCisJ
CQkJY29uc3Qgc3RydWN0IGhkYV9maXh1cCAqZml4LCBpbnQgYWN0aW9uKQoreworCWFsY19maXh1
cF9ocF9ncGlvX2xlZChjb2RlYywgYWN0aW9uLCAweDEwLCAwKTsKK30KKwogLyogdHVybiBvbi9v
ZmYgbWljLW11dGUgTEVEIHBlciBjYXB0dXJlIGhvb2sgdmlhIFZSRUYgY2hhbmdlICovCiBzdGF0
aWMgaW50IHZyZWZfbWljbXV0ZV9sZWRfc2V0KHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2
LAogCQkJCWVudW0gbGVkX2JyaWdodG5lc3MgYnJpZ2h0bmVzcykKQEAgLTYzMDAsNiArNjMwNiw3
IEBAIGVudW0gewogCUFMQzI1NV9GSVhVUF9YSUFPTUlfSEVBRFNFVF9NSUMsCiAJQUxDMjc0X0ZJ
WFVQX0hQX01JQywKIAlBTEMyNzRfRklYVVBfSFBfSEVBRFNFVF9NSUMsCisJQUxDMjg3X0ZJWFVQ
X0hQX0dQSU9fTEVELAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfZml4dXAgYWxjMjY5
X2ZpeHVwc1tdID0gewpAQCAtNzY5Myw2ICs3NzAwLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
aGRhX2ZpeHVwIGFsYzI2OV9maXh1cHNbXSA9IHsKIAkJLmNoYWluZWQgPSB0cnVlLAogCQkuY2hh
aW5faWQgPSBBTEMyNzRfRklYVVBfSFBfTUlDCiAJfSwKKwlbQUxDMjg3X0ZJWFVQX0hQX0dQSU9f
TEVEXSA9IHsKKwkJLnR5cGUgPSBIREFfRklYVVBfRlVOQywKKwkJLnYuZnVuYyA9IGFsYzI4N19m
aXh1cF9ocF9ncGlvX2xlZCwKKwl9LAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfcGNp
X3F1aXJrIGFsYzI2OV9maXh1cF90YmxbXSA9IHsKQEAgLTc4NDcsNiArNzg1OCw4IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgc25kX3BjaV9xdWlyayBhbGMyNjlfZml4dXBfdGJsW10gPSB7CiAJU05E
X1BDSV9RVUlSSygweDEwM2MsIDB4ODc2MCwgIkhQIiwgQUxDMjg1X0ZJWFVQX0hQX01VVEVfTEVE
KSwKIAlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4NzdhLCAiSFAiLCBBTEMyODVfRklYVVBfSFBf
TVVURV9MRUQpLAogCVNORF9QQ0lfUVVJUksoMHgxMDNjLCAweDg3N2QsICJIUCIsIEFMQzIzNl9G
SVhVUF9IUF9NVVRFX0xFRCksCisJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4ODdmNCwgIkhQIiwg
QUxDMjg3X0ZJWFVQX0hQX0dQSU9fTEVEKSwKKwlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4N2Y1
LCAiSFAiLCBBTEMyODdfRklYVVBfSFBfR1BJT19MRUQpLAogCVNORF9QQ0lfUVVJUksoMHgxMDQz
LCAweDEwM2UsICJBU1VTIFg1NDBTQSIsIEFMQzI1Nl9GSVhVUF9BU1VTX01JQyksCiAJU05EX1BD
SV9RVUlSSygweDEwNDMsIDB4MTAzZiwgIkFTVVMgVFgzMDAiLCBBTEMyODJfRklYVVBfQVNVU19U
WDMwMCksCiAJU05EX1BDSV9RVUlSSygweDEwNDMsIDB4MTA2ZCwgIkFzdXMgSzUzQkUiLCBBTEMy
NjlfRklYVVBfTElNSVRfSU5UX01JQ19CT09TVCksCg==

--_002_086c865222fb4ebf8bb8fd697ae8974crealtekcom_--
