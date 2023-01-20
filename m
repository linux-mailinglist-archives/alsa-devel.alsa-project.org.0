Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C542D674B2A
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 05:48:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E4CA2C48;
	Fri, 20 Jan 2023 05:47:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E4CA2C48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674190101;
	bh=4VRI4vbN6Ok23agpafxeTYX4t0kZBUTwjPhcePldlfc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YmgQvVA5NEtPOLQPV5xd1DWFcxY/dUUgo4mAlUp/70vLpPMQIzKr4E38bUoAH32iI
	 NR9Ickv1WTvVTa7j/+sOivTzXi5sfY5lk7NVVsEtX72lhrLE1evvo1pA4IrfcDVJZA
	 G/wSb7Hb4gzqUJL25ib8+Xp57hPIlJuCwwD2OSN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B67E5F80246;
	Fri, 20 Jan 2023 05:47:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30914F8026D; Fri, 20 Jan 2023 05:47:27 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id DCDF5F80246
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 05:47:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCDF5F80246
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=kuKViTnX
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30K3mYPb017468; Fri, 20 Jan 2023 04:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=T4sS9BoBfz9WEu5JOgwas1AqI7OGUq6xBiqPC0K1GBU=;
 b=kuKViTnX3eCfB9njWvcViKsgUYOpNQxMZkfBEB6DWAVAQts6u6KPlKsNn7f2IcBTUhpU
 jXMfgker/gRhcA/Ly/3m+u3KOqAxJK2YPRO97xM8B05VQblS32+xqLG02V5QE2z1qyMW
 qYLqaB5AvKdxEryHpUqfgdrsY0iPoOCXv6K+bZ0+f4JBTHec3cgPNc9b/UmcyzAUW1XS
 0F9LVxOvUFs5IRfCJxUX5ElHm+kwqkswEfnClIUhbc9vC3JcJ0uF5HIsnGCOe8XXYz2p
 P/CbjpVkQS1wS2jPS5E2KoWo7Ltx3HMMBE4gOsxdQ/QjkRhOH7FDT3KBAnKlm4WyuN5d /A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n75w3hs82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 04:47:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30K4lH5A001066
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 04:47:17 GMT
Received: from [10.216.43.228] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 20:47:11 -0800
Message-ID: <9ae3b1b0-e9d6-6370-667b-88af5d0efa2e@quicinc.com>
Date: Fri, 20 Jan 2023 10:17:08 +0530
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
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <17b895c0-3985-a012-9b02-94d5ebb11ff9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: BnwV-s8f1FOGMETikuYZKLkrVEE2vGAn
X-Proofpoint-GUID: BnwV-s8f1FOGMETikuYZKLkrVEE2vGAn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_02,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 mlxscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301200042
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


On 1/19/2023 7:01 PM, Krzysztof Kozlowski wrote:
Thanks for your time Krzysztof!!!
> On 19/01/2023 13:27, Srinivasa Rao Mandadapu wrote:
>> Update VA, RX and TX macro and lpass_tlmm clock properties and
>> enable them.
> Everything is an update and this does not explain what exactly you are
> updating in the nodes and why.
>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> ---
>>   .../qcom/sc7280-herobrine-audioreach-wcd9385.dtsi  | 59 ++++++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
>> index 81e0f3a..674b01a 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
>> @@ -8,8 +8,67 @@
>>   
>>   #include <dt-bindings/sound/qcom,q6afe.h>
>>   
>> +/delete-node/ &lpass_rx_macro;
> Why?

Actually in SoC dtsi (sc7280.dtsi) power domains property used.

Which is not required for ADSP based solution. As there is no way to delete

individual property, deleting node and recreating it here.

>
>> +/delete-node/ &lpass_tx_macro;
>> +/delete-node/ &lpass_va_macro;
>> +
>>   /{
>>   	/* BOARD-SPECIFIC TOP LEVEL NODES */
>> +	lpass_rx_macro: codec@3200000 {
>> +		compatible = "qcom,sc7280-lpass-rx-macro";
>> +		reg = <0 0x03200000 0 0x1000>;
> Why? They are the same.
Explained above.
>
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&lpass_rx_swr_clk>, <&lpass_rx_swr_data>;
> Still the same...
>
>> +
>> +		clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +			 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +			 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +			 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +			 <&lpass_va_macro>;
>> +
>> +		clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
> This is different...
>
>> +
>> +		#clock-cells = <0>;
>> +		#sound-dai-cells = <1>;
> But this not.
>
>
> Best regards,
> Krzysztof
>
