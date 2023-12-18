Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2426B817B8D
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 20:59:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1EBFE11;
	Mon, 18 Dec 2023 20:58:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1EBFE11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702929539;
	bh=cnYHUK2gjkGipwmX1hJ0JFg+5AOVUTObZEpAzrA4jZ0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=phHafOyZ8HT3hKMXyIjnDMzv9XtSzxn2gzR8tfB29iRaPke7uEmM8NeOf+POq/Qb4
	 DM3vC08PpJ4rYvIZTA3w9Bd57iC3KBXN0jsBPhBKE4TXu9NDLc39ACDh2Fs53Zrhg8
	 LNwCjLfTbK4U0JNxz4Kdh4JA5w1RUrjf9vbBwfu4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58E7DF8057A; Mon, 18 Dec 2023 20:58:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA9BFF8057F;
	Mon, 18 Dec 2023 20:58:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4177CF80425; Mon, 18 Dec 2023 20:58:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3A55F80124
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 20:58:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3A55F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=OR2h4lEM
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BII7awl009072;
	Mon, 18 Dec 2023 19:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=t0bpCimWvMhWfdI+TsPYGoHOoVAQBV1OEIZbPnpfoak=; b=OR
	2h4lEM4dBzCsLd+KqD8zxpFrlQcglcplmQPVD6bBdBUEtesGx8DRYqcbadwSyAX5
	jmEiOQcHKgdSvekkRMgu9/U7x2Li4Pfk0oD+VytunYIV4/Zu9CzuGNsd64EHQGHx
	0h/KLdwKGOZ1bxSjn740snWNNAyIdoFnB0R0rlP4H309nRNyae940OtHLcoDVNFR
	9kwAtUEG8ocQ1EmG9hIUXLQc6xsBO0xwZ4lTk7GSRi4anORUkKffrYR7LsalsFhK
	6kPH+oFrTklJRRu9hpxsGH7MOU+qSRZ48m1HJpCUP9NU3z8d6oyGYbIL8Y4A5DvK
	9AY1uv0JExp/EJLocjBw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v2mfe1euh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 19:58:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 3BIJw8YC027591
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 19:58:08 GMT
Received: from [10.110.97.107] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 18 Dec
 2023 11:58:06 -0800
Message-ID: <0a3a6277-62f6-2d6c-d36a-46a442c89b67@quicinc.com>
Date: Mon, 18 Dec 2023 11:58:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v10 18/41] ALSA: usb-audio: qcom: Add USB QMI definitions
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 <srinivas.kandagatla@linaro.org>,
        <mathias.nyman@intel.com>, <perex@perex.cz>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <gregkh@linuxfoundation.org>, <lgirdwood@gmail.com>,
        <andersson@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <konrad.dybcio@linaro.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <robh+dt@kernel.org>, <agross@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20231215214955.12110-1-quic_wcheng@quicinc.com>
 <20231215214955.12110-19-quic_wcheng@quicinc.com>
 <80111881-13dd-4b05-876a-a97eb3889726@quicinc.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <80111881-13dd-4b05-876a-a97eb3889726@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: P-tbYw2YI5KNM16_-dyXNk1fYgg76NOe
X-Proofpoint-GUID: P-tbYw2YI5KNM16_-dyXNk1fYgg76NOe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312180148
Message-ID-Hash: 54LI63IOZQCISTAMOIVF2LXEFXCDAAAH
X-Message-ID-Hash: 54LI63IOZQCISTAMOIVF2LXEFXCDAAAH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/54LI63IOZQCISTAMOIVF2LXEFXCDAAAH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Jeff,

On 12/15/2023 2:38 PM, Jeff Johnson wrote:
> On 12/15/2023 1:49 PM, Wesley Cheng wrote:
>> The Qualcomm USB audio offload driver utilizes the QMI protocol to
>> communicate with the audio DSP.  Add the necessary QMI header and field
>> definitions, so the QMI interface driver is able to route the QMI packet
>> received to the USB audio offload driver.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   sound/usb/qcom/usb_audio_qmi_v01.c | 892 +++++++++++++++++++++++++++++
>>   sound/usb/qcom/usb_audio_qmi_v01.h | 162 ++++++
>>   2 files changed, 1054 insertions(+)
>>   create mode 100644 sound/usb/qcom/usb_audio_qmi_v01.c
>>   create mode 100644 sound/usb/qcom/usb_audio_qmi_v01.h
>>
>> diff --git a/sound/usb/qcom/usb_audio_qmi_v01.c b/sound/usb/qcom/usb_audio_qmi_v01.c
>> new file mode 100644
>> index 000000000000..bdfd67d980eb
>> --- /dev/null
>> +++ b/sound/usb/qcom/usb_audio_qmi_v01.c
>> @@ -0,0 +1,892 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/soc/qcom/qmi.h>
>> +
>> +#include "usb_audio_qmi_v01.h"
>> +
>> +static struct qmi_elem_info mem_info_v01_ei[] = {
> 
> I believe all of the struct qmi_elem_info arrays can be const.
> 
> At least that was the goal of commit ff6d365898d4 ("soc: qcom: qmi: use
> const for struct qmi_elem_info")
> 

Thanks for the review.  Will fix this.

Thanks
Wesley Cheng
