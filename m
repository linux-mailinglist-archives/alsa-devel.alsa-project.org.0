Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF629454C8
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 01:11:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 063D53E0A;
	Fri,  2 Aug 2024 01:10:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 063D53E0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722553843;
	bh=ak3vhaRaPvuBak6mFSbn6Qu0JJHuvtfQD9zL5dKNUrc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vIc99Ll91Nvquol/PhPvXQTPR6Um8uKGynalwA9t65NXOKD30U8yf31BwBx6Tjgj0
	 7OfPwnPEv7BAkXD/Qie2cuXiQzKGDeXrPpSThHG/Ba6SU9Y+45DRt50flz8CEb9f60
	 7ReTft2DWdkcKIHTfSOgYBW35ZDJRmEkA4TB6sgw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6910BF805B4; Fri,  2 Aug 2024 01:10:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1B27F8058C;
	Fri,  2 Aug 2024 01:10:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B51B2F80448; Fri,  2 Aug 2024 01:05:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30678F80269
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 01:05:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30678F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=BAhcWjGi
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 471LaQel024509;
	Thu, 1 Aug 2024 23:05:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wPRpa9vXnCyfHy8/0d9HG7Kx5emVZ/QEaVrufYcbUmM=; b=BAhcWjGi3Rlb2amY
	H0SAfI2AjSh4nAFyfu/eGp00/VOpWkh3uMGTpAkM+BlvvYI3qgMNfJjyxl0hOjAI
	ZUCxCy6YUi6vJ48hpusPg+Nejem32p55oc+/X48zjtG2XhrFgoFvnPMracvOWrLj
	w0BQLIrbjXWkgUg2Rn6SDJZ4nVYBwIhVU89JqcioGLgfs5Nm+LdSgti5P3ZvtWTH
	w2f7MZmi84SUarao4FL8TXOj2EYpwvxVtstDBVLyVlQE6hlH+xaCS+4btJvMvmIL
	XyfFmG8Qf4HmktcjvQXW3aPkKtsuZwOQ2VszDww8BW1d/y5d1A1ZmlIPCtBZImXW
	3RR7Eg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40rje304hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 23:04:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 471N4xD6000474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 23:04:59 GMT
Received: from [10.71.115.74] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 Aug 2024
 16:04:58 -0700
Message-ID: <bcf2c413-cb20-41eb-9993-db21c019b70d@quicinc.com>
Date: Thu, 1 Aug 2024 16:04:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 16/34] ASoC: qcom: qdsp6: q6afe: Increase APR timeout
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <gregkh@linuxfoundation.org>, <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-17-quic_wcheng@quicinc.com>
 <abc9f2b9-06c6-4df7-8db8-c2c6e8aaee59@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <abc9f2b9-06c6-4df7-8db8-c2c6e8aaee59@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: vsFuRu9RjaKf9EAV2Td9JiFhAZTo_ENj
X-Proofpoint-ORIG-GUID: vsFuRu9RjaKf9EAV2Td9JiFhAZTo_ENj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_21,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010153
Message-ID-Hash: QNMSZ3YOVUYK2LS3OALR5K42QKFBJ5CF
X-Message-ID-Hash: QNMSZ3YOVUYK2LS3OALR5K42QKFBJ5CF
X-MailFrom: quic_wcheng@quicinc.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QNMSZ3YOVUYK2LS3OALR5K42QKFBJ5CF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 8/1/2024 1:33 AM, Pierre-Louis Bossart wrote:
>
> On 8/1/24 03:17, Wesley Cheng wrote:
>> For USB offloading situations, the AFE port start command will result in a
>> QMI handshake between the Q6DSP and the main processor.  Depending on if
>> the USB bus is suspended, this routine would require more time to complete,
>> as resuming the USB bus has some overhead associated with it.  Increase the
>> timeout to 3s to allow for sufficient time for the USB QMI stream enable
>> handshake to complete.
>>
>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  sound/soc/qcom/qdsp6/q6afe.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
>> index 948007955934..452d7e8b9b30 100644
>> --- a/sound/soc/qcom/qdsp6/q6afe.c
>> +++ b/sound/soc/qcom/qdsp6/q6afe.c
>> @@ -366,7 +366,7 @@
>>  #define AFE_API_VERSION_SLOT_MAPPING_CONFIG	1
>>  #define AFE_API_VERSION_CODEC_DMA_CONFIG	1
>>  
>> -#define TIMEOUT_MS 1000
>> +#define TIMEOUT_MS 3000
> Surprising that 1s is not enough to resume a bus, and conversely is 3s
> enough then if the overhead is so significant?
> It looks like either too much or too little...

To clarify, if USB bus suspend isn't enabled, then this isn't an issue.  I just picked 3s since this is a worst case timeout value.  I don't think it will take longer than that to start an audio session, otherwise there is another inherent problem.  When I initially tested this, it may have been on a platform/chipset that wasn't running with optimized CPU settings, and might have been running slower overall.

Thanks

Wesley Cheng

>>  #define AFE_CMD_RESP_AVAIL	0
>>  #define AFE_CMD_RESP_NONE	1
>>  #define AFE_CLK_TOKEN		1024
