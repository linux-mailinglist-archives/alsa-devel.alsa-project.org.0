Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C017171FB
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 09:01:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1712F18AD;
	Wed,  8 May 2019 09:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1712F18AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557298860;
	bh=Z2A8TXo0SHWH6PeSbUtSF6P30/yfEiXGCMbgs/ZYzPQ=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VGmrux6Ikmiw9jmwgYDizXKJkQuuaL8eLcpx+7wLpTMPy04sgZplTZR5ymb+nzfQS
	 V20S2QjjaYYs70fJV1He8USDWob/Vl2VzVJN/ygofaCIKQw61kBXKT88y69P7fSERR
	 ZlOubaJbhdc/Jozw7qsXkW991hQong/E0gLtwVU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84A20F896FF;
	Wed,  8 May 2019 08:59:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D177BF896F0; Wed,  8 May 2019 08:59:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F8A6F80796
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 08:59:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F8A6F80796
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x486x2YF004637,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtitcasv01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x486x2YF004637
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=NOT);
 Wed, 8 May 2019 14:59:03 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCASV01.realtek.com.tw ([::1]) with mapi id 14.03.0415.000; Wed, 8 May
 2019 14:59:02 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: FW: move eapd coef function before ACT_PRE_PROBE state
Thread-Index: AdT/J/zgDi+/s6pzRJ+XG6C5XTeJJQErwFhQADei07D//3ubgP/+D9jw
Date: Wed, 8 May 2019 06:59:02 +0000
Message-ID: <6FAB7C47BCF00940BB0999A99BE3547A1D765C5E@RTITMBSVM07.realtek.com.tw>
References: <6FAB7C47BCF00940BB0999A99BE3547A1D765A9D@RTITMBSVM07.realtek.com.tw>
 <s5hmujy39go.wl-tiwai@suse.de>
In-Reply-To: <s5hmujy39go.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
Content-Type: multipart/mixed;
 boundary="_002_6FAB7C47BCF00940BB0999A99BE3547A1D765C5ERTITMBSVM07real_"
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] FW: move eapd coef function before ACT_PRE_PROBE
	state
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

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D765C5ERTITMBSVM07real_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

I recreate patch as attach.
Thanks.

BR,
Kailang

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Tuesday, May 7, 2019 5:23 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: Re: FW: move eapd coef function before ACT_PRE_PROBE state
>=20
> On Tue, 07 May 2019 11:17:15 +0200,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > This one.
>=20
> I already replied twice.  The patch needs rewrite.
> Didn't you get the post?
>=20
>=20
> thanks,
>=20
> Takashi
>=20
> >
> > -----Original Message-----
> > From: Kailang
> > Sent: Monday, May 6, 2019 2:46 PM
> > To: Takashi Iwai (tiwai@suse.de) <tiwai@suse.de>
> > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> > Subject: RE: move eapd coef function before ACT_PRE_PROBE state
> >
> > Hi Takashi,
> >
> > Are you available for apply this ?
> > Thanks.
> >
> > BR,
> > Kailang
> >
> > > -----Original Message-----
> > > From: Kailang
> > > Sent: Tuesday, April 30, 2019 3:41 PM
> > > To: Takashi Iwai (tiwai@suse.de) <tiwai@suse.de>
> > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> > > Subject: move eapd coef function before ACT_PRE_PROBE state
> > >
> > > Hi Takashi,
> > >
> > > alc_fill_eapd_coef(),this function was change EAPD control to default=
.
> > > Default was set EAPD by verb control.
> > > This function was run in ACT_INIT state.
> > > Move it to ACT_PRE_PROBE above. It will have a chance to change EAPD
> > > control on ACT_PRE_PROBE state. It could change control by 0x20 coef =
bit.
> > >
> > > BR,
> > > Kailang
> > [2 0000-move-eapd-coef-func.patch <application/octet-stream (base64)>]
> >
>=20
> ------Please consider the environment before printing this e-mail.

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D765C5ERTITMBSVM07real_
Content-Type: application/octet-stream;
	name="0001-move-eapd-coef-func.patch"
Content-Description: 0001-move-eapd-coef-func.patch
Content-Disposition: attachment; filename="0001-move-eapd-coef-func.patch";
	size=1326; creation-date="Wed, 08 May 2019 06:57:15 GMT";
	modification-date="Wed, 08 May 2019 06:56:18 GMT"
Content-Transfer-Encoding: base64

RnJvbSA4MzUyMTlhMDJhNmFlMWEwN2Y2ZjZlMDI4ZmM0NjQxZWRjN2EzNjMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFdlZCwgOCBNYXkgMjAxOSAxNDo1NDo1MSArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gTW92ZSBFUEFEIGJ5IHZlcmIgZnVuY3Rpb24KCmFsY19maWxsX2VhcGRf
Y29lZigpLHRoaXMgZnVuY3Rpb24gd2FzIGNoYW5nZSBFQVBEIGNvbnRyb2wgdG8gZGVmYXVsdC4K
RGVmYXVsdCB3YXMgc2V0IEVBUEQgYnkgdmVyYiBjb250cm9sLgpUaGlzIGZ1bmN0aW9uIHdhcyBy
dW4gaW4gQUNUX0lOSVQgc3RhdGUuCk1vdmUgaXQgdG8gQUNUX1BSRV9QUk9CRSBhYm92ZS4gSXQg
d2lsbCBoYXZlIGEgY2hhbmNlIHRvIGNoYW5nZSBFQVBEIGNvbnRyb2wKb24gQUNUX1BSRV9QUk9C
RSBzdGF0ZS4gSXQgY291bGQgY2hhbmdlIGNvbnRyb2wgYnkgMHgyMCBjb2VmIGJpdC4KClNpZ25l
ZC1vZmYtYnk6IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4KCmRpZmYgLS1naXQg
YS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVh
bHRlay5jCmluZGV4IGRhY2NjYWNiNWZlMC4uZGUyM2I4YWQ5MzJlIDEwMDY0NAotLS0gYS9zb3Vu
ZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0
ZWsuYwpAQCAtNTAyLDcgKzUwMiw2IEBAIHN0YXRpYyB2b2lkIGFsY19lYXBkX3NodXR1cChzdHJ1
Y3QgaGRhX2NvZGVjICpjb2RlYykKIC8qIGdlbmVyaWMgRUFQRCBpbml0aWFsaXphdGlvbiAqLwog
c3RhdGljIHZvaWQgYWxjX2F1dG9faW5pdF9hbXAoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMsIGlu
dCB0eXBlKQogewotCWFsY19maWxsX2VhcGRfY29lZihjb2RlYyk7CiAJYWxjX2F1dG9fc2V0dXBf
ZWFwZChjb2RlYywgdHJ1ZSk7CiAJYWxjX3dyaXRlX2dwaW8oY29kZWMpOwogCXN3aXRjaCAodHlw
ZSkgewpAQCAtMTA4Niw2ICsxMDg1LDcgQEAgc3RhdGljIGludCBhbGNfYWxsb2Nfc3BlYyhzdHJ1
Y3QgaGRhX2NvZGVjICpjb2RlYywgaGRhX25pZF90IG1peGVyX25pZCkKIAkJcmV0dXJuIC1FTk9N
RU07CiAJY29kZWMtPnNwZWMgPSBzcGVjOwogCXNuZF9oZGFfZ2VuX3NwZWNfaW5pdCgmc3BlYy0+
Z2VuKTsKKwlhbGNfZmlsbF9lYXBkX2NvZWYoY29kZWMpOwogCXNwZWMtPmdlbi5taXhlcl9uaWQg
PSBtaXhlcl9uaWQ7CiAJc3BlYy0+Z2VuLm93bl9lYXBkX2N0bCA9IDE7CiAJY29kZWMtPnNpbmds
ZV9hZGNfYW1wID0gMTsK

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D765C5ERTITMBSVM07real_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D765C5ERTITMBSVM07real_--
