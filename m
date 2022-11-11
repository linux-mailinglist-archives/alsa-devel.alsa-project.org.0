Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A84625D20
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 15:34:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 252A5167C;
	Fri, 11 Nov 2022 15:33:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 252A5167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668177256;
	bh=RSQjhxKwlkgAcwJJRRRl+zZPfuId5gbODqCAi661EfY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=josdPGdPmk3KxBEtkpqXhyXVoygW0a2pDGWJRg6PoW/Dskiq8/7tRn4Vvkm734+Om
	 o16iP0K2VrTRKVjd4sm5mKA0bZxf5IOVzzAAILovd1tYk74rDBznB/Ig4K//W6YgrE
	 2S0oFxyTb5tBtesNK0vkWWdp4jDyw04lD2DJIEww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2D68F800F8;
	Fri, 11 Nov 2022 15:33:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 492C4F8028D; Fri, 11 Nov 2022 15:33:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77674F800CC
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 15:33:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77674F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lHZh8n8x"
Received: by mail-lf1-x12c.google.com with SMTP id l12so8583319lfp.6
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 06:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JZCkL39tKR5ttW+qJKB2t3gyWuB8VcBN7GauxzyOgrI=;
 b=lHZh8n8x55B+MzDCbf2ins/MECWR60E/rKGiejeepH0pN88FyN8fHkxVTrJxJ8yJHM
 THuEk4207LGGUNZtQuiVxSzPt1cV4QKnFht4q/VcPgJGxXskMUdmPVy1cMVfpbdOXXMD
 +urR1Qdlbs5RFmiuNZdCVxYlTYimLtJgw/xIJ2wzbLNmH3VTGzAgLm43CfNYLHNByxdi
 W4kDlknlDAwTicdt2b0bEo0K3R5SJ8qXw8RH78yv9YGPGBdd9JtyQ1jX0lsQjgMv82sD
 uUpS27x1/VfBKy0yT21pNyygyL2kOTEQi2t+s3Uz8CVsazG/7o8oNRWM+J3ASMuLAAjI
 NTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JZCkL39tKR5ttW+qJKB2t3gyWuB8VcBN7GauxzyOgrI=;
 b=QObk2Dsbz5vf01wM6tfNXa3QBHatNEsTd0bB+pl94w9Rs02UushssU4LMWXV6MXRnO
 uf8tWsSqS/m9vq9/uzpWbHv3lzto2wSyocHocopdIetkBIyGW3c69pNNiertjYdJ1xU3
 eGyt/K22RaYlsbenlscyDBgP/ZPOzBXamO8duRELlGO1ST8KJ8EWWl1N7i/yHF+GJFnA
 8CtVo3O4DCYx14y3kTI6zJ2ToA4ho3CfBi22HbwnMsTYKIgP/2lkis9ob1VLFs+ZMh1V
 giFLIZ0HQPDTOIoO0RUzE8tBtWSA1RKOzgClw+UWjbFBF++xFCd2VEluxmdTXUklv3Dh
 fF5A==
X-Gm-Message-State: ANoB5pllGCtCsKA8esJqt5U1feDDf3xKTd4JalgGHUYmZ9/Ue9FyEYqk
 XRYecqN552z08Q3GSeNXJGjOlw==
X-Google-Smtp-Source: AA0mqf6/tmoTby061FizYgM0U//KfujjSuy0T07o4ZCbezgv/mR+qfC2CRHGEa+Wtd41eGEj+SQQQg==
X-Received: by 2002:ac2:5095:0:b0:4a2:ec0:c4bf with SMTP id
 f21-20020ac25095000000b004a20ec0c4bfmr856566lfm.164.1668177192404; 
 Fri, 11 Nov 2022 06:33:12 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a056512046500b004a2386b8cf4sm351025lfd.258.2022.11.11.06.33.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 06:33:11 -0800 (PST)
Message-ID: <29620da4-fda7-eb71-d9de-599e3bbd2de7@linaro.org>
Date: Fri, 11 Nov 2022 15:33:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,wsa883x: Add sound-name-prefix
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20221111091738.34290-1-krzysztof.kozlowski@linaro.org>
 <Y246wC8zEGJp9SmC@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y246wC8zEGJp9SmC@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>,
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

On 11/11/2022 13:06, Mark Brown wrote:
> On Fri, Nov 11, 2022 at 10:17:38AM +0100, Krzysztof Kozlowski wrote:
> 
>> For multiple speakers attached, it's useful to give them some name.
>> Sound core already supports this, so reference name-prefix.yaml.
> 
> If we need to manually extend the schema like this it should probably be
> done for all the CODEC devices.

Several files already do it:

  git grep name-prefix.yaml

The trouble for me would be here to identify which devices qualify from
bindings/sound.... everything having #sound-dai-cells?

Best regards,
Krzysztof

