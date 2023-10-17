Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4597CBCC0
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Oct 2023 09:50:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 368C0836;
	Tue, 17 Oct 2023 09:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 368C0836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697529009;
	bh=4BRBJ7YSMS3iZAwCUtYqO3l0TnntyGaTEHAkeqjE7Xk=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jlRCBOlcx/0//QpfEmKDTiA9AjPyD3CcTnU4xdr1feTuretwcsfmNKfeAq9SfJhpU
	 fcreonRz5AjrJNpeFc2+4GUfKYIbLOhYqXG/30kJavsjhYwY4pAh+hXpX1v2ysdWts
	 rXEzsYtYvaJQdhEdWppBUHIpX+BAYCWaNwsSiZmI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0349F80236; Tue, 17 Oct 2023 09:49:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AEF0BF80236;
	Tue, 17 Oct 2023 09:49:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12ADEF8024E; Tue, 17 Oct 2023 09:49:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB193F8019B
	for <alsa-devel@alsa-project.org>; Tue, 17 Oct 2023 09:49:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB193F8019B
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 39H7n5ovD3906104,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.93/5.92) with ESMTPS id 39H7n5ovD3906104
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Oct 2023 15:49:05 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Tue, 17 Oct 2023 15:49:04 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 17 Oct 2023 15:49:02 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b]) by
 RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b%5]) with mapi id
 15.01.2375.007; Tue, 17 Oct 2023 15:49:02 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Enable Headset Mic for ASUS ALC256 platform
Thread-Topic: Enable Headset Mic for ASUS ALC256 platform
Thread-Index: AdoAzjuA8xmIdx4ORIi1WzIIpLmZsQ==
Date: Tue, 17 Oct 2023 07:49:02 +0000
Message-ID: <1155d914c20c40569f56d36c79254879@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXDAG02.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_1155d914c20c40569f56d36c79254879realtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: 67OBI2YKVL2ULU2M7TWMZSYKES2N5ZUY
X-Message-ID-Hash: 67OBI2YKVL2ULU2M7TWMZSYKES2N5ZUY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/67OBI2YKVL2ULU2M7TWMZSYKES2N5ZUY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_1155d914c20c40569f56d36c79254879realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch was enable headset Mic for ASUS ALC256 platform.

BR,
Kailang

--_002_1155d914c20c40569f56d36c79254879realtekcom_
Content-Type: application/octet-stream;
	name="0000-alc256-asus-headset-mic.patch"
Content-Description: 0000-alc256-asus-headset-mic.patch
Content-Disposition: attachment;
	filename="0000-alc256-asus-headset-mic.patch"; size=2104;
	creation-date="Fri, 13 Oct 2023 07:57:53 GMT";
	modification-date="Tue, 17 Oct 2023 07:37:53 GMT"
Content-Transfer-Encoding: base64

RnJvbSA1YzdmZDU2NGY2YWU4Y2Q1YTRhZDkyMjNkNmIxMWQ5MDllYjRmM2YwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFR1ZSwgMTcgT2N0IDIwMjMgMTU6MzA6MjQgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEZpeGVkIEFTVVMgcGxhdGZvcm0gaGVhZHNldCBNaWMgaXNzdWUKCkFT
VVMgcGxhdGZvcm0gSGVhZHNldCBNaWMgd2FzIGRpc2FibGUgYnkgZGVmYXVsdC4KQXNzaWduZWQg
dmVyYiB0YWJsZSBmb3IgTWljIHBpbiB3aWxsIGVuYWJsZSBpdC4KClNpZ25lZC1vZmYtYnk6IEth
aWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4KZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9o
ZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKaW5kZXgg
NDMwMWU3N2VjOGMzLi4wYTdlNTZjNmQ2ZmMgMTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0
Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCkBAIC03MTU5
LDYgKzcxNTksMjQgQEAgc3RhdGljIHZvaWQgYWxjMjg3X2ZpeHVwX2JpbmRfZGFjcyhzdHJ1Y3Qg
aGRhX2NvZGVjICpjb2RlYywKIAkJCQkJMHgwKTsgLyogTWFrZSBzdXJlIDB4MTQgd2FzIGRpc2Fi
bGUgKi8KIAl9CiB9CisvKiBGaXggbm9uZSB2ZXJiIHRhYmxlIG9mIEhlYWRzZXQgTWljIHBpbiAq
Lworc3RhdGljIHZvaWQgYWxjX2ZpeHVwX2hlYWRzZXRfbWljKHN0cnVjdCBoZGFfY29kZWMgKmNv
ZGVjLAorCQkJCSAgIGNvbnN0IHN0cnVjdCBoZGFfZml4dXAgKmZpeCwgaW50IGFjdGlvbikKK3sK
KwlzdHJ1Y3QgYWxjX3NwZWMgKnNwZWMgPSBjb2RlYy0+c3BlYzsKKwlzdGF0aWMgY29uc3Qgc3Ry
dWN0IGhkYV9waW50YmwgcGluY2Znc1tdID0geworCQl7IDB4MTksIDB4MDNhMTEwM2MgfSwKKwkJ
eyB9CisJfTsKKworCXN3aXRjaCAoYWN0aW9uKSB7CisJY2FzZSBIREFfRklYVVBfQUNUX1BSRV9Q
Uk9CRToKKwkJc25kX2hkYV9hcHBseV9waW5jZmdzKGNvZGVjLCBwaW5jZmdzKTsKKwkJYWxjX3Vw
ZGF0ZV9jb2VmX2lkeChjb2RlYywgMHg0NSwgMHhmPDwxMiB8IDE8PDEwLCA1PDwxMik7CisJCXNw
ZWMtPnBhcnNlX2ZsYWdzIHw9IEhEQV9QSU5DRkdfSEVBRFNFVF9NSUM7CisJCWJyZWFrOworCX0K
K30KIAogCiBlbnVtIHsKQEAgLTc0MjUsNiArNzQ0Myw3IEBAIGVudW0gewogCUFMQzI0NV9GSVhV
UF9IUF9YMzYwX01VVEVfTEVEUywKIAlBTEMyODdfRklYVVBfVEhJTktQQURfSTJTX1NQSywKIAlB
TEMyODdfRklYVVBfTUdfUlRLQ19DU0FNUF9DUzM1TDQxX0kyQ19USElOS1BBRCwKKwlBTEMyWFhf
RklYVVBfSEVBRFNFVF9NSUMsCiB9OwogCiAvKiBBIHNwZWNpYWwgZml4dXAgZm9yIExlbm92byBD
OTQwIGFuZCBZb2dhIER1ZXQgNzsKQEAgLTk1MjksNiArOTU0OCwxMCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGhkYV9maXh1cCBhbGMyNjlfZml4dXBzW10gPSB7CiAJCS5jaGFpbmVkID0gdHJ1ZSwK
IAkJLmNoYWluX2lkID0gQUxDMjg3X0ZJWFVQX0NTMzVMNDFfSTJDXzJfVEhJTktQQURfQUNQSSwK
IAl9LAorCVtBTEMyWFhfRklYVVBfSEVBRFNFVF9NSUNdID0geworCQkudHlwZSA9IEhEQV9GSVhV
UF9GVU5DLAorCQkudi5mdW5jID0gYWxjX2ZpeHVwX2hlYWRzZXRfbWljLAorCX0sCiB9OwogCiBz
dGF0aWMgY29uc3Qgc3RydWN0IHNuZF9wY2lfcXVpcmsgYWxjMjY5X2ZpeHVwX3RibFtdID0gewpA
QCAtMTA4MzEsNiArMTA4NTQsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9oZGFfcGluX3F1
aXJrIGFsYzI2OV9mYWxsYmFja19waW5fZml4dXBfdGJsW10gPSB7CiAJU05EX0hEQV9QSU5fUVVJ
UksoMHgxMGVjMDI3NCwgMHgxMDI4LCAiRGVsbCIsIEFMQzI3NF9GSVhVUF9ERUxMX0FJT19MSU5F
T1VUX1ZFUkIsCiAJCXsweDE5LCAweDQwMDAwMDAwfSwKIAkJezB4MWEsIDB4NDAwMDAwMDB9KSwK
KwlTTkRfSERBX1BJTl9RVUlSSygweDEwZWMwMjU2LCAweDEwNDMsICJBU1VTIiwgQUxDMlhYX0ZJ
WFVQX0hFQURTRVRfTUlDLAorCQl7MHgxOSwgMHg0MDAwMDAwMH0pLAogCXt9CiB9OwogCg==

--_002_1155d914c20c40569f56d36c79254879realtekcom_--
