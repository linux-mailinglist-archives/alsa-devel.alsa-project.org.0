Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA20674D58
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 07:26:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 883762D4E;
	Fri, 20 Jan 2023 07:25:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 883762D4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674195967;
	bh=oKKmvmQuzPRch4P8WnZIhEX386ySVfoPDyApDWzozF0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ABwZscJXMXBYXiLxYDAyWD8k/fcNifr4lweTtHUOC/LGUw2AfgkZWadaOA0AO33MY
	 HBqRFPq0AdOLXnc0ta6zBxLgpyruAUaLCHApgaW6C1asUaJ28Ua8HPCj7X0/HRs0ga
	 NuryUCmcyoSBaWYhM1SzQsfcaH/xVeZd1QPBv4Ss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A561F800F0;
	Fri, 20 Jan 2023 07:25:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC716F8026D; Fri, 20 Jan 2023 07:25:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3166CF8024C
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 07:25:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3166CF8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=h3pmmokn
Received: by mail-wr1-x42f.google.com with SMTP id r2so3906935wrv.7
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 22:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GxQNp79R+XdyUWCcN7g4amNp/JsJi1+bDNVRhs+DKVA=;
 b=h3pmmoknuqFY6LkSoG2b9m1G2fI4oTQfwpfOF95O/vXYQjSnq8iQQ/krogHPVyRWyN
 xNLeAejsudG4WdJdsnB8sy7HyrM/t543hv+RfpXbAIr5dUUdiR8ADZF6Al+U/48543jE
 Ui8r4P8Bj0m7P0NvCpQn5HtRMSbkwEainVtT387LOU6xThDpgBHjjjP9Ztk559I9Tik5
 hRYYj2D/Xdtxk6/zQ8MJ27CZq0rfL6e1Pb642osulf1H7uN7ZgaznUexQlkH1GBNw27g
 luSZS/wL1qgHkINXetuFpv5NPWJw7i1yu1JM0raKod437FGd0duOog7rzTHGzFBQvnCY
 P1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GxQNp79R+XdyUWCcN7g4amNp/JsJi1+bDNVRhs+DKVA=;
 b=SUARTh//GeDLsebB/A4CajiHunOujtojzd6TTbpO/crhqjulJDypGHIiFw9+DXzPKe
 ZBlr1LiW/FT5q31fUc73/MttO9UTipIT/nLH4nU9zv4b+U0spNlcfdwdD1banHFE84xI
 An/56noOHTZlrGOe77VEgh2mjYlYGYgRl62u8Cfi+LNvRKzmD1ReaN8SsY/NMvU8fZD1
 3NVWVA0ahW886EPOh/50ziSSrLeWquzGvQGUIE6WfXLMWf84TBxEjJfala7+B1Hd4D+1
 h0oSI9ZfiAY/2xF7IcihZ/ToHS9hReY+OI8D/L0hjC49mD+otU0Gfaa2lfiBWEEHAKL7
 RZJw==
X-Gm-Message-State: AFqh2krdweXhl1jAlMOQOAEzrOe0pHFN2+/S6Rs/xEql9Zdjl0Y2VRhc
 zX24QXNiF9DvTphsZbc3Rrzscg==
X-Google-Smtp-Source: AMrXdXuDBWLKar3I9BvLZ2J3NTR0GEVbcT550ZY+Iw5aK49ZYMf4i+OxkxUx3eLGCWxD+LNNCzf1sg==
X-Received: by 2002:a05:6000:1049:b0:2bb:ee8a:4282 with SMTP id
 c9-20020a056000104900b002bbee8a4282mr11173469wrx.34.1674195902101; 
 Thu, 19 Jan 2023 22:25:02 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 z12-20020adfd0cc000000b002bdff778d87sm12335144wrh.34.2023.01.19.22.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 22:25:01 -0800 (PST)
Message-ID: <7d874a5d-5a26-1ae1-58bc-dd819774190d@linaro.org>
Date: Fri, 20 Jan 2023 07:24:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 4/7] arm64: dts: qcom: sc7280: Update VA/RX/TX macro
 clock nodes
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, vkoul@kernel.org,
 agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 srinivas.kandagatla@linaro.org, dianders@chromium.org, swboyd@chromium.org,
 judyhsiao@chromium.org, alsa-devel@alsa-project.org,
 quic_rjendra@quicinc.com, konrad.dybcio@somainline.org, mka@chromium.org
References: <1674131227-26456-1-git-send-email-quic_srivasam@quicinc.com>
 <1674131227-26456-5-git-send-email-quic_srivasam@quicinc.com>
 <17b895c0-3985-a012-9b02-94d5ebb11ff9@linaro.org>
 <9ae3b1b0-e9d6-6370-667b-88af5d0efa2e@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9ae3b1b0-e9d6-6370-667b-88af5d0efa2e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

On 20/01/2023 05:47, Srinivasa Rao Mandadapu wrote:
> 
> On 1/19/2023 7:01 PM, Krzysztof Kozlowski wrote:
> Thanks for your time Krzysztof!!!
>> On 19/01/2023 13:27, Srinivasa Rao Mandadapu wrote:
>>> Update VA, RX and TX macro and lpass_tlmm clock properties and
>>> enable them.
>> Everything is an update and this does not explain what exactly you are
>> updating in the nodes and why.
>>
>>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>>> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>> ---
>>>   .../qcom/sc7280-herobrine-audioreach-wcd9385.dtsi  | 59 ++++++++++++++++++++++
>>>   1 file changed, 59 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
>>> index 81e0f3a..674b01a 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
>>> @@ -8,8 +8,67 @@
>>>   
>>>   #include <dt-bindings/sound/qcom,q6afe.h>
>>>   
>>> +/delete-node/ &lpass_rx_macro;
>> Why?
> 
> Actually in SoC dtsi (sc7280.dtsi) power domains property used.
> 
> Which is not required for ADSP based solution. As there is no way to delete
> 
> individual property, deleting node and recreating it here.
> 

You can delete property - delete-property. However why in AudioReach
device comes without power domains? What does it mean "power domains
property is not required"? DTS describes the hardware and the rx macro
is powered, isn't it?

Best regards,
Krzysztof

