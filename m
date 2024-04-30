Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC548B7796
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 15:49:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08B94162E;
	Tue, 30 Apr 2024 15:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08B94162E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714484969;
	bh=jlydjqBi35a3hABy/KrwYY1HopWVDMfRB2O/6Edh1Jw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UnHWgryrVNqv6z9OZjOiW8JnL6WDES+GmBjClLDtSe8Xjt8Xepy03kiF5S+X0JWNY
	 7EuVqwi+7BSyWu0hhF/vhNiIaaS6Uxyo5CdzP9HvjEQisUJDXbauedCdQji8CFxwE+
	 fYUqgv8iJtU97lEpbIWI6I9UbrF1wOFzSk28+7jE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA51EF806B6; Tue, 30 Apr 2024 15:47:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26693F8003C;
	Tue, 30 Apr 2024 15:47:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3213F80266; Tue, 30 Apr 2024 15:30:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 984D5F8003C
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 15:30:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 984D5F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=nqXVoIBe
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43U7dmdc008740;
	Tue, 30 Apr 2024 13:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=fidFUpi4cf1KrWX5YDpHz
	qgwyAXuG9D68KTSu4/w83A=; b=nqXVoIBeWCiDikSTdgAvmg2G0JcW8d46f50Ge
	0N0mvDAP+nqmqRAQ4ZJnh4V9RtftHJOCzjaNhvK40feRfETu9qZLFkoxrnYLn9a5
	+/yfa8kK7kGguYypleeCfIKHlUyyPM6YeFyuPPkJAUqv+DFK5xNwEuNXDoB44JfI
	iPwP4bdrFbHTwKr3rll4GsyKcdJiiJ8r73GLjUo2ZpChcmW/w9789Z3iIlyl6u16
	SD+yAeL00f6wV1dOEWq//tQtyGsiwx4IMtC7EKYW6NNOJIy3rFyxJykq58UkFI7A
	5Q4HGOq9uYhI5npXPyrAvE9BCHb7Kb5WmIqjbLa4qJCnFDIFw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtfys3k8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 13:30:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43UDU2M2015731
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 13:30:02 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Apr 2024 06:30:02 -0700
Date: Tue, 30 Apr 2024 06:30:00 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: <alsa-devel@alsa-project.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/3] slimbus: use 'time_left' instead of 'timeout' with
 wait_for_*() functions
Message-ID: <ZjDyWFlx2cjfi1MJ@hu-bjorande-lv.qualcomm.com>
References: <20240430120102.29459-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240430120102.29459-1-wsa+renesas@sang-engineering.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: afi6XheETSfeGAAApO7hcgPeQFaILgSO
X-Proofpoint-ORIG-GUID: afi6XheETSfeGAAApO7hcgPeQFaILgSO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_07,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300096
X-MailFrom: quic_bjorande@quicinc.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OA6MACDNUQ7RWJDEHJNDMZ7IDOXSUDTH
X-Message-ID-Hash: OA6MACDNUQ7RWJDEHJNDMZ7IDOXSUDTH
X-Mailman-Approved-At: Tue, 30 Apr 2024 13:47:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OA6MACDNUQ7RWJDEHJNDMZ7IDOXSUDTH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 30, 2024 at 02:00:58PM +0200, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_*() functions causing patterns like:
> 
>         timeout = wait_for_completion_timeout(...)
>         if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> obvious and self explaining.
> 
> This is part of a tree-wide series. The rest of the patches can be found here
> (some parts may still be WIP):
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_left
> 
> Because these patches are generated, I audit them before sending. This is why I
> will send series step by step. Build bot is happy with these patches, though.
> No functional changes intended.
> 

Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Regards,
Bjorn

> Wolfram Sang (3):
>   slimbus: messaging: use 'time_left' variable with
>     wait_for_completion_timeout()
>   slimbus: qcom-ctrl: use 'time_left' variable with
>     wait_for_completion_timeout()
>   slimbus: qcom-ngd-ctrl: use 'time_left' variable with
>     wait_for_completion_timeout()
> 
>  drivers/slimbus/messaging.c     |  9 +++++----
>  drivers/slimbus/qcom-ctrl.c     |  7 ++++---
>  drivers/slimbus/qcom-ngd-ctrl.c | 29 ++++++++++++++++-------------
>  3 files changed, 25 insertions(+), 20 deletions(-)
> 
> -- 
> 2.43.0
> 
