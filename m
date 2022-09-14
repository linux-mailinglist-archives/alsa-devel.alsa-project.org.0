Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D715B5BA9B7
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 11:55:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B80C1A7D;
	Fri, 16 Sep 2022 11:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B80C1A7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663322121;
	bh=qpORgMqXd8m6rnC9VfWkkTQxnWOWkV7T0BRt47nm0/k=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QPZcf19J/jr3RJefeAc8rVSs4jwaq/zguOW7TBGLf5k7X056BZ7lQKjIhTqzdaqUE
	 RLrzhNj4RwAyNdlcLFdE9YXC6FUWpPOU4uo7sPEy02DfHIo0tBeKKfVh1jbXkp49IS
	 v/XSlbkrEFQS6l42um9qD7T7jv+yCjQMcH8dv6hM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39943F80536;
	Fri, 16 Sep 2022 11:53:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6B00F8014E; Wed, 14 Sep 2022 12:24:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2933FF8008E
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 12:24:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2933FF8008E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="CWFBjVHE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28E8HCWA026887;
 Wed, 14 Sep 2022 10:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=j3pw1Y0Ys1MP/+aw6F95BVTxpyNSJqiCaRwtAXg6jLM=;
 b=CWFBjVHEviOKEmLOpoV8FMjojkIAWPAGx6XpMTUzKi9Pb3MGpX+smh0nc2zNO7FkU/Do
 LwOuRzrh8lSn7Ki8ViursAeJA9eva9Vm1AkM1g5pWA3jIMNzWG+cZyQ9wptLHsDJPKcM
 VInvrMTqxTQpCJnmeAN2qFU8k+geqxZtghnkNTX002UDYqV2nfCORBnl8fz9AS6wvtfN
 6xnGjl8Uk+Tia00q3lmGkgfzsgB/WGHDRA74nfSIpRAQfP038J4skA0Cl00+vikABwml
 AkS8i9OMAe4wd1sJ7Mww47vKIuF0LALdVSbq4SKXLYJry84HajAIw7LHfC7/lmM9ppln Uw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jjxyua6ev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Sep 2022 10:24:49 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28EAJq0H001035; 
 Wed, 14 Sep 2022 10:24:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3jh430w6tp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Sep 2022 10:24:48 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28EAOm7o006620;
 Wed, 14 Sep 2022 10:24:48 GMT
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 28EAOmXc006619
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Sep 2022 10:24:48 +0000
Received: from [10.79.43.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 14 Sep
 2022 03:24:43 -0700
Subject: Re: [PATCH 2/4] remoteproc: sysmon: Make QMI message rules const
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Alex Elder <elder@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Kalle Valo <kvalo@kernel.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "Konrad
 Dybcio" <konrad.dybcio@somainline.org>
References: <20220912232526.27427-1-quic_jjohnson@quicinc.com>
 <20220912232526.27427-2-quic_jjohnson@quicinc.com>
 <20220912232526.27427-3-quic_jjohnson@quicinc.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
Message-ID: <c98d4256-0650-a3b8-4be2-713e0e27d434@quicinc.com>
Date: Wed, 14 Sep 2022 15:54:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220912232526.27427-3-quic_jjohnson@quicinc.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: TsVRwISeSFi2adI5WPResEpo7xt3rCJ3
X-Proofpoint-ORIG-GUID: TsVRwISeSFi2adI5WPResEpo7xt3rCJ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-14_03,2022-09-14_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 clxscore=1015 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209140050
X-Mailman-Approved-At: Fri, 16 Sep 2022 11:53:37 +0200
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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



On 9/13/22 4:55 AM, Jeff Johnson wrote:
> Commit ff6d365898d ("soc: qcom: qmi: use const for struct
> qmi_elem_info") allows QMI message encoding/decoding rules to be
> const, so do that for sysmon.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Sibi Sankar <quic_sibis@quicinc.com>

> ---
>   drivers/remoteproc/qcom_sysmon.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
> index 57dde2a69b9d..3992bb61d2ec 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -190,7 +190,7 @@ struct ssctl_shutdown_resp {
>   	struct qmi_response_type_v01 resp;
>   };
>   
> -static struct qmi_elem_info ssctl_shutdown_resp_ei[] = {
> +static const struct qmi_elem_info ssctl_shutdown_resp_ei[] = {
>   	{
>   		.data_type	= QMI_STRUCT,
>   		.elem_len	= 1,
> @@ -211,7 +211,7 @@ struct ssctl_subsys_event_req {
>   	u32 evt_driven;
>   };
>   
> -static struct qmi_elem_info ssctl_subsys_event_req_ei[] = {
> +static const struct qmi_elem_info ssctl_subsys_event_req_ei[] = {
>   	{
>   		.data_type	= QMI_DATA_LEN,
>   		.elem_len	= 1,
> @@ -269,7 +269,7 @@ struct ssctl_subsys_event_resp {
>   	struct qmi_response_type_v01 resp;
>   };
>   
> -static struct qmi_elem_info ssctl_subsys_event_resp_ei[] = {
> +static const struct qmi_elem_info ssctl_subsys_event_resp_ei[] = {
>   	{
>   		.data_type	= QMI_STRUCT,
>   		.elem_len	= 1,
> @@ -283,7 +283,7 @@ static struct qmi_elem_info ssctl_subsys_event_resp_ei[] = {
>   	{}
>   };
>   
> -static struct qmi_elem_info ssctl_shutdown_ind_ei[] = {
> +static const struct qmi_elem_info ssctl_shutdown_ind_ei[] = {
>   	{}
>   };
>   
> 
