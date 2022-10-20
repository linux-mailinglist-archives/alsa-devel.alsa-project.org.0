Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4D6605C1B
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 12:21:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEE89AF19;
	Thu, 20 Oct 2022 12:20:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEE89AF19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666261279;
	bh=fsD7cw7bAeC3b10zvb4Tr44SFMPw801BA8dK1oyUfLY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jQdNpbpJduhnmRB6no6CrAwBZ6YjaPMQuw2xE8x9H4e3Tf3I0gPqIOXvPhOEOYCMS
	 0XArjbxSpIj/FA8XocHoeky/vXBLkjWBsXP63f4lKummKFLmj5j3ghjXF5ToAIhZer
	 zws8NFOG9h2vIr71IaSPLdYKztSXH/80w27+ot38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41650F804E5;
	Thu, 20 Oct 2022 12:20:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98206F804D8; Thu, 20 Oct 2022 12:20:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2DF3F800EC
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 12:20:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2DF3F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="dHBNzW6I"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29K9BUKP008119;
 Thu, 20 Oct 2022 10:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=w9LOjt+T0OVa8yF81h2XN/ZRZu2ej9aA3xstuh+rbMI=;
 b=dHBNzW6IYJ62CXYl+HGfQYFKkuwrHdQJ503uPtlyR0sxMlKlmk63Zl6NIlz3jFRmciDC
 6f7Z5SGplLaqPip8GBuHJvm35PLPH4J35ZAbY7XdSCivCYiN6FyQkJV/0H06Svr4C1hh
 kxquaoDfz4/GndZ4xBCqFi7E7tVQVH0HxaQT1A8DzuZvcLD7Rv7inSihA5f3ymZ5iZ3o
 t+SrMytRi0TU4n8nY4/SDjhFZEwXVg5HjIvAFabKGR2FghoGZmkN02T54lE7ThWUkk9m
 qxwEec3PmJmrp03UW/lKon+plmVdK2B3TlY3UsfNWQ9qSSG8TFTNIPgYReDai3+mzcmZ Jg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kawde0ww6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Oct 2022 10:20:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29KAKELn025570
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Oct 2022 10:20:14 GMT
Received: from [10.216.18.154] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 20 Oct
 2022 03:20:08 -0700
Message-ID: <83e56c43-aa2f-1648-227d-957c4c40d093@quicinc.com>
Date: Thu, 20 Oct 2022 15:50:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] dt-bindings: soundwire: Convert text file to yaml
 format
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
References: <1666092240-22008-1-git-send-email-quic_srivasam@quicinc.com>
 <Y0/wm2mOfzjtg4Kq@matsya>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <Y0/wm2mOfzjtg4Kq@matsya>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2Twm5qEkKD_XipXcnN36Zcz29NlGB8ac
X-Proofpoint-ORIG-GUID: 2Twm5qEkKD_XipXcnN36Zcz29NlGB8ac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_03,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210200060
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, broonie@kernel.org, bgoswami@quicinc.com,
 quic_plai@quicinc.com, swboyd@chromium.org, judyhsiao@chromium.org,
 Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>,
 linux-kernel@vger.kernel.org
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


On 10/19/2022 6:12 PM, Vinod Koul wrote:
Thanks for your time Vinod!!!
> On 18-10-22, 16:54, Srinivasa Rao Mandadapu wrote:
>> Update soundwire bindings with yaml formats.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Co-developed-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
>> Signed-off-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
>> ---
>>
>> This patch depends on:
>>      https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=42801e6185290d63691bd39cf8a3bba6cd5fe520
> why is this dependency for yaml conversion?

Actually this patch is already landed, but getting bot error from Rob's 
repo, due to clock binding macro missing.

So mentioned here the same.

>
>> Changes since V1:
>>    -- Remove the status field in example.
>>    -- Remove interrupt-names property in the required list.
>>    -- Add the wakeup-source property.	
>>   
>>   .../devicetree/bindings/soundwire/qcom,sdw.txt     | 214 ---------------------
>>   .../devicetree/bindings/soundwire/qcom,sdw.yaml    | 186 ++++++++++++++++++
>>   2 files changed, 186 insertions(+), 214 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
>>   create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
>> deleted file mode 100644
>> index c85c257..0000000
>> --- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
>> +++ /dev/null
>> @@ -1,214 +0,0 @@
>> -Qualcomm SoundWire Controller Bindings
>> -
>> -
>> -This binding describes the Qualcomm SoundWire Controller along with its
>> -board specific bus parameters.
>> -
>> -- compatible:
>> -	Usage: required
>> -	Value type: <stringlist>
>> -	Definition: must be "qcom,soundwire-v<MAJOR>.<MINOR>.<STEP>",
>> -		    Example:
>> -			"qcom,soundwire-v1.3.0"
>> -			"qcom,soundwire-v1.5.0"
>> -			"qcom,soundwire-v1.5.1"
>> -			"qcom,soundwire-v1.6.0"
>> -- reg:
>> -	Usage: required
>> -	Value type: <prop-encoded-array>
>> -	Definition: the base address and size of SoundWire controller
>> -		    address space.
>> -
>> -- interrupts:
>> -	Usage: required
>> -	Value type: <prop-encoded-array>
>> -	Definition: should specify the SoundWire Controller core and optional
>> -		    wake IRQ
>> -
>> -- interrupt-names:
>> -	Usage: Optional
>> -	Value type: boolean
>> -	Value type: <stringlist>
>> -	Definition: should be "core" for core and "wakeup" for wake interrupt.
>> -
>> -- wakeup-source:
>> -	Usage: Optional
>> -	Value type: boolean
>> -	Definition: should specify if SoundWire Controller is wake up capable.
>> -
>> -- clock-names:
>> -	Usage: required
>> -	Value type: <stringlist>
>> -	Definition: should be "iface" for SoundWire Controller interface clock
>> -
>> -- clocks:
>> -	Usage: required
>> -	Value type: <prop-encoded-array>
>> -	Definition: should specify the SoundWire Controller interface clock
>> -
>> -- #sound-dai-cells:
>> -	Usage: required
>> -	Value type: <u32>
>> -	Definition: must be 1 for digital audio interfaces on the controller.
>> -
>> -- qcom,dout-ports:
>> -	Usage: required
>> -	Value type: <u32>
>> -	Definition: must be count of data out ports
>> -
>> -- qcom,din-ports:
>> -	Usage: required
>> -	Value type: <u32>
>> -	Definition: must be count of data in ports
>> -
>> -- qcom,ports-offset1:
>> -	Usage: required
>> -	Value type: <prop-encoded-array>
>> -	Definition: should specify payload transport window offset1 of each
>> -		    data port. Out ports followed by In ports.
>> -		    Value of 0xFF indicates that this option is not implemented
>> -		    or applicable for the respective data port.
>> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>> -
>> -- qcom,ports-offset2:
>> -	Usage: required
>> -	Value type: <prop-encoded-array>
>> -	Definition: should specify payload transport window offset2 of each
>> -		    data port. Out ports followed by In ports.
>> -		    Value of 0xFF indicates that this option is not implemented
>> -		    or applicable for the respective data port.
>> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>> -
>> -- qcom,ports-sinterval-low:
>> -	Usage: required
>> -	Value type: <prop-encoded-array>
>> -	Definition: should be sample interval low of each data port.
>> -		    Out ports followed by In ports. Used for Sample Interval
>> -		    calculation.
>> -		    Value of 0xFF indicates that this option is not implemented
>> -		    or applicable for the respective data port.
>> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>> -
>> -- qcom,ports-word-length:
>> -	Usage: optional
>> -	Value type: <prop-encoded-array>
>> -	Definition: should be size of payload channel sample.
>> -		    Value of 0xFF indicates that this option is not implemented
>> -		    or applicable for the respective data port.
>> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>> -
>> -- qcom,ports-block-pack-mode:
>> -	Usage: optional
>> -	Value type: <prop-encoded-array>
>> -	Definition: should be 0 or 1 to indicate the block packing mode.
>> -		    0 to indicate Blocks are per Channel
>> -		    1 to indicate Blocks are per Port.
>> -		    Out ports followed by In ports.
>> -		    Value of 0xFF indicates that this option is not implemented
>> -		    or applicable for the respective data port.
>> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>> -
>> -- qcom,ports-block-group-count:
>> -	Usage: optional
>> -	Value type: <prop-encoded-array>
>> -	Definition: should be in range 1 to 4 to indicate how many sample
>> -		    intervals are combined into a payload.
>> -		    Out ports followed by In ports.
>> -		    Value of 0xFF indicates that this option is not implemented
>> -		    or applicable for the respective data port.
>> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>> -
>> -- qcom,ports-lane-control:
>> -	Usage: optional
>> -	Value type: <prop-encoded-array>
>> -	Definition: should be in range 0 to 7 to identify which	data lane
>> -		    the data port uses.
>> -		    Out ports followed by In ports.
>> -		    Value of 0xFF indicates that this option is not implemented
>> -		    or applicable for the respective data port.
>> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>> -
>> -- qcom,ports-hstart:
>> -	Usage: optional
>> -	Value type: <prop-encoded-array>
>> -	Definition: should be number identifying lowerst numbered coloum in
>> -		    SoundWire Frame, i.e. left edge of the Transport sub-frame
>> -		    for each port. Values between 0 and 15 are valid.
>> -		    Out ports followed by In ports.
>> -		    Value of 0xFF indicates that this option is not implemented
>> -		    or applicable for the respective data port.
>> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>> -
>> -- qcom,ports-hstop:
>> -	Usage: optional
>> -	Value type: <prop-encoded-array>
>> -	Definition: should be number identifying highest numbered coloum in
>> -		    SoundWire Frame, i.e. the right edge of the Transport
>> -		    sub-frame for each port. Values between 0 and 15 are valid.
>> -		    Out ports followed by In ports.
>> -		    Value of 0xFF indicates that this option is not implemented
>> -		    or applicable for the respective data port.
>> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>> -
>> -- qcom,dports-type:
>> -	Usage: optional
>> -	Value type: <prop-encoded-array>
>> -	Definition: should be one of the following types
>> -		    0 for reduced port
>> -		    1 for simple ports
>> -		    2 for full port
>> -		    Out ports followed by In ports.
>> -		    Value of 0xFF indicates that this option is not implemented
>> -		    or applicable for the respective data port.
>> -		    More info in MIPI Alliance SoundWire 1.0 Specifications.
>> -
>> -- reset:
>> -	Usage: optional
>> -	Value type: <prop-encoded-array>
>> -	Definition: Should specify the SoundWire audio CSR reset controller interface,
>> -		    which is required for SoundWire version 1.6.0 and above.
>> -
>> -- reset-names:
>> -	Usage: optional
>> -	Value type: <stringlist>
>> -	Definition: should be "swr_audio_cgcr" for SoundWire audio CSR reset
>> -		    controller interface.
>> -
>> -Note:
>> -	More Information on detail of encoding of these fields can be
>> -found in MIPI Alliance SoundWire 1.0 Specifications.
>> -
>> -= SoundWire devices
>> -Each subnode of the bus represents SoundWire device attached to it.
>> -The properties of these nodes are defined by the individual bindings.
>> -
>> -= EXAMPLE
>> -The following example represents a SoundWire controller on DB845c board
>> -which has controller integrated inside WCD934x codec on SDM845 SoC.
>> -
>> -soundwire: soundwire@c85 {
>> -	compatible = "qcom,soundwire-v1.3.0";
>> -	reg = <0xc85 0x20>;
>> -	interrupts = <20 IRQ_TYPE_EDGE_RISING>;
>> -	clocks = <&wcc>;
>> -	clock-names = "iface";
>> -	resets = <&lpass_audiocc LPASS_AUDIO_SWR_TX_CGCR>;
>> -	reset-names = "swr_audio_cgcr";
>> -	#sound-dai-cells = <1>;
>> -	qcom,dports-type = <0>;
>> -	qcom,dout-ports	= <6>;
>> -	qcom,din-ports	= <2>;
>> -	qcom,ports-sinterval-low = /bits/ 8  <0x07 0x1F 0x3F 0x7 0x1F 0x3F 0x0F 0x0F>;
>> -	qcom,ports-offset1 = /bits/ 8 <0x01 0x02 0x0C 0x6 0x12 0x0D 0x07 0x0A >;
>> -	qcom,ports-offset2 = /bits/ 8 <0x00 0x00 0x1F 0x00 0x00 0x1F 0x00 0x00>;
>> -
>> -	/* Left Speaker */
>> -	left{
>> -		....
>> -	};
>> -
>> -	/* Right Speaker */
>> -	right{
>> -		....
>> -	};
>> -};
>> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.yaml b/Documentation/devicetree/bindings/soundwire/qcom,sdw.yaml
>> new file mode 100644
>> index 0000000..65bff91
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.yaml
>> @@ -0,0 +1,186 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soundwire/qcom,sdw.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SoundWire Controller
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> +  - Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> +
>> +description:
>> +  This binding describes the Qualcomm SoundWire controller along with its
>> +  board specific bus parameters.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,soundwire-v1.3.0
>> +      - qcom,soundwire-v1.5.0
>> +      - qcom,soundwire-v1.5.1
>> +      - qcom,soundwire-v1.6.0
>> +
>> +  reg:
>> +    items:
>> +      - description: the base address and size of SoundWire controller
>> +                   address space.
>> +
>> +  interrupts:
>> +    items:
>> +      - description: specify the SoundWire controller core and optional
>> +                   wake IRQ.
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: wakeup
>> +
>> +  clocks:
>> +    items:
>> +      - description: iface clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +
>> +  resets:
>> +    items:
>> +      - description: SWR_AUDIO_CGCR RESET
>> +
>> +  reset-names:
>> +    items:
>> +      - const: swr_audio_cgcr
>> +
>> +  '#sound-dai-cells':
>> +    const: 1
>> +
>> +  '#address-cells':
>> +    const: 2
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +  wakeup-source:
>> +    description: specify the Soundwire Controller is wakeup Capable.
>> +    type: boolean
>> +
>> +  qcom,din-ports:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: count of data in ports
>> +
>> +  qcom,dout-ports:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: count of data out ports
>> +
>> +  qcom,ports-word-length:
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    description: size of payload channel sample.
>> +    minItems: 5
>> +    maxItems: 5
>> +
>> +  qcom,ports-sinterval-low:
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    description: sample interval low of each data port.
>> +    minItems: 5
>> +    maxItems: 5
>> +
>> +  qcom,ports-offset1:
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    description: payload transport window offset1 of each data port.
>> +    minItems: 5
>> +    maxItems: 5
>> +
>> +  qcom,ports-offset2:
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    description: payload transport window offset2 of each data port.
>> +    minItems: 5
>> +    maxItems: 5
>> +
>> +  qcom,ports-lane-control:
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    description: identify which data lane the data port uses.
>> +    minItems: 5
>> +    maxItems: 5
>> +
>> +  qcom,ports-block-pack-mode:
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    description: indicate the block packing mode.
>> +    minItems: 5
>> +    maxItems: 5
>> +
>> +  qcom,ports-hstart:
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    description: identifying lowerst numbered coloum in SoundWire frame.
>> +    minItems: 5
>> +    maxItems: 5
>> +
>> +  qcom,ports-hstop:
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    description: identifying highest numbered coloum in SoundWire frame.
>> +    minItems: 5
>> +    maxItems: 5
>> +
>> +  qcom,ports-block-group-count:
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    description: indicate how many sample intervals are combined into a payload.
>> +    minItems: 5
>> +    maxItems: 5
>> +
>> +required:
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - '#sound-dai-cells'
>> +  - '#address-cells'
>> +  - '#size-cells'
>> +  - qcom,dout-ports
>> +  - qcom,din-ports
>> +  - qcom,ports-word-length
>> +  - qcom,ports-sinterval-low
>> +  - qcom,ports-offset1
>> +  - qcom,ports-offset2
>> +  - qcom,ports-lane-control
>> +  - qcom,ports-block-pack-mode
>> +  - qcom,ports-hstart
>> +  - qcom,ports-block-group-count
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/clock/qcom,lpassaudiocc-sc7280.h>
>> +
>> +    soundwire@3210000 {
>> +        compatible = "qcom,soundwire-v1.6.0";
>> +        reg = <0x03210000 0x2000>;
>> +
>> +        interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&lpass_rx_macro>;
>> +        clock-names = "iface";
>> +
>> +        qcom,din-ports = <0>;
>> +        qcom,dout-ports = <5>;
>> +
>> +        resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
>> +        reset-names = "swr_audio_cgcr";
>> +
>> +        qcom,ports-word-length =        /bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
>> +        qcom,ports-sinterval-low =      /bits/ 8 <0x03 0x3f 0x1f 0x03 0x03>;
>> +        qcom,ports-offset1 =            /bits/ 8 <0x00 0x00 0x0b 0x01 0x01>;
>> +        qcom,ports-offset2 =            /bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
>> +        qcom,ports-lane-control =       /bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
>> +        qcom,ports-block-pack-mode =    /bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
>> +        qcom,ports-hstart =             /bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
>> +        qcom,ports-hstop =              /bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
>> +        qcom,ports-block-group-count =  /bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
>> +
>> +        #sound-dai-cells = <1>;
>> +        #address-cells = <2>;
>> +        #size-cells = <0>;
>> +    };
>> -- 
>> 2.7.4
