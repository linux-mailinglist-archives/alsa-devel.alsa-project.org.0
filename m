Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3962CF359
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 18:50:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31173184D;
	Fri,  4 Dec 2020 18:49:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31173184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607104203;
	bh=3iAXQAkNIGvj2hCUvo/rCtF4ossE+7RivvMy+d5kWtQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ApAeAk4J7lCcXqMIEdPOdKdjMNmos3BexkXTc62+MYzaG+jl60wzkoJgha+f3gRIB
	 bbVxBIh0toC9L3iOX8bNiaNyf1QwmQtrM/bVrq2B1okg0w1TCJomMx4k9vyWi/jtpC
	 FLD+iNrBuPy+Gb4j7U9ZzGo8AtAOchCk5dEt04ro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10381F8049C;
	Fri,  4 Dec 2020 18:48:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CC37F80278; Fri,  4 Dec 2020 18:48:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9464EF8012A
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 18:48:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9464EF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="i9UUNczY"
Received: by mail-wm1-x341.google.com with SMTP id h21so7817151wmb.2
 for <alsa-devel@alsa-project.org>; Fri, 04 Dec 2020 09:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sMl59r/DRuLhlu2MW09102jLe2PGam7zMSw8APT3Z8E=;
 b=i9UUNczYIoqf8Q0ReLkw6C9jKlRJzpV5SpA2c+E/H/NSOxbEpvbgpSpGvfrUNBP4Rg
 M5aVvqrY15vaHr4iWkhDtMPyN5GWi7LS/SzYJNSxnO9EYqoPf39zpDD4PUXqFkhrmHfD
 wptMqkTnE7mcf6pg8hIOg9QY8XLeQd676QxDre/GwAVEhSh6aUDWHXcEIub1mWxl3yjD
 DR/y+2FW/2xykQ6r7uX3bGphlVjgPgRdM2f3/m7ROHPB9DZ9LdDZpTV/IDa2sE3ePuDs
 ovQqsJpVso63a7xosb+C4X/etLR3//citOdWttgICGDwI99ZfSSSgd8/YMJtsmz3WFTp
 6VuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sMl59r/DRuLhlu2MW09102jLe2PGam7zMSw8APT3Z8E=;
 b=SfZoCufykwT4yYxkLdQbbnG90CfYC/DR53pmB3PuRof5Y57fjjpSKRVDHsiz2ATc6i
 KDgEuGE7+oPETgQZPrIgattHc8Q9sP5mzy1KBDfC5DoubMvTM2nTCHjWw2tLKyswS6PJ
 N6Q+BjCV4ngnnwFrPijTpCGAugdQctq/fjtFKXnJrLNGVAAbM9NXspVyoW7pMvPOx5kR
 dW7OrNa5Mc73Ng3T80FqVm/d8dFUJM9ukbY7sD8adBi86CnznDWFz/KEgJ2IOZSxUh96
 LyBFDVur4ay8YJ3zqj8ryswuqdQUEElfFcN0yRc3HYMsRFRBc/9LDkZwEtd9VEajZ2ay
 QsCw==
X-Gm-Message-State: AOAM533Vx6UUccWIKAe6e0/G2ENAMgBkHcz2wzXYEAeazuybxg1FZ4Xl
 9IJIedoJb89YsNIt6XhiyOcQmA==
X-Google-Smtp-Source: ABdhPJxJxirtFSOAFrreLRqfQ9/krXdMGpQdC2UWJ2tuRPnf0tQGiAGmoud05hs+ubQH11BcUjmiKQ==
X-Received: by 2002:a1c:6056:: with SMTP id u83mr5375331wmb.90.1607104099954; 
 Fri, 04 Dec 2020 09:48:19 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id n123sm4148301wmn.7.2020.12.04.09.48.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Dec 2020 09:48:18 -0800 (PST)
Subject: Re: [PATCH] ASoC: qcom: fix QDSP6 dependencies, attempt #3
To: Arnd Bergmann <arnd@kernel.org>, Patrick Lai <plai@codeaurora.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20201203231443.1483763-1-arnd@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <8323d386-c3f1-2db6-1870-2279784dd85e@linaro.org>
Date: Fri, 4 Dec 2020 17:48:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201203231443.1483763-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Ajit Pandey <ajitp@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Rohit kumar <rohitkr@codeaurora.org>
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



On 03/12/2020 23:14, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The previous fix left another warning in randconfig builds:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_QDSP6
>    Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y] && QCOM_APR [=y] && COMMON_CLK [=n]
>    Selected by [y]:
>    - SND_SOC_MSM8996 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y] && QCOM_APR [=y]
> 
> Add one more dependency for this one.
> 
> Fixes: 2bc8831b135c ("ASoC: qcom: fix SDM845 & QDSP6 dependencies more")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for the patch,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index 27f93006be96..cc7c1de2f1d9 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -106,6 +106,7 @@ config SND_SOC_QDSP6
>   config SND_SOC_MSM8996
>   	tristate "SoC Machine driver for MSM8996 and APQ8096 boards"
>   	depends on QCOM_APR
> +	depends on COMMON_CLK
>   	select SND_SOC_QDSP6
>   	select SND_SOC_QCOM_COMMON
>   	help
> 
