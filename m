Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CDC7E51A9
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 09:08:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2F16DF;
	Wed,  8 Nov 2023 09:07:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2F16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699430919;
	bh=ME5tTq0AEBV5lTEMNOjttDU+BevtIiLp3vEolyYc7Mo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ba1tHPh6AkI15JCDRgxuwXDA3fTjDZqMSHKFBIyxSfEyF7te4FxGCzY9N3aFL4bqj
	 3el1Ab3YOwXU8DDOPkD2YgyVqhnx0apVcX/vtiFNdfHbkmyXDFaejYD8OtpU3FWxDc
	 mr6gWlQeG/ydCmNypPSWJcMbFM/JyK90qBqneBL8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 462AAF8055A; Wed,  8 Nov 2023 09:07:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C85C0F80169;
	Wed,  8 Nov 2023 09:07:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74C96F8016D; Wed,  8 Nov 2023 09:05:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D28F3F80100
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 09:05:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D28F3F80100
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3A885QpqC704203,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3A885QpqC704203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Nov 2023 16:05:27 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.17; Wed, 8 Nov 2023 16:05:26 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 16:05:26 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::540c:c8d6:1d0f:ab9f]) by
 RTEXMBS01.realtek.com.tw ([fe80::540c:c8d6:1d0f:ab9f%5]) with mapi id
 15.01.2507.034; Wed, 8 Nov 2023 16:05:26 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Dell dual speaker platform
Thread-Topic: Dell dual speaker platform
Thread-Index: AdoSGhJcavcbImjgRA6b466XuIs9ig==
Date: Wed, 8 Nov 2023 08:05:26 +0000
Message-ID: <4dd390a77bf742b8a518ac2deee00b0f@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_4dd390a77bf742b8a518ac2deee00b0frealtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: 7A75WF2JIVQU2V7Q2T5MBYWEOTFAQM7Q
X-Message-ID-Hash: 7A75WF2JIVQU2V7Q2T5MBYWEOTFAQM7Q
X-MailFrom: kailang@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7A75WF2JIVQU2V7Q2T5MBYWEOTFAQM7Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_4dd390a77bf742b8a518ac2deee00b0frealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=
=3Dfor-linus&id=3Dde90f5165b1c
Attach was fixed speaker no sound issue.

BR,
Kailang

--_002_4dd390a77bf742b8a518ac2deee00b0frealtekcom_
Content-Type: application/octet-stream;
	name="0000-Dell-alc289-dual-spk-platform.patch"
Content-Description: 0000-Dell-alc289-dual-spk-platform.patch
Content-Disposition: attachment;
	filename="0000-Dell-alc289-dual-spk-platform.patch"; size=4549;
	creation-date="Wed, 08 Nov 2023 07:46:57 GMT";
	modification-date="Wed, 08 Nov 2023 08:01:14 GMT"
Content-Transfer-Encoding: base64

RnJvbSA0ZTZiNDQwNmUwMDVhODQ2ZGQyZmQzMzE3MDZiYTU3N2ZlY2QwNmJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFdlZCwgOCBOb3YgMjAyMyAxNTo0NTowMCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrOiBBZGQgc3VwcG9ydCBkdWFsIHNwZWFrZXIgZm9yIERlbGwKCkRlbGwgbmV3
IHBsYXRmb3JtIHN1cHBvcnQgZHVhbCBzcGVha2VyLiBCdXQgQklPUyB2ZXJiIHRhYmxlIG9ubHkg
c2hvdyBvbmUgc3BlYWtlci4KSXQgd2lsbCBmaWxsIHZlcmIgdGFibGUgZm9yIHNlY29uZCBzcGVh
a2VyLiBUaGVuIGJpbmQgd2l0aCBDUyBBTVAgbW9kZWwuCgpGaXhlczpkZTkwZjUxNjViMWMgKCJB
TFNBOiBoZGEvcmVhbHRlazogQWRkIHN1cHBvcnQgZm9yIERFTEwgT2FzaXMgMTMvMTQvMTYgbGFw
dG9wcyIpClNpZ25lZC1vZmYtYnk6IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4K
ZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hk
YS9wYXRjaF9yZWFsdGVrLmMKaW5kZXggNTgwMDZjOGJjZmI5Li5mYTIyZGM3ODg2YWMgMTAwNjQ0
Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEv
cGF0Y2hfcmVhbHRlay5jCkBAIC03MzQzLDggKzczNDMsMTAgQEAgZW51bSB7CiAJQUxDMjU2X0ZJ
WFVQX0FTVVNfTUlDX05PX1BSRVNFTkNFLAogCUFMQzI5OV9GSVhVUF9QUkVEQVRPUl9TUEssCiAJ
QUxDMjU2X0ZJWFVQX01FRElPTl9IRUFEU0VUX05PX1BSRVNFTkNFLAorCUFMQzI4OV9GSVhVUF9E
RUxMX1NQSzEsCiAJQUxDMjg5X0ZJWFVQX0RFTExfU1BLMiwKIAlBTEMyODlfRklYVVBfRFVBTF9T
UEssCisJQUxDMjg5X0ZJWFVQX1JUS19BTVBfRFVBTF9TUEssCiAJQUxDMjk0X0ZJWFVQX1NQSzJf
VE9fREFDMSwKIAlBTEMyOTRfRklYVVBfQVNVU19EVUFMX1NQSywKIAlBTEMyODVfRklYVVBfVEhJ
TktQQURfWDFfR0VONywKQEAgLTc0NDQsNiArNzQ0Niw3IEBAIGVudW0gewogCUFMQzI4N19GSVhV
UF9USElOS1BBRF9JMlNfU1BLLAogCUFMQzI4N19GSVhVUF9NR19SVEtDX0NTQU1QX0NTMzVMNDFf
STJDX1RISU5LUEFELAogCUFMQzJYWF9GSVhVUF9IRUFEU0VUX01JQywKKwlBTEMyODlfRklYVVBf
REVMTF9DUzM1TDQxX1NQSV8yLAogfTsKIAogLyogQSBzcGVjaWFsIGZpeHVwIGZvciBMZW5vdm8g
Qzk0MCBhbmQgWW9nYSBEdWV0IDc7CkBAIC04NjcwLDYgKzg2NzMsMTUgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBoZGFfZml4dXAgYWxjMjY5X2ZpeHVwc1tdID0gewogCQkuY2hhaW5lZCA9IHRydWUs
CiAJCS5jaGFpbl9pZCA9IEFMQzI1Nl9GSVhVUF9BU1VTX0hFQURTRVRfTU9ERQogCX0sCisJW0FM
QzI4OV9GSVhVUF9ERUxMX1NQSzFdID0geworCQkudHlwZSA9IEhEQV9GSVhVUF9QSU5TLAorCQku
di5waW5zID0gKGNvbnN0IHN0cnVjdCBoZGFfcGludGJsW10pIHsKKwkJCXsgMHgxNCwgMHg5MDE3
MDE0MCB9LAorCQkJeyB9CisJCX0sCisJCS5jaGFpbmVkID0gdHJ1ZSwKKwkJLmNoYWluX2lkID0g
QUxDMjY5X0ZJWFVQX0RFTEw0X01JQ19OT19QUkVTRU5DRQorCX0sCiAJW0FMQzI4OV9GSVhVUF9E
RUxMX1NQSzJdID0gewogCQkudHlwZSA9IEhEQV9GSVhVUF9QSU5TLAogCQkudi5waW5zID0gKGNv
bnN0IHN0cnVjdCBoZGFfcGludGJsW10pIHsKQEAgLTg2ODUsNiArODY5NywxMiBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGhkYV9maXh1cCBhbGMyNjlfZml4dXBzW10gPSB7CiAJCS5jaGFpbmVkID0g
dHJ1ZSwKIAkJLmNoYWluX2lkID0gQUxDMjg5X0ZJWFVQX0RFTExfU1BLMgogCX0sCisJW0FMQzI4
OV9GSVhVUF9SVEtfQU1QX0RVQUxfU1BLXSA9IHsKKwkJLnR5cGUgPSBIREFfRklYVVBfRlVOQywK
KwkJLnYuZnVuYyA9IGFsYzI4NV9maXh1cF9zcGVha2VyMl90b19kYWMxLAorCQkuY2hhaW5lZCA9
IHRydWUsCisJCS5jaGFpbl9pZCA9IEFMQzI4OV9GSVhVUF9ERUxMX1NQSzEKKwl9LAogCVtBTEMy
OTRfRklYVVBfU1BLMl9UT19EQUMxXSA9IHsKIAkJLnR5cGUgPSBIREFfRklYVVBfRlVOQywKIAkJ
LnYuZnVuYyA9IGFsYzI4NV9maXh1cF9zcGVha2VyMl90b19kYWMxLApAQCAtOTU1Miw2ICs5NTcw
LDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwIGFsYzI2OV9maXh1cHNbXSA9IHsK
IAkJLnR5cGUgPSBIREFfRklYVVBfRlVOQywKIAkJLnYuZnVuYyA9IGFsY19maXh1cF9oZWFkc2V0
X21pYywKIAl9LAorCVtBTEMyODlfRklYVVBfREVMTF9DUzM1TDQxX1NQSV8yXSA9IHsKKwkJLnR5
cGUgPSBIREFfRklYVVBfRlVOQywKKwkJLnYuZnVuYyA9IGNzMzVsNDFfZml4dXBfc3BpX3R3bywK
KwkJLmNoYWluZWQgPSB0cnVlLAorCQkuY2hhaW5faWQgPSBBTEMyODlfRklYVVBfRFVBTF9TUEsK
Kwl9LAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1aXJrIGFsYzI2OV9maXh1
cF90YmxbXSA9IHsKQEAgLTk2NjIsMTMgKzk2ODYsMTUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBz
bmRfcGNpX3F1aXJrIGFsYzI2OV9maXh1cF90YmxbXSA9IHsKIAlTTkRfUENJX1FVSVJLKDB4MTAy
OCwgMHgwYzFjLCAiRGVsbCBQcmVjaXNpb24gMzU0MCIsIEFMQzIzNl9GSVhVUF9ERUxMX0RVQUxf
Q09ERUNTKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAyOCwgMHgwYzFkLCAiRGVsbCBQcmVjaXNpb24g
MzQ0MCIsIEFMQzIzNl9GSVhVUF9ERUxMX0RVQUxfQ09ERUNTKSwKIAlTTkRfUENJX1FVSVJLKDB4
MTAyOCwgMHgwYzFlLCAiRGVsbCBQcmVjaXNpb24gMzU0MCIsIEFMQzIzNl9GSVhVUF9ERUxMX0RV
QUxfQ09ERUNTKSwKLQlTTkRfUENJX1FVSVJLKDB4MTAyOCwgMHgwY2JkLCAiRGVsbCBPYXNpcyAx
MyBDUyBNVEwtVSIsIEFMQzI0NV9GSVhVUF9DUzM1TDQxX1NQSV8yKSwKLQlTTkRfUENJX1FVSVJL
KDB4MTAyOCwgMHgwY2JlLCAiRGVsbCBPYXNpcyAxMyAyLUlOLTEgTVRMLVUiLCBBTEMyNDVfRklY
VVBfQ1MzNUw0MV9TUElfMiksCi0JU05EX1BDSV9RVUlSSygweDEwMjgsIDB4MGNiZiwgIkRlbGwg
T2FzaXMgMTMgTG93IFdlaWdodCBNVFUtTCIsIEFMQzI0NV9GSVhVUF9DUzM1TDQxX1NQSV8yKSwK
LQlTTkRfUENJX1FVSVJLKDB4MTAyOCwgMHgwY2MxLCAiRGVsbCBPYXNpcyAxNCBNVEwtSC9VIiwg
QUxDMjQ1X0ZJWFVQX0NTMzVMNDFfU1BJXzIpLAotCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDBj
YzIsICJEZWxsIE9hc2lzIDE0IDItaW4tMSBNVEwtSC9VIiwgQUxDMjQ1X0ZJWFVQX0NTMzVMNDFf
U1BJXzIpLAotCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDBjYzMsICJEZWxsIE9hc2lzIDE0IExv
dyBXZWlnaHQgTVRMLVUiLCBBTEMyNDVfRklYVVBfQ1MzNUw0MV9TUElfMiksCi0JU05EX1BDSV9R
VUlSSygweDEwMjgsIDB4MGNjNCwgIkRlbGwgT2FzaXMgMTYgTVRMLUgvVSIsIEFMQzI0NV9GSVhV
UF9DUzM1TDQxX1NQSV8yKSwKKwlTTkRfUENJX1FVSVJLKDB4MTAyOCwgMHgwY2JkLCAiRGVsbCBP
YXNpcyAxMyBDUyBNVEwtVSIsIEFMQzI4OV9GSVhVUF9ERUxMX0NTMzVMNDFfU1BJXzIpLAorCVNO
RF9QQ0lfUVVJUksoMHgxMDI4LCAweDBjYmUsICJEZWxsIE9hc2lzIDEzIDItSU4tMSBNVEwtVSIs
IEFMQzI4OV9GSVhVUF9ERUxMX0NTMzVMNDFfU1BJXzIpLAorCVNORF9QQ0lfUVVJUksoMHgxMDI4
LCAweDBjYmYsICJEZWxsIE9hc2lzIDEzIExvdyBXZWlnaHQgTVRVLUwiLCBBTEMyODlfRklYVVBf
REVMTF9DUzM1TDQxX1NQSV8yKSwKKwlTTkRfUENJX1FVSVJLKDB4MTAyOCwgMHgwY2MwLCAiRGVs
bCBPYXNpcyAxMyIsIEFMQzI4OV9GSVhVUF9SVEtfQU1QX0RVQUxfU1BLKSwKKwlTTkRfUENJX1FV
SVJLKDB4MTAyOCwgMHgwY2MxLCAiRGVsbCBPYXNpcyAxNCBNVEwtSC9VIiwgQUxDMjg5X0ZJWFVQ
X0RFTExfQ1MzNUw0MV9TUElfMiksCisJU05EX1BDSV9RVUlSSygweDEwMjgsIDB4MGNjMiwgIkRl
bGwgT2FzaXMgMTQgMi1pbi0xIE1UTC1IL1UiLCBBTEMyODlfRklYVVBfREVMTF9DUzM1TDQxX1NQ
SV8yKSwKKwlTTkRfUENJX1FVSVJLKDB4MTAyOCwgMHgwY2MzLCAiRGVsbCBPYXNpcyAxNCBMb3cg
V2VpZ2h0IE1UTC1VIiwgQUxDMjg5X0ZJWFVQX0RFTExfQ1MzNUw0MV9TUElfMiksCisJU05EX1BD
SV9RVUlSSygweDEwMjgsIDB4MGNjNCwgIkRlbGwgT2FzaXMgMTYgTVRMLUgvVSIsIEFMQzI4OV9G
SVhVUF9ERUxMX0NTMzVMNDFfU1BJXzIpLAorCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDBjYzUs
ICJEZWxsIE9hc2lzIDE0IiwgQUxDMjg5X0ZJWFVQX1JUS19BTVBfRFVBTF9TUEspLAogCVNORF9Q
Q0lfUVVJUksoMHgxMDI4LCAweDE2NGEsICJEZWxsIiwgQUxDMjkzX0ZJWFVQX0RFTEwxX01JQ19O
T19QUkVTRU5DRSksCiAJU05EX1BDSV9RVUlSSygweDEwMjgsIDB4MTY0YiwgIkRlbGwiLCBBTEMy
OTNfRklYVVBfREVMTDFfTUlDX05PX1BSRVNFTkNFKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAzYywg
MHgxNTg2LCAiSFAiLCBBTEMyNjlfRklYVVBfSFBfTVVURV9MRURfTUlDMiksCg==

--_002_4dd390a77bf742b8a518ac2deee00b0frealtekcom_--
