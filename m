Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0A48A9F5A
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:59:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 172442BBB;
	Thu, 18 Apr 2024 17:59:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 172442BBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455959;
	bh=VbYJ4kEHAj9Rmh1z0P+Ie72tg4lO+L1d5IkKtKg9t0o=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vJOeKVg0D23+L6JYvjb84fqWMZTSj+0H+5iu6Ll6RWjQzSEyFZmozrmI0LnhGwHPn
	 G7/CTnSo5xyXynjZDqHu0R+xYbRrmTKlZUC9vQkpT2zR6mi/qPJEPo5/6WmaF0V8Zf
	 xzOFTKaJLIVJRpka647dh6ww8+E84PU/2CgaQ9wI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCD43F8968D; Thu, 18 Apr 2024 17:53:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D762EF896CB;
	Thu, 18 Apr 2024 17:53:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 325F0F8025A; Wed, 17 Apr 2024 11:42:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DF47F80124
	for <alsa-devel@alsa-project.org>; Wed, 17 Apr 2024 11:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DF47F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=BUoFuiSF
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43H8Gtd0015591;
	Wed, 17 Apr 2024 09:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=nPrkdTRcH2FKiX4DtNfZTegoE6WoIshS52dgky2QtCM=; b=BU
	oFuiSFCDx3l842lN/F1u/hFf/KWWx5VF3flwUYftNlQGJSXCLpyqODmp7C/RmQWp
	WKkySnLulJwz4q7CM1hXSy/l5ztkNmFDIuNyyLSghKqKFgIuwXV2oPGUbjI953jE
	y9OSh2vD+FaJ9d4l3ua4RF+41zPk+/DQqhXIaTEalwgfdUzj27rhOrcmhGu08833
	sC7PY9/a9K6WUM897gdnK//Xdm6h23RfPprzKHSUGoD9aMi8zEM4R924Gbdpaa89
	kXSAIm+7kdC5z17FyPPy2s6neXMOItpbzKfyFaXcTPJhMOCYMRKl0u59qW/kXlig
	eavWaS6M73ZlCSiQApmg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xjarpg69b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 09:42:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43H9gk0E004109
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 09:42:46 GMT
Received: from [10.216.60.103] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Apr
 2024 02:42:41 -0700
Message-ID: <720e1ee0-79b0-4d30-b1b8-a90676057161@quicinc.com>
Date: Wed, 17 Apr 2024 15:12:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 RESEND] slimbus: stream: Add null pointer check for
 client functions
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <quic_msavaliy@quicinc.com>, <quic_vtanuku@quicinc.com>,
        <quic_anupkulk@quicinc.com>, <quic_cchiluve@quicinc.com>
References: <20240327083214.29443-1-quic_vdadhani@quicinc.com>
 <ZhgIHHP1FUeCr+vx@hu-bjorande-lv.qualcomm.com>
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <ZhgIHHP1FUeCr+vx@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: a-Ht6a8lg7W_lO9ZJvW6GY13FBFlUnVe
X-Proofpoint-ORIG-GUID: a-Ht6a8lg7W_lO9ZJvW6GY13FBFlUnVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_08,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404170066
X-MailFrom: quic_vdadhani@quicinc.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JSUO2VT2PI6ONW6GP5JLBQCK4CMEYVBH
X-Message-ID-Hash: JSUO2VT2PI6ONW6GP5JLBQCK4CMEYVBH
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:52:45 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JSUO2VT2PI6ONW6GP5JLBQCK4CMEYVBH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/11/2024 9:26 PM, Bjorn Andersson wrote:
> On Wed, Mar 27, 2024 at 02:02:14PM +0530, Viken Dadhaniya wrote:
>> There is a possible scenario where client driver is calling
> 
> How can we asses the validity or the risk of this problem?
> How would I know if this matches e.g. a bug report reported by a user?
> 
> Describe the problem such that the reviewer can asses the validity and
> severity of your bug fixes.

Ok. Updated commit log in v2

> 
>> slimbus stream APIs in incorrect sequence and it might lead to
>> invalid null access of the stream pointer in slimbus
>> enable/disable/prepare/unprepare/free function.
>>
>> Fix this by checking validity of the stream before accessing in
>> all function API’s exposed to client.
>>
> 
> You use the work "fix" a few time, are you fixing an actual bug? Are you
> just guarding the driver from incorrect usage?
> 
> If it's a fix, then add Fixes and Cc: stable here.

Let me correct myself there. Not a fix but consider an improvement where 
preventing a crash due to client following the incorrect sequence.

> 
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> ---
>>   drivers/slimbus/stream.c | 37 +++++++++++++++++++++++++++++++++----
>>   1 file changed, 33 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
>> index 1d6b38657917..c5a436fd0952 100644
>> --- a/drivers/slimbus/stream.c
>> +++ b/drivers/slimbus/stream.c
>> @@ -202,10 +202,16 @@ static int slim_get_prate_code(int rate)
>>   int slim_stream_prepare(struct slim_stream_runtime *rt,
>>   			struct slim_stream_config *cfg)
>>   {
>> -	struct slim_controller *ctrl = rt->dev->ctrl;
>> +	struct slim_controller *ctrl;
>>   	struct slim_port *port;
>>   	int num_ports, i, port_id, prrate;
>>   
>> +	if (!rt || !cfg) {
>> +		pr_err("%s: Stream or cfg is NULL, Check from client side\n", __func__);
> 
> Use dev_err() and write your error messages such that they make sense
> without the use of __func__.

For error scenario, we don't have valid dev to be used in dev_err argument.
this log will help for debug. Please let us know any concern with pr_err

> 
>> +		return -EINVAL;
> 
> Is this expected to happen during normal operation, or is this a sign of
> a bug?
> 

It's a scenario where client doesn't follow the proper sequence and 
slimbus driver can crash if not checked against NULL.

> 
> Neither of the two callers of this function checks the return value, so
> is this really going to result in a good system state?
> 

we expect client to check return value of framework APIs.

> 
> It would make sense to require the client to pass valid rt and cfg
> pointers, and if you have an issue in the client driver in which we
> might end up with invalid points, then those drivers should be fixed -
> rather than relying on chance and swipe it under the rug here.
> 
> Regards,
> Bjorn
> 

Agree. it is sequence mismatch from client driver, and they should take 
care. it is leading to NULL pointer access in slimbus APIs, so prevent 
crash by adding check.

>> +	}
>> +
>> +	ctrl = rt->dev->ctrl;
>>   	if (rt->ports) {
>>   		dev_err(&rt->dev->dev, "Stream already Prepared\n");
>>   		return -EINVAL;
>> @@ -358,9 +364,15 @@ int slim_stream_enable(struct slim_stream_runtime *stream)
>>   {
>>   	DEFINE_SLIM_BCAST_TXN(txn, SLIM_MSG_MC_BEGIN_RECONFIGURATION,
>>   				3, SLIM_LA_MANAGER, NULL);
>> -	struct slim_controller *ctrl = stream->dev->ctrl;
>> +	struct slim_controller *ctrl;
>>   	int ret, i;
>>   
>> +	if (!stream) {
>> +		pr_err("%s: Stream is NULL, Check from client side\n", __func__);
>> +		return -EINVAL;
>> +	}
>> +
>> +	ctrl = stream->dev->ctrl;
>>   	if (ctrl->enable_stream) {
>>   		ret = ctrl->enable_stream(stream);
>>   		if (ret)
>> @@ -411,12 +423,18 @@ int slim_stream_disable(struct slim_stream_runtime *stream)
>>   {
>>   	DEFINE_SLIM_BCAST_TXN(txn, SLIM_MSG_MC_BEGIN_RECONFIGURATION,
>>   				3, SLIM_LA_MANAGER, NULL);
>> -	struct slim_controller *ctrl = stream->dev->ctrl;
>> +	struct slim_controller *ctrl;
>>   	int ret, i;
>>   
>> +	if (!stream) {
>> +		pr_err("%s: Stream is NULL, Check from client side\n", __func__);
>> +		return -EINVAL;
>> +	}
>> +
>>   	if (!stream->ports || !stream->num_ports)
>>   		return -EINVAL;
>>   
>> +	ctrl = stream->dev->ctrl;
>>   	if (ctrl->disable_stream)
>>   		ctrl->disable_stream(stream);
>>   
>> @@ -448,6 +466,11 @@ int slim_stream_unprepare(struct slim_stream_runtime *stream)
>>   {
>>   	int i;
>>   
>> +	if (!stream) {
>> +		pr_err("%s: Stream is NULL, Check from client side\n", __func__);
>> +		return -EINVAL;
>> +	}
>> +
>>   	if (!stream->ports || !stream->num_ports)
>>   		return -EINVAL;
>>   
>> @@ -476,8 +499,14 @@ EXPORT_SYMBOL_GPL(slim_stream_unprepare);
>>    */
>>   int slim_stream_free(struct slim_stream_runtime *stream)
>>   {
>> -	struct slim_device *sdev = stream->dev;
>> +	struct slim_device *sdev;
>> +
>> +	if (!stream) {
>> +		pr_err("%s: Stream is NULL, Check from client side\n", __func__);
>> +		return -EINVAL;
>> +	}
>>   
>> +	sdev = stream->dev;
>>   	spin_lock(&sdev->stream_list_lock);
>>   	list_del(&stream->node);
>>   	spin_unlock(&sdev->stream_list_lock);
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>
