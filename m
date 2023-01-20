Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2FE674EED
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 09:05:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0B642E94;
	Fri, 20 Jan 2023 09:04:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0B642E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674201919;
	bh=oWjRVrsMC0WCPzyo1xIgB09wccCH8PecYaF7U/x49z8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CftGk2ArxnK0yavYZnhBhiYe0k+6AoApqmbyLtY2FfTHKcEljaVVuxDq9ebd92DyR
	 7rdL5kNGW9PkTmUzehyK3Di+brS7WiqeLAGCyBrZ23LVDuzvNbU93LdfqQ/KIdgCWI
	 xvFQVxNwaDEQR6PbdoQ8ZHjWmYHJybEnFP/1kJFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74878F80246;
	Fri, 20 Jan 2023 09:04:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05902F8026D; Fri, 20 Jan 2023 09:04:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3D20F8024C
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 09:04:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3D20F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gd4l01rh
Received: by mail-wr1-x433.google.com with SMTP id q10so4109957wrs.2
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 00:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V6LXkIx8BANILDQmoLHswehPH28NdMe4BBg+GYgmQJc=;
 b=gd4l01rhpsa8H54xUMgiQ+zJGbH0SoJyTrI51hbsZysaJi8L40ZQIGPyyul0z7Ocg4
 zpTey7QZIqkSZ7gD5mfJdzGH+L4xP/Jxx56pspJ6DDz/Nuu1VfZEFelRQ4fi1j2kbkDG
 w6trpgj2whXf8arw9tAjTnPhr22VOyiu53zB5CjdInNNnTHdHsFAf3a3zOM2pa3gRF1e
 JnyE9UIa+CjL/Wu7vll6UEQG/D9fdAAnH4sEvkUbrmMjEHAcpAzpaIhiQwydr0b83pxt
 4aCsRknCcqzwyo8rJRE4R7ChWA6EjnQh9pcWq482df90gL/dh5ZcxXYq5aygoTOLg8md
 5CUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V6LXkIx8BANILDQmoLHswehPH28NdMe4BBg+GYgmQJc=;
 b=TiuMkChBC2pGyTb7GEf0hsM7NMWmVYSiYyitbdtLDYV0vDNRSibcgSWUdlNEk4gTuC
 fq3iV/nqcxMOyeIZBt2fLokw1UmwUVuI3yMoQ3QSFzKWff5hwTbxhmdw1tS9V1ZHW6eA
 uUD23Nv/tJJwOmdnKhVFtonpv6y5MRDxx4YdDw2NScJT3GpijLh/Wk9j9ija+xTC0r+f
 CaQHaneXCZZQyedp6wE+jOxT8czvNJifNanohf0o2cWYSvA1jwtLpGh1pVFMxbF6vGUT
 u3zAX2SZkXxKLBJjCdU9ohFbx1DGutIxdazpQ3iI1GYkBE7a2MoBrLeT7IWT/c8nvr6Q
 AaCg==
X-Gm-Message-State: AFqh2krtJJ3cnn/ZbmZtqVUNF/UU4JWsMcxgoBPH17MOJgqBXIofsVVt
 c+0IZwBc+Eh+a7yJaIbllhUZ7g==
X-Google-Smtp-Source: AMrXdXsMXAoaC0AHQ2YBbTngF/qLL6GGMIQ5qXh9iHZwnWh7GupAm7r9lc0MoGv9BvDY3wk+bH3dTg==
X-Received: by 2002:adf:8b1c:0:b0:2bf:9478:a91d with SMTP id
 n28-20020adf8b1c000000b002bf9478a91dmr1393wra.39.1674201855853; 
 Fri, 20 Jan 2023 00:04:15 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a5d6d0b000000b002bdda9856b5sm1822404wrq.50.2023.01.20.00.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 00:04:15 -0800 (PST)
Message-ID: <4be5a020-c9a3-cab9-921a-c4cdfe6ce979@linaro.org>
Date: Fri, 20 Jan 2023 09:04:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 4/7] arm64: dts: qcom: sc7280: Update VA/RX/TX macro
 clock nodes
Content-Language: en-US
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
 <7d874a5d-5a26-1ae1-58bc-dd819774190d@linaro.org>
 <3299b57b-7260-0189-ba6f-824db391d81c@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3299b57b-7260-0189-ba6f-824db391d81c@quicinc.com>
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

On 20/01/2023 07:35, Srinivasa Rao Mandadapu wrote:
> 
> On 1/20/2023 11:54 AM, Krzysztof Kozlowski wrote:
> Thanks for your valuable suggestion Krzysztof!!!
>> On 20/01/2023 05:47, Srinivasa Rao Mandadapu wrote:
>>> On 1/19/2023 7:01 PM, Krzysztof Kozlowski wrote:
>>> Thanks for your time Krzysztof!!!
>>>> On 19/01/2023 13:27, Srinivasa Rao Mandadapu wrote:
>>>>> Update VA, RX and TX macro and lpass_tlmm clock properties and
>>>>> enable them.
>>>> Everything is an update and this does not explain what exactly you are
>>>> updating in the nodes and why.
>>>>
>>>>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>>>>> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>>>> ---
>>>>>    .../qcom/sc7280-herobrine-audioreach-wcd9385.dtsi  | 59 ++++++++++++++++++++++
>>>>>    1 file changed, 59 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
>>>>> index 81e0f3a..674b01a 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
>>>>> @@ -8,8 +8,67 @@
>>>>>    
>>>>>    #include <dt-bindings/sound/qcom,q6afe.h>
>>>>>    
>>>>> +/delete-node/ &lpass_rx_macro;
>>>> Why?
>>> Actually in SoC dtsi (sc7280.dtsi) power domains property used.
>>>
>>> Which is not required for ADSP based solution. As there is no way to delete
>>>
>>> individual property, deleting node and recreating it here.
>>>
>> You can delete property - delete-property. However why in AudioReach
>> device comes without power domains? What does it mean "power domains
>> property is not required"? DTS describes the hardware and the rx macro
>> is powered, isn't it?
> 
> Actually in case ADSP bypass solution power domains are handled in HLOS 
> clock driver.
> 
> Whereas in ADSP based solution they are handled in ADSP firmware, and 
> from HLOS
> 
> voted as clocks.
> 
> Below is the reference commit.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9e3d83c52844f955aa2975f78cee48bf9f72f5e1

I am sorry, but this is one big mess. Hardware is one. I understand that
Linux drivers can be entirely different but here - and in the past with
few clocks - the hardware description keeps changing depending on the
wishes of developers. That's not how bindings and DTS work. This suggest
that DTS is being pushed to satisfy driver needs, not to properly
describe the hardware. I am sorry, but hardware does not change.

Best regards,
Krzysztof

