Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 921F84F826D
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 17:05:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D79F17E7;
	Thu,  7 Apr 2022 17:04:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D79F17E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649343903;
	bh=Q0tvyMgrRG1Y6LWdfYWRME6IfjOmiMk9W+6OouzIVjQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vk48ZMkZnuM/neOonyEhuOP6Ykb0iT+VAYCHKAl1mSpC4ht7fMtnmsh0kg/yUP7Zd
	 9wL3th6UrFA4ex2lcUbEcKIKw9sYbRo2KhRjVge9BlMzpt6MS1pG59nIEajis0tOhM
	 6eusPnOCY/71MXSitOy8MtfKnpZMTwfwRFX7gR2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BA48F8026A;
	Thu,  7 Apr 2022 17:04:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63BCFF8024C; Thu,  7 Apr 2022 17:04:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E41B6F80085
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 17:03:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E41B6F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FLez84DF"
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2eb46d33db9so64604477b3.12
 for <alsa-devel@alsa-project.org>; Thu, 07 Apr 2022 08:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GIG8eITub5ogM33DPsV6tmuNTcczx7G73Grseyf/5Co=;
 b=FLez84DFS+Q/p+XWcJvWc5GDQ8rqVivTZkQ3ETtGZvt5iSXcjOUnfpFnZGkIn8J8la
 fpfOqEkZWpSguThsYcB/LPft8jiUEHkRl8IA9cCrZohWHVbzz6UMHKSv57KNbuYb1iU2
 NttKMVjOlcrh2prhKLcJXNkPWyvA3Mo6nPrB1p1d0kZH5ZSnF1RdisGm8OVXX9NtWQUk
 Ilc6Z6BRZQxE1QTiDh8vC4FQ94pgmcwkCZYb6wjMfSEcVjnOrc4og98vY5xx8dQK+mmQ
 lVblTImyXA+3XMOte8xoeQdQOUWrUmpNxZtd2s+NTRb/fMxochIYuOVlewgLGPFP4A2U
 aRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GIG8eITub5ogM33DPsV6tmuNTcczx7G73Grseyf/5Co=;
 b=RhHX0Y0HfkGqs445RNGcfBah/w927yuIUyIndhxTJQ+65DhpkEf8HCgt9iJ0lIQiCO
 17vKe9yX4GkAuIRApCYNjzk96NFvSAjdkc6ubjOjY9oIVg7qg3qVm3n626iL4zYw8pFi
 FTYhn5Nbgr6NvweWYSmHtsS8oKdrikABMWjgH3lhsvB6QixCXfOggJzt/VSuzFgz4Jek
 R28Ooaf9muamBqdmcFnW99RRhd7WGK/kWbVnl7+eopdyTu8lTFKU9w7khrF252fU1P2c
 tEZMijkMQ6nXR0tMfRqUS2DmUr5j8KMXwnFSXH8g9DmjJqKoShIK/tFoiPogAdgVN/75
 4Hwg==
X-Gm-Message-State: AOAM531FWAmd9OutiJKHJqUHaGKoMh4WTNE3nK/ruRZrcKuMLxC88W/O
 OAYr3ncijUAWja2vrzoNXAUuE+ZjDs1LdTvgNDgJcQ==
X-Google-Smtp-Source: ABdhPJxeUEHVfts2fspg79ZAgfj8jTrrFsDIHIROyfSbclEZlOXiXVBpwsf+uE8fRplGdoUuYMdlKiNL5J3M1gT6jjg=
X-Received: by 2002:a81:18d7:0:b0:2eb:553e:f3ee with SMTP id
 206-20020a8118d7000000b002eb553ef3eemr11732195ywy.393.1649343831843; Thu, 07
 Apr 2022 08:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220407094313.2880-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20220407094313.2880-1-srinivas.kandagatla@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Thu, 7 Apr 2022 20:33:15 +0530
Message-ID: <CAMi1Hd3v3KPVP15KLriDWsQFOuToee5F7JVDpMNrY-nnnXCnYQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: codecs: wcd934x: do not switch off SIDO Buck when
 codec is in use
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, broonie@kernel.org
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

On Thu, 7 Apr 2022 at 15:13, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> SIDO(Single-Inductor Dual-Ouput) Buck powers up both analog and digital
> circuits along with internal memory, powering off this is the last thing
> that codec should do when going to very low power.
>
> Current code was powering off this Buck if there are no users of sysclk,
> which is not correct. Powering off this buck will result in no register access.
> This code path was never tested until recently after adding pm support
> in SoundWire controller. Fix this by removing the buck poweroff when the
> codec is active and also the code that is not used.
>
> Without this patch all the read/write transactions will never complete and
> results in SLIMBus Errors like:
>
> qcom,slim-ngd qcom,slim-ngd.1: Tx:MT:0x0, MC:0x60, LA:0xcf failed:-110
> wcd934x-codec wcd934x-codec.1.auto: ASoC: error at soc_component_read_no_lock
>         on wcd934x-codec.1.auto for register: [0x00000d05] -110
> qcom,slim-ngd-ctrl 171c0000.slim: Error Interrupt received 0x82000000
>

Thanks Srinivas. It fixes the above regression I see on DB845c and
Xiaomi Pocophone F1 running AOSP with v5.18-rc1.

Tested-by: Amit Pundir <amit.pundir@linaro.org>

> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> Fixes: a61f3b4f476e ("ASoC: wcd934x: add support to wcd9340/wcd9341 codec")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/wcd934x.c | 26 +-------------------------
>  1 file changed, 1 insertion(+), 25 deletions(-)
>
> diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
> index 1e75e93cf28f..6298ebe96e94 100644
> --- a/sound/soc/codecs/wcd934x.c
> +++ b/sound/soc/codecs/wcd934x.c
> @@ -1274,29 +1274,7 @@ static int wcd934x_set_sido_input_src(struct wcd934x_codec *wcd, int sido_src)
>         if (sido_src == wcd->sido_input_src)
>                 return 0;
>
> -       if (sido_src == SIDO_SOURCE_INTERNAL) {
> -               regmap_update_bits(wcd->regmap, WCD934X_ANA_BUCK_CTL,
> -                                  WCD934X_ANA_BUCK_HI_ACCU_EN_MASK, 0);
> -               usleep_range(100, 110);
> -               regmap_update_bits(wcd->regmap, WCD934X_ANA_BUCK_CTL,
> -                                  WCD934X_ANA_BUCK_HI_ACCU_PRE_ENX_MASK, 0x0);
> -               usleep_range(100, 110);
> -               regmap_update_bits(wcd->regmap, WCD934X_ANA_RCO,
> -                                  WCD934X_ANA_RCO_BG_EN_MASK, 0);
> -               usleep_range(100, 110);
> -               regmap_update_bits(wcd->regmap, WCD934X_ANA_BUCK_CTL,
> -                                  WCD934X_ANA_BUCK_PRE_EN1_MASK,
> -                                  WCD934X_ANA_BUCK_PRE_EN1_ENABLE);
> -               usleep_range(100, 110);
> -               regmap_update_bits(wcd->regmap, WCD934X_ANA_BUCK_CTL,
> -                                  WCD934X_ANA_BUCK_PRE_EN2_MASK,
> -                                  WCD934X_ANA_BUCK_PRE_EN2_ENABLE);
> -               usleep_range(100, 110);
> -               regmap_update_bits(wcd->regmap, WCD934X_ANA_BUCK_CTL,
> -                                  WCD934X_ANA_BUCK_HI_ACCU_EN_MASK,
> -                                  WCD934X_ANA_BUCK_HI_ACCU_ENABLE);
> -               usleep_range(100, 110);
> -       } else if (sido_src == SIDO_SOURCE_RCO_BG) {
> +       if (sido_src == SIDO_SOURCE_RCO_BG) {
>                 regmap_update_bits(wcd->regmap, WCD934X_ANA_RCO,
>                                    WCD934X_ANA_RCO_BG_EN_MASK,
>                                    WCD934X_ANA_RCO_BG_ENABLE);
> @@ -1382,8 +1360,6 @@ static int wcd934x_disable_ana_bias_and_syclk(struct wcd934x_codec *wcd)
>         regmap_update_bits(wcd->regmap, WCD934X_CLK_SYS_MCLK_PRG,
>                            WCD934X_EXT_CLK_BUF_EN_MASK |
>                            WCD934X_MCLK_EN_MASK, 0x0);
> -       wcd934x_set_sido_input_src(wcd, SIDO_SOURCE_INTERNAL);
> -
>         regmap_update_bits(wcd->regmap, WCD934X_ANA_BIAS,
>                            WCD934X_ANA_BIAS_EN_MASK, 0);
>         regmap_update_bits(wcd->regmap, WCD934X_ANA_BIAS,
> --
> 2.21.0
>
