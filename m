Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E70659670
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Dec 2022 09:49:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3EA017AD;
	Fri, 30 Dec 2022 09:48:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3EA017AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672390176;
	bh=r4IzDh4jDoBaO9vlRXdjffzmImHMI8gt4xtQsLVZS9Y=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JcuoR/sfw2a5cPbvFQ7GEoKBGP7a8sP7plmCPO2C/Odyp8APrNmSJegnoSaYT4ORD
	 u6v9CxQxIMg6Bh82AdNOOxeAFjvWaJ8Xp2kZY6ezFgsv/w++w3nAW5YmARgB3npwh1
	 cuw8+vOhOtu39M5MLHvHzSgmARDTw4bMJgn73gwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0243EF8023B;
	Fri, 30 Dec 2022 09:48:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFC00F8049E; Fri, 30 Dec 2022 09:48:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 by alsa1.perex.cz (Postfix) with ESMTP id 81592F80310
 for <alsa-devel@alsa-project.org>; Fri, 30 Dec 2022 09:48:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81592F80310
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 2BU8lRBL1021070,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
 by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 2BU8lRBL1021070
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
 Fri, 30 Dec 2022 16:47:27 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Fri, 30 Dec 2022 16:48:21 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 30 Dec 2022 16:48:21 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::98d2:65f8:dcdf:fa31]) by
 RTEXMBS01.realtek.com.tw ([fe80::98d2:65f8:dcdf:fa31%5]) with mapi id
 15.01.2375.007; Fri, 30 Dec 2022 16:48:21 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: RE: Turn on power early to avoid something
Thread-Topic: Turn on power early to avoid something
Thread-Index: AdkcI3Ma5yaXX0FTSK+6gZEsLjDbL///fb2A//9uJXA=
Date: Fri, 30 Dec 2022 08:48:21 +0000
Message-ID: <845ba9483f6a49e0aedc52c13a9683d2@realtek.com>
References: <3dcfbaf4ccb34be7a9c4af0202cdcdd4@realtek.com>
 <87fscxxqp0.wl-tiwai@suse.de>
In-Reply-To: <87fscxxqp0.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXDAG02.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2022/12/30_=3F=3F_06:30:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: multipart/mixed;
 boundary="_002_845ba9483f6a49e0aedc52c13a9683d2realtekcom_"
MIME-Version: 1.0
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

--_002_845ba9483f6a49e0aedc52c13a9683d2realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

OK.

Re attach patch.

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Friday, December 30, 2022 4:05 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: Re: Turn on power early to avoid something
>=20
> On Fri, 30 Dec 2022 08:54:01 +0100,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > It maybe can avoid something for early power up.
> >
> > Many Thanks.
> > Kailang.
>=20
> Hmm, what is "something"?  The description is way too ambiguous to judge
> whether the change is OK or not, unfortunately.
> Could you elaborate what exactly the change will fix?
>=20
> Also, when you submit a patch from another person, please put your own
> Signed-off-by line.  It's a legal requirement.
>=20
>=20
> thanks,
>=20
> Takashi
>=20
> ------Please consider the environment before printing this e-mail.

--_002_845ba9483f6a49e0aedc52c13a9683d2realtekcom_
Content-Type: application/octet-stream;
	name="0000-turn-on-power-early.patch"
Content-Description: 0000-turn-on-power-early.patch
Content-Disposition: attachment; filename="0000-turn-on-power-early.patch";
	size=2513; creation-date="Fri, 30 Dec 2022 07:26:17 GMT";
	modification-date="Fri, 30 Dec 2022 08:46:31 GMT"
Content-Transfer-Encoding: base64

RnJvbSBjMjZhM2U1YzYyNWIzZDZhZjhiYjkwYjQ1MGI4MTdiYTU1ZDJjYzExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBZdWNoaSBZYW5nIDx5YW5neXVjaGk2NkBnbWFpbC5jb20+CkRh
dGU6IEZyaSwgMzAgRGVjIDIwMjIgMTU6MjI6MjUgKzA4MDAKU3ViamVjdDogW1BBVENIXUFMU0E6
IGhkYS9yZWFsdGVrIC0gVHVybiBvbiBwb3dlciBlYXJseQoKVHVybiBvbiBwb3dlciBlYXJseSB0
byBhdm9pZCB3cm9uZyBzdGF0ZSBmb3IgcG93ZXIgcmVsYXRpb24gcmVnaXN0ZXIuClRoaXMgY2Fu
IHNvbHZlIEpEIHN0YXRlIGlzc3VlIHdoZW4gcmVzdW1lIGJhY2suCgpTaWduZWQtb2ZmLWJ5OiBL
YWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CgpkaWZmIC0tZ2l0IGEvc291bmQvcGNp
L2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRl
eCA4YTNlMmZlNDIxMDYuLjExODRiN2I1M2VlYyAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9w
YXRjaF9yZWFsdGVrLmMKKysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTM0
NjMsNiArMzQ2MywxNSBAQCBzdGF0aWMgdm9pZCBhbGMyNTZfaW5pdChzdHJ1Y3QgaGRhX2NvZGVj
ICpjb2RlYykKIAloZGFfbmlkX3QgaHBfcGluID0gYWxjX2dldF9ocF9waW4oc3BlYyk7CiAJYm9v
bCBocF9waW5fc2Vuc2U7CiAKKwlpZiAoc3BlYy0+dWx0cmFfbG93X3Bvd2VyKSB7CisJCWFsY191
cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4MDMsIDE8PDEsIDE8PDEpOworCQlhbGNfdXBkYXRlX2Nv
ZWZfaWR4KGNvZGVjLCAweDA4LCAzPDwyLCAzPDwyKTsKKwkJYWxjX3VwZGF0ZV9jb2VmX2lkeChj
b2RlYywgMHgwOCwgNzw8NCwgMCk7CisJCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4M2Is
IDE8PDE1LCAwKTsKKwkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgwZSwgNzw8NiwgNzw8
Nik7CisJCW1zbGVlcCgzMCk7CisJfQorCiAJaWYgKCFocF9waW4pCiAJCWhwX3BpbiA9IDB4MjE7
CiAKQEAgLTM0NzQsMTQgKzM0ODMsNiBAQCBzdGF0aWMgdm9pZCBhbGMyNTZfaW5pdChzdHJ1Y3Qg
aGRhX2NvZGVjICpjb2RlYykKIAkJbXNsZWVwKDIpOwogCiAJYWxjX3VwZGF0ZV9jb2VmZXhfaWR4
KGNvZGVjLCAweDU3LCAweDA0LCAweDAwMDcsIDB4MSk7IC8qIExvdyBwb3dlciAqLwotCWlmIChz
cGVjLT51bHRyYV9sb3dfcG93ZXIpIHsKLQkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgw
MywgMTw8MSwgMTw8MSk7Ci0JCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4MDgsIDM8PDIs
IDM8PDIpOwotCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDA4LCA3PDw0LCAwKTsKLQkJ
YWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgzYiwgMTw8MTUsIDApOwotCQlhbGNfdXBkYXRl
X2NvZWZfaWR4KGNvZGVjLCAweDBlLCA3PDw2LCA3PDw2KTsKLQkJbXNsZWVwKDMwKTsKLQl9CiAK
IAlzbmRfaGRhX2NvZGVjX3dyaXRlKGNvZGVjLCBocF9waW4sIDAsCiAJCQkgICAgQUNfVkVSQl9T
RVRfQU1QX0dBSU5fTVVURSwgQU1QX09VVF9NVVRFKTsKQEAgLTM2MTIsNiArMzYxMywxMyBAQCBz
dGF0aWMgdm9pZCBhbGMyMjVfaW5pdChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAloZGFfbmlk
X3QgaHBfcGluID0gYWxjX2dldF9ocF9waW4oc3BlYyk7CiAJYm9vbCBocDFfcGluX3NlbnNlLCBo
cDJfcGluX3NlbnNlOwogCisJaWYgKHNwZWMtPnVsdHJhX2xvd19wb3dlcikgeworCQlhbGNfdXBk
YXRlX2NvZWZfaWR4KGNvZGVjLCAweDA4LCAweDBmIDw8IDIsIDM8PDIpOworCQlhbGNfdXBkYXRl
X2NvZWZfaWR4KGNvZGVjLCAweDBlLCA3PDw2LCA3PDw2KTsKKwkJYWxjX3VwZGF0ZV9jb2VmX2lk
eChjb2RlYywgMHgzMywgMTw8MTEsIDApOworCQltc2xlZXAoMzApOworCX0KKwogCWlmIChzcGVj
LT5jb2RlY192YXJpYW50ICE9IEFMQzI2OV9UWVBFX0FMQzI4NykKIAkJLyogcmVxdWlyZWQgb25s
eSBhdCBib290IG9yIFMzIGFuZCBTNCByZXN1bWUgdGltZSAqLwogCQlpZiAoIXNwZWMtPmRvbmVf
aHBfaW5pdCB8fApAQCAtMzYzMiwxMiArMzY0MCw2IEBAIHN0YXRpYyB2b2lkIGFsYzIyNV9pbml0
KHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCQltc2xlZXAoMik7CiAKIAlhbGNfdXBkYXRlX2Nv
ZWZleF9pZHgoY29kZWMsIDB4NTcsIDB4MDQsIDB4MDAwNywgMHgxKTsgLyogTG93IHBvd2VyICov
Ci0JaWYgKHNwZWMtPnVsdHJhX2xvd19wb3dlcikgewotCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNv
ZGVjLCAweDA4LCAweDBmIDw8IDIsIDM8PDIpOwotCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVj
LCAweDBlLCA3PDw2LCA3PDw2KTsKLQkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgzMywg
MTw8MTEsIDApOwotCQltc2xlZXAoMzApOwotCX0KIAogCWlmIChocDFfcGluX3NlbnNlIHx8IHNw
ZWMtPnVsdHJhX2xvd19wb3dlcikKIAkJc25kX2hkYV9jb2RlY193cml0ZShjb2RlYywgaHBfcGlu
LCAwLAo=

--_002_845ba9483f6a49e0aedc52c13a9683d2realtekcom_--
