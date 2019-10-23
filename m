Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE130E1499
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 10:46:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E80415E2;
	Wed, 23 Oct 2019 10:45:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E80415E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571820398;
	bh=mFsqVKYxMBqwjk9Tg3OwiTjIsvlicnDg5DzhCovfJU0=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z/dewEgxZo/n0VTbINM1si31beEM4e6D9+3ho2TkItfG5LtF1Q9GZv5dYycSTFLif
	 vcTcjyC7SVsi7a8H0Io/Jdpr6npisi03ueB6TYwVNuHRmECT0jFGse1Zbr/1eftu8J
	 L1ZhPy9naH8TZu/6GOtF15T+Isa5opmt05hPhkGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55314F8036F;
	Wed, 23 Oct 2019 10:44:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44E9CF80368; Wed, 23 Oct 2019 10:44:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9564F802DF
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 10:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9564F802DF
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x9N8idV2013066,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV02.realtek.com.tw[172.21.6.19])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x9N8idV2013066
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 23 Oct 2019 16:44:39 +0800
Received: from RTEXMB03.realtek.com.tw (172.21.6.96) by
 RTITCASV02.realtek.com.tw (172.21.6.19) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Wed, 23 Oct 2019 16:44:38 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 23 Oct 2019 16:44:37 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::6d88:58e2:6d4b:ff7c]) by
 RTEXMB01.realtek.com.tw ([fe80::6d88:58e2:6d4b:ff7c%13]) with mapi id
 15.01.1779.005; Wed, 23 Oct 2019 16:44:37 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>, Aaron Ma <aaron.ma@canonical.com>
Thread-Topic: [PATCH] ALSA: hda/realtek - Fix 2 front mics of codec 0x623
Thread-Index: AQHViO7vxXHEn3Xl7Ee6N1/g4hdxKqdmTdyAgAGbrzA=
Date: Wed, 23 Oct 2019 08:44:37 +0000
Message-ID: <848ebd7fd86e4c05936e70f500f718e9@realtek.com>
References: <20191022153855.14368-1-aaron.ma@canonical.com>
 <s5hpniodaq4.wl-tiwai@suse.de>
In-Reply-To: <s5hpniodaq4.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
MIME-Version: 1.0
Cc: "hui.wang@canonical.com" <hui.wang@canonical.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda/realtek - Fix 2 front mics of
	codec 0x623
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



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Wednesday, October 23, 2019 12:08 AM
> To: Aaron Ma <aaron.ma@canonical.com>
> Cc: perex@perex.cz; Kailang <kailang@realtek.com>;
> hui.wang@canonical.com; alsa-devel@alsa-project.org;
> linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] ALSA: hda/realtek - Fix 2 front mics of codec 0x623
> 
> On Tue, 22 Oct 2019 17:38:55 +0200,
> Aaron Ma wrote:
> >
> > These 2 ThinkCentres installed a new realtek codec ID 0x623, it has 2
> > front mics with the same location on pin 0x18 and 0x19.
> >
> > Apply fixup ALC283_FIXUP_HEADSET_MIC to change 1 front mic location to
> > right, then pulseaudio can handle them.
> > One "Front Mic" and one "Mic" will be shown, and audio output works
> > fine.
> >
> > Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> 
> I'd like to have Kailang's review about the new codec before applying.
> 
> Kailang, could you take a look?
OK.
I will post you the patch for ALC623 codec tomorrow.
Thanks.

> 
> 
> thanks,
> 
> Takashi
> 
> > ---
> >  sound/pci/hda/patch_realtek.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/sound/pci/hda/patch_realtek.c
> > b/sound/pci/hda/patch_realtek.c index b000b36ac3c6..c34d8b435f58
> > 100644
> > --- a/sound/pci/hda/patch_realtek.c
> > +++ b/sound/pci/hda/patch_realtek.c
> > @@ -7186,6 +7186,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[]
> = {
> >  	SND_PCI_QUIRK(0x17aa, 0x312f, "ThinkCentre Station",
> ALC294_FIXUP_LENOVO_MIC_LOCATION),
> >  	SND_PCI_QUIRK(0x17aa, 0x313c, "ThinkCentre Station",
> ALC294_FIXUP_LENOVO_MIC_LOCATION),
> >  	SND_PCI_QUIRK(0x17aa, 0x3151, "ThinkCentre Station",
> > ALC283_FIXUP_HEADSET_MIC),
> > +	SND_PCI_QUIRK(0x17aa, 0x3178, "ThinkCentre Station",
> ALC283_FIXUP_HEADSET_MIC),
> > +	SND_PCI_QUIRK(0x17aa, 0x3176, "ThinkCentre Station",
> > +ALC283_FIXUP_HEADSET_MIC),
> >  	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80",
> ALC269_FIXUP_DMIC_THINKPAD_ACPI),
> >  	SND_PCI_QUIRK(0x17aa, 0x3977, "IdeaPad S210",
> ALC283_FIXUP_INT_MIC),
> >  	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo B50-70",
> > ALC269_FIXUP_DMIC_THINKPAD_ACPI), @@ -9187,6 +9189,7 @@ static
> const struct hda_device_id snd_hda_id_realtek[] = {
> >  	HDA_CODEC_ENTRY(0x10ec0298, "ALC298", patch_alc269),
> >  	HDA_CODEC_ENTRY(0x10ec0299, "ALC299", patch_alc269),
> >  	HDA_CODEC_ENTRY(0x10ec0300, "ALC300", patch_alc269),
> > +	HDA_CODEC_ENTRY(0x10ec0623, "ALC623", patch_alc269),
> >  	HDA_CODEC_REV_ENTRY(0x10ec0861, 0x100340, "ALC660",
> patch_alc861),
> >  	HDA_CODEC_ENTRY(0x10ec0660, "ALC660-VD", patch_alc861vd),
> >  	HDA_CODEC_ENTRY(0x10ec0861, "ALC861", patch_alc861),
> > --
> > 2.17.1
> >
> 
> ------Please consider the environment before printing this e-mail.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
