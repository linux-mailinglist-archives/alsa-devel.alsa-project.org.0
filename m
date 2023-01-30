Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C84681DA0
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 23:03:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED0FC85D;
	Mon, 30 Jan 2023 23:03:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED0FC85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675116238;
	bh=ojPz9OXzDmAGtMcojCo8zWwF/P2fB9XVSaqZBC6tw6Y=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=s+qCAKVk5tvz9MDrh6wKTZ00eYs2GkhCacc0MD72Zh1sx1Kv6HEaL/0uX5lV2Jowa
	 ale5lUsMW+Wb8+LZDNU90S3mphsjE0hFr86RemxGDhXiXS8aSvQjlIZjb1Cj8scZK/
	 jFse2o289VWXN+25qlKcZwd55MoHHAAvN9j7lyis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39378F80423;
	Mon, 30 Jan 2023 23:03:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B259CF8032B; Mon, 30 Jan 2023 23:02:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71800F80155
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 23:02:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71800F80155
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=CM53rTJI
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30ULsVXN017941; Mon, 30 Jan 2023 22:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ILW2ve8L0jEt9qEsEsaaeIOpHW9pUVZIoAQxIT5Y2Eg=;
 b=CM53rTJIuODJJOlNE7LUXbBP8s4euiMXtzMlkTYKN8kPKs8MgoojnVD+6VCXib/OT9/N
 680mb4xbAEH5FO6msq9EvwSj2WsN7dhXU02av1zpTFYfiAnOQ4p42kftehfS+qnpgj/B
 BLTgL7yXgB5z8APTqsmgP+iZlhTexvqJCF/YipUhzM5aoco8/HnCOq7R6CwMs3iqi4hx
 mOMJZ43I1Hul9fXslk16Sc1PL5+jKXfBZrXXHLuwmT+ZOyqpBYib2MFkK/TjV41b+9UW
 M70rp6COAyl8hsJ8czOJvipO47kZGd5a0u1OfpsEsAdpxmV2xMVqi/AODs3U/u4kSSxY xQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nefmfrwp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 22:02:52 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30UM2psh025299
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 22:02:51 GMT
Received: from [10.110.113.14] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 30 Jan
 2023 14:02:50 -0800
Message-ID: <6655bd97-61e8-e03b-b782-bcfcc2138717@quicinc.com>
Date: Mon, 30 Jan 2023 14:02:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v2 14/22] dt-bindings: usb: dwc3: Add
 snps,num-hc-interrupters definition
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
 <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
 <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
 <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <agross@kernel.org>
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-15-quic_wcheng@quicinc.com>
 <05e55db1-5181-8025-8aee-e398200b047c@linaro.org>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <05e55db1-5181-8025-8aee-e398200b047c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Yz_E4BLFiZ2GtEA--tQbffoSRNPjd3yO
X-Proofpoint-GUID: Yz_E4BLFiZ2GtEA--tQbffoSRNPjd3yO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_17,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 priorityscore=1501 mlxlogscore=353 suspectscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301300202
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Krzysztof,

On 1/26/2023 4:01 AM, Krzysztof Kozlowski wrote:
> On 26/01/2023 04:14, Wesley Cheng wrote:
>> Add a new definition for specifying how many XHCI secondary interrupters
>> can be allocated.  XHCI in general can potentially support up to 1024
>> interrupters, which some uses may want to limit depending on how many
>> users utilize the interrupters.
> 
> I cannot find in the code any user of this. Your next patch stores it,
> but which other patch uses stored value?
> 
> What I still don't get how is this exactly hardware property, not policy
> or driver choice.
> 

Sorry I must have missed that patchset when rebasing over Mathias' xHCI 
changes.  It was there previously in my initial submission where the 
property is carried over into xhci-plat from dwc3/host.c.

So the xHC controller has a HCSPARAMs field that defines the number of 
interrupters it can support.  It does potentially have the capability of 
having 1024 interrupters.  Each interrupter has to have its own set of 
interrupt register sets, which depending on the vendor implementing it 
could limit the maximum.  For example, as stated below, DWC3 only allows 
for 8 interrupters to be allocated.

The purpose for this property is to allow the user/driver to not have to 
allocate memory for supporting 1024 event rings, if they are only going 
to utilize one.  Likewise, if the user attempts to allocate more than 
what is supported by the HW, then Mathias' SW will cross check to ensure 
that isn't allowed. (by checking the HCSPARAMs against the DT property 
below)

>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>> index 6d78048c4613..4faaec9655e0 100644
>> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>> @@ -349,6 +349,18 @@ properties:
>>       items:
>>         enum: [1, 4, 8, 16, 32, 64, 128, 256]
>>   
>> +  snps,num-hc-interrupters:
>> +    description:
>> +      Defines the maximum number of XHCI host controller interrupters that can
>> +      be supported.  The XHCI host controller has support to allocate multiple
>> +      event rings, which can be assigned to different clients/users.  The DWC3
>> +      controller has a maximum of 8 interrupters.  If this is not defined then
>> +      the value will be defaulted to 1.  This parameter is used only when
>> +      operating in host mode.
>> +    $ref: /schemas/types.yaml#/definitions/uint8
>> +    minimum: 1
>> +    maximum: 8
> 
> default: 1
> 

Got it.

Thanks
Wesley Cheng
