Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7435D5B6A50
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 11:09:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6CED1765;
	Tue, 13 Sep 2022 11:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6CED1765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663060172;
	bh=ROl6abHXVu17Bp++rBfuJxlrqPVM4semcUE2qy1j78M=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UGKyeiB19kKyQSQMtgOXtdK8dYam+kCgzK4Ku40g0jmzFzreUoKz9Uo1+/Q91rM8t
	 7+H+HcGYecX34jBC37lNOq25umearWkBcOKxSxhHDevnt1LrHeUJjOl+WsB1WqZwfu
	 JeWh4I2hLRsdjzpHfsRSVerdFScyiFQoIFpZkLIE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63BFEF8025D;
	Tue, 13 Sep 2022 11:08:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17CBBF80224; Tue, 13 Sep 2022 11:08:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 775D2F800FE
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 11:08:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 775D2F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="EVbXz/CO"
Received: by mail-wm1-x32d.google.com with SMTP id o5so4954793wms.1
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 02:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=TTwyWPBlC2nq54/plFBOskLhs9iNQkcq2izDuthcGZo=;
 b=EVbXz/COmLDDnayLaWDmCDTed4QDwYcFW9tXmbl51O1CGK8hI3C0mGI0ar+OIAXxel
 nKTPGkZ17SDl5w3odiF8JKOAkBYFglYVAju2PPYHW9ue0YauePy7g4KXnkR92kvDAwsl
 +ykzDuu6LZSSsk85hVic7elSrucs3RxWxEr/DRDdp4L7/1v11FGaIB/994852kFCtQv1
 99vHYursVGu/o+IAJ2UvyWwYFaijUetqzYcLYUNprGPo9R0vHwq47G9aVuRusfR6Dl8D
 CnGI5MsRctvqPUZ57oWccXt6PNjLJBhP1ea8KXJ5IhmjHSCWeb1P/mSu8tgnAIpKSoTj
 +H3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=TTwyWPBlC2nq54/plFBOskLhs9iNQkcq2izDuthcGZo=;
 b=4Nz7FUB2rmFXFWipIAHWNxMIcoVNKSti1fR2sYmUrQX55LUQYaVwlzaAKN5H8VENmx
 RwMJu24yxaRNiTxOi9BZvdrt45WGrvyThMKDVcXbn/vr0E5UmMpZu+ce5E8HGR3sLQHm
 PBiScvi+EUAnCtB2fOQJHcxpp+m2d9aQJaTNqxoMrMLWjtqQde+vW7noCNsoRx+7te9T
 JnmRusKMamdcP+eGy0fGuab2dNXO8/Xxj7TS4PftV8nfd8GHJW7LztqbmZbzMfkdCaGB
 jBNEhHm2oWKPwsLFDfvaAjU05XqYy8zWgQrKBdVGnU6JT5coPMRwuE/IC9KxMU0GEMOP
 N09Q==
X-Gm-Message-State: ACgBeo3C8PJGuE1qEjk3c20p/wcnw58N45vMxGMug4qOnIsCS5dxk6Ir
 V0SqAcSHzi+mU/+VCLbuNs58fQ==
X-Google-Smtp-Source: AA6agR6MS0ohvt3dRo5ZeiC0fhkxAEld5LpHSpFEL7u4/Ny/JfV4trZR/bAn5Ie8U9zgpAjIaPp5VQ==
X-Received: by 2002:a05:600c:4fd4:b0:3a6:2694:e3bc with SMTP id
 o20-20020a05600c4fd400b003a62694e3bcmr1563171wmq.60.1663060106741; 
 Tue, 13 Sep 2022 02:08:26 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.70])
 by smtp.gmail.com with ESMTPSA id
 y4-20020adfd084000000b002206203ed3dsm9756730wrh.29.2022.09.13.02.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 02:08:26 -0700 (PDT)
Message-ID: <bf9c7756-22ec-9900-b280-dcdf1e102178@linaro.org>
Date: Tue, 13 Sep 2022 11:08:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 00/14] ASoC/qcom/arm64: Qualcomm ADSP DTS and binding
 fixes
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
 <Yx9IKU4+SjQJGuP1@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yx9IKU4+SjQJGuP1@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
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

On 12/09/2022 16:54, Mark Brown wrote:
> On Thu, Sep 08, 2022 at 11:19:32AM +0200, Krzysztof Kozlowski wrote:
> 
>> Dependencies/merging
>> ====================
>> 1. The DTS patches are independent.
>> 2. The binding patches should come together, because of context changes. Could
>>    be one of: Qualcomm SoC, ASoC or DT tree.
> 
> I'm happy to pick them up if people are happy with that, they
> look to be mostly ASoC changes?

Hi Mark,

This sounds reasonable, please go ahead. Just take note that I sent a v4
with minor changes (re-order for better bisectability and one new patch
 in the set).

Best regards,
Krzysztof
