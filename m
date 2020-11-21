Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FD22BC244
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Nov 2020 22:28:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D13D41674;
	Sat, 21 Nov 2020 22:27:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D13D41674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605994099;
	bh=zjnGjqjZ5zQGyNaa7zUJ+XXAE/rQI7FO0/8VMyMgEOQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iVtU28qDk15Aq3J8dNYjyEY2atThA/dG4iZRj1w0FhnWoNyPC4woBakF486Mf6e/b
	 axgvU2tyIbgB0s+9n0uNHx34h88MiwoXp+B2pq/hlu2FIGxKDCfMuUMWzWQhNmWl0D
	 s31xl/wAiR0BL9kFgzRa18RiFEBz7F+qSMfTAdgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0163F80157;
	Sat, 21 Nov 2020 22:26:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29A63F801ED; Sat, 21 Nov 2020 22:26:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27FB6F80166
 for <alsa-devel@alsa-project.org>; Sat, 21 Nov 2020 22:26:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27FB6F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hKHYMMXR"
Received: by mail-ua1-x943.google.com with SMTP id p12so4390228uam.1
 for <alsa-devel@alsa-project.org>; Sat, 21 Nov 2020 13:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iKTln7rlFJoPsZ1BZUc/BFLaOwTyY4RxOgj9f313h14=;
 b=hKHYMMXRyVizTE7JLkVaWnsummdKKfYcJ6iQuekKYSbgyjjV/0VXUvbDsus+3yevCs
 Y5v+rksmd1HlAKhadFKyZKeTdRt8NxvvPi/QLnONInGLvirVkCpStpqispaS6TxD2ccB
 XLI/Nptgea7sEq9zWab7nrh9mJAlj7XSb3vpLp3EXjlOQnUJqArFtFIXnCcJoN5ovTEJ
 7un+l/hSf/oEO7bhD1xakXVZlpeX7vE4lkCiG41TE5rN5nb7bIMgHWS0sklzfRRLYSHw
 u7tyChWgJB0YXilDaetLkywtb0qagyk0HwyYhixSyOdzeiuoWUXKEsJMbMskJHoGnjc5
 1pXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iKTln7rlFJoPsZ1BZUc/BFLaOwTyY4RxOgj9f313h14=;
 b=Vc7YN0/jXv40mxZIsvysFLqHymEvTrUGBq5BYQaSGCNNAEkVEvdGKVFG0edzIRtfZM
 /0YaLY5pJvrPlfsztMtcr9aV4ona8PiQ9PeTcAhELMsJW1fOmOtCxd/apVdBNiHaudTM
 hNy6XUn9g/PWAOWzDujMaZ6yJPkYx945RjN+jVxrMOFGLUi1l6P0dk/NpFoRtp+YMSNs
 8mbsdfXUDGaNYfosBuhiEtQmD9LWsVDffS/r+ZaIYfKtd2OOzXBo8rHKXtAiebWhrGqf
 z/EzzI7KFfR1ey5HuF+fOCmjo3WEl4BGTk08S+nlWfnsYSzSbtRfgzmm1LUL8urQiJK8
 2f7g==
X-Gm-Message-State: AOAM530Nb6OY4LlM/E5CO7xFs/OLZM2sxdQzX/E9ZGe0vwLAHqzT35va
 /HAjiuhJ5JIwu08IPQG40wN25Jl1C6kCtntJpKU=
X-Google-Smtp-Source: ABdhPJywMZQkKNzEM+AGfEUCaiTipfH+rFOgh4VTyDw8Yt/Nw8kp/P8W1GaYYiRXibX2Pfjtt6aUhoa+PQ3xXL8o6+E=
X-Received: by 2002:ab0:71d8:: with SMTP id n24mr5692822uao.135.1605993995716; 
 Sat, 21 Nov 2020 13:26:35 -0800 (PST)
MIME-Version: 1.0
References: <20201110061742.78033-1-dmanlfc@gmail.com>
 <s5heekpjqrb.wl-tiwai@suse.de>
In-Reply-To: <s5heekpjqrb.wl-tiwai@suse.de>
From: Daniel Martin <dmanlfc@gmail.com>
Date: Sun, 22 Nov 2020 07:26:24 +1000
Message-ID: <CAOyTmd07=knQejKtrbaxOmF+oR8cCib0_R1KmPgMp=+3LO44DQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio : Add support for the Pioneer DJ DDJ-RR
 controller.
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Alexander Tsoy <alexander@tsoy.me>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 =?UTF-8?B?RnJhbnRpxaFlayBLdcSNZXJh?= <franta-linux@frantovo.cz>,
 Gregor Pintar <grpintar@gmail.com>, Dmitry Panchenko <dmitry@d-systems.ee>
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

It will be a while before I can amend as my Linux PC with the kernel git
gave up the ghost this weekend.
Currently I don't have a PC to access my Arch Linux drive for continuity.

SInce this is just an audio quirk, can you make the necessary
amendments for me in this patch?

Description: Allows the Pioneer DJ DDJ-RR to be seen as a USB audio device
under Linux and therefore usable in such applications as Mixxx.
- Tested Master Audio out, headphones (both output jacks) and microphone
input. All work perfectly.

SIgn-Off-By: Daniel Martin <dmanlfc@gmail.com>

Or alternatively, how can I do this via a web browser in a patch submission
portal?

Thanks in advance,

Dan

On Fri, 20 Nov 2020 at 01:44, Takashi Iwai <tiwai@suse.de> wrote:

> On Tue, 10 Nov 2020 07:17:40 +0100,
> Daniel wrote:
> >
> > ---
> >  sound/usb/quirks-table.h | 56 +++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 55 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
> > index 3c1697f6b60c..a39233cb4d72 100644
> > --- a/sound/usb/quirks-table.h
> > +++ b/sound/usb/quirks-table.h
> > @@ -3530,7 +3530,61 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge",
> "HVR-950Q"),
> >               }
> >       }
> >  },
> > -
> > +{
> > +     /*
> > +      * PIONEER DJ DDJ-RR
> > +     * PCM is 6 channels out & 4 channels in @ 44.1 fixed
> > +      */
> > +     USB_DEVICE_VENDOR_SPEC(0x2b73, 0x000d),
> > +     .driver_info = (unsigned long) &(const struct snd_usb_audio_quirk)
> {
> > +             .ifnum = QUIRK_ANY_INTERFACE,
> > +             .type = QUIRK_COMPOSITE,
> > +             .data = (const struct snd_usb_audio_quirk[]) {
> > +                     {
> > +                             .ifnum = 0,
> > +                             .type = QUIRK_AUDIO_FIXED_ENDPOINT,
> > +                             .data = &(const struct audioformat) {
> > +                                     .formats =
> SNDRV_PCM_FMTBIT_S24_3LE,
> > +                                     .channels = 6, //Master,
> Headphones & Booth
> > +                                     .iface = 0,
> > +                                     .altsetting = 1,
> > +                                     .altset_idx = 1,
> > +                                     .endpoint = 0x01,
> > +                                     .ep_attr = USB_ENDPOINT_XFER_ISOC|
> > +                                                USB_ENDPOINT_SYNC_ASYNC,
> > +                                     .rates = SNDRV_PCM_RATE_44100,
> > +                                     .rate_min = 44100,
> > +                                     .rate_max = 44100,
> > +                                     .nr_rates = 1,
> > +                                     .rate_table = (unsigned int[]) {
> 44100 }
> > +                             }
> > +                     },
> > +                     {
> > +                             .ifnum = 0,
> > +                             .type = QUIRK_AUDIO_FIXED_ENDPOINT,
> > +                             .data = &(const struct audioformat) {
> > +                                     .formats =
> SNDRV_PCM_FMTBIT_S24_3LE,
> > +                                     .channels = 4, //2x RCA inputs
> (CH1 & CH2)
> > +                                     .iface = 0,
> > +                                     .altsetting = 1,
> > +                                     .altset_idx = 1,
> > +                                     .endpoint = 0x82,
> > +                                     .ep_attr = USB_ENDPOINT_XFER_ISOC|
> > +                                              USB_ENDPOINT_SYNC_ASYNC|
> > +
> USB_ENDPOINT_USAGE_IMPLICIT_FB,
> > +                                     .rates = SNDRV_PCM_RATE_44100,
> > +                                     .rate_min = 44100,
> > +                                     .rate_max = 44100,
> > +                                     .nr_rates = 1,
> > +                                     .rate_table = (unsigned int[]) {
> 44100 }
> > +                             }
> > +                     },
> > +                     {
> > +                             .ifnum = -1
> > +                     }
> > +             }
> > +     }
> > +},
>
> The code change itself looks reasonable, but the patch misses the
> description completely.  Could you give the patch description?
> Also, a signed-off-by line is mandatory from the legal reason, so
> please add this together and resubmit the patch.
>
>
> Thanks!
>
> Takashi
>


-- 

Kind Regards,

Daniel
+61 (0)409611884
