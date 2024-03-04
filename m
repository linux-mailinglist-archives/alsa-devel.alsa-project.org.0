Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA8F86F869
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 03:12:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B55F4847;
	Mon,  4 Mar 2024 03:12:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B55F4847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709518369;
	bh=R5naQThWsPiQKPxR7Vhe8MiIiruw5sL8S/9+dpHJmnw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rPE4t4t6jF+Jbz74bSiG3CiGUclumnLIHDkArZklyM6nKyAf9Up1Qb7B1j2MpQLqb
	 lCywJsVstMVg9hGVu289eSkBjMqC8V10PoKnWhVHksLN2PQGfed1Je0rU1n62B4WHr
	 a7WXlHbmhOB/IFauBig+BD0q2IK8xaWUeHT2WK4Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1229F8057F; Mon,  4 Mar 2024 03:12:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74B03F805A0;
	Mon,  4 Mar 2024 03:12:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 048DAF8024E; Mon,  4 Mar 2024 03:12:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81822F80093
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 03:11:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81822F80093
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4242BlE723317572,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (mapi.realtek.com[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 4242BlE723317572
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Mar 2024 10:11:48 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 10:11:47 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 10:11:47 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::48bb:4f38:369c:d153]) by
 RTEXMBS01.realtek.com.tw ([fe80::48bb:4f38:369c:d153%9]) with mapi id
 15.01.2507.035; Mon, 4 Mar 2024 10:11:47 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: RE: Enable Headset Mic for Acer NB platform
Thread-Topic: Enable Headset Mic for Acer NB platform
Thread-Index: AdprsUeS3EovqCnhSRm+LniFgnhYIP//orCA//tS8wA=
Date: Mon, 4 Mar 2024 02:11:47 +0000
Message-ID: <fe0eb6661ca240f3b7762b5b3257710d@realtek.com>
References: <521cc46507f54cd0ae460fb2e0cf90f8@realtek.com>
 <87bk7y5ix6.wl-tiwai@suse.de>
In-Reply-To: <87bk7y5ix6.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_fe0eb6661ca240f3b7762b5b3257710drealtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: APKSMAJMJH2SKFSAWNYNGCUUOFJUDVPC
X-Message-ID-Hash: APKSMAJMJH2SKFSAWNYNGCUUOFJUDVPC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/APKSMAJMJH2SKFSAWNYNGCUUOFJUDVPC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_fe0eb6661ca240f3b7762b5b3257710drealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Oh! Sorry! I forgot.

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Friday, March 1, 2024 6:46 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: Re: Enable Headset Mic for Acer NB platform
>=20
>=20
> External mail.
>=20
>=20
>=20
> On Fri, 01 Mar 2024 09:21:26 +0100,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > This patch will enable headset Mic for Acer NB platform.
>=20
> Is the patch missing?
>=20
>=20
> thanks,
>=20
> Takashi

--_002_fe0eb6661ca240f3b7762b5b3257710drealtekcom_
Content-Type: application/octet-stream; name="0000-alc256-acer-hsmic.patch"
Content-Description: 0000-alc256-acer-hsmic.patch
Content-Disposition: attachment; filename="0000-alc256-acer-hsmic.patch";
	size=996; creation-date="Fri, 01 Mar 2024 07:16:27 GMT";
	modification-date="Fri, 01 Mar 2024 08:15:15 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlYjRiN2NlYTRmNWJiZDZiMDBhOTYyMjVhNTkxOWJkYzNlMWIyOWRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IEZyaSwgMSBNYXIgMjAyNCAxNTowNDowMiArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gQWRkIEhlYWRzZXQgTWljIHN1cHBvcnRlZCBBY2VyIE5CIHBsYXRmb3Jt
CgpJdCB3aWxsIGJlIGVuYWJsZSBoZWFkc2V0IE1pYyBmb3IgQWNlciBOQiBwbGF0Zm9ybS4KClNp
Z25lZC1vZmYtYnk6IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4KZGlmZiAtLWdp
dCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9y
ZWFsdGVrLmMKaW5kZXggZjExMmViMWE4NjhmLi4wZDMwYzY2MzI2NzEgMTAwNjQ0Ci0tLSBhL3Nv
dW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVh
bHRlay5jCkBAIC0xMDg4Miw2ICsxMDg4Miw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX2hk
YV9waW5fcXVpcmsgYWxjMjY5X3Bpbl9maXh1cF90YmxbXSA9IHsKICAqICAgYXQgbW9zdCBvbmUg
dGJsIGlzIGFsbG93ZWQgdG8gZGVmaW5lIGZvciB0aGUgc2FtZSB2ZW5kb3IgYW5kIHNhbWUgY29k
ZWMKICAqLwogc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfaGRhX3Bpbl9xdWlyayBhbGMyNjlfZmFs
bGJhY2tfcGluX2ZpeHVwX3RibFtdID0geworCVNORF9IREFfUElOX1FVSVJLKDB4MTBlYzAyNTYs
IDB4MTAyNSwgIkFjZXIiLCBBTEMyWFhfRklYVVBfSEVBRFNFVF9NSUMsCisJCXsweDE5LCAweDQw
MDAwMDAwfSksCiAJU05EX0hEQV9QSU5fUVVJUksoMHgxMGVjMDI4OSwgMHgxMDI4LCAiRGVsbCIs
IEFMQzI2OV9GSVhVUF9ERUxMNF9NSUNfTk9fUFJFU0VOQ0UsCiAJCXsweDE5LCAweDQwMDAwMDAw
fSwKIAkJezB4MWIsIDB4NDAwMDAwMDB9KSwK

--_002_fe0eb6661ca240f3b7762b5b3257710drealtekcom_--
