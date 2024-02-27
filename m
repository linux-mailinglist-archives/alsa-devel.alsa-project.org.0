Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAC98688AB
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 06:34:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB2CF839;
	Tue, 27 Feb 2024 06:34:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB2CF839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709012060;
	bh=tjVML9LLPAdAaxWCjpILeTmdhHf1gzRPBn+uXHdhMo4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=K5V/+NfF/+UGCJgq2AvllD1nfK62UeMRsPef6NO/d4vLpudmUDO20v02IYIYK08IN
	 bIjkjlEieRvZCNMncJjx2jxYxL3S6fl1xOA4moUn1/d+QG1OlHA/yj+Q6pqaLOHQKj
	 nV/1Y+AGgTeyiveLVRdKYeafRtHTlwGm4lw1EkiA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F521F80579; Tue, 27 Feb 2024 06:33:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9D7DF805A0;
	Tue, 27 Feb 2024 06:33:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2847F801C0; Tue, 27 Feb 2024 06:33:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47BF7F800F0
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 06:33:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47BF7F800F0
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 41R5X2v244181883,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 41R5X2v244181883
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Feb 2024 13:33:03 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.95) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.17; Tue, 27 Feb 2024 13:33:02 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 13:33:02 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::48bb:4f38:369c:d153]) by
 RTEXMBS01.realtek.com.tw ([fe80::48bb:4f38:369c:d153%9]) with mapi id
 15.01.2507.035; Tue, 27 Feb 2024 13:33:02 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: ALC285 reduce HP pop noise
Thread-Topic: ALC285 reduce HP pop noise
Thread-Index: AdppPgDhjLwy9rVsQ32JN7JlBOl5IA==
Date: Tue, 27 Feb 2024 05:33:02 +0000
Message-ID: <7493e207919a4fb3a0599324fd010e3e@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS02.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_7493e207919a4fb3a0599324fd010e3erealtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: SLF54JHAMLA3AFRRNE7NHMDO2A6WOTTE
X-Message-ID-Hash: SLF54JHAMLA3AFRRNE7NHMDO2A6WOTTE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SLF54JHAMLA3AFRRNE7NHMDO2A6WOTTE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_7493e207919a4fb3a0599324fd010e3erealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Lenovo Thinkpad platform with ALC285 which had pop noise from Headphone por=
t on reboot state.
Attach patch will reduce it.

BR,
Kailang

--_002_7493e207919a4fb3a0599324fd010e3erealtekcom_
Content-Type: application/octet-stream;
	name="0000-thinkpad-alc285-hp-depop.patch"
Content-Description: 0000-thinkpad-alc285-hp-depop.patch
Content-Disposition: attachment;
	filename="0000-thinkpad-alc285-hp-depop.patch"; size=999;
	creation-date="Fri, 23 Feb 2024 06:56:19 GMT";
	modification-date="Fri, 23 Feb 2024 07:05:03 GMT"
Content-Transfer-Encoding: base64

RnJvbSBmNTcyMDdkMWI5NmEzNDIxOTNiODI2MjUxYWY0MWFkYzc5Yzc0ZjA2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IEZyaSwgMjMgRmViIDIwMjQgMTQ6NTQ6MzQgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEFMQzI4NSByZWR1Y2UgcG9wIG5vaXNlIGZyb20gSGVhZHBob25lIHBv
cnQKCkl0IGhhZCBwb3Agbm9pc2UgZnJvbSBIZWFkcGhvbmUgcG9ydCB3aGVuIHN5c3RlbSByZWJv
b3Qgc3RhdGUuCklmIE5JRCA1OGggSW5kZXggMHgwIHRvIGZpbGwgZGVmYXVsdCB2YWx1ZSwgaXQg
d2lsbCByZWR1Y2UgcG9wIG5vaXNlLgoKU2lnbmVkLW9mZi1ieTogS2FpbGFuZyBZYW5nIDxrYWls
YW5nQHJlYWx0ZWsuY29tPgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVr
LmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCA5ZjExNDdhZjAzMGMuLjVj
MDY5NWRiNWI3YyAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysr
IGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTM2ODMsNiArMzY4Myw3IEBAIHN0
YXRpYyB2b2lkIGFsYzI4NV9ocF9pbml0KHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCWludCBp
LCB2YWw7CiAJaW50IGNvZWYzOCwgY29lZjBkLCBjb2VmMzY7CiAKKwlhbGNfd3JpdGVfY29lZmV4
X2lkeChjb2RlYywgMHg1OCwgMHgwMCwgMHgxODg4KTsgLyogd3JpdGUgZGVmYXVsdCB2YWx1ZSAq
LwogCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4NGEsIDE8PDE1LCAxPDwxNSk7IC8qIFJl
c2V0IEhQIEpEICovCiAJY29lZjM4ID0gYWxjX3JlYWRfY29lZl9pZHgoY29kZWMsIDB4MzgpOyAv
KiBBbXAgY29udHJvbCAqLwogCWNvZWYwZCA9IGFsY19yZWFkX2NvZWZfaWR4KGNvZGVjLCAweDBk
KTsgLyogRGlnaXRhbCBNaXNjIGNvbnRyb2wgKi8K

--_002_7493e207919a4fb3a0599324fd010e3erealtekcom_--
