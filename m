Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8F38153D5
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 23:39:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FFA6839;
	Fri, 15 Dec 2023 23:39:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FFA6839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702679985;
	bh=JpwWHuPcZm4x2cFqyuxsMrjmRDLhgAuKluiZmzGcA58=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fl68AQ2FYZBYxOFaA+6JR7meuXH8CBppH2TdeBHgWZksxiJyIKXhjn96C2RQUEMpR
	 NpS9p4kr+txk4mqXa3FtKApyrsrwA1znFIHxbLr+YnWzCioGgC065n6+Ktw87dSWTn
	 GLSIp88ZYDOcVnlHFFrOoPNWRmooH1k54KNuWurQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B21EF80578; Fri, 15 Dec 2023 23:39:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4D90F80537;
	Fri, 15 Dec 2023 23:39:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 084BFF80166; Fri, 15 Dec 2023 23:39:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6F7AF8001F
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 23:38:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6F7AF8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=FnRbQ5ZE
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BFLVMlU023006;
	Fri, 15 Dec 2023 22:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=i5e3VNsHMtLdnZjKEnpBG17/DfBO8lIAIhhbJZLJYwE=; b=Fn
	RbQ5ZEXEHBuX4ttkNQ3M26mGIGsNg+wmUPp6CqOydH0nusvg8tWBlYDjqu4R515P
	M6JPdi1pZRKj2oiaLOB7/TbqlHISBFpqGsMY34Wyk7nOFyvNr3V+8+E2EpdRLjT7
	TiNUDoHwPFLLMLpSoGrECEDlDeXr9OF+F8dc50JpJtoxAf+qqkxmGesOZXKZqKSz
	8l+msL9CiH43M8XgJbHQeilIGAmXG1d/WZJYH102Z9ZmsGvHBIgkYefwo38sVoDn
	hkgAu7M3DuOP/LBoquOzViJd1H3A5BqJKjODHH0z7yf9jJ4vimXkDJ5OJ0eIuFZb
	thCIunEJ7q6mR+pN6Rhg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v0m46hrg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 22:38:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 3BFMct9A027457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 22:38:55 GMT
Received: from [10.110.36.237] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 15 Dec
 2023 14:38:54 -0800
Message-ID: <80111881-13dd-4b05-876a-a97eb3889726@quicinc.com>
Date: Fri, 15 Dec 2023 14:38:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 18/41] ALSA: usb-audio: qcom: Add USB QMI definitions
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, <srinivas.kandagatla@linaro.org>,
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
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231215214955.12110-19-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: y0Zvylxqky0dYnXVoe0CvMAArWBxbEqy
X-Proofpoint-ORIG-GUID: y0Zvylxqky0dYnXVoe0CvMAArWBxbEqy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 clxscore=1011
 mlxlogscore=899 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312150159
Message-ID-Hash: M44RKD3EDOB2TDKSTFMRYCQPPMQDE7O7
X-Message-ID-Hash: M44RKD3EDOB2TDKSTFMRYCQPPMQDE7O7
X-MailFrom: quic_jjohnson@quicinc.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M44RKD3EDOB2TDKSTFMRYCQPPMQDE7O7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/15/2023 1:49 PM, Wesley Cheng wrote:
> The Qualcomm USB audio offload driver utilizes the QMI protocol to
> communicate with the audio DSP.  Add the necessary QMI header and field
> definitions, so the QMI interface driver is able to route the QMI packet
> received to the USB audio offload driver.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/qcom/usb_audio_qmi_v01.c | 892 +++++++++++++++++++++++++++++
>  sound/usb/qcom/usb_audio_qmi_v01.h | 162 ++++++
>  2 files changed, 1054 insertions(+)
>  create mode 100644 sound/usb/qcom/usb_audio_qmi_v01.c
>  create mode 100644 sound/usb/qcom/usb_audio_qmi_v01.h
> 
> diff --git a/sound/usb/qcom/usb_audio_qmi_v01.c b/sound/usb/qcom/usb_audio_qmi_v01.c
> new file mode 100644
> index 000000000000..bdfd67d980eb
> --- /dev/null
> +++ b/sound/usb/qcom/usb_audio_qmi_v01.c
> @@ -0,0 +1,892 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/soc/qcom/qmi.h>
> +
> +#include "usb_audio_qmi_v01.h"
> +
> +static struct qmi_elem_info mem_info_v01_ei[] = {

I believe all of the struct qmi_elem_info arrays can be const.

At least that was the goal of commit ff6d365898d4 ("soc: qcom: qmi: use
const for struct qmi_elem_info")

/jeff

