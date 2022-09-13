Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 814885B7A81
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 21:05:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 050193E7;
	Tue, 13 Sep 2022 21:05:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 050193E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663095953;
	bh=DRQEgJQVtyJXOht7yJot+n2xVgnjifskwRRyHl9SNog=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h260FSxMuiT/OH+bgsCC0TfICEnGr73JRZAgctfYDSG94OH2nDKV7lAmgyufnl0/R
	 5KlnG3xh5CvJgllgdkLrZb7+ttnVB56jU+2W1nQknT37xC/fFrDqqaFTsivIakQ6IU
	 f7QxSMGKf08brDoZClBXZ3xF5NXEMVibhy+Z/gBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D219F8025D;
	Tue, 13 Sep 2022 21:04:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7185F80224; Tue, 13 Sep 2022 21:04:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E8CCF80154
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 21:04:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E8CCF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="QOLInBaD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DIGnwJ021401;
 Tue, 13 Sep 2022 19:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=IpC2wUwUWey40UM6owh3a0MmnVlbpzDaWHe2xX0ctPE=;
 b=QOLInBaD1/SL3UUKhcGi5q7MOrbtlT65hvq6l5qcbWwE/o0+EIyY7qLK5ZRP/nNGNleI
 4cwdWN0q2RsMnaYaMidOZJfEooHOYwOHzGzfP6WSjNOxms4UhipLn2DeEh3/6YhwGC0s
 HkenHkCPck2EixO7HFdN0MYDth43VEeyEXxFRdfbI3oEy0skqYrixKi2zLdtN/E0MQx+
 P7MR786vw5CHExmv780/U+pnY2GWqvwkQJLP2+m09W2M/K1ox86sOUJKg86c61tIIfti
 uLdX9iYZtyofgv1AM1yDXeY2dY6gVwg0+4Vxr8J0XyE6IKWFk0brzXDNFLe0ETdqup1T DA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jjy0e039c-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 19:04:46 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28DIpRsd013211; 
 Tue, 13 Sep 2022 18:51:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3jj1ubxku9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 18:51:27 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28DIlOsp009542;
 Tue, 13 Sep 2022 18:51:27 GMT
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 28DIpR9P013203
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 18:51:27 +0000
Received: from [10.110.52.115] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 13 Sep
 2022 11:51:25 -0700
Message-ID: <5b0543dc-4db8-aa33-d469-0e185c82b221@quicinc.com>
Date: Tue, 13 Sep 2022 11:51:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 0/4] Make QMI message rules const
Content-Language: en-US
To: Alex Elder <elder@ieee.org>, Alex Elder <elder@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Kalle Valo <kvalo@kernel.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Konrad
 Dybcio <konrad.dybcio@somainline.org>
References: <20220912232526.27427-1-quic_jjohnson@quicinc.com>
 <f2fa19a1-4854-b270-0776-38993dece03f@ieee.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <f2fa19a1-4854-b270-0776-38993dece03f@ieee.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Pub-RnSfiPRai4Z1mkmYQFf4Rdu-yslM
X-Proofpoint-GUID: Pub-RnSfiPRai4Z1mkmYQFf4Rdu-yslM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_09,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=888
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209130087
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

On 9/13/2022 6:58 AM, Alex Elder wrote:
> On 9/12/22 6:25 PM, Jeff Johnson wrote:
>> Change ff6d365898d ("soc: qcom: qmi: use const for struct
>> qmi_elem_info") allows QMI message encoding/decoding rules to be
>> const. So now update the definitions in the various client to take
>> advantage of this. Patches for ath10k and ath11k were perviously sent
>> separately.
> 
> I have had this on my "to-do list" for ages.
> The commit you mention updates the code to be
> explicit about not modifying this data, which
> is great.
> 
> I scanned over the changes, and I assume that
> all you did was make every object having the
> qmi_elem_info structure type be defined as
> constant.
> 
> Why aren't you changing the "ei_array" field in
> the qmi_elem_info structure to be const?  Or the
> "ei" field of the qmi_msg_handler structure?  And
> the qmi_response_type_v01_ei array (and so on)?
> 
> I like what you're doing, but can you comment
> on what your plans are beyond this series?
> Do you intend to make the rest of these fields
> const?

Hi Alex,
My primary focus is the ath* wireless drivers, and my primary goal was 
to make the tables there const. So this series, along with the two 
out-of-series patches for ath10k and ath11k complete that scope of work.

The lack of the other changes to the QMI data structures is simply due 
to me not looking in depth at the QMI code beyond the registration 
interface.

I'll be happy to revisit this as a separate cleanup.

/jeff

