Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A458D63B26B
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 20:41:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 364E3167A;
	Mon, 28 Nov 2022 20:40:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 364E3167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669664477;
	bh=OI/0rGeH29W/Qi0bg3fyNOOdgHvcLPUBpxGeKQ2GEEU=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vTnRQse9fd4wMQfbzSs9KrrVi6MNgsy37+Yxbn2PpmsNYip3dd00v9ynrvcbtVVTT
	 Lr20w2J++dLq5JBfFWBs+Kxm2kz0zR4w4wPDGUqP7ZVWOQjw8ELTNzmCxDSqyDX7/i
	 +aknsla3pdQfjtwGLJL2Xb33xkyOOeAIkLUiyua4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE882F80166;
	Mon, 28 Nov 2022 20:40:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C16BF8020D; Mon, 28 Nov 2022 20:40:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36A35F80166
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 20:40:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36A35F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="iNMVlHUs"
Received: by mail-lf1-x12b.google.com with SMTP id p8so19041465lfu.11
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 11:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=to:subject:message-id:date:user-agent:from:references:in-reply-to
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1X++ZaligKAG6LkPIexjBiKopBxcNHqsvb5zqb0R6nA=;
 b=iNMVlHUsjwLrJrks1vvhHe/Geot63a1ksPxeCQISSqZ5aiG1tgo4oa/KdGa57JHE/I
 eijJCwMYSV0g3fUD/A5aYsouMPOtpihSAoBEes0tXXhJESjomdESVMMuNeSegOkWGIJS
 vlh/kTi5uVAuV119WsBjOQuIPe0NIRmODt3Ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:user-agent:from:references:in-reply-to
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1X++ZaligKAG6LkPIexjBiKopBxcNHqsvb5zqb0R6nA=;
 b=DuAXKQQE0PRj/+tJZzEeNCLyngjYtCwKv5IGYqJwyEuzzUS3fqresjCsq9QFMiTiYh
 ipQGYUHDHB5DcQ9Ma6FLWDP5nHgiEgzjVHmlFxGvPRmvG69RPbEa66YCYQR4PVfSXhp6
 Cdvpig1Jj504jTXKHbCHE+SKoy9j3Vxg9xZlSyAPJjmXekXUrr66XsosMCZBjLzuiSDk
 OsuWkaA0TAgrRBpvQeXUTSFlecbflZ4obQJBdr0ls7q1EVGs49oiT3YOEFJ0Km7LUKHy
 2TUt0PSokXUdHn1aDfTuh0aTga7cOBrdrsyv91tMvg8lAJzYeEwLe/a74wLG5TDlSghC
 bVYQ==
X-Gm-Message-State: ANoB5pm17PDS7XWUBJLWOCyT3F56js6EejXH5u+iuVBkTLMsxhELWo9e
 wP9fC3DcTPPAaLA5Fr7Zg1bsDI3FzVkDg5u7dKChOg==
X-Google-Smtp-Source: AA0mqf6V3sD0dfIeXkvuFyXVlvYnyFq1swuenyPZM4OvYIuywP3NvLESQNKs2ZpfMxSP9GcQI9ETNaPM19XxIazd1VA=
X-Received: by 2002:a05:6512:33d1:b0:4b5:1c86:9267 with SMTP id
 d17-20020a05651233d100b004b51c869267mr1501925lfg.297.1669664410971; Mon, 28
 Nov 2022 11:40:10 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Nov 2022 14:40:10 -0500
MIME-Version: 1.0
In-Reply-To: <1669621742-28524-1-git-send-email-quic_srivasam@quicinc.com>
References: <1669621742-28524-1-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 28 Nov 2022 14:40:10 -0500
Message-ID: <CAE-0n519fURgt4x-4maBGBEm-OWk7rbfRgNJNzR-XDcMB5b4jA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-sc7180: Add system suspend/resume PM ops
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org, 
 alsa-devel@alsa-project.org, andersson@kernel.org, bgoswami@quicinc.com, 
 broonie@kernel.org, devicetree@vger.kernel.org, judyhsiao@chromium.org, 
 lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 quic_rohkumar@quicinc.com, robh+dt@kernel.org, srinivas.kandagatla@linaro.org, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
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

Quoting Srinivasa Rao Mandadapu (2022-11-27 23:49:02)
> Update lpass sc7180 platform driver with PM ops, such as
> system supend and resume callbacks.
> This update is required to disable clocks during supend and
> avoid XO shutdown issue.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Rahul Ajmeriya <quic_rajmeriy@quicinc.com>
> ---
>  sound/soc/qcom/lpass-sc7180.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
> index 77a556b..6ad1c5b 100644
> --- a/sound/soc/qcom/lpass-sc7180.c
> +++ b/sound/soc/qcom/lpass-sc7180.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>

Why is this include needed? Did you mean to include linux/pm.h?

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

Please don't assign ret and then assign it again. It hides use before
true assignment bugs.

> +       struct lpass_data *drvdata = dev_get_drvdata(dev);
>
> +       ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
> +       if (ret) {
> +               dev_err(dev, "sc7180 clk prepare and enable failed\n");
> +               return ret;
> +       }
> +       return ret;

This could be simplified to

	ret = clk_bulk_prepare_enable(...);
	if (ret)
		dev_err(dev, ...);

	return ret;
