Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F1B1C5964
	for <lists+alsa-devel@lfdr.de>; Tue,  5 May 2020 16:25:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8016A16DC;
	Tue,  5 May 2020 16:25:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8016A16DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588688755;
	bh=bIJ1apj06ZLXXU5nmmtqF7iENw22S8OIuctSEKpn6tY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p7lDy/P89uLtLNqzIvW8G/DO5PSAbZQfuZu3xw/ami7qjdEh0Ft8Rr/R/E+aN8P65
	 mrBCoEUilvyFG6gJSBGlPZ8X/wmeJF0pxkR+nA6y5WFtaGvPI6Qfvm+cjiY2IWfYyt
	 RAbrKTJoFfjGPks0q9uDRjxqnJ/LCwcYV3Iiw13M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4BC0F8015B;
	Tue,  5 May 2020 16:24:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 558AEF8015F; Tue,  5 May 2020 16:24:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60745F800DE
 for <alsa-devel@alsa-project.org>; Tue,  5 May 2020 16:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60745F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="x1AlWCzm"
Received: by mail-wr1-x441.google.com with SMTP id x17so2996216wrt.5
 for <alsa-devel@alsa-project.org>; Tue, 05 May 2020 07:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Y70Nah3FzhZidtus6gd4+NBEFZJBCSZiFmzmK0CZes=;
 b=x1AlWCzm3i+12zcO6l4aukwQ6Aaof5MzjJECcmVMkipsGWsE3LSKZMf9m9jgofhDqk
 JEP67rHJ/3IuCTnaK93uk3OOdXP03ypzlV3f7xKJPsGyOkFJxvTT6CFAOU0AX3bfS0vV
 luvzHQ5DXTLwgApmTca8dEUYyqZFiqDGqhmQlkjjvRI97PPi4ru79qs3fCKOpSGNjzvM
 T/AWvaVizbhmtLgUNVM+9P74+/nfqBOHSjtU77MMzNdwkJcYDJ2IRgX/HOksz7ybaQ5j
 AgXz02KGCDDTyh+art+q9aNX9mTlNZ5lkOUxQWfKF4ZO6hvUjC9vUOldHWGNFS2LbZZg
 zI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Y70Nah3FzhZidtus6gd4+NBEFZJBCSZiFmzmK0CZes=;
 b=carBYDmTKQD0JTWzoLYTvOIdG74b/gB8HSEuypJPbFSI/xW8dhHHqzQe3zP39+JZq8
 xofKtBWyu+tWPYdP8eupQeIsaIIVBYWhDsK445LcGodXIUOwoGYnXTJJ4yPYLi/AwqYQ
 mvUXqV9wXSqbDAizXNYBRvFAAt1uyjInmdXrsDfRgZj09sjSKijV8eKdzfNMvDzyu0Wp
 +YTGjVopKUapQoHyWAOJdlVYb1RaEZumKbAFZryaIkWK5XlqQeqRaKC3RF1B7T1ujGMq
 r4vA4M3IjlBP+uIHsN+GEZVXaa27uE//z2DJgFkuDc2v+bc5MJUMNt8f+i7FaZXPPxw5
 zjRw==
X-Gm-Message-State: AGi0PuYm+Uq3jd5ODQnOAoPFSTqfMJXCf+QREQCK3b89tzbtMQfF6at7
 CY6r40R0QDKY3Yy1I/9EU98EON9ABk3jlEpnYAN5kg==
X-Google-Smtp-Source: APiQypJJPTp1iDbmTwDsHL2WATyBtkqzx/L9mbhVjiLMShrO4SVgQQefa0T7Yi1gDN3MOa9ZBDvgUxE2/X3IZk4O0zs=
X-Received: by 2002:adf:f1c6:: with SMTP id z6mr4004676wro.361.1588688638314; 
 Tue, 05 May 2020 07:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200501193141.30293-1-rad@semihalf.com>
 <3ad44b75-387f-da75-d7b2-3a16ed00550c@linux.intel.com>
In-Reply-To: <3ad44b75-387f-da75-d7b2-3a16ed00550c@linux.intel.com>
From: =?UTF-8?Q?Rados=C5=82aw_Biernacki?= <rad@semihalf.com>
Date: Tue, 5 May 2020 16:23:41 +0200
Message-ID: <CAOs-w0LPeKgooa_98x_Jkzus-Y5Kad7pDby0CriDGb6nTp_6sA@mail.gmail.com>
Subject: Re: [PATCH V2] ASoC: Intel: boards: Use FS as nau8825 sysclk in
 nau88125_* machine
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Lech Betlej <Lech.Betlej@intel.com>, alsa-devel@alsa-project.org,
 Todd Broch <tbroch@google.com>, Harshapriya <harshapriya.n@intel.com>,
 John Hsu <KCHSU0@nuvoton.com>, Alex Levin <levinale@google.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 "Sienkiewicz, Michal" <michal.sienkiewicz@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mac Chiang <mac.chiang@intel.com>,
 Vamshi Krishna <vamshi.krishna.gopal@intel.com>,
 Marcin Wojtas <mw@semihalf.com>, linux-kernel@vger.kernel.org,
 Yong Zhi <yong.zhi@intel.com>
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

Thank you Pierre for the review!
answers inline

pt., 1 maj 2020 o 22:16 Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 5/1/20 2:31 PM, Radoslaw Biernacki wrote:
> > This single fix address two issues on machines with nau88125:
> > 1) Audio distortion, due to lack of required clock rate on MCLK line
> > 2) Loud audible "pops" on headphones if there is no sysclk during nau8825
> >     playback power up sequence
> >
> > Explanation for:
> > 1) Due to Skylake HW limitation, MCLK pin can only output 24MHz clk
> >     rate (it can be only connected to XTAL parent clk). The BCLK pin
> >     can be driven by dividers and therefore FW is able to set it to rate
> >     required by chosen audio format. According to nau8825 datasheet, 256*FS
> >     sysclk gives the best audio quality and the only way to achieve this
> >     (taking into account the above limitations) its to regenerate the MCLK
> >     from BCLK on nau8825 side by FFL. Without required clk rate, audio is
> >     distorted by added harmonics.
>
> The BCLK is going to be a multiple of 50 * Fs due to clocking
> restrictions. Can the codec regenerate a good-enough sysclk from this?

According to Intel, silicon has a limitation, on SKL/KBL only clk_id =
SKL_XTAL, .name = "xtal" is available for IO domain.
As mentioned in the commit:
MCLK is generated by using 24MHz Xtal directly or applying a divider
(so no way of achieving the rate required by audio format).
BCLK/FS is generated from 24MHz and uses dividers and additional
padding bits are used to match the clock source.
Next gen silicon has the possibility of using additional clock sources.

Summing up, using MCLK from SKL to NAU88L25 is not an option.
The only option we found is to use BCLK and regen the required clock
rate by FLL on the NAU88l25 side.

> >
> > 2) Currently Skylake does not output MCLK/FS when the back-end DAI op
> >     hw_param is called, so we cannot switch to MCLK/FS in hw_param.  This
> >     patch reduces pop by letting nau8825 keep using its internal VCO clock
> >     during widget power up sequence, until SNDRV_PCM_TRIGGER_START when
> >     MCLK/FS is available. Once device resumes, the system will only enable
> >     power sequence for playback without doing hardware parameter, audio
> >     format, and PLL configure. In the mean time, the jack detecion sequence
> >     has changed PLL parameters and switched to internal clock. Thus, the
> >     playback signal distorted without correct PLL parameters.  That is why
> >     we need to configure the PLL again in SNDRV_PCM_TRIGGER_RESUME case.
>
> IIRC the FS can be controlled with the clk_ api with the Skylake driver,
> as done for some KBL platforms. Or is this not supported by the firmware
> used by this machine?

According to Ben, SKL had limitations in FW for managing the clk's
back in the days.
Can you point to the other driver you mention so we can cross check?

>
> > -static int skylake_nau8825_hw_params(struct snd_pcm_substream *substream,
> > -     struct snd_pcm_hw_params *params)
> > +static int skylake_nau8825_trigger(struct snd_pcm_substream *substream, int cmd)
> >   {
> >       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> > +     struct snd_pcm_runtime *runtime = substream->runtime;
> >       struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> > -     int ret;
> > -
> > -     ret = snd_soc_dai_set_sysclk(codec_dai,
> > -                     NAU8825_CLK_MCLK, 24000000, SND_SOC_CLOCK_IN);
> > +     int ret = 0;
> >
> > -     if (ret < 0)
> > -             dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
> > +     switch (cmd) {
> > +     case SNDRV_PCM_TRIGGER_START:
> > +             ret = snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_FLL_FS, 0,
> > +                                          SND_SOC_CLOCK_IN);
> > +             if (ret < 0) {
> > +                     dev_err(codec_dai->dev, "can't set FS clock %d\n", ret);
> > +                     break;
> > +             }
> > +             ret = snd_soc_dai_set_pll(codec_dai, 0, 0, runtime->rate,
> > +                                       runtime->rate * 256);
> > +             if (ret < 0)
> > +                     dev_err(codec_dai->dev, "can't set FLL: %d\n", ret);
> > +             break;
> > +     case SNDRV_PCM_TRIGGER_RESUME:
> > +             ret = snd_soc_dai_set_pll(codec_dai, 0, 0, runtime->rate,
> > +                                       runtime->rate * 256);
> > +             if (ret < 0)
> > +                     dev_err(codec_dai->dev, "can't set FLL: %d\n", ret);
> > +             msleep(20);
>
> is there a reason why you'd need a msleep for resume and not for start?

No. I think we missed this.
msleep() is needed to stabilize FLL.
Will fix in next rev.
