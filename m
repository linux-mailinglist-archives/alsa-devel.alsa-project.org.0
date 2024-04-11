Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BBB8A9F1C
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:52:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1110614E9;
	Thu, 18 Apr 2024 17:52:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1110614E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455557;
	bh=1kr94gWtD4gpodN4EtYhU0DtzurVNmlQfM/n2kxm6Zs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rTUYhYvN/Lscu8wjSOzFCioJQj3d+qKQqkle4cF07fHLN3PrzhOXOyyYknT7KcRQO
	 iPPNEQUsbdxKfLTTsz69gmKDKGEPhp54CYGV8nTqB4cC3Yj8ugB52zpqRtuGmwvriT
	 c3BTkOj9HM42Xh2gE3BjSGycM/5pIAall1MwD1A4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC632F806E2; Thu, 18 Apr 2024 17:47:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46AEBF89722;
	Thu, 18 Apr 2024 17:47:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EBC4F8026D; Thu, 11 Apr 2024 17:56:28 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EEA6EF80236
	for <alsa-devel@alsa-project.org>; Thu, 11 Apr 2024 17:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEA6EF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=bFchtk9h
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43BDQ02D013715;
	Thu, 11 Apr 2024 15:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=
	qcppdkim1; bh=xoq3QeVIsXKVJ1C1Ungc9M/cgxIE8WFkZQjqPfVldQA=; b=bF
	chtk9huKRcOqhpCkCQeS6riKvBhbzv5EBBgozS9YahQEWFfN+qKi1cZkYeAgn5Ij
	158dnly817YtEaLwGc/K8PV0T9T/pgdRFrx9n3dM1gi1Es78y/uL+BHEZbD7Up2S
	d4WqvdK0Uvt8/iDuDIgTyER/MI5X1VcTNOqfZLGwkEWZ7zdRTcIxvUEDgTvRohki
	AHRKwNI13XxBrPRTFj6VCE7P3DnFg6qNsIc1q5MJzblhnUGZcaT29o6rQGW1/L5J
	1yeJejhLXDUoWKDrXcPerXoaJd2+CWzgjItfIKKvs+Na8all00/Vu60tTaAINcai
	eP0usVoXyR/6tp8tNF9Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xe5ehu81j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 15:56:15 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43BFuEv4026324
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 15:56:14 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 11 Apr 2024 08:56:14 -0700
Date: Thu, 11 Apr 2024 08:56:12 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <quic_msavaliy@quicinc.com>, <quic_vtanuku@quicinc.com>,
        <quic_anupkulk@quicinc.com>, <quic_cchiluve@quicinc.com>
Subject: Re: [PATCH v1 RESEND] slimbus: stream: Add null pointer check for
 client functions
Message-ID: <ZhgIHHP1FUeCr+vx@hu-bjorande-lv.qualcomm.com>
References: <20240327083214.29443-1-quic_vdadhani@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240327083214.29443-1-quic_vdadhani@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: diaaVCS9AuY8pGzvBedlPJdhJJ0m54XO
X-Proofpoint-ORIG-GUID: diaaVCS9AuY8pGzvBedlPJdhJJ0m54XO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404110117
X-MailFrom: quic_bjorande@quicinc.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LDMGCPWJYFRL54ESSBF7I5DEWQDNAFYP
X-Message-ID-Hash: LDMGCPWJYFRL54ESSBF7I5DEWQDNAFYP
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:47:01 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LDMGCPWJYFRL54ESSBF7I5DEWQDNAFYP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Mar 27, 2024 at 02:02:14PM +0530, Viken Dadhaniya wrote:
> There is a possible scenario where client driver is calling

How can we asses the validity or the risk of this problem?
How would I know if this matches e.g. a bug report reported by a user?

Describe the problem such that the reviewer can asses the validity and
severity of your bug fixes.

> slimbus stream APIs in incorrect sequence and it might lead to
> invalid null access of the stream pointer in slimbus
> enable/disable/prepare/unprepare/free function.
> 
> Fix this by checking validity of the stream before accessing in
> all function API’s exposed to client.
> 

You use the work "fix" a few time, are you fixing an actual bug? Are you
just guarding the driver from incorrect usage?

If it's a fix, then add Fixes and Cc: stable here.

> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
>  drivers/slimbus/stream.c | 37 +++++++++++++++++++++++++++++++++----
>  1 file changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
> index 1d6b38657917..c5a436fd0952 100644
> --- a/drivers/slimbus/stream.c
> +++ b/drivers/slimbus/stream.c
> @@ -202,10 +202,16 @@ static int slim_get_prate_code(int rate)
>  int slim_stream_prepare(struct slim_stream_runtime *rt,
>  			struct slim_stream_config *cfg)
>  {
> -	struct slim_controller *ctrl = rt->dev->ctrl;
> +	struct slim_controller *ctrl;
>  	struct slim_port *port;
>  	int num_ports, i, port_id, prrate;
>  
> +	if (!rt || !cfg) {
> +		pr_err("%s: Stream or cfg is NULL, Check from client side\n", __func__);

Use dev_err() and write your error messages such that they make sense
without the use of __func__.

> +		return -EINVAL;

Is this expected to happen during normal operation, or is this a sign of
a bug?


Neither of the two callers of this function checks the return value, so
is this really going to result in a good system state?


It would make sense to require the client to pass valid rt and cfg
pointers, and if you have an issue in the client driver in which we
might end up with invalid points, then those drivers should be fixed -
rather than relying on chance and swipe it under the rug here.

Regards,
Bjorn

> +	}
> +
> +	ctrl = rt->dev->ctrl;
>  	if (rt->ports) {
>  		dev_err(&rt->dev->dev, "Stream already Prepared\n");
>  		return -EINVAL;
> @@ -358,9 +364,15 @@ int slim_stream_enable(struct slim_stream_runtime *stream)
>  {
>  	DEFINE_SLIM_BCAST_TXN(txn, SLIM_MSG_MC_BEGIN_RECONFIGURATION,
>  				3, SLIM_LA_MANAGER, NULL);
> -	struct slim_controller *ctrl = stream->dev->ctrl;
> +	struct slim_controller *ctrl;
>  	int ret, i;
>  
> +	if (!stream) {
> +		pr_err("%s: Stream is NULL, Check from client side\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	ctrl = stream->dev->ctrl;
>  	if (ctrl->enable_stream) {
>  		ret = ctrl->enable_stream(stream);
>  		if (ret)
> @@ -411,12 +423,18 @@ int slim_stream_disable(struct slim_stream_runtime *stream)
>  {
>  	DEFINE_SLIM_BCAST_TXN(txn, SLIM_MSG_MC_BEGIN_RECONFIGURATION,
>  				3, SLIM_LA_MANAGER, NULL);
> -	struct slim_controller *ctrl = stream->dev->ctrl;
> +	struct slim_controller *ctrl;
>  	int ret, i;
>  
> +	if (!stream) {
> +		pr_err("%s: Stream is NULL, Check from client side\n", __func__);
> +		return -EINVAL;
> +	}
> +
>  	if (!stream->ports || !stream->num_ports)
>  		return -EINVAL;
>  
> +	ctrl = stream->dev->ctrl;
>  	if (ctrl->disable_stream)
>  		ctrl->disable_stream(stream);
>  
> @@ -448,6 +466,11 @@ int slim_stream_unprepare(struct slim_stream_runtime *stream)
>  {
>  	int i;
>  
> +	if (!stream) {
> +		pr_err("%s: Stream is NULL, Check from client side\n", __func__);
> +		return -EINVAL;
> +	}
> +
>  	if (!stream->ports || !stream->num_ports)
>  		return -EINVAL;
>  
> @@ -476,8 +499,14 @@ EXPORT_SYMBOL_GPL(slim_stream_unprepare);
>   */
>  int slim_stream_free(struct slim_stream_runtime *stream)
>  {
> -	struct slim_device *sdev = stream->dev;
> +	struct slim_device *sdev;
> +
> +	if (!stream) {
> +		pr_err("%s: Stream is NULL, Check from client side\n", __func__);
> +		return -EINVAL;
> +	}
>  
> +	sdev = stream->dev;
>  	spin_lock(&sdev->stream_list_lock);
>  	list_del(&stream->node);
>  	spin_unlock(&sdev->stream_list_lock);
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
