Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 035707108BF
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 11:22:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DDCD1FE;
	Thu, 25 May 2023 11:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DDCD1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685006573;
	bh=yuT1pN6Pnc4bFKqFOZjYKtFRces8Izo+cn8PRBe2CiI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XLaZ/4SAhIVH+6rjQoYOplCTSCrHtrNN4uL+shSoKVKDS8KLDwpCM0kBVPqQhIvBQ
	 9OUB3ePnBzhTSWtABc9UqUB/9sgChB3HsjhwXZwVtoBBEEHCVeKfM+E8c48U4GYTXH
	 AJoNxwAHwbsvh0VgBT9itVDBALUM6gtjsgpC2Gzk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D306DF80544; Thu, 25 May 2023 11:22:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61CD0F8016A;
	Thu, 25 May 2023 11:22:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEB3CF80249; Thu, 25 May 2023 11:21:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6837BF800DF
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 11:21:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6837BF800DF
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 34P9LRcaC006894,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 34P9LRcaC006894
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Thu, 25 May 2023 17:21:27 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Thu, 25 May 2023 17:21:39 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 25 May 2023 17:21:38 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::4d7:e49a:674a:598]) by
 RTEXMBS01.realtek.com.tw ([fe80::4d7:e49a:674a:598%5]) with mapi id
 15.01.2375.007; Thu, 25 May 2023 17:21:38 +0800
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
 AQHZhdSOD7kY6mXBDkGA3ryhp811r69Yu5SAgAASNACAAA22gIAA7n+AgAEJrYCABLe/YIAJNIWAgAIHAcA=
Date: Thu, 25 May 2023 09:21:38 +0000
Message-ID: <7da2fdfdae614b1c98deda6e11ca34eb@realtek.com>
References: <bug-217440-225600@https.bugzilla.kernel.org/>
	<CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
	<ZGB0cVVI7OgaJU6t@debian.me>
	<CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
	<87cz338ix4.wl-tiwai@suse.de>
	<CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
	<874jodlnmi.wl-tiwai@suse.de>	<415d4bc84aa74c74af913048f28b42a9@realtek.com>
 <87fs7mdofi.wl-tiwai@suse.de>
In-Reply-To: <87fs7mdofi.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS05.realtek.com.tw, 9
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
Message-ID-Hash: ARYTAGEW5U62YN7BSLGZFQ4B26F2RHX7
X-Message-ID-Hash: ARYTAGEW5U62YN7BSLGZFQ4B26F2RHX7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ARYTAGEW5U62YN7BSLGZFQ4B26F2RHX7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Wednesday, May 24, 2023 6:17 PM
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
> On Thu, 18 May 2023 07:44:23 +0200,
> Kailang wrote:
> >
> > > -----Original Message-----
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Sent: Monday, May 15, 2023 9:40 PM
> > > To: Joseph C. Sible <josephcsible@gmail.com>
> > > Cc: Bagas Sanjaya <bagasdotme@gmail.com>;
> > > regressions@lists.linux.dev; Kailang <kailang@realtek.com>;
> > > perex@perex.cz; tiwai@suse.com; alsa-devel@alsa-project.org
> > > Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP
> > > 15z-fc000 on warm boot
> > >
> > >
> > > External mail.
> > >
> > >
> > >
> > > On Sun, 14 May 2023 23:48:55 +0200,
> > > Joseph C. Sible wrote:
> > > >
> > > > On 5/14/23, Takashi Iwai wrote:
> > > > > The patch changes two places (the change in alc_shutup_pins()
> > > > > and alc256_shutup()), and I guess the latter is the culprit.
> > > > > Could you verify that only reverting the latter fixes the problem=
?
> > > >
> > > > Yes, only reverting the latter fixes the problem. I just tried a
> > > > kernel consisting of 6.3.2 plus the below change, and it works fine=
:
> > > >
> > > > --- a/sound/pci/hda/patch_realtek.c
> > > > +++ b/sound/pci/hda/patch_realtek.c
> > > > @@ -3638,8 +3638,7 @@ static void alc256_shutup(struct hda_codec
> > > *codec)
> > > >         /* If disable 3k pulldown control for alc257, the Mic
> > > > detection will not work correctly
> > > >          * when booting with headset plugged. So skip setting it
> > > > for the codec alc257
> > > >          */
> > > > -       if (codec->core.vendor_id !=3D 0x10ec0236 &&
> > > > -           codec->core.vendor_id !=3D 0x10ec0257)
> > > > +       if (codec->core.vendor_id !=3D 0x10ec0257)
> > > >                 alc_update_coef_idx(codec, 0x46, 0, 3 << 12);
> > > >
> > > >         if (!spec->no_shutup_pins)
> > >
> > > OK, thanks for confirmation.
> > >
> > > Kailang, could you check this issue?
> >
> > OK. I will take it a look for these days.
>=20
> Kailang, any chance to get this fixed?
Sorry! My test machine didn't work. I couldn't have a machine to do this te=
st.
But I find one ChromeBook with ALC236 today.

> Otherwise I'll revert the commit as a temporary solution at first.
> You can re-apply the change (with the proper workaround for this
> problem) later, too.
>=20
>=20
> thanks,
>=20
> Takashi
>=20
> ------Please consider the environment before printing this e-mail.
