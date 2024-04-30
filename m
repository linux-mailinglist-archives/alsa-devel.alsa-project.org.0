Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B95288B6E13
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 11:20:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F4159741;
	Tue, 30 Apr 2024 11:20:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F4159741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714468844;
	bh=fNYnKgqwma24B8niSOcadM9wVe//6HUWRK0Q+Q4MCLQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yp20QEnB8BsXrgjmMLllH60Ko6k4yav1Fok7DyqL/nDpoAPCD+Ehg915cjtyiWxzO
	 b6dmvKqHpMMY8LWkkwOY3eSlOf1f/NJh2WPNqGheA+8DTJaz13F+BupadCgEO4oTl3
	 Fe3atOnSWMlpTiSrmZpMVsb2IpiwUnrqHOkrzz3k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F368F805A9; Tue, 30 Apr 2024 11:20:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C3D1F805A0;
	Tue, 30 Apr 2024 11:20:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E1F0F80266; Tue, 30 Apr 2024 11:20:05 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 31D4BF8003A
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 11:19:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31D4BF8003A
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 43U9JfKaA251676,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 43U9JfKaA251676
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Apr 2024 17:19:41 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 17:19:41 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 17:19:41 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975]) by
 RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975%5]) with mapi id
 15.01.2507.035; Tue, 30 Apr 2024 17:19:41 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: RE: Thinkpad with ALC1318 has a chance of damaging the IC
Thread-Topic: Thinkpad with ALC1318 has a chance of damaging the IC
Thread-Index: AdqLKCI9ErPUavK7TEaXgj62PwNxmgD7qaAAAH+2eoAAEQ+VEAACVVYAAl8Of/A=
Date: Tue, 30 Apr 2024 09:19:40 +0000
Message-ID: <a853dc4f0a4e412381d5f60565181247@realtek.com>
References: <c646c8ef954d41e6b8fa78b202fd306d@realtek.com>
	<87o7a7xkas.wl-tiwai@suse.de>	<acb0953b16d14047ae581772268c1e7c@realtek.com>
 <87le5awul9.wl-tiwai@suse.de>
In-Reply-To: <87le5awul9.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_a853dc4f0a4e412381d5f60565181247realtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: ZUZN2KBHTUKVHVYFOOW5K3ZMGMUFY6EU
X-Message-ID-Hash: ZUZN2KBHTUKVHVYFOOW5K3ZMGMUFY6EU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZUZN2KBHTUKVHVYFOOW5K3ZMGMUFY6EU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_a853dc4f0a4e412381d5f60565181247realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Attached new patch.

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Thursday, April 18, 2024 11:37 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: Re: Thinkpad with ALC1318 has a chance of damaging the IC
>=20
>=20
> External mail.
>=20
>=20
>=20
> On Thu, 18 Apr 2024 08:33:42 +0200,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > New patch was attached.
> > new additional function was request from Lenovo.
>=20
> I got a compile error.  The check should be rather
>=20
>         if (codec->core.dev.power.power_state.event =3D=3D PM_EVENT_FREEZ=
E)
>=20
> Maybe better to define is_s4_suspend() just like is_s4_resume().
>=20
> And, please rebase the patch to the latest for-linus branch of sound.git =
tree.
>=20
>=20
> thanks,
>=20
> Takashi
>=20
> >
> > BR,
> > Kailang
> >
> > > -----Original Message-----
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Sent: Thursday, April 18, 2024 2:22 PM
> > > To: Kailang <kailang@realtek.com>
> > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> > > Subject: Re: Thinkpad with ALC1318 has a chance of damaging the IC
> > >
> > >
> > > External mail.
> > >
> > >
> > >
> > > On Mon, 15 Apr 2024 11:27:50 +0200,
> > > Kailang wrote:
> > > >
> > > > Hi Takashi,
> > > >
> > > > Please don't apply this patch.
> > > > They want to add stream open to enable GPIO3 functions.
> > >
> > > OK, let me know if the new patch is ready.
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> > >
> > > >
> > > > BR,
> > > > Kailang
> > > >
> > > > > -----Original Message-----
> > > > > From: Kailang
> > > > > Sent: Wednesday, April 10, 2024 5:23 PM
> > > > > To: Takashi Iwai (tiwai@suse.de) <tiwai@suse.de>
> > > > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> > > > > Subject: Thinkpad with ALC1318 has a chance of damaging the IC
> > > > >
> > > > > Hi Takashi,
> > > > >
> > > > > Thinkpad with ALC1318 has a chance of damaging the IC at S4 resum=
e.
> > > > >
> > > > > BR,
> > > > > Kailang
> >

--_002_a853dc4f0a4e412381d5f60565181247realtekcom_
Content-Type: application/octet-stream;
	name="0002-alc287-tp-with-alc1318.patch"
Content-Description: 0002-alc287-tp-with-alc1318.patch
Content-Disposition: attachment;
	filename="0002-alc287-tp-with-alc1318.patch"; size=3989;
	creation-date="Tue, 30 Apr 2024 09:17:23 GMT";
	modification-date="Tue, 30 Apr 2024 09:18:30 GMT"
Content-Transfer-Encoding: base64

RnJvbSBjZWQ5NTY2MTQyODMxOGI0MmRiMTQ2YzQzOTVlMjc1Y2I4ZmIxOWU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFR1ZSwgMzAgQXByIDIwMjQgMTc6MTU6NTMgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIFNldCBHUElPMyB0byBkZWZhdWx0IGF0IFM0IHN0YXRlIGZvciBUaGlu
a3BhZCB3aXRoIEFMQzEzMTgKClRoZXJlIGlzIGEgY2hhbmNlIG9mIGRhbWFnaW5nIHRoZSBJQyB3
aGVuIFM0IHJlc3VtZS4KQWRkIHNhZmUgbW9kZSBmb3Igbm8gc3RyZWFtIHRvIGRpc2FibGUgR1BJ
TzMuClRoaW5rcGFkIHdpdGggQUxDMTMxOCBwbGF0Zm9ybSBuZWVkIHRvIGFkZCB0aGlzIHdvcmth
cm91bmQuCgpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+
CmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9o
ZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4IDA4OTgxOTdjZjhkMy4uZmU3MmUzZTBjNzVkIDEwMDY0
NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRh
L3BhdGNoX3JlYWx0ZWsuYwpAQCAtOTIwLDYgKzkyMCw4IEBAIHN0YXRpYyB2b2lkIGFsY19wcmVf
aW5pdChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAkoKGNvZGVjKS0+Y29yZS5kZXYucG93ZXIu
cG93ZXJfc3RhdGUuZXZlbnQgPT0gUE1fRVZFTlRfUkVTVU1FKQogI2RlZmluZSBpc19zNF9yZXN1
bWUoY29kZWMpIFwKIAkoKGNvZGVjKS0+Y29yZS5kZXYucG93ZXIucG93ZXJfc3RhdGUuZXZlbnQg
PT0gUE1fRVZFTlRfUkVTVE9SRSkKKyNkZWZpbmUgaXNfczRfc3VzcGVuZChjb2RlYykgXAorCSgo
Y29kZWMpLT5jb3JlLmRldi5wb3dlci5wb3dlcl9zdGF0ZS5ldmVudCA9PSBQTV9FVkVOVF9GUkVF
WkUpCiAKIHN0YXRpYyBpbnQgYWxjX2luaXQoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpCiB7CkBA
IC03MTgyLDYgKzcxODQsNDMgQEAgc3RhdGljIHZvaWQgYWxjMjQ1X2ZpeHVwX2hwX3NwZWN0cmVf
eDM2MF9ldTB4eHgoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMsCiAJYWxjMjQ1X2ZpeHVwX2hwX211
dGVfbGVkX2NvZWZiaXQoY29kZWMsIGZpeCwgYWN0aW9uKTsKIAlhbGMyNDVfZml4dXBfaHBfZ3Bp
b19sZWQoY29kZWMsIGZpeCwgYWN0aW9uKTsKIH0KKy8qCisgKiBBTEMyODcgUENNIGhvb2tzCisg
Ki8KK3N0YXRpYyB2b2lkIGFsYzI4N19hbGMxMzE4X3BsYXliYWNrX3BjbV9ob29rKHN0cnVjdCBo
ZGFfcGNtX3N0cmVhbSAqaGluZm8sCisJCQkJICAgc3RydWN0IGhkYV9jb2RlYyAqY29kZWMsCisJ
CQkJICAgc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCisJCQkJICAgaW50IGFj
dGlvbikKK3sKKwlhbGNfd3JpdGVfY29lZl9pZHgoY29kZWMsIDB4MTAsIDB4ODgwNik7IC8qIENo
YW5nZSBNTEsgdG8gR1BJTzMgKi8KKwlzd2l0Y2ggKGFjdGlvbikgeworCWNhc2UgSERBX0dFTl9Q
Q01fQUNUX09QRU46CisJCWFsY193cml0ZV9jb2VmZXhfaWR4KGNvZGVjLCAweDVhLCAweDAwLCAw
eDk1NGYpOyAvKiB3cml0ZSBncGlvMyB0byBoaWdoICovCisJCWJyZWFrOworCWNhc2UgSERBX0dF
Tl9QQ01fQUNUX0NMT1NFOgorCQlhbGNfd3JpdGVfY29lZmV4X2lkeChjb2RlYywgMHg1YSwgMHgw
MCwgMHg1NTRmKTsgLyogd3JpdGUgZ3BpbzMgYXMgZGVmYXVsdCB2YWx1ZSAqLworCQlicmVhazsK
Kwl9Cit9CisKK3N0YXRpYyB2b2lkIGFsYzI4N19zNF9wb3dlcl9ncGlvM19kZWZhdWx0KHN0cnVj
dCBoZGFfY29kZWMgKmNvZGVjKQoreworCWlmIChpc19zNF9zdXNwZW5kKGNvZGVjKSkgeworCQlh
bGNfd3JpdGVfY29lZl9pZHgoY29kZWMsIDB4MTAsIDB4ODgwNik7IC8qIENoYW5nZSBNTEsgdG8g
R1BJTzMgKi8KKwkJYWxjX3dyaXRlX2NvZWZleF9pZHgoY29kZWMsIDB4NWEsIDB4MDAsIDB4NTU0
Zik7IC8qIHdyaXRlIGdwaW8zIGFzIGRlZmF1bHQgdmFsdWUgKi8KKwl9Cit9CisKK3N0YXRpYyB2
b2lkIGFsYzI4N19maXh1cF9sZW5vdm9fdGhpbmtwYWRfd2l0aF9hbGMxMzE4KHN0cnVjdCBoZGFf
Y29kZWMgKmNvZGVjLAorCQkJICAgICAgIGNvbnN0IHN0cnVjdCBoZGFfZml4dXAgKmZpeCwgaW50
IGFjdGlvbikKK3sKKwlzdHJ1Y3QgYWxjX3NwZWMgKnNwZWMgPSBjb2RlYy0+c3BlYzsKKworCWlm
IChhY3Rpb24gIT0gSERBX0ZJWFVQX0FDVF9QUkVfUFJPQkUpCisJCXJldHVybjsKKwlzcGVjLT5w
b3dlcl9ob29rID0gYWxjMjg3X3M0X3Bvd2VyX2dwaW8zX2RlZmF1bHQ7CisJc3BlYy0+Z2VuLnBj
bV9wbGF5YmFja19ob29rID0gYWxjMjg3X2FsYzEzMThfcGxheWJhY2tfcGNtX2hvb2s7Cit9CiAK
IAogZW51bSB7CkBAIC03NDcwLDcgKzc1MDksOCBAQCBlbnVtIHsKIAlBTEMyODVfRklYVVBfQVNV
U19HQTQwM1VfSEVBRFNFVF9NSUMsCiAJQUxDMjg1X0ZJWFVQX0FTVVNfR0E0MDNVX0kyQ19TUEVB
S0VSMl9UT19EQUMxLAogCUFMQzI4NV9GSVhVUF9BU1VTX0dVNjA1X1NQSV8yX0hFQURTRVRfTUlD
LAotCUFMQzI4NV9GSVhVUF9BU1VTX0dVNjA1X1NQSV9TUEVBS0VSMl9UT19EQUMxCisJQUxDMjg1
X0ZJWFVQX0FTVVNfR1U2MDVfU1BJX1NQRUFLRVIyX1RPX0RBQzEsCisJQUxDMjg3X0ZJWFVQX0xF
Tk9WT19USEtQQURfV0hfQUxDMTMxOCwKIH07CiAKIC8qIEEgc3BlY2lhbCBmaXh1cCBmb3IgTGVu
b3ZvIEM5NDAgYW5kIFlvZ2EgRHVldCA3OwpAQCAtOTcyNiw2ICs5NzY2LDEyIEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgaGRhX2ZpeHVwIGFsYzI2OV9maXh1cHNbXSA9IHsKIAkJLmNoYWluZWQgPSB0
cnVlLAogCQkuY2hhaW5faWQgPSBBTEMyODVfRklYVVBfQVNVU19HQTQwM1UsCiAJfSwKKwlbQUxD
Mjg3X0ZJWFVQX0xFTk9WT19USEtQQURfV0hfQUxDMTMxOF0gPSB7CisJCS50eXBlID0gSERBX0ZJ
WFVQX0ZVTkMsCisJCS52LmZ1bmMgPSBhbGMyODdfZml4dXBfbGVub3ZvX3RoaW5rcGFkX3dpdGhf
YWxjMTMxOCwKKwkJLmNoYWluZWQgPSB0cnVlLAorCQkuY2hhaW5faWQgPSBBTEMyNjlfRklYVVBf
VEhJTktQQURfQUNQSQorCX0sCiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9wY2lfcXVp
cmsgYWxjMjY5X2ZpeHVwX3RibFtdID0gewpAQCAtMTAzOTgsNiArMTA0NDQsOCBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IHNuZF9wY2lfcXVpcmsgYWxjMjY5X2ZpeHVwX3RibFtdID0gewogCVNORF9Q
Q0lfUVVJUksoMHgxN2FhLCAweDIzMTgsICJUaGlua3BhZCBaMTMgR2VuMiIsIEFMQzI4N19GSVhV
UF9NR19SVEtDX0NTQU1QX0NTMzVMNDFfSTJDX1RISU5LUEFEKSwKIAlTTkRfUENJX1FVSVJLKDB4
MTdhYSwgMHgyMzE5LCAiVGhpbmtwYWQgWjE2IEdlbjIiLCBBTEMyODdfRklYVVBfTUdfUlRLQ19D
U0FNUF9DUzM1TDQxX0kyQ19USElOS1BBRCksCiAJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MjMx
YSwgIlRoaW5rcGFkIFoxNiBHZW4yIiwgQUxDMjg3X0ZJWFVQX01HX1JUS0NfQ1NBTVBfQ1MzNUw0
MV9JMkNfVEhJTktQQUQpLAorCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDIzMWUsICJUaGlua3Bh
ZCIsIEFMQzI4N19GSVhVUF9MRU5PVk9fVEhLUEFEX1dIX0FMQzEzMTgpLAorCVNORF9QQ0lfUVVJ
UksoMHgxN2FhLCAweDIzMWYsICJUaGlua3BhZCIsIEFMQzI4N19GSVhVUF9MRU5PVk9fVEhLUEFE
X1dIX0FMQzEzMTgpLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDMwYmIsICJUaGlua0NlbnRy
ZSBBSU8iLCBBTEMyMzNfRklYVVBfTEVOT1ZPX0xJTkUyX01JQ19IT1RLRVkpLAogCVNORF9QQ0lf
UVVJUksoMHgxN2FhLCAweDMwZTIsICJUaGlua0NlbnRyZSBBSU8iLCBBTEMyMzNfRklYVVBfTEVO
T1ZPX0xJTkUyX01JQ19IT1RLRVkpLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDMxMGMsICJU
aGlua0NlbnRyZSBTdGF0aW9uIiwgQUxDMjk0X0ZJWFVQX0xFTk9WT19NSUNfTE9DQVRJT04pLAo=

--_002_a853dc4f0a4e412381d5f60565181247realtekcom_--
