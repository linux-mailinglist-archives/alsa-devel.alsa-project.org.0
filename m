Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AC39D91CC
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2024 07:31:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5BBD14E0;
	Tue, 26 Nov 2024 07:31:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5BBD14E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732602703;
	bh=lLrvae2yPLxYrBtL1IhsFwGFugsHypudm13mioeFq8s=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QgMvDnuIm3tDOAvmUjQZUYxb2g2llNlAhicC4hRy9xNe9iFYtyYVWzK9aFMS3koT7
	 T60fQl+7QZEmQ9ylYcYaxp8obqwTMZrUOCT8oHdViDaYPTJCqiIhaRHyN+kg8LS35t
	 SKTMxwQ7Z2zJL2MkNYZL+r8LPeW+V5pPBecnI8bk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A10E6F80527; Tue, 26 Nov 2024 07:31:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CE89F805C1;
	Tue, 26 Nov 2024 07:31:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EA33F80496; Tue, 26 Nov 2024 07:31:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 687A5F8019B
	for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2024 07:31:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 687A5F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=RwLDbBdO
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4AQ6UvHC2608646,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1732602657; bh=lLrvae2yPLxYrBtL1IhsFwGFugsHypudm13mioeFq8s=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=RwLDbBdOjLyicCbYnXj52TgtViMaE/TrEyU+NuCqCy1yWlWskV0O2f4AWz1OmJEnm
	 tud/DJt5A7sT2gOOYpV66grtHP7Vc7/TlCfMaW7U6sHGvXLGUkhQOIJmQycJ1HgRhy
	 eF+jKw44yeSWSL44EOGzcUr5oElKVhvbcJtElkwsqNO9K2Dl5MXiC9Fu57YZVFBEri
	 Dh0yFXcSC3dROk6K3ByZm00izq1crbyuLF9lcNirmSngS+/bauN6y2CSv7u2bh9zce
	 irOXisRZKF0T8n0KJbEw7aZytm5ItZbdXWcMjiKHP0IfXgxifYvP1xOtxpG/JYM/Ti
	 hKVaTJt49D4Hg==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 4AQ6UvHC2608646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Nov 2024 14:30:57 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 14:30:57 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Nov 2024 14:30:57 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2]) by
 RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2%7]) with mapi id
 15.01.2507.035; Tue, 26 Nov 2024 14:30:57 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: ALC225 update depop procedure
Thread-Topic: ALC225 update depop procedure
Thread-Index: Ads/zJKsGyG8ZKEzRvKSATmkS917pQ==
Date: Tue, 26 Nov 2024 06:30:57 +0000
Message-ID: <5a27b016ba9d42b4a4e6dadce50a3ba4@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.21.6.42]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_5a27b016ba9d42b4a4e6dadce50a3ba4realtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: EFCLFMHPQQ5RNHWJNV7PTRIKDDMI5ELE
X-Message-ID-Hash: EFCLFMHPQQ5RNHWJNV7PTRIKDDMI5ELE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EFCLFMHPQQ5RNHWJNV7PTRIKDDMI5ELE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_5a27b016ba9d42b4a4e6dadce50a3ba4realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

ALC225 update depop procedure.
Many Thanks.

BR,
Kailang

--_002_5a27b016ba9d42b4a4e6dadce50a3ba4realtekcom_
Content-Type: application/octet-stream;
	name="0000-alc225-hp-depop-update.patch"
Content-Description: 0000-alc225-hp-depop-update.patch
Content-Disposition: attachment;
	filename="0000-alc225-hp-depop-update.patch"; size=4604;
	creation-date="Thu, 14 Nov 2024 07:22:42 GMT";
	modification-date="Tue, 26 Nov 2024 06:15:40 GMT"
Content-Transfer-Encoding: base64

RnJvbSA3OGZmY2M1ZGIzZDc2ZDgzMmNmODZjNGI0YWUwMDdiMGVkZDMxM2FjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMTQgTm92IDIwMjQgMTU6MDg6MDcgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlazogVXBkYXRlIEFMQzIyNSBkZXBvcCBwcm9jZWR1cmUKCk9sZCBwcm9jZWR1
cmUgaGFzIGEgY2hhbmNlIHRvIG1lZXQgSGVhZHBob25lIG5vIG91dHB1dC4KCkZpeGVzOiBkYTkx
MWIxZjVlOTggKCJBTFNBOiBoZGEvcmVhbHRlayAtIHVwZGF0ZSBBTEMyMjUgZGVwb3Agb3B0aW1p
emUiKQpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CmRp
ZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEv
cGF0Y2hfcmVhbHRlay5jCmluZGV4IDU2YTM2MjJjYTJjMS4uMDJlZjYyNzIwMTU5IDEwMDY0NAot
LS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3Bh
dGNoX3JlYWx0ZWsuYwpAQCAtMzc3MiwzMyArMzc3MiwyOCBAQCBzdGF0aWMgdm9pZCBhbGMyMjVf
aW5pdChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAlocDFfcGluX3NlbnNlID0gc25kX2hkYV9q
YWNrX2RldGVjdChjb2RlYywgaHBfcGluKTsKIAlocDJfcGluX3NlbnNlID0gc25kX2hkYV9qYWNr
X2RldGVjdChjb2RlYywgMHgxNik7CiAKLQlpZiAoaHAxX3Bpbl9zZW5zZSB8fCBocDJfcGluX3Nl
bnNlKQorCWlmIChocDFfcGluX3NlbnNlIHx8IGhwMl9waW5fc2Vuc2UpIHsKIAkJbXNsZWVwKDIp
OworCQlhbGNfdXBkYXRlX2NvZWZleF9pZHgoY29kZWMsIDB4NTcsIDB4MDQsIDB4MDAwNywgMHgx
KTsgLyogTG93IHBvd2VyICovCiAKLQlhbGNfdXBkYXRlX2NvZWZleF9pZHgoY29kZWMsIDB4NTcs
IDB4MDQsIDB4MDAwNywgMHgxKTsgLyogTG93IHBvd2VyICovCi0KLQlpZiAoaHAxX3Bpbl9zZW5z
ZSB8fCBzcGVjLT51bHRyYV9sb3dfcG93ZXIpCi0JCXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMs
IGhwX3BpbiwgMCwKLQkJCSAgICBBQ19WRVJCX1NFVF9BTVBfR0FJTl9NVVRFLCBBTVBfT1VUX01V
VEUpOwotCWlmIChocDJfcGluX3NlbnNlKQotCQlzbmRfaGRhX2NvZGVjX3dyaXRlKGNvZGVjLCAw
eDE2LCAwLAotCQkJICAgIEFDX1ZFUkJfU0VUX0FNUF9HQUlOX01VVEUsIEFNUF9PVVRfTVVURSk7
Ci0KLQlpZiAoaHAxX3Bpbl9zZW5zZSB8fCBocDJfcGluX3NlbnNlIHx8IHNwZWMtPnVsdHJhX2xv
d19wb3dlcikKLQkJbXNsZWVwKDg1KTsKLQotCWlmIChocDFfcGluX3NlbnNlIHx8IHNwZWMtPnVs
dHJhX2xvd19wb3dlcikKLQkJc25kX2hkYV9jb2RlY193cml0ZShjb2RlYywgaHBfcGluLCAwLAot
CQkJICAgIEFDX1ZFUkJfU0VUX1BJTl9XSURHRVRfQ09OVFJPTCwgUElOX09VVCk7Ci0JaWYgKGhw
Ml9waW5fc2Vuc2UpCi0JCXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIDB4MTYsIDAsCi0JCQkg
ICAgQUNfVkVSQl9TRVRfUElOX1dJREdFVF9DT05UUk9MLCBQSU5fT1VUKTsKKwkJaWYgKGhwMV9w
aW5fc2Vuc2UpCisJCQlzbmRfaGRhX2NvZGVjX3dyaXRlKGNvZGVjLCBocF9waW4sIDAsCisJCQkJ
ICAgIEFDX1ZFUkJfU0VUX1BJTl9XSURHRVRfQ09OVFJPTCwgUElOX09VVCk7CisJCWlmIChocDJf
cGluX3NlbnNlKQorCQkJc25kX2hkYV9jb2RlY193cml0ZShjb2RlYywgMHgxNiwgMCwKKwkJCQkg
ICAgQUNfVkVSQl9TRVRfUElOX1dJREdFVF9DT05UUk9MLCBQSU5fT1VUKTsKKwkJbXNsZWVwKDc1
KTsKIAotCWlmIChocDFfcGluX3NlbnNlIHx8IGhwMl9waW5fc2Vuc2UgfHwgc3BlYy0+dWx0cmFf
bG93X3Bvd2VyKQotCQltc2xlZXAoMTAwKTsKKwkJaWYgKGhwMV9waW5fc2Vuc2UpCisJCQlzbmRf
aGRhX2NvZGVjX3dyaXRlKGNvZGVjLCBocF9waW4sIDAsCisJCQkJICAgIEFDX1ZFUkJfU0VUX0FN
UF9HQUlOX01VVEUsIEFNUF9PVVRfVU5NVVRFKTsKKwkJaWYgKGhwMl9waW5fc2Vuc2UpCisJCQlz
bmRfaGRhX2NvZGVjX3dyaXRlKGNvZGVjLCAweDE2LCAwLAorCQkJCSAgICBBQ19WRVJCX1NFVF9B
TVBfR0FJTl9NVVRFLCBBTVBfT1VUX1VOTVVURSk7CiAKLQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNv
ZGVjLCAweDRhLCAzIDw8IDEwLCAwKTsKLQlhbGNfdXBkYXRlX2NvZWZleF9pZHgoY29kZWMsIDB4
NTcsIDB4MDQsIDB4MDAwNywgMHg0KTsgLyogSGlnaHQgcG93ZXIgKi8KKwkJbXNsZWVwKDc1KTsK
KwkJYWxjX3VwZGF0ZV9jb2VmZXhfaWR4KGNvZGVjLCAweDU3LCAweDA0LCAweDAwMDcsIDB4NCk7
IC8qIEhpZ2h0IHBvd2VyICovCisJfQogfQogCiBzdGF0aWMgdm9pZCBhbGMyMjVfc2h1dHVwKHN0
cnVjdCBoZGFfY29kZWMgKmNvZGVjKQpAQCAtMzgxMCwzNiArMzgwNSwzNSBAQCBzdGF0aWMgdm9p
ZCBhbGMyMjVfc2h1dHVwKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCWlmICghaHBfcGluKQog
CQlocF9waW4gPSAweDIxOwogCi0JYWxjX2Rpc2FibGVfaGVhZHNldF9qYWNrX2tleShjb2RlYyk7
Ci0JLyogM2sgcHVsbCBsb3cgY29udHJvbCBmb3IgSGVhZHNldCBqYWNrLiAqLwotCWFsY191cGRh
dGVfY29lZl9pZHgoY29kZWMsIDB4NGEsIDAsIDMgPDwgMTApOwotCiAJaHAxX3Bpbl9zZW5zZSA9
IHNuZF9oZGFfamFja19kZXRlY3QoY29kZWMsIGhwX3Bpbik7CiAJaHAyX3Bpbl9zZW5zZSA9IHNu
ZF9oZGFfamFja19kZXRlY3QoY29kZWMsIDB4MTYpOwogCi0JaWYgKGhwMV9waW5fc2Vuc2UgfHwg
aHAyX3Bpbl9zZW5zZSkKKwlpZiAoaHAxX3Bpbl9zZW5zZSB8fCBocDJfcGluX3NlbnNlKSB7CisJ
CWFsY19kaXNhYmxlX2hlYWRzZXRfamFja19rZXkoY29kZWMpOworCQkvKiAzayBwdWxsIGxvdyBj
b250cm9sIGZvciBIZWFkc2V0IGphY2suICovCisJCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMs
IDB4NGEsIDAsIDMgPDwgMTApOwogCQltc2xlZXAoMik7CiAKLQlpZiAoaHAxX3Bpbl9zZW5zZSB8
fCBzcGVjLT51bHRyYV9sb3dfcG93ZXIpCi0JCXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIGhw
X3BpbiwgMCwKLQkJCSAgICBBQ19WRVJCX1NFVF9BTVBfR0FJTl9NVVRFLCBBTVBfT1VUX01VVEUp
OwotCWlmIChocDJfcGluX3NlbnNlKQotCQlzbmRfaGRhX2NvZGVjX3dyaXRlKGNvZGVjLCAweDE2
LCAwLAotCQkJICAgIEFDX1ZFUkJfU0VUX0FNUF9HQUlOX01VVEUsIEFNUF9PVVRfTVVURSk7Ci0K
LQlpZiAoaHAxX3Bpbl9zZW5zZSB8fCBocDJfcGluX3NlbnNlIHx8IHNwZWMtPnVsdHJhX2xvd19w
b3dlcikKLQkJbXNsZWVwKDg1KTsKKwkJaWYgKGhwMV9waW5fc2Vuc2UpCisJCQlzbmRfaGRhX2Nv
ZGVjX3dyaXRlKGNvZGVjLCBocF9waW4sIDAsCisJCQkJICAgIEFDX1ZFUkJfU0VUX0FNUF9HQUlO
X01VVEUsIEFNUF9PVVRfTVVURSk7CisJCWlmIChocDJfcGluX3NlbnNlKQorCQkJc25kX2hkYV9j
b2RlY193cml0ZShjb2RlYywgMHgxNiwgMCwKKwkJCQkgICAgQUNfVkVSQl9TRVRfQU1QX0dBSU5f
TVVURSwgQU1QX09VVF9NVVRFKTsKIAotCWlmIChocDFfcGluX3NlbnNlIHx8IHNwZWMtPnVsdHJh
X2xvd19wb3dlcikKLQkJc25kX2hkYV9jb2RlY193cml0ZShjb2RlYywgaHBfcGluLCAwLAotCQkJ
ICAgIEFDX1ZFUkJfU0VUX1BJTl9XSURHRVRfQ09OVFJPTCwgMHgwKTsKLQlpZiAoaHAyX3Bpbl9z
ZW5zZSkKLQkJc25kX2hkYV9jb2RlY193cml0ZShjb2RlYywgMHgxNiwgMCwKLQkJCSAgICBBQ19W
RVJCX1NFVF9QSU5fV0lER0VUX0NPTlRST0wsIDB4MCk7CisJCW1zbGVlcCg3NSk7CiAKLQlpZiAo
aHAxX3Bpbl9zZW5zZSB8fCBocDJfcGluX3NlbnNlIHx8IHNwZWMtPnVsdHJhX2xvd19wb3dlcikK
LQkJbXNsZWVwKDEwMCk7CisJCWlmIChocDFfcGluX3NlbnNlKQorCQkJc25kX2hkYV9jb2RlY193
cml0ZShjb2RlYywgaHBfcGluLCAwLAorCQkJCSAgICBBQ19WRVJCX1NFVF9QSU5fV0lER0VUX0NP
TlRST0wsIDB4MCk7CisJCWlmIChocDJfcGluX3NlbnNlKQorCQkJc25kX2hkYV9jb2RlY193cml0
ZShjb2RlYywgMHgxNiwgMCwKKwkJCQkgICAgQUNfVkVSQl9TRVRfUElOX1dJREdFVF9DT05UUk9M
LCAweDApOwogCisJCW1zbGVlcCg3NSk7CisJCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4
NGEsIDMgPDwgMTAsIDApOworCQlhbGNfZW5hYmxlX2hlYWRzZXRfamFja19rZXkoY29kZWMpOwor
CX0KIAlhbGNfYXV0b19zZXR1cF9lYXBkKGNvZGVjLCBmYWxzZSk7CiAJYWxjX3NodXR1cF9waW5z
KGNvZGVjKTsKIAlpZiAoc3BlYy0+dWx0cmFfbG93X3Bvd2VyKSB7CkBAIC0zODUwLDkgKzM4NDQs
NiBAQCBzdGF0aWMgdm9pZCBhbGMyMjVfc2h1dHVwKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQog
CQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDRhLCAzPDw0LCAyPDw0KTsKIAkJbXNsZWVw
KDMwKTsKIAl9Ci0KLQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDRhLCAzIDw8IDEwLCAw
KTsKLQlhbGNfZW5hYmxlX2hlYWRzZXRfamFja19rZXkoY29kZWMpOwogfQogCiBzdGF0aWMgdm9p
ZCBhbGNfZGVmYXVsdF9pbml0KHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQo=

--_002_5a27b016ba9d42b4a4e6dadce50a3ba4realtekcom_--
