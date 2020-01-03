Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 355AA12F5D6
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:59:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7295178F;
	Fri,  3 Jan 2020 09:58:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7295178F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578041951;
	bh=7vB4enK56Ri4He4oaufYdkhxuwS77Gtpfc6/QPG/J2Y=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qth62VBb7liSiFnajGkgfupD30x1DvLmsa/bbd/onPN34vj35RZ38RIWwehhlh78C
	 oSrnDgjQZ1NJ7ALpE8/ehzvFpw1O03oEje9A5Xq8jYewUdAbg4JgRL34/T+0hwCO92
	 0tmymLNbdmjIJ7VsIBJ4JARirz6udBdcWQOAmsWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D82F6F80272;
	Fri,  3 Jan 2020 09:47:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34D05F8015F; Fri,  3 Jan 2020 09:47:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8ECF4F8015C
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:47:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ECF4F8015C
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 0038kuum013380,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV02.realtek.com.tw[172.21.6.19])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 0038kuum013380
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 3 Jan 2020 16:46:56 +0800
Received: from RTEXMB03.realtek.com.tw (172.21.6.96) by
 RTITCASV02.realtek.com.tw (172.21.6.19) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Fri, 3 Jan 2020 16:46:56 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 3 Jan 2020 16:46:56 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::a917:b20f:da75:59e0]) by
 RTEXMB01.realtek.com.tw ([fe80::a917:b20f:da75:59e0%6]) with mapi id
 15.01.1779.005; Fri, 3 Jan 2020 16:46:56 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: Realtek ALC S1200A
Thread-Index: AQHVwWKd1wha2HGt/E61OZMhI7SUd6fYnM4g//9+g4CAAIZaAA==
Date: Fri, 3 Jan 2020 08:46:55 +0000
Message-ID: <a9bd3cdaa02d4fa197623448d5c51e50@realtek.com>
References: <44114db7-21cf-b6e5-e836-7a85dbec9777@gmail.com>
 <s5himlu2i58.wl-tiwai@suse.de>	<22b6489cfe664d83836733cdaa19007e@realtek.com>
 <s5h1rshj5d8.wl-tiwai@suse.de>
In-Reply-To: <s5h1rshj5d8.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
Content-Type: multipart/mixed;
 boundary="_002_a9bd3cdaa02d4fa197623448d5c51e50realtekcom_"
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>,
 Lee Harris <lee.r.harris@gmail.com>
Subject: Re: [alsa-devel] Realtek ALC S1200A
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

--_002_a9bd3cdaa02d4fa197623448d5c51e50realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

CC alsa-devel.

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Friday, January 3, 2020 4:45 PM
> To: Kailang <kailang@realtek.com>
> Cc: Lee Harris <lee.r.harris@gmail.com>
> Subject: Re: Realtek ALC S1200A
>=20
> On Fri, 03 Jan 2020 09:29:59 +0100,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > Attach was supported patch.
>=20
> Care to submit to alsa-devel ML?  Thanks!
>=20
>=20
> Takashi
>=20
> >
> > BR,
> > Kailang
> >
> > > -----Original Message-----
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Sent: Thursday, January 2, 2020 7:49 PM
> > > To: Lee Harris <lee.r.harris@gmail.com>
> > > Cc: Kailang <kailang@realtek.com>
> > > Subject: Re: Realtek ALC S1200A
> > >
> > > On Thu, 02 Jan 2020 12:41:08 +0100,
> > > Lee Harris wrote:
> > > >
> > >
> > > > Hi Takashi
> > > >
> > > > I saw you had made the changes to sound/pci/hda/patch_realtek.c to
> > > > enable support for the Realtek ALC S1200.
> > > > I hope you don't mind me emailing you?
> > > > My motherboard is an Asus TUF-GAMING-X570-PLUS. The vendors
> > > > product page states it has an Realtek ALC S1200A.
> > > >
> > > > cat /proc/asound/card0/codec#0 shows the following vendor ID
> > > >
> > > > Vendor Id: 0x10ec0b00
> > > > Subsystem Id: 0x10438797
> > > > Revision Id: 0x100001
> > > >
> > > > As standard the sound works but the snd_hda_codec_realtek module
> > > > is not loaded, and the codec is reported as 'Realtek Generic'. I
> > > > can add
> > > > 0x10ec0b00 into patch_realtek.c (just replaced 0x10ec1168 wherever
> > > > it
> > > > occurred!) and the snd_hda_codec_realtek module is loaded, sound
> > > > still
> > > works. Possibly better ?
> > > > No idea If I've done it close to right ? I'm not a programmer,
> > > > just experimenting.
> > > >
> > > > If you need anymore info just let me know.
> > > > Happy new year :)
> > > >
> > > > Regards
> > > > Lee Harris
> > >
> > > Thanks for the report.
> > >
> > > I'd like to hear from Realtek people at first (now Cc'ed).
> > > Kailang, could you check for this new codec?
> > >
> > >
> > > Takashi
> > >
> > > ------Please consider the environment before printing this e-mail.
> > [2 0000-alcs1200a-supported.patch <application/octet-stream (base64)>]
> >

--_002_a9bd3cdaa02d4fa197623448d5c51e50realtekcom_
Content-Type: application/octet-stream;
	name="0000-alcs1200a-supported.patch"
Content-Description: 0000-alcs1200a-supported.patch
Content-Disposition: attachment; filename="0000-alcs1200a-supported.patch";
	size=1367; creation-date="Fri, 03 Jan 2020 08:28:10 GMT";
	modification-date="Fri, 03 Jan 2020 08:27:52 GMT"
Content-Transfer-Encoding: base64

RnJvbSBiNzY5ODI4M2NlNTU3ZDI3YjkwZmVkMWNkY2U2NzU3MWI3MDVhYjcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IEZyaSwgMyBKYW4gMjAyMCAxNjoyNDowNiArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gQWRkIG5ldyBjb2RlYyBzdXBwb3J0ZWQgZm9yIEFMQ1MxMjAwQQoKQWRk
IEFMQ1MxMjAwQSBzdXBwb3J0ZWQuCkl0IHdhcyBzaW1pbGFyIGFzIEFMQzkwMC4KClNpZ25lZC1v
ZmYtYnk6IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4KCmRpZmYgLS1naXQgYS9z
b3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRl
ay5jCmluZGV4IGRiZmFmZWU5NzkzMS4uZDZkYmY2NjUyZmUwIDEwMDY0NAotLS0gYS9zb3VuZC9w
Y2kvaGRhL3BhdGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsu
YwpAQCAtNDMwLDYgKzQzMCw3IEBAIHN0YXRpYyB2b2lkIGFsY19maWxsX2VhcGRfY29lZihzdHJ1
Y3QgaGRhX2NvZGVjICpjb2RlYykKIAkJYnJlYWs7CiAJY2FzZSAweDEwZWMwODk5OgogCWNhc2Ug
MHgxMGVjMDkwMDoKKwljYXNlIDB4MTBlYzBiMDA6CiAJY2FzZSAweDEwZWMxMTY4OgogCWNhc2Ug
MHgxMGVjMTIyMDoKIAkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHg3LCAxPDwxLCAwKTsK
QEAgLTI1MjUsNiArMjUyNiw3IEBAIHN0YXRpYyBpbnQgcGF0Y2hfYWxjODgyKHN0cnVjdCBoZGFf
Y29kZWMgKmNvZGVjKQogCWNhc2UgMHgxMGVjMDg4MjoKIAljYXNlIDB4MTBlYzA4ODU6CiAJY2Fz
ZSAweDEwZWMwOTAwOgorCWNhc2UgMHgxMGVjMGIwMDoKIAljYXNlIDB4MTBlYzEyMjA6CiAJCWJy
ZWFrOwogCWRlZmF1bHQ6CkBAIC05MjM3LDYgKzkyMzksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGhkYV9kZXZpY2VfaWQgc25kX2hkYV9pZF9yZWFsdGVrW10gPSB7CiAJSERBX0NPREVDX0VOVFJZ
KDB4MTBlYzA4OTIsICJBTEM4OTIiLCBwYXRjaF9hbGM2NjIpLAogCUhEQV9DT0RFQ19FTlRSWSgw
eDEwZWMwODk5LCAiQUxDODk4IiwgcGF0Y2hfYWxjODgyKSwKIAlIREFfQ09ERUNfRU5UUlkoMHgx
MGVjMDkwMCwgIkFMQzExNTAiLCBwYXRjaF9hbGM4ODIpLAorCUhEQV9DT0RFQ19FTlRSWSgweDEw
ZWMwYjAwLCAiQUxDUzEyMDBBIiwgcGF0Y2hfYWxjODgyKSwKIAlIREFfQ09ERUNfRU5UUlkoMHgx
MGVjMTE2OCwgIkFMQzEyMjAiLCBwYXRjaF9hbGM4ODIpLAogCUhEQV9DT0RFQ19FTlRSWSgweDEw
ZWMxMjIwLCAiQUxDMTIyMCIsIHBhdGNoX2FsYzg4MiksCiAJe30gLyogdGVybWluYXRvciAqLwo=

--_002_a9bd3cdaa02d4fa197623448d5c51e50realtekcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_002_a9bd3cdaa02d4fa197623448d5c51e50realtekcom_--
