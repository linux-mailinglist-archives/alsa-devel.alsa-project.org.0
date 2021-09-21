Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 157BD4134CD
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 15:48:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A229116AB;
	Tue, 21 Sep 2021 15:47:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A229116AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632232109;
	bh=BmHvMWBS4YOQye9bBRDGTFI5duhIk9T/CKoyTT9QZb4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YlddpDtq0gqwv0R5Rid5GNN9B1Jz+YQbXpEI2vJMsZtm5Ulgn/tBqvSM/rNDYh7Ec
	 2YYJxvxcMLwfXKZagiZF2860CyF37+0FRez0fSkdmeXIQXAhweSV4D6EdUZnx7VnA0
	 qBGu5WfNLD+T5z1U7NwH0tplN0CeFt1stUHM7gWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 193EBF805E0;
	Tue, 21 Sep 2021 15:40:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6C39F805C9; Tue, 21 Sep 2021 15:40:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29C61F805B1
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 15:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29C61F805B1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mXOd8Uuv"
Received: by mail-ed1-x52f.google.com with SMTP id u27so2093319edi.9
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 06:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hy0PolOjfaXYxlg2doenD/4mEsnT0y4Wgn5+QthoNgQ=;
 b=mXOd8Uuve41DKLvJrr6/QoaBIEC98yneQWLoPVx38AYsBq1kgX4II0RB8nur8E3FFd
 02ourtfGk+JaJRPJ4PiZNcJzErw7nj6ut4k0mh75Oe08Wz1jT2Sds4c8ME2Ui6kyA+0r
 T7GKMPTxoYgvgi/7XR1kA+a07Ko6GDhqZgU4cgNhtL6whEr5iKu2GKtqL6nNtcDrTXkJ
 RzO3vYQvY39KnW3a5I6O2e9syhpCvLsETc0FHOcWSxnZQoim2XK4MIlhiGWRNm+ex+Tj
 CmGFSsM5cDH4dZw1CwzPwIRvr6jjA1x4Jc+xtlmK1XmvJA8frCmUT1IJq02Tb8zR6NT9
 mQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hy0PolOjfaXYxlg2doenD/4mEsnT0y4Wgn5+QthoNgQ=;
 b=14LKZc36feultKTLA9VvLP0jG8zKWD3kVcH5P7GWM4ku2EZcVFEQqAyexgcQWH4pWl
 qQdfw+jbxXJBZj5jDjfUSdS57KwxOJEwDlx4SHhEza86Cp4vkrVOq2XIKBJDKLvfAWgw
 DldB98uhqpnBoikowjc/9xjF8RgyfuQiqdJ1JG9R8TtJbbzwhKPXgLhbfnoYFeHHdUvO
 Q8p+S43VeRZpKm8F9QujM3y2BVzwMG7Sq8D7TfkDd5H6jsT96IDbHifkURrR5aidbxNC
 0p2khTbnDQe9q1qkLWupZIcaO/2isJuii19bmoUdRqtAc/FDDb46An7Ujc3dAxACz+xa
 YAQA==
X-Gm-Message-State: AOAM533nZncb26/ua5n3nQyyTHkLC9Vl090MSMyNp+GzeAtJZfiT8z7V
 DwBwUCIfUm3o47zoTEpYbyG01Q==
X-Google-Smtp-Source: ABdhPJxzci9Rw5XMfFMzir7le7QhtInOzGHLhYgrNyW2wx7vWHnfoqwW/vAgOw35Y2R00vHPEVnFWg==
X-Received: by 2002:a50:d84c:: with SMTP id v12mr34819451edj.203.1632231544394; 
 Tue, 21 Sep 2021 06:39:04 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id i20sm8475321eds.14.2021.09.21.06.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 06:39:03 -0700 (PDT)
Subject: Re: [PATCH] ASoC: qdsp6: q6afe-dai: Fix spelling mistake "Fronend" ->
 "Frontend"
To: Colin King <colin.king@canonical.com>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
References: <20210920184152.18109-1-colin.king@canonical.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ccecfbda-c328-22ad-7a00-0f1980fe7589@linaro.org>
Date: Tue, 21 Sep 2021 14:39:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210920184152.18109-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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



On 20/09/2021 19:41, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the module description. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/qdsp6/q6afe-dai.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
> index ac8f7324e94b..8b664cbf6fa6 100644
> --- a/sound/soc/qcom/qdsp6/q6afe-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
> @@ -1747,5 +1747,5 @@ static struct platform_driver q6afe_dai_platform_driver = {
>   };
>   module_platform_driver(q6afe_dai_platform_driver);
>   
> -MODULE_DESCRIPTION("Q6 Audio Fronend dai driver");
> +MODULE_DESCRIPTION("Q6 Audio Frontend dai driver");
>   MODULE_LICENSE("GPL v2");
> 
