Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8214C5B17F6
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 11:07:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2018D16C2;
	Thu,  8 Sep 2022 11:06:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2018D16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662628020;
	bh=dGRhAlZJPdjskKwPIWqcnnMgKaVJ/0d7KOOjN4lUxOc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BgfuEsK0m19IwK0e070A8rDm8pBtmn29iTjrUM2WsRiHTWmdxwKt3VpTn8ISuX/Hr
	 xtIhQOe+2t+fJxUGr+lUj4fMksE+V53/fDamk9jVq2wm1CmpbrGoHf9677yU5SqAbj
	 wmiqWWGYY306I4tx+sP55idK+1JhmsGuHXSc7yOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A65EF8023B;
	Thu,  8 Sep 2022 11:06:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B379F80217; Thu,  8 Sep 2022 11:05:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2663F8016D
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 11:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2663F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GFV1PyuE"
Received: by mail-lf1-x12f.google.com with SMTP id z25so26675313lfr.2
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 02:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=4EXeardeq9HpwiVCQZQ5lt38hZVTwtZGieJK0lljKM8=;
 b=GFV1PyuEpd72g7+F6AONP4m8l+4Mgx5vfZQ9e6eTMER3UWFHq95qsiLukvu+VyYFxW
 tlMKSUe9fSe9nzd/d30Yon2MLZdQkCnt5LMCZMrPXdC78fxMUVeglBOjYpl8v599VGZX
 VXZzIoUZPdxiJyJZ2UOY5VUhzgEmjuh1bn9Kd7D69+ZEt4rfqTdIONvAwC2QUvY5wk6u
 d3TE0jHXiKheTnqCDkgPA3uKt7VLbbd766PbtwDEvztO28L1uNy4MwObB6UdwoA8FgQv
 nmNYeEbfhxNDy6a8AJiOwjW0yMrFtB28+NAmZRc9U0+YOwSLaXmXJsAD6iMkw0eVbTE5
 CMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=4EXeardeq9HpwiVCQZQ5lt38hZVTwtZGieJK0lljKM8=;
 b=XC+ydha5Wet7zASrSPgN4XSWZsFzRFe1uMbmwAIVLKr7ZGwMWNL37UMw1grQ/8DKRq
 RjjZQnBuAMGQtZYJARxhJscyP3LXjRIBGb0k3SZwV5Bplxq3B092uc5+bOUFQ9nt5Z4q
 KTihc9iPYqxGPjauBO5Ou7sobmWRrFALdWz3sR7586muVE5YHJWAvrhsNnZuKLoYZoi2
 INvU5RraC60rqQ6JhYNQO8dN6OgPaVUhb7NFscto05bgrEbk9EFUgSG/NdStKFDJFumN
 Y4t958LWoc81PbMDkHo3R5NqNmATVKMhbrmG3cDC1SuG60X28sI4wSYCPp4rnnSChji0
 roPg==
X-Gm-Message-State: ACgBeo1/zIJLX+RM8Z12Qdl/Lu0vqzQYW+sTZ2Q+8RYTPPY16lLA6g7k
 33B9CXHoqAPamkoCbDDr4/bdHw==
X-Google-Smtp-Source: AA6agR7L93/MOoDYSIXBA6+h6lEC6mcSj4MEclyOVmbetSPM412RIRG/YwUgew+9bugh6qZXrUpMyQ==
X-Received: by 2002:a05:6512:1091:b0:491:f135:4633 with SMTP id
 j17-20020a056512109100b00491f1354633mr2712894lfg.553.1662627949452; 
 Thu, 08 Sep 2022 02:05:49 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 p15-20020a2eb98f000000b00268d84f8db1sm3086496ljp.92.2022.09.08.02.05.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 02:05:49 -0700 (PDT)
Message-ID: <ee9b8346-b0fc-8ca5-5858-26534d322362@linaro.org>
Date: Thu, 8 Sep 2022 11:05:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 09/14] ASoC: dt-bindings:: qcom,q6asm: convert to
 dtschema
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220907101556.37394-1-krzysztof.kozlowski@linaro.org>
 <20220907101556.37394-10-krzysztof.kozlowski@linaro.org>
 <20220907175759.GA3791463-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907175759.GA3791463-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On 07/09/2022 19:57, Rob Herring wrote:
> On Wed, Sep 07, 2022 at 12:15:51PM +0200, Krzysztof Kozlowski wrote:
>> Convert Qualcomm Audio Stream Manager (Q6ASM) bindings to DT schema.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Expected warning because the qcom,apr.yaml is being fixed in next commit:
>>
>>   Documentation/devicetree/bindings/sound/qcom,q6asm.example.dtb: apr: service@7: 'dais' does not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'
>>     From schema: /home/krzk/dev/linux/linux/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
>>
>> Changes since v1:
>> 1. New patch.
>> ---
>>  .../devicetree/bindings/sound/qcom,q6asm.txt  |  70 -----------
>>  .../devicetree/bindings/sound/qcom,q6asm.yaml | 112 ++++++++++++++++++
>>  2 files changed, 112 insertions(+), 70 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.txt
>>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.yaml
> 
> Should be qcom,q6asm-dais.yaml or you need to add qcom,q6asm compatible?

Right, it should be -dais.

> 
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6asm.txt b/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
>> deleted file mode 100644
>> index 0d0075125243..000000000000
>> --- a/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
>> +++ /dev/null
>> @@ -1,70 +0,0 @@
>> -Qualcomm Audio Stream Manager (Q6ASM) binding
>> -
>> -Q6ASM is one of the APR audio service on Q6DSP.
>> -Please refer to qcom,apr.txt for details of the common apr service bindings
>> -used by the apr service device.
>> -
>> -- but must contain the following property:
>> -
>> -- compatible:
>> -	Usage: required
>> -	Value type: <stringlist>
>> -	Definition: must be "qcom,q6asm-v<MAJOR-NUMBER>.<MINOR-NUMBER>".
>> -		    Or "qcom,q6asm" where the version number can be queried
>> -		    from DSP.
>> -		    example "qcom,q6asm-v2.0"
> 
> Where is this compatible handled now? 

The "qcom,q6asm" is handled in:
Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml

The "qcom,q6asm-v<MAJOR-NUMBER>.<MINOR-NUMBER>" is not handled because
it seems it is not used anywhere. I did not find such usage also in
downstream sources, so it seems version can be always auto-detected (I
did not confirm it with datasheet, though).

I'll explain this in commit msg.



Best regards,
Krzysztof
