Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C559324F46
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 12:32:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D456316CD;
	Thu, 25 Feb 2021 12:32:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D456316CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614252774;
	bh=H30hADj2wtdKacj5VQZPWAIbgKn2xqtkQJ4xZLWrOds=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PiuacE6+nSmLF/qWPOHEsa66IguM5CdxLiIl2vnXLPrIJqbEx6L8QW/HmUHHxvBGX
	 1r/H2pEFtNHpBJKNCU3HC7UeEXY99usNTgWD+HTDdq+JugITzcI79eLCwje88X/w9N
	 sWrPlnx48c8NFZXCFH4VEITuGEVffOjfdq5t72xI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A626F804FF;
	Thu, 25 Feb 2021 12:26:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB9A0F8016A; Thu, 25 Feb 2021 12:10:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D517DF80159
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 12:10:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D517DF80159
Received: from mail-ot1-f72.google.com ([209.85.210.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <chris.chiu@canonical.com>) id 1lFEXY-00070s-SK
 for alsa-devel@alsa-project.org; Thu, 25 Feb 2021 11:10:41 +0000
Received: by mail-ot1-f72.google.com with SMTP id 94so2770726oti.21
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 03:10:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=adqpBJBQoN/ekIxgRIeg6Tz/2+czjMQCDVft8+bODmQ=;
 b=cfAUKJ2mXLgv5tUcOXV3SQGfsZ1dJ5T75jNJ0uhlSQJtI3ayL1Z6nK4gVV9sHugJec
 ksDwaHBczW3gnm/Ycq2DzjV04/ebHsYkPMILeEFeM+KSf/qyLuNT1lpGpbXIRXxpaPqe
 fiJeM+ICPvHlAk/J+KSOICOrWbLE2wwrpPF0XsTHOyXsVy/NhHdsGw7TQhpKBvAZ0yU8
 ANoBy6xkuiqcVtT9KjEl9s2saFr23GBWTkO6u75k1vtko/Ffe2Oxnfb4JBf7zXcQO5q/
 vf432sdOp0k928iNsDK68B3kDi0pXHpje8V8G/QoCDqc7x0IgQ4nXJeE2KCyqAraFCbo
 U/HA==
X-Gm-Message-State: AOAM530Bk9rcxX7nWnjIbACidoEN4ujBLKMYSfoPMLXlqHrVOJhI4NEp
 AEqx3Q92aELF/6Dk22rY3sAUFuS8YsyW541APfHyl1KEtq+5OB2T+QnZQA/Q8JfBvLAkjVaPzeQ
 w7yW/FTM2PxhlIThIZ/QiUhukamiOViy2nd182RZ6CH5nplbhPDcg8nQh
X-Received: by 2002:a9d:63ce:: with SMTP id e14mr1698604otl.347.1614251439912; 
 Thu, 25 Feb 2021 03:10:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGdFb1JSvgHY0tRt2eEp/H6FrYE5YlpGCp9qxdPjsEHxqsp7WFFJxehys+K7m3nuV3PXVEAeRw17F3i9ZYkSE=
X-Received: by 2002:a9d:63ce:: with SMTP id e14mr1698582otl.347.1614251439544; 
 Thu, 25 Feb 2021 03:10:39 -0800 (PST)
MIME-Version: 1.0
References: <CABTNMG0O_z1tOqb=dR44zgasSL5m73ABpu+bj2WKK0+QWY-EEw@mail.gmail.com>
 <s5hmtvsqypu.wl-tiwai@suse.de>
In-Reply-To: <s5hmtvsqypu.wl-tiwai@suse.de>
From: Chris Chiu <chris.chiu@canonical.com>
Date: Thu, 25 Feb 2021 19:10:28 +0800
Message-ID: <CABTNMG2f-28bHuByU61iEBqvmYaREYwaQ=aVZkCLj7OW=Sjgaw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Enable MICs of Acer SWIFT with ALC256
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 25 Feb 2021 12:25:30 +0100
Cc: alsa-devel@alsa-project.org, kailang@realtek.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, jhp@endlessos.org,
 hui.wang@canonical.com, kai.heng.feng@canonical.com
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

On Thu, Feb 25, 2021 at 5:32 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 25 Feb 2021 10:21:07 +0100,
> Chris Chiu wrote:
> >
> > The Acer SWIFT Swift SF314-54/55 with ALC256 cannot detect the headset
> > microphone and suffers the noise problem in audio capture.
> >
> > This patch enables the headset jack sense and fixes the noise problem with
> > aamix fixup.
> >
> > Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
>
> The patch seems broken due to the line break and cannot be applied
> cleanly.  Could you resubmit?
>
Talked to Jian-Hong who was working on SF314-55, the aamix disable
does not really make difference. And we don't have to quirk  0x1a since
the internal mic connects to intel SST audio. I'll make a V2 patch and
resubmit. Thanks.

>
> thanks,
>
> Takashi
>
>
> > ---
> >  sound/pci/hda/patch_realtek.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> > index 290645516313..57e4dbcd76a9 100644
> > --- a/sound/pci/hda/patch_realtek.c
> > +++ b/sound/pci/hda/patch_realtek.c
> > @@ -6372,6 +6372,8 @@ enum {
> >         ALC236_FIXUP_DELL_AIO_HEADSET_MIC,
> >         ALC282_FIXUP_ACER_DISABLE_LINEOUT,
> >         ALC255_FIXUP_ACER_LIMIT_INT_MIC_BOOST,
> > +       ALC256_FIXUP_ACER_SWIFT_NO_MIC_PRESENCE,
> > +       ALC256_FIXUP_ACER_SWIFT_DISABLE_AAMIX,
> >  };
> >
> >  static const struct hda_fixup alc269_fixups[] = {
> > @@ -7815,6 +7817,22 @@ static const struct hda_fixup alc269_fixups[] = {
> >                 .chained = true,
> >                 .chain_id = ALC255_FIXUP_ACER_MIC_NO_PRESENCE,
> >         },
> > +       [ALC256_FIXUP_ACER_SWIFT_NO_MIC_PRESENCE] = {
> > +               .type = HDA_FIXUP_PINS,
> > +               .v.pins = (const struct hda_pintbl[]) {
> > +                       { 0x19, 0x02a1113c }, /* use as headset mic,
> > without its own jack detect */
> > +                       { 0x1a, 0x90a1092f }, /* use as internal mic */
> > +                       { },
> > +               },
> > +               .chained = true,
> > +               .chain_id = ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
> > +       },
> > +       [ALC256_FIXUP_ACER_SWIFT_DISABLE_AAMIX] = {
> > +               .type = HDA_FIXUP_FUNC,
> > +               .v.func = alc_fixup_disable_aamix,
> > +               .chained = true,
> > +               .chain_id = ALC256_FIXUP_ACER_SWIFT_NO_MIC_PRESENCE
> > +       },
> >  };
> >
> >  static const struct snd_pci_quirk alc269_fixup_tbl[] = {
> > @@ -7841,9 +7859,11 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
> >         SND_PCI_QUIRK(0x1025, 0x1246, "Acer Predator Helios 500",
> > ALC299_FIXUP_PREDATOR_SPK),
> >         SND_PCI_QUIRK(0x1025, 0x1247, "Acer vCopperbox",
> > ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS),
> >         SND_PCI_QUIRK(0x1025, 0x1248, "Acer Veriton N4660G",
> > ALC269VC_FIXUP_ACER_MIC_NO_PRESENCE),
> > +       SND_PCI_QUIRK(0x1025, 0x1269, "Acer SWIFT SF314-54",
> > ALC256_FIXUP_ACER_SWIFT_DISABLE_AAMIX),
> >         SND_PCI_QUIRK(0x1025, 0x128f, "Acer Veriton Z6860G",
> > ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
> >         SND_PCI_QUIRK(0x1025, 0x1290, "Acer Veriton Z4860G",
> > ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
> >         SND_PCI_QUIRK(0x1025, 0x1291, "Acer Veriton Z4660G",
> > ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
> > +       SND_PCI_QUIRK(0x1025, 0x129c, "Acer SWIFT SF314-55",
> > ALC256_FIXUP_ACER_SWIFT_DISABLE_AAMIX),
> >         SND_PCI_QUIRK(0x1025, 0x1308, "Acer Aspire Z24-890",
> > ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
> >         SND_PCI_QUIRK(0x1025, 0x132a, "Acer TravelMate B114-21",
> > ALC233_FIXUP_ACER_HEADSET_MIC),
> >         SND_PCI_QUIRK(0x1025, 0x1330, "Acer TravelMate X514-51T",
> > ALC255_FIXUP_ACER_HEADSET_MIC),
> > --
> > 2.20.1
> >
