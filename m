Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5227686839
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 19:40:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8C641661;
	Thu,  8 Aug 2019 19:39:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8C641661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565286037;
	bh=FFoGGYslDIynsZsrpyErlhqmdjCNbFbJrEfsT9Vl0KU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ovRI/kwNWBKf6WiC/cBHZVD3L4V6QdVaEgBFGkavZDMhsMplis+wyPTn4zGKXIGyJ
	 AnKSx3qrSxhu3WaEQvwjeggasqF92A2SWOcL4d19Auru4rnXdPDnMmAMGHH8o0Z5Lv
	 bSN25QEYgHV/IEXErzL4mJdTbTiNDLLmN1SzL3WU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56C9CF8053A;
	Thu,  8 Aug 2019 19:38:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78188F80534; Thu,  8 Aug 2019 19:38:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01821F803F3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 19:38:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01821F803F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="CsKyOqjf"
Received: by mail-yb1-xb43.google.com with SMTP id j6so4206979ybm.7
 for <alsa-devel@alsa-project.org>; Thu, 08 Aug 2019 10:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=daERR2ac/QPOHUKoDM6gMCQcmJSnigNriAY/pN6cJfE=;
 b=CsKyOqjfqgHYOBivQEn4UVF/z9Gckrwix/9KyxFnFTNDzD0N3G6RzJVFXslJ8/kLeg
 vYVhQ15CqHPolMa9vK5T1vdv3aE35r0Sqlw8yowETYQNNSjaMyd4+dkHKyfvVo+lJUKj
 /z5YbC6a2ultopRengBkZ4trx8/OjwdFkErjSqqUdNuT3KRM2Gkte0VwWDSm9GFVaKFT
 rFTIaULtOLATMGRP3NszvzcwdRkyJRk/KlNFma/NHCzampX9zW1UoKS1FAFmzUBtJd6N
 /U4S+Asv+tKAukT0x8iFRd9WounNUBjHvwaI98a8fUsfEoPFqh3BxM45IbpS0s3p826q
 toUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=daERR2ac/QPOHUKoDM6gMCQcmJSnigNriAY/pN6cJfE=;
 b=t9zdb+jnzBYIlxO1RRMSOx8z6jwVbI94zMPf2en+xv4G3AlDjUwPOIluH9sp+RykTO
 eji/At/2q/hAD12SBebAsLrDwh8RNQ656fap3TSFAx+Jb8hMeKipCNO/ZKoQxaoXjmgz
 FBtDqIhTd2O80A3lT4bA7TPyyKdI2OE0jacHwyxM1VOEkt5mjjd9jHKTeW3K6qpWPgDp
 Eofnp2iz0XVkptjJA10SRyuPgdXWxTe1fGEwdAFOUM+U49lz1W0mrd/FMeDBqlEcsROe
 6wMXsbDOCk3Nf0koteH9m6GTktG27TflchJ8kdHtIqNNhXW99kURdkgWOnN+ysJf0lU3
 9ISQ==
X-Gm-Message-State: APjAAAUQsldv68Y3GrDyoprsExX3s2LpsoDaXkLalNvFC2bGz+8ymtmV
 sKrq6mXqFmjmJ/s0P+TYeE6CnE2kdCZCrxc3gOOXRw==
X-Google-Smtp-Source: APXvYqw1mGh6fIQqXjHbMdke2j9oJGi/RZGNJLujt+O0GCgSuPgjN/IZMAI4jm1rs9PlfBDUHI33qcWpyB9qg8KlO9k=
X-Received: by 2002:a25:d70e:: with SMTP id o14mr6127434ybg.440.1565285924057; 
 Thu, 08 Aug 2019 10:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <1565251120-13082-1-git-send-email-mac.chiang@intel.com>
In-Reply-To: <1565251120-13082-1-git-send-email-mac.chiang@intel.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Thu, 8 Aug 2019 10:38:33 -0700
Message-ID: <CAFQqKeXO5XHTrgTvXDRtqPDZZNrb24GB9ps3L=7WYadW0nYuKA@mail.gmail.com>
To: Chiang Mac <mac.chiang@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "M R, Sathya Prakash" <sathya.prakash.m.r@intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: boards: Add Cometlake machine
 driver support
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

On Thu, Aug 8, 2019 at 1:00 AM <mac.chiang@intel.com> wrote:

> From: Mac Chiang <mac.chiang@intel.com>
>
> reuse and add Cometlake support with:
> SSP0 for DA7219 headphone codec
> SSP1 for MAX98357a speaker amp codec
>
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
> ---
>  sound/soc/intel/boards/Kconfig                    | 15 +++++++++
>  sound/soc/intel/boards/bxt_da7219_max98357a.c     | 37
> ++++++++++++++++++++++-
>  sound/soc/intel/common/soc-acpi-intel-cnl-match.c | 12 ++++++++
>  sound/soc/intel/common/soc-intel-quirks.h         |  5 +++
>  4 files changed, 68 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/intel/boards/Kconfig
> b/sound/soc/intel/boards/Kconfig
> index 50bf149..617d63c 100644
> --- a/sound/soc/intel/boards/Kconfig
> +++ b/sound/soc/intel/boards/Kconfig
> @@ -256,6 +256,21 @@ config SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH
>
>  endif ## SND_SOC_INTEL_SKL
>
> +config SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
> +       tristate
> +       select SND_SOC_DA7219
> +       select SND_SOC_MAX98357A
> +       select SND_SOC_DMIC
> +       select SND_SOC_HDAC_HDMI
> +
> +if SND_SOC_SOF_COMETLAKE_LP
> +config SND_SOC_INTEL_CML_LP_DA7219_MAX98357A_MACH
> +       tristate "CML_LP with DA7219 and MAX98357A in I2S Mode"
> +       depends on I2C && ACPI
> +       depends on MFD_INTEL_LPSS || COMPILE_TEST
> +       select SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
> +endif
> +
>  if SND_SOC_INTEL_APL
>
>  config SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
> diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c
> b/sound/soc/intel/boards/bxt_da7219_max98357a.c
> index c0d865a..e5941ff 100644
> --- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
> +++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
> @@ -24,6 +24,8 @@
>
>  #define BXT_DIALOG_CODEC_DAI   "da7219-hifi"
>  #define BXT_MAXIM_CODEC_DAI    "HiFi"
> +#define MCLK_19M       19200000
> +#define MCLK_24M       24576000
>  #define DUAL_CHANNEL           2
>  #define QUAD_CHANNEL           4
>
> @@ -181,8 +183,13 @@ static int broxton_da7219_codec_init(struct
> snd_soc_pcm_runtime *rtd)
>         struct snd_soc_component *component = rtd->codec_dai->component;
>
>         /* Configure sysclk for codec */
> -       ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK,
> 19200000,
> +#if !IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
> +       ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK,
> MCLK_19M,
>                                      SND_SOC_CLOCK_IN);
> +#else
> +       ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK,
> MCLK_24M,
> +                                    SND_SOC_CLOCK_IN);
> +#endif
>         if (ret) {
>                 dev_err(rtd->dev, "can't set codec sysclk
> configuration\n");
>                 return ret;
> @@ -224,7 +231,11 @@ static int broxton_hdmi_init(struct
> snd_soc_pcm_runtime *rtd)
>         if (!pcm)
>                 return -ENOMEM;
>
> +#if !IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
>         pcm->device = BXT_DPCM_AUDIO_HDMI1_PB + dai->id;
> +#else
> +       pcm->device = dai->id;
> +#endif
>         pcm->codec_dai = dai;
>
>         list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
> @@ -683,6 +694,27 @@ static int broxton_audio_probe(struct platform_device
> *pdev)
>                                 broxton_dais[i].cpus->dai_name = "SSP2
> Pin";
>                         }
>                 }
> +       } else if (soc_intel_is_cml()) {
> +               unsigned int i;
> +
> +               broxton_audio_card.name = "cmlda7219max";
> +
> +               for (i = 0; i < ARRAY_SIZE(broxton_dais); i++) {
> +                       /* MAXIM_CODEC is connected to SSP1. */
> +                       if (!strcmp(broxton_dais[i].codecs->dai_name,
> +                                       BXT_MAXIM_CODEC_DAI)) {
> +                               broxton_dais[i].id = 1;
> +                               broxton_dais[i].name = "SSP1-Codec";
> +                               broxton_dais[i].cpus->dai_name = "SSP1
> Pin";
> +                       }
> +                       /* DIALOG_CODEC is connected to SSP0 */
> +                       else if (!strcmp(broxton_dais[i].codecs->dai_name,
> +                                       BXT_DIALOG_CODEC_DAI)) {
> +                               broxton_dais[i].id = 0;
> +                               broxton_dais[i].name = "SSP0-Codec";
> +                               broxton_dais[i].cpus->dai_name = "SSP0
> Pin";
> +                       }
> +               }
>         }
>
Would it be possible to keep the ID's unchanged? Its quite confusing with
so many platforms reusing the machine driver so it would help if the
changes are minimal.
I understand why you want to change the ID's but it would be simpler to
just use the existing ID's in topology I think.

Thanks,
Ranjani
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
