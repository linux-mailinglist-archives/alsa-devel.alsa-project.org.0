Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C7863BB10
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 08:54:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEA4D16A9;
	Tue, 29 Nov 2022 08:54:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEA4D16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669708493;
	bh=EXwxD/c1DwYg73B5x0ggDxcrVKGK8mFZmShroz/yd+E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dqa5r7xI9I30b2UDcFMAsw1/JhfumsPGIX3cPvPoq6Jp5RwRtPwz85nCmG++CUEDs
	 Yex2cTULBVCEOJqyvOJvOYDpLIl6V5KnwJiTiuDak/afLjkSBF0j4CziMMvsXKW+3+
	 ldinmY9ZvabD7XdkswWES95QAOufIWe/w1UX+xkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DF48F80212;
	Tue, 29 Nov 2022 08:53:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01125F801F7; Tue, 29 Nov 2022 08:53:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C264AF80137
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 08:53:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C264AF80137
Received: by mail-qt1-f174.google.com with SMTP id h16so8400861qtu.2
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 23:53:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bDVov8d4BN3qgelRFS6S1eSfJ2eIIEzv+2+tNAw/t+c=;
 b=Ys59UmgS66HGVIZkGUYpE9COgnUWNn2YVcF/UXYbkQX50TGBBPKJCnBYOYh2x/Y2Ew
 pLtV0to1RrNEtYw8H7I+2jn2cDIopZKScN4mQpfktKrtG5riUpWKbpZAJCJg/4pXjuup
 9ueDY0mHI7v/beN9TH/QequXMEcDpcrJFg6Bp7uUrZvN+EFoIUCOEGiPF3r19/KEoQwK
 xC8jC02JB615cCHLa9k7syXLLSRpz3wubUNCw5bz8QPezWGksn8rnpyPyN4wUo4Gy3um
 pTfhpzG0poXhpII5y7zb6gk9O3foOxJVjoOh2oO4S3ONd0BU7j76ArX/1l4CD21G1I1J
 HUUQ==
X-Gm-Message-State: ANoB5pnMiiDiJ4UaRL+6veSIXnAyjZJjKbov3pdPH0z4vqDB6gSaG/6r
 vveFa/HkSvfXfAYe4TIhya/R0CGYZ++jqA==
X-Google-Smtp-Source: AA0mqf72H11P5wEoLdnbw0u/sws1PCWRQZbxlmjwL3EHaHeNqZ4PIp/PnnH0UYhhO9Lx+7gYIkFj8w==
X-Received: by 2002:ac8:7154:0:b0:399:2e73:5498 with SMTP id
 h20-20020ac87154000000b003992e735498mr50558563qtp.36.1669708429173; 
 Mon, 28 Nov 2022 23:53:49 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 az36-20020a05620a172400b006fc3fa1f589sm10103153qkb.114.2022.11.28.23.53.46
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 23:53:47 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id z192so16454732yba.0
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 23:53:46 -0800 (PST)
X-Received: by 2002:a25:bcc6:0:b0:6dd:1c5c:5602 with SMTP id
 l6-20020a25bcc6000000b006dd1c5c5602mr54295291ybm.36.1669708426532; Mon, 28
 Nov 2022 23:53:46 -0800 (PST)
MIME-Version: 1.0
References: <1669621742-28524-1-git-send-email-quic_srivasam@quicinc.com>
In-Reply-To: <1669621742-28524-1-git-send-email-quic_srivasam@quicinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Nov 2022 08:53:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUBojHkaAPsjOEadfaikth+L0R_NrKzvqXrmZS9Kc5zHw@mail.gmail.com>
Message-ID: <CAMuHMdUBojHkaAPsjOEadfaikth+L0R_NrKzvqXrmZS9Kc5zHw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-sc7180: Add system suspend/resume PM ops
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, broonie@kernel.org, bgoswami@quicinc.com,
 quic_plai@quicinc.com, swboyd@chromium.org, judyhsiao@chromium.org,
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

Hi Srinivasa,

On Mon, Nov 28, 2022 at 8:50 AM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:
> Update lpass sc7180 platform driver with PM ops, such as
> system supend and resume callbacks.
> This update is required to disable clocks during supend and
> avoid XO shutdown issue.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Rahul Ajmeriya <quic_rajmeriy@quicinc.com>

Thanks for your patch, which is now commit 2d68148f8f85ca5a ("ASoC:
qcom: lpass-sc7180: Add system suspend/resume PM ops") in next-20221129.

> --- a/sound/soc/qcom/lpass-sc7180.c
> +++ b/sound/soc/qcom/lpass-sc7180.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <dt-bindings/sound/sc7180-lpass.h>
>  #include <sound/pcm.h>
>  #include <sound/soc.h>
> @@ -156,10 +157,34 @@ static int sc7180_lpass_exit(struct platform_device *pdev)
>         struct lpass_data *drvdata = platform_get_drvdata(pdev);
>
>         clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
> +       return 0;
> +}
> +
> +static int sc7180_lpass_dev_resume(struct device *dev)
> +{
> +       int ret = 0;
> +       struct lpass_data *drvdata = dev_get_drvdata(dev);
>
> +       ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
> +       if (ret) {
> +               dev_err(dev, "sc7180 clk prepare and enable failed\n");
> +               return ret;
> +       }
> +       return ret;
> +}
> +
> +static int sc7180_lpass_dev_suspend(struct device *dev)
> +{
> +       struct lpass_data *drvdata = dev_get_drvdata(dev);
> +
> +       clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
>         return 0;
>  }

noreply@ellerman.id.au reports for e.g. m68k-allmodconfig:

    sound/soc/qcom/lpass-sc7180.c:179:12: error:
'sc7180_lpass_dev_suspend' defined but not used
[-Werror=unused-function]
    sound/soc/qcom/lpass-sc7180.c:166:12: error:
'sc7180_lpass_dev_resume' defined but not used
[-Werror=unused-function]

>
> +static const struct dev_pm_ops sc7180_lpass_pm_ops = {
> +       SET_SYSTEM_SLEEP_PM_OPS(sc7180_lpass_dev_suspend, sc7180_lpass_dev_resume)
> +};

Please use DEFINE_SIMPLE_DEV_PM_OPS()...

> +
>  static struct lpass_variant sc7180_data = {
>         .i2sctrl_reg_base       = 0x1000,
>         .i2sctrl_reg_stride     = 0x1000,
> @@ -293,6 +318,7 @@ static struct platform_driver sc7180_lpass_cpu_platform_driver = {
>         .driver = {
>                 .name = "sc7180-lpass-cpu",
>                 .of_match_table = of_match_ptr(sc7180_lpass_cpu_device_id),
> +               .pm = &sc7180_lpass_pm_ops,

... and pm_sleep_ptr().

>         },
>         .probe = asoc_qcom_lpass_cpu_platform_probe,
>         .remove = asoc_qcom_lpass_cpu_platform_remove,

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
