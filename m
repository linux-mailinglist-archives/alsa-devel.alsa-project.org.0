Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 789E846B40F
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 08:36:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECFC621B0;
	Tue,  7 Dec 2021 08:35:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECFC621B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638862575;
	bh=WXa2i5m5O42O2H6ZhmwCsN/zdKc30cq+c8H65Dfp65I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lMD5Rmd7Cp88CUi9HkA/JoXuNVMjQT9AeeGl07KrDCC4mpr3RP2RC6PPyV5D+7E1a
	 cyUvRWZztSdVoUiZ60aF/2/hgtGiwGYgVQjr5i7+VI3YrgBbi6J9dWHKndQXvNL38V
	 6TWRWkRsFAWALo/0jXNbwZld+GtpMGUXH9ibsTog=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51F4EF8032B;
	Tue,  7 Dec 2021 08:35:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 718B8F8028D; Tue,  7 Dec 2021 08:34:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_NONE autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DC58F80103
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 08:34:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DC58F80103
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1B77YdlI6003949,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 1B77YdlI6003949
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 7 Dec 2021 15:34:39 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 7 Dec 2021 15:34:39 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 7 Dec 2021 15:34:39 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::38af:5429:2b43:3b95]) by
 RTEXMBS01.realtek.com.tw ([fe80::38af:5429:2b43:3b95%5]) with mapi id
 15.01.2308.015; Tue, 7 Dec 2021 15:34:39 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: Add headset Mic supported for Lenovo platform
Thread-Topic: Add headset Mic supported for Lenovo platform
Thread-Index: AdfrPF9MIW5KjVu0T9+swMhmNfIsdw==
Date: Tue, 7 Dec 2021 07:34:39 +0000
Message-ID: <baab2c2536cb4cc18677a862c6f6d840@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.97]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2021/12/7_=3F=3F_05:19:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: multipart/mixed;
 boundary="_002_baab2c2536cb4cc18677a862c6f6d840realtekcom_"
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
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

--_002_baab2c2536cb4cc18677a862c6f6d840realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch will enable headset Mic support on Lenovo platform.
Many Thanks.

BR,
Kailang

--_002_baab2c2536cb4cc18677a862c6f6d840realtekcom_
Content-Type: application/octet-stream;
	name="0001-lenovo-alc897-headset-mic.patch"
Content-Description: 0001-lenovo-alc897-headset-mic.patch
Content-Disposition: attachment;
	filename="0001-lenovo-alc897-headset-mic.patch"; size=3139;
	creation-date="Tue, 23 Nov 2021 08:43:38 GMT";
	modification-date="Tue, 07 Dec 2021 07:33:40 GMT"
Content-Transfer-Encoding: base64

RnJvbSBiMTMwNWU1MWMyYWNjYTM4YmI5ZTM4ZDg4ODNmOGU0ZWU1N2NkYTE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFR1ZSwgMjMgTm92IDIwMjEgMTY6MzI6NDQgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEFkZCBoZWFkc2V0IE1pYyBzdXBwb3J0IGZvciBMZW5vdm8gQUxDODk3
IHBsYXRmb3JtCgpMZW5vdm8gQUxDODk3IHBsYXRmb3JtIGhhZCBoZWFkc2V0IE1pYy4KVGhpcyBw
YXRjaCBlbmFibGUgc3VwcG9ydGVkIGhlYWRzZXQgTWljLgoKU2lnbmVkLW9mZi1ieTogS2FpbGFu
ZyBZYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9w
YXRjaF9yZWFsdGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCA4YTNl
MmZlNDIxMDYuLmE5NTFkOGE4N2Y0OSAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9y
ZWFsdGVrLmMKKysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTEwMTg2LDYg
KzEwMTg2LDI3IEBAIHN0YXRpYyB2b2lkIGFsYzY3MV9maXh1cF9ocF9oZWFkc2V0X21pYzIoc3Ry
dWN0IGhkYV9jb2RlYyAqY29kZWMsCiAJfQogfQogCitzdGF0aWMgdm9pZCBhbGM4OTdfaHBfYXV0
b211dGVfaG9vayhzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYywKKwkJCQkJIHN0cnVjdCBoZGFfamFj
a19jYWxsYmFjayAqamFjaykKK3sKKwlzdHJ1Y3QgYWxjX3NwZWMgKnNwZWMgPSBjb2RlYy0+c3Bl
YzsKKwlpbnQgdnJlZjsKKworCXNuZF9oZGFfZ2VuX2hwX2F1dG9tdXRlKGNvZGVjLCBqYWNrKTsK
Kwl2cmVmID0gc3BlYy0+Z2VuLmhwX2phY2tfcHJlc2VudCA/IChQSU5fSFAgfCBBQ19QSU5DVExf
VlJFRl8xMDApIDogUElOX0hQOworCXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIDB4MWIsIDAs
IEFDX1ZFUkJfU0VUX1BJTl9XSURHRVRfQ09OVFJPTCwKKwkJCSAgICB2cmVmKTsKK30KKworc3Rh
dGljIHZvaWQgYWxjODk3X2ZpeHVwX2xlbm92b19oZWFkc2V0X21pYyhzdHJ1Y3QgaGRhX2NvZGVj
ICpjb2RlYywKKwkJCQkgICAgIGNvbnN0IHN0cnVjdCBoZGFfZml4dXAgKmZpeCwgaW50IGFjdGlv
bikKK3sKKwlzdHJ1Y3QgYWxjX3NwZWMgKnNwZWMgPSBjb2RlYy0+c3BlYzsKKwlpZiAoYWN0aW9u
ID09IEhEQV9GSVhVUF9BQ1RfUFJFX1BST0JFKSB7CisJCXNwZWMtPmdlbi5ocF9hdXRvbXV0ZV9o
b29rID0gYWxjODk3X2hwX2F1dG9tdXRlX2hvb2s7CisJfQorfQorCiBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGNvZWZfZncgYWxjNjY4X2NvZWZzW10gPSB7CiAJV1JJVEVfQ09FRigweDAxLCAweGJlYmUp
LCBXUklURV9DT0VGKDB4MDIsIDB4YWFhYSksIFdSSVRFX0NPRUYoMHgwMywgICAgMHgwKSwKIAlX
UklURV9DT0VGKDB4MDQsIDB4MDE4MCksIFdSSVRFX0NPRUYoMHgwNiwgICAgMHgwKSwgV1JJVEVf
Q09FRigweDA3LCAweDBmODApLApAQCAtMTAyNjYsNiArMTAyODcsOCBAQCBlbnVtIHsKIAlBTEM2
NjhfRklYVVBfQVNVU19OT19IRUFEU0VUX01JQywKIAlBTEM2NjhfRklYVVBfSEVBRFNFVF9NSUMs
CiAJQUxDNjY4X0ZJWFVQX01JQ19ERVRfQ09FRiwKKwlBTEM4OTdfRklYVVBfTEVOT1ZPX0hFQURT
RVRfTUlDLAorCUFMQzg5N19GSVhVUF9IRUFEU0VUX01JQ19QSU4sCiB9OwogCiBzdGF0aWMgY29u
c3Qgc3RydWN0IGhkYV9maXh1cCBhbGM2NjJfZml4dXBzW10gPSB7CkBAIC0xMDY3Miw2ICsxMDY5
NSwxOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhkYV9maXh1cCBhbGM2NjJfZml4dXBzW10gPSB7
CiAJCQl7fQogCQl9LAogCX0sCisJW0FMQzg5N19GSVhVUF9MRU5PVk9fSEVBRFNFVF9NSUNdID0g
eworCQkudHlwZSA9IEhEQV9GSVhVUF9GVU5DLAorCQkudi5mdW5jID0gYWxjODk3X2ZpeHVwX2xl
bm92b19oZWFkc2V0X21pYywKKwl9LAorCVtBTEM4OTdfRklYVVBfSEVBRFNFVF9NSUNfUElOXSA9
IHsKKwkJLnR5cGUgPSBIREFfRklYVVBfUElOUywKKwkJLnYucGlucyA9IChjb25zdCBzdHJ1Y3Qg
aGRhX3BpbnRibFtdKSB7CisJCQl7IDB4MWEsIDB4MDNhMTEwNTAgfSwKKwkJCXsgfQorCQl9LAor
CQkuY2hhaW5lZCA9IHRydWUsCisJCS5jaGFpbl9pZCA9IEFMQzg5N19GSVhVUF9MRU5PVk9fSEVB
RFNFVF9NSUMKKwl9LAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1aXJrIGFs
YzY2Ml9maXh1cF90YmxbXSA9IHsKQEAgLTEwNzE2LDYgKzEwNzUyLDEwIEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgc25kX3BjaV9xdWlyayBhbGM2NjJfZml4dXBfdGJsW10gPSB7CiAJU05EX1BDSV9R
VUlSSygweDE0NGQsIDB4YzA1MSwgIlNhbXN1bmcgUjcyMCIsIEFMQzY2Ml9GSVhVUF9JREVBUEFE
KSwKIAlTTkRfUENJX1FVSVJLKDB4MTRjZCwgMHg1MDAzLCAiVVNJIiwgQUxDNjYyX0ZJWFVQX1VT
SV9IRUFEU0VUX01PREUpLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDEwMzYsICJMZW5vdm8g
UDUyMCIsIEFMQzY2Ml9GSVhVUF9MRU5PVk9fTVVMVElfQ09ERUNTKSwKKwlTTkRfUENJX1FVSVJL
KDB4MTdhYSwgMHgzMmNhLCAiTGVub3ZvIFRoaW5rQ2VudHJlIE04MCIsIEFMQzg5N19GSVhVUF9I
RUFEU0VUX01JQ19QSU4pLAorCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDMyY2IsICJMZW5vdm8g
VGhpbmtDZW50cmUgTTcwIiwgQUxDODk3X0ZJWFVQX0hFQURTRVRfTUlDX1BJTiksCisJU05EX1BD
SV9RVUlSSygweDE3YWEsIDB4MzJjZiwgIkxlbm92byBUaGlua0NlbnRyZSBNOTUwIiwgQUxDODk3
X0ZJWFVQX0hFQURTRVRfTUlDX1BJTiksCisJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MzJmNywg
Ikxlbm92byBUaGlua0NlbnRyZSBNOTAiLCBBTEM4OTdfRklYVVBfSEVBRFNFVF9NSUNfUElOKSwK
IAlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgzOGFmLCAiTGVub3ZvIElkZWFwYWQgWTU1MFAiLCBB
TEM2NjJfRklYVVBfSURFQVBBRCksCiAJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4M2EwZCwgIkxl
bm92byBJZGVhcGFkIFk1NTAiLCBBTEM2NjJfRklYVVBfSURFQVBBRCksCiAJU05EX1BDSV9RVUlS
SygweDE4NDksIDB4NTg5MiwgIkFTUm9jayBCMTUwTSIsIEFMQzg5Ml9GSVhVUF9BU1JPQ0tfTU9C
TyksCg==

--_002_baab2c2536cb4cc18677a862c6f6d840realtekcom_--
