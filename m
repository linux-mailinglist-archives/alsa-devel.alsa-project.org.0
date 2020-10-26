Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E88929906B
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 16:03:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66AC516A9;
	Mon, 26 Oct 2020 16:02:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66AC516A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603724603;
	bh=zzpljmwXVCznG6eGinb5S8m1DmP4tl3yQ/7xVyZK5ls=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TJhXATnivbkIK0D9nhDnUVircfmgzvArwmr7nZBuuENmY+MCr5euG1vfwIOyE0Qy+
	 cbJpiN9zeXGMDKBu714lmahQgJUbugD8ZojxKVPnOgu1wWtoGpewc8NCgD02nzLgEt
	 014+fuyiZBiAzbPfbeN4mPIDGtrKGU60BMebkLYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37573F80249;
	Mon, 26 Oct 2020 16:01:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8ABEBF80212; Mon, 26 Oct 2020 16:01:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF417F800CC
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 16:01:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF417F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="uXgwrHyo"
Received: by mail-wr1-x443.google.com with SMTP id t9so12957216wrq.11
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 08:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U97g4DPk37yBTbr4sK3d+QCMl4K1OpjO58zJeloILjc=;
 b=uXgwrHyoB/oVh3VPXCniZeS4cme8VQiCH4mJUmf6fVFsiJN8mC6nzwHz7tC7EytqYj
 CYZOV4+jlcL+Lnwom/Y/MzEXEyGvOsAk4/W2ZB7rIus+ZQdJ/Ks2SNbvhRK8F87shls9
 Lw4JZBQbl9pfHwKgQuaAMIA5khCEmy7TAyQgZNi9hgsm4wgru7pbE447D3lSzDmF+s2t
 k5XtQtIjhJ8JiyGsOK5VdEcFmVWzcEt4Y38gT3sbizazWSA+54IJEjmEYhi+NeVYt9no
 xKIJoIFKtET6z4mPQj08LxJguvP1H5cqHgwChbub9D5MfAWYZ6nPUHuQp25epRa/HGhk
 wLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U97g4DPk37yBTbr4sK3d+QCMl4K1OpjO58zJeloILjc=;
 b=rP4fGmGGvdRlkkkBezfhFLlngh1ehWyKj86Vl/oCqadDZ1m5i+meLX1MAeKklbw8u2
 nZkK/2pjRNm/LdTkMIiD+AgSYiPV6rFWkEY1vn//pefQgN/r4ti+oxyde052jRjR6ari
 r2VKIPIN8Wcd67oUQUkeqzg3Lzh58Nk+xzYFUmKXGT9+TyrJViTa+5W5dB2v4OHEI0kN
 5u01KwdKEawXSbVeB0SAXphJaqV6ilEWI2LYAlWW/WyiEd1T4cB5uMt7cYu+IuXjl2SC
 pbEW1IaQRd/5Pfzn0ez2yGBxftn7agRt7I+F7pMJqrACX/Rr08/4xF8YUD7kNuqklsBQ
 W96g==
X-Gm-Message-State: AOAM532WaSX/58Lp+H42H6iVFbkRfoU1TyEXA3nUcIRlEdqp9WOcI0OM
 vy+sW4gLDqIP+bt+327vnnHxqA==
X-Google-Smtp-Source: ABdhPJwwb/Bivg+EAjiajD6Nc7JOqnZTCvtVkr5/QG5ozwvdx65HSpznlKuBPwU9mfAMsDDOYJjP8g==
X-Received: by 2002:adf:e4c4:: with SMTP id v4mr18073433wrm.79.1603724496207; 
 Mon, 26 Oct 2020 08:01:36 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id w11sm22317715wrs.26.2020.10.26.08.01.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Oct 2020 08:01:35 -0700 (PDT)
Subject: Re: [PATCH] Asoc: qcom: lpass-sc7180: Fix MI2S bitwidth field bit
 positions
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1603373219-19374-1-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <335f1d55-8a85-8501-fd69-0397f44e21af@linaro.org>
Date: Mon, 26 Oct 2020 15:01:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1603373219-19374-1-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
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



On 22/10/2020 14:26, Srinivasa Rao Mandadapu wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Update SC7180 lpass_variant structure with proper I2S bitwidth
> field bit positions, as bitwidth denotes 0 to 1 bits,
> but previously used only 0 bit.
> 
> Fixes: commit cba62c8b49bead ("Merge series "ASoC: qcom: Add support for SC7180 lpass variant" from Rohit kumar <rohitkr@codeaurora.org>:")
this should be 12 chars long, for this particular fix it should be!

Fixes: 24caf8d9eb108 ("ASoC: qcom: lpass-sc7180: Add platform driver for 
lpass audio")
> 

No empty line after Fixes tag!


> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>   sound/soc/qcom/lpass-sc7180.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
> index c6292f9e..bc998d5 100644
> --- a/sound/soc/qcom/lpass-sc7180.c
> +++ b/sound/soc/qcom/lpass-sc7180.c
> @@ -188,7 +188,7 @@ static struct lpass_variant sc7180_data = {
>   	.micmode		= REG_FIELD_ID(0x1000, 4, 8, 3, 0x1000),
>   	.micmono		= REG_FIELD_ID(0x1000, 3, 3, 3, 0x1000),
>   	.wssrc			= REG_FIELD_ID(0x1000, 2, 2, 3, 0x1000),
> -	.bitwidth		= REG_FIELD_ID(0x1000, 0, 0, 3, 0x1000),
> +	.bitwidth		= REG_FIELD_ID(0x1000, 0, 1, 3, 0x1000),
>   
>   	.rdma_dyncclk		= REG_FIELD_ID(0xC000, 21, 21, 5, 0x1000),
>   	.rdma_bursten		= REG_FIELD_ID(0xC000, 20, 20, 5, 0x1000),
> 
--srini
