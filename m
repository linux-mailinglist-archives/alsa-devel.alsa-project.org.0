Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB908CA987
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 10:02:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65D971FF;
	Tue, 21 May 2024 10:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65D971FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716278545;
	bh=dDzr2Kq7YQW0WMi8zQhoYJ7lugqwpbm3uT3tZIkLV88=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M8oHCfDMMoPQ+3gTP1LehJS5eJ88uwCuLw+LMfRLOsSyerCOv8Gg1aoY4pHGz1hUn
	 lHdMCwX8qINtaJAEQ1aDBRLEhejRojcJs4PX3oHtpoHcnlB7CQtdTZOC8NDTUb+Hjz
	 rvs2jEpY7LfUdQieWaW2FlOqM1cT8LxNkJeuhKXE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EF0DF804FF; Tue, 21 May 2024 10:01:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0F29F804FF;
	Tue, 21 May 2024 10:01:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96435F8026A; Tue, 21 May 2024 09:59:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8312DF801F5
	for <alsa-devel@alsa-project.org>; Tue, 21 May 2024 09:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8312DF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=OUP2FBmq
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 44L2oMkH014910;
	Tue, 21 May 2024 07:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=zIgpIyur9nbJscUg9pxBqZNwhuZ+nxxWucEn5KNslCk=; b=OU
	P2FBmquLZAU8vLzq3SPTEqwErmLztNd6QPa3Ermp1e18eDTZk/4UUUXr3TWEbsnW
	3xDPWLqzTnHeo4EcE2t4EMwS9ZDCHN6/t1CLGb/afx54DWEF33jonBpNoHEA6gxg
	vlpgRal3dxXcM72V+BUMk/bcK9DOZZ1qdqGM7V05jbpntJcAyMWl4p9IV+exeFhU
	0UumwDcYbVi4i07Z01HCk7OMIcKMXR43D5uY4vt6eZ8b9gqldnGcPVE08GjrBwxq
	b1ORaMapANI2dG6miDGZ30OgKxtLfnIdEmqmLz9FoFFgoEt48dr6Gs0V80rUpmAv
	jWJ+r4tOrTaQNwMFe0vA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pq5d72s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 07:59:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 44L7x46B023233
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 07:59:04 GMT
Received: from [10.216.37.160] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 May
 2024 00:58:59 -0700
Message-ID: <235e966d-ba19-db06-82ea-cd15bff12847@quicinc.com>
Date: Tue, 21 May 2024 13:28:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 1/7] ASoC: dt-bindings: document wcd937x Audio Codec
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
References: <20240516044801.1061838-1-quic_mohs@quicinc.com>
 <20240516044801.1061838-2-quic_mohs@quicinc.com>
 <ff003cb8-460b-4a97-b4f7-990244781209@kernel.org>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <ff003cb8-460b-4a97-b4f7-990244781209@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: szdf7H8SJD3oCrOVaDvgLNb5E0nkuKqr
X-Proofpoint-ORIG-GUID: szdf7H8SJD3oCrOVaDvgLNb5E0nkuKqr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_04,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1011 mlxlogscore=999 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405210059
Message-ID-Hash: HD6LNB7NAIUPPU45JDWBHJSUQEPGWX7I
X-Message-ID-Hash: HD6LNB7NAIUPPU45JDWBHJSUQEPGWX7I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HD6LNB7NAIUPPU45JDWBHJSUQEPGWX7I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/19/2024 11:30 PM, Krzysztof Kozlowski wrote:
> On 16/05/2024 06:47, Mohammad Rafi Shaik wrote:
>> From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>>
>> Document the Qualcomm WCD9370/WCD9375 Audio Codec and the
>> Soundwire devices than can be found on Qualcomm QCM6490 based platforms.
>>
>> The Qualcomm WCD9370/WCD9375 Audio Codec communicates
> 
> Thank you for your patch. There is something to discuss/improve.
> 
Thanks for the review.
>> +
>> +  qcom,tx-port-mapping:
>> +    description: |
>> +      Specifies static port mapping between device and host tx ports.
>> +      In the order of the device port index which are adc1_port, adc23_port,
>> +      dmic03_mbhc_port, dmic46_port.
>> +      Supports maximum 4 tx soundwire ports.
>> +
>> +      WCD9370 TX Port 1 (ADC1)               <=> SWR2 Port 2
>> +      WCD9370 TX Port 2 (ADC2, 3)            <=> SWR2 Port 2
>> +      WCD9370 TX Port 3 (DMIC0,1,2,3 & MBHC) <=> SWR2 Port 3
>> +      WCD9370 TX Port 4 (DMIC4,5,6,7)        <=> SWR2 Port 4
>> +
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 4
>> +    maxItems: 4
>> +    items:
>> +      oneOf:
> 
> oneOf here is not needed. Previously used enum should be fine.
> 
okay, will add enum instead oneOf.
> 
>> +        - minimum: 1
>> +          maximum: 4
>> +
>> +  qcom,rx-port-mapping:
>> +    description: |
>> +      Specifies static port mapping between device and host rx ports.
>> +      In the order of device port index which are hph_port, clsh_port,
>> +      comp_port, lo_port, dsd port.
>> +      Supports maximum 5 rx soundwire ports.
>> +
>> +      WCD9370 RX Port 1 (HPH_L/R)       <==>    SWR1 Port 1 (HPH_L/R)
>> +      WCD9370 RX Port 2 (CLSH)          <==>    SWR1 Port 2 (CLSH)
>> +      WCD9370 RX Port 3 (COMP_L/R)      <==>    SWR1 Port 3 (COMP_L/R)
>> +      WCD9370 RX Port 4 (LO)            <==>    SWR1 Port 4 (LO)
>> +      WCD9370 RX Port 5 (DSD_L/R)       <==>    SWR1 Port 5 (DSD)
>> +
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 5
>> +    maxItems: 5
>> +    items:
>> +      oneOf:
> 
> Again, no need for oneof.

ACK

> 
>> +        - minimum: 1
>> +          maximum: 5
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    soundwire@3210000 {
>> +        reg = <0x03210000 0x2000>;
>> +        #address-cells = <2>;
>> +        #size-cells = <0>;
>> +        wcd937x_rx: codec@0,4 {
>> +            compatible = "sdw20217010a00";
>> +            reg  = <0 4>;
>> +            qcom,rx-port-mapping = <1 2 3 4 5>;
>> +        };
>> +    };
>> +
>> +    soundwire@3230000 {
>> +        reg = <0x03230000 0x2000>;
>> +        #address-cells = <2>;
>> +        #size-cells = <0>;
>> +        wcd937x_tx: codec@0,3 {
>> +            compatible = "sdw20217010a00";
>> +            reg  = <0 3>;
>> +            qcom,tx-port-mapping = <2 2 3 4>;
>> +        };
>> +    };
>> +
>> +...
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
>> new file mode 100644
>> index 000000000000..5c76083691ea
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
>> @@ -0,0 +1,80 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,wcd937x.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm WCD9370/WCD9375 Audio Codec
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> +
>> +description:
>> +  Qualcomm WCD9370/WCD9375 Codec is a standalone Hi-Fi audio codec IC.
>> +  It has RX and TX Soundwire slave devices.
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +  - $ref: qcom,wcd93xx-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,wcd9370-codec
>> +      - items:
>> +          - const: qcom,wcd9375-codec
>> +          - const: qcom,wcd9370-codec
>> +
>> +  vdd-px-supply:
>> +    description: A reference to the 1.8V I/O supply
>> +
>> +required:
>> +  - compatible
> 
> I guess VDDPX is not really optional in the hardware is it?
> 
yes right,

The VDDPX is mandatory supply for all usecases.

will add it as required property.
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    codec {
>> +        compatible = "qcom,wcd9370-codec";
>> +        pinctrl-names = "default", "sleep";
>> +        pinctrl-0 = <&wcd_reset_n>;
>> +        pinctrl-1 = <&wcd_reset_n_sleep>;
>> +        reset-gpios = <&tlmm 83 0>;
> 
> Use defines for common/known flags, like GPIO flags.
> 

Yes, will use the GPIO flags.

>> +        vdd-buck-supply = <&vreg_l17b_1p8>;
>> +        vdd-rxtx-supply = <&vreg_l18b_1p8>;
>> +        vdd-px-supply = <&vreg_l18b_1p8>;
>> +        vdd-mic-bias-supply = <&vreg_bob>;
>> +        qcom,micbias1-microvolt = <1800000>;
>> +        qcom,micbias2-microvolt = <1800000>;
>> +        qcom,micbias3-microvolt = <1800000>;
>> +        qcom,micbias4-microvolt = <1800000>;
>> +        qcom,rx-device = <&wcd937x_rx>;
>> +        qcom,tx-device = <&wcd937x_tx>;
>> +        #sound-dai-cells = <1>;
>> +    };
>> +
>> +    /* ... */
>> +
>> +    soundwire@3210000 {
>> +        reg = <0x03210000 0x2000>;
>> +        #address-cells = <2>;
>> +        #size-cells = <0>;
>> +        wcd937x_rx: codec@0,4 {
>> +            compatible = "sdw20217010a00";
>> +            reg  = <0 4>;
> 
> Just one space goes before =
> This applies to all places.
> 

ACK

>> +            qcom,rx-port-mapping = <1 2 3 4 5>;
>> +        };
>> +    };
>> +
>> +    soundwire@3230000 {
>> +        reg = <0x03230000 0x2000>;
>> +        #address-cells = <2>;
>> +        #size-cells = <0>;
>> +        wcd937x_tx: codec@0,3 {
>> +            compatible = "sdw20217010a00";
>> +            reg  = <0 3>;
> 
> Best regards,
> Krzysztof
> 
Thanks & Regards,
Rafi.
