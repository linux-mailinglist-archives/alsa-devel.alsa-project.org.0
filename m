Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A61A178F35F
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 21:33:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADA48208;
	Thu, 31 Aug 2023 21:32:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADA48208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693510391;
	bh=d5cEGoBHiNiYBrGrxn4FMjNfBEr9Gyrvom+AX5gTgvE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jqNoFv6CKrqi/p9it7gE3YBBOu6hAtUaVcvoiHzTQlr7PO5/H9ai23o9fFfMz+Eci
	 8CEZkIIlf6Qme7GJw2lXDUq2ynM8X9sYX+SDXEgCC28K4LQ+9yzMEExPmDNEvKnboe
	 SHn835hWu+dzwl/DLapQIG1ATPELrhzlvSq2OZRw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C630F80249; Thu, 31 Aug 2023 21:32:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B72EFF800F5;
	Thu, 31 Aug 2023 21:32:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1719F80155; Thu, 31 Aug 2023 21:32:16 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D6ECF800D1
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 21:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D6ECF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=MCA1HjdZ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37VJ6RFC025940;
	Thu, 31 Aug 2023 19:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=w0wMyOv1KrxVNMS4h2bsTdWCEGrvvGtxqvPlS3DAqyE=;
 b=MCA1HjdZYEHuRsmtN3cbq43ZTn4Wd71AUXNkKlZt30LWo0rYL59p7eFHmW50FCN/4fdt
 orrgW1zzoVyUwdn6PBo3FtG3PN9xpQdIO4fQwEku6g7MpXV6OzMBKjXiEEroIlOXkL2M
 hMW30cGVrApCGwQCtEAfVK1MvHXPBY1SBdk8PRez20AoyBx20wp3ZnX2gXUDQ6Wf8tdT
 VCgurL/dtyU2URicMNv8nL4wxlvQVzz6+iqKd0/s9NIfoiLSS4/g6h/Wql4ecmg6j8Xy
 aNGGUzh0lNJ/jkcsCNWr+RDmfz6KTP4Ob0dqG2KdH39idYtihNRyeUx3bF573p4ajevY Jw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3stj37ae1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Aug 2023 19:32:07 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 37VJW7F0022304
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Aug 2023 19:32:07 GMT
Received: from [10.71.114.68] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 31 Aug
 2023 12:32:06 -0700
Message-ID: <61bb6789-61b5-cd08-ec20-ac1e89624314@quicinc.com>
Date: Thu, 31 Aug 2023 12:32:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 23/32] ASoC: dt-bindings: Add Q6USB backend
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <agross@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <quic_jackp@quicinc.com>,
        <quic_plai@quicinc.com>
References: <20230829210657.9904-1-quic_wcheng@quicinc.com>
 <20230829210657.9904-24-quic_wcheng@quicinc.com>
 <20230831172924.GA2465731-robh@kernel.org>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <20230831172924.GA2465731-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 6OpGYL0UY0KZnfw7h8QtAOtdrNQ8RboV
X-Proofpoint-ORIG-GUID: 6OpGYL0UY0KZnfw7h8QtAOtdrNQ8RboV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-31_17,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308310174
Message-ID-Hash: E4DS5FZGUACQG2COESPCMDA64BZZHHWR
X-Message-ID-Hash: E4DS5FZGUACQG2COESPCMDA64BZZHHWR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E4DS5FZGUACQG2COESPCMDA64BZZHHWR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Rob,

On 8/31/2023 10:29 AM, Rob Herring wrote:
> On Tue, Aug 29, 2023 at 02:06:48PM -0700, Wesley Cheng wrote:
>> Add a dt-binding to describe the definition of enabling the Q6 USB backend
>> device for audio offloading.  The node carries information, which is passed
>> along to the QC USB SND class driver counterpart.  These parameters will be
>> utilized during QMI stream enable requests.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   .../bindings/sound/qcom,q6usb-dais.yaml       | 53 +++++++++++++++++++
> 
> filename should match the compatible.
> 

Got it.

>>   1 file changed, 53 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
>> new file mode 100644
>> index 000000000000..72254d7e70d2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
>> @@ -0,0 +1,53 @@
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
>> +      Desired XHCI interrupter number to use.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> This is the range as num-hc-interrupters, right?
> 
> Perhaps this should also be uint16 and limited to 1024 (or 8).
> 

True, will change that accordingly.

> But why does this need to be in DT? Can't the OS just pick one to
> assign? (the description should answer this)
> 

Intention of this is because the user of the secondary interrupter ring 
is listening to a particular event ring.  For example, the audio DSP 
would only work on interrupter ring#2 for SM8350, but can possibly 
differ on other platforms.

Thanks
Wesley Cheng
