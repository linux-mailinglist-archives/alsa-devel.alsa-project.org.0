Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9D66B2DDF
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 20:40:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81924189E;
	Thu,  9 Mar 2023 20:40:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81924189E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678390854;
	bh=0Egn96lBYrNlZodxNEcv6jKTb1fYE87ckd0ywg6FbyI=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hKUFVbcNBh64ooOTJz+FGi8qwWjxO3Z9YpcqDlcn2whP2yXiyZZEHOWkoC7/7GLK+
	 5PgffamBuaw6ixyZ3tlp/YWDN1f/AZOTAqe1lfIvyf1p/WqGcfyBcqawxpi5lGpfDY
	 Ov77HldWBa6DBaEqB1bshhiX9SGOLkiPSIkj2e4Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03486F800C9;
	Thu,  9 Mar 2023 20:40:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0517F8042F; Thu,  9 Mar 2023 20:40:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0DD87F800C9
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 20:39:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DD87F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=FapmyhM5
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 329IXdSK020454;
	Thu, 9 Mar 2023 19:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=sRNeP2T1XPb5a8n/b7EOgeAZVOwYAVFLqGl65EupL2c=;
 b=FapmyhM5N3/f0vZX4Ka+Gh7xoBt1rcaH0WztJG2fxDH4NUbkHmRnjY7gonorfdF7o9Jr
 K73n82fQT3ZDZsvHcG3DgsvNEcy1nWShYRHDbbG/WfjkAZ00tazjK1rxp66nh56TEbO7
 TwQ4Ne4GtaxUMoJXW9Bg4exF/DlRfbeY/WRheflMbC263N5sVp9M/4aW1p2HMh6J1rSz
 Xa+bBj0cpO8N8EJ3y+s3qsmaj7Dm3+noT+vJtKn/LEQhm+Fl2BcOn9P39r9mXtz2RxzL
 ps/SavLLslNSVwiKKrgSjhiC1qdAxx2DvDAwfTyNWuL98qTo1p5jNnADfeOcOM2kygO4 0Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p7jutrj1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 19:39:54 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 329Jd7Nj023363
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Mar 2023 19:39:07 GMT
Received: from [10.110.90.116] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 9 Mar 2023
 11:39:06 -0800
Message-ID: <b27911c3-0da4-e7e8-3b0a-3788a3998bd3@quicinc.com>
Date: Thu, 9 Mar 2023 11:39:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 22/28] ASoC: qcom: qdsp6: q6afe: Split USB AFE
 dev_token param into separate API
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        <mathias.nyman@intel.com>, <perex@perex.cz>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <krzysztof.kozlowski+dt@linaro.org>,
        <agross@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <andersson@kernel.org>, <robh+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <tiwai@suse.com>
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-23-quic_wcheng@quicinc.com>
 <ae214ad1-3eb0-3a54-d0d2-ac9812aad186@linaro.org>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <ae214ad1-3eb0-3a54-d0d2-ac9812aad186@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: UW2SVZh4x3-qfcP6dvK8g1IjL0R7sy3u
X-Proofpoint-ORIG-GUID: UW2SVZh4x3-qfcP6dvK8g1IjL0R7sy3u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_11,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=817 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090158
Message-ID-Hash: AJLQ7SQ62JLLRQRVJZN3JINZONOI65QD
X-Message-ID-Hash: AJLQ7SQ62JLLRQRVJZN3JINZONOI65QD
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AJLQ7SQ62JLLRQRVJZN3JINZONOI65QD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Srinivas,

On 3/9/2023 1:01 AM, Srinivas Kandagatla wrote:
> 
> 
> On 08/03/2023 23:57, Wesley Cheng wrote:
>> The Q6USB backend can carry information about the available USB SND cards
>> and PCM devices discovered on the USB bus.  The dev_token field is 
>> used by
>> the audio DSP to notify the USB offload driver of which card and PCM 
>> index
>> to enable playback on.  Separate this into a dedicated API, so the USB
>> backend can set the dev_token accordingly.  The audio DSP does not 
>> utilize
>> this information until the AFE port start command is sent, which is done
>> during the PCM prepare phase.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   sound/soc/qcom/qdsp6/q6afe.c | 49 +++++++++++++++++++++++++-----------
>>   sound/soc/qcom/qdsp6/q6afe.h |  1 +
>>   2 files changed, 36 insertions(+), 14 deletions(-)
>>
> Looks like this could be part of [06/28] ASoC: qcom: qdsp6: Introduce 
> USB AFE port to q6dsp
> 
> you are modifying the 06/28 patch in this patch.
> 
> other than that it looks fine to me.
> 

Sure I'll squash the two.

Thanks
Wesley Cheng
