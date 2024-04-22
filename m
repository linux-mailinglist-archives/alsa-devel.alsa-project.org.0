Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 565E58AC494
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Apr 2024 08:56:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90F2E850;
	Mon, 22 Apr 2024 08:56:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90F2E850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713769010;
	bh=3oBvyGNxSuYMijZVDwZcw5SdaQBnGHWnbUxUVG0xroU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zmh/6tSxUFp7VjOkZiazPndzf+kJavLYUb9ZKQPdskPkwSazj2JM/ORMCmF7+AkrH
	 akCXemdonl0I31uOc+JlujBS3vNn8bRUgHNbxIaj9YvIDNJ4cG4WHj++D+Em9KCOeS
	 uZ/xt6YszIn8jhlc0zgBh8l4O6eRkcPR3UrHBnhY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC885F80587; Mon, 22 Apr 2024 08:56:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 686ACF8057C;
	Mon, 22 Apr 2024 08:56:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24C16F802E8; Mon, 22 Apr 2024 08:56:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9B0FF800B5
	for <alsa-devel@alsa-project.org>; Mon, 22 Apr 2024 08:55:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9B0FF800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=at/WdSkl
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43M4pkDJ004641;
	Mon, 22 Apr 2024 06:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=8+AHSqgDCLt5kVqcOc/DDpfiN1Kjj8zepKjiGwLaYlY=; b=at
	/WdSklQcuwLqFpGKzmuCtT0yteHc2sbz8A4nVENqaKDMZBBRYcqqds58CcBup/GM
	i/z/DPoeuwKl5tnhzy+6Q7dxgVEifS7gZUAQ8U4h31UI6zODZE90TEq0fSjSWoyG
	IDq+gXBPc7b37VJ6lfQtsR387C1NmM0PVZF8Bs1BEkPrAVWgObOyG5NwzX8wdgKU
	eu9Lht2D9CISTuC/N+UWjZoRHgMt5C4mkffGfe52/LHwa0BaX3NvJHflu8j/lx2E
	5DPo1g7XGrzUuQZgP6HMuthdR2hypdvwea/ApKoXYtUL+9yGnOS0hNogyGOI1llq
	T0ZC1S4Vxs+/dwCGBbqA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xm6fkkc1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 06:55:55 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43M6ttgG015385
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 06:55:55 GMT
Received: from [10.216.28.79] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 21 Apr
 2024 23:55:49 -0700
Message-ID: <0b2de111-b5b4-ebf8-c9c9-81e90e8d6039@quicinc.com>
Date: Mon, 22 Apr 2024 12:25:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/8] ASoC: dt-bindings: wcd937x: add bindings for
 wcd937x
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <quic_pkumpatl@quicinc.com>
References: <20240416063600.309747-1-quic_mohs@quicinc.com>
 <20240416063600.309747-2-quic_mohs@quicinc.com>
 <09410fa9-265e-4fb0-9814-35dee465dbec@kernel.org>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <09410fa9-265e-4fb0-9814-35dee465dbec@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 5uFMima1O_API5pXGC0wT_8c6L8L2-DK
X-Proofpoint-ORIG-GUID: 5uFMima1O_API5pXGC0wT_8c6L8L2-DK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_04,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220030
Message-ID-Hash: BZFGSW6NEZUEE7NWIHOILY5RAJCIYLSA
X-Message-ID-Hash: BZFGSW6NEZUEE7NWIHOILY5RAJCIYLSA
X-MailFrom: quic_mohs@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BZFGSW6NEZUEE7NWIHOILY5RAJCIYLSA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 4/17/2024 9:21 PM, Krzysztof Kozlowski wrote:
> On 16/04/2024 08:35, Mohammad Rafi Shaik wrote:
>> From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>>
>> Qualcomm WCD9370/WCD9375 Codec is a standalone Hi-Fi audio codec IC
>> connected over SoundWire. This device has two SoundWire device RX and
>> TX respectively, supporting 3 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
>> 6 DMICs, MBHC.
>>
>> Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> ---
>>   .../bindings/sound/qcom,wcd937x.yaml          | 119 ++++++++++++++++++
>>   1 file changed, 119 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
>> new file mode 100644
>> index 000000000000..b45f823af04f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
> 
> No wildcards. This is wcd9370, right?
> 
>> @@ -0,0 +1,119 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,wcd937x.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm WCD9370 Audio Codec
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.

ACK

will remove '|' in next version patch set.

> 
>> +  Qualcomm WCD9370 Codec is a standalone Hi-Fi audio codec IC.
>> +  It has RX and TX Soundwire slave devices.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,wcd9370-codec
> 
> Can it be anything else than codec?
> 
>> +
>> +  reset-gpios:
>> +    description: GPIO spec for reset line to use
>> +    maxItems: 1
>> +
>> +  vdd-buck-supply:
>> +    description: A reference to the 1.8V buck supply
>> +
>> +  vdd-rxtx-supply:
>> +    description: A reference to the 1.8V rx supply
>> +
>> +  vdd-px-supply:
>> +    description: A reference to the 1.8V I/O supply
>> +
>> +  vdd-mic-bias-supply:
>> +    description: A reference to the 3.8V mic bias supply
>> +
>> +  qcom,tx-device:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description: A reference to Soundwire tx device phandle
> 
> "A reference to phandle" is not correct. Phandle is the reference.
> Anyway, both are redundant.
> 

ACK,

>>
>> +  qcom,rx-device:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description: A reference to Soundwire rx device phandle
>> +
>> +  qcom,micbias1-microvolt:
>> +    description: micbias1 voltage
>> +    minimum: 1800000
>> +    maximum: 2850000
>> +
>> +  qcom,micbias2-microvolt:
>> +    description: micbias2 voltage
>> +    minimum: 1800000
>> +    maximum: 2850000
>> +
>> +  qcom,micbias3-microvolt:
>> +    description: micbias3 voltage
>> +    minimum: 1800000
>> +    maximum: 2850000
>> +
>> +  '#sound-dai-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reset-gpios
>> +  - qcom,tx-device
>> +  - qcom,rx-device
>> +  - qcom,micbias1-microvolt
>> +  - qcom,micbias2-microvolt
>> +  - qcom,micbias3-microvolt
>> +  - "#sound-dai-cells"
>> +
>> +unevaluatedProperties: false
> 
> This does not make sense without ref to dai-common, so this should point
> you to missing ref.

ACK,

Will add missing dai-common reference.
> 
>> +
>> +examples:
>> +  - |
>> +    codec {
>> +        compatible = "qcom,wcd9370-codec";
>> +        pinctrl-names = "default", "sleep";
>> +        pinctrl-0 = <&wcd_reset_n>;
>> +        pinctrl-1 = <&wcd_reset_n_sleep>;
>> +        reset-gpios = <&tlmm 83 0>;
>> +        vdd-buck-supply = <&vreg_l17b_1p8>;
>> +        vdd-rxtx-supply = <&vreg_l18b_1p8>;
>> +        vdd-px-supply = <&vreg_l18b_1p8>;
>> +        vdd-mic-bias-supply = <&vreg_bob>;
>> +        qcom,micbias1-microvolt = <1800000>;
>> +        qcom,micbias2-microvolt = <1800000>;
>> +        qcom,micbias3-microvolt = <1800000>;
>> +        qcom,rx-device = <&wcd937x_rx>;
>> +        qcom,tx-device = <&wcd937x_tx>;
>> +        #sound-dai-cells = <1>;
>> +    };
>> +
>> +    /* ... */
>> +
>> +    soundwire@3210000 {
>> +        #address-cells = <2>;
> 
> Drop this and other nodes.
> 
> Best regards,
> Krzysztof

ACK,

will use the qcom,wcd93xx-common.yaml file and will drop the common 
duplicate nodes

Thanks and Regards,
Rafi
> 

