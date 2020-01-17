Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5801140519
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 09:14:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56ACD17D9;
	Fri, 17 Jan 2020 09:13:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56ACD17D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579248870;
	bh=o7fwDXLpajfuJIHDOm8Al0r0B8kCaThzEqGKmWL5r8c=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UBCGkezJoKs5lvmSeTeeTlJdMvlx0/KBzN5Ul1Kd5aTgXgvVW9qg68f/bUC0Zii/l
	 fEwwWJy4v1LiEpGa7X7nfOkHyx2xKUgfgah8/kobfI4mAuAoqQqsJbBIY5VhJvk/cA
	 iyIAP5prFW6iAbwwhEuKDuSdszl/re6jQ64P8KyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECF4AF801EB;
	Fri, 17 Jan 2020 09:12:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C007F801EB; Fri, 17 Jan 2020 09:12:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7693EF80086
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 09:12:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7693EF80086
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 00H8CWKh028814,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCAS11.realtek.com.tw[172.21.6.12])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 00H8CWKh028814
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 16:12:32 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTITCAS11.realtek.com.tw (172.21.6.12) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Fri, 17 Jan 2020 16:12:32 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 17 Jan 2020 16:12:32 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f]) by
 RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f%6]) with mapi id
 15.01.1779.005; Fri, 17 Jan 2020 16:12:32 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: HP ALC671 support headset Mic
Thread-Index: AdXM/TTMJmAkNHhOTauVerEQ1XfdLP//mGMA//93WUA=
Date: Fri, 17 Jan 2020 08:12:32 +0000
Message-ID: <06a9d2b176e14706976d6584cbe2d92a@realtek.com>
References: <1afdc37edb8c4c6ca07b73322117cc7b@realtek.com>
 <s5hy2u6o6i5.wl-tiwai@suse.de>
In-Reply-To: <s5hy2u6o6i5.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
Content-Type: multipart/mixed;
 boundary="_002_06a9d2b176e14706976d6584cbe2d92arealtekcom_"
MIME-Version: 1.0
Cc: Hui Wang <hui.wang@canonical.com>, Chih-Hsyuan Ho <chih.ho@canonical.com>,
 " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] HP ALC671 support headset Mic
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--_002_06a9d2b176e14706976d6584cbe2d92arealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Friday, January 17, 2020 4:02 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>; Chih-Hsy=
uan
> Ho <chih.ho@canonical.com>; Hui Wang <hui.wang@canonical.com>
> Subject: Re: HP ALC671 support headset Mic
>=20
> On Fri, 17 Jan 2020 07:14:46 +0100,
> Kailang wrote:
> On Fri, 17 Jan 2020 07:14:46 +0100,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > HP cPC need to support headset Mic.
> > Attach patch was the support patch.
> >
> > BR,
> > Kailang
> > [2 0005-hp-alc671-headset-mic.patch <application/octet-stream (base64)>=
]
>=20
> Thanks, but the patch contains:
> > Fixes: d2cd795c4ece ("ALSA: hda - fixup for the bass speaker on Lenovo
> Carbon X1 7th gen")
>=20
> This doesn't look correct to me.  It's not about Lenovo X1, right?
Yes, it's typo.
Attach again.
Sorry.
>=20
>=20
> Takashi
>=20
> ------Please consider the environment before printing this e-mail.

--_002_06a9d2b176e14706976d6584cbe2d92arealtekcom_
Content-Type: application/octet-stream;
	name="0005-hp-alc671-headset-mic.patch"
Content-Description: 0005-hp-alc671-headset-mic.patch
Content-Disposition: attachment;
	filename="0005-hp-alc671-headset-mic.patch"; size=2673;
	creation-date="Fri, 17 Jan 2020 06:07:32 GMT";
	modification-date="Fri, 17 Jan 2020 08:11:10 GMT"
Content-Transfer-Encoding: base64

RnJvbSBiOTdmOTRmYWRjZDFkYzFhMjBmY2ExOTg2NDBhZmY3MTVkOWIwNDY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IEZyaSwgMTcgSmFuIDIwMjAgMTQ6MDQ6MDEgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEFkZCBIZWFkc2V0IE1pYyBzdXBwb3J0ZWQgZm9yIEhQIGNQQwoKSFAg
QUxDNjcxIG5lZWQgdG8gc3VwcG9ydCBIZWFkc2V0IE1pYy4KClNpZ25lZC1vZmYtYnk6IEthaWxh
bmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4KCmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRh
L3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4IDcz
NDA3YjI1YTc3Ny4uZTQ0NjlhMjU1NjBlIDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNo
X3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAtODQ4Miw2
ICs4NDgyLDI5IEBAIHN0YXRpYyB2b2lkIGFsYzY2Ml9maXh1cF9hc3BpcmVfZXRob3NfaHAoc3Ry
dWN0IGhkYV9jb2RlYyAqY29kZWMsCiAJfQogfQogCitzdGF0aWMgdm9pZCBhbGM2NzFfZml4dXBf
aHBfaGVhZHNldF9taWMyKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAorCQkJCQkgICAgIGNvbnN0
IHN0cnVjdCBoZGFfZml4dXAgKmZpeCwgaW50IGFjdGlvbikKK3sKKwlzdHJ1Y3QgYWxjX3NwZWMg
KnNwZWMgPSBjb2RlYy0+c3BlYzsKKworCXN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRhX3BpbnRibCBw
aW5jZmdzW10gPSB7CisJCXsgMHgxOSwgMHgwMmExMTA0MCB9LCAvKiB1c2UgYXMgaGVhZHNldCBt
aWMsIHdpdGggaXRzIG93biBqYWNrIGRldGVjdCAqLworCQl7IDB4MWIsIDB4MDE4MTMwNGYgfSwK
KwkJeyB9CisJfTsKKworCXN3aXRjaCAoYWN0aW9uKSB7CisJY2FzZSBIREFfRklYVVBfQUNUX1BS
RV9QUk9CRToKKwkJc3BlYy0+Z2VuLm1peGVyX25pZCA9IDA7CisJCXNwZWMtPnBhcnNlX2ZsYWdz
IHw9IEhEQV9QSU5DRkdfSEVBRFNFVF9NSUM7CisJCXNuZF9oZGFfYXBwbHlfcGluY2Zncyhjb2Rl
YywgcGluY2Zncyk7CisJCWJyZWFrOworCWNhc2UgSERBX0ZJWFVQX0FDVF9JTklUOgorCQlhbGNf
d3JpdGVfY29lZl9pZHgoY29kZWMsIDB4MTksIDB4YTA1NCk7CisJCWJyZWFrOworCX0KK30KKwog
c3RhdGljIGNvbnN0IHN0cnVjdCBjb2VmX2Z3IGFsYzY2OF9jb2Vmc1tdID0gewogCVdSSVRFX0NP
RUYoMHgwMSwgMHhiZWJlKSwgV1JJVEVfQ09FRigweDAyLCAweGFhYWEpLCBXUklURV9DT0VGKDB4
MDMsICAgIDB4MCksCiAJV1JJVEVfQ09FRigweDA0LCAweDAxODApLCBXUklURV9DT0VGKDB4MDYs
ICAgIDB4MCksIFdSSVRFX0NPRUYoMHgwNywgMHgwZjgwKSwKQEAgLTg1NTUsNiArODU3OCw3IEBA
IGVudW0gewogCUFMQzY2Ml9GSVhVUF9MRU5PVk9fTVVMVElfQ09ERUNTLAogCUFMQzY2OV9GSVhV
UF9BQ0VSX0FTUElSRV9FVEhPUywKIAlBTEM2NjlfRklYVVBfQUNFUl9BU1BJUkVfRVRIT1NfSEVB
RFNFVCwKKwlBTEM2NzFfRklYVVBfSFBfSEVBRFNFVF9NSUMyLAogfTsKIAogc3RhdGljIGNvbnN0
IHN0cnVjdCBoZGFfZml4dXAgYWxjNjYyX2ZpeHVwc1tdID0gewpAQCAtODg5Niw2ICs4OTIwLDEw
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwIGFsYzY2Ml9maXh1cHNbXSA9IHsKIAkJ
LmNoYWluZWQgPSB0cnVlLAogCQkuY2hhaW5faWQgPSBBTEM2NjlfRklYVVBfQUNFUl9BU1BJUkVf
RVRIT1NfSEVBRFNFVAogCX0sCisJW0FMQzY3MV9GSVhVUF9IUF9IRUFEU0VUX01JQzJdID0gewor
CQkudHlwZSA9IEhEQV9GSVhVUF9GVU5DLAorCQkudi5mdW5jID0gYWxjNjcxX2ZpeHVwX2hwX2hl
YWRzZXRfbWljMiwKKwl9LAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1aXJr
IGFsYzY2Ml9maXh1cF90YmxbXSA9IHsKQEAgLTkwNzgsNiArOTEwNiwyMiBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHNuZF9oZGFfcGluX3F1aXJrIGFsYzY2Ml9waW5fZml4dXBfdGJsW10gPSB7CiAJ
CXsweDEyLCAweDkwYTYwMTMwfSwKIAkJezB4MTQsIDB4OTAxNzAxMTB9LAogCQl7MHgxNSwgMHgw
MzIxMTAxZn0pLAorCVNORF9IREFfUElOX1FVSVJLKDB4MTBlYzA2NzEsIDB4MTAzYywgIkhQIGNQ
QyIsIEFMQzY3MV9GSVhVUF9IUF9IRUFEU0VUX01JQzIsCisJCXsweDE0LCAweDAxMDE0MDEwfSwK
KwkJezB4MTcsIDB4OTAxNzAxNTB9LAorCQl7MHgxYiwgMHgwMTgxMzAzMH0sCisJCXsweDIxLCAw
eDAyMjExMDIwfSksCisJU05EX0hEQV9QSU5fUVVJUksoMHgxMGVjMDY3MSwgMHgxMDNjLCAiSFAg
Y1BDIiwgQUxDNjcxX0ZJWFVQX0hQX0hFQURTRVRfTUlDMiwKKwkJezB4MTQsIDB4MDEwMTQwMTB9
LAorCQl7MHgxOCwgMHgwMWExOTA0MH0sCisJCXsweDFiLCAweDAxODEzMDMwfSwKKwkJezB4MjEs
IDB4MDIyMTEwMjB9KSwKKwlTTkRfSERBX1BJTl9RVUlSSygweDEwZWMwNjcxLCAweDEwM2MsICJI
UCBjUEMiLCBBTEM2NzFfRklYVVBfSFBfSEVBRFNFVF9NSUMyLAorCQl7MHgxNCwgMHgwMTAxNDAy
MH0sCisJCXsweDE3LCAweDkwMTcwMTEwfSwKKwkJezB4MTgsIDB4MDFhMTkwNTB9LAorCQl7MHgx
YiwgMHgwMTgxMzA0MH0sCisJCXsweDIxLCAweDAyMjExMDMwfSksCiAJe30KIH07CiAK

--_002_06a9d2b176e14706976d6584cbe2d92arealtekcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_002_06a9d2b176e14706976d6584cbe2d92arealtekcom_--
