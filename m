Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD82E5BA9B6
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 11:55:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 878101A60;
	Fri, 16 Sep 2022 11:54:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 878101A60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663322104;
	bh=s7JrSuwXyYsbfM6jAHiv0zY1QAgntCI4+R62aTVewY8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=boGrKEQHFY8OMxdllgbA3JSpvmJKj4HEcO+M2Yc+Pxk4bGfZbNtBgC3QdRtkkdlsv
	 4F6vAFGOBknc2HDskIBR2WsRvyuGg3g2IPPsYbJcBNxbAqSqHUGhQKFO3szZDkUPUu
	 HzFdNovheKbqCbs2vsp19cCsoKaegCKhZSQh1DXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4D50F80535;
	Fri, 16 Sep 2022 11:53:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D35EF8014E; Wed, 14 Sep 2022 12:22:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59F58F8008E
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 12:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59F58F8008E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="DPbru+Wz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28E9SuJw008032;
 Wed, 14 Sep 2022 10:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eEkLslpr+tNgGZKF+emI7z6RQzFcHb8DKHBoODfssng=;
 b=DPbru+WzqsAQrA3Zt8Z1XhX+nT2lFWfDBWGPQsp9zZx9ZfwcEGKzFdj5HmIN7X5KWGlC
 /eyF6J51bwzlxpTRSzBb5+BEE1m0pbzaLJlw85772vMhwGNKyGFWNI1lHpAtu2WgrZS9
 VnLPk7Wt3q1FD07Z6G61TloY7HlVonLj4vgd5rmoLHouGdpsaoC0Yb9hjWDG3wNEi68a
 gvDvJ5r3yULL/eK6kYdhqSfaG8V6LCF/mCN6TES6AfuNJbB1ybKjBZ51+V6uuFrqqEhD
 8Eba3+gK1kk+cjg78OiouFQJIYQ3/zor4Qnjw5KgaLxbJNoH7CKprxarPq9wsqnynsXx ZQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jjy0c9ut7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Sep 2022 10:22:22 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28EAJMaC008864; 
 Wed, 14 Sep 2022 10:22:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3jh45kn765-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Sep 2022 10:22:21 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28EAJigW009529;
 Wed, 14 Sep 2022 10:22:21 GMT
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 28EAMK1V012539
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Sep 2022 10:22:20 +0000
Received: from [10.79.43.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 14 Sep
 2022 03:22:15 -0700
Subject: Re: [PATCH 1/4] net: ipa: Make QMI message rules const
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
From: Sibi Sankar <quic_sibis@quicinc.com>
Message-ID: <4fe0283d-d2f4-a593-0748-a180e3589832@quicinc.com>
Date: Wed, 14 Sep 2022 15:52:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220912232526.27427-2-quic_jjohnson@quicinc.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: WhKfS7_gS2wQmYILn1N4lixApnkS-2dD
X-Proofpoint-GUID: WhKfS7_gS2wQmYILn1N4lixApnkS-2dD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-14_03,2022-09-14_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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
> const, so do that for IPA.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Sibi Sankar <quic_sibis@quicinc.com>

> ---
>   drivers/net/ipa/ipa_qmi_msg.c | 20 ++++++++++----------
>   drivers/net/ipa/ipa_qmi_msg.h | 20 ++++++++++----------
>   2 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_qmi_msg.c b/drivers/net/ipa/ipa_qmi_msg.c
> index 6838e8065072..c5a5dac284a9 100644
> --- a/drivers/net/ipa/ipa_qmi_msg.c
> +++ b/drivers/net/ipa/ipa_qmi_msg.c
> @@ -9,7 +9,7 @@
>   #include "ipa_qmi_msg.h"
>   
>   /* QMI message structure definition for struct ipa_indication_register_req */
> -struct qmi_elem_info ipa_indication_register_req_ei[] = {
> +const struct qmi_elem_info ipa_indication_register_req_ei[] = {
>   	{
>   		.data_type	= QMI_OPT_FLAG,
>   		.elem_len	= 1,
> @@ -116,7 +116,7 @@ struct qmi_elem_info ipa_indication_register_req_ei[] = {
>   };
>   
>   /* QMI message structure definition for struct ipa_indication_register_rsp */
> -struct qmi_elem_info ipa_indication_register_rsp_ei[] = {
> +const struct qmi_elem_info ipa_indication_register_rsp_ei[] = {
>   	{
>   		.data_type	= QMI_STRUCT,
>   		.elem_len	= 1,
> @@ -134,7 +134,7 @@ struct qmi_elem_info ipa_indication_register_rsp_ei[] = {
>   };
>   
>   /* QMI message structure definition for struct ipa_driver_init_complete_req */
> -struct qmi_elem_info ipa_driver_init_complete_req_ei[] = {
> +const struct qmi_elem_info ipa_driver_init_complete_req_ei[] = {
>   	{
>   		.data_type	= QMI_UNSIGNED_1_BYTE,
>   		.elem_len	= 1,
> @@ -151,7 +151,7 @@ struct qmi_elem_info ipa_driver_init_complete_req_ei[] = {
>   };
>   
>   /* QMI message structure definition for struct ipa_driver_init_complete_rsp */
> -struct qmi_elem_info ipa_driver_init_complete_rsp_ei[] = {
> +const struct qmi_elem_info ipa_driver_init_complete_rsp_ei[] = {
>   	{
>   		.data_type	= QMI_STRUCT,
>   		.elem_len	= 1,
> @@ -169,7 +169,7 @@ struct qmi_elem_info ipa_driver_init_complete_rsp_ei[] = {
>   };
>   
>   /* QMI message structure definition for struct ipa_init_complete_ind */
> -struct qmi_elem_info ipa_init_complete_ind_ei[] = {
> +const struct qmi_elem_info ipa_init_complete_ind_ei[] = {
>   	{
>   		.data_type	= QMI_STRUCT,
>   		.elem_len	= 1,
> @@ -187,7 +187,7 @@ struct qmi_elem_info ipa_init_complete_ind_ei[] = {
>   };
>   
>   /* QMI message structure definition for struct ipa_mem_bounds */
> -struct qmi_elem_info ipa_mem_bounds_ei[] = {
> +const struct qmi_elem_info ipa_mem_bounds_ei[] = {
>   	{
>   		.data_type	= QMI_UNSIGNED_4_BYTE,
>   		.elem_len	= 1,
> @@ -208,7 +208,7 @@ struct qmi_elem_info ipa_mem_bounds_ei[] = {
>   };
>   
>   /* QMI message structure definition for struct ipa_mem_array */
> -struct qmi_elem_info ipa_mem_array_ei[] = {
> +const struct qmi_elem_info ipa_mem_array_ei[] = {
>   	{
>   		.data_type	= QMI_UNSIGNED_4_BYTE,
>   		.elem_len	= 1,
> @@ -229,7 +229,7 @@ struct qmi_elem_info ipa_mem_array_ei[] = {
>   };
>   
>   /* QMI message structure definition for struct ipa_mem_range */
> -struct qmi_elem_info ipa_mem_range_ei[] = {
> +const struct qmi_elem_info ipa_mem_range_ei[] = {
>   	{
>   		.data_type	= QMI_UNSIGNED_4_BYTE,
>   		.elem_len	= 1,
> @@ -250,7 +250,7 @@ struct qmi_elem_info ipa_mem_range_ei[] = {
>   };
>   
>   /* QMI message structure definition for struct ipa_init_modem_driver_req */
> -struct qmi_elem_info ipa_init_modem_driver_req_ei[] = {
> +const struct qmi_elem_info ipa_init_modem_driver_req_ei[] = {
>   	{
>   		.data_type	= QMI_OPT_FLAG,
>   		.elem_len	= 1,
> @@ -645,7 +645,7 @@ struct qmi_elem_info ipa_init_modem_driver_req_ei[] = {
>   };
>   
>   /* QMI message structure definition for struct ipa_init_modem_driver_rsp */
> -struct qmi_elem_info ipa_init_modem_driver_rsp_ei[] = {
> +const struct qmi_elem_info ipa_init_modem_driver_rsp_ei[] = {
>   	{
>   		.data_type	= QMI_STRUCT,
>   		.elem_len	= 1,
> diff --git a/drivers/net/ipa/ipa_qmi_msg.h b/drivers/net/ipa/ipa_qmi_msg.h
> index 495e85abe50b..8dfac59ea0ed 100644
> --- a/drivers/net/ipa/ipa_qmi_msg.h
> +++ b/drivers/net/ipa/ipa_qmi_msg.h
> @@ -242,15 +242,15 @@ struct ipa_init_modem_driver_rsp {
>   };
>   
>   /* Message structure definitions defined in "ipa_qmi_msg.c" */
> -extern struct qmi_elem_info ipa_indication_register_req_ei[];
> -extern struct qmi_elem_info ipa_indication_register_rsp_ei[];
> -extern struct qmi_elem_info ipa_driver_init_complete_req_ei[];
> -extern struct qmi_elem_info ipa_driver_init_complete_rsp_ei[];
> -extern struct qmi_elem_info ipa_init_complete_ind_ei[];
> -extern struct qmi_elem_info ipa_mem_bounds_ei[];
> -extern struct qmi_elem_info ipa_mem_array_ei[];
> -extern struct qmi_elem_info ipa_mem_range_ei[];
> -extern struct qmi_elem_info ipa_init_modem_driver_req_ei[];
> -extern struct qmi_elem_info ipa_init_modem_driver_rsp_ei[];
> +extern const struct qmi_elem_info ipa_indication_register_req_ei[];
> +extern const struct qmi_elem_info ipa_indication_register_rsp_ei[];
> +extern const struct qmi_elem_info ipa_driver_init_complete_req_ei[];
> +extern const struct qmi_elem_info ipa_driver_init_complete_rsp_ei[];
> +extern const struct qmi_elem_info ipa_init_complete_ind_ei[];
> +extern const struct qmi_elem_info ipa_mem_bounds_ei[];
> +extern const struct qmi_elem_info ipa_mem_array_ei[];
> +extern const struct qmi_elem_info ipa_mem_range_ei[];
> +extern const struct qmi_elem_info ipa_init_modem_driver_req_ei[];
> +extern const struct qmi_elem_info ipa_init_modem_driver_rsp_ei[];
>   
>   #endif /* !_IPA_QMI_MSG_H_ */
> 
