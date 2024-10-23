Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF3D9AC1BA
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2024 10:33:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2DC6A4D;
	Wed, 23 Oct 2024 10:33:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2DC6A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729672406;
	bh=PXoGPnALUjX/puvxoXB0mLRhSu4ViCSlNG2WIB/jj+M=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lYP7RMvRZYWg8UJQrL2Z0Ev1kObe3NH5kuaHpJMiKLuLGWDXQI641c8dN7onQpQOt
	 YUN5rXHtBgVpllrWboTcGkUkI3kWNfdeigMA3d5oSxJ8h2tPDKgIu66rHWmIyL53ZK
	 OQLxVmtm8eCqjCVq4SmxdcfrOpK6/qYC1nhU4oxE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D8C9F80272; Wed, 23 Oct 2024 10:32:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C4C2F805B1;
	Wed, 23 Oct 2024 10:32:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD26BF8016C; Wed, 23 Oct 2024 10:32:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78170F80104
	for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2024 10:32:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78170F80104
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=BZivyTTE
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 49N8WbAY21208590,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1729672357; bh=PXoGPnALUjX/puvxoXB0mLRhSu4ViCSlNG2WIB/jj+M=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=BZivyTTE3CicoVd6We28nQ8/1NiQDkszmCYDGsHAIafEx3HhoNNahxqSHC9Onmt/v
	 yoR4m6EVMKkHXn3+X1+eVjwQt1j0updgTRRLMxgfLw4nbDw+4UwYDdCjEEhiITa5vp
	 kuVpkKX9NIxTiw/ndVFwnZ+Q1c+ClKxjd4C5se3/sUTsUoD3utNjPWZD6FRRn4SxwQ
	 Udz7V/jrF/XeiJL55KjbJqQOTv/9MAw5CTmAVZJF1DK2XE03RPaK+v9HVEuFahX3Bo
	 ID/GeuRNzXRK2X+G0k3NhW3wb1fZ/pSrZYZ66GCvrUlB5OAsv7WNKrSxTmMzww7cTm
	 6Je90DZ6rdqHg==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 49N8WbAY21208590
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Oct 2024 16:32:37 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 16:32:37 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 23 Oct 2024 16:32:37 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2]) by
 RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2%7]) with mapi id
 15.01.2507.035; Wed, 23 Oct 2024 16:32:37 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Update default depop procedure
Thread-Topic: Update default depop procedure
Thread-Index: AdslJX6/J7v0Yw5kRRyTUFp3qmxZGQ==
Date: Wed, 23 Oct 2024 08:32:37 +0000
Message-ID: <17b717a0a0b04a77aea4a8ec820cba13@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.21.6.42]
Content-Type: multipart/mixed;
	boundary="_002_17b717a0a0b04a77aea4a8ec820cba13realtekcom_"
MIME-Version: 1.0
Message-ID-Hash: E22BG5M542FDGNRZCJ72OQHAT4YEUQU5
X-Message-ID-Hash: E22BG5M542FDGNRZCJ72OQHAT4YEUQU5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E22BG5M542FDGNRZCJ72OQHAT4YEUQU5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_17b717a0a0b04a77aea4a8ec820cba13realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch will solve issue which Headphone has a chance no sound.
Many Thanks.

BR,
Kailang

--_002_17b717a0a0b04a77aea4a8ec820cba13realtekcom_
Content-Type: application/octet-stream;
	name="0000-default-init-shutup-change.patch"
Content-Description: 0000-default-init-shutup-change.patch
Content-Disposition: attachment;
	filename="0000-default-init-shutup-change.patch"; size=1998;
	creation-date="Wed, 23 Oct 2024 08:15:22 GMT";
	modification-date="Wed, 23 Oct 2024 08:27:14 GMT"
Content-Transfer-Encoding: base64

RnJvbSBmNzNjZTBkN2VjMWEwNWQzZGJkMGViZTAwOGNlZmE3YmRjZTNjZGZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFdlZCwgMjMgT2N0IDIwMjQgMTY6MTM6MTAgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlazogVXBkYXRlIGRlZmF1bHQgZGVwb3AgcHJvY2VkdXJlCgpPbGQgcHJvY2Vk
dXJlIGhhcyBhIGNoYW5jZSB0byBtZWV0IEhlYWRwaG9uZSBubyBvdXRwdXQuCgpTaWduZWQtb2Zm
LWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CmRpZmYgLS1naXQgYS9zb3Vu
ZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5j
CmluZGV4IDFjMWE2NjhkYzBlMC4uZDY1ODQ4ODY2ZTQ3IDEwMDY0NAotLS0gYS9zb3VuZC9wY2kv
aGRhL3BhdGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpA
QCAtMzg2OCwyMCArMzg2OCwxOCBAQCBzdGF0aWMgdm9pZCBhbGNfZGVmYXVsdF9pbml0KHN0cnVj
dCBoZGFfY29kZWMgKmNvZGVjKQogCiAJaHBfcGluX3NlbnNlID0gc25kX2hkYV9qYWNrX2RldGVj
dChjb2RlYywgaHBfcGluKTsKIAotCWlmIChocF9waW5fc2Vuc2UpCisJaWYgKGhwX3Bpbl9zZW5z
ZSkgewogCQltc2xlZXAoMik7CiAKLQlzbmRfaGRhX2NvZGVjX3dyaXRlKGNvZGVjLCBocF9waW4s
IDAsCi0JCQkgICAgQUNfVkVSQl9TRVRfQU1QX0dBSU5fTVVURSwgQU1QX09VVF9NVVRFKTsKLQot
CWlmIChocF9waW5fc2Vuc2UpCi0JCW1zbGVlcCg4NSk7CisJCXNuZF9oZGFfY29kZWNfd3JpdGUo
Y29kZWMsIGhwX3BpbiwgMCwKKwkJCQkgICAgQUNfVkVSQl9TRVRfUElOX1dJREdFVF9DT05UUk9M
LCBQSU5fT1VUKTsKIAotCXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIGhwX3BpbiwgMCwKLQkJ
CSAgICBBQ19WRVJCX1NFVF9QSU5fV0lER0VUX0NPTlRST0wsIFBJTl9PVVQpOworCQltc2xlZXAo
NzUpOwogCi0JaWYgKGhwX3Bpbl9zZW5zZSkKLQkJbXNsZWVwKDEwMCk7CisJCXNuZF9oZGFfY29k
ZWNfd3JpdGUoY29kZWMsIGhwX3BpbiwgMCwKKwkJCQkgICAgQUNfVkVSQl9TRVRfQU1QX0dBSU5f
TVVURSwgQU1QX09VVF9VTk1VVEUpOworCQltc2xlZXAoNzUpOworCX0KIH0KIAogc3RhdGljIHZv
aWQgYWxjX2RlZmF1bHRfc2h1dHVwKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQpAQCAtMzg5Nywy
MiArMzg5NSwyMCBAQCBzdGF0aWMgdm9pZCBhbGNfZGVmYXVsdF9zaHV0dXAoc3RydWN0IGhkYV9j
b2RlYyAqY29kZWMpCiAKIAlocF9waW5fc2Vuc2UgPSBzbmRfaGRhX2phY2tfZGV0ZWN0KGNvZGVj
LCBocF9waW4pOwogCi0JaWYgKGhwX3Bpbl9zZW5zZSkKKwlpZiAoaHBfcGluX3NlbnNlKSB7CiAJ
CW1zbGVlcCgyKTsKIAotCXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIGhwX3BpbiwgMCwKLQkJ
CSAgICBBQ19WRVJCX1NFVF9BTVBfR0FJTl9NVVRFLCBBTVBfT1VUX01VVEUpOwotCi0JaWYgKGhw
X3Bpbl9zZW5zZSkKLQkJbXNsZWVwKDg1KTsKLQotCWlmICghc3BlYy0+bm9fc2h1dHVwX3BpbnMp
CiAJCXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIGhwX3BpbiwgMCwKLQkJCQkgICAgQUNfVkVS
Ql9TRVRfUElOX1dJREdFVF9DT05UUk9MLCAweDApOworCQkJCSAgICBBQ19WRVJCX1NFVF9BTVBf
R0FJTl9NVVRFLCBBTVBfT1VUX01VVEUpOwogCi0JaWYgKGhwX3Bpbl9zZW5zZSkKLQkJbXNsZWVw
KDEwMCk7CisJCW1zbGVlcCg3NSk7CiAKKwkJaWYgKCFzcGVjLT5ub19zaHV0dXBfcGlucykKKwkJ
CXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIGhwX3BpbiwgMCwKKwkJCQkJICAgIEFDX1ZFUkJf
U0VUX1BJTl9XSURHRVRfQ09OVFJPTCwgMHgwKTsKKworCQltc2xlZXAoNzUpOworCX0KIAlhbGNf
YXV0b19zZXR1cF9lYXBkKGNvZGVjLCBmYWxzZSk7CiAJYWxjX3NodXR1cF9waW5zKGNvZGVjKTsK
IH0K

--_002_17b717a0a0b04a77aea4a8ec820cba13realtekcom_--
