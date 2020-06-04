Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABE11EDD8B
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jun 2020 08:51:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD4271666;
	Thu,  4 Jun 2020 08:50:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD4271666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591253491;
	bh=0fSMewA6KdvU1JvM/cOUsTEhlSp9DoP4EAlQxXoZVRQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EfblaJ5iJU1A/5QSW7M1HAaruiWgkzLC2pxt0VaWagHawswxC2J3pqCvz3CAhXJ0Y
	 na01FqP9sbWwKxhxz9m60VQXIUYo6kljXXk6dV0sEKMnwRtPOELuoGGqqqKoQ2IrQ/
	 piRmMJZkemhB1A8I3X8FLMyZIq60EUoOSpiAts6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD11EF800BC;
	Thu,  4 Jun 2020 08:49:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E3B9F80254; Thu,  4 Jun 2020 08:49:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55077F8013C
 for <alsa-devel@alsa-project.org>; Thu,  4 Jun 2020 08:49:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55077F8013C
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 0546nLD71026379,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 0546nLD71026379
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 4 Jun 2020 14:49:21 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 4 Jun 2020 14:49:21 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 4 Jun 2020 14:49:20 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8]) by
 RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8%5]) with mapi id
 15.01.1779.005; Thu, 4 Jun 2020 14:49:20 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>
Subject: RE: Fixing sound on Asus UX534F / some UX533 models
Thread-Topic: Fixing sound on Asus UX534F / some UX533 models
Thread-Index: AQHWONs22CJOa0S3f0amUcGxmmQQZKjIBMWA
Date: Thu, 4 Jun 2020 06:49:20 +0000
Message-ID: <b647b169111f4c46a7c81ec80c551498@realtek.com>
References: <808c7b46-c86f-a3de-b645-c47e658e8abb@redhat.com>
 <s5hr1uxhc6k.wl-tiwai@suse.de>
In-Reply-To: <s5hr1uxhc6k.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.171]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 c <kai.heng.feng@canonical.com>, "nuno.dias@gmail.com" <nuno.dias@gmail.com>
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

Hi Hans de Goede,

Please test below.

hda-verb /dev/snd/hwC0D0 0x20 0x500 0xf
hda-verb /dev/snd/hwC0D0 0x20 0x400 0x7774
hda-verb /dev/snd/hwC0D0 0x20 0x500 0x45
hda-verb /dev/snd/hwC0D0 0x20 0x400 0x5289

I think Headset Mic will work.

BR,
Kailang

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Tuesday, June 2, 2020 8:42 PM
> To: Hans de Goede <hdegoede@redhat.com>
> Cc: Kailang <kailang@realtek.com>; c <kai.heng.feng@canonical.com>;
> alsa-devel@alsa-project.org; nuno.dias@gmail.com
> Subject: Re: Fixing sound on Asus UX534F / some UX533 models
>=20
> On Tue, 02 Jun 2020 11:51:49 +0200,
> Hans de Goede wrote:
> >
> > Hi Kai-Heng Feng, Takashi,
> >
> > I see that you are on the notification list for this bug:
> > https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1850439
> >
> > So you may have already seen this. Some owners of affected laptops
> > (which have non working speakers / headphone output atm), have done
> > some heroic debugging work and come up with a set of
> > 2 hda-verb commands which fix this.
> >
> > I'm not all that familiar with writing hda quirks, so I was hoping
> > that one of you 2 can come up with a patch to fix this at the kernel
> > level.
> >
> > This would also resolve these 2 bugs, which I believe are the same bug
> > really:
> >
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D206289
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D1834751
>=20
> Adding verbs are trivial and it can be done even without patching kernel =
but
> providing by a patch via patch module option of snd-hda-intel driver.
>=20
> But, before moving forward, I'd like to confirm about the correctness (an=
d the
> safeness) of those verbs.
>=20
> Kailang, could you check the COEF verbs mentioned in the bug entry above?
>=20
>=20
> thanks,
>=20
> Takashi
>=20
> ------Please consider the environment before printing this e-mail.
