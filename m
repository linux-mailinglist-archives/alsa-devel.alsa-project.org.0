Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C1E46128D
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 11:39:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2361618AB;
	Mon, 29 Nov 2021 11:38:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2361618AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638182349;
	bh=dcwy3RLQV/w5awfPVLWAbMq3X2GNuFL9JIAAsfMkIUk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V/IEaJ6W4PeeD4iDPLsXjGDMXX1318dTG6rq3WFXxgJjSPRo+2XrfdT5B152qH7A+
	 z0AO2A6OhWEfNtq9+TU30RUDB0xiEni/5r/B40SyCDioQW53A82ZObMbKEwsHhF2uM
	 L5a/U7z2R5PvSIsEbAja6YohzejqUrjwZKi7YZDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95746F80246;
	Mon, 29 Nov 2021 11:37:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6EB4F80240; Mon, 29 Nov 2021 11:37:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE394F800EE
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 11:37:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE394F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="ddFGCp3o"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1638182262; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=NfRWfQ/kjNZZNKYjAgXr3woDR9TbFsk4RacT+8xIke8=;
 b=ddFGCp3ovikSTiSr1lz+oB/PcQNqwrv2uAO3nEUDGXcP1rgP1CYwxYoVWcV+pztxm0ujTZaz
 0CpMZlJqjKIfFb89MMeruvZmCry06qV266Ki0XyHqnATb+1L8iA+EFOXbz5eRxvt3gRfuFoC
 bnoYP4GLp4lJCP4edXlKLgNDNXM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 61a4ad746bacc185a592ce27 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Nov 2021 10:37:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A0432C4360D; Mon, 29 Nov 2021 10:37:39 +0000 (UTC)
Received: from [10.242.143.72] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0E59BC4338F;
 Mon, 29 Nov 2021 10:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 0E59BC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v6 08/10] ASoC: dt-bindings: Add SC7280 lpass cpu bindings
To: Rob Herring <robh@kernel.org>
References: <1637928282-2819-1-git-send-email-srivasam@codeaurora.org>
 <1637928282-2819-9-git-send-email-srivasam@codeaurora.org>
 <YaO0ER2pNIQrvlxM@robh.at.kernel.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <9c21dc98-6bbb-bf33-361c-a768d185f07a@codeaurora.org>
Date: Mon, 29 Nov 2021 16:07:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaO0ER2pNIQrvlxM@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <potturu@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 agross@kernel.org, swboyd@chromium.org, lgirdwood@gmail.com,
 broonie@kernel.org, rohitkr@codeaurora.org, bjorn.andersson@linaro.org,
 judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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


On 11/28/2021 10:23 PM, Rob Herring wrote:
Thanks for Your Time Rob!!!
> On Fri, Nov 26, 2021 at 05:34:40PM +0530, Srinivasa Rao Mandadapu wrote:
>> Add bindings for sc7280 lpass cpu driver which supports
>> audio over i2s based speaker, soundwire based headset, msm dmics
>> and HDMI Port.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> ---
>>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 69 +++++++++++++++++++---
>>   1 file changed, 61 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> index 1e23c0e..0f5a57c 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> @@ -22,35 +22,36 @@ properties:
>>         - qcom,lpass-cpu
>>         - qcom,apq8016-lpass-cpu
>>         - qcom,sc7180-lpass-cpu
>> +      - qcom,sc7280-lpass-cpu
>>   
>>     reg:
>> -    maxItems: 2
>> +    maxItems: 5
>>       description: LPAIF core registers
>>   
>>     reg-names:
>> -    maxItems: 2
>> +    maxItems: 5
>>   
>>     clocks:
>>       minItems: 3
>> -    maxItems: 6
>> +    maxItems: 7
>>   
>>     clock-names:
>>       minItems: 3
>> -    maxItems: 6
>> +    maxItems: 7
>>   
>>     interrupts:
>> -    maxItems: 2
>> +    maxItems: 4
>>       description: LPAIF DMA buffer interrupt
>>   
>>     interrupt-names:
>> -    maxItems: 2
>> +    maxItems: 4
>>   
>>     qcom,adsp:
>>       $ref: /schemas/types.yaml#/definitions/phandle
>>       description: Phandle for the audio DSP node
>>   
>>     iommus:
>> -    maxItems: 2
>> +    maxItems: 3
>>       description: Phandle to apps_smmu node with sid mask
>>   
>>     power-domains:
>> @@ -69,7 +70,7 @@ patternProperties:
>>     "^dai-link@[0-9a-f]$":
>>       type: object
>>       description: |
>> -      LPASS CPU dai node for each I2S device. Bindings of each node
>> +      LPASS CPU dai node for each I2S device or Soundwire device. Bindings of each node
>>         depends on the specific driver providing the functionality and
>>         properties.
>>       properties:
>> @@ -174,6 +175,58 @@ allOf:
>>           - iommus
>>           - power-domains
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sc7280-lpass-cpu
>> +
>> +    then:
>> +      properties:
>> +        clock-names:
>> +          oneOf:
>> +            - items:   #for I2S
>> +                - const: lpass_aon_cc_audio_hm_h_clk
>> +                - const: lpass_core_cc_sysnoc_mport_core_clk
>> +                - const: lpass_core_cc_ext_if1_ibit_clk
>> +            - items:   #for Soundwire
>> +                - const: lpass_aon_cc_audio_hm_h_clk
>> +                - const: lpass_audio_cc_codec_mem0_clk
>> +                - const: lpass_audio_cc_codec_mem1_clk
>> +                - const: lpass_audio_cc_codec_mem2_clk
>> +            - items:   #for HDMI
>> +                - const: lpass_aon_cc_audio_hm_h_clk
> 'lpass_' and '_clk' are redundant.
Yes. but these clock names are defined by HW design team. clock drivers 
fallowed the same,  hence in audio drivers.
>
>> +
>> +        reg-names:
>> +          anyOf:
>> +            - items:   #for I2S
>> +                - const: lpass-lpaif
>> +            - items:   #for I2S and HDMI
>> +                - const: lpass-hdmiif
>> +                - const: lpass-lpaif
> Doesn't this apply to other SoCs?
>
>> +            - items:   #for I2S, soundwire and HDMI
>> +                - const: lpass-cdc-lpm
>> +                - const: lpass-rxtx-lpaif
>> +                - const: lpass-va-lpaif
>> +                - const: lpass-hdmiif
>> +                - const: lpass-lpaif
> 'lpass-' is redundant too, but consistency across SoCs is better.
>
> hdmiif and lpaif should be first. (Add new resources on the end.)
Okay.. order is maintained as per register addresses. if it's okay, even 
address range is out of order, will change accordingly.
>
>> +        interrupt-names:
>> +          anyOf:
>> +            - items:   #for I2S
>> +                - const: lpass-irq-lpaif
>> +            - items:   #for I2S and HDMI
>> +                - const: lpass-irq-lpaif
>> +                - const: lpass-irq-hdmi
>> +            - items:   #for I2S, soundwire and HDMI
>> +                - const: lpass-irq-lpaif
>> +                - const: lpass-irq-vaif
>> +                - const: lpass-irq-rxtxif
>> +                - const: lpass-irq-hdmi
> Again, add new entries to the end.
  Replied above for the same.
>> +
>> +      required:
>> +        - iommus
>> +        - power-domains
>> +
>>   examples:
>>     - |
>>       #include <dt-bindings/sound/sc7180-lpass.h>
>> -- 
>> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
>> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
>>
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

