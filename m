Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D440615717C
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 10:13:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 453581677;
	Mon, 10 Feb 2020 10:12:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 453581677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581325994;
	bh=i2QPBj2hcvVLcK+ZjIiY5AHt5IetP+S0ufs8f0tU920=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NjhKZz892KVIK79831wBeZUiiHzQndW/bhTElY9XHxCKpNGlp0hzTz3Bja/sA1ksH
	 E9f4c05bm1S4Ply1nDh6LjefLuSOaYkcQRhz81ZKKEGiyCbc1UqgqD+ROIPFI9klSj
	 r6yZz6y0pgOTynnVWX6feEHv2KAvoV/MYwllsoEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EED4FF800E7;
	Mon, 10 Feb 2020 10:11:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3BA2F80157; Mon, 10 Feb 2020 10:11:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF8E6F800E7
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 10:11:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF8E6F800E7
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 01A9BHSb024966,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTEXMB06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 01A9BHSb024966
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 17:11:17 +0800
Received: from RTEXMB04.realtek.com.tw (172.21.6.97) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 10 Feb 2020 17:11:17 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 10 Feb 2020 17:11:16 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f]) by
 RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f%6]) with mapi id
 15.01.1779.005; Mon, 10 Feb 2020 17:11:16 +0800
From: Kailang <kailang@realtek.com>
To: Benjamin Poirier <benjamin.poirier@gmail.com>, Jaroslav Kysela
 <perex@perex.cz>
Thread-Topic: [alsa-devel] [PATCH] ALSA: hda - fixup for the bass speaker on
 Lenovo Carbon X1 7th gen
Thread-Index: AQHV370yIh/JaOiLcEOSymjTS4lzdKgTN/gAgADofGA=
Date: Mon, 10 Feb 2020 09:11:16 +0000
Message-ID: <b31f7280948d4cff91ab5dfcd1e14024@realtek.com>
References: <20191129144027.14765-1-perex@perex.cz> <20200210025249.GA2700@f3>
 <20200210030416.GA3302@f3>
In-Reply-To: <20200210030416.GA3302@f3>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.169]
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda - fixup for the bass speaker on
	Lenovo Carbon X1 7th gen
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

This platform speaker 2 bind DAC 0x2 was default.
Use ALC295_FIXUP_DISABLE_DAC3 model will place to DAC 0x3.
DAC 0x3 was use as Headphone.

If you want to use as your patch, you could use it at your site.
Thanks.

BR,
Kailang

> -----Original Message-----
> From: Benjamin Poirier <benjamin.poirier@gmail.com>
> Sent: Monday, February 10, 2020 11:04 AM
> To: Jaroslav Kysela <perex@perex.cz>
> Cc: ALSA development <alsa-devel@alsa-project.org>; Takashi Iwai
> <tiwai@suse.de>; Kailang <kailang@realtek.com>
> Subject: Re: [alsa-devel] [PATCH] ALSA: hda - fixup for the bass speaker on
> Lenovo Carbon X1 7th gen
> 
> On 2020/02/10 11:52 +0900, Benjamin Poirier wrote:
> > On 2019/11/29 15:40 +0100, Jaroslav Kysela wrote:
> > > The auto-parser assigns the bass speaker to DAC3 (NID 0x06) which is
> > > without the volume control. I do not see a reason to use DAC2,
> > > because the shared output to all speakers produces the sufficient
> > > and well balanced sound. The stereo support is enough for this
> > > purpose (laptop).
> > >
> > > Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> > > ---
> > >  sound/pci/hda/patch_realtek.c | 17 +++++++++++++++++
> > >  1 file changed, 17 insertions(+)
> >
> > This patch is now commit d2cd795c4ece ("ALSA: hda - fixup for the bass
> > speaker on Lenovo Carbon X1 7th gen"). There was then followup commit
> > 86353aa70ed0 ("ALSA: hda/realtek - Add quirk for the bass speaker on
> > Lenovo Yoga X1 7th gen").
> 
> Sorry, commit id 86353aa70ed0 is the backport on stable/linux-5.4.y branch,
> mainline id is:
> 54a6a7dc107d ("ALSA: hda/realtek - Add quirk for the bass speaker on Lenovo
> Yoga X1 7th gen")
> 
> >
> > As a result of those, the maximum sound output level on my laptop
> > reduced to ~60% of what it used to be.
> >
> > Moreover, the quirk name is inaccurate. I have a "ThinkPad X1 Carbon
> > 7th" (as confirmed by dmidecode) and its audio device id is:
> >         Subsystem: Lenovo Cannon Point-LP High Definition Audio
> > Controller [17aa:2292] but the patches list:
> > 	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Yoga 7th",
> ALC285_FIXUP_SPEAKER2_TO_DAC1),
> > 	SND_PCI_QUIRK(0x17aa, 0x2293, "Thinkpad X1 Carbon 7th",
> > ALC295_FIXUP_DISABLE_DAC3), (notice the mixup of id 0x2292).
> >
> > Applying the following diff brings the volume back to previous levels
> > and brings functional volume control:
> >
> > diff --git a/sound/pci/hda/patch_realtek.c
> > b/sound/pci/hda/patch_realtek.c index 68832f52c1ad..ed41e3fb5566
> > 100644
> > --- a/sound/pci/hda/patch_realtek.c
> > +++ b/sound/pci/hda/patch_realtek.c
> > @@ -7260,7 +7260,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[]
> = {
> >  	SND_PCI_QUIRK(0x17aa, 0x224c, "Thinkpad",
> ALC298_FIXUP_TPT470_DOCK),
> >  	SND_PCI_QUIRK(0x17aa, 0x224d, "Thinkpad",
> ALC298_FIXUP_TPT470_DOCK),
> >  	SND_PCI_QUIRK(0x17aa, 0x225d, "Thinkpad T480",
> ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
> > -	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Yoga 7th",
> ALC285_FIXUP_SPEAKER2_TO_DAC1),
> > +	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Yoga 7th",
> > +ALC295_FIXUP_DISABLE_DAC3),
> >  	SND_PCI_QUIRK(0x17aa, 0x2293, "Thinkpad X1 Carbon 7th",
> ALC285_FIXUP_SPEAKER2_TO_DAC1),
> >  	SND_PCI_QUIRK(0x17aa, 0x30bb, "ThinkCentre AIO",
> ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),
> >  	SND_PCI_QUIRK(0x17aa, 0x30e2, "ThinkCentre AIO",
> > ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),
> >
> > I can send a patch to fix the problems for my laptop but then I don't
> > know what's up for other devices that built on
> > ALC285_FIXUP_SPEAKER2_TO_DAC1.
> 
> ------Please consider the environment before printing this e-mail.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
