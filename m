Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FE555FFDD
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 14:27:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EF0F1640;
	Wed, 29 Jun 2022 14:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EF0F1640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656505668;
	bh=a0qiAdflpZ/z7RuhyhsqZuJmfwE8hQ5f4sMaVTiCVT0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SXr81X6kQalT95Q74zDGRfL7a9HrJK5W5ATDnzLVyzJ1DhMHHLpFnUGSLhzUFIbRD
	 LpF9agRXKYd/cDD5N43msT6kZqlSTS4ll9dpqEg6AcYCGdh0Iw6MsjHCsw8J0B7X5r
	 dhODzo6k8kF8HxCJNNtwDum+8Z18Pfl7JZ/3+Lcg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CBCBF80245;
	Wed, 29 Jun 2022 14:26:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 089E8F80107; Wed, 29 Jun 2022 14:26:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1AF3F80107
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 14:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1AF3F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="fdkOLbDN"
Received: by mail-ej1-x630.google.com with SMTP id u12so32190978eja.8
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 05:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/VK9DE+fjlwvsGyviRj5FG4gJTmtxY9r+zyl+crkUSY=;
 b=fdkOLbDNyEE6sBEjG9IcyIog5z7nlO9H6IcwUn2zxDl0CJArtFrBxq9nX3hW2Roygl
 Q9q5rxX0IJFa0y/bn45c3+HRrS0r9uwdBjoXT7cju27MpxRv/nSKAi2PAF3OQwjbRh8W
 pIPSKFnfyPlng3UtgJuckS6d7OhV76HWFlJswm+fONVqwOBf0Fk73mD2bfalk2mWiL5+
 j2Jh71I/V2G77ynl6S32mX+aNSocMysI/G15zcmzEq0hkjHLw8hxL89yTdzOuhvnF2Wt
 Dlk9Rd9kaOtrM4+XgsIkJDjCaKTgKek6xGE5jcF1WerE2UjRkoqhYM0nDxMqdMXf7ax4
 1xGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/VK9DE+fjlwvsGyviRj5FG4gJTmtxY9r+zyl+crkUSY=;
 b=hwH81ATVsioZR5Y3vevTWpFnbQF3ST08ZwMrp+gyl+0MfkYzz0vWm7nVIeXmbTSVgM
 psHbwFHldhIPqIOWlWtcwtUzC61v090n+c/GMidVjgprGYX/utyaagQcXPBIbZPciJuC
 44k1NG88Sf69+e9xZRRUgihOM7pXwWtpzPq0O+xahoysLtrV+xTmhnNIOZ+2c9B5RWjT
 hBAGwqbWxn09CWuy1JleO2wumjsGaCHGM1l/Imupu0xsJalWrT9BvwYibVt7gNEFzwxa
 xyRXqLVbBYntlxvP6BjoyHR+OJZYFQPo9x6EIAhrtysqw5cxCxB0WAF2gxGbAGJdLV21
 adGA==
X-Gm-Message-State: AJIora9AiNmMKkUEExh9gTBd4eF4crf8z0OV0jqFe71Wbshf2SNptv4H
 MD816YmNui6CLhfhGzQrvvriRA==
X-Google-Smtp-Source: AGRyM1segqOzgXb6PMP455BLIUdg79bBzmtmRagdnqlVA0EpCB3ku6EzDcPZ0q2RMKoDivXkRf+f/A==
X-Received: by 2002:a17:907:7b87:b0:726:c868:cf38 with SMTP id
 ne7-20020a1709077b8700b00726c868cf38mr3127475ejc.580.1656505578137; 
 Wed, 29 Jun 2022 05:26:18 -0700 (PDT)
Received: from [192.168.0.184] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 u9-20020aa7d989000000b004355cb1e77esm11097013eds.91.2022.06.29.05.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 05:26:17 -0700 (PDT)
Message-ID: <2cd3630b-3481-8647-a80b-b6c17a7979db@linaro.org>
Date: Wed, 29 Jun 2022 14:26:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: dt-bindings: Fix description for msm8916
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 srinivas.kandagatla@linaro.org
References: <20220629114012.3282945-1-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629114012.3282945-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, quic_potturu@quicinc.com,
 rohitkr@codeaurora.org, quic_srivasam@quicinc.com
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

On 29/06/2022 13:40, Bryan O'Donoghue wrote:
> For the existing msm8916 bindings the minimum reg/reg-names is 1 not 2.
> Similarly the minimum interrupt/interrupt-names is 1 not 2.
> 
> Fixes: f3fc4fbfa2d2 ("ASoC: dt-bindings: Add SC7280 lpass cpu bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml         | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
