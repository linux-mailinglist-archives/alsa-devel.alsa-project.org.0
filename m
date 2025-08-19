Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 763BDB2B952
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Aug 2025 08:21:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4C98601FC;
	Tue, 19 Aug 2025 08:20:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4C98601FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755584463;
	bh=NapvAPxGFgTPBOxpp8PZcUkuTxgCbiS0lBHZcxteJiE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rXqJgryyeB5JRWSl/1ppHWP1NyWq0u4vXxqn1VK6B4FfT23wHm8I+onEBoAh5PLuk
	 UyC+Kz5qwUaydkwQd6Ncq8e9UssOZu5he0RhKjl61VraHKSaDj3kINOa6rpfFLRcUW
	 4tddLnN4afy39i8qcj6A5Oi8/JVDbTPcJykiwvvA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B378AF805C8; Tue, 19 Aug 2025 08:20:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE793F805C9;
	Tue, 19 Aug 2025 08:20:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD85CF80134; Tue, 19 Aug 2025 08:20:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CA3DF80134
	for <alsa-devel@alsa-project.org>; Tue, 19 Aug 2025 08:19:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CA3DF80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=fZ2Nkhdw
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 57J6JldkE2235434,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1755584387; bh=UvFgyS0ux22zTRzpnuy5sJ67IAUrFQKNZEb+skSbRl0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=fZ2NkhdwEfvt8HyJrfrr4UouAiAzQNtPtR/L1zspMxY8I1vBMiG7+EYM6vd6pWVoD
	 p3BTb2dYredT/ZT4pd3hPCzb4dVGHz7I8s+TKNAzi6dJXf7NnrS+N8A+qeUXuu0icM
	 BFvhoosthRsud+yKEbpDdc1K/RX58/Hf0z477BE84WfW60wSmVTSAGFz0WzmmUejyR
	 8f/8QGbx3gBE7KWMzkboUKKY+JJSrJvZLHKxCIkpamQh2158blS3O8HXBUjXSA0vTI
	 aVwLUliyJFHguujUjQkgV9L3/GKZlSeEuioa2TSztGtftCM8QSy3IAkZ7NhQXakzWN
	 qh2UPIIfasQtw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 57J6JldkE2235434
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 Aug 2025 14:19:47 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 19 Aug 2025 14:19:47 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Aug 2025 14:19:46 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Tue, 19 Aug 2025 14:19:46 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Bug 220109 - Audio disappears on HP 15-fc000 after warm boot again
Thread-Topic: Bug 220109 - Audio disappears on HP 15-fc000 after warm boot
 again
Thread-Index: AdwQ0QfLY4QVx7zfRsqbBhsvzBpmqw==
Date: Tue, 19 Aug 2025 06:19:45 +0000
Message-ID: <5317ca723c82447a938414fcca85cbf5@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.21.6.42]
Content-Type: multipart/mixed;
	boundary="_002_5317ca723c82447a938414fcca85cbf5realtekcom_"
MIME-Version: 1.0
Message-ID-Hash: 63RTPVZ2IWBC3E6XJWHR5EZQ2IXUZS5Z
X-Message-ID-Hash: 63RTPVZ2IWBC3E6XJWHR5EZQ2IXUZS5Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/63RTPVZ2IWBC3E6XJWHR5EZQ2IXUZS5Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_5317ca723c82447a938414fcca85cbf5realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch will solve issue.

BR,
Kailang

--_002_5317ca723c82447a938414fcca85cbf5realtekcom_
Content-Type: application/octet-stream; name="0000-15-fc000.patch"
Content-Description: 0000-15-fc000.patch
Content-Disposition: attachment; filename="0000-15-fc000.patch"; size=2483;
	creation-date="Tue, 19 Aug 2025 06:08:47 GMT";
	modification-date="Tue, 19 Aug 2025 06:16:52 GMT"
Content-Transfer-Encoding: base64

RnJvbSBmNGY4MDk1Y2E0ZDhmYmQ0ZjMwMTI2MGY0ZDJjMmQ3M2VkN2ZhMzc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFR1ZSwgMTkgQXVnIDIwMjUgMTQ6MDM6NDQgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlazogQXVkaW8gZGlzYXBwZWFycyBvbiBIUCAxNS1mYzAwMCBhZnRlciB3YXJt
IGJvb3QgYWdhaW4KClRoZXJlIHdhcyBhIHNpbWlsYXIgYnVnIGluIHRoZSBwYXN0IChCdWcgMjE3
NDQwKSwgd2hpY2ggd2FzIGZpeGVkIGZvciB0aGlzIGxhcHRvcC4gClRoZSBzYW1lIGlzc3VlIGlz
IG9jY3VycmluZyBhZ2FpbiBhcyBvZiBrZXJuZWwgdi42LjEyLjIuIFRoZSBzeW1wdG9tcyBhcmUg
dmVyeSBzaW1pbGFyIAotIGluaXRpYWxseSBhdWRpbyB3b3JrcyBidXQgYWZ0ZXIgYSB3YXJtIHJl
Ym9vdCwgdGhlIGF1ZGlvIGNvbXBsZXRlbHkgZGlzYXBwZWFycyB1bnRpbCAKdGhlIGNvbXB1dGVy
IGlzIHBvd2VyZWQgb2ZmICh0aGVyZSBpcyBubyBhdWRpbyBvdXRwdXQgYXQgYWxsKS4KClRoZSBp
c3N1ZSBpcyBhbHNvIHJlbGF0ZWQgYnkgY2F1c2VkIGJ5IGEgZGlmZmVyZW50IGNoYW5nZSBub3cu
IEJ5IGJpc2VjdGluZyBkaWZmZXJlbnQga2VybmVsIHZlcnNpb25zLApJIGZvdW5kIHRoYXQgcmV2
ZXJ0aW5nIGNjM2QwYjVkZDk4OWQzMjM4ZDQ1NmY5ZmQzODU5NDYzNzlhOWMxM2QgaW4gcGF0Y2hf
cmVhbHRlay5jIAooIHNlZSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0
ZWsuYz9oPXY2LjEyLjImaWQ9NGVkN2YxNjA3MGE4NDc1YzA4OGZmNDIzYjJlYjExYmExNWViODli
NiApCnJlc3RvcmVzIHRoZSBzb3VuZCBhbmQgaXQgd29ya3MgZmluZSBhZnRlciB0aGUgcmVib290
LgoKTGluazogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMjAx
MDkKU2lnbmVkLW9mZi1ieTogS2FpbGFuZyBZYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgoKZGlm
ZiAtLWdpdCBhL3NvdW5kL2hkYS9jb2RlY3MvcmVhbHRlay9hbGMyNjkuYyBiL3NvdW5kL2hkYS9j
b2RlY3MvcmVhbHRlay9hbGMyNjkuYwppbmRleCBhNGM1NGRhMzliNDcuLmNkZmI5ZGYxNTg0YiAx
MDA2NDQKLS0tIGEvc291bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2FsYzI2OS5jCisrKyBiL3NvdW5k
L2hkYS9jb2RlY3MvcmVhbHRlay9hbGMyNjkuYwpAQCAtNTEwLDYgKzUxMCwxNSBAQCBzdGF0aWMg
dm9pZCBhbGMyNTZfc2h1dHVwKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCQlocF9waW4gPSAw
eDIxOwogCiAJYWxjX3VwZGF0ZV9jb2VmZXhfaWR4KGNvZGVjLCAweDU3LCAweDA0LCAweDAwMDcs
IDB4MSk7IC8qIExvdyBwb3dlciAqLworCisJLyogM2sgcHVsbCBsb3cgY29udHJvbCBmb3IgSGVh
ZHNldCBqYWNrLiAqLworCS8qIE5PVEU6IGNhbGwgdGhpcyBiZWZvcmUgY2xlYXJpbmcgdGhlIHBp
biwgb3RoZXJ3aXNlIGNvZGVjIHN0YWxscyAqLworCS8qIElmIGRpc2FibGUgM2sgcHVsbGRvd24g
Y29udHJvbCBmb3IgYWxjMjU3LCB0aGUgTWljIGRldGVjdGlvbiB3aWxsIG5vdCB3b3JrIGNvcnJl
Y3RseQorCSAqIHdoZW4gYm9vdGluZyB3aXRoIGhlYWRzZXQgcGx1Z2dlZC4gU28gc2tpcCBzZXR0
aW5nIGl0IGZvciB0aGUgY29kZWMgYWxjMjU3CisJICovCisJaWYgKHNwZWMtPmVuXzNrcHVsbF9s
b3cpCisJCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4NDYsIDAsIDMgPDwgMTIpOworCiAJ
aHBfcGluX3NlbnNlID0gc25kX2hkYV9qYWNrX2RldGVjdChjb2RlYywgaHBfcGluKTsKIAogCWlm
IChocF9waW5fc2Vuc2UpIHsKQEAgLTUyMCwxNCArNTI5LDYgQEAgc3RhdGljIHZvaWQgYWxjMjU2
X3NodXR1cChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAogCQltc2xlZXAoNzUpOwogCi0JLyog
M2sgcHVsbCBsb3cgY29udHJvbCBmb3IgSGVhZHNldCBqYWNrLiAqLwotCS8qIE5PVEU6IGNhbGwg
dGhpcyBiZWZvcmUgY2xlYXJpbmcgdGhlIHBpbiwgb3RoZXJ3aXNlIGNvZGVjIHN0YWxscyAqLwot
CS8qIElmIGRpc2FibGUgM2sgcHVsbGRvd24gY29udHJvbCBmb3IgYWxjMjU3LCB0aGUgTWljIGRl
dGVjdGlvbiB3aWxsIG5vdCB3b3JrIGNvcnJlY3RseQotCSAqIHdoZW4gYm9vdGluZyB3aXRoIGhl
YWRzZXQgcGx1Z2dlZC4gU28gc2tpcCBzZXR0aW5nIGl0IGZvciB0aGUgY29kZWMgYWxjMjU3Ci0J
ICovCi0JCWlmIChzcGVjLT5lbl8za3B1bGxfbG93KQotCQkJYWxjX3VwZGF0ZV9jb2VmX2lkeChj
b2RlYywgMHg0NiwgMCwgMyA8PCAxMik7Ci0KIAkJaWYgKCFzcGVjLT5ub19zaHV0dXBfcGlucykK
IAkJCXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIGhwX3BpbiwgMCwKIAkJCQkgICAgQUNfVkVS
Ql9TRVRfUElOX1dJREdFVF9DT05UUk9MLCAweDApOwo=

--_002_5317ca723c82447a938414fcca85cbf5realtekcom_--
