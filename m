Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 118B412BBA9
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 23:44:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94A9E176B;
	Fri, 27 Dec 2019 23:44:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94A9E176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577486694;
	bh=vYmLVZP8ptrchSMZOYlcL5FBpQXr+TqIuLZmak89FKc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f0mNQrk41bp+dPv6CO101kH4vEJR/i+htyV3sGYu/EusFe2lDHimzD4DmM8rH3zBl
	 Vl97aVykDDxsc/AmebPFOV5g+KHhQ04ysYNyg+lzE3VIrnLPuqFO2LFEodHdj79AeS
	 N6cBv9JAsCSe6dcODa93JsIrtOxjBbTg1VzCL9jQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07B65F8026A;
	Fri, 27 Dec 2019 23:42:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE943F80132; Fri, 27 Dec 2019 09:39:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9205F800AE
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 09:39:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9205F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="JFgdHhWM"
Received: by mail-ot1-x344.google.com with SMTP id 19so23060517otz.3
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 00:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0AQj3lh0dp90BrCkbzH3dJXsxK6ILYTeCrSMLfhWdoc=;
 b=JFgdHhWMInr1A86TzQxVXO0hcqH0Epc7vYOitkFXmduOcWsmxKH97ExTRcH7OtKB2f
 bAmUKljpZfxt3csiK7WOrbFd/ekIJt6AbYvOjNkF+eISK2EcklfdzmeNxOzy8a7ALgMg
 M8Ye1lGHYsUtvopGLCTb3mPiULjmPawTAHVf+60rqiIbETD+n6iu589BlxPNnUVV8SwW
 7Wqs7gNcMlICVygz4KJJUjlYmFaQSVyO+Gz5G4zGi1H35Bre532aKFlK+ZfBkP7hUDLo
 yV7H/V0dDUoQeLaVHaCbiHG11G529rA9H0TssuabE/NoaaCErcKxMsZLLkjA340i12SC
 ZV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0AQj3lh0dp90BrCkbzH3dJXsxK6ILYTeCrSMLfhWdoc=;
 b=ES3Cfe48Rh2PUO2w/0LZTNgK/GeUlX7t4gpO1l33TvZqXNdulb0bHbVbiiuBCIWqML
 Gqu+GVGPkLf6H/rZyzbL4eVV+a4eXSaFOBwoE5fxHr5T8ioiSmK7ooS2DV3fZiE9h/LR
 QoVBH3uk5LEeIqYsuQ6ij6lmY8vjvkGsiFJdufN1ze2oopmg4wkAS7wPkDUT+Iuzvbog
 MGqk1syCNYTBwU/01zN/rpNGxKbMg4ln8lBq2/fUrYb1wG+kEzw4lgeYnrXOz3+0I1Ib
 VhlyhgEM3i6PT9pMVUFYSvmFi4AMpHzc3PrGEFOEAwRHWboZ+FaeK20h4Tq6lwwXR13J
 kXDQ==
X-Gm-Message-State: APjAAAVPEhTpsqtNBwOziw071Gz8LVALU0fW6Gp6ikraqxWkuD2iaoZW
 MgtZzBuSM22v1R622fGY98TA+8xivdkA5olkD5AP0Q==
X-Google-Smtp-Source: APXvYqxlRdUuJjYNsHkCSM53qetM74vPAbxfcH4xesYzwlz3Ut2mX5jiqwZb0Y3ZWoNoUvivMiwQpt9Jj3xDdJ88558=
X-Received: by 2002:a05:6830:1248:: with SMTP id
 s8mr55046530otp.202.1577435957406; 
 Fri, 27 Dec 2019 00:39:17 -0800 (PST)
MIME-Version: 1.0
References: <20191227065724.2581-1-chris.chiu@pacidal.com>
 <9a6937eb53264ef99409ac234fffe8af@realtek.com>
 <s5hfth65ggi.wl-tiwai@suse.de>
In-Reply-To: <s5hfth65ggi.wl-tiwai@suse.de>
From: Chris Chiu <chiu@endlessm.com>
Date: Fri, 27 Dec 2019 16:41:04 +0800
Message-ID: <CAB4CAwfmrcE6MdKLF2UsxKKuxd0T961esNYz70X9VBKxJUaksQ@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Mailman-Approved-At: Fri, 27 Dec 2019 23:42:48 +0100
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kailang <kailang@realtek.com>,
 "tomas.espeleta@gmail.com" <tomas.espeleta@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
 Jian-Hong Pan <jian-hong@endlessm.com>,
 "linux@endlessm.com" <linux@endlessm.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda/realtek - Enable the subwoofer
	of ASUS UX431FLC
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

On Fri, Dec 27, 2019 at 4:18 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 27 Dec 2019 08:28:32 +0100,
> Kailang wrote:
> >
> > Hi all,
> >
> > Current kernel had exist function alc285_fixup_speaker2_to_dac1 to fixed dac for 0x17.
> > Replace as below.
>
> Good catch.
>
> Chris, could you rebase on the top of the current for-linus branch,
> modify as Kailang suggested and resubmit?
>
> Also, the commit id mentioned in your patch doesn't exist.  Please
> correct to the right id.
>
>
No problem. I'll send a v2 patch later with what Kailang suggested.

Chris

> thanks,
>
> Takashi
>
> >
> > diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c index fada1ff61353..0193a8722be2 100644
> > --- a/sound/pci/hda/patch_realtek.c
> > +++ b/sound/pci/hda/patch_realtek.c
> > @@ -5950,7 +5960,8 @@ enum {
> >       ALC269VC_FIXUP_ACER_HEADSET_MIC,
> >       ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC,
> >       ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE,
> > -     ALC294_FIXUP_ASUS_INTSPK_GPIO,
> > +     ALC294_FIXUP_ASUS_DUAL_SPEAKERS,
> > +     ALC294_FIXUP_FIXED_DAC_SUBWOOFER,
> >  };
> >
> >  static const struct hda_fixup alc269_fixups[] = { @@ -7097,10 +7108,9 @@ static const struct hda_fixup alc269_fixups[] = {
> >                       { }
> >               }
> >       },
> > -     [ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC] = {
> > +     [ALC294_FIXUP_ASUS_HEADSET_MIC] = {
> >               .type = HDA_FIXUP_PINS,
> >               .v.pins = (const struct hda_pintbl[]) {
> > -                     { 0x14, 0x411111f0 }, /* disable confusing internal speaker */
> >                       { 0x19, 0x04a11150 }, /* use as headset mic, without its own jack detect */
> >                       { }
> >               },
> > @@ -7117,12 +7127,18 @@ static const struct hda_fixup alc269_fixups[] = {
> >               .chained = true,
> >               .chain_id = ALC256_FIXUP_ASUS_HEADSET_MODE
> >       },
> > -     [ALC294_FIXUP_ASUS_INTSPK_GPIO] = {
> > +     [ALC294_FIXUP_FIXED_DAC_SUBWOOFER] = {
> > +             .type = HDA_FIXUP_FUNC,
> > +             .v.func = alc285_fixup_speaker2_to_dac1,
> > +             .chained = true,
> > +             .chain_id = ALC294_FIXUP_ASUS_HEADSET_MIC
> > +     },
> > +     [ALC294_FIXUP_ASUS_DUAL_SPEAKERS] = {
> >               .type = HDA_FIXUP_FUNC,
> >               /* The GPIO must be pulled to initialize the AMP */
> >               .v.func = alc_fixup_gpio4,
> >               .chained = true,
> > -             .chain_id = ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC
> > +             .chain_id = ALC294_FIXUP_FIXED_DAC_SUBWOOFER
> >       },
> >  };
> >
> > @@ -7291,7 +7307,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
> >       SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FIXUP_ASUS_ZENBOOK),
> >       SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
> >       SND_PCI_QUIRK(0x1043, 0x16e3, "ASUS UX50", ALC269_FIXUP_STEREO_DMIC),
> > -     SND_PCI_QUIRK(0x1043, 0x17d1, "ASUS UX431FL", ALC294_FIXUP_ASUS_INTSPK_GPIO),
> > +     SND_PCI_QUIRK(0x1043, 0x17d1, "ASUS UX431FL",
> > +ALC294_FIXUP_ASUS_DUAL_SPEAKERS),
> >       SND_PCI_QUIRK(0x1043, 0x18b1, "Asus MJ401TA", ALC256_FIXUP_ASUS_HEADSET_MIC),
> >       SND_PCI_QUIRK(0x1043, 0x1a13, "Asus G73Jw", ALC269_FIXUP_ASUS_G73JW),
> >       SND_PCI_QUIRK(0x1043, 0x1a30, "ASUS X705UD", ALC256_FIXUP_ASUS_MIC),
> > --
> >
> > > -----Original Message-----
> > > From: Chris Chiu <chiu@endlessm.com>
> > > Sent: Friday, December 27, 2019 2:57 PM
> > > To: perex@perex.cz; tiwai@suse.com; Kailang <kailang@realtek.com>;
> > > hui.wang@canonical.com; tomas.espeleta@gmail.com
> > > Cc: alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org;
> > > linux@endlessm.com; Chris Chiu <chiu@endlessm.com>; Jian-Hong Pan
> > > <jian-hong@endlessm.com>
> > > Subject: [PATCH] ALSA: hda/realtek - Enable the subwoofer of ASUS UX431FLC
> > >
> > > From: Chris Chiu <chiu@endlessm.com>
> > >
> > > ASUS reported that there's an additional speaker which serves as the
> > > subwoofer and uses DAC 0x02. It does not work with the commit
> > > 73a723348a43 ("ALSA: hda/realtek - Enable internal speaker of ASUS
> > > UX431FLC") which enables the amplifier and front speakers. This commit
> > > enables the subwoofer to improve the acoustic experience.
> > >
> > > Signed-off-by: Chris Chiu <chiu@endlessm.com>
> > > Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
> > > ---
> > >  sound/pci/hda/patch_realtek.c | 28 ++++++++++++++++++++++------
> > >  1 file changed, 22 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> > > index fada1ff61353..0193a8722be2 100644
> > > --- a/sound/pci/hda/patch_realtek.c
> > > +++ b/sound/pci/hda/patch_realtek.c
> > > @@ -5576,6 +5576,16 @@ static void alc295_fixup_disable_dac3(struct
> > > hda_codec *codec,
> > >     }
> > >  }
> > >
> > > +/* Fixed DAC (0x02) on NID 0x17 to enable the mono speaker */ static
> > > +void alc294_fixup_fixed_dac_subwoofer(struct hda_codec *codec,
> > > +                                   const struct hda_fixup *fix, int action) {
> > > +   if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> > > +           hda_nid_t conn[1] = { 0x02 };
> > > +           snd_hda_override_conn_list(codec, 0x17, 1, conn);
> > > +   }
> > > +}
> > > +
> > >  /* Hook to update amp GPIO4 for automute */  static void
> > > alc280_hp_gpio4_automute_hook(struct hda_codec *codec,
> > >                                       struct hda_jack_callback *jack)
> > > @@ -5950,7 +5960,8 @@ enum {
> > >     ALC269VC_FIXUP_ACER_HEADSET_MIC,
> > >     ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC,
> > >     ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE,
> > > -   ALC294_FIXUP_ASUS_INTSPK_GPIO,
> > > +   ALC294_FIXUP_ASUS_DUAL_SPEAKERS,
> > > +   ALC294_FIXUP_FIXED_DAC_SUBWOOFER,
> > >  };
> > >
> > >  static const struct hda_fixup alc269_fixups[] = { @@ -7097,10 +7108,9 @@
> > > static const struct hda_fixup alc269_fixups[] = {
> > >                     { }
> > >             }
> > >     },
> > > -   [ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC] = {
> > > +   [ALC294_FIXUP_ASUS_HEADSET_MIC] = {
> > >             .type = HDA_FIXUP_PINS,
> > >             .v.pins = (const struct hda_pintbl[]) {
> > > -                   { 0x14, 0x411111f0 }, /* disable confusing internal speaker */
> > >                     { 0x19, 0x04a11150 }, /* use as headset mic, without its own
> > > jack detect */
> > >                     { }
> > >             },
> > > @@ -7117,12 +7127,18 @@ static const struct hda_fixup alc269_fixups[] = {
> > >             .chained = true,
> > >             .chain_id = ALC256_FIXUP_ASUS_HEADSET_MODE
> > >     },
> > > -   [ALC294_FIXUP_ASUS_INTSPK_GPIO] = {
> > > +   [ALC294_FIXUP_FIXED_DAC_SUBWOOFER] = {
> > > +           .type = HDA_FIXUP_FUNC,
> > > +           .v.func = alc294_fixup_fixed_dac_subwoofer,
> > > +           .chained = true,
> > > +           .chain_id = ALC294_FIXUP_ASUS_HEADSET_MIC
> > > +   },
> > > +   [ALC294_FIXUP_ASUS_DUAL_SPEAKERS] = {
> > >             .type = HDA_FIXUP_FUNC,
> > >             /* The GPIO must be pulled to initialize the AMP */
> > >             .v.func = alc_fixup_gpio4,
> > >             .chained = true,
> > > -           .chain_id = ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC
> > > +           .chain_id = ALC294_FIXUP_FIXED_DAC_SUBWOOFER
> > >     },
> > >  };
> > >
> > > @@ -7291,7 +7307,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[]
> > > = {
> > >     SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E",
> > > ALC269VB_FIXUP_ASUS_ZENBOOK),
> > >     SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A",
> > > ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
> > >     SND_PCI_QUIRK(0x1043, 0x16e3, "ASUS UX50",
> > > ALC269_FIXUP_STEREO_DMIC),
> > > -   SND_PCI_QUIRK(0x1043, 0x17d1, "ASUS UX431FL",
> > > ALC294_FIXUP_ASUS_INTSPK_GPIO),
> > > +   SND_PCI_QUIRK(0x1043, 0x17d1, "ASUS UX431FL",
> > > +ALC294_FIXUP_ASUS_DUAL_SPEAKERS),
> > >     SND_PCI_QUIRK(0x1043, 0x18b1, "Asus MJ401TA",
> > > ALC256_FIXUP_ASUS_HEADSET_MIC),
> > >     SND_PCI_QUIRK(0x1043, 0x1a13, "Asus G73Jw",
> > > ALC269_FIXUP_ASUS_G73JW),
> > >     SND_PCI_QUIRK(0x1043, 0x1a30, "ASUS X705UD",
> > > ALC256_FIXUP_ASUS_MIC),
> > > --
> > > 2.20.1
> >
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
