Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E87865B1EAA
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 15:23:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E9F616FF;
	Thu,  8 Sep 2022 15:22:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E9F616FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662643408;
	bh=Uys+mJhFxPidmoPoz8v53yPH3ZkTsndtnavBAPvu600=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e4WpmG12DTAaM2MKiroFvzOq7PewF+5a/Wg8HpZou5AQtMzbePn7wWzuQf1CKaIba
	 okI80d7kzgRIF7x5YtQMQBBgVPY/N6MxYORoav0jaMpPZtUBOHQ+cR2Ak4JEEqJ6sp
	 ErplLQsBeXsSC9wDpHe6DnS/tJI+iGZAFuXyj8mg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E875DF8023B;
	Thu,  8 Sep 2022 15:22:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B777F8023B; Thu,  8 Sep 2022 15:22:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3242DF800CB
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 15:22:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3242DF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="tzOAhiaG"
Received: by mail-lj1-x234.google.com with SMTP id bx38so19836723ljb.10
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 06:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=fLE0KN+bsddl0QuJuy8FUkwqm9oAF9pS454vWRLeAG0=;
 b=tzOAhiaGGQXTOnylw8uUb0DZB4fb14BZI8v46ylgywkRIttiZqAiLm0Chf5/4xBKcT
 k8Ejdm4WQZT6xoqzhryRf9cWgC5gRwCr2s1BT8oq2ZOlK5cbCPC//35kzDpIyE2AbK7H
 fCrEfvHqwBnIFRqO/9sN4IdkrspJYKBxQXKtG291zFS1Difee4EqZ57rISjdPKpXOXdY
 SmAOUwPtrIna7p9uYe2tphNLliMWtdzUwQhJBPGd83axsDpGBHjfmpL8fpqaCGfT89IM
 4RwajTDRWOtrOF3w5OSrH1TZ0Sikb0zrBRPTnwZpEIhC/p4FVz3Dqwcp0vcS9oqUFjGE
 Misg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=fLE0KN+bsddl0QuJuy8FUkwqm9oAF9pS454vWRLeAG0=;
 b=rOqA8mD9CE3fdZtoJUhKF/P+XsOJOqUlb294KXFaq3Y+r9mtVk6U4T8B1IiO+k7Qlz
 aQEE3LbXUhXezpQyDGlqcTOpKKqO7o8NIoz57xVkWoj2pCcj+VhxzZvZCDeXZI5lXn4O
 xS27hWtTnUeuBFZ+OxzAC+7OLJCuSI2XL7QnRbi6LiCqlVOKKtqMe2Q1I6vMPEVrnwSs
 TYwx5ioDakciiGfPcS9vRkGMsHsQDhmCsLVHn3CmMg9y8Uj97leqXqbMPQnstLM4JCeo
 odQY4NnMW7KSQOuvkarjbUgNaRIKZDtWkVnRPsC8hKrYuiQa2doicXG2uWnvMgKqcHCi
 Sb8A==
X-Gm-Message-State: ACgBeo3Li4gt11JCD28TLU64+lD8cOvm6Bnfld3+XsOdbUHrHbdsQeXP
 yxvNLm8w9UmYR5Pm13sSD/aizg==
X-Google-Smtp-Source: AA6agR55FiMBW0OSNRvbR0bk9SlVIwvnZAztE8nQlhjnGDEx2ADlA8Bl9oRkGXqyaxryn4TX+3eFag==
X-Received: by 2002:a2e:a483:0:b0:267:982b:6988 with SMTP id
 h3-20020a2ea483000000b00267982b6988mr2399482lji.269.1662643338534; 
 Thu, 08 Sep 2022 06:22:18 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 p3-20020a056512138300b00497a7885f31sm1023649lfa.144.2022.09.08.06.22.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 06:22:18 -0700 (PDT)
Message-ID: <829cdeaa-a80b-96e2-da7a-8bab2b741c91@linaro.org>
Date: Thu, 8 Sep 2022 15:22:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/4] ASoC: qcom: common: use EXPORT_SYMBOL_GPL instead
 of EXPORT_SYMBOL
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20220906165508.30801-1-srinivas.kandagatla@linaro.org>
 <20220906165508.30801-2-srinivas.kandagatla@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906165508.30801-2-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, bgoswami@quicinc.com,
 linux-kernel@vger.kernel.org
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

On 06/09/2022 18:55, Srinivas Kandagatla wrote:
> qcom_snd_parse_of depends on ASoC EXPORT_SYMBOL_GPL functions,
> so make qcom_snd_parse_of and EXPORT_SYMBOL_GPL.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
