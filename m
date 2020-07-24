Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA37722C458
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jul 2020 13:23:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 294A6168B;
	Fri, 24 Jul 2020 13:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 294A6168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595589811;
	bh=nV7QPc42xSnzSvsubnjDpp9DVc251kVaLd8klTuqtwU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rzyaMWWRPbFZ4vTvhmkfnaXesyT+BNTCD0bRxXPR3pbBjX06NFeFqX304Vqw3m5Dd
	 /vXPHtZFShwneeb4Vnnvas3hhBJCYHxrKte7jARo3e4AzAH3Nodl7IdFVvLPNzb8aA
	 9bH7VtYKNKdcGXmnWbLY+7TJlCqK8mC+jOW3s6kc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47CDBF8011F;
	Fri, 24 Jul 2020 13:21:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DC71F8014C; Fri, 24 Jul 2020 13:21:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F487F8011F
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 13:21:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F487F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QS7Q4UJC"
Received: by mail-wm1-x342.google.com with SMTP id t142so1564611wmt.4
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 04:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0R1s+al6Mm45KgaCKre3FBg0h0lWvZojjImleLMbiKE=;
 b=QS7Q4UJCbJh8ysky/Gs2DXcma3JMCkVRSpqjsengispUhGPVUaHWDINFC1zijXM32N
 5kygO3EJWlF/IAeKZKEiVYwWbjtfff5vDo64OOP65ZzrhlJv7x3Md+xXMM8L/R+ZvPHd
 IrVGUnV22sgGO5L8oQgDqONhDKp36lKF4r9f/mLg5kiPUjnzfN5lpwfF4cCMPvppRgH4
 //tSBkQ/rxx1DUZRvyPR9UnP7Qot+Mn+yXlxBJwNB+knWJ3ObH1x0wf5y9G/rLCmT98u
 AgTV4jmtqhimqFSbLkOMkzk0lI0xgsA+yr4mZMLyn/2q6zmvFD2wMBAJh7EkcfOWOPE4
 cQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0R1s+al6Mm45KgaCKre3FBg0h0lWvZojjImleLMbiKE=;
 b=G7bUP0GtPUenLB3U2oxebQQBFGEXvCPuMPuxgJKPd4suqpFt12f8OKqW7KR26Gnvh8
 Qi0zgWz4AJCs9H4wis4kPWezLuiuRkvuwSodFHD8wKpn4MoY5Vm66VwzwN6yXFf6hnPT
 7pGnsGJOuNQKle3O3CqNhX5Vv/ah2R1JEIm+o2p/l4OQsUid4rP2anvFyHZrPbNtJ+WK
 km/hIPA0AzZdVN2mISVCc7Gox1NMvUyPteAbVxVURXrG59Zg3b4Q1vO835jXsSPpmfYo
 hDaAL/LS0EqmhnPAIEHX7NU+/NtbJlzlAqoHqk1lQbfQt5EMTkDluzvoGPDhYBK3I5HA
 0/FQ==
X-Gm-Message-State: AOAM533dEOtGmaFEwvNj5WjgqJ9EMi9S0ulkA1eTFUZPCYQCHikZtEkQ
 ZJ7HH+wFwW91yboacRHkRq/Srg==
X-Google-Smtp-Source: ABdhPJyViQ8Z8H+OyXbZp9HaMbfOH7Rs69+lNR87yDPwggMJ9gLU1E+QxcpYWxzkmcOlxxHwHzGd6Q==
X-Received: by 2002:a7b:cc91:: with SMTP id p17mr8817102wma.90.1595589701490; 
 Fri, 24 Jul 2020 04:21:41 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id 31sm1011863wrj.94.2020.07.24.04.21.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jul 2020 04:21:40 -0700 (PDT)
Subject: Re: [PATCH 0/7] ASoC: qcom: Use qcom_snd_parse_of() for apq8016_sbc
To: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>
References: <20200723183904.321040-1-stephan@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <94766ad1-72a5-4800-2c71-b7b875198956@linaro.org>
Date: Fri, 24 Jul 2020 12:21:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200723183904.321040-1-stephan@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Patrick Lai <plai@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Cheng-Yi Chiang <cychiang@chromium.org>
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

Thanks Stephan for doing this cleanup!


On 23/07/2020 19:38, Stephan Gerhold wrote:
> At the moment we have two separate functions to parse the sound card
> properties from the device tree: qcom_snd_parse_of() for DPCM and
> apq8016_sbc_parse_of() without DPCM. These functions are almost identical
> except for a few minor differences.
> 
> This patch set extends qcom_snd_parse_of() to handle links without DPCM,
> so that we can use one common function for all (qcom) machine drivers.
> 
> Stephan Gerhold (7):
>    ASoC: qcom: Use devm for resource management
>    ASoC: qcom: common: Use snd_soc_dai_link_set_capabilities()
>    ASoC: q6afe: Remove unused q6afe_is_rx_port() function
>    ASoC: qcom: common: Support parsing links without DPCM
>    ASoC: qcom: common: Parse properties with "qcom," prefix
>    ASoC: qcom: apq8016_sbc: Use qcom_snd_parse_of()
>    ASoC: qcom: common: Avoid printing errors for -EPROBE_DEFER
> 
All the patches looks good to me,

Tested this on DragonBoard 410c!


Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

---srini

>   sound/soc/qcom/Kconfig       |   1 +
>   sound/soc/qcom/apq8016_sbc.c | 120 ++++-------------------------------
>   sound/soc/qcom/apq8096.c     |  28 +-------
>   sound/soc/qcom/common.c      |  58 ++++++++++-------
>   sound/soc/qcom/qdsp6/q6afe.c |   8 ---
>   sound/soc/qcom/qdsp6/q6afe.h |   1 -
>   sound/soc/qcom/sdm845.c      |  40 ++----------
>   7 files changed, 59 insertions(+), 197 deletions(-)
> 
