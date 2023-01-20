Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 513DC674D6A
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 07:36:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E56652D91;
	Fri, 20 Jan 2023 07:35:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E56652D91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674196585;
	bh=YzpB9WjRq/x3DcJTozmTRJQ2fBzN1mQpSL3WD7bX7Nc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QEmDpoaLqVnqZ+UtiTz86a/NiewYsr8ZoaNg/UP17aDIYDRjiu1M7aD15kypH81r2
	 DCgM/6ZsvbwJ2nxn3STa3X08rCl0apD7QgGA6ex1j61aP0+zTH1F7jvB4KQkGmH2Dw
	 NfsAyKYIliShDKJR0+b57U5giyKxgPiMWhQY2t9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 798DEF80482;
	Fri, 20 Jan 2023 07:35:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49CF0F8026D; Fri, 20 Jan 2023 07:35:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BB90F8024C
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 07:35:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BB90F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=KH/FWy7U
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30K4nqTE027742; Fri, 20 Jan 2023 06:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=h1Nt0Kj3EVYuq6Lt/Hu4JFG+2Y6oufddlZ8+ev7cjw4=;
 b=KH/FWy7U7f9eTex69kpwce5747rgKGafmlQPDDsKhI1bLEvvwxjUnGRNeUfHMUfaklaE
 JrzXMQTUjNmH/lL5qGCBwbf4vi1NvQ0KSjXV2QepI7Uv+J9+W+zLmkNCcLMTdQPmH2p7
 Uj5i476iLRSXu67Qbv+iDV2c4OWmxLoDCUdtEmtEuI4tfGoUa7EKilFxfG6driiHH+zC
 SjA/4xcrENpOl3X/bY30al789F6NMYUEBJxQVOtvp7FQuH/iAQ9ophFrCMkj194VVQrC
 41+dE+fm4E0IffwTnjOHUjSlFoBl7s6b/5XMtzxZ2u+H9bwnRIiOu7nsS5IOAVijhBPW 5A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n70eyk0sq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 06:35:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30K6ZI9x003832
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 06:35:18 GMT
Received: from [10.216.43.228] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 22:35:12 -0800
Message-ID: <3299b57b-7260-0189-ba6f-824db391d81c@quicinc.com>
Date: Fri, 20 Jan 2023 12:05:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/7] arm64: dts: qcom: sc7280: Update VA/RX/TX macro
 clock nodes
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <vkoul@kernel.org>, 
 <agross@kernel.org>, <andersson@kernel.org>, <robh+dt@kernel.org>,
 <broonie@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
 <srinivas.kandagatla@linaro.org>, <dianders@chromium.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>,
 <alsa-devel@alsa-project.org>, <quic_rjendra@quicinc.com>,
 <konrad.dybcio@somainline.org>, <mka@chromium.org>
References: <1674131227-26456-1-git-send-email-quic_srivasam@quicinc.com>
 <1674131227-26456-5-git-send-email-quic_srivasam@quicinc.com>
 <17b895c0-3985-a012-9b02-94d5ebb11ff9@linaro.org>
 <9ae3b1b0-e9d6-6370-667b-88af5d0efa2e@quicinc.com>
 <7d874a5d-5a26-1ae1-58bc-dd819774190d@linaro.org>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <7d874a5d-5a26-1ae1-58bc-dd819774190d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: YLHaY3gEPYW0Su-PDUOw78pG_YygqKMn
X-Proofpoint-GUID: YLHaY3gEPYW0Su-PDUOw78pG_YygqKMn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_03,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301200060
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 1/20/2023 11:54 AM, Krzysztof Kozlowski wrote:
Thanks for your valuable suggestion Krzysztof!!!
> On 20/01/2023 05:47, Srinivasa Rao Mandadapu wrote:
>> On 1/19/2023 7:01 PM, Krzysztof Kozlowski wrote:
>> Thanks for your time Krzysztof!!!
>>> On 19/01/2023 13:27, Srinivasa Rao Mandadapu wrote:
>>>> Update VA, RX and TX macro and lpass_tlmm clock properties and
>>>> enable them.
>>> Everything is an update and this does not explain what exactly you are
>>> updating in the nodes and why.
>>>
>>>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>>>> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>>> ---
>>>>    .../qcom/sc7280-herobrine-audioreach-wcd9385.dtsi  | 59 ++++++++++++++++++++++
>>>>    1 file changed, 59 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
>>>> index 81e0f3a..674b01a 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
>>>> @@ -8,8 +8,67 @@
>>>>    
>>>>    #include <dt-bindings/sound/qcom,q6afe.h>
>>>>    
>>>> +/delete-node/ &lpass_rx_macro;
>>> Why?
>> Actually in SoC dtsi (sc7280.dtsi) power domains property used.
>>
>> Which is not required for ADSP based solution. As there is no way to delete
>>
>> individual property, deleting node and recreating it here.
>>
> You can delete property - delete-property. However why in AudioReach
> device comes without power domains? What does it mean "power domains
> property is not required"? DTS describes the hardware and the rx macro
> is powered, isn't it?

Actually in case ADSP bypass solution power domains are handled in HLOS 
clock driver.

Whereas in ADSP based solution they are handled in ADSP firmware, and 
from HLOS

voted as clocks.

Below is the reference commit.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9e3d83c52844f955aa2975f78cee48bf9f72f5e1

>
> Best regards,
> Krzysztof
>
