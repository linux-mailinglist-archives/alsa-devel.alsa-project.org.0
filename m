Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B07C5399A89
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Jun 2021 08:18:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 477FE16F3;
	Thu,  3 Jun 2021 08:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 477FE16F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622701123;
	bh=qg2SWTVhxNrduUv0L9IfbFuQZRcTOXd3U87lWeaUwso=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hoq+ezrmvZyHtxFVK0GWSmEfw1C6GYHGdrE+hv70DiwKvzvFJYQR5FDVCQNgY+XNX
	 Bi3Ij0h51W4Ma/Gi4y4cdnU3IfQCIEmY+UFFajrpQKOIpDDy9dauA5CgEiD+ATT+H8
	 cGCG1UP2k5v3a/IpqDOZ1SXzag3MbwSmrmRdci0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7AF7F80253;
	Thu,  3 Jun 2021 08:17:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E52C6F80254; Thu,  3 Jun 2021 08:17:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86191F80100
 for <alsa-devel@alsa-project.org>; Thu,  3 Jun 2021 08:17:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86191F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="m+a8Q1Up"
Received: by mail-ot1-x330.google.com with SMTP id
 i14-20020a9d624e0000b029033683c71999so4773752otk.5
 for <alsa-devel@alsa-project.org>; Wed, 02 Jun 2021 23:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=AORJO5loH8P1GCxBtXakps2SGxdj+XmHegIFz60ntSY=;
 b=m+a8Q1UpsGAwg2QV2ag3baMSuw4sbbIdKA/R3hm/N9Rbev/uihCBU+7ucdJCdo4I1B
 sN1FtF3Cn2NxdCrssZOG1BR3kj7NBLlERFQXgAB7OGtNUtF3rf9WinaAi86Z9EecPKOl
 Zp0/gqK7Ib3OXxPjeLHNnEAowBmn5c7TGgWq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=AORJO5loH8P1GCxBtXakps2SGxdj+XmHegIFz60ntSY=;
 b=q9PRxGo6sIVPdrsB8W8rzpyU6XHYljVpxzF4ZgyuaVxi6XfvjIYskM02b+neEAweyL
 57+NfYW5oI725i2G1fcb155Ax8ANcgNhYWTNtqZ+dR8nZE8Mf9lnG0YW9FQjFXkEb/Dp
 2U0MqtBWyOXiPYMYK8YOwf2/Wc3cYQXq2CW399s5IaDnfEIcsChHOMdmOX3iA5vOse9Y
 4dArVCnKkMB6E68+X/RYCjU3CGe5Pzg2pWhZnoim8whwf4OjwfhuLb1EcmTChDThutGd
 ni8zWYmmimqBOEUnnp8818RN5ROK/z16asUBc3F4prtO0A/oZVDDAKkJ8V+PIR0t60xG
 xcSQ==
X-Gm-Message-State: AOAM531C11e84SAVE05/vpBfxMIcOY2/YZI1UsFt6XI8Zeq83GnoCYhk
 iaMuZAy/V7xkL13902JmSQyFLP4WGerwlQAcFe8AGg==
X-Google-Smtp-Source: ABdhPJxyYLeIoldjWEenrhIDKjwGFGHgDtAWhmJTqgX+kVi9DQAsE9OwTaUuSW0wIJ7tz1YPkk2udKnCFrsX4wlP32g=
X-Received: by 2002:a9d:18e:: with SMTP id e14mr9745672ote.34.1622701022184;
 Wed, 02 Jun 2021 23:17:02 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Jun 2021 23:17:01 -0700
MIME-Version: 1.0
In-Reply-To: <20210603050530.15898-1-srivasam@codeaurora.org>
References: <20210603050530.15898-1-srivasam@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 2 Jun 2021 23:17:01 -0700
Message-ID: <CAE-0n52CyZkRDForR7LumXL7Tcr=48UV7T-wxirMsxk7AJJsmg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: Fix for DMA interrupt clear reg overwriting
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 plai@codeaurora.org, robh+dt@kernel.org, rohitkr@codeaurora.org, 
 srinivas.kandagatla@linaro.org, tiwai@suse.com
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

Quoting Srinivasa Rao Mandadapu (2021-06-02 22:05:30)
> This patch fixes the DMA interrupt registers overwriting

 $ git grep "This patch" -- Documentation/process

> issue in lpass platform interrupt handler.

Can you describe the issue more?

>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---

Any Fixes tag?

>  sound/soc/qcom/lpass-platform.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 0df9481ea4c6..e02caa121fa4 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -650,7 +650,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>         struct lpass_variant *v = drvdata->variant;
>         irqreturn_t ret = IRQ_NONE;
>         int rv;
> -       unsigned int reg = 0, val = 0;
> +       unsigned int reg = 0, val = 0, val_clr = 0, val_mask = 0;

Why assign to 0 and then overwrite it?

>         struct regmap *map;
>         unsigned int dai_id = cpu_dai->driver->id;
>
> @@ -676,8 +676,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
>         return -EINVAL;
>         }
>         if (interrupts & LPAIF_IRQ_PER(chan)) {
> -
> -               rv = regmap_write(map, reg, LPAIF_IRQ_PER(chan) | val);
> +               val_clr = (LPAIF_IRQ_PER(chan) | val);

Is the extra parenthesis useful?

> +               val_mask = LPAIF_IRQ_ALL(chan);
> +               rv = regmap_update_bits(map, reg, val_mask, val_clr);
>                 if (rv) {
>                         dev_err(soc_runtime->dev,
>                                 "error writing to irqclear reg: %d\n", rv);
