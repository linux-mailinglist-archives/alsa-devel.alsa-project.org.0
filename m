Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 135FE5B17E1
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 10:59:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 961CD16BC;
	Thu,  8 Sep 2022 10:58:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 961CD16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662627559;
	bh=RuxbtbdvJX1SNTbMCxBOWiHiEn1KRc05yGLDiOfgOtk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dW5XXbLyvjQUlxgFhcGk+TPmqAQmC8j3s/4/dU+OKdVROENaRJrGjNNIS818M5KbB
	 4PMfITio23yzhezusG3iY2Icih2+1Xb6w1awmVLaEhq3TFRgs2CkUesjJX3txhEpMr
	 66tz145JwpgdygmLUQuAaHyq5p7daNcR1pmavSjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1BFCF8023B;
	Thu,  8 Sep 2022 10:58:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7425F80217; Thu,  8 Sep 2022 10:58:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08ADEF8016D
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 10:58:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08ADEF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="i7a4sZP3"
Received: by mail-pj1-x102a.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so1730368pjl.0
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 01:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Yl5dH+M1AECal4jvUQOuJGxEpqBdOe/+ieXwhwCLcIA=;
 b=i7a4sZP3FnbyUkKT8FkldgTI3hWplhLrLiEqax5uxxwsoWP9gf6N8hignXexdO56pf
 pGRznxBg49yjvlJfo/HQhepEoRNmt2PklxkaZltRNoZRv7vkHdewQrt5raOfqgQ6cOFI
 gdzdwvfK402rUb0U2/WrsE2L4kUCkF8RcaStsRL4fj49KYiZvEigyA67txy8eh/bF0pW
 9nimlMXCSUuv2GHDtWudZDol02Re3+hW96qW1kNULY93AbUvnGhKMK6TrCwc4NarqSwc
 9fUYIWLkCDHA4VgVNqCkjhe5MPCWVj0WRCZhbm0j7GmpF+32EAP+H62hXYo4LPVmd+vS
 MeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Yl5dH+M1AECal4jvUQOuJGxEpqBdOe/+ieXwhwCLcIA=;
 b=R9gmD+fPCCK+K3YfEPTYE5pBqtq/a1CK0s7qzm3vl8xWFPVrg/ON3Y1wYy8gwmhH7m
 WjntvzyZYOfBNLXx9Jls5B8V2x5NcD7an7L8yc2huO3kOE8fW+Iho7UXBEUgTinni/Fa
 M/oiYxS5IfJ0yOC6g2z4O7SrRORiTqAfnAyqbcV3UgQByfPvOZDmWciseTQOHjhaLcn5
 TBY2x/Vk+q3gNN+lxiO5LvNr1wyczA9aEsyZuGAMFHIouDXZhOdzJT3PHVebRelcMzAs
 bjZV4V5gRezpi/2dOE4P9SmCxauq5DQZesa991bBPG4+60vk/jNK/wzlUtsDHFucOhCJ
 fzng==
X-Gm-Message-State: ACgBeo3st+zrWFRVnWst13fdDr0DhccNbC6Abiwf20tXugruf3V3vdbz
 1Y2zq0MW966JCIcM68vGItFQcUCc/ZIsMBuBTYs=
X-Google-Smtp-Source: AA6agR6XeTaZhnOJWL11eg9HSVayAiNW4O8VHX0b67jvxaqgJXn+KJvwQDYiFLbuRwb9ORorqH1jT+y4at5YZYtWEgg=
X-Received: by 2002:a17:90b:3b81:b0:202:597a:c71d with SMTP id
 pc1-20020a17090b3b8100b00202597ac71dmr2997392pjb.105.1662627487826; Thu, 08
 Sep 2022 01:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <1662622316-23426-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1662622316-23426-1-git-send-email-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 8 Sep 2022 11:57:55 +0300
Message-ID: <CAEnQRZCz_qKUMPqQgADszu_DvBEqNYRqm-wgfiYYEbRfvUEkng@mail.gmail.com>
Subject: Re: [PATCH] ASoC: ak4458: Remove component probe() and remove()
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, broonie@kernel.org
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

On Thu, Sep 8, 2022 at 11:03 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> Most function in ak4458_probe() and ak4458_remove() are
> duplicate with dai ops, so remove them and move dsd_path
> setting to dai ops.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
>  sound/soc/codecs/ak4458.c | 53 ++++++---------------------------------
>  1 file changed, 7 insertions(+), 46 deletions(-)
>
> diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
> index ea33cc83c86c..b534212096ee 100644
> --- a/sound/soc/codecs/ak4458.c
> +++ b/sound/soc/codecs/ak4458.c
> @@ -447,6 +447,13 @@ static int ak4458_hw_params(struct snd_pcm_substream *substream,
>         snd_soc_component_update_bits(component, AK4458_0B_CONTROL7,
>                                       AK4458_DCHAIN_MASK, dchn);
>
> +       if (ak4458->drvdata->type == AK4497) {
> +               ret = snd_soc_component_update_bits(component, AK4458_09_DSD2,
> +                                                   0x4, (ak4458->dsd_path << 2));
> +               if (ret < 0)
> +                       return ret;
> +       }
> +
>         ret = ak4458_rstn_control(component, 0);
>         if (ret)
>                 return ret;
> @@ -629,48 +636,6 @@ static void ak4458_reset(struct ak4458_priv *ak4458, bool active)
>         }
>  }
>
> -static int ak4458_init(struct snd_soc_component *component)
> -{
> -       struct ak4458_priv *ak4458 = snd_soc_component_get_drvdata(component);
> -       int ret;
> -
> -       /* External Mute ON */
> -       if (ak4458->mute_gpiod)
> -               gpiod_set_value_cansleep(ak4458->mute_gpiod, 1);
> -
> -       ak4458_reset(ak4458, false);
> -
> -       ret = snd_soc_component_update_bits(component, AK4458_00_CONTROL1,
> -                           0x80, 0x80);   /* ACKS bit = 1; 10000000 */
> -       if (ret < 0)
> -               return ret;
> -
> -       if (ak4458->drvdata->type == AK4497) {
> -               ret = snd_soc_component_update_bits(component, AK4458_09_DSD2,
> -                                                   0x4, (ak4458->dsd_path << 2));
> -               if (ret < 0)
> -                       return ret;
> -       }
> -
> -       return ak4458_rstn_control(component, 1);
> -}
> -
> -static int ak4458_probe(struct snd_soc_component *component)
> -{
> -       struct ak4458_priv *ak4458 = snd_soc_component_get_drvdata(component);
> -
> -       ak4458->fs = 48000;
> -
> -       return ak4458_init(component);
> -}
> -
> -static void ak4458_remove(struct snd_soc_component *component)
> -{
> -       struct ak4458_priv *ak4458 = snd_soc_component_get_drvdata(component);
> -
> -       ak4458_reset(ak4458, true);
> -}
> -
>  #ifdef CONFIG_PM
>  static int __maybe_unused ak4458_runtime_suspend(struct device *dev)
>  {
> @@ -714,8 +679,6 @@ static int __maybe_unused ak4458_runtime_resume(struct device *dev)
>  #endif /* CONFIG_PM */
>
>  static const struct snd_soc_component_driver soc_codec_dev_ak4458 = {
> -       .probe                  = ak4458_probe,
> -       .remove                 = ak4458_remove,
>         .controls               = ak4458_snd_controls,
>         .num_controls           = ARRAY_SIZE(ak4458_snd_controls),
>         .dapm_widgets           = ak4458_dapm_widgets,
> @@ -728,8 +691,6 @@ static const struct snd_soc_component_driver soc_codec_dev_ak4458 = {
>  };
>
>  static const struct snd_soc_component_driver soc_codec_dev_ak4497 = {
> -       .probe                  = ak4458_probe,
> -       .remove                 = ak4458_remove,
>         .controls               = ak4497_snd_controls,
>         .num_controls           = ARRAY_SIZE(ak4497_snd_controls),
>         .dapm_widgets           = ak4497_dapm_widgets,
> --
> 2.34.1
>
