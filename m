Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E398A7DF3
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Apr 2024 10:18:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED404A4A;
	Wed, 17 Apr 2024 10:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED404A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713341892;
	bh=RM9ZBHtvZ8LTwszIbZZWTkb98vredc/IQ7JGaF2pg7I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qg8PDeqgzTqjvLIBgzkw1L6IfRxEndcnGQmCSBiu4uiee7kWw0ddz15jj4p3NR3EC
	 9dn5byDkzapDARxZF5Ft4hVyjyovzc2XruEgB2Y2urMQ8Pkr8Cx85xE5XahMX2IsL9
	 H+wH/eT5WrNDbiH/Hsfae0792SvzKDM/g4otBc4c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8F1AF805A8; Wed, 17 Apr 2024 10:17:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 229E2F80579;
	Wed, 17 Apr 2024 10:17:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBD6EF8025A; Wed, 17 Apr 2024 10:17:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8004F801C0
	for <alsa-devel@alsa-project.org>; Wed, 17 Apr 2024 10:17:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8004F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=ivKuyAT5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43H6pNTJ005096;
	Wed, 17 Apr 2024 08:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Htu9QXA5aLlbaAxRyDgW1Hl5A5etbp7+sMkhoF3/F+k=; b=iv
	KuyAT5kwmF+JgfSVVFVVg9RlSOiK0WPriR1IYBxryrfPHv/qrEPfgc/Fzi7VwoQk
	yk+c05xdPvWpMjUq4Ihu6w05qzojExFLCPPFxFZ/o1a7ubQ7VlQegaoyVnDeTfjT
	oJQTSP6yZM9xqvWXLhUlD63Bt6VNv2Wn5mwZAZ+v0d3Bprg+lyPswhm2x9bu8nja
	Jir3aCKrkRkJ7yZQiF2T+TRviFRMkKqoNmv9/eC9+3NqfcIqFpV7qxDxmEKDP2YB
	cIaHfNxILBxJoD7gC+Q/MFdY87DbVjpSr9UZf92wVYhjhP3yA1anup+7TOv+BcXs
	HPTqQ6A8NSGP8r1eT79g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xj2sxs1wj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 08:17:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43H8H8uX007517
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 08:17:08 GMT
Received: from [10.216.25.227] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Apr
 2024 01:17:03 -0700
Message-ID: <13bff1dd-d134-e5ab-6691-b2bcb0a786c8@quicinc.com>
Date: Wed, 17 Apr 2024 13:47:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/8] ASoC: dt-bindings: wcd937x-sdw: add bindings for
 wcd937x-sdw
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami
	<bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai
	<tiwai@suse.com>, <alsa-devel@alsa-project.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_rohkumar@quicinc.com>, <quic_pkumpatl@quicinc.com>
References: <20240416063600.309747-1-quic_mohs@quicinc.com>
 <20240416063600.309747-4-quic_mohs@quicinc.com>
 <20240416143237.GA2250258-robh@kernel.org>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <20240416143237.GA2250258-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 0HHyvM2ank2fxScBe0q2l6VEcz40MkiC
X-Proofpoint-ORIG-GUID: 0HHyvM2ank2fxScBe0q2l6VEcz40MkiC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_07,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404170056
Message-ID-Hash: I24TPQLP2FUVIVVF6V5SR3SLG3VIIIR3
X-Message-ID-Hash: I24TPQLP2FUVIVVF6V5SR3SLG3VIIIR3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I24TPQLP2FUVIVVF6V5SR3SLG3VIIIR3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 4/16/2024 8:02 PM, Rob Herring wrote:
> On Tue, Apr 16, 2024 at 12:05:55PM +0530, Mohammad Rafi Shaik wrote:
>> From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>>
>> Qualcomm WCD9370/WCD9375 Codec is a standalone Hi-Fi audio codec IC
>> connected over SoundWire. This device has two SoundWire devices RX and
>> TX respectively.
>> This binding is for those slave devices on WCD9370/WCD9375.
>>
>> Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> ---
>>   .../bindings/sound/qcom,wcd937x-sdw.yaml      | 71 +++++++++++++++++++
>>   1 file changed, 71 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
>> new file mode 100644
>> index 000000000000..2b7358e266ba
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
>> @@ -0,0 +1,71 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,wcd937x-sdw.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SoundWire Slave devices on WCD9370
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> +
>> +description: |
> 
> Don't need '|' if no formatting.
> 
>> +  Qualcomm WCD9370 Codec is a standalone Hi-Fi audio codec IC.
>> +  It has RX and TX Soundwire slave devices. This bindings is for the
>> +  slave devices.
>> +
>> +properties:
>> +  compatible:
>> +    const: sdw20217010a00
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  qcom,tx-port-mapping:
>> +    description: |
>> +      Specifies static port mapping between slave and master tx ports.
>> +      In the order of slave port index.
> 
> Are there constraints on the values of the entries?

The port mapping entries are fixed values.
There is no constraints.

Thanks
Rafi
> 
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 4
>> +    maxItems: 4
>> +
>> +  qcom,rx-port-mapping:
>> +    description: |
>> +      Specifies static port mapping between slave and master rx ports.
>> +      In the order of slave port index.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 5
>> +    maxItems: 5
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - qcom,port-mapping
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    soundwire@3210000 {
>> +        #address-cells = <2>;
>> +        #size-cells = <0>;
>> +        reg = <0x03210000 0x2000>;
>> +        wcd937x_rx: codec@0,4 {
>> +            compatible = "sdw20217010a00";
>> +            reg  = <0 4>;
>> +            qcom,rx-port-mapping = <1 2 3 4 5>;
>> +        };
>> +    };
>> +
>> +    soundwire@3230000 {
>> +        #address-cells = <2>;
>> +        #size-cells = <0>;
>> +        reg = <0x03230000 0x2000>;
>> +        wcd937x_tx: codec@0,3 {
>> +            compatible = "sdw20217010a00";
>> +            reg  = <0 3>;
>> +            qcom,tx-port-mapping = <2 3 4 5>;
>> +        };
>> +    };
>> +
>> +...
>> -- 
>> 2.25.1
>>

