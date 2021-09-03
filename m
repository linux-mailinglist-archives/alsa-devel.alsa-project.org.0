Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E45400501
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 20:42:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F425189D;
	Fri,  3 Sep 2021 20:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F425189D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630694538;
	bh=Qbxmgpz2YL2FVpsPcr9LR4/FZNthYuNOnyhR2cLDYEU=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GK1VcdnIqcDRZ2azBo1EDwa/4zGeSF1TfATtyo7ii75iH7fwg9sOMpIKjY8WAY5+W
	 xboHywpR2BVQWl5g+FmrBcXNTwcV7RfJBFGO+V6KWQk1CKj88cbc9hFG5VpF79cTxE
	 qOyurQszA4sKhdxH5aRHYz/6mx8/4X/yM6/UloB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B08EF80256;
	Fri,  3 Sep 2021 20:41:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37BF5F80254; Fri,  3 Sep 2021 20:41:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC05CF8020D
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 20:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC05CF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="S43gOar8"
Received: by mail-ot1-x32f.google.com with SMTP id
 c42-20020a05683034aa00b0051f4b99c40cso212484otu.0
 for <alsa-devel@alsa-project.org>; Fri, 03 Sep 2021 11:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=g+/vVt6JhLLpX1/epBxESaopp8FQHhl77WcdHs+7WkE=;
 b=S43gOar878bmf2S/ybLy8S+qmYwiuKKN1YQkjyxZG7PrBlEr3oytcmYjl8Zvz/gTwh
 YbECImb7dEdGWbCX75zbh/ITV1FIttFEputYDhGJvuRSvPJT4vICkU9+05sCPwKXXcHa
 DPSw9qv85JWv8adTg+5LDsvHRDpraHZeLUVZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=g+/vVt6JhLLpX1/epBxESaopp8FQHhl77WcdHs+7WkE=;
 b=BwXHPFcveuUlbhiR1fnY6xaudjckIw5LNJMuUBklMz2wwnpEYsd+M5NZg/DGxm1NZn
 rkYCEK2eiSntNHVd314QY79pcPzMKhDZzN/BvgM+MsovSBxSBRe9sjJdk1Wt9P3uwwx6
 sBqj26j41Q3lpMEW5ok8G3+BnWz/JBUDmRKX1JUp6MfbYz/hEEQbjObHuPBUEjI/p2so
 uYow7z2GSBWlYXvNxQqvoIAbERkWxfujuhuX9EHkLG+oLCN1jc/TB4S0TuipWN9wIioy
 DjMEnz6rUxA52t3OkDUu4k+h/4TRYJyZuCowr3XypgEH3u3TRFz1lw3dqOpdmXk+Tkbe
 fNSQ==
X-Gm-Message-State: AOAM533dNBPU7N8D9zSr2umuDxhJpWQQNEfF824o4c6sn8lYFEcd0h5A
 dpjv6ANczSS75vfeJVk15zC24XUSz8s13nzb8yecnw==
X-Google-Smtp-Source: ABdhPJycPSV0nBgcq0hjBFC/o2cbbIgqzAp7Pb8hkvRUJrUsZwaG0a7ygKqi477f1CU9FYwgWjubKMEef81F9cz435c=
X-Received: by 2002:a05:6830:719:: with SMTP id
 y25mr380633ots.77.1630694445434; 
 Fri, 03 Sep 2021 11:40:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Sep 2021 14:40:45 -0400
MIME-Version: 1.0
In-Reply-To: <20210903100153.9137-1-srivasam@codeaurora.org>
References: <20210903100153.9137-1-srivasam@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 3 Sep 2021 14:40:45 -0400
Message-ID: <CAE-0n50=vL0MHHHkc22ahrqqD3DskFXZzFU8qjU8=EY1kZ+__Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-platform: Reset irq clear reg post
 handling interrupts
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

Quoting Srinivasa Rao Mandadapu (2021-09-03 03:01:53)
> Update interrupt clear register with reset value after addressing
> all interrupts. This is to fix playback or capture hanging issue in
> simultaneous playback and capture usecase.
>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---

Any Fixes tag?

>  sound/soc/qcom/lpass-platform.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index f9df76d37858..1a0a4b0b1a03 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -749,6 +749,12 @@ static irqreturn_t lpass_platform_lpaif_irq(int irq, void *data)
>                 }
>         }
>
> +       rv = regmap_write(drvdata->lpaif_map, LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST), 0x0);
> +       if (rv) {
> +               pr_err("error writing to irqstat reg: %d\n", rv);
> +               return IRQ_NONE;

I was thinking we should return IRQ_HANDLED still, but then I guess
failing to clear the irq be treated as a spurious irq so that if we fail
enough times we'll shut off the irq at the irqchip. Things are going bad
if the write fails.

> +       }
> +
>         return IRQ_HANDLED;
>  }
>
