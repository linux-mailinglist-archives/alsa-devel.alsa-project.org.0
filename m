Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3080665F8A1
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 02:07:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EE4C12044;
	Fri,  6 Jan 2023 02:06:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EE4C12044
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672967241;
	bh=Jud3qgQsOesFyRuv0KY3Nq97F5wtva6gZwee+dO/geA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DqF8Z1AEC6KeCn1KgTMeNTsXnbbW9aGpI9sTcKMQWavqGsuduEPCYO3NLT2gBGicv
	 BOBxHhDYhKCZAwTSBAX2P92yBW4pcnnp5O3tyFD8lHPBc3x03yJdmeE62gKJhsex9k
	 VtnYDyf8NGdbxQh9qCu1Scnc+JWAlKHMvCPOlFOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6401CF80542;
	Fri,  6 Jan 2023 02:06:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 013D0F8053A; Fri,  6 Jan 2023 02:06:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E0ACF8051C
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 02:05:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E0ACF8051C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=porboc8+
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305N8x3o008970; Fri, 6 Jan 2023 01:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=FcuAOQbllRhmH8qhEZKJY9Hw6HNDVm92HvBhxZczYDQ=;
 b=porboc8+tR1WTFp5opFaP3VOlLpToAKQamRr/twhlhaGhuMrbHMm++UhtqcEaZVA60Wc
 5XoM0BrhgJKagE8vYpIt1RW1FDoRUryrAe51fkidYN/H01grpz9myLqcp0DaU46YUqVQ
 oVoWvTWF+h4JSHu0wu4mi0d853SZH6i26qOTE6eTGhmjJEQYMv8LDAH304Tfbe1p2sDY
 z08rVnsNpTSlQLhfNAaQtF+LNfZH0X6iuWzKGz4M9tAmruuisZMVmJqinyXohWx5vAdg
 u9bduvjY17V1L4gXbeZcuJ/JmA0K1TJcRNobsbDROd6tNFo6ndmlZ/X245S04o7bmTkp nA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mwvaphnau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jan 2023 01:05:57 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30615uO7019008
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Jan 2023 01:05:56 GMT
Received: from [10.110.47.113] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 5 Jan 2023
 17:05:55 -0800
Message-ID: <0f903c49-a989-14a6-bac1-c4cae21839eb@quicinc.com>
Date: Thu, 5 Jan 2023 17:05:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 03/14] ASoC: qcom: Add USB backend ASoC driver for Q6
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
 <perex@perex.cz>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <andersson@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>,
 <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <agross@kernel.org>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-4-quic_wcheng@quicinc.com>
 <e29060b1-df65-c0d1-5777-023879a5863e@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <e29060b1-df65-c0d1-5777-023879a5863e@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 6_IpYtxD6uzAwC3wkpJuW8wRxLMR9ea2
X-Proofpoint-ORIG-GUID: 6_IpYtxD6uzAwC3wkpJuW8wRxLMR9ea2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_14,2023-01-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 phishscore=0 spamscore=0 mlxlogscore=789 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301060006
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

Hi Pierre,

On 1/4/2023 3:41 PM, Pierre-Louis Bossart wrote:
> 
>> +int q6usb_alsa_connection_cb(struct snd_soc_usb *usb, int card_idx,
>> +			int connected)
>> +{
>> +	struct snd_soc_dapm_context *dapm;
>> +	struct q6usb_port_data *data;
>> +
>> +	if (!usb->component)
>> +		return 0;
>> +
>> +	dapm = snd_soc_component_get_dapm(usb->component);
>> +	data = dev_get_drvdata(usb->component->dev);
>> +
>> +	if (connected) {
>> +		snd_soc_dapm_enable_pin(dapm, "USB_RX_BE");
>> +		/* We only track the latest USB headset plugged in */
> 
> that answers to my earlier question on how to deal with multiple
> devices, but is this a desirable policy? This could lead to a lot of
> confusion. If there are restrictions to a single device, then it might
> be more interesting for userspace or the user to indicate which USB
> device gets to use USB offload and all others use legacy.
> 

Yeah, as mentioned its still pretty open ended.  I think from the 
feedback received from Mark/Takashi, this was a viable option for now. 
Would you happen to have any insight/input on how the userspace can pass 
down that selection to the ASoC framework?  Maybe some kind of PCM IOCTL 
call?

Thanks
Wesley Cheng
