Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E738ACADD
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Apr 2024 12:38:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BD2AE0D;
	Mon, 22 Apr 2024 12:38:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BD2AE0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713782334;
	bh=q/00YOU88u3Zmpm8wkpicJ6lwNSaTO8+ZG7NhTlGPS8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sr0c2JjCTMSBiTNDbXBVGJQ4GPfjoP2SPJuAFVq6gRkXWgDASKRpiGrhAqgk3nJqv
	 EheD3lMjBtsKoheVUvS47lif3Phn7r69xkapE/snK3F597Z/tdmyrKv6v1mYdBI6fJ
	 SSwtYWvB6OsVMGR+rBWJpfbI2x1FdDcVzGpsm9QA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDDF5F80589; Mon, 22 Apr 2024 12:38:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 380EFF8059F;
	Mon, 22 Apr 2024 12:38:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92AFAF802E8; Mon, 22 Apr 2024 12:38:17 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D8F99F8003A
	for <alsa-devel@alsa-project.org>; Mon, 22 Apr 2024 12:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8F99F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=pMX2P/dO
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43M9Okt4012232;
	Mon, 22 Apr 2024 10:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=QzHrQbucuEK6n03pMLytmAk+wB/HJQb+xXrNsqqX0zw=; b=pM
	X2P/dOA/igi0+GhGy5jvLREkri8m80CU4+8WJ/jNI//W5QICtJbDM/ugm1isGsEA
	381c4i/IE1kveN4A3J5B2vD6YaCkv7c7hgyD55I/aoqx5PGA8E4AMlrP+SzefAFk
	zwDcRdquhQvp8xK4apwwprXVl4Fw4TecfyARVwKqicn3VzS2WNVIPwjHkjYWUzJf
	Va24K0pOK+34lDwcO/2bdvvHfcrGRTWSXe/GY3HGEx1YOenxcBC2Bh2JoYiaF9cm
	kHdIsbJbGs8RvL1XJAmCLss+D9Ssrw945MOIFjK5PbgU5Id5184J5+XkFe+aehJI
	+2o1VongqUQtq1bxYTIQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xnn82r80e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 10:38:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43MAc4d2027818
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 10:38:04 GMT
Received: from [10.216.28.79] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Apr
 2024 03:37:59 -0700
Message-ID: <ced05784-79f8-2ec5-59ef-7fcbb3ac1988@quicinc.com>
Date: Mon, 22 Apr 2024 16:07:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/8] ASoC: dt-bindings: wcd937x-sdw: add bindings for
 wcd937x-sdw
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
 <20240416063600.309747-4-quic_mohs@quicinc.com>
 <20acec19-0dc9-4926-aac5-f24fcc09cba3@kernel.org>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <20acec19-0dc9-4926-aac5-f24fcc09cba3@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BmvezGpEuMkSvJ_mXWp02lNoRtRdZ62X
X-Proofpoint-ORIG-GUID: BmvezGpEuMkSvJ_mXWp02lNoRtRdZ62X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_08,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220049
Message-ID-Hash: Z5TE7FS4H4AUAU7SG3WSBSZ4YB5XRLEO
X-Message-ID-Hash: Z5TE7FS4H4AUAU7SG3WSBSZ4YB5XRLEO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z5TE7FS4H4AUAU7SG3WSBSZ4YB5XRLEO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 4/17/2024 9:26 PM, Krzysztof Kozlowski wrote:
> On 16/04/2024 08:35, Mohammad Rafi Shaik wrote:
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
> Do not need '|' unless you need to preserve formatting.

ACK

will remove '|' in next version patch set.

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
> Use inclusive terminology. Describe what is here - what is the index?
> What is the value?

ACK

> 
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 4
>> +    maxItems: 4
> 
> Add constraints on values. You have maximum 15 TX ports, don't you?
> 
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
> 
> Test your binding. There is no need to engage reviewers for reviewing
> simple mistakes which *tools* can point. Respect reviewers time and use
> the tools first.
> 
> You need oneOf: with required for TX and RX... or just unify the
> properties. Why do you need two?
> 
ACK,

will fix the binding errors.
> 
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    soundwire@3210000 {
> Drop unit address.


actually took the reference from wcd938x.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml#n48


> 
>> +        #address-cells = <2>;
>> +        #size-cells = <0>;
>> +        reg = <0x03210000 0x2000>;
> 
> Drop, not relevant and not placed correctly (see DTS coding style).

>> +        wcd937x_rx: codec@0,4 {
> 
> Drop label, not used.
> 
>> +            compatible = "sdw20217010a00";
>> +            reg  = <0 4>;
>> +            qcom,rx-port-mapping = <1 2 3 4 5>;
>> +        };
>> +    };
>> +
>> +    soundwire@3230000 {
> 
> Drop this example, it's almost identical.
> 
> Best regards,
> Krzysztof
> 

Thanks & Regards,
Rafi
