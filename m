Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD617121DA
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 10:11:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9982207;
	Fri, 26 May 2023 10:10:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9982207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685088660;
	bh=ccDx5YlZ6ffA+9dPtnyn5Mdi/wPHAsWHRGGANrun8go=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d4Ysn4QcorK+CkGBMLexikoPucWsgIwTELwCBP5nsrx6h2bFEBJm/XWHzwCcGVCdR
	 vfmThv61Y2wnyD6a/Fv42pubQH1VV2XOyGXSzk21arwhBJ3mK+y+81mxK35lNZOjj8
	 5RcM4Wb0J4KWGKYegpUgdntcmqAM/1cb+o4P6h8Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 151ADF80542; Fri, 26 May 2023 10:09:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B2D5F8016A;
	Fri, 26 May 2023 10:09:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20A08F80249; Fri, 26 May 2023 10:09:51 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A3CDF80086
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 10:09:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A3CDF80086
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 34Q89IPV0002638,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 34Q89IPV0002638
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 26 May 2023 16:09:18 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 26 May 2023 16:09:30 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Fri, 26 May 2023 16:09:29 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::4d7:e49a:674a:598]) by
 RTEXMBS01.realtek.com.tw ([fe80::4d7:e49a:674a:598%5]) with mapi id
 15.01.2375.007; Fri, 26 May 2023 16:09:29 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
CC: "Joseph C. Sible" <josephcsible@gmail.com>,
        Bagas Sanjaya
	<bagasdotme@gmail.com>,
        "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>,
        "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>
Subject: RE: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
Thread-Topic: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
Thread-Index: 
 AQHZhdSOD7kY6mXBDkGA3ryhp811r69Yu5SAgAASNACAAA22gIAA7n+AgAEJrYCABLe/YIAJNIWAgAIHAcD//4tyAIAB8UZw
Date: Fri, 26 May 2023 08:09:29 +0000
Message-ID: <1170325957764b4cbd7cd3639575f285@realtek.com>
References: <bug-217440-225600@https.bugzilla.kernel.org/>
	<CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
	<ZGB0cVVI7OgaJU6t@debian.me>
	<CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
	<87cz338ix4.wl-tiwai@suse.de>
	<CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
	<874jodlnmi.wl-tiwai@suse.de>	<415d4bc84aa74c74af913048f28b42a9@realtek.com>
	<87fs7mdofi.wl-tiwai@suse.de>	<7da2fdfdae614b1c98deda6e11ca34eb@realtek.com>
 <87353kd8b9.wl-tiwai@suse.de>
In-Reply-To: <87353kd8b9.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS06.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: CI4S4SJD7JYRNCXZI3ZVMDWLQZ465M7H
X-Message-ID-Hash: CI4S4SJD7JYRNCXZI3ZVMDWLQZ465M7H
X-MailFrom: kailang@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CI4S4SJD7JYRNCXZI3ZVMDWLQZ465M7H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

I test the ALC236 for do below line. It passed on reboot OS.
=3D=3D> alc_update_coef_idx(codec, 0x46, 0, 3 << 12);  /* 3K pull low */

I also test it without 3K pull low. It also passed on reboot OS.

I think this machine was the special case for this issue.

Hi Joseph,

Could you test it with below model name?
=3D=3D> alc-chrome-book

BR
Kailang.

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Thursday, May 25, 2023 6:17 PM
> To: Kailang <kailang@realtek.com>
> Cc: Joseph C. Sible <josephcsible@gmail.com>; Bagas Sanjaya
> <bagasdotme@gmail.com>; regressions@lists.linux.dev; perex@perex.cz;
> tiwai@suse.com; alsa-devel@alsa-project.org
> Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP
> 15z-fc000 on warm boot
>=20
>=20
> External mail.
>=20
>=20
>=20
> On Thu, 25 May 2023 11:21:38 +0200,
> Kailang wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Sent: Wednesday, May 24, 2023 6:17 PM
> > > To: Kailang <kailang@realtek.com>
> > > Cc: Joseph C. Sible <josephcsible@gmail.com>; Bagas Sanjaya
> > > <bagasdotme@gmail.com>; regressions@lists.linux.dev; perex@perex.cz;
> > > tiwai@suse.com; alsa-devel@alsa-project.org
> > > Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP
> > > 15z-fc000 on warm boot
> > >
> > >
> > > External mail.
> > >
> > >
> > >
> > > On Thu, 18 May 2023 07:44:23 +0200,
> > > Kailang wrote:
> > > >
> > > > > -----Original Message-----
> > > > > From: Takashi Iwai <tiwai@suse.de>
> > > > > Sent: Monday, May 15, 2023 9:40 PM
> > > > > To: Joseph C. Sible <josephcsible@gmail.com>
> > > > > Cc: Bagas Sanjaya <bagasdotme@gmail.com>;
> > > > > regressions@lists.linux.dev; Kailang <kailang@realtek.com>;
> > > > > perex@perex.cz; tiwai@suse.com; alsa-devel@alsa-project.org
> > > > > Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from
> > > > > HP
> > > > > 15z-fc000 on warm boot
> > > > >
> > > > >
> > > > > External mail.
> > > > >
> > > > >
> > > > >
> > > > > On Sun, 14 May 2023 23:48:55 +0200, Joseph C. Sible wrote:
> > > > > >
> > > > > > On 5/14/23, Takashi Iwai wrote:
> > > > > > > The patch changes two places (the change in
> > > > > > > alc_shutup_pins() and alc256_shutup()), and I guess the latte=
r is the
> culprit.
> > > > > > > Could you verify that only reverting the latter fixes the pro=
blem?
> > > > > >
> > > > > > Yes, only reverting the latter fixes the problem. I just tried
> > > > > > a kernel consisting of 6.3.2 plus the below change, and it work=
s fine:
> > > > > >
> > > > > > --- a/sound/pci/hda/patch_realtek.c
> > > > > > +++ b/sound/pci/hda/patch_realtek.c
> > > > > > @@ -3638,8 +3638,7 @@ static void alc256_shutup(struct
> > > > > > hda_codec
> > > > > *codec)
> > > > > >         /* If disable 3k pulldown control for alc257, the Mic
> > > > > > detection will not work correctly
> > > > > >          * when booting with headset plugged. So skip setting
> > > > > > it for the codec alc257
> > > > > >          */
> > > > > > -       if (codec->core.vendor_id !=3D 0x10ec0236 &&
> > > > > > -           codec->core.vendor_id !=3D 0x10ec0257)
> > > > > > +       if (codec->core.vendor_id !=3D 0x10ec0257)
> > > > > >                 alc_update_coef_idx(codec, 0x46, 0, 3 << 12);
> > > > > >
> > > > > >         if (!spec->no_shutup_pins)
> > > > >
> > > > > OK, thanks for confirmation.
> > > > >
> > > > > Kailang, could you check this issue?
> > > >
> > > > OK. I will take it a look for these days.
> > >
> > > Kailang, any chance to get this fixed?
> > Sorry! My test machine didn't work. I couldn't have a machine to do thi=
s test.
> > But I find one ChromeBook with ALC236 today.
>=20
> Thanks!
>=20
> I already submitted a PR to Linus for 6.4-rc4, and the next PR will be li=
kely in
> two weeks, so we have a bit of time :)
>=20
>=20
> Takashi
>=20
> ------Please consider the environment before printing this e-mail.
