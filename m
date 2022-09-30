Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AE45F07D4
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 11:43:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35A721689;
	Fri, 30 Sep 2022 11:42:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35A721689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664531009;
	bh=2JtcIiREl7+VsCcuqSGh3yJMIgSoBAJOt/ul/8xZ9Yk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=skQa/H9A4oemDTPcMtwMhQBR07EOQhTgT33g4ytQi1D4TMldsqTMfq5fWWV6XpChX
	 d7u8ii/gaex1kF2zcM5YIIu2eUYbCZFA6NgQBKondlLTQgUwexn35+gvPamDQS7Kf4
	 IDE7MccFTdTt7bTbk32EdhurNy9HArF4aqj3nOYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2501F80153;
	Fri, 30 Sep 2022 11:42:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FF68F80155; Fri, 30 Sep 2022 11:42:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54E05F801D5
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 11:42:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54E05F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vog+SdyM"
Received: by mail-lj1-x233.google.com with SMTP id a14so4207449ljj.8
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 02:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date;
 bh=zzO/BABXosBW26dQzbnEVuKM6qmCAqUZCHFz/+F2wbU=;
 b=vog+SdyMWmM8BsTAKPH5HaEUFfZVGn3pbQBKPMtytKUC9k+5IA0QqXJ1ZKm417DmSt
 lqxWMAxG5UeXGnLbqTxE80hkfsmLRB3gWxsl0witKG5XbkWB2BUv/uXpAMVVGZdjKT6y
 nDyv4uNEIe5H7/gPSzb0e+8wf45G0YEq+7uM/2qIKJ7vJns58a0AkCP7JJErgpdMgk4c
 GsNPCtg0Rpb+44u6/qi0L26NQhivFror84C5ohokPpTv7sIj44Hym2plPPIWsMGJPPTq
 TklMJMsc8CmTsDIbe+9eCQRkz8x8ukdkAzFfkquTi4+FcCAQ4p9aIg7oTWlGw4mYHu+7
 jVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=zzO/BABXosBW26dQzbnEVuKM6qmCAqUZCHFz/+F2wbU=;
 b=nLmZVTehI5d9zBb3CgEvUVzHjltXzVGPQ2zjqHgsEzyPcABUK3JEjmXhBaRZKUHYHG
 eDqtNcyxtpxo9RhWwTnhubz6XIseYUlCx72CsA0qkjG+/8qyiJpToxxeXmige0q5Wnvk
 o8qGaSKwFVKLnb1Gc2bADv7WkufqZgrrNyqEtTR4EAqQljtRBFNNTdRQQlvYwAt9gcjc
 K7qkaWxBsTKDsaHUfTz90Ts4alcLdVPqtGRT1n+sKy9rjucHNs55O0vOLVPRQazZt24Q
 t+kh1MZ7diEqCN4NUZZs2K9IOyiwlOpLyR8T6qBw6xD1h2Ex9PnPt2pb3sEpuxgPIfvy
 2TXQ==
X-Gm-Message-State: ACrzQf25dJQfCQpCXn5ql6998eVbbZvalHXalVlnPg+7xU0JKFlDKzsG
 65Weu5frU9OOuwwPD7ujC9hMDg==
X-Google-Smtp-Source: AMsMyM5F1t3B9dgH4g2gHekokkYTbTUDVoKD2+k7NhubEORICaGbBVq5Pi5IQuwRymtc5m1QgIRtTw==
X-Received: by 2002:a2e:3211:0:b0:261:c5c8:3403 with SMTP id
 y17-20020a2e3211000000b00261c5c83403mr2766450ljy.86.1664530946585; 
 Fri, 30 Sep 2022 02:42:26 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 u15-20020a05651206cf00b0048af9d2d119sm240785lff.130.2022.09.30.02.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 02:42:26 -0700 (PDT)
Message-ID: <c3aafcdf-9e24-9fbb-b022-d7d1cf04b7b9@linaro.org>
Date: Fri, 30 Sep 2022 11:42:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] slimbus: stream: handle unsupported bitrates for
 presence rate
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20220930092006.85982-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220930092006.85982-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 30/09/2022 11:20, Krzysztof Kozlowski wrote:
> Handle errors of getting presence rate for unsupported stream bitrate,
> instead of sending -EINVAL in change content message.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/slimbus/stream.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
> index f8eade1e0132..28fbecb3907d 100644
> --- a/drivers/slimbus/stream.c
> +++ b/drivers/slimbus/stream.c
> @@ -204,7 +204,7 @@ int slim_stream_prepare(struct slim_stream_runtime *rt,
>  {
>  	struct slim_controller *ctrl = rt->dev->ctrl;
>  	struct slim_port *port;
> -	int num_ports, i, port_id;
> +	int num_ports, i, port_id, prrate;
>  
>  	pr_err("%s:%d AAAA\n", __func__, __LINE__);

The context is from development tree. I'll rebase and send a v2.


Best regards,
Krzysztof

