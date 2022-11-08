Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F209620BB5
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 10:06:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B396F83D;
	Tue,  8 Nov 2022 10:05:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B396F83D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667898395;
	bh=0v6rCsPkTJ2pPgeAGLq6myJaBZuL1LhnBCbh2y9EXmM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YuYyiaz1U80lYeF72InAM/lgaTaO1q8zzVwvQwyiE5cD/x0UKtATB3NDq6/0K9pQH
	 KBFq/Dn+yFVmLpF/OnFm2GkDQLSqVsj+PQhVP61Dp9XHbWBg1bQy++oNgbBPUwbAkM
	 Lv3Vd28R4becAukzbyGVGNWCN8De0ea6WueeRUjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71BC5F8020D;
	Tue,  8 Nov 2022 10:05:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E42D2F801D8; Tue,  8 Nov 2022 10:05:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF088F8016A
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 10:05:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF088F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qHwJCCWS"
Received: by mail-lj1-x235.google.com with SMTP id s24so20086443ljs.11
 for <alsa-devel@alsa-project.org>; Tue, 08 Nov 2022 01:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kXsunqUm2HDTmCDqbOSjR2R68f7AopmmB8Vca2SnJq8=;
 b=qHwJCCWS0XOQkDIjcYaxQ9gStZrPWyR8SPHtmzwes2N3oDxnk5fz3PPkpjWzNOuhpX
 3QoKUQVk9RwjxR+LgyUqoZJP9L5X5N0ZuFvNrgcdRA83zGFR8OVOXwLCJYaH23nFP6v2
 XDhAmKNLNP85Mh2vUy3K4NBK30uimsbESLIIt9V03fhOFZzc95KmKEhE36Z+l2fXj/t+
 VwUADSuCR8Pt5P9Yva3qt9gjsi5i1Iw59zLJBXgwszPKNZcRDPmcPtVsr13PstE4Ztq7
 E0/cc9KxgwcAuQRPtQsLqN9BtIuobbPQk8a/whQYWbY1YYU1gEPnXEm+9AogVwSpXe5S
 +bNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kXsunqUm2HDTmCDqbOSjR2R68f7AopmmB8Vca2SnJq8=;
 b=QnGw3GXcA6iVxBIYgQQaL279dg6jfwwdN42fGUb8BShNlW0CrXs4ygdHQAwNaDd7gX
 Z8iGtvTQFoH77j6N0DyRoChMSSk/kAfufZPZqQ4pJWo3wtEAHBcY469NPQ4TavwV18dC
 M29eXtOZY4qDzfeGvXgENWPv8ygTycsYrRFzm/TA3dHKWW32y8nGkTh9/xp2uq+jgpLx
 dc7G1WQkNx/vhi0tx1Y4T9NaMSmkRY50FuTun7x7NdnIPcuW74NAlpslsr90pqdvOmW+
 sbjzJBbEdwp3GaP073a9WZQTIBKIZrX+PZRRjTDge6btLHc8Y8JRvK0loL6sd8+2yIg+
 1Kng==
X-Gm-Message-State: ACrzQf2sPeMgxgi29s6eup0oSOPhwD2jNpRCxQzaFpjePYzqcxT3zr5M
 ZqCZ8mkn/sRmOW4VTdFwGTwF/A==
X-Google-Smtp-Source: AMsMyM5CVTCt1nr9WSYNAzE72eCCml2Z6lERa/crXfxYECsPvwZb5J6x8auqsISWf/cLrWEK6p1gAw==
X-Received: by 2002:a05:651c:882:b0:261:81b3:16b3 with SMTP id
 d2-20020a05651c088200b0026181b316b3mr17859370ljq.142.1667898327607; 
 Tue, 08 Nov 2022 01:05:27 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a19dc52000000b004978e51b691sm1705996lfj.266.2022.11.08.01.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 01:05:27 -0800 (PST)
Message-ID: <9351494a-e866-251e-6ac3-f0f1a0966fd0@linaro.org>
Date: Tue, 8 Nov 2022 10:05:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 3/3] dt-bindings: soundwire: Convert text bindings to
 DT Schema
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, vkoul@kernel.org,
 agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 srinivas.kandagatla@linaro.org, dianders@chromium.org, swboyd@chromium.org,
 judyhsiao@chromium.org, alsa-devel@alsa-project.org,
 quic_rjendra@quicinc.com, konrad.dybcio@somainline.org, mka@chromium.org
References: <1667830844-31566-1-git-send-email-quic_srivasam@quicinc.com>
 <1667830844-31566-4-git-send-email-quic_srivasam@quicinc.com>
 <7abbac13-3a2b-2ea7-98d2-8bcace52c3de@linaro.org>
 <2a6b68df-54e0-28b4-2eb2-fd8c1ad7ed60@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2a6b68df-54e0-28b4-2eb2-fd8c1ad7ed60@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
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

On 08/11/2022 07:42, Srinivasa Rao Mandadapu wrote:
> 
> On 11/7/2022 8:41 PM, Krzysztof Kozlowski wrote:
> Thanks for Your time Krzysztof!!!
>> On 07/11/2022 15:20, Srinivasa Rao Mandadapu wrote:
>>> Convert soundwire text bindings to DT Schema format.
>>>
>>> Update interrupt property items as per device tree,
>>> as it is not appropriately described in text file.
>>>
>>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>>> Co-developed-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
>>> Signed-off-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
>>> ---
>>> This patch depends on:
>>>      https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=42801e6185290d63691bd39cf8a3bba6cd5fe520
>> Hi,
>>
>> This is a bit surprising. You pointed to Linus' repo, so what does this
>> dependency mean? The Linus' repo is the mainline, there is nothing else,
>> so all its commits are already in every tree... unless this is an RC
>> fix? If so, you should rather say which RC is needed.
> 
> Yeah. Will remove it. Actually in initial version, when used different 
> repo, got bot errors.
> 
> So to fix that, mentioned this dependency and continued the same in next 
> versions.
> 
>>
>>> Changes since V3:
>>>    -- Remove subnode description and add appropriate pattern properties.
>>>    -- Add interrput names in example.
>>>    -- update some properties description.
>>>    -- Revert minIteams change in previous version.
>>>    -- Rebase to latest code base.
>>> Changes since V2:
>>>    -- Update commit message.
>>>    -- Add child node property.
>>>    -- Change file name.
>>>    -- Remove minIteams for few properties.
>>>    -- Remove redundant required properties.
>>>    -- Remove redundant description for wakeup-source property.
>>>    -- Update interrupt property items.
>>> Changes since V1:
>>>    -- Remove the status field in example.
>>>    -- Remove interrupt-names property in the required list.
>>>    -- Add the wakeup-source property.	
>>>   
>>>   .../devicetree/bindings/soundwire/qcom,sdw.txt     | 215 ------------------
>>>   .../bindings/soundwire/qcom,soundwire.yaml         | 241 +++++++++++++++++++++
>>>   2 files changed, 241 insertions(+), 215 deletions(-)
>>>   delete mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
>>>   create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
>>> deleted file mode 100644
>>> index e0faed8..0000000
>>> --- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
>>> +++ /dev/null
>>> @@ -1,215 +0,0 @@
>>> -Qualcomm SoundWire Controller Bindings
>>> -
>>> -
>>> -This binding describes the Qualcomm SoundWire Controller along with its
>>> -board specific bus parameters.
>>> -
>>> -- compatible:
>>> -	Usage: required
>>> -	Value type: <stringlist>
>>> -	Definition: must be "qcom,soundwire-v<MAJOR>.<MINOR>.<STEP>",
>>> -		    Example:
>>> -			"qcom,soundwire-v1.3.0"
>>> -			"qcom,soundwire-v1.5.0"
>>> -			"qcom,soundwire-v1.5.1"
>>> -			"qcom,soundwire-v1.6.0"
>>> -			"qcom,soundwire-v1.7.0"
>>> -- reg:
>>> -	Usage: required
>>> -	Value type: <prop-encoded-array>
>>> -	Definition: the base address and size of SoundWire controller
>>> -		    address space.
>>> -
>>> -- interrupts:
>>> -	Usage: required
>>> -	Value type: <prop-encoded-array>
>>> -	Definition: should specify the SoundWire Controller core and optional
>>> -		    wake IRQ
>>> -
>>> -- interrupt-names:
>>> -	Usage: Optional
>>> -	Value type: boolean
>>> -	Value type: <stringlist>
>>> -	Definition: should be "core" for core and "wakeup" for wake interrupt.
>>> -
>>> -- wakeup-source:
>>> -	Usage: Optional
>>> -	Value type: boolean
>>> -	Definition: should specify if SoundWire Controller is wake up capable.
>>> -
>>> -- clock-names:
>>> -	Usage: required
>>> -	Value type: <stringlist>
>>> -	Definition: should be "iface" for SoundWire Controller interface clock
>>> -
>>> -- clocks:
>>> -	Usage: required
>>> -	Value type: <prop-encoded-array>
>>> -	Definition: should specify the SoundWire Controller interface clock
>>> -
>>> -- #sound-dai-cells:
>>> -	Usage: required
>>> -	Value type: <u32>
>>> -	Definition: must be 1 for digital audio interfaces on the controller.
>>> -
>>> -- qcom,dout-ports:
>>> -	Usage: required
>>> -	Value type: <u32>
>>> -	Definition: must be count of data out ports
>>> -
>>> -- qcom,din-ports:
>>> -	Usage: required
>>> -	Value type: <u32>
>>> -	Definition: must be count of data in ports
>>> -
>>> -- qcom,ports-offset1:
>>> -	Usage: required
>>> -	Value type: <prop-encoded-array>
>>> -	Definition: should specify payload transport window offset1 of each
>>> -		    data port. Out ports followed by In ports.
>>> -		    Value of 0xFF indicates that this option is not implemented
>>> -		    or applicable for the respective data port.
>>> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> -
>>> -- qcom,ports-offset2:
>>> -	Usage: required
>>> -	Value type: <prop-encoded-array>
>>> -	Definition: should specify payload transport window offset2 of each
>>> -		    data port. Out ports followed by In ports.
>>> -		    Value of 0xFF indicates that this option is not implemented
>>> -		    or applicable for the respective data port.
>>> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> -
>>> -- qcom,ports-sinterval-low:
>>> -	Usage: required
>>> -	Value type: <prop-encoded-array>
>>> -	Definition: should be sample interval low of each data port.
>>> -		    Out ports followed by In ports. Used for Sample Interval
>>> -		    calculation.
>>> -		    Value of 0xFF indicates that this option is not implemented
>>> -		    or applicable for the respective data port.
>>> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> -
>>> -- qcom,ports-word-length:
>>> -	Usage: optional
>>> -	Value type: <prop-encoded-array>
>>> -	Definition: should be size of payload channel sample.
>>> -		    Value of 0xFF indicates that this option is not implemented
>>> -		    or applicable for the respective data port.
>>> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> -
>>> -- qcom,ports-block-pack-mode:
>>> -	Usage: optional
>>> -	Value type: <prop-encoded-array>
>>> -	Definition: should be 0 or 1 to indicate the block packing mode.
>>> -		    0 to indicate Blocks are per Channel
>>> -		    1 to indicate Blocks are per Port.
>>> -		    Out ports followed by In ports.
>>> -		    Value of 0xFF indicates that this option is not implemented
>>> -		    or applicable for the respective data port.
>>> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> -
>>> -- qcom,ports-block-group-count:
>>> -	Usage: optional
>>> -	Value type: <prop-encoded-array>
>>> -	Definition: should be in range 1 to 4 to indicate how many sample
>>> -		    intervals are combined into a payload.
>>> -		    Out ports followed by In ports.
>>> -		    Value of 0xFF indicates that this option is not implemented
>>> -		    or applicable for the respective data port.
>>> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> -
>>> -- qcom,ports-lane-control:
>>> -	Usage: optional
>>> -	Value type: <prop-encoded-array>
>>> -	Definition: should be in range 0 to 7 to identify which	data lane
>>> -		    the data port uses.
>>> -		    Out ports followed by In ports.
>>> -		    Value of 0xFF indicates that this option is not implemented
>>> -		    or applicable for the respective data port.
>>> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> -
>>> -- qcom,ports-hstart:
>>> -	Usage: optional
>>> -	Value type: <prop-encoded-array>
>>> -	Definition: should be number identifying lowerst numbered coloum in
>>> -		    SoundWire Frame, i.e. left edge of the Transport sub-frame
>>> -		    for each port. Values between 0 and 15 are valid.
>>> -		    Out ports followed by In ports.
>>> -		    Value of 0xFF indicates that this option is not implemented
>>> -		    or applicable for the respective data port.
>>> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> -
>>> -- qcom,ports-hstop:
>>> -	Usage: optional
>>> -	Value type: <prop-encoded-array>
>>> -	Definition: should be number identifying highest numbered coloum in
>>> -		    SoundWire Frame, i.e. the right edge of the Transport
>>> -		    sub-frame for each port. Values between 0 and 15 are valid.
>>> -		    Out ports followed by In ports.
>>> -		    Value of 0xFF indicates that this option is not implemented
>>> -		    or applicable for the respective data port.
>>> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> -
>>> -- qcom,dports-type:
>>> -	Usage: optional
>>> -	Value type: <prop-encoded-array>
>>> -	Definition: should be one of the following types
>>> -		    0 for reduced port
>>> -		    1 for simple ports
>>> -		    2 for full port
>>> -		    Out ports followed by In ports.
>>> -		    Value of 0xFF indicates that this option is not implemented
>>> -		    or applicable for the respective data port.
>>> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> -
>>> -- reset:
>>> -	Usage: optional
>>> -	Value type: <prop-encoded-array>
>>> -	Definition: Should specify the SoundWire audio CSR reset controller interface,
>>> -		    which is required for SoundWire version 1.6.0 and above.
>>> -
>>> -- reset-names:
>>> -	Usage: optional
>>> -	Value type: <stringlist>
>>> -	Definition: should be "swr_audio_cgcr" for SoundWire audio CSR reset
>>> -		    controller interface.
>>> -
>>> -Note:
>>> -	More Information on detail of encoding of these fields can be
>>> -found in MIPI Alliance SoundWire 1.0 Specifications.
>>> -
>>> -= SoundWire devices
>>> -Each subnode of the bus represents SoundWire device attached to it.
>>> -The properties of these nodes are defined by the individual bindings.
>>> -
>>> -= EXAMPLE
>>> -The following example represents a SoundWire controller on DB845c board
>>> -which has controller integrated inside WCD934x codec on SDM845 SoC.
>>> -
>>> -soundwire: soundwire@c85 {
>>> -	compatible = "qcom,soundwire-v1.3.0";
>>> -	reg = <0xc85 0x20>;
>>> -	interrupts = <20 IRQ_TYPE_EDGE_RISING>;
>>> -	clocks = <&wcc>;
>>> -	clock-names = "iface";
>>> -	resets = <&lpass_audiocc LPASS_AUDIO_SWR_TX_CGCR>;
>>> -	reset-names = "swr_audio_cgcr";
>>> -	#sound-dai-cells = <1>;
>>> -	qcom,dports-type = <0>;
>>> -	qcom,dout-ports	= <6>;
>>> -	qcom,din-ports	= <2>;
>>> -	qcom,ports-sinterval-low = /bits/ 8  <0x07 0x1F 0x3F 0x7 0x1F 0x3F 0x0F 0x0F>;
>>> -	qcom,ports-offset1 = /bits/ 8 <0x01 0x02 0x0C 0x6 0x12 0x0D 0x07 0x0A >;
>>> -	qcom,ports-offset2 = /bits/ 8 <0x00 0x00 0x1F 0x00 0x00 0x1F 0x00 0x00>;
>>> -
>>> -	/* Left Speaker */
>>> -	left{
>>> -		....
>>> -	};
>>> -
>>> -	/* Right Speaker */
>>> -	right{
>>> -		....
>>> -	};
>>> -};
>>> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>>> new file mode 100644
>>> index 0000000..b0590cb
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>>> @@ -0,0 +1,241 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm SoundWire Controller
>>> +
>>> +maintainers:
>>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> +  - Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>>> +
>>> +description:
>>> +  The Qualcomm SoundWire controller along with its board specific bus parameters.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,soundwire-v1.3.0
>>> +      - qcom,soundwire-v1.5.0
>>> +      - qcom,soundwire-v1.5.1
>>> +      - qcom,soundwire-v1.6.0
>>> +      - qcom,soundwire-v1.7.0
>> Missing blank line.
> Okay. will add it.
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    minItems: 1
>>> +    items:
>>> +      - description: specify the SoundWire controller core.
>>> +      - description: specify the Soundwire controller wake IRQ.
>>> +
>>> +  interrupt-names:
>>> +    minItems: 1
>>> +    items:
>>> +      - const: core
>>> +      - const: wakeup
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: iface clock
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: iface
>>> +
>>> +  resets:
>>> +    items:
>>> +      - description: SWR_AUDIO_CGCR RESET
>>> +
>>> +  reset-names:
>>> +    items:
>>> +      - const: swr_audio_cgcr
>>> +
>>> +  '#sound-dai-cells':
>>> +    const: 1
>>> +
>>> +  '#address-cells':
>>> +    const: 2
>>> +
>>> +  '#size-cells':
>>> +    const: 0
>>> +
>>> +  wakeup-source: true
>>> +
>>> +  qcom,din-ports:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: count of data in ports
>>> +
>>> +  qcom,dout-ports:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: count of data out ports
>>> +
>>> +  qcom,ports-word-length:
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    description: Size of payload channel sample.
>>> +                 Value of 0xFF indicates that this option is not implemented
>>> +                 or applicable for the respective data port.
>>> +                 More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> +    minItems: 3
>>> +    maxItems: 5
>>> +
>>> +  qcom,ports-sinterval-low:
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    description: Sample interval low of each data port.
>>> +                 Out ports followed by In ports. Used for Sample Interval
>>> +                 calculation.
>>> +                 Value of 0xFF indicates that this option is not implemented
>>> +                 or applicable for the respective data port.
>>> +                 More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> +    minItems: 3
>>> +    maxItems: 8
>>> +
>>> +  qcom,ports-offset1:
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    description: Payload transport window offset1 of each
>>> +                 data port. Out ports followed by In ports.
>>> +                 Value of 0xFF indicates that this option is not implemented
>>> +                 or applicable for the respective data port.
>>> +                 More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> +    minItems: 3
>>> +    maxItems: 8
>>> +
>>> +  qcom,ports-offset2:
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    description: Payload transport window offset2 of each
>>> +                 data port. Out ports followed by In ports.
>>> +                 Value of 0xFF indicates that this option is not implemented
>>> +                 or applicable for the respective data port.
>>> +                 More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> +    minItems: 3
>>> +    maxItems: 8
>>> +
>>> +  qcom,ports-lane-control:
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    description: Identify which data lane the data port uses.
>>> +                 Out ports followed by In ports.
>>> +                 Value of 0xFF indicates that this option is not implemented
>>> +                 or applicable for the respective data port.
>>> +                 More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> +    minItems: 3
>>> +    maxItems: 5
>>> +
>>> +  qcom,ports-block-pack-mode:
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    description: Indicate the block packing mode.
>>> +                 0 to indicate Blocks are per Channel
>>> +                 1 to indicate Blocks are per Port.
>>> +                 Out ports followed by In ports.
>>> +                 Value of 0xFF indicates that this option is not implemented
>>> +                 or applicable for the respective data port.
>>> +                 More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> +    minItems: 3
>>> +    maxItems: 8
>>> +
>>> +  qcom,ports-hstart:
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    description: Identifying lowerst numbered coloum in
>>> +                 SoundWire Frame, i.e. left edge of the Transport sub-frame
>>> +                 for each port. Values between 0 and 15 are valid.
>>> +                 Out ports followed by In ports.
>>> +                 Value of 0xFF indicates that this option is not implemented
>>> +                 or applicable for the respective data port.
>>> +                 More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> +    minItems: 3
>>> +    maxItems: 5
>>> +
>>> +  qcom,ports-hstop:
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    description: Identifying highest numbered coloum in
>>> +                 SoundWire Frame, i.e. the right edge of the Transport
>>> +                 sub-frame for each port. Values between 0 and 15 are valid.
>>> +                 Out ports followed by In ports.
>>> +                 Value of 0xFF indicates that this option is not implemented
>>> +                 or applicable for the respective data port.
>>> +                 More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> +    minItems: 3
>>> +    maxItems: 5
>>> +
>>> +  qcom,ports-block-group-count:
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    description: In range 1 to 4 to indicate how many sample
>>> +                 intervals are combined into a payload.
>>> +                 Out ports followed by In ports.
>>> +                 Value of 0xFF indicates that this option is not implemented
>>> +                 or applicable for the respective data port.
>>> +                 More info in MIPI Alliance SoundWire 1.0 Specifications.
>>> +    minItems: 3
>>> +    maxItems: 5
>>> +
>>> +  label:
>>> +    maxItems: 1
>>> +
>>> +patternProperties:
>>> +  "^.*@[0-9a-f],[0-9a-f]$":
>>> +    type: object
>> You should have here a description.
> 
> Bit confusion Here. In any of examples there is no description for 
> patternProperties.

That's interesting, let's check:
$ git grep -C 4 patternProperties -- Documentation/devicetree/bindings/

First has description, second does not have, third has, 4th has, 5th
has, 6th has, 7th has, 8th has.

So from all first 8 entries, only one did not have. When the objects are
obvious or are a standard properties, the description could be skipped,
but in regular cases description is expected. Just like for every custom
property.

> You mean, description for below compatible property?

No, description on the level of type: object.


> 
>>
>>> +    properties:
>>> +      compatible:
>>> +        pattern: "^sdw[0-9a-f]{1}[0-9a-f]{4}[0-9a-f]{4}[0-9a-f]{2}$"
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +  - clocks
>>> +  - clock-names
>>> +  - '#sound-dai-cells'
>>> +  - '#address-cells'
>>> +  - '#size-cells'
>>> +  - qcom,dout-ports
>>> +  - qcom,din-ports
>>> +  - qcom,ports-sinterval-low
>>> +  - qcom,ports-offset1
>>> +  - qcom,ports-offset2
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>> +    #include <dt-bindings/clock/qcom,lpassaudiocc-sc7280.h>
>>> +
>>> +    soundwire@3210000 {
>>> +        compatible = "qcom,soundwire-v1.6.0";
>>> +        reg = <0x03210000 0x2000>;
>>> +
>>> +        interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
>>> +                     <&pdc 130 IRQ_TYPE_LEVEL_HIGH>;
>>> +
>>> +        interrupt-names = "core";
>> Does not look like you tested the bindings. Please run `make
>> dt_binding_check` (see
>> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> Tested bindings and didn't see any issues on my setup. will do cross check.

You have two interrupts but only one name.

Best regards,
Krzysztof

