Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3035115811B
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 18:17:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A72581676;
	Mon, 10 Feb 2020 18:16:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A72581676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581355021;
	bh=9UROeWEeliz20YjWWJZ8ZYUqbTnPOQdsxFfVaFACalc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MI//5QI0//QDwRujVLLXrnmjd3IcQbi9HWmFigLOMwF96iUsioxuwBm5WynCtCg6J
	 mkvJFRxm9rqtjtJriAiaT8zb+jYRGV6yhYujMGrwCOlTTzqpIItGg6VYKTAFrmgp8P
	 VjEmKR9NZHKEBhXEngQpgkIeikppGNxOOJfCOhTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C5FBF8027B;
	Mon, 10 Feb 2020 18:14:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90F04F80279; Mon, 10 Feb 2020 18:14:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9440FF80277
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 18:13:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9440FF80277
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="aMXljtYm"
Received: by mail-wm1-x343.google.com with SMTP id t23so66874wmi.1
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 09:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6QO5silzydkt0yEhC4NmJJauJoMXe8lq0S5SvnaM2xE=;
 b=aMXljtYmtaulEwFUbTj9+nhuffnDZ/MDaMKem8UNvXITcIlAyi84kpd0cllskVrEOz
 1vg0NC1F4+AOdk6vlQYTgmHiJuarHgzO4HpNzqSFbYyN9sXXHdwWmnXGh3SaijIj1BVH
 2O+fwefq1rMgfrIYrQ0AaLve99u+VK3sQSfqbPgTTh2eeMKb+IBQazXTL7QxEABbka3Q
 YfzqAUGaFZf1JNKWl2aWzVecCmVx8FgKROL85B583d8Ncprl3IfFOwfcGKR6yFtE5aMk
 VxySgp7BsQS7albzzuG17TXN2H3Fc1pTQhVS14dgxVMf8pNQRPCBHR4XNuZ6cQdnmo3o
 JVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6QO5silzydkt0yEhC4NmJJauJoMXe8lq0S5SvnaM2xE=;
 b=a1CGGR5Q5j0xEZEgFhvSw0RZOwknCkiYicf30+vH/sscbEUk+43ihgQIqyhrsHS902
 pOJdUEkCq80XrrnjhSZTn1fdTZAxoMD/lJj0OBNVYM1H8vHz4rJZd2LozPkBi51kqQVz
 x4g3xhrrqFZS387jbjTtBmtPh9jJo5HjBuOfCNndg7QB8lxInAZdi8yo2dPrLlx8ml+1
 kPXqPA/2rvDAhWXgR81DAdg43nAqvPEmOGF51aAUrB3ZGxwOCb79Bd4yZsg7Kj6Q7DNC
 HsyOl/yBqBARB7496CjNswFx7TIouSueSCq8TA/OirXfEz8SlSAcXf7UXjPN+1x5tH9G
 U/vg==
X-Gm-Message-State: APjAAAUR3M+QnHUhdwbE9OxL5s/Zru7soPUCshW16piz2hwxH3JDJ7h5
 xtb3jODnunXGMq/exery28c4ow==
X-Google-Smtp-Source: APXvYqwfej4Y9cv7uzUU3bRN24Smc8vOxuiVDdH7q0FalpK/QSoS39/ifGPuVhODur6Q81JC88x27g==
X-Received: by 2002:a1c:4c13:: with SMTP id z19mr5331wmf.75.1581354837581;
 Mon, 10 Feb 2020 09:13:57 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id w22sm356wmk.34.2020.02.10.09.13.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Feb 2020 09:13:56 -0800 (PST)
To: Adam Serbinski <adam@serbinski.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-2-adam@serbinski.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <f70e0ac0-c78a-fcaf-6572-0052b563b724@linaro.org>
Date: Mon, 10 Feb 2020 17:13:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200209154748.3015-2-adam@serbinski.com>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 1/8] ASoC: qdsp6: dt-bindings: Add q6afe
	pcm dt binding
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 09/02/2020 15:47, Adam Serbinski wrote:
> This patch adds bindings required for PCM ports on AFE.
> 
> Signed-off-by: Adam Serbinski <adam@serbinski.com>
> CC: Andy Gross <agross@kernel.org>
> CC: Mark Rutland <mark.rutland@arm.com>
> CC: Liam Girdwood <lgirdwood@gmail.com>
> CC: Patrick Lai <plai@codeaurora.org>
> CC: Banajit Goswami <bgoswami@codeaurora.org>
> CC: Jaroslav Kysela <perex@perex.cz>
> CC: Takashi Iwai <tiwai@suse.com>
> CC: alsa-devel@alsa-project.org
> CC: linux-arm-msm@vger.kernel.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>   include/dt-bindings/sound/qcom,q6afe.h | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> diff --git a/include/dt-bindings/sound/qcom,q6afe.h b/include/dt-bindings/sound/qcom,q6afe.h
> index 1df06f8ad5c3..f3a435a112cb 100644
> --- a/include/dt-bindings/sound/qcom,q6afe.h
> +++ b/include/dt-bindings/sound/qcom,q6afe.h
> @@ -107,6 +107,14 @@
>   #define QUINARY_TDM_RX_7	102
>   #define QUINARY_TDM_TX_7	103
>   #define DISPLAY_PORT_RX		104
> +#define PRIMARY_PCM_RX		105
> +#define PRIMARY_PCM_TX		106
> +#define SECONDARY_PCM_RX	107
> +#define SECONDARY_PCM_TX	108
> +#define TERTIARY_PCM_RX		109
> +#define TERTIARY_PCM_TX		110
> +#define QUATERNARY_PCM_RX	111
> +#define QUATERNARY_PCM_TX	112
>   
>   #endif /* __DT_BINDINGS_Q6_AFE_H__ */
>   
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
