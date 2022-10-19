Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D81D36037DE
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 04:06:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DCDAA915;
	Wed, 19 Oct 2022 04:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DCDAA915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666145189;
	bh=/XWmbKqaTv2e2X7N9DePOniEsfYiv5MqjTibb5tDnvY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xj9DCGsbcw2vDZ4gFSCMQQLYD38PQ/AQWPg8vTUhYN1W2jmoJzF9crdXMlQkv3aAN
	 ug7tCYU15b87dcdykJM1Mm56c2qlSMTwjtneeqZgYGe7G4lR+zSbubC1mO9O+/N6F2
	 AYD9Olc5BLQFC1mXV5DCPqpACHSPYXF9aZLvfsEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C772DF80087;
	Wed, 19 Oct 2022 04:05:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15B3EF804CC; Wed, 19 Oct 2022 04:05:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23643F80087
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 04:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23643F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="v6B66Epd"
Received: by mail-qt1-x829.google.com with SMTP id s3so10875847qtn.12
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 19:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QswU31LSh5ZdOJRrtF/d3I1n4Ue2g+YQ2zTVHTaS3js=;
 b=v6B66Epd1nm3eQtUzxZGXV3yeJJl6ADIzd6O33lLiJ+zw0+5bAfiX/E1LzqFi1KSD+
 tG1b6awnbdyGhw5DJNAP8xNJEyZ2lUEa6U61iXgTJEjKOVpM+VPVt9Udfsd9x/+nz2bd
 2qK8MiYBI1Oo4mpGUizHMINFKousb2OYYM3x5Y0OrRx0nX9cGwMgTJKCYHZDGbHkIb3z
 uYrA8ecDtx19eLjJMzf0HSeag4EcU3ePhV/Xbh8LnwLdBjgBhWeoy0suGkmzsW7mAUwb
 3rvUQ+jGnMqpLJmELSdCp2KBW7tZtkkmulfLIStWUisGqCvVXWg1mggZhyi32SsKlFuI
 IsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QswU31LSh5ZdOJRrtF/d3I1n4Ue2g+YQ2zTVHTaS3js=;
 b=Gq3Q1jXsekhDlbODKIJhk4v7vHwpBph5Ec1T19iAwP/8QGy2+Y1i/q0lpVDh7b0eGF
 /71hhlJmPApnS5vgutfLJJbF9KUL6C5pW3ydAgpjizXxdOyDUstwFzvPCNuEJ6eH97Pm
 feNYJQhyLdd7AL0XMPtdec5ps6LiXpWpHCdl0t2GFt2lUe1d63vJa9urNC7ePxaIO5Be
 DGYm2b2MQwwd3YXpzm7HhH1TRAxhg/bPbOWY11XFAgDrJ+YRODxOeSL957ZWzLlJtPjs
 yEXW3XruJlCOuLCo/Zbav3WT48Fzb1u8pI7WmdZYTRp2uUayCBoLubNyBMDVZg1RR6sW
 bxIA==
X-Gm-Message-State: ACrzQf1yiH0c2UH1u6Rlj6haoLdxPfC5DjstjF1+dwHEulF4F1YmQmzv
 ieifA67zdr0i84ipWDon65VGdQ==
X-Google-Smtp-Source: AMsMyM5XQ5xSnsJeY6ajFBG6Eg/rRsnr6/1enI7CAeoXKoCqPwy+O3HUMeGfUf+pmmOuBaEGD6VUjA==
X-Received: by 2002:ac8:5751:0:b0:39c:b848:198f with SMTP id
 17-20020ac85751000000b0039cb848198fmr4677446qtx.429.1666145124446; 
 Tue, 18 Oct 2022 19:05:24 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net.
 [72.83.177.149]) by smtp.gmail.com with ESMTPSA id
 bs6-20020a05620a470600b006eee3a09ff3sm3788294qkb.69.2022.10.18.19.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 19:05:23 -0700 (PDT)
Message-ID: <abeb10da-9a29-437e-1351-3f61386dc6ad@linaro.org>
Date: Tue, 18 Oct 2022 22:05:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2] dt-bindings: soundwire: Convert text file to yaml
 format
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, vkoul@kernel.org,
 agross@kernel.org, andersson@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, quic_plai@quicinc.com,
 bgoswami@quicinc.com, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, quic_rohkumar@quicinc.com,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1666092240-22008-1-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1666092240-22008-1-git-send-email-quic_srivasam@quicinc.com>
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

On 18/10/2022 07:24, Srinivasa Rao Mandadapu wrote:
> Update soundwire bindings with yaml formats.

The commit title and body are not really accurate. YAML is just format,
you convert the bindings to DT schema.

> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
> Signed-off-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.


> ---
> 
> This patch depends on:
>     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=42801e6185290d63691bd39cf8a3bba6cd5fe520
> 
> Changes since V1:
>   -- Remove the status field in example.
>   -- Remove interrupt-names property in the required list.
>   -- Add the wakeup-source property.	
>  
>  .../devicetree/bindings/soundwire/qcom,sdw.txt     | 214 ---------------------
>  .../devicetree/bindings/soundwire/qcom,sdw.yaml    | 186 ++++++++++++++++++
>  2 files changed, 186 insertions(+), 214 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
>  create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> deleted file mode 100644
> index c85c257..0000000
> --- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> +++ /dev/null
> @@ -1,214 +0,0 @@
> -Qualcomm SoundWire Controller Bindings
> -
> -
> -This binding describes the Qualcomm SoundWire Controller along with its
> -board specific bus parameters.
> -
> -- compatible:
> -	Usage: required
> -	Value type: <stringlist>
> -	Definition: must be "qcom,soundwire-v<MAJOR>.<MINOR>.<STEP>",
> -		    Example:
> -			"qcom,soundwire-v1.3.0"
> -			"qcom,soundwire-v1.5.0"
> -			"qcom,soundwire-v1.5.1"
> -			"qcom,soundwire-v1.6.0"
> -- reg:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: the base address and size of SoundWire controller
> -		    address space.
> -
> -- interrupts:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: should specify the SoundWire Controller core and optional
> -		    wake IRQ
> -
> -- interrupt-names:
> -	Usage: Optional
> -	Value type: boolean
> -	Value type: <stringlist>
> -	Definition: should be "core" for core and "wakeup" for wake interrupt.
> -
> -- wakeup-source:
> -	Usage: Optional
> -	Value type: boolean
> -	Definition: should specify if SoundWire Controller is wake up capable.
> -
> -- clock-names:
> -	Usage: required
> -	Value type: <stringlist>
> -	Definition: should be "iface" for SoundWire Controller interface clock
> -
> -- clocks:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: should specify the SoundWire Controller interface clock
> -
> -- #sound-dai-cells:
> -	Usage: required
> -	Value type: <u32>
> -	Definition: must be 1 for digital audio interfaces on the controller.
> -
> -- qcom,dout-ports:
> -	Usage: required
> -	Value type: <u32>
> -	Definition: must be count of data out ports
> -
> -- qcom,din-ports:
> -	Usage: required
> -	Value type: <u32>
> -	Definition: must be count of data in ports
> -
> -- qcom,ports-offset1:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: should specify payload transport window offset1 of each
> -		    data port. Out ports followed by In ports.
> -		    Value of 0xFF indicates that this option is not implemented
> -		    or applicable for the respective data port.
> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
> -
> -- qcom,ports-offset2:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: should specify payload transport window offset2 of each
> -		    data port. Out ports followed by In ports.
> -		    Value of 0xFF indicates that this option is not implemented
> -		    or applicable for the respective data port.
> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
> -
> -- qcom,ports-sinterval-low:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: should be sample interval low of each data port.
> -		    Out ports followed by In ports. Used for Sample Interval
> -		    calculation.
> -		    Value of 0xFF indicates that this option is not implemented
> -		    or applicable for the respective data port.
> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
> -
> -- qcom,ports-word-length:
> -	Usage: optional
> -	Value type: <prop-encoded-array>
> -	Definition: should be size of payload channel sample.
> -		    Value of 0xFF indicates that this option is not implemented
> -		    or applicable for the respective data port.
> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
> -
> -- qcom,ports-block-pack-mode:
> -	Usage: optional
> -	Value type: <prop-encoded-array>
> -	Definition: should be 0 or 1 to indicate the block packing mode.
> -		    0 to indicate Blocks are per Channel
> -		    1 to indicate Blocks are per Port.
> -		    Out ports followed by In ports.
> -		    Value of 0xFF indicates that this option is not implemented
> -		    or applicable for the respective data port.
> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
> -
> -- qcom,ports-block-group-count:
> -	Usage: optional
> -	Value type: <prop-encoded-array>
> -	Definition: should be in range 1 to 4 to indicate how many sample
> -		    intervals are combined into a payload.
> -		    Out ports followed by In ports.
> -		    Value of 0xFF indicates that this option is not implemented
> -		    or applicable for the respective data port.
> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
> -
> -- qcom,ports-lane-control:
> -	Usage: optional
> -	Value type: <prop-encoded-array>
> -	Definition: should be in range 0 to 7 to identify which	data lane
> -		    the data port uses.
> -		    Out ports followed by In ports.
> -		    Value of 0xFF indicates that this option is not implemented
> -		    or applicable for the respective data port.
> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
> -
> -- qcom,ports-hstart:
> -	Usage: optional
> -	Value type: <prop-encoded-array>
> -	Definition: should be number identifying lowerst numbered coloum in
> -		    SoundWire Frame, i.e. left edge of the Transport sub-frame
> -		    for each port. Values between 0 and 15 are valid.
> -		    Out ports followed by In ports.
> -		    Value of 0xFF indicates that this option is not implemented
> -		    or applicable for the respective data port.
> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
> -
> -- qcom,ports-hstop:
> -	Usage: optional
> -	Value type: <prop-encoded-array>
> -	Definition: should be number identifying highest numbered coloum in
> -		    SoundWire Frame, i.e. the right edge of the Transport
> -		    sub-frame for each port. Values between 0 and 15 are valid.
> -		    Out ports followed by In ports.
> -		    Value of 0xFF indicates that this option is not implemented
> -		    or applicable for the respective data port.
> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
> -
> -- qcom,dports-type:
> -	Usage: optional
> -	Value type: <prop-encoded-array>
> -	Definition: should be one of the following types
> -		    0 for reduced port
> -		    1 for simple ports
> -		    2 for full port
> -		    Out ports followed by In ports.
> -		    Value of 0xFF indicates that this option is not implemented
> -		    or applicable for the respective data port.
> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
> -
> -- reset:
> -	Usage: optional
> -	Value type: <prop-encoded-array>
> -	Definition: Should specify the SoundWire audio CSR reset controller interface,
> -		    which is required for SoundWire version 1.6.0 and above.
> -
> -- reset-names:
> -	Usage: optional
> -	Value type: <stringlist>
> -	Definition: should be "swr_audio_cgcr" for SoundWire audio CSR reset
> -		    controller interface.
> -
> -Note:
> -	More Information on detail of encoding of these fields can be
> -found in MIPI Alliance SoundWire 1.0 Specifications.
> -
> -= SoundWire devices
> -Each subnode of the bus represents SoundWire device attached to it.
> -The properties of these nodes are defined by the individual bindings.
> -
> -= EXAMPLE
> -The following example represents a SoundWire controller on DB845c board
> -which has controller integrated inside WCD934x codec on SDM845 SoC.
> -
> -soundwire: soundwire@c85 {
> -	compatible = "qcom,soundwire-v1.3.0";
> -	reg = <0xc85 0x20>;
> -	interrupts = <20 IRQ_TYPE_EDGE_RISING>;
> -	clocks = <&wcc>;
> -	clock-names = "iface";
> -	resets = <&lpass_audiocc LPASS_AUDIO_SWR_TX_CGCR>;
> -	reset-names = "swr_audio_cgcr";
> -	#sound-dai-cells = <1>;
> -	qcom,dports-type = <0>;
> -	qcom,dout-ports	= <6>;
> -	qcom,din-ports	= <2>;
> -	qcom,ports-sinterval-low = /bits/ 8  <0x07 0x1F 0x3F 0x7 0x1F 0x3F 0x0F 0x0F>;
> -	qcom,ports-offset1 = /bits/ 8 <0x01 0x02 0x0C 0x6 0x12 0x0D 0x07 0x0A >;
> -	qcom,ports-offset2 = /bits/ 8 <0x00 0x00 0x1F 0x00 0x00 0x1F 0x00 0x00>;
> -
> -	/* Left Speaker */
> -	left{
> -		....
> -	};
> -
> -	/* Right Speaker */
> -	right{
> -		....
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.yaml b/Documentation/devicetree/bindings/soundwire/qcom,sdw.yaml
> new file mode 100644
> index 0000000..65bff91
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.yaml

Filename based on compatible, so "qcom,soundwire.yaml"

> @@ -0,0 +1,186 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soundwire/qcom,sdw.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SoundWire Controller
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +  - Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> +
> +description:
> +  This binding describes the Qualcomm SoundWire controller along with its
> +  board specific bus parameters.

Drop "This binding describes"

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,soundwire-v1.3.0
> +      - qcom,soundwire-v1.5.0
> +      - qcom,soundwire-v1.5.1
> +      - qcom,soundwire-v1.6.0
> +
> +  reg:
> +    items:
> +      - description: the base address and size of SoundWire controller
> +                   address space.

Just maxItems: 1

> +
> +  interrupts:
> +    items:
> +      - description: specify the SoundWire controller core and optional
> +                   wake IRQ.

If there is optional IRQ then this is not correct. You need here two items.

The original bindings could be here not precise or not correct, so fix
them while converting and document the changes in commit msg.

> +
> +  interrupt-names:
> +    items:
> +      - const: wakeup

Where is the core?

> +
> +  clocks:
> +    items:
> +      - description: iface clock
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +
> +  resets:
> +    items:
> +      - description: SWR_AUDIO_CGCR RESET
> +
> +  reset-names:
> +    items:
> +      - const: swr_audio_cgcr
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 0

Why? Old binding did not have them, I think. You do not have any children...

> +
> +  wakeup-source:
> +    description: specify the Soundwire Controller is wakeup Capable.
> +    type: boolean

Just:
wakeup-source: true

> +
> +  qcom,din-ports:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: count of data in ports
> +
> +  qcom,dout-ports:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: count of data out ports
> +
> +  qcom,ports-word-length:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: size of payload channel sample.
> +    minItems: 5

Drop minItems

> +    maxItems: 5
> +
> +  qcom,ports-sinterval-low:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: sample interval low of each data port.
> +    minItems: 5


here and in other places as well

> +    maxItems: 5
> +
> +  qcom,ports-offset1:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: payload transport window offset1 of each data port.
> +    minItems: 5
> +    maxItems: 5
> +
> +  qcom,ports-offset2:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: payload transport window offset2 of each data port.
> +    minItems: 5
> +    maxItems: 5
> +
> +  qcom,ports-lane-control:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: identify which data lane the data port uses.
> +    minItems: 5
> +    maxItems: 5
> +
> +  qcom,ports-block-pack-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: indicate the block packing mode.
> +    minItems: 5
> +    maxItems: 5
> +
> +  qcom,ports-hstart:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: identifying lowerst numbered coloum in SoundWire frame.
> +    minItems: 5
> +    maxItems: 5
> +
> +  qcom,ports-hstop:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: identifying highest numbered coloum in SoundWire frame.
> +    minItems: 5
> +    maxItems: 5
> +
> +  qcom,ports-block-group-count:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: indicate how many sample intervals are combined into a payload.
> +    minItems: 5
> +    maxItems: 5
> +
> +required:
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - '#sound-dai-cells'
> +  - '#address-cells'
> +  - '#size-cells'
> +  - qcom,dout-ports
> +  - qcom,din-ports
> +  - qcom,ports-word-length
> +  - qcom,ports-sinterval-low
> +  - qcom,ports-offset1
> +  - qcom,ports-offset2
> +  - qcom,ports-lane-control
> +  - qcom,ports-block-pack-mode
> +  - qcom,ports-hstart
> +  - qcom,ports-block-group-count

These properties were optional. You need to explain any differences
against pure-conversion.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/qcom,lpassaudiocc-sc7280.h>
> +
> +    soundwire@3210000 {
> +        compatible = "qcom,soundwire-v1.6.0";
> +        reg = <0x03210000 0x2000>;
> +
> +        interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&lpass_rx_macro>;
> +        clock-names = "iface";
> +
> +        qcom,din-ports = <0>;
> +        qcom,dout-ports = <5>;
> +
> +        resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
> +        reset-names = "swr_audio_cgcr";
> +
> +        qcom,ports-word-length =        /bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
> +        qcom,ports-sinterval-low =      /bits/ 8 <0x03 0x3f 0x1f 0x03 0x03>;
> +        qcom,ports-offset1 =            /bits/ 8 <0x00 0x00 0x0b 0x01 0x01>;
> +        qcom,ports-offset2 =            /bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
> +        qcom,ports-lane-control =       /bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
> +        qcom,ports-block-pack-mode =    /bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
> +        qcom,ports-hstart =             /bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
> +        qcom,ports-hstop =              /bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
> +        qcom,ports-block-group-count =  /bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
> +
> +        #sound-dai-cells = <1>;
> +        #address-cells = <2>;
> +        #size-cells = <0>;

Where are the children?

> +    };

Best regards,
Krzysztof

