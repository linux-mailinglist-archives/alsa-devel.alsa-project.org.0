Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA531CF15F
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 11:19:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF49E1680;
	Tue, 12 May 2020 11:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF49E1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589275188;
	bh=n9VEEMwuMG1px4Sx5b1DMIEFlyR3bTRBziqsTi3afN4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nciv1HzGuVXWaFATdNetvptFOykpffdGUV0mKiXDg9IS54o+l7e/4sKIr/wjCwgVC
	 h6M7ZT2MzUk/S0UwglPM7EQzn7b6gF+ugQMCroRwv1C1BkQBloAAySFILOhB7U0JrF
	 4SaYG+hHhpQVju5NcEzn79cJ2sq4RxWxaMmpIi5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0642CF800B7;
	Tue, 12 May 2020 11:18:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA027F80112; Tue, 12 May 2020 11:18:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96602F800B7
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 11:17:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96602F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tDXMwwMT"
Received: by mail-lj1-x244.google.com with SMTP id h4so12763154ljg.12
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 02:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ogr2lxeowgYbZEMLXWm3SAB7ITNzM8QGV6+p/HpOjTc=;
 b=tDXMwwMTkaPstTlMdWw85/vflUnOQMtIdmp2NWu5H+qPftBJLUYj+uk0a07HM9Uj6Z
 6CUe20QcvfTfopNPvK0MYJew0c1l7s1Qn13UR0CCaKF3E5ZnJFyLC++n7ttyy+MeyvKj
 ikuqwpQ1sjp/81lqSu5e8FQum56OySXcq1yx2NfFLeZZrIO7tRKO8SqmOLAIi9xz5dic
 mOg0u2Tap515V81qy/kf9ckbkNtPMWtrKNFYCT1fhwEeBwLX+xuLvuUebv0VlT+6TRia
 LOp+DPtOxw//eH17v+UzV0WaM+4XFIXxO0XV8gOxzNkzZvMSJ5OMGGPh3pgZauhDKlDS
 Ru7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ogr2lxeowgYbZEMLXWm3SAB7ITNzM8QGV6+p/HpOjTc=;
 b=I+tJcocfrycEU5M2jW3ysfjY6DwRQmlR9xosBHePRTdUoZa2QTli/ZrtZ3g+bHp6OL
 lNL7rI3qwO94jA498qoo0f2+WjZiHZIh47AdQ2JOszPUPnACgAbVXe0DY9jpEU81kKcS
 fqR/UmrWrfzMbvPVtgHtDPZbAD/ffTizAYXKgtazfzSgCuOb23DWBNZjrpX7ZTsatHnc
 8Xrzey9XVqMOyygAD9hd5WoglPE7vFrqyxAeD1Crj+NefrYQuzZkyTvEF0tf7ed3LSPg
 v8aCS7AFXHM/aFdFd1XAyVTp8rX/J+HyL5ZZGaxjVDCnL9AugLlO+q30GWHHZw2xynkW
 JgDA==
X-Gm-Message-State: AOAM532znCqR+SLIOdyLPvKSFRoqsYahvzXkcggRRwdtMacSUmQz5WwK
 CP5dEnfJeULOqEoGKG6ZXSoKCcdvlJhb2+GfE/c=
X-Google-Smtp-Source: ABdhPJyDtO3ZVYVz/n+4aVI6zGvBg9WaC/2epTL5to0F/1UvdX0rqVzQXDuuYOv36BeyxdrHiHC5GFKc0Aju4yH52fs=
X-Received: by 2002:a2e:3a0a:: with SMTP id h10mr12229738lja.54.1589275076502; 
 Tue, 12 May 2020 02:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200509031919.9006-1-steves.lee@maximintegrated.com>
 <CA+Px+wUdavr-qqEEng86ZAuwx++J-qB3va7p28EjOx-K9SyBtg@mail.gmail.com>
In-Reply-To: <CA+Px+wUdavr-qqEEng86ZAuwx++J-qB3va7p28EjOx-K9SyBtg@mail.gmail.com>
From: Steve Lee <steves.lee.maxim@gmail.com>
Date: Tue, 12 May 2020 18:17:44 +0900
Message-ID: <CABff4NS7L4EsqNALMOmyTY-Q=ZyDct9JXP1C2Y-XcnhXf48+=A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: max98390: Added Amplifier Driver
To: Tzung-Bi Shih <tzungbi@google.com>
Content-Type: text/plain; charset="UTF-8"
Cc: jack.yu@realtek.com, ALSA development <alsa-devel@alsa-project.org>,
 ryan.lee.maxim@gmail.com, ckeepax@opensource.cirrus.com,
 steves.lee@maximintegrated.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, nuno.sa@analog.com,
 Mark Brown <broonie@kernel.org>, geert@linux-m68k.org, dmurphy@ti.com,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 rf@opensource.wolfsonmicro.com
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

On Mon, May 11, 2020 at 8:16 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> (The patch passed 2 round review in https://crrev.com/c/2083354)
>
> On Sun, May 10, 2020 at 4:23 PM Steve Lee <steves.lee.maxim@gmail.com> wrote:
> > +static int max98390_dai_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
> > +{
> > +       struct snd_soc_component *component = codec_dai->component;
> > +       struct max98390_priv *max98390 =
> > +               snd_soc_component_get_drvdata(component);
> > +       unsigned int mode;
> > +       unsigned int format;
> > +       unsigned int invert;
> > +
> > +       dev_dbg(component->dev, "%s: fmt 0x%08X\n", __func__, fmt);
> > +
> > +       switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> > +       case SND_SOC_DAIFMT_CBS_CFS:
> > +               mode = MAX98390_PCM_MASTER_MODE_SLAVE;
> > +               break;
> > +       case SND_SOC_DAIFMT_CBM_CFM:
> > +               max98390->master = true;
> > +               mode = MAX98390_PCM_MASTER_MODE_MASTER;
> > +               break;
> > +       default:
> > +               dev_err(component->dev, "DAI clock mode unsupported\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       regmap_update_bits(max98390->regmap,
> > +               MAX98390_PCM_MASTER_MODE,
> > +               MAX98390_PCM_MASTER_MODE_MASK,
> > +               mode);
> > +
> > +       switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> > +       case SND_SOC_DAIFMT_NB_NF:
> > +               break;
> > +       case SND_SOC_DAIFMT_IB_NF:
> > +               invert = MAX98390_PCM_MODE_CFG_PCM_BCLKEDGE;
> > +               break;
> > +       default:
> > +               dev_err(component->dev, "DAI invert mode unsupported\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       regmap_update_bits(max98390->regmap,
> > +               MAX98390_PCM_MODE_CFG,
> > +               MAX98390_PCM_MODE_CFG_PCM_BCLKEDGE,
> > +               invert);
> invert will be uninitialized in the SND_SOC_DAIFMT_NB_NF case.
Thank you for feedback.
I've add initial value for invert.
>
> > +static int max98390_dai_hw_params(struct snd_pcm_substream *substream,
> > +               struct snd_pcm_hw_params *params,
> > +       struct snd_soc_dai *dai)
> Lack of 1 tab indent.
Done as requested.
>
> > +static int max98390_adaptive_rdc_get(struct snd_kcontrol *kcontrol,
> > +               struct snd_ctl_elem_value *ucontrol)
> > +{
> > +       int rdc, rdc0;
> > +       struct snd_soc_component *component =
> > +               snd_soc_kcontrol_component(kcontrol);
> > +       struct max98390_priv *max98390 =
> > +               snd_soc_component_get_drvdata(component);
> > +
> > +       regmap_read(max98390->regmap, THERMAL_RDC_RD_BACK_BYTE1, &rdc);
> > +       regmap_read(max98390->regmap, THERMAL_RDC_RD_BACK_BYTE0, &rdc0);
> > +       rdc0 |= rdc << 8;
> > +       ucontrol->value.integer.value[0] = rdc0;
> ucontrol->value.integer.value[0] = rdc0 | (rdc << 8);
Done as requested.
>
> > +static int max98390_dsm_init(struct snd_soc_component *component)
> > +{
> > +       int ret;
> > +       const char *filename;
> > +       struct max98390_priv *max98390 =
> > +               snd_soc_component_get_drvdata(component);
> > +       const struct firmware *fw = NULL;
> > +       char *dsm_param = NULL;
> Don't need to initialize fw and dsm_param in the case.
Done as requested.
>
> > +
> > +       filename = "dsm_param.bin";
> Either:
> - initialize when declaring the variable
> - remove the variable and inline into request_firmware() call
I've added initialized at declare.
>
> > +       ret = request_firmware(&fw, filename, component->dev);
> > +       if (ret) {
> > +               dev_err(component->dev,
> > +                       "Failed to acquire dsm params: %d\n", ret);
> > +               goto err;
> > +       }
> > +
> > +       dev_info(component->dev,
> > +               "max98390: param fw size %d\n",
> > +               fw->size);
> > +       dsm_param = (char *)fw->data;
> > +       dsm_param += MAX98390_DSM_PAYLOAD_OFFSET;
> > +       regmap_bulk_write(max98390->regmap, DSM_EQ_BQ1_B0_BYTE0,
> > +               dsm_param,
> > +               fw->size - MAX98390_DSM_PAYLOAD_OFFSET);
> > +       release_firmware(fw);
> > +       regmap_write(max98390->regmap, MAX98390_R23E1_DSP_GLOBAL_EN, 0x01);
> > +
> > +err:
> > +       return ret;
> > +}
>
> > +static int max98390_probe(struct snd_soc_component *component)
> > +{
> > +       struct max98390_priv *max98390 =
> > +               snd_soc_component_get_drvdata(component);
> > +
> > +       /* Update dsm bin param */
> This comment makes more sense if before max98390_dsm_init().
Done as requested.
>
> > +       regmap_write(max98390->regmap, MAX98390_SOFTWARE_RESET, 0x01);
> > +       /* Sleep reset settle time */
> > +       msleep(20);
> > +       max98390_dsm_init(component);
>
> > +       /* Check Revision ID */
> > +       ret = regmap_read(max98390->regmap,
> > +               MAX98390_R24FF_REV_ID, &reg);
> > +       if (ret < 0) {
> if (ret)
Done as requested.
