Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 442408A9F57
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:59:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80A7A2BAD;
	Thu, 18 Apr 2024 17:58:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80A7A2BAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455941;
	bh=wz5NL7IQxeWyJ8tQWejK7QFsZwsTHPpFEi5oVoQUE/s=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hU0pQsQ69gkuloQKRVF38ASZ2r/dOTvE8/JxjfdI6042N9gm9pvUgMozHaHDeIo8P
	 0E/aGByAvcX+CoP25Thbd/OBlM6zydPNa7apreeTHwOk8sNFcispHglTxnC2sj+0+H
	 l5pe6KgXfXrfL5RfeZaALBHEAcl0PSREZPNTeMns=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F03AEF896CE; Thu, 18 Apr 2024 17:53:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E90BDF89678;
	Thu, 18 Apr 2024 17:53:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE13EF8025A; Wed, 17 Apr 2024 11:38:52 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0755DF801C0
	for <alsa-devel@alsa-project.org>; Wed, 17 Apr 2024 11:38:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0755DF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=c5igJRlQ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43H8H2tF016088;
	Wed, 17 Apr 2024 09:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=zkjI+l3iXw75pa+Eb9TsKVOgvh6P4+/92z0UQArl9xk=; b=c5
	igJRlQlAvq5s6Nuq0O6XzT6sGSHMWVviESu2Fc+D3txaEuJAkfgm8t5vRB3Sn/9G
	0m/LvqV/DUbJ2ahVMWCAQdR3DhxfWkdkbOp/26w/L17QRp8bw72w7lj9YMKYrurv
	qRJjyzLeD+LpHLWiKs7ronUrvD5JiZe6wd89I9sh7GJJ2QbIY/6N8F54RVeUpb+D
	Lws7LC5aMOeUQWy3/mN8yhl+OCdDtt6KPf6WPiLzQLuwc2EFLKpTbHwflEf6eqY2
	97DeNKtOUtjCWf4bajX+PFmoQJDpSm/efDg3gDeRZkP+qw5W9etB+sZZvjGphLkD
	QpBPJy9B4CTWiYCsu8nw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xjarpg5x5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 09:38:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43H9cjRD016779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 09:38:45 GMT
Received: from [10.216.60.103] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Apr
 2024 02:38:41 -0700
Message-ID: <aef94318-4c32-4b9d-867f-25f366d425bd@quicinc.com>
Date: Wed, 17 Apr 2024 15:08:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 RESEND] slimbus: stream: Add null pointer check for
 client functions
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_msavaliy@quicinc.com>, <quic_vtanuku@quicinc.com>,
        <quic_anupkulk@quicinc.com>, <quic_cchiluve@quicinc.com>
References: <20240327083214.29443-1-quic_vdadhani@quicinc.com>
 <d2a4a91d-1b8a-4136-af30-50eb693423df@linaro.org>
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <d2a4a91d-1b8a-4136-af30-50eb693423df@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xf7QkCNDm8211gouQyfC2-f_2aC68YrD
X-Proofpoint-ORIG-GUID: xf7QkCNDm8211gouQyfC2-f_2aC68YrD
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
Message-ID-Hash: ABIRSTEPSFR7WJTP4P4COJZ663WK6Y7A
X-Message-ID-Hash: ABIRSTEPSFR7WJTP4P4COJZ663WK6Y7A
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:52:31 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ABIRSTEPSFR7WJTP4P4COJZ663WK6Y7A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/11/2024 3:19 PM, Srinivas Kandagatla wrote:
> Thanks Viken for the patch,
> 
> On 27/03/2024 08:32, Viken Dadhaniya wrote:
>> There is a possible scenario where client driver is calling
>> slimbus stream APIs in incorrect sequence and it might lead to
>> invalid null access of the stream pointer in slimbus
>> enable/disable/prepare/unprepare/free function.
>>
>> Fix this by checking validity of the stream before accessing in
>> all function API’s exposed to client.
>>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> ---
>>   drivers/slimbus/stream.c | 37 +++++++++++++++++++++++++++++++++----
>>   1 file changed, 33 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
>> index 1d6b38657917..c5a436fd0952 100644
>> --- a/drivers/slimbus/stream.c
>> +++ b/drivers/slimbus/stream.c
>> @@ -202,10 +202,16 @@ static int slim_get_prate_code(int rate)
>>   int slim_stream_prepare(struct slim_stream_runtime *rt,
>>               struct slim_stream_config *cfg)
>>   {
>> -    struct slim_controller *ctrl = rt->dev->ctrl;
>> +    struct slim_controller *ctrl;
>>       struct slim_port *port;
>>       int num_ports, i, port_id, prrate;
>> +    if (!rt || !cfg) {
>> +        pr_err("%s: Stream or cfg is NULL, Check from client side\n", 
>> __func__);
> 
> Please use dev_err where possible
> 
> 
> --srini


For error scenario, we don't have valid dev to be used in dev_err 
argument. this log will help for debug.
Please let us know if any concern with pr_err.


>> +        return -EINVAL;
>> +    }
>> +
>> +    ctrl = rt->dev->ctrl;
>>       if (rt->ports) {
>>           dev_err(&rt->dev->dev, "Stream already Prepared\n");
>>           return -EINVAL;
>> @@ -358,9 +364,15 @@ int slim_stream_enable(struct slim_stream_runtime 
>> *stream)
>>   {
>>       DEFINE_SLIM_BCAST_TXN(txn, SLIM_MSG_MC_BEGIN_RECONFIGURATION,
>>                   3, SLIM_LA_MANAGER, NULL);
>> -    struct slim_controller *ctrl = stream->dev->ctrl;
>> +    struct slim_controller *ctrl;
>>       int ret, i;
>> +    if (!stream) {
>> +        pr_err("%s: Stream is NULL, Check from client side\n", 
>> __func__);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ctrl = stream->dev->ctrl;
>>       if (ctrl->enable_stream) {
>>           ret = ctrl->enable_stream(stream);
>>           if (ret)
>> @@ -411,12 +423,18 @@ int slim_stream_disable(struct 
>> slim_stream_runtime *stream)
>>   {
>>       DEFINE_SLIM_BCAST_TXN(txn, SLIM_MSG_MC_BEGIN_RECONFIGURATION,
>>                   3, SLIM_LA_MANAGER, NULL);
>> -    struct slim_controller *ctrl = stream->dev->ctrl;
>> +    struct slim_controller *ctrl;
>>       int ret, i;
>> +    if (!stream) {
>> +        pr_err("%s: Stream is NULL, Check from client side\n", 
>> __func__);
>> +        return -EINVAL;
>> +    }
>> +
>>       if (!stream->ports || !stream->num_ports)
>>           return -EINVAL;
>> +    ctrl = stream->dev->ctrl;
>>       if (ctrl->disable_stream)
>>           ctrl->disable_stream(stream);
>> @@ -448,6 +466,11 @@ int slim_stream_unprepare(struct 
>> slim_stream_runtime *stream)
>>   {
>>       int i;
>> +    if (!stream) {
>> +        pr_err("%s: Stream is NULL, Check from client side\n", 
>> __func__);
>> +        return -EINVAL;
>> +    }
>> +
>>       if (!stream->ports || !stream->num_ports)
>>           return -EINVAL;
>> @@ -476,8 +499,14 @@ EXPORT_SYMBOL_GPL(slim_stream_unprepare);
>>    */
>>   int slim_stream_free(struct slim_stream_runtime *stream)
>>   {
>> -    struct slim_device *sdev = stream->dev;
>> +    struct slim_device *sdev;
>> +
>> +    if (!stream) {
>> +        pr_err("%s: Stream is NULL, Check from client side\n", 
>> __func__);
>> +        return -EINVAL;
>> +    }
>> +    sdev = stream->dev;
>>       spin_lock(&sdev->stream_list_lock);
>>       list_del(&stream->node);
>>       spin_unlock(&sdev->stream_list_lock);
