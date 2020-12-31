Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 876412E8188
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Dec 2020 19:11:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FA8716FC;
	Thu, 31 Dec 2020 19:10:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FA8716FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609438260;
	bh=AjgznMQhmlYwoGEtQcFjNGWrUOhOfe03PXKmMCn52As=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E97R2jooNQ9J0E7lgtfrDnrnrvEi6uMovGJtNDp3vylU6sHJnHoEbPs1yYhO26x+d
	 GsvB7P50QAUnGH5qzZw/Dx8FH8yUzg7WxNcc49x81PK8clIYXGH+KQFdTNnbrqXxfe
	 x1HDKpF3W4IjkU1w5KJ181koLhmQFRcMiVwDAHD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90AD8F80141;
	Thu, 31 Dec 2020 19:09:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F5A2F8022B; Thu, 31 Dec 2020 19:09:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4D4DF80129
 for <alsa-devel@alsa-project.org>; Thu, 31 Dec 2020 19:09:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4D4DF80129
Received: from mail-lf1-f69.google.com ([209.85.167.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kv2MV-00052E-Vg
 for alsa-devel@alsa-project.org; Thu, 31 Dec 2020 18:07:48 +0000
Received: by mail-lf1-f69.google.com with SMTP id a10so12276015lfg.13
 for <alsa-devel@alsa-project.org>; Thu, 31 Dec 2020 10:07:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0V7U/gNm+Y+R6u7qQmRsQkwPnBjsroHOTb3lajqSuRM=;
 b=WFyhZKxcUg0Vrr043Z3gVBQ3of2mQxoFvCiGXJAe9wc9qmoH0X7WBT2yTTMdugXb9d
 Ai4/EW83yfD0urUv1UjbFv+FSilMXOC7sDWJdvRJ6b1xTiPZQKaxw/SlkVHsAiXeHvLD
 nBumPIJNpRWU96rJYBMRjArXXeCzc/zftBBGtcIpZne48YAGpDGZgajXdPfJYwye/Hxa
 zx78MoTlGL8sbvjesWi5hrQFC7yYDEpioRz7/Z7DdBzSs3M1gsyyuekUUg2Af3B6h1S1
 WdtReqMTTBZGlLXZuf6C7Uu/scKfjPBdm8jvWiVfeNFModNH7wo3y7bPtCdvZSagrk5x
 UHbw==
X-Gm-Message-State: AOAM530ocJvbyk8IxMdT8e27eI2gyd3cOgqyyVT2TI+wUuAUFXhdDVui
 Vl74QaWpln+ZzcVoB+ABdeFZyUS3V8UxbDMD1wnN8uv1ASVLy5HYGh0PY2Sko/MwIMR3njo8VFc
 CjUEvUWXGQtymlpdO+rwY+ubTp1IzIDJVi4w4mrwRxcgrzipnCP0Nh+mt
X-Received: by 2002:a19:8316:: with SMTP id f22mr27363189lfd.10.1609438067025; 
 Thu, 31 Dec 2020 10:07:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKnCfGocE3EH8dPTyyxTDZeVYd6vD0uGtU7jtolwNyuue4/jjmMeNyR3I806TvGD2AdPoRwTjn7s4wRb+yE00=
X-Received: by 2002:a19:8316:: with SMTP id f22mr27363162lfd.10.1609438066739; 
 Thu, 31 Dec 2020 10:07:46 -0800 (PST)
MIME-Version: 1.0
References: <20201229133817.190160-1-kai.heng.feng@canonical.com>
 <s5hsg7mb63l.wl-tiwai@suse.de>
In-Reply-To: <s5hsg7mb63l.wl-tiwai@suse.de>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 1 Jan 2021 02:07:34 +0800
Message-ID: <CAAd53p4GxNnbWKRDxck0=Qz5JTyKTSubswbG+LQ=y2ntJ=KvqQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: Intel: hda: Modify existing helper to
 disable WAKEEN
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Keyon Jie <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Payal Kshirsagar <payalskshirsagar1234@gmail.com>,
 Amery Song <chao.song@intel.com>, daniel.baluta@nxp.com,
 Marcin Rajwa <marcin.rajwa@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>
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

On Thu, Dec 31, 2020 at 6:52 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 29 Dec 2020 14:38:14 +0100,
> Kai-Heng Feng wrote:
> >
> > Modify hda_codec_jack_wake_enable() to also support disable WAKEEN.
> > This is a preparation for next patch.
> >
> > No functional change intended.
>
> Maybe it's better to mention that this patch moves the WAKEEN
> disablement call out of hda_codec_jack_check() into
> hda_codec_jack_wake_enable(), too.

Ok, will update the commit log in v2.

Kai-Heng

>
>
> thanks,
>
> Takashi
>
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> >  sound/soc/sof/intel/hda-codec.c | 16 +++++++---------
> >  sound/soc/sof/intel/hda-dsp.c   |  6 ++++--
> >  sound/soc/sof/intel/hda.h       |  2 +-
> >  3 files changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
> > index 6875fa570c2c..bc9ac4abdab5 100644
> > --- a/sound/soc/sof/intel/hda-codec.c
> > +++ b/sound/soc/sof/intel/hda-codec.c
> > @@ -63,16 +63,18 @@ static int hda_codec_load_module(struct hda_codec *codec)
> >  }
> >
> >  /* enable controller wake up event for all codecs with jack connectors */
> > -void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev)
> > +void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool enable)
> >  {
> >       struct hda_bus *hbus = sof_to_hbus(sdev);
> >       struct hdac_bus *bus = sof_to_bus(sdev);
> >       struct hda_codec *codec;
> >       unsigned int mask = 0;
> >
> > -     list_for_each_codec(codec, hbus)
> > -             if (codec->jacktbl.used)
> > -                     mask |= BIT(codec->core.addr);
> > +     if (enable) {
> > +             list_for_each_codec(codec, hbus)
> > +                     if (codec->jacktbl.used)
> > +                             mask |= BIT(codec->core.addr);
> > +     }
> >
> >       snd_hdac_chip_updatew(bus, WAKEEN, STATESTS_INT_MASK, mask);
> >  }
> > @@ -81,12 +83,8 @@ void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev)
> >  void hda_codec_jack_check(struct snd_sof_dev *sdev)
> >  {
> >       struct hda_bus *hbus = sof_to_hbus(sdev);
> > -     struct hdac_bus *bus = sof_to_bus(sdev);
> >       struct hda_codec *codec;
> >
> > -     /* disable controller Wake Up event*/
> > -     snd_hdac_chip_updatew(bus, WAKEEN, STATESTS_INT_MASK, 0);
> > -
> >       list_for_each_codec(codec, hbus)
> >               /*
> >                * Wake up all jack-detecting codecs regardless whether an event
> > @@ -97,7 +95,7 @@ void hda_codec_jack_check(struct snd_sof_dev *sdev)
> >                                             codec->jackpoll_interval);
> >  }
> >  #else
> > -void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev) {}
> > +void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool enable) {}
> >  void hda_codec_jack_check(struct snd_sof_dev *sdev) {}
> >  #endif /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
> >  EXPORT_SYMBOL_NS(hda_codec_jack_wake_enable, SND_SOC_SOF_HDA_AUDIO_CODEC);
> > diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
> > index 2b001151fe37..7d00107cf3b2 100644
> > --- a/sound/soc/sof/intel/hda-dsp.c
> > +++ b/sound/soc/sof/intel/hda-dsp.c
> > @@ -617,7 +617,7 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
> >
> >  #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
> >       if (runtime_suspend)
> > -             hda_codec_jack_wake_enable(sdev);
> > +             hda_codec_jack_wake_enable(sdev, true);
> >
> >       /* power down all hda link */
> >       snd_hdac_ext_bus_link_power_down_all(bus);
> > @@ -683,8 +683,10 @@ static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
> >
> >  #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
> >       /* check jack status */
> > -     if (runtime_resume)
> > +     if (runtime_resume) {
> > +             hda_codec_jack_wake_enable(sdev, false);
> >               hda_codec_jack_check(sdev);
> > +     }
> >
> >       /* turn off the links that were off before suspend */
> >       list_for_each_entry(hlink, &bus->hlink_list, list) {
> > diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
> > index 9ec8ae0fd649..a3b6f3e9121c 100644
> > --- a/sound/soc/sof/intel/hda.h
> > +++ b/sound/soc/sof/intel/hda.h
> > @@ -650,7 +650,7 @@ void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev);
> >   */
> >  void hda_codec_probe_bus(struct snd_sof_dev *sdev,
> >                        bool hda_codec_use_common_hdmi);
> > -void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev);
> > +void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool enable);
> >  void hda_codec_jack_check(struct snd_sof_dev *sdev);
> >
> >  #endif /* CONFIG_SND_SOC_SOF_HDA */
> > --
> > 2.29.2
> >
