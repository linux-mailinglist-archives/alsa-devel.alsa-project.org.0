Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8392F7A2CAC
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Sep 2023 02:47:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AC66E7C;
	Sat, 16 Sep 2023 02:46:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AC66E7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694825227;
	bh=G1xirRxD2MN2Pqxh+QVx8ba2QIqBE20DcKZqYoG0q14=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LPjs+YTTOS5rqSxkL1TNdJp0nEeNELB3zsG2XKTH7FEwXlVtukNVTOHqVRCXsXiM1
	 11Jbfh9Gvnlrlsy8d+NKNt+IebM7+QcDczLxMCudNri4pplB1RJ6Y3EvuT7CWGGm4d
	 5RSlTNanwjaFLfPWaUp/ECiG2CdZtMwxPEM6MSa8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6134BF80558; Sat, 16 Sep 2023 02:46:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE34AF80246;
	Sat, 16 Sep 2023 02:46:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C76A1F80425; Sat, 16 Sep 2023 02:46:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6F3EF8007C
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 02:46:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6F3EF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=bS9T3u21
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38G0AjxH018114;
	Sat, 16 Sep 2023 00:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ck+kiCghvHyIq4BaYnOXBbHHLhiRIKeMgU0Ox/vMOs0=;
 b=bS9T3u21H8RVIEBXoeHKFi33J5e9jT5yQX9DQQcT44fiqw68fHwfAGYMHhd2B+dN9vcJ
 pqGFB7edIOjCbzjqfOEowz+BvF5ZJq7P/7tOaWBXZzn3T/uqnGjwXI8IxREd85LDVqQM
 Dxrcc2VFxSxKMsIxt+pMYzd6a4lyVvPc5Cd3E8fGn9mplSqqygYdrWby095vAW6ACbX6
 HtpYrfMV5yE1ghZ67qtKA31DVX3ubzu15W3RpeOMz3aZyaoL3GNVWPxHZJ91dFRApDs4
 bUNhvYpI5Qo6ZxWQ2q7nfW/jpEPeopycNaak1ucNJEkChwNy4//RBuhncIbpsw28x9+p uA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g86teve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Sep 2023 00:46:10 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 38G0k93I016034
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Sep 2023 00:46:09 GMT
Received: from [10.110.47.184] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 15 Sep
 2023 17:46:07 -0700
Message-ID: <60df2d55-ce96-1095-0e52-254d7bd91e7b@quicinc.com>
Date: Fri, 15 Sep 2023 17:46:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v6 23/33] ASoC: dt-bindings: Add Q6USB backend
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <mathias.nyman@intel.com>,
        <gregkh@linuxfoundation.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <agross@kernel.org>, <andersson@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>
CC: <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20230916001026.315-1-quic_wcheng@quicinc.com>
 <20230916001026.315-24-quic_wcheng@quicinc.com>
 <9144cb67-9606-4b17-b760-a6d3e8e346cc@linaro.org>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <9144cb67-9606-4b17-b760-a6d3e8e346cc@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: zgDNW_TDu9Oe6lDKtF37RINtdlYN4fmk
X-Proofpoint-ORIG-GUID: zgDNW_TDu9Oe6lDKtF37RINtdlYN4fmk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_20,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=712
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309160005
Message-ID-Hash: FHCLCQEBGDW4GHZWPMSZ66ZPLSNRSBKU
X-Message-ID-Hash: FHCLCQEBGDW4GHZWPMSZ66ZPLSNRSBKU
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FHCLCQEBGDW4GHZWPMSZ66ZPLSNRSBKU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Konrad,

On 9/15/2023 5:37 PM, Konrad Dybcio wrote:
> On 16.09.2023 02:10, Wesley Cheng wrote:
>> Add a dt-binding to describe the definition of enabling the Q6 USB backend
>> device for audio offloading.  The node carries information, which is passed
>> along to the QC USB SND class driver counterpart.  These parameters will be
>> utilized during QMI stream enable requests.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   .../devicetree/bindings/sound/qcom,q6usb.yaml | 55 +++++++++++++++++++
>>   1 file changed, 55 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6usb.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6usb.yaml b/Documentation/devicetree/bindings/sound/qcom,q6usb.yaml
>> new file mode 100644
>> index 000000000000..51ff0b1ffa2d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6usb.yaml
>> @@ -0,0 +1,55 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,q6usb-dais.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm ASoC DPCM USB backend DAI
>> +
>> +maintainers:
>> +  - Wesley Cheng <quic_wcheng@quicinc.com>
>> +
>> +description:
>> +  The USB port is a supported AFE path on the Q6 DSP.  This ASoC DPCM
>> +  backend DAI will communicate the required settings to initialize the
>> +  XHCI host controller properly for enabling the offloaded audio stream.
>> +  Parameters defined under this node will carry settings, which will be
>> +  passed along during the QMI stream enable request and configuration of
>> +  the XHCI host controller.
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,q6usb
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  "#sound-dai-cells":
>> +    const: 1
>> +
>> +  qcom,usb-audio-intr-num:
>> +    description:
>> +      Desired XHCI interrupter number to use.  Depending on the audio DSP
>> +      on the platform, it will operate on a specific XHCI interrupter.
> So is this the number of interrupters to be used or the index of
> a single interrupter? If the latter, then "num" is definitely way
> too ambiguous.
> 

It defines the index of a single interrupter.  I'll change the naming of 
this property.

Thanks
Wesley Cheng
