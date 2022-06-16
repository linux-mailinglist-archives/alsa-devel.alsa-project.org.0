Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3290554E33C
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 16:19:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFC7B1ACD;
	Thu, 16 Jun 2022 16:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFC7B1ACD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655389181;
	bh=nOQ5hVm0SL77OYegdxeKjfMJcK/TsvppqnlzlWZfO0o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LQ1iqPgCFgugxYoj8UgYoWdFlvuTWwWm3eX/2cPPFpP44HUtN5B3/vkQER5zTFVOZ
	 7Zso1M6moVuxo8aPrU+uoWNp32fMcTtxT0X4TgpwubvvTRAc/mdI2l13FvwOFcKK3+
	 WxqhIiwDodiVRYHMM8hAmIZ663bcEwqip/uOq7Bs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 075BBF80310;
	Thu, 16 Jun 2022 16:18:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67CD4F800B9; Thu, 16 Jun 2022 16:18:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E06BBF800B9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 16:18:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E06BBF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TaZ91E/B"
Received: by mail-lf1-x12f.google.com with SMTP id c2so2490383lfk.0
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 07:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=s5aFrnl2AMyHctil0oe+qIm2HKoq9Fasg76DynmQFT8=;
 b=TaZ91E/BoG18frEgBhkHoS2ZO/yNO/bkZNudGfR/5BjKPibX4g+xoEj2mHHRam+TcJ
 AAKw02u4dGAC1IQztDalowD/g9kOd7w/j+bXr1zdHAvFPdmSpsdQZU3By69Oxj1K259S
 CUXr36ItqScfq3bMuA/K4JMHh88ZxQp7opnpylen4lMe+2qE/INOMwLbhLn2VaO8+wn9
 ctXFFC9LvNaVYlcOJSK0HiLjJlO1/UIO0ApiAG6zf6AmCL2rmgyHlXcUusciOii6fJ1O
 XOADbq5ciJuu/VSp9o7fA1w4LWCfgTeLEWpy1FouNyT2vHlIToUUNOf41SgDB/8/mPPJ
 1FGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s5aFrnl2AMyHctil0oe+qIm2HKoq9Fasg76DynmQFT8=;
 b=aq8vRsp4/dftXCs5ffBQOCSa6hGLX3QrUUUmMHvAf9a3VFtICAuh/5EarglzqGpcNY
 emkRu0G4Fi/EplLMuwLk3U0/F9CfKqCRgz2F6HbYeRXk3POAiS28fesJ4Gz+PYz5trg3
 7KDbdCKOrIrBKenJ7f2oz9rDpFxoPuPG4GzqBCAMRE3Ug0sSHgMr4ve3R8Scep+5iV03
 GG59C0GBzth491e+N5Ql0HZwLNC3mMxkRoIYgIxfO+SjwPujGCDBzCDLgPaLpFskfiQ3
 Jz4r/dIekfQth0CaFePB0Z1xv3yG3Fcm0EOsyR5+JfOI2RWz0va0hK9aFuyMiCvHUV2t
 mzoA==
X-Gm-Message-State: AJIora82V1u/b7F9KnWjzfKlqFNRPEcFq14jAZVRYvWtEOm31bDzXBFi
 UbvI4c6QhfFuscU1iY44Sr4=
X-Google-Smtp-Source: AGRyM1vVyx9qpPdlvimqOhvHYayIkfga0oQ7ZkWbaRKtWNnWsA/t96Fxv1C4DRgGpjkiU1DItozkVg==
X-Received: by 2002:a05:6512:c07:b0:479:2e0f:9a06 with SMTP id
 z7-20020a0565120c0700b004792e0f9a06mr2768718lfu.687.1655389108968; 
 Thu, 16 Jun 2022 07:18:28 -0700 (PDT)
Received: from [10.0.0.42] (91-159-150-230.elisa-laajakaista.fi.
 [91.159.150.230]) by smtp.gmail.com with ESMTPSA id
 a14-20020a19ca0e000000b004796a17246esm251884lfg.252.2022.06.16.07.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 07:18:28 -0700 (PDT)
Message-ID: <cd61d081-8f10-6dc2-c2ae-ffb8658d216b@gmail.com>
Date: Thu, 16 Jun 2022 17:25:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] ASoC: ti: omap-mcbsp: duplicate sysfs error
Content-Language: en-US
To: David Owens <dowens@precisionplanting.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220615150955.4140789-1-dowens@precisionplanting.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20220615150955.4140789-1-dowens@precisionplanting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

Hi David,

On 6/15/22 18:09, David Owens wrote:
> Convert to managed versions of sysfs and clk allocation to simplify
> unbinding and error handling in probe.  Managed sysfs node
> creation specifically addresses the following error seen the second time
> probe is attempted after sdma_pcm_platform_register() previously requsted
> probe deferral:
> 
> sysfs: cannot create duplicate filename '/devices/platform/68000000.ocp/49022000.mcbsp/max_tx_thres'

I have tried to looked up devm_sysfs_remove_group(), which did not
existed, but you found the correct devm ;)

Looks good, thank you!

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>


> Signed-off-by: David Owens <dowens@precisionplanting.com>
> ---
>  sound/soc/ti/omap-mcbsp-priv.h |  2 --
>  sound/soc/ti/omap-mcbsp-st.c   | 21 ++++-----------------
>  sound/soc/ti/omap-mcbsp.c      | 26 ++++----------------------
>  3 files changed, 8 insertions(+), 41 deletions(-)
> 
> diff --git a/sound/soc/ti/omap-mcbsp-priv.h b/sound/soc/ti/omap-mcbsp-priv.h
> index 7865cda4bf0a..da519ea1f303 100644
> --- a/sound/soc/ti/omap-mcbsp-priv.h
> +++ b/sound/soc/ti/omap-mcbsp-priv.h
> @@ -316,8 +316,6 @@ static inline int omap_mcbsp_read(struct omap_mcbsp *mcbsp, u16 reg,
> 
>  /* Sidetone specific API */
>  int omap_mcbsp_st_init(struct platform_device *pdev);
> -void omap_mcbsp_st_cleanup(struct platform_device *pdev);
> -
>  int omap_mcbsp_st_start(struct omap_mcbsp *mcbsp);
>  int omap_mcbsp_st_stop(struct omap_mcbsp *mcbsp);
> 
> diff --git a/sound/soc/ti/omap-mcbsp-st.c b/sound/soc/ti/omap-mcbsp-st.c
> index 0bc7d26c660a..402a57a502e6 100644
> --- a/sound/soc/ti/omap-mcbsp-st.c
> +++ b/sound/soc/ti/omap-mcbsp-st.c
> @@ -292,14 +292,11 @@ static ssize_t st_taps_store(struct device *dev,
> 
>  static DEVICE_ATTR_RW(st_taps);
> 
> -static const struct attribute *sidetone_attrs[] = {
> +static struct attribute *sidetone_attrs[] = {
>         &dev_attr_st_taps.attr,
>         NULL,
>  };
> -
> -static const struct attribute_group sidetone_attr_group = {
> -       .attrs = (struct attribute **)sidetone_attrs,
> -};
> +ATTRIBUTE_GROUPS(sidetone);
> 
>  int omap_mcbsp_st_start(struct omap_mcbsp *mcbsp)
>  {
> @@ -347,7 +344,7 @@ int omap_mcbsp_st_init(struct platform_device *pdev)
>         if (!st_data)
>                 return -ENOMEM;
> 
> -       st_data->mcbsp_iclk = clk_get(mcbsp->dev, "ick");
> +       st_data->mcbsp_iclk = devm_clk_get(mcbsp->dev, "ick");
>         if (IS_ERR(st_data->mcbsp_iclk)) {
>                 dev_warn(mcbsp->dev,
>                          "Failed to get ick, sidetone might be broken\n");
> @@ -359,7 +356,7 @@ int omap_mcbsp_st_init(struct platform_device *pdev)
>         if (!st_data->io_base_st)
>                 return -ENOMEM;
> 
> -       ret = sysfs_create_group(&mcbsp->dev->kobj, &sidetone_attr_group);
> +       ret = devm_device_add_group(mcbsp->dev, &sidetone_group);
>         if (ret)
>                 return ret;
> 
> @@ -368,16 +365,6 @@ int omap_mcbsp_st_init(struct platform_device *pdev)
>         return 0;
>  }
> 
> -void omap_mcbsp_st_cleanup(struct platform_device *pdev)
> -{
> -       struct omap_mcbsp *mcbsp = platform_get_drvdata(pdev);
> -
> -       if (mcbsp->st_data) {
> -               sysfs_remove_group(&mcbsp->dev->kobj, &sidetone_attr_group);
> -               clk_put(mcbsp->st_data->mcbsp_iclk);
> -       }
> -}
> -
>  static int omap_mcbsp_st_info_volsw(struct snd_kcontrol *kcontrol,
>                                     struct snd_ctl_elem_info *uinfo)
>  {
> diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
> index 4479d74f0a45..395493a2d965 100644
> --- a/sound/soc/ti/omap-mcbsp.c
> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -595,16 +595,13 @@ static ssize_t dma_op_mode_store(struct device *dev,
> 
>  static DEVICE_ATTR_RW(dma_op_mode);
> 
> -static const struct attribute *additional_attrs[] = {
> +static struct attribute *additional_attrs[] = {
>         &dev_attr_max_tx_thres.attr,
>         &dev_attr_max_rx_thres.attr,
>         &dev_attr_dma_op_mode.attr,
>         NULL,
>  };
> -
> -static const struct attribute_group additional_attr_group = {
> -       .attrs = (struct attribute **)additional_attrs,
> -};
> +ATTRIBUTE_GROUPS(additional);
> 
>  /*
>   * McBSP1 and McBSP3 are directly mapped on 1610 and 1510.
> @@ -702,8 +699,7 @@ static int omap_mcbsp_init(struct platform_device *pdev)
>                 mcbsp->max_tx_thres = max_thres(mcbsp) - 0x10;
>                 mcbsp->max_rx_thres = max_thres(mcbsp) - 0x10;
> 
> -               ret = sysfs_create_group(&mcbsp->dev->kobj,
> -                                        &additional_attr_group);
> +               ret = devm_device_add_group(mcbsp->dev, &additional_group);
>                 if (ret) {
>                         dev_err(mcbsp->dev,
>                                 "Unable to create additional controls\n");
> @@ -711,16 +707,7 @@ static int omap_mcbsp_init(struct platform_device *pdev)
>                 }
>         }
> 
> -       ret = omap_mcbsp_st_init(pdev);
> -       if (ret)
> -               goto err_st;
> -
> -       return 0;
> -
> -err_st:
> -       if (mcbsp->pdata->buffer_size)
> -               sysfs_remove_group(&mcbsp->dev->kobj, &additional_attr_group);
> -       return ret;
> +       return omap_mcbsp_st_init(pdev);
>  }
> 
>  /*
> @@ -1431,11 +1418,6 @@ static int asoc_mcbsp_remove(struct platform_device *pdev)
>         if (cpu_latency_qos_request_active(&mcbsp->pm_qos_req))
>                 cpu_latency_qos_remove_request(&mcbsp->pm_qos_req);
> 
> -       if (mcbsp->pdata->buffer_size)
> -               sysfs_remove_group(&mcbsp->dev->kobj, &additional_attr_group);
> -
> -       omap_mcbsp_st_cleanup(pdev);
> -
>         return 0;
>  }
> 
> --
> 2.34.1
> 
> This email is intended solely for the use of the individual to whom it is addressed and may contain confidential and/or privileged material. Any views or opinions presented are solely those of the author and do not necessarily represent those of Precision Planting. If you are not the intended recipient, be advised that you have received this email in error and that any use, dissemination, forwarding, printing, or copying of this email is strictly prohibited. Neither AGCO nor the sender accepts any responsibility for viruses, and it is your responsibility to scan, and virus check the e-mail and its attachment(s) (if any).

-- 
Péter
