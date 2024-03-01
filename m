Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D20686DCCE
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Mar 2024 09:14:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31C3385D;
	Fri,  1 Mar 2024 09:14:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31C3385D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709280854;
	bh=uqWmh32qlJDQIQ0+UQ29s4cgGFBeyS7HbzlTe8Rkxqk=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Gd4v8TfXUFMj2DHYUCQF/j235vcEXfa4K4ITfX5MwNES/Y3dpUhR0b5nklG3g6lT9
	 hSCzXplX4M8HzekUKlc9ZQZ7lPhVfJW8oieI+EhrTKLbgAEEofM7m34pSdSON3zj0c
	 ls1WEjOpRCb/308J6UWEQG/DDKILmHjB87Hm9wCs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6741CF801C0; Fri,  1 Mar 2024 09:13:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C663F801C0;
	Fri,  1 Mar 2024 09:13:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A80E2F801C0; Fri,  1 Mar 2024 09:13:02 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E98DEF80087
	for <alsa-devel@alsa-project.org>; Fri,  1 Mar 2024 09:12:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E98DEF80087
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4218CfxjE2015663,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 4218CfxjE2015663
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Mar 2024 16:12:42 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.32; Fri, 1 Mar 2024 16:12:41 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 1 Mar 2024 16:12:41 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::48bb:4f38:369c:d153]) by
 RTEXMBS01.realtek.com.tw ([fe80::48bb:4f38:369c:d153%9]) with mapi id
 15.01.2507.035; Fri, 1 Mar 2024 16:12:41 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Headset Mic no show at resume back
Thread-Topic: Headset Mic no show at resume back
Thread-Index: AdprsAuBN35N4JkKR/GD319vZaF9qg==
Date: Fri, 1 Mar 2024 08:12:41 +0000
Message-ID: <4713d48a372e47f98bba0c6120fd8254@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_4713d48a372e47f98bba0c6120fd8254realtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: 2UBHPYONFXVWPZXXOW5ODCDELK7XABSP
X-Message-ID-Hash: 2UBHPYONFXVWPZXXOW5ODCDELK7XABSP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2UBHPYONFXVWPZXXOW5ODCDELK7XABSP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_4713d48a372e47f98bba0c6120fd8254realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch will fix headset Mic no show issue.

BR,
Kailang

--_002_4713d48a372e47f98bba0c6120fd8254realtekcom_
Content-Type: application/octet-stream;
	name="0000-lenovo-alc897-dtop-hsmic.patch"
Content-Description: 0000-lenovo-alc897-dtop-hsmic.patch
Content-Disposition: attachment;
	filename="0000-lenovo-alc897-dtop-hsmic.patch"; size=1451;
	creation-date="Fri, 01 Mar 2024 07:31:43 GMT";
	modification-date="Fri, 01 Mar 2024 08:09:13 GMT"
Content-Transfer-Encoding: base64

RnJvbSA5ZTMyMDEzYmNlMjA5MGM4MzQ1MzgwZjk0YjcwNTIwYzMxNjA4NTg5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IEZyaSwgMSBNYXIgMjAyNCAxNToyOTo1MCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gRml4IGhlYWRzZXQgTWljIG5vIHNob3cgYXQgcmVzdW1lIGJhY2sgZm9y
IExlbm92byBBTEM4OTcgcGxhdGZvcm0KCkhlYWRzZXQgTWljIHdpbGwgbm8gc2hvdyBhdCByZXN1
bWUgYmFjay4KVGhpcyBwYXRjaCB3aWxsIGZpeCB0aGlzIGlzc3VlLgoKRml4ZXM6IGQ3ZjMyNzkx
YTlmYyAoIkFMU0E6IGhkYS9yZWFsdGVrIC0gQWRkIGhlYWRzZXQgTWljIHN1cHBvcnQgZm9yIExl
bm92byBBTEM4OTcgcGxhdGZvcm0iKQpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxh
bmdAcmVhbHRlay5jb20+CmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsu
YyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4IGYxMTJlYjFhODY4Zi4uZDcx
NTIwODU4YjVmIDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYworKysg
Yi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAtMTE1NzEsOCArMTE1NzEsNyBAQCBz
dGF0aWMgdm9pZCBhbGM4OTdfaHBfYXV0b211dGVfaG9vayhzdHJ1Y3QgaGRhX2NvZGVjICpjb2Rl
YywKIAogCXNuZF9oZGFfZ2VuX2hwX2F1dG9tdXRlKGNvZGVjLCBqYWNrKTsKIAl2cmVmID0gc3Bl
Yy0+Z2VuLmhwX2phY2tfcHJlc2VudCA/IChQSU5fSFAgfCBBQ19QSU5DVExfVlJFRl8xMDApIDog
UElOX0hQOwotCXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIDB4MWIsIDAsIEFDX1ZFUkJfU0VU
X1BJTl9XSURHRVRfQ09OVFJPTCwKLQkJCSAgICB2cmVmKTsKKwlzbmRfaGRhX3NldF9waW5fY3Rs
KGNvZGVjLCAweDFiLCB2cmVmKTsKIH0KIAogc3RhdGljIHZvaWQgYWxjODk3X2ZpeHVwX2xlbm92
b19oZWFkc2V0X21pYyhzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYywKQEAgLTExNTgxLDYgKzExNTgw
LDEwIEBAIHN0YXRpYyB2b2lkIGFsYzg5N19maXh1cF9sZW5vdm9faGVhZHNldF9taWMoc3RydWN0
IGhkYV9jb2RlYyAqY29kZWMsCiAJc3RydWN0IGFsY19zcGVjICpzcGVjID0gY29kZWMtPnNwZWM7
CiAJaWYgKGFjdGlvbiA9PSBIREFfRklYVVBfQUNUX1BSRV9QUk9CRSkgewogCQlzcGVjLT5nZW4u
aHBfYXV0b211dGVfaG9vayA9IGFsYzg5N19ocF9hdXRvbXV0ZV9ob29rOworCQlzcGVjLT5ub19z
aHV0dXBfcGlucyA9IDE7CisJfQorCWlmIChhY3Rpb24gPT0gSERBX0ZJWFVQX0FDVF9QUk9CRSkg
eworCQlzbmRfaGRhX3NldF9waW5fY3RsX2NhY2hlKGNvZGVjLCAweDFhLCBQSU5fSU4gfCBBQ19Q
SU5DVExfVlJFRl8xMDApOwogCX0KIH0KIAo=

--_002_4713d48a372e47f98bba0c6120fd8254realtekcom_--
