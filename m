Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE11F56640F
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 09:33:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAA2A16F0;
	Tue,  5 Jul 2022 09:32:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAA2A16F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657006403;
	bh=3VTXDx0Rwm+mVMlJrDvSGBtNi1ZPn3zb1S/wfoYnRe0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VZ53Yrk7DhSrjSAtZfUVLzVzfYhA9OF4hxiVTE3wKo/29hxWz2nsLqW0z8Q6eRCoz
	 l+Jt2ZqOZ06zy/13ohnjiV757BfxxyeszQo/8sMuwP5DQp+5OM7YI7jDMOCHByft8n
	 Kn9hxJ84qbrsQJQZ18+yQB6dAd1RWxvOLDg4kCzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A1B9F80212;
	Tue,  5 Jul 2022 09:32:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2074BF8015B; Tue,  5 Jul 2022 09:32:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8B4BF80104
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 09:32:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8B4BF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Bd0hIYTR"
Received: by mail-lj1-x22b.google.com with SMTP id u14so13470078ljh.2
 for <alsa-devel@alsa-project.org>; Tue, 05 Jul 2022 00:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PWneuAJ9+BwtDVWX9EGVrMHRNI896xMJ1kd4ynHr8vA=;
 b=Bd0hIYTRjsE866WnBumwJ4N178mSBPnEgdW+5z5AbhQXGu6dq4k5hZbq+y/Y4hY2Yi
 2DoQI6N+fRk3DLZzvywAmL2wMBjPwr4Hl92kX/ASdIlGPKu5TlUtOEyfIbQqbMcI5aIP
 hHjzvabj7XyymG0+hTc50l0jz9N/GSSE3K8ZAWP72zcrvf0OeYlMVYhkzPZ7jv6luo/8
 FkIKPGux8uETIZBzf2QAf77IMDYIFxKvi+VUy2IHT3aOTje4PupYS7eLeKGpLD3RCbKe
 OTA6/oAw/s8tUxn6aMyJLLHGYiKBcAzNaGeihLi/kl7fCSS+9rh2eI3LCocMVu2MwY8E
 YMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PWneuAJ9+BwtDVWX9EGVrMHRNI896xMJ1kd4ynHr8vA=;
 b=rzHQn59zySNEa/x//k+TGzhtUQMNKx8WFY2u88WW9SuedJsxM6qnKxFunlDjyyomgb
 pN+kZFG4dyUaJjCRlHSbEZ/zvH//4DS/DUqoweJLsoB4OH8v4tczLXVyWMbU4ZnUtlLt
 7eyj60OGNHcdxIHE9/Ly8Zh9IVeNKqdfCkbC72vKTBjKo7SCkbBRrxQt9fqbEHBTh4pE
 TJ1XHzkayM7l64+uShNntPUPDcwHA9vG9QTL7zsSt7p6Mbb7Ripwq8l2h7Xldw+frXm6
 rPUnSWSxselIonaB/lGwpy1Eh/hAVGvlxQnXN/QE9jY+27nU8/mNV93pkPbS9Ep0r/PR
 4FTw==
X-Gm-Message-State: AJIora8bISZw3ModhqHhgQlRFP77vmyZhlAqBFUDkbLJaHp2X9rupS9x
 lJZtylUJphSSILYAgU6b1yk6FQ==
X-Google-Smtp-Source: AGRyM1tu57jxC+VL6f4xpGAMXs2L40hmkgOX5GUMFpKXSFLtpuT2ISONGdNcPCCxbtLI+XvdQNsG7A==
X-Received: by 2002:a2e:84c8:0:b0:24b:50bb:de7d with SMTP id
 q8-20020a2e84c8000000b0024b50bbde7dmr19039347ljh.40.1657006329594; 
 Tue, 05 Jul 2022 00:32:09 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a05651c11d200b0025a9bbe511fsm5406628ljo.70.2022.07.05.00.32.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 00:32:09 -0700 (PDT)
Message-ID: <61708384-6c29-6bb6-aef0-8bad061c1f7c@linaro.org>
Date: Tue, 5 Jul 2022 09:32:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,sdm845: convert to dtschema
Content-Language: en-US
To: Stephan Gerhold <stephan@gerhold.net>
References: <20220704153824.23226-1-krzysztof.kozlowski@linaro.org>
 <YsMaW6cO2fEfTGPz@gerhold.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YsMaW6cO2fEfTGPz@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
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

On 04/07/2022 18:50, Stephan Gerhold wrote:
> On Mon, Jul 04, 2022 at 05:38:24PM +0200, Krzysztof Kozlowski wrote:
>> Convert the Samsung SDM845 sound card bindings to DT schema.
>>
> 
> Nitpick: s/Samsung/Qualcomm

Yes, thanks.

> 
>> Changes during conversion: do not require 'codec' under dai-links - not
>> present in all nodes of examples and DTS; not required by the driver.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../devicetree/bindings/sound/qcom,sdm845.txt |  91 ----------
>>  .../bindings/sound/qcom,sdm845.yaml           | 166 ++++++++++++++++++
>>  2 files changed, 166 insertions(+), 91 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/sound/qcom,sdm845.txt
>>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sdm845.yaml
>>
> 
> Can you check if you can just add the compatibles to the existing
> qcom,sm8250.yaml? It should be more or less identical given that the DT
> parsing code in the driver is shared between all these SoCs.
> I already added the MSM8916 compatibles there a while ago.
> 
> It also documents some additional properties ("pin-switches", "widgets")
> that are supported for SDM845 through the common code but are missing
> in its binding documentation.

I thought about merging these but then I would have to disallow these
properties, as I assumed these are not valid for SDM845. Are you saying
that pin-switches and widgets are actually valid for SDM845?

Best regards,
Krzysztof
