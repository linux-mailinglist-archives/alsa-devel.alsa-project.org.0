Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD0665BAF7
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 07:52:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D09B3C8BA;
	Tue,  3 Jan 2023 07:51:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D09B3C8BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672728766;
	bh=CBTfiMouzqzZx18Tnxrp88VVoqsb+2NzdTSq2SSZstc=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gAqRvygocrPRBvirEV2+YzNezlycStnv25ZsT6kiiOgVQYK/y/UeSPzdih7f0qMBu
	 jRT/uFjb5QvSef3El79EeU1draL850ff+ywJ5w0UYYEM42nuWMwhhNxJnuSxLZ6vQ5
	 O6U/WGXGSx7xm2no948y714muiFUleonnIJ/hUUE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69D9CF804AD;
	Tue,  3 Jan 2023 07:51:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F3A7F800F8; Tue,  3 Jan 2023 07:51:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 by alsa1.perex.cz (Postfix) with ESMTP id 4A873F8047B
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 07:51:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A873F8047B
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 3036oduI7003975,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
 by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 3036oduI7003975
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
 Tue, 3 Jan 2023 14:50:39 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Tue, 3 Jan 2023 14:51:35 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 3 Jan 2023 14:51:34 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::98d2:65f8:dcdf:fa31]) by
 RTEXMBS01.realtek.com.tw ([fe80::98d2:65f8:dcdf:fa31%5]) with mapi id
 15.01.2375.007; Tue, 3 Jan 2023 14:51:34 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: RE: Turn on power early to avoid something
Thread-Topic: Turn on power early to avoid something
Thread-Index: AdkcI3Ma5yaXX0FTSK+6gZEsLjDbL///fb2A//94BFCAAJvTAP/5WTSA
Date: Tue, 3 Jan 2023 06:51:34 +0000
Message-ID: <e35d8f4fa18f4448a2315cc7d4a3715f@realtek.com>
References: <3dcfbaf4ccb34be7a9c4af0202cdcdd4@realtek.com>
 <87fscxxqp0.wl-tiwai@suse.de>	<af64a2d5e55448dbadef4d0efd96bea5@realtek.com>
 <87cz81xnen.wl-tiwai@suse.de>
In-Reply-To: <87cz81xnen.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS06.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2023/1/3_=3F=3F_02:18:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: multipart/mixed;
 boundary="_002_e35d8f4fa18f4448a2315cc7d4a3715frealtekcom_"
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

--_002_e35d8f4fa18f4448a2315cc7d4a3715frealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Add more description.

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Friday, December 30, 2022 5:16 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: Re: Turn on power early to avoid something
>=20
> On Fri, 30 Dec 2022 09:14:16 +0100,
> Kailang wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Sent: Friday, December 30, 2022 4:05 PM
> > > To: Kailang <kailang@realtek.com>
> > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> > > Subject: Re: Turn on power early to avoid something
> > >
> > > On Fri, 30 Dec 2022 08:54:01 +0100,
> > > Kailang wrote:
> > > >
> > > > Hi Takashi,
> > > >
> > > > It maybe can avoid something for early power up.
> > > >
> > > > Many Thanks.
> > > > Kailang.
> > >
> > > Hmm, what is "something"?  The description is way too ambiguous to
> > > judge whether the change is OK or not, unfortunately.
> > > Could you elaborate what exactly the change will fix?
> > >
> > > Also, when you submit a patch from another person, please put your
> > > own Signed-off-by line.  It's a legal requirement.
> > yangyuchi66@gmail.com was my personal account.
> > Could I use this account?
>=20
> Ah OK, then it's fine.
>=20
> > Or I need use this account to mail patch to you.
>=20
> It's not necessary, the sign-off is fine as long as it matches with the F=
rom
> address in the patch and it's yourself.
>=20
> But we still need a better description of the patch text.
>=20
>=20
> thanks,
>=20
> Takashi
>=20
> ------Please consider the environment before printing this e-mail.

--_002_e35d8f4fa18f4448a2315cc7d4a3715frealtekcom_
Content-Type: application/octet-stream;
	name="0000-turn-on-power-early.patch"
Content-Description: 0000-turn-on-power-early.patch
Content-Disposition: attachment; filename="0000-turn-on-power-early.patch";
	size=2516; creation-date="Fri, 30 Dec 2022 07:26:17 GMT";
	modification-date="Tue, 03 Jan 2023 06:49:50 GMT"
Content-Transfer-Encoding: base64

RnJvbSBjMjZhM2U1YzYyNWIzZDZhZjhiYjkwYjQ1MGI4MTdiYTU1ZDJjYzExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBZdWNoaSBZYW5nIDx5YW5neXVjaGk2NkBnbWFpbC5jb20+CkRh
dGU6IEZyaSwgMzAgRGVjIDIwMjIgMTU6MjI6MjUgKzA4MDAKU3ViamVjdDogW1BBVENIXUFMU0E6
IGhkYS9yZWFsdGVrIC0gVHVybiBvbiBwb3dlciBlYXJseQoKVHVybiBvbiBwb3dlciBlYXJseSB0
byBhdm9pZCB3cm9uZyBzdGF0ZSBmb3IgcG93ZXIgcmVsYXRpb24gcmVnaXN0ZXIuClRoaXMgY2Fu
IGVhcmxpZXIgdXBkYXRlIEpEIHN0YXRlIHdoZW4gcmVzdW1lIGJhY2suCgpTaWduZWQtb2ZmLWJ5
OiBZdWNoaSBZYW5nIDx5YW5neXVjaGk2NkBnbWFpbC5jb20+CgpkaWZmIC0tZ2l0IGEvc291bmQv
cGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpp
bmRleCA4YTNlMmZlNDIxMDYuLjExODRiN2I1M2VlYyAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hk
YS9wYXRjaF9yZWFsdGVrLmMKKysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAg
LTM0NjMsNiArMzQ2MywxNSBAQCBzdGF0aWMgdm9pZCBhbGMyNTZfaW5pdChzdHJ1Y3QgaGRhX2Nv
ZGVjICpjb2RlYykKIAloZGFfbmlkX3QgaHBfcGluID0gYWxjX2dldF9ocF9waW4oc3BlYyk7CiAJ
Ym9vbCBocF9waW5fc2Vuc2U7CiAKKwlpZiAoc3BlYy0+dWx0cmFfbG93X3Bvd2VyKSB7CisJCWFs
Y191cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4MDMsIDE8PDEsIDE8PDEpOworCQlhbGNfdXBkYXRl
X2NvZWZfaWR4KGNvZGVjLCAweDA4LCAzPDwyLCAzPDwyKTsKKwkJYWxjX3VwZGF0ZV9jb2VmX2lk
eChjb2RlYywgMHgwOCwgNzw8NCwgMCk7CisJCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4
M2IsIDE8PDE1LCAwKTsKKwkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgwZSwgNzw8Niwg
Nzw8Nik7CisJCW1zbGVlcCgzMCk7CisJfQorCiAJaWYgKCFocF9waW4pCiAJCWhwX3BpbiA9IDB4
MjE7CiAKQEAgLTM0NzQsMTQgKzM0ODMsNiBAQCBzdGF0aWMgdm9pZCBhbGMyNTZfaW5pdChzdHJ1
Y3QgaGRhX2NvZGVjICpjb2RlYykKIAkJbXNsZWVwKDIpOwogCiAJYWxjX3VwZGF0ZV9jb2VmZXhf
aWR4KGNvZGVjLCAweDU3LCAweDA0LCAweDAwMDcsIDB4MSk7IC8qIExvdyBwb3dlciAqLwotCWlm
IChzcGVjLT51bHRyYV9sb3dfcG93ZXIpIHsKLQkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywg
MHgwMywgMTw8MSwgMTw8MSk7Ci0JCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4MDgsIDM8
PDIsIDM8PDIpOwotCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDA4LCA3PDw0LCAwKTsK
LQkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgzYiwgMTw8MTUsIDApOwotCQlhbGNfdXBk
YXRlX2NvZWZfaWR4KGNvZGVjLCAweDBlLCA3PDw2LCA3PDw2KTsKLQkJbXNsZWVwKDMwKTsKLQl9
CiAKIAlzbmRfaGRhX2NvZGVjX3dyaXRlKGNvZGVjLCBocF9waW4sIDAsCiAJCQkgICAgQUNfVkVS
Ql9TRVRfQU1QX0dBSU5fTVVURSwgQU1QX09VVF9NVVRFKTsKQEAgLTM2MTIsNiArMzYxMywxMyBA
QCBzdGF0aWMgdm9pZCBhbGMyMjVfaW5pdChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAloZGFf
bmlkX3QgaHBfcGluID0gYWxjX2dldF9ocF9waW4oc3BlYyk7CiAJYm9vbCBocDFfcGluX3NlbnNl
LCBocDJfcGluX3NlbnNlOwogCisJaWYgKHNwZWMtPnVsdHJhX2xvd19wb3dlcikgeworCQlhbGNf
dXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDA4LCAweDBmIDw8IDIsIDM8PDIpOworCQlhbGNfdXBk
YXRlX2NvZWZfaWR4KGNvZGVjLCAweDBlLCA3PDw2LCA3PDw2KTsKKwkJYWxjX3VwZGF0ZV9jb2Vm
X2lkeChjb2RlYywgMHgzMywgMTw8MTEsIDApOworCQltc2xlZXAoMzApOworCX0KKwogCWlmIChz
cGVjLT5jb2RlY192YXJpYW50ICE9IEFMQzI2OV9UWVBFX0FMQzI4NykKIAkJLyogcmVxdWlyZWQg
b25seSBhdCBib290IG9yIFMzIGFuZCBTNCByZXN1bWUgdGltZSAqLwogCQlpZiAoIXNwZWMtPmRv
bmVfaHBfaW5pdCB8fApAQCAtMzYzMiwxMiArMzY0MCw2IEBAIHN0YXRpYyB2b2lkIGFsYzIyNV9p
bml0KHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCQltc2xlZXAoMik7CiAKIAlhbGNfdXBkYXRl
X2NvZWZleF9pZHgoY29kZWMsIDB4NTcsIDB4MDQsIDB4MDAwNywgMHgxKTsgLyogTG93IHBvd2Vy
ICovCi0JaWYgKHNwZWMtPnVsdHJhX2xvd19wb3dlcikgewotCQlhbGNfdXBkYXRlX2NvZWZfaWR4
KGNvZGVjLCAweDA4LCAweDBmIDw8IDIsIDM8PDIpOwotCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNv
ZGVjLCAweDBlLCA3PDw2LCA3PDw2KTsKLQkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgz
MywgMTw8MTEsIDApOwotCQltc2xlZXAoMzApOwotCX0KIAogCWlmIChocDFfcGluX3NlbnNlIHx8
IHNwZWMtPnVsdHJhX2xvd19wb3dlcikKIAkJc25kX2hkYV9jb2RlY193cml0ZShjb2RlYywgaHBf
cGluLCAwLAo=

--_002_e35d8f4fa18f4448a2315cc7d4a3715frealtekcom_--
