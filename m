Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C5C6595FD
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Dec 2022 08:55:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC289171E;
	Fri, 30 Dec 2022 08:54:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC289171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672386923;
	bh=C4ZO3HIvJq0/l0s0nZkx0QjDJuwDHhIzf7KoamBYuzU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=QeUbU+/8omEknh1d1aPZlv9JfdkqPMLi0jXbp+c7N07We7Ft4ozEDDQKQuz5UoNDl
	 zzU/n4qUU9O+zG8Mf83PyXbq1dAvsMy8TwreD6NAJk1q0sD4BS/Ie+xj7waT/EFcRh
	 oJIc0taKjlCyia+dFIPkjq4M2/K1Ifgc4gwoj87g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F839F80310;
	Fri, 30 Dec 2022 08:54:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 784E5F80310; Fri, 30 Dec 2022 08:54:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 by alsa1.perex.cz (Postfix) with ESMTP id 7E54FF80310
 for <alsa-devel@alsa-project.org>; Fri, 30 Dec 2022 08:54:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E54FF80310
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 2BU7r8svD030987,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 2BU7r8svD030987
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
 Fri, 30 Dec 2022 15:53:08 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 30 Dec 2022 15:54:02 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 30 Dec 2022 15:54:02 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::98d2:65f8:dcdf:fa31]) by
 RTEXMBS01.realtek.com.tw ([fe80::98d2:65f8:dcdf:fa31%5]) with mapi id
 15.01.2375.007; Fri, 30 Dec 2022 15:54:02 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: Turn on power early to avoid something
Thread-Topic: Turn on power early to avoid something
Thread-Index: AdkcI3Ma5yaXX0FTSK+6gZEsLjDbLw==
Date: Fri, 30 Dec 2022 07:54:01 +0000
Message-ID: <3dcfbaf4ccb34be7a9c4af0202cdcdd4@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS04.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2022/12/30_=3F=3F_06:00:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: multipart/mixed;
 boundary="_002_3dcfbaf4ccb34be7a9c4af0202cdcdd4realtekcom_"
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--_002_3dcfbaf4ccb34be7a9c4af0202cdcdd4realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

It maybe can avoid something for early power up.

Many Thanks.
Kailang.

--_002_3dcfbaf4ccb34be7a9c4af0202cdcdd4realtekcom_
Content-Type: application/octet-stream;
	name="0000-turn-on-power-early.patch"
Content-Description: 0000-turn-on-power-early.patch
Content-Disposition: attachment; filename="0000-turn-on-power-early.patch";
	size=2435; creation-date="Fri, 30 Dec 2022 07:26:17 GMT";
	modification-date="Fri, 30 Dec 2022 07:49:03 GMT"
Content-Transfer-Encoding: base64

RnJvbSBjMjZhM2U1YzYyNWIzZDZhZjhiYjkwYjQ1MGI4MTdiYTU1ZDJjYzExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBZdWNoaSBZYW5nIDx5YW5neXVjaGk2NkBnbWFpbC5jb20+CkRh
dGU6IEZyaSwgMzAgRGVjIDIwMjIgMTU6MjI6MjUgKzA4MDAKU3ViamVjdDogW1BBVENIXUFMU0E6
IGhkYS9yZWFsdGVrIC0gVHVybiBvbiBwb3dlciBlYXJseQoKVHVybiBvbiBwb3dlciBlYXJseSB0
byBhdm9pZCBzb21ldGhpbmcuCgpTaWduZWQtb2ZmLWJ5OiBZdWNoaSBZYW5nIDx5YW5neXVjaGk2
NkBnbWFpbC5jb20+CgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMg
Yi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCA4YTNlMmZlNDIxMDYuLjExODRi
N2I1M2VlYyAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysrIGIv
c291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTM0NjMsNiArMzQ2MywxNSBAQCBzdGF0
aWMgdm9pZCBhbGMyNTZfaW5pdChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAloZGFfbmlkX3Qg
aHBfcGluID0gYWxjX2dldF9ocF9waW4oc3BlYyk7CiAJYm9vbCBocF9waW5fc2Vuc2U7CiAKKwlp
ZiAoc3BlYy0+dWx0cmFfbG93X3Bvd2VyKSB7CisJCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMs
IDB4MDMsIDE8PDEsIDE8PDEpOworCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDA4LCAz
PDwyLCAzPDwyKTsKKwkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgwOCwgNzw8NCwgMCk7
CisJCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4M2IsIDE8PDE1LCAwKTsKKwkJYWxjX3Vw
ZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgwZSwgNzw8NiwgNzw8Nik7CisJCW1zbGVlcCgzMCk7CisJ
fQorCiAJaWYgKCFocF9waW4pCiAJCWhwX3BpbiA9IDB4MjE7CiAKQEAgLTM0NzQsMTQgKzM0ODMs
NiBAQCBzdGF0aWMgdm9pZCBhbGMyNTZfaW5pdChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAkJ
bXNsZWVwKDIpOwogCiAJYWxjX3VwZGF0ZV9jb2VmZXhfaWR4KGNvZGVjLCAweDU3LCAweDA0LCAw
eDAwMDcsIDB4MSk7IC8qIExvdyBwb3dlciAqLwotCWlmIChzcGVjLT51bHRyYV9sb3dfcG93ZXIp
IHsKLQkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgwMywgMTw8MSwgMTw8MSk7Ci0JCWFs
Y191cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4MDgsIDM8PDIsIDM8PDIpOwotCQlhbGNfdXBkYXRl
X2NvZWZfaWR4KGNvZGVjLCAweDA4LCA3PDw0LCAwKTsKLQkJYWxjX3VwZGF0ZV9jb2VmX2lkeChj
b2RlYywgMHgzYiwgMTw8MTUsIDApOwotCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDBl
LCA3PDw2LCA3PDw2KTsKLQkJbXNsZWVwKDMwKTsKLQl9CiAKIAlzbmRfaGRhX2NvZGVjX3dyaXRl
KGNvZGVjLCBocF9waW4sIDAsCiAJCQkgICAgQUNfVkVSQl9TRVRfQU1QX0dBSU5fTVVURSwgQU1Q
X09VVF9NVVRFKTsKQEAgLTM2MTIsNiArMzYxMywxMyBAQCBzdGF0aWMgdm9pZCBhbGMyMjVfaW5p
dChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAloZGFfbmlkX3QgaHBfcGluID0gYWxjX2dldF9o
cF9waW4oc3BlYyk7CiAJYm9vbCBocDFfcGluX3NlbnNlLCBocDJfcGluX3NlbnNlOwogCisJaWYg
KHNwZWMtPnVsdHJhX2xvd19wb3dlcikgeworCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAw
eDA4LCAweDBmIDw8IDIsIDM8PDIpOworCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDBl
LCA3PDw2LCA3PDw2KTsKKwkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgzMywgMTw8MTEs
IDApOworCQltc2xlZXAoMzApOworCX0KKwogCWlmIChzcGVjLT5jb2RlY192YXJpYW50ICE9IEFM
QzI2OV9UWVBFX0FMQzI4NykKIAkJLyogcmVxdWlyZWQgb25seSBhdCBib290IG9yIFMzIGFuZCBT
NCByZXN1bWUgdGltZSAqLwogCQlpZiAoIXNwZWMtPmRvbmVfaHBfaW5pdCB8fApAQCAtMzYzMiwx
MiArMzY0MCw2IEBAIHN0YXRpYyB2b2lkIGFsYzIyNV9pbml0KHN0cnVjdCBoZGFfY29kZWMgKmNv
ZGVjKQogCQltc2xlZXAoMik7CiAKIAlhbGNfdXBkYXRlX2NvZWZleF9pZHgoY29kZWMsIDB4NTcs
IDB4MDQsIDB4MDAwNywgMHgxKTsgLyogTG93IHBvd2VyICovCi0JaWYgKHNwZWMtPnVsdHJhX2xv
d19wb3dlcikgewotCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDA4LCAweDBmIDw8IDIs
IDM8PDIpOwotCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDBlLCA3PDw2LCA3PDw2KTsK
LQkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgzMywgMTw8MTEsIDApOwotCQltc2xlZXAo
MzApOwotCX0KIAogCWlmIChocDFfcGluX3NlbnNlIHx8IHNwZWMtPnVsdHJhX2xvd19wb3dlcikK
IAkJc25kX2hkYV9jb2RlY193cml0ZShjb2RlYywgaHBfcGluLCAwLAo=

--_002_3dcfbaf4ccb34be7a9c4af0202cdcdd4realtekcom_--
