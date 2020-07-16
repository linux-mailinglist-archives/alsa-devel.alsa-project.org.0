Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4BD221D7F
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 09:35:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C8ED1660;
	Thu, 16 Jul 2020 09:34:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C8ED1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594884941;
	bh=9ima237b/kHUcPXGxGBc/QgJ+CDbxL7bSq26JtOXTsE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y9x2PBcmPxDTOwFHu0PlqNfAOwC1sAVySfAdHHeAvfrFqJJ2/dNbArNimVRBtSx+J
	 dFN3X+4VPY2L79zJS72VA6+FGY7OVkGurIsyKg0ne27XvJLBB9b71GGPRWPc23iCT0
	 rNZHAHwHjkuZ9/qDnGwccO8j2o7vFT6nvVNG77Pg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1FC8F8014C;
	Thu, 16 Jul 2020 09:34:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14981F801EC; Thu, 16 Jul 2020 09:33:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F40EF8014E
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 09:33:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F40EF8014E
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 06G7XjtQ6001108,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 06G7XjtQ6001108
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jul 2020 15:33:45 +0800
Received: from RTEXMB03.realtek.com.tw (172.21.6.96) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 16 Jul 2020 15:33:45 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 16 Jul 2020 15:33:45 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8]) by
 RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8%5]) with mapi id
 15.01.1779.005; Thu, 16 Jul 2020 15:33:45 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: ASUS UX563 speaker no ouput
Thread-Topic: ASUS UX563 speaker no ouput
Thread-Index: AdZbQxcmPMUB02OOQDmTYA4zulwStA==
Date: Thu, 16 Jul 2020 07:33:45 +0000
Message-ID: <96dee3ab01a04c28a7b44061e88009dd@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.211]
Content-Type: multipart/mixed;
 boundary="_002_96dee3ab01a04c28a7b44061e88009ddrealtekcom_"
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
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

--_002_96dee3ab01a04c28a7b44061e88009ddrealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

ASUS UX563 speaker also no sound.
Add quirk to model ALC294_FIXUP_ASUS_HPE will solve it.

BR,
Kailang

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Thursday, July 16, 2020 3:19 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: Re: ASUS UX533 and UX534 speaker no ouput
>=20
> On Thu, 16 Jul 2020 09:12:26 +0200,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > Attach patch will solve speaker no output issue for ASUS platform.
> > Many Thanks.
>=20
> Pulled now.  Thanks.
>=20
>=20
> Takashi
>=20
> ------Please consider the environment before printing this e-mail.

--_002_96dee3ab01a04c28a7b44061e88009ddrealtekcom_
Content-Type: application/octet-stream; name="0000-asus-ux563.patch"
Content-Description: 0000-asus-ux563.patch
Content-Disposition: attachment; filename="0000-asus-ux563.patch"; size=1197;
	creation-date="Thu, 16 Jul 2020 07:28:30 GMT";
	modification-date="Thu, 16 Jul 2020 07:27:18 GMT"
Content-Transfer-Encoding: base64

RnJvbSAyZGM2ZDg4OTZiYTQyZjY2NDhiY2YzNTQyMTAxNjgzN2UwOWEwMTFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMTYgSnVsIDIwMjAgMTU6MjE6NTkgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEVuYWJsZSBTcGVha2VyIGZvciBBU1VTIFVYNTYzCgpBU1VTIFVYNTYz
IHNwZWFrZXIgY2FuJ3Qgb3V0cHV0LgpBZGQgcXVpcmsgdG8gbGluayBzdWl0YWJsZSBtb2RlbCB3
aWxsIGVuYWJsZSBpdC4KVGhpcyBtb2RlbCBhbHNvIGNvdWxkIGVuYWJsZSBoZWFkc2V0IE1pYy4K
ClNpZ25lZC1vZmYtYnk6IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4KCmRpZmYg
LS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0
Y2hfcmVhbHRlay5jCmluZGV4IGMxYTEzYzhlYWI0Ny4uZjAxNWFmZDU5MTMzIDEwMDY0NAotLS0g
YS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNo
X3JlYWx0ZWsuYwpAQCAtNzUzNyw2ICs3NTM3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRf
cGNpX3F1aXJrIGFsYzI2OV9maXh1cF90YmxbXSA9IHsKIAlTTkRfUENJX1FVSVJLKDB4MTA0Mywg
MHgxN2QxLCAiQVNVUyBVWDQzMUZMIiwgQUxDMjk0X0ZJWFVQX0FTVVNfRFVBTF9TUEspLAogCVNO
RF9QQ0lfUVVJUksoMHgxMDQzLCAweDE4YjEsICJBc3VzIE1KNDAxVEEiLCBBTEMyNTZfRklYVVBf
QVNVU19IRUFEU0VUX01JQyksCiAJU05EX1BDSV9RVUlSSygweDEwNDMsIDB4MThmMSwgIkFzdXMg
Rlg1MDVEVCIsIEFMQzI1Nl9GSVhVUF9BU1VTX0hFQURTRVRfTUlDKSwKKwlTTkRfUENJX1FVSVJL
KDB4MTA0MywgMHgxOTRlLCAiQVNVUyBVWDU2M0ZEIiwgQUxDMjk0X0ZJWFVQX0FTVVNfSFBFKSwK
IAlTTkRfUENJX1FVSVJLKDB4MTA0MywgMHgxOWNlLCAiQVNVUyBCOTQ1MEZBIiwgQUxDMjk0X0ZJ
WFVQX0FTVVNfSFBFKSwKIAlTTkRfUENJX1FVSVJLKDB4MTA0MywgMHgxOWUxLCAiQVNVUyBVWDU4
MUxWIiwgQUxDMjk1X0ZJWFVQX0FTVVNfTUlDX05PX1BSRVNFTkNFKSwKIAlTTkRfUENJX1FVSVJL
KDB4MTA0MywgMHgxYTEzLCAiQXN1cyBHNzNKdyIsIEFMQzI2OV9GSVhVUF9BU1VTX0c3M0pXKSwK

--_002_96dee3ab01a04c28a7b44061e88009ddrealtekcom_--
