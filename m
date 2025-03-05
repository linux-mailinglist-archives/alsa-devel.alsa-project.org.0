Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E348CA4F726
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 07:32:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7474F602A0;
	Wed,  5 Mar 2025 07:32:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7474F602A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741156377;
	bh=v7uXc7+qtBsPOjzkJEp+GYBDzTNQWSX6MDCYF/ovWUI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OVF//2EeU+4jI04SeeY8gEH4rJBdJpO90Fb40dx0vuuWCu4rh9TxxZr47U7RBTwm3
	 GW8onA3dPM7+gxnpuyx5RHcslYTeDDpp04JtDvt5I/P2QvcZbzmSoPwzugE94yOkJ0
	 ovK0ltCHvqmDBIMZ5P8qHj8PyvxJQBp0ZliEA+/4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 176E6F805C0; Wed,  5 Mar 2025 07:32:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8FF7F805BE;
	Wed,  5 Mar 2025 07:32:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06792F802BE; Wed,  5 Mar 2025 07:32:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_20,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3BBBDF80171
	for <alsa-devel@alsa-project.org>; Wed,  5 Mar 2025 07:32:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BBBDF80171
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=OEApZaWc
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 5256W0xE41038228,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1741156320; bh=v7uXc7+qtBsPOjzkJEp+GYBDzTNQWSX6MDCYF/ovWUI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=OEApZaWcp6FxRIR5V306PrpsJKc3SUx+aIKgYAu8JB33m4hNQjf88SkAjVSJIq+AR
	 KuMlS5hNKkSu33DVb2f9X5kKv3yR8wZHLi5mj60KtrrnFgYWX6BZLlp3O/LIhEBdrz
	 m6b11loL4V8HL+KHdiCJt3yk5ltewkxO2GOvVRXCuz+BxkKcZKmGyAqXb9D1r1kJKc
	 zkj9kJ/1Gai6Co09tiWWn49UBPO+gIqFAk89mh4hc0WVyTDEtZsJxAfc9BEptWdZAe
	 hRQDdZ0SE/0VwnLgaSUCnXe1NGQyQlncW1/8VDZeKi0JJUKDm5h/wF7q2m2x/SuPuV
	 wxjwzUNswmncg==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 5256W0xE41038228
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Mar 2025 14:32:00 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Mar 2025 14:32:01 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 5 Mar 2025 14:32:00 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Wed, 5 Mar 2025 14:32:00 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: update ALC222 depop optimize
Thread-Topic: update ALC222 depop optimize
Thread-Index: AduNl/Z/2i7zvjW2RduQNmX+QwAWAA==
Date: Wed, 5 Mar 2025 06:32:00 +0000
Message-ID: <81c7f0ec4a2447219c06095e0de4d1d3@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.21.6.42]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_81c7f0ec4a2447219c06095e0de4d1d3realtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: QVSZEA25K4ROUK55DLSGKQHLOWNJRFAZ
X-Message-ID-Hash: QVSZEA25K4ROUK55DLSGKQHLOWNJRFAZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QVSZEA25K4ROUK55DLSGKQHLOWNJRFAZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_81c7f0ec4a2447219c06095e0de4d1d3realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Update ALC222 depop optimize as attach.

BR,
Kailang

--_002_81c7f0ec4a2447219c06095e0de4d1d3realtekcom_
Content-Type: application/octet-stream;
	name="0000-alc222-dual-hp-depop.patch"
Content-Description: 0000-alc222-dual-hp-depop.patch
Content-Disposition: attachment; filename="0000-alc222-dual-hp-depop.patch";
	size=2897; creation-date="Thu, 23 Jan 2025 07:10:01 GMT";
	modification-date="Wed, 05 Mar 2025 06:26:38 GMT"
Content-Transfer-Encoding: base64

RnJvbSBiODE4YjZhNGY4YmJlMDMxYzVhODVkMzI1Yzg5ZmMwYmJjYmQ1ZTVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFdlZCwgNSBNYXIgMjAyNSAxMzo1NDozNCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrOiB1cGRhdGUgQUxDMjIyIGRlcG9wIG9wdGltaXplCgpBZGQgQUxDMjIyIGl0
cyBvd24gZGVwb3AgZnVuY3Rpb25zIGZvciBhbGNfaW5pdCBhbmQgYWxjX3NodXR1cC4KClNpZ25l
ZC1vZmYtYnk6IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4KCmRpZmYgLS1naXQg
YS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVh
bHRlay5jCmluZGV4IGNhMTBiOWU5ZTNhNC4uNzA2YTM1NTA5NTE4IDEwMDY0NAotLS0gYS9zb3Vu
ZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0
ZWsuYwpAQCAtMzg0NCw2ICszODQ0LDc5IEBAIHN0YXRpYyB2b2lkIGFsYzIyNV9zaHV0dXAoc3Ry
dWN0IGhkYV9jb2RlYyAqY29kZWMpCiAJfQogfQogCitzdGF0aWMgdm9pZCBhbGMyMjJfaW5pdChz
dHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKK3sKKwlzdHJ1Y3QgYWxjX3NwZWMgKnNwZWMgPSBjb2Rl
Yy0+c3BlYzsKKwloZGFfbmlkX3QgaHBfcGluID0gYWxjX2dldF9ocF9waW4oc3BlYyk7CisJYm9v
bCBocDFfcGluX3NlbnNlLCBocDJfcGluX3NlbnNlOworCisJaWYgKCFocF9waW4pCisJCXJldHVy
bjsKKworCW1zbGVlcCgzMCk7CisKKwlocDFfcGluX3NlbnNlID0gc25kX2hkYV9qYWNrX2RldGVj
dChjb2RlYywgaHBfcGluKTsKKwlocDJfcGluX3NlbnNlID0gc25kX2hkYV9qYWNrX2RldGVjdChj
b2RlYywgMHgxNCk7CisKKwlpZiAoaHAxX3Bpbl9zZW5zZSB8fCBocDJfcGluX3NlbnNlKSB7CisJ
CW1zbGVlcCgyKTsKKworCQlpZiAoaHAxX3Bpbl9zZW5zZSkKKwkJCXNuZF9oZGFfY29kZWNfd3Jp
dGUoY29kZWMsIGhwX3BpbiwgMCwKKwkJCQkgICAgQUNfVkVSQl9TRVRfUElOX1dJREdFVF9DT05U
Uk9MLCBQSU5fT1VUKTsKKwkJaWYgKGhwMl9waW5fc2Vuc2UpCisJCQlzbmRfaGRhX2NvZGVjX3dy
aXRlKGNvZGVjLCAweDE0LCAwLAorCQkJCSAgICBBQ19WRVJCX1NFVF9QSU5fV0lER0VUX0NPTlRS
T0wsIFBJTl9PVVQpOworCQltc2xlZXAoNzUpOworCisJCWlmIChocDFfcGluX3NlbnNlKQorCQkJ
c25kX2hkYV9jb2RlY193cml0ZShjb2RlYywgaHBfcGluLCAwLAorCQkJCSAgICBBQ19WRVJCX1NF
VF9BTVBfR0FJTl9NVVRFLCBBTVBfT1VUX1VOTVVURSk7CisJCWlmIChocDJfcGluX3NlbnNlKQor
CQkJc25kX2hkYV9jb2RlY193cml0ZShjb2RlYywgMHgxNCwgMCwKKwkJCQkgICAgQUNfVkVSQl9T
RVRfQU1QX0dBSU5fTVVURSwgQU1QX09VVF9VTk1VVEUpOworCisJCW1zbGVlcCg3NSk7CisJfQor
fQorCitzdGF0aWMgdm9pZCBhbGMyMjJfc2h1dHVwKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQor
eworCXN0cnVjdCBhbGNfc3BlYyAqc3BlYyA9IGNvZGVjLT5zcGVjOworCWhkYV9uaWRfdCBocF9w
aW4gPSBhbGNfZ2V0X2hwX3BpbihzcGVjKTsKKwlib29sIGhwMV9waW5fc2Vuc2UsIGhwMl9waW5f
c2Vuc2U7CisKKwlpZiAoIWhwX3BpbikKKwkJaHBfcGluID0gMHgyMTsKKworCWhwMV9waW5fc2Vu
c2UgPSBzbmRfaGRhX2phY2tfZGV0ZWN0KGNvZGVjLCBocF9waW4pOworCWhwMl9waW5fc2Vuc2Ug
PSBzbmRfaGRhX2phY2tfZGV0ZWN0KGNvZGVjLCAweDE0KTsKKworCWlmIChocDFfcGluX3NlbnNl
IHx8IGhwMl9waW5fc2Vuc2UpIHsKKwkJbXNsZWVwKDIpOworCisJCWlmIChocDFfcGluX3NlbnNl
KQorCQkJc25kX2hkYV9jb2RlY193cml0ZShjb2RlYywgaHBfcGluLCAwLAorCQkJCSAgICBBQ19W
RVJCX1NFVF9BTVBfR0FJTl9NVVRFLCBBTVBfT1VUX01VVEUpOworCQlpZiAoaHAyX3Bpbl9zZW5z
ZSkKKwkJCXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIDB4MTQsIDAsCisJCQkJICAgIEFDX1ZF
UkJfU0VUX0FNUF9HQUlOX01VVEUsIEFNUF9PVVRfTVVURSk7CisKKwkJbXNsZWVwKDc1KTsKKwor
CQlpZiAoaHAxX3Bpbl9zZW5zZSkKKwkJCXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIGhwX3Bp
biwgMCwKKwkJCQkgICAgQUNfVkVSQl9TRVRfUElOX1dJREdFVF9DT05UUk9MLCAweDApOworCQlp
ZiAoaHAyX3Bpbl9zZW5zZSkKKwkJCXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIDB4MTQsIDAs
CisJCQkJICAgIEFDX1ZFUkJfU0VUX1BJTl9XSURHRVRfQ09OVFJPTCwgMHgwKTsKKworCQltc2xl
ZXAoNzUpOworCX0KKwlhbGNfYXV0b19zZXR1cF9lYXBkKGNvZGVjLCBmYWxzZSk7CisJYWxjX3No
dXR1cF9waW5zKGNvZGVjKTsKK30KKwogc3RhdGljIHZvaWQgYWxjX2RlZmF1bHRfaW5pdChzdHJ1
Y3QgaGRhX2NvZGVjICpjb2RlYykKIHsKIAlzdHJ1Y3QgYWxjX3NwZWMgKnNwZWMgPSBjb2RlYy0+
c3BlYzsKQEAgLTExOTM5LDggKzEyMDEyLDExIEBAIHN0YXRpYyBpbnQgcGF0Y2hfYWxjMjY5KHN0
cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCQlzcGVjLT5jb2RlY192YXJpYW50ID0gQUxDMjY5X1RZ
UEVfQUxDMzAwOwogCQlzcGVjLT5nZW4ubWl4ZXJfbmlkID0gMDsgLyogbm8gbG9vcGJhY2sgb24g
QUxDMzAwICovCiAJCWJyZWFrOworCWNhc2UgMHgxMGVjMDIyMjoKIAljYXNlIDB4MTBlYzA2MjM6
CiAJCXNwZWMtPmNvZGVjX3ZhcmlhbnQgPSBBTEMyNjlfVFlQRV9BTEM2MjM7CisJCXNwZWMtPnNo
dXR1cCA9IGFsYzIyMl9zaHV0dXA7CisJCXNwZWMtPmluaXRfaG9vayA9IGFsYzIyMl9pbml0Owog
CQlicmVhazsKIAljYXNlIDB4MTBlYzA3MDA6CiAJY2FzZSAweDEwZWMwNzAxOgo=

--_002_81c7f0ec4a2447219c06095e0de4d1d3realtekcom_--
