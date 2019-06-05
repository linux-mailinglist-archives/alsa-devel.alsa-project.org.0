Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A7A367B3
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 01:11:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8239E950;
	Thu,  6 Jun 2019 01:10:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8239E950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559776290;
	bh=Ryl6wBC+gFEpUObWn/m8IUVer6OvRCC01HFRe+06EmI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jm99VtFvLXEX0MAk/vDsDZ/hDotohYLygYbuCCbzvY1JmFLprZ1XKkwQObCI5y+BA
	 lyvHstUK+m5dtlsdqBBva1UNQWJCOSi7m/J2FzcMBUtvs851zD14FmYng5PE4FDhTI
	 ENmUjA3TeWhGR0cnBL4Sg99DTPy933k/Froo0saU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 075E1F896DD;
	Thu,  6 Jun 2019 01:09:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 795ECF896DD; Thu,  6 Jun 2019 01:09:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,
 T_DKIMWL_WL_MED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 005A1F8072A
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 01:09:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 005A1F8072A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="duSQ1cQk"
Received: by mail-ed1-x543.google.com with SMTP id f20so318547edt.12
 for <alsa-devel@alsa-project.org>; Wed, 05 Jun 2019 16:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D6Mx78yMtykv03eQKD/IYBoJNslQF4P/LwqmHAh1Lo4=;
 b=duSQ1cQkuFKG8VjGEjG4fMu2hnQsRKZ9YhXxc3S2Ew7MGMLbpOMxOkcH90V+n4T6u9
 p6qDLfvaxdm5tWLYG5zgp9raT3k6L5AxIzpXnMb5R5jfsbfjDmaXiF1xR21Nmlms9cdJ
 PD70/jRAiKHWNc9jh0SC5Lxffcxh2If0QU6K4xtoXRRT/Sf6TuuzNHKclcFLGMm6CLgO
 pw2XseKXCDPQUw08MAo7N+NkPGgObRdEFo5hz7OQyYKjXnBW3j8UtZXFcAd4F42y/Sax
 wk9KdMJ6CNs++0w9pOwZS68CC9CzCpR2MLXSzWuUcPZIOAMSga0AgL0DWw+msA5YkNlH
 tKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D6Mx78yMtykv03eQKD/IYBoJNslQF4P/LwqmHAh1Lo4=;
 b=b5KTLDhnDcnQ7qRal6wcfa6+/9/DU+2Mm5pR94xQr9ep0b/8GUM7YqX2VREkZwSw+b
 CuQQSckEq043e7ebFu7w7nf3wT4JPzrbFSpXbX8OkjvF0p1teeDn1YewRiNVRQ+Yg/zl
 700S4lVsnY7wGRloAJMvLCRcDRArA/hQSc3BuoauPVJsHh+sfrN2xnDnD9avZgSGhPAJ
 GIN1Xi/dwXvplVWzrRtjpbKwystW3BzqtlQGPoTe75fXStLNTNLFg+Lm9JhKJxmLmaee
 40K3fTHQIhRAEmfCHkkGRc4g4wKmhw/T5jvk+ERS2EbDwBOVz0DdlYepcTWG95aJXipd
 O2TQ==
X-Gm-Message-State: APjAAAVJME+PONT8WjhFxHNXjlbCGoH3VOQbyl00CrYLBUnqqOi16zQp
 8/2k0hYCB3K7M+ihiK2yYhIQbBFDVPWWPw/uyICx6Q==
X-Google-Smtp-Source: APXvYqxGoyPA2EeAPtBwGw1qGilkiP0J+TpzZR1AbYUpDc8W/GWZWVtOxjqCfSKXcTlYNy5McBOnZF09bU/BBCn9KLQ=
X-Received: by 2002:aa7:d4cc:: with SMTP id t12mr13942343edr.257.1559776179425; 
 Wed, 05 Jun 2019 16:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190604104909.112984-1-yuhsuan@chromium.org>
 <5de28b91-2d87-f013-3438-8708160db63d@linux.intel.com>
In-Reply-To: <5de28b91-2d87-f013-3438-8708160db63d@linux.intel.com>
From: Yu-hsuan Hsu <yuhsuan@google.com>
Date: Thu, 6 Jun 2019 07:09:28 +0800
Message-ID: <CAEy1m_DNbqsMTODHm+o-+-1J-+tbfXJgnNJ_=jBkkx6YWQUdGg@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 dgreid@chromium.org, Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 cychiang@chromium.org
Subject: Re: [alsa-devel] [PATCH v4] ASoC: max98090: remove 24-bit format
 support if RJ is 0
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

Thanks!
How about adding a new condition to check whether tdm_slots is 0?
If true, we can remove 24 bit format. Is it acceptable?

On Tue, Jun 4, 2019 at 10:48 PM Pierre-Louis Bossart <
pierre-louis.bossart@linux.intel.com> wrote:

> On 6/4/19 5:49 AM, Yu-Hsuan Hsu wrote:
> > The supported formats are S16_LE and S24_LE now. However, by datasheet
> > of max98090, S24_LE is only supported when it is in the right justified
> > mode. We should remove 24-bit format if it is not in that mode to avoid
> > triggering error.
> >
> > Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> > ---
> >   Remove Change-Id.
> >
> >   sound/soc/codecs/max98090.c | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> >
> > diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
> > index 7619ea31ab50..ada8c25e643d 100644
> > --- a/sound/soc/codecs/max98090.c
> > +++ b/sound/soc/codecs/max98090.c
> > @@ -1909,6 +1909,21 @@ static int max98090_configure_dmic(struct
> max98090_priv *max98090,
> >       return 0;
> >   }
> >
> > +static int max98090_dai_startup(struct snd_pcm_substream *substream,
> > +                             struct snd_soc_dai *dai)
> > +{
> > +     struct snd_soc_component *component = dai->component;
> > +     struct max98090_priv *max98090 =
> snd_soc_component_get_drvdata(component);
> > +     unsigned int fmt = max98090->dai_fmt;
> > +
> > +     /* Remove 24-bit format support if it is not in right justified
> mode. */
> > +     if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_RIGHT_J) {
> > +             substream->runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
> > +             snd_pcm_hw_constraint_msbits(substream->runtime, 0, 16,
> 16);
> > +     }
> > +     return 0;
> > +}
>
> The data sheet is ambiguous, it states that 24-bit data is supported in
> RJ mode when TDM is 0. It doesn't say TDM can only support 16 bits.
>
> That said, it's not clear to me if TDM is supported or not in this
> driver, there are multiple references to tdm_slots but DSP_A and DSP_B
> are not supported.
>
> > +
> >   static int max98090_dai_hw_params(struct snd_pcm_substream *substream,
> >                                  struct snd_pcm_hw_params *params,
> >                                  struct snd_soc_dai *dai)
> > @@ -2316,6 +2331,7 @@ EXPORT_SYMBOL_GPL(max98090_mic_detect);
> >   #define MAX98090_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |
> SNDRV_PCM_FMTBIT_S24_LE)
> >
> >   static const struct snd_soc_dai_ops max98090_dai_ops = {
> > +     .startup = max98090_dai_startup,
> >       .set_sysclk = max98090_dai_set_sysclk,
> >       .set_fmt = max98090_dai_set_fmt,
> >       .set_tdm_slot = max98090_set_tdm_slot,
> >
>
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
