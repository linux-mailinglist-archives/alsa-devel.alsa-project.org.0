Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F56A4B819
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Mar 2025 08:08:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6972C60224;
	Mon,  3 Mar 2025 08:08:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6972C60224
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740985703;
	bh=buAeh0i03Vp7JKSq5k5yx6Xb1ucFq9MYhoJiLezGcKY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=b/VfEFalKMvDVevhhUA3s4XE7k1YGqbyx5xv44CkKks5KYBqtOhOwO4iflxNDF6HT
	 JbrwShbcJTWfl+QE6wZlo+ydh1zhT9jC7eaqO+jnCXhjKJM1RFRm0fr5VUt2EKGYqN
	 5kCUpAQHjcwC4KfNn02PfDzRBme2ujPbvrNMHuRQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DBDAF805BB; Mon,  3 Mar 2025 08:07:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75EF0F805BD;
	Mon,  3 Mar 2025 08:07:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E413FF80424; Mon,  3 Mar 2025 08:07:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A0A7F801F7
	for <alsa-devel@alsa-project.org>; Mon,  3 Mar 2025 08:07:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A0A7F801F7
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=qxyMRfbq
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 52377UeP4838768,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1740985650; bh=buAeh0i03Vp7JKSq5k5yx6Xb1ucFq9MYhoJiLezGcKY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=qxyMRfbq+5GlczovOFTyo6JkfR66jHynkqw5JJJXT5qv1o/w51Ngn2DGEeHI1DHGe
	 zPCT0jpGPRb5hBEWfGIyCUS1Kh/FbDsXcu2+UDYvi+XEfBtO62Y/qQqQxf89xa6viU
	 EJHrLvafGOZAEZzeEIqM9HBIbpJTgPh6ZcOvnzl9gMZyJTmopBR4cb+CO9UB+w/hf4
	 YCqCGMrHBdorYvHbKK4lB5YBzIQmc2H7SonfWIv8DPq9hAAi15QvEMYNJEriT4NYQp
	 kzbXaobcyvVZG29pP9+Gg8r8OGfW92iBqjFTMged6p08JCU2A4cMsuInLFKdeGL45v
	 Ppc80JdtO5gCQ==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 52377UeP4838768
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Mar 2025 15:07:30 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Mar 2025 15:07:31 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 3 Mar 2025 15:07:30 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Mon, 3 Mar 2025 15:07:30 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Turn on LED function
Thread-Topic: Turn on LED function
Thread-Index: AduMCq4r5Rw27Y2BS9OO06YLjnEK4w==
Date: Mon, 3 Mar 2025 07:07:30 +0000
Message-ID: <c211a2702f1f411e86bd7420d7eebc03@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.21.6.42]
Content-Type: multipart/mixed;
	boundary="_002_c211a2702f1f411e86bd7420d7eebc03realtekcom_"
MIME-Version: 1.0
Message-ID-Hash: CDF63PMFZSCHLDCCUTLITTRW54TVMCK6
X-Message-ID-Hash: CDF63PMFZSCHLDCCUTLITTRW54TVMCK6
X-MailFrom: kailang@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CDF63PMFZSCHLDCCUTLITTRW54TVMCK6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_c211a2702f1f411e86bd7420d7eebc03realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Support Mic Mute LED for Lenovo ThinkCentre M series.

BR,
Kailang

--_002_c211a2702f1f411e86bd7420d7eebc03realtekcom_
Content-Type: application/octet-stream;
	name="0001-lenovo-mute-switch-and-led.patch"
Content-Description: 0001-lenovo-mute-switch-and-led.patch
Content-Disposition: attachment;
	filename="0001-lenovo-mute-switch-and-led.patch"; size=2569;
	creation-date="Tue, 25 Feb 2025 08:16:53 GMT";
	modification-date="Mon, 03 Mar 2025 07:04:20 GMT"
Content-Transfer-Encoding: base64

RnJvbSBjNDliZGM3NTdkNTUzNWJjYWY3YzcwZWU1NzUxNTdmYjFkZGE1MjgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IE1vbiwgMyBNYXIgMjAyNSAxNDo1NjoxMCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gYWRkIHN1cHBvcnRlZCBNaWMgTXV0ZSBMRUQgZm9yIExlbm92byBwbGF0
Zm9ybQoKU3VwcG9ydCBNaWMgTXV0ZSBMRUQgZm9yIFRoaW5rQ2VudHJlIE0gc2VyaWVzLgoKU2ln
bmVkLW9mZi1ieTogS2FpbGFuZyBZYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgoKZGlmZiAtLWdp
dCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9y
ZWFsdGVrLmMKaW5kZXggMjI0NjE2ZmJlYzRmLi42MTRlMDVjZTQ2YmIgMTAwNjQ0Ci0tLSBhL3Nv
dW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVh
bHRlay5jCkBAIC01MDUzLDYgKzUwNTMsMTYgQEAgc3RhdGljIHZvaWQgYWxjMjY5X2ZpeHVwX2hw
X2xpbmUxX21pYzFfbGVkKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAogCX0KIH0KIAorc3RhdGlj
IHZvaWQgYWxjMjMzX2ZpeHVwX2xlbm92b19sb3dfZW5fbWljbXV0ZV9sZWQoc3RydWN0IGhkYV9j
b2RlYyAqY29kZWMsCisJCQkJY29uc3Qgc3RydWN0IGhkYV9maXh1cCAqZml4LCBpbnQgYWN0aW9u
KQoreworCXN0cnVjdCBhbGNfc3BlYyAqc3BlYyA9IGNvZGVjLT5zcGVjOworCisJaWYgKGFjdGlv
biA9PSBIREFfRklYVVBfQUNUX1BSRV9QUk9CRSkKKwkJc3BlYy0+bWljbXV0ZV9sZWRfcG9sYXJp
dHkgPSAxOworCWFsYzIzM19maXh1cF9sZW5vdm9fbGluZTJfbWljX2hvdGtleShjb2RlYywgZml4
LCBhY3Rpb24pOworfQorCiBzdGF0aWMgdm9pZCBhbGNfaHBfbXV0ZV9kaXNhYmxlKHN0cnVjdCBo
ZGFfY29kZWMgKmNvZGVjLCB1bnNpZ25lZCBpbnQgZGVsYXkpCiB7CiAJaWYgKGRlbGF5IDw9IDAp
CkBAIC03NjIxLDYgKzc2MzEsNyBAQCBlbnVtIHsKIAlBTEMyNzVfRklYVVBfREVMTF9YUFMsCiAJ
QUxDMjkzX0ZJWFVQX0xFTk9WT19TUEtfTk9JU0UsCiAJQUxDMjMzX0ZJWFVQX0xFTk9WT19MSU5F
Ml9NSUNfSE9US0VZLAorCUFMQzIzM19GSVhVUF9MRU5PVk9fTDJNSF9MT1dfRU5MRUQsCiAJQUxD
MjU1X0ZJWFVQX0RFTExfU1BLX05PSVNFLAogCUFMQzIyNV9GSVhVUF9ESVNBQkxFX01JQ19WUkVG
LAogCUFMQzIyNV9GSVhVUF9ERUxMMV9NSUNfTk9fUFJFU0VOQ0UsCkBAIC04NjE2LDYgKzg2Mjcs
MTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfZml4dXAgYWxjMjY5X2ZpeHVwc1tdID0gewog
CQkudHlwZSA9IEhEQV9GSVhVUF9GVU5DLAogCQkudi5mdW5jID0gYWxjMjMzX2ZpeHVwX2xlbm92
b19saW5lMl9taWNfaG90a2V5LAogCX0sCisJW0FMQzIzM19GSVhVUF9MRU5PVk9fTDJNSF9MT1df
RU5MRURdID0geworCQkudHlwZSA9IEhEQV9GSVhVUF9GVU5DLAorCQkudi5mdW5jID0gYWxjMjMz
X2ZpeHVwX2xlbm92b19sb3dfZW5fbWljbXV0ZV9sZWQsCisJfSwKIAlbQUxDMjMzX0ZJWFVQX0lO
VEVMX05VQzhfRE1JQ10gPSB7CiAJCS50eXBlID0gSERBX0ZJWFVQX0ZVTkMsCiAJCS52LmZ1bmMg
PSBhbGNfZml4dXBfaW52X2RtaWMsCkBAIC0xMDkxMiw2ICsxMDkyNyw5IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgaGRhX3F1aXJrIGFsYzI2OV9maXh1cF90YmxbXSA9IHsKIAlTTkRfUENJX1FVSVJL
KDB4MTdhYSwgMHgzMTc4LCAiVGhpbmtDZW50cmUgU3RhdGlvbiIsIEFMQzI4M19GSVhVUF9IRUFE
U0VUX01JQyksCiAJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MzFhZiwgIlRoaW5rQ2VudHJlIFN0
YXRpb24iLCBBTEM2MjNfRklYVVBfTEVOT1ZPX1RISU5LU1RBVElPTl9QMzQwKSwKIAlTTkRfUENJ
X1FVSVJLKDB4MTdhYSwgMHgzMzRiLCAiTGVub3ZvIFRoaW5rQ2VudHJlIE03MCBHZW41IiwgQUxD
MjgzX0ZJWFVQX0hFQURTRVRfTUlDKSwKKwlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgzMzg0LCAi
VGhpbmtDZW50cmUgTTkwYSBQUk8iLCBBTEMyMzNfRklYVVBfTEVOT1ZPX0wyTUhfTE9XX0VOTEVE
KSwKKwlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgzMzg2LCAiVGhpbmtDZW50cmUgTTkwYSBHZW42
IiwgQUxDMjMzX0ZJWFVQX0xFTk9WT19MMk1IX0xPV19FTkxFRCksCisJU05EX1BDSV9RVUlSSygw
eDE3YWEsIDB4MzM4NywgIlRoaW5rQ2VudHJlIE03MGEgR2VuNiIsIEFMQzIzM19GSVhVUF9MRU5P
Vk9fTDJNSF9MT1dfRU5MRUQpLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDM4MDEsICJMZW5v
dm8gWW9nYTkgMTRJQVA3IiwgQUxDMjg3X0ZJWFVQX1lPR0E5XzE0SUFQN19CQVNTX1NQS19QSU4p
LAogCUhEQV9DT0RFQ19RVUlSSygweDE3YWEsIDB4MzgwMiwgIkR1ZXRJVEwgMjAyMSIsIEFMQzI4
N19GSVhVUF9ZT0dBN18xNElUTF9TUEVBS0VSUyksCiAJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4
MzgwMiwgIkxlbm92byBZb2dhIFBybyA5IDE0SVJQOCIsIEFMQzI4N19GSVhVUF9UQVMyNzgxX0ky
QyksCg==

--_002_c211a2702f1f411e86bd7420d7eebc03realtekcom_--
