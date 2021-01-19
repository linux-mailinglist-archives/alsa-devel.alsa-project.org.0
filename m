Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 508882FBDD5
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 18:39:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7B52187B;
	Tue, 19 Jan 2021 18:38:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7B52187B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611077951;
	bh=Y0nTdUdSe6SKas+xuptPnfsK5VdGetd7TYzNfsRJ6HE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PMtNOLRDWzNn5ha+2FdcMW2JDjYFqC4/GxuMcg9X1QXL5XJcThYShk5/i6bul8+V2
	 8p8lpnL6Y+Ns++PvSCqJ+kFq7x352NWOrKYKcdGZCDEnHJzEAIAlfaW6G/Qxkt3uv0
	 HJfvjmSB6xQ4RYDLnczzqS2wpTnoPdW9inhZwF88=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71389F80255;
	Tue, 19 Jan 2021 18:37:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C836F8026A; Tue, 19 Jan 2021 18:37:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77C2BF800FE
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 18:37:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77C2BF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rSuO0maI"
Received: by mail-wm1-x336.google.com with SMTP id m187so551493wme.2
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 09:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5Qwto4TVFkHpNhIEZF8SfXeW3whxAf344f9CxvijAF4=;
 b=rSuO0maItdi9yppDSCpJTZo2lG078s5AHj5JBFRnHhqLzF7EagTuMM6aV1KkjrGTlY
 iRGmRJMYKE5ESJf92o4R89rljAmmJIi0Yq3ta8+yk7QRDLTUs7pELG5Mjn7lliCfWcAM
 aYioMzXcoK+JNKcBU4N15g6Ocwt1SxqlFvylsh+mp2sjWer/fNgPX4hpdjH5V7EYJQSm
 JMzqDmkWzKoTumAz0eRGlyXTlFyrjCgm35XQg+gKGY/oYMVe3eopUnHJq3NhfGvkSW+f
 RO4wOVDUaBCNma1DsoTUtMjtI8qw9/LNx/VVouilZk28iDbfA3+mq3J5WwnPOWdnIZTV
 VOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5Qwto4TVFkHpNhIEZF8SfXeW3whxAf344f9CxvijAF4=;
 b=ActLzMoIgVbpVXCZd1MSffujcVwlytrWs//om6ihb4dZu6YGE8t+CQhzhdHYpiB+Yb
 FZDXOJnBhU7VqtHuW0nbpR3cRh8g/o7IVPLXzi0Xjc0GO8K1Rl6VhoPto14QetFMREmk
 9lD4t3F19NDiPiGJntqYlZCavcMe6GzBKECFvey1a5KkdIpHx7sWMNnrz1xpPzSL2hCS
 cqOXBBhUfF5aGH1mDuE6rM3zBwspmL/Qhlre+T/R5M5ShPNvW5ZiAuKQ2uy5JvgsQia1
 /aCiIQ7MaJZ4OCGABiF7p7+5JSPv2MN2Norcix7lBrwN9ClM8xZzwA+nHZ0tQ9cIAPQd
 yNsA==
X-Gm-Message-State: AOAM531gqeOwBJ/2OPbTtooQmtUi8VOSEXgAmdM8xebRZaeTcKveus+7
 OlxoICqYMZQBeFWcid53X6suL/VUg8yehg==
X-Google-Smtp-Source: ABdhPJwlUd2P0lJuajo7BzhStBJzeiEMdjYrleggFglKcl2hOp9yGkS3V4BdyUKXgenLHTm+jHsozQ==
X-Received: by 2002:a1c:a145:: with SMTP id k66mr700670wme.18.1611077850072;
 Tue, 19 Jan 2021 09:37:30 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id g12sm5533518wmh.14.2021.01.19.09.37.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Jan 2021 09:37:29 -0800 (PST)
Subject: Re: [PATCH] ASoC: qcom: lpass: Fix i2s ctl register bit map
To: Jun Nie <jun.nie@linaro.org>
References: <20210119071718.3867961-1-jun.nie@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <875d9fbc-ddad-b62d-0374-2a77bc9d6d83@linaro.org>
Date: Tue, 19 Jan 2021 17:37:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210119071718.3867961-1-jun.nie@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: plai@codeaurora.org, bgoswami@codeaurora.org, alsa-devel@alsa-project.org
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

Thanks for the Patch Jun,

On 19/01/2021 07:17, Jun Nie wrote:
> Fix bitwidth mapping in i2s ctl register per APQ8016 document.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini

> ---
>   sound/soc/qcom/lpass-apq8016.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
> index 0aedb3a0a798..7c0e774ad062 100644
> --- a/sound/soc/qcom/lpass-apq8016.c
> +++ b/sound/soc/qcom/lpass-apq8016.c
> @@ -250,7 +250,7 @@ static struct lpass_variant apq8016_data = {
>   	.micmode		= REG_FIELD_ID(0x1000, 4, 7, 4, 0x1000),
>   	.micmono		= REG_FIELD_ID(0x1000, 3, 3, 4, 0x1000),
>   	.wssrc			= REG_FIELD_ID(0x1000, 2, 2, 4, 0x1000),
> -	.bitwidth		= REG_FIELD_ID(0x1000, 0, 0, 4, 0x1000),
> +	.bitwidth		= REG_FIELD_ID(0x1000, 0, 1, 4, 0x1000),
>   
>   	.rdma_dyncclk		= REG_FIELD_ID(0x8400, 12, 12, 2, 0x1000),
>   	.rdma_bursten		= REG_FIELD_ID(0x8400, 11, 11, 2, 0x1000),
> 
