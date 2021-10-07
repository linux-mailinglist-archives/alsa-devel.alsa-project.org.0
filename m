Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D4D425A14
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 19:55:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0A72165E;
	Thu,  7 Oct 2021 19:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0A72165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633629343;
	bh=kXmYIZPxrUBan0oMYvtTsYmEyCTNwrfttzKXM4PxWHo=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tZbom7ld3MZ96Vu11OM3ZVIURkqzAxTHr/SscgljO7imPJMeMPLQADARCpUpBHhk+
	 ZTVCywIjvGIKg+WgUnDmy/4GmsUJBWhS9pxcrqPCeOm0QnVdm0U/sq51UhHnVGKurw
	 JFi7H3t8y4Hoclwptn8GnZ+rxwODGiy4JhRyZA8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 810C7F800F0;
	Thu,  7 Oct 2021 19:54:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C395EF8027D; Thu,  7 Oct 2021 19:54:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66E80F80130
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 19:54:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66E80F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="fibgMhQW"
Received: by mail-oi1-x22f.google.com with SMTP id s24so10083865oij.8
 for <alsa-devel@alsa-project.org>; Thu, 07 Oct 2021 10:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ZApifAfSd7xSshpr/sUxHr3xYp1pLLomLCFKliEgdTo=;
 b=fibgMhQWg4plwc/oDBxVmsaY1sPz+UMaaOhVHoXLGf2ho/fjdq1nvo3RWq++NfQXnv
 Y7zbCLFEcxnAzjx7+vkDxaBpF03k/95kwakILe3IgsLoKfuVCue756wC5YYPLMe37cOk
 jinpdxwYMDiRFh7Vn7zu/1/mqfU8Ck5J770UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ZApifAfSd7xSshpr/sUxHr3xYp1pLLomLCFKliEgdTo=;
 b=sMtNaeF6XpZ8P4kls5MPCj2v2l/bKkER/BJCbkIj5MqZfSWFffXEtguD2otqnYZ3lY
 zxFcdlkrN6FiiKndFxog8v5AvA7yfWlINz3eGgDxG2i/MygHPogOx+cdtPx9R2t9KlDl
 EZkwBi6+6iEClRA5yquTUCNN9+u4iKnYa2u93Wgu7J+7juAjEeSe8+Z/ONHlqHXYqYQ/
 Wy+LmzD2ALjAtPd6lu2i/wMpPFh3sewgrwCFXgFI5hXohaV58z08vaV9MUr6N1LskTpf
 7HjhoSrAMNIZs3k5pqGz5P48jIUVr/qj4i6ENTdD5KWfW7LTqhLG9cdGveZl6Qt9ssLv
 QWaw==
X-Gm-Message-State: AOAM531OAvq4leTNifuZIQBSzk/BeKkyM2YSuLH08FRKHoj6mGGva/yY
 iATmLFLNQ8CF2dwSZKVzKzZZGF48yN4+q+HWAnQTxw==
X-Google-Smtp-Source: ABdhPJzer7jLB28aIBeMpuO+LH9S7TJN5mH1yWD95x/J+s29nDUp/kNabPWn+JQVCK2eQyOyGVJML/1np5GW9StH6v4=
X-Received: by 2002:aca:f02:: with SMTP id 2mr4323517oip.64.1633629255319;
 Thu, 07 Oct 2021 10:54:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 13:54:14 -0400
MIME-Version: 1.0
In-Reply-To: <1633614519-26680-4-git-send-email-srivasam@codeaurora.org>
References: <1633614519-26680-1-git-send-email-srivasam@codeaurora.org>
 <1633614519-26680-4-git-send-email-srivasam@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 7 Oct 2021 13:54:14 -0400
Message-ID: <CAE-0n53SqOHKDpMQicrFNmZ1YxAPesTAk4j6kJVi3xMV8re4-w@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: qcom: Add SC7280 lpass pin configuration
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 plai@codeaurora.org, robh+dt@kernel.org, rohitkr@codeaurora.org, 
 srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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

Quoting Srinivasa Rao Mandadapu (2021-10-07 06:48:39)
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index c0117c5..0b68065 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -237,6 +264,15 @@ static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
>         .nfunctions = ARRAY_SIZE(lpass_functions),
>  };
>
> +static struct lpi_pinctrl_variant_data sc7280_lpi_data = {

Can this variant data be const?

> +       .pins = lpass_lpi_pins,
> +       .npins = ARRAY_SIZE(lpass_lpi_pins),
> +       .groups = sc7280_groups,
> +       .ngroups = ARRAY_SIZE(sc7280_groups),
> +       .functions = lpass_functions,
> +       .nfunctions = ARRAY_SIZE(lpass_functions),
> +};
> +
>  static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>                          unsigned int addr)
>  {
