Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9664542B6
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 09:33:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74A4D1852;
	Wed, 17 Nov 2021 09:32:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74A4D1852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637137987;
	bh=hGRXV1N1Jv0eZGSrl0uJVjb0mGBTF3VLyouSg4vBHUY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=acT8vsRzCxnkT/n6WyxyM6r/e+quYxCoGK4gX7Ru7N4D3WGiIft6wpJq3ngdlg82a
	 nnGyDVkaJrnwwgn1PTI9Y7I5O9fY9681M6ypXx2eD+Fni5GkY24NSJqEpBCiT+5ByT
	 sG6c7ND9PpG3rKl8Ie1cACqVwEAKCc7ZZdgzPRqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D361FF8016C;
	Wed, 17 Nov 2021 09:31:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BFC9F8027D; Wed, 17 Nov 2021 09:31:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1EF4F80134
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 09:31:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1EF4F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TZfQCpcp"
Received: by mail-lf1-x132.google.com with SMTP id l22so5214202lfg.7
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 00:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=86FW9qPlMAogyIYV3iclWrBqvwzKh1na0aRnbqpiNEE=;
 b=TZfQCpcpblg5utmV3ctZaBaZflGxG6Z+WGUhRehYCZY+EIn8qUv9UF9Lf9rAchYo0q
 QH6OFrSiS+at6NJ+jDY23NEJhHx1qLS4q7yroEQqVM5Lmm+lnHWP4GDKVE0FvRo45bjl
 36dejDR18DJ+WEviQGSoG+VxurhuV/MpdIo2vs1pLqHGGxbP7c8bgfj2h9EKQF9XUU73
 A04hIOyuYsiSuUzQFA3avBrQCS6AZY64QwKdjAqMgbRGmsxSoCYbeDxlSHyOeAU7q+si
 gTlKm0iqurK+cHHVDBfOvrg803+xvT8B29s+JuDc4MwCRmiAFdXqKubaRrRr42ijfxja
 z7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=86FW9qPlMAogyIYV3iclWrBqvwzKh1na0aRnbqpiNEE=;
 b=tRkWQwvP94//ogKDsqexDoDQY0kurVtDq0T0PPo/P0KumqtOd+XSTExhbdskC1dwfC
 61aFHyyRa9jHCny36mG9jgTbpD77UH2h+yOhzsK1ImlMAYCAVuqr6l+OPxIs3C/1XSwm
 gnHIhdQepFvZU/HBXJJVwVUUyCPSZ2kgXWxADMS8gjIIoWoTwwKGNBiSIj8umNzR4Xrn
 i6oB+nSKjLxzzVCsGxjXucCY7TneOwSs9+TZBjR34+RUjK1q9vqbqyOxKHIlIXNcvdyM
 vTZAz6K1s9Kin8NnvOc1Pv5S1D2TKbOY26jIf2epYeRDOnMd54HzZiOMsZLYZ0hcGFrt
 8PUA==
X-Gm-Message-State: AOAM532CIWdrpmZ84bnJvhLjLUnispXUSUpfHMkz8dYgsEipZW0Jb+GX
 O7g54ggkpBbhrmoydh9wrGeUXV1gVNTUeSmNJz4=
X-Google-Smtp-Source: ABdhPJxZSXTVfFB6L+bkweNqijvRgy2mfpnijTIXOkfzCn81ujUdF9H76lGSMEsBX8EACwo9Pks6U5gIiFq85xk5huc=
X-Received: by 2002:a05:6512:1151:: with SMTP id
 m17mr13723017lfg.414.1637137897084; 
 Wed, 17 Nov 2021 00:31:37 -0800 (PST)
MIME-Version: 1.0
References: <CAAd2w=bYJ9ooP717PQxGug=vKG8Zw_B+0z-Qp0s9v-40O2W0ig@mail.gmail.com>
 <s5hlf1nnrwa.wl-tiwai@suse.de>
In-Reply-To: <s5hlf1nnrwa.wl-tiwai@suse.de>
From: sujith kumar reddy <sujithreddy6192@gmail.com>
Date: Wed, 17 Nov 2021 14:01:25 +0530
Message-ID: <CAAd2w=aWdBJA_1MPTG0s2TcM3gY0SxvQxVwpKMtCUDrJOK0Vrg@mail.gmail.com>
Subject: Re: HDMI driver format channel mismatch bug
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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

Hi Takashi,

By HBR definition macro its non-pcm right?

/* HBR should be Non-PCM, 8 channels

*/#define is_hbr_format(format) \ ((format & AC_FMT_TYPE_NON_PCM) &&
(format & AC_FMT_CHAN_MASK) == 7)

if we restrict channel_max for LPCM does it  break it for other formats in
passthrough mode?

Thanks
Sujith

On Wed, Nov 17, 2021 at 1:19 PM Takashi Iwai <tiwai@suse.de> wrote:

> On Fri, 12 Nov 2021 15:32:41 +0100,
> sujith kumar reddy wrote:
> >
> > Hi Alsa Team,
> >
> > Sound is not coming in sony tv . which has below supported formats and
> > channels.
> >
> > please find the attached  edid information and hw_params dump.
> >
> > with intel platform, same monitor populating 2 channels as max in
> hw_params
> > in dump.
> > but with AMD card, its populating as 6 channels.
> >
> >
> > When we digged the code, we found that snd_hdmi_eld_update_pcm_info   API
> > setting hinfo->channel_max as 8 and as channels max retrieved from sad
> info
> > as 6.
> >
> >
> > for LPCM , why the channel max assignment logic is not safeguared with
> > audio format check as LPCM ?
> >
> >
> > snippet code:
> >
> > /* update PCM info based on ELD */void
> > snd_hdmi_eld_update_pcm_info(struct parsed_hdmi_eld *e,
> >                             struct hda_pcm_stream *hinfo){
> >       u32 rates;
> >       u64 formats;
> >       unsigned int maxbps;
> >       unsigned int channels_max;
> >       int i;
> >
> >       /* assume basic audio support (the basic audio flag is not in
> ELD;       *
> > however, all audio capable sinks are required to support basic         *
> > audio) */
> >       rates = SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
> >               SNDRV_PCM_RATE_48000;
> >       formats = SNDRV_PCM_FMTBIT_S16_LE;
> >       maxbps = 16;
> >       channels_max = 2;
> >       for (i = 0; i < e->sad_count; i++) {
> >               struct cea_sad *a = &e->sad[i];
> >               rates |= a->rates;
> >               if (a->channels > channels_max)
> >                       channels_max = a->channels;
> >               if (a->format == AUDIO_CODING_TYPE_LPCM) {
> >                       if (a->sample_bits & AC_SUPPCM_BITS_20) {
> >                               formats |= SNDRV_PCM_FMTBIT_S32_LE;
> >                               if (maxbps < 20)
> >                                       maxbps = 20;
> >                       }
> >                       if (a->sample_bits & AC_SUPPCM_BITS_24) {
> >                               formats |= SNDRV_PCM_FMTBIT_S32_LE;
> >                               if (maxbps < 24)
> >                                       maxbps = 24;
> >                       }
> >               }
> >       }
> >
> >       /* restrict the parameters by the values the codec provides */
> >       hinfo->rates &= rates;
> >       hinfo->formats &= formats;
> >       hinfo->maxbps = min(hinfo->maxbps, maxbps);
> >       hinfo->channels_max = min(hinfo->channels_max, channels_max);
> >
> > >>>>>>>>>>the above statement channels_max is the maximum of channels
> supported of different formats.
> >
> > For example: the below attached edid is of sony tv. which supports two
> > formats(LPCM and AC3)
> >
> >             LPCM --->supports 2 channels
> >
> >             AC3 ----->Supports 6 channels you can see in the attached
> edid info.
> >
> >        As AMD supports LPCM ...>when we keep logs here we got
> > channels_max =6 .in which sound is not observed on tv .when we
> > hardcode to 2 channels
> >
> >        the sound is heard from monitor. As you see the above code
> > ..for loop is not distinguishing channels_max for different formats.
> >
> > }
>
> Hm, the number of channels advertised from SAD makes little sense for
> the hw_params that is rather for the PCM stream.  So the patch like
> below would work, at least, for your examples.
>
> The remaining question is whether it's only LPCM that we'd have to
> take care of the channels.  For HBR, we'd have to set 8 channels.
>
> Is HBR always tied with LPCM?  Or may it be with
> AUDIO_CODING_TYPE_DTS_HD that advertises the channels?
>
>
> thanks,
>
> Takashi
>
> --- a/sound/pci/hda/hda_eld.c
> +++ b/sound/pci/hda/hda_eld.c
> @@ -572,9 +572,9 @@ void snd_hdmi_eld_update_pcm_info(struct
> parsed_hdmi_eld *e,
>         for (i = 0; i < e->sad_count; i++) {
>                 struct cea_sad *a = &e->sad[i];
>                 rates |= a->rates;
> -               if (a->channels > channels_max)
> -                       channels_max = a->channels;
>                 if (a->format == AUDIO_CODING_TYPE_LPCM) {
> +                       if (a->channels > channels_max)
> +                               channels_max = a->channels;
>                         if (a->sample_bits & AC_SUPPCM_BITS_20) {
>                                 formats |= SNDRV_PCM_FMTBIT_S32_LE;
>                                 if (maxbps < 20)
>
