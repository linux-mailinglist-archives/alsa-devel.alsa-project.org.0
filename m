Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 865A3543CE3
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jun 2022 21:30:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B52381B42;
	Wed,  8 Jun 2022 21:29:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B52381B42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654716615;
	bh=qSi67Jj5m/A/4YOXRjTerjXtUIk91lX75yTzE+K4d8w=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HxMGGNQ1zNlmFgNqoCeFceg2I2KM+fTxybxsa8/04wj3xIRGhpxDBP1Emg7LIYJkr
	 EtWR/H/bdQDgEIe237yQGhp3JEx89eT3SDaqKUbVx032tjiW4jRnZu/Vs3mMt4CyvQ
	 BxuE0dzi+Hd0/MC2wHvKgbSX1VxXiBYsPrT/y0KE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE3EBF8026A;
	Wed,  8 Jun 2022 21:29:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8A6BF8024C; Wed,  8 Jun 2022 21:29:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CB32F80116
 for <alsa-devel@alsa-project.org>; Wed,  8 Jun 2022 21:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CB32F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Hd5jcwos"
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-f2cbceefb8so28450568fac.11
 for <alsa-devel@alsa-project.org>; Wed, 08 Jun 2022 12:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=5vvwrgdknn1K9gJFkCVHoS1UOMpaiXh3dfNKyE3vHCA=;
 b=Hd5jcwosS+DHrHrSRvsp1DiAbCxUrFWV4Ys2JHKBdh4xlpDyW7BhzoIfKfDx5gjQXM
 1mW+SikjxugwKvDlj4Tgp4hFCUdMfAORPCneDm8IwpDuvRUsynDdRTIVK3kwSK3+KRHw
 5rMCTq+XO6A0kbgcSWlQN+lUXklGV8Tcp6KxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=5vvwrgdknn1K9gJFkCVHoS1UOMpaiXh3dfNKyE3vHCA=;
 b=cdL/gjUyqbrH5LpCytKde6tzbpiXFJ73iz9N/Vxq64fAl6xT/vXjMZwLk5SqJWBKlF
 3Fq2pqSmB1wKZbb/MT1zha2aQHPVeRzjVrHOBQ/bKJeCpoLDJX2vUZEa1ytIGMKdQpAy
 oG8KtKn74TF3V7PIlWiPVLgkAtZGNpDv879GqOYWYNEMgqah88lfKFhXWrVjsUsxPH5X
 PzpbqzfgjWl7qAF8nW1NERVsBRrr/5cYLGH70GoXZsmWJyBlsADgzWYLiZYQzVVpHb+x
 eaNM2m7ytFlojaEknJ7FLz8CEdSP56CA0egXDNScIKgCeAn/Zuyqj70BctLA6uW8Mf61
 Wfug==
X-Gm-Message-State: AOAM532h3HH5Q19MV5tpIYUN9ldEUM2yUpoZk7tkmu8KiTWTHXEEbr+o
 EHZOe2T4jJY4/6u/s7RVb6vRCQdfKrz3L6AzOK3A6Q==
X-Google-Smtp-Source: ABdhPJwfbQOhuoavwnKuPwNYfxx7ThIu71YX1w2/3eSgITORUdWupWunN82u7ED3ykn9MRwPBeCHP/wkwS4CsJQhctI=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr3169953oap.193.1654716544865; Wed, 08
 Jun 2022 12:29:04 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 12:29:04 -0700
MIME-Version: 1.0
In-Reply-To: <1654696929-20205-3-git-send-email-quic_srivasam@quicinc.com>
References: <1654696929-20205-1-git-send-email-quic_srivasam@quicinc.com>
 <1654696929-20205-3-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 12:29:04 -0700
Message-ID: <CAE-0n53EY1eKqnVLhU__e7t63BbVoKz++6aijOpEw0k5Cxa8-w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ASoC: qcom: soundwire: Add software clock gating
 requirement check
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org, 
 alsa-devel@alsa-project.org, bgoswami@quicinc.com, bjorn.andersson@linaro.org, 
 broonie@kernel.org, devicetree@vger.kernel.org, judyhsiao@chromium.org, 
 lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 quic_rohkumar@quicinc.com, robh+dt@kernel.org, srinivas.kandagatla@linaro.org, 
 tiwai@suse.com, vkoul@kernel.org
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

Quoting Srinivasa Rao Mandadapu (2022-06-08 07:02:09)
> Validate software clock gating required or not and do software
> clock gating on hclk if soundwire is operational and keep it
> running by adding flag in private dat structure.
> This is to avoid conflict between older architectures,
> where software clock gating is not required and on latest
> architectues, where software clock gating is mandatory.

This talks about software clock gating but the code is getting a reset
and asserting it. Is that because the power on reset value of the clock
gating is to have hardware clock gating disabled, but some earlier code
is enabling hardware clock gating?

>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/soundwire/qcom.c | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 38c3bf5..ebd7479 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -659,7 +665,8 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>         val = FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, ctrl->rows_index);
>         val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, ctrl->cols_index);
>
> -       reset_control_reset(ctrl->audio_cgcr);
> +       if (ctrl->audio_cgcr)
> +               reset_control_reset(ctrl->audio_cgcr);
>
>         ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
>
> @@ -1494,7 +1506,8 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
>                 qcom_swrm_get_device_status(ctrl);
>                 sdw_handle_slave_status(&ctrl->bus, ctrl->status);
>         } else {
> -               reset_control_reset(ctrl->audio_cgcr);
> +               if (ctrl->audio_cgcr)
> +                       reset_control_reset(ctrl->audio_cgcr);

reset_control_reset() is a no-op if the pointer is NULL so the if
condition is not necessary in the above two statements.
