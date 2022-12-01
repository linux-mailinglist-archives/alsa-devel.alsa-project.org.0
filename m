Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E85F63E85A
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 04:32:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 007D116C2;
	Thu,  1 Dec 2022 04:31:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 007D116C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669865565;
	bh=unRnKAAFASBbchrx4qaCr5T6bx/sytSYcrhmuW/Lvo8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ccm9iI8QyhJKCXzihK/u+sRVHXOTTvSMlOw4oZh/zVWD+T0hBDTbxGMDgw0lHUWEQ
	 o9NLVZFEkIXsRXdg5hZivHfPpWp0XY4SEPxvyddgPEo5xtnZcmsQQJ25jZgR2d+Q0D
	 ChioKovz8H9inlPQnUPxTnf6nfg7FdY2CabIF+o0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 852FFF80116;
	Thu,  1 Dec 2022 04:31:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BF87F8028D; Thu,  1 Dec 2022 04:31:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0F6FF80116
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 04:31:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0F6FF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="d2Bx1Plw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B12ioum019070; Thu, 1 Dec 2022 03:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=BfBVfHL55y4El2LYn+90PYn4HEvJdNfd0rEfXcfans8=;
 b=d2Bx1PlwMWwhIAG7DwvtHLc+p62MU1u4nuXX640KzeoPIyJMZ0woHtPpOvpbXdSJe0Gb
 D/+iJRbIottkcTyumxQzMMz/9JQhOeZzMvoFf5irAjau1JM3wWTAoOnw6KBWfFHUJ1Tw
 lkdE6ND7gGj+NcN0i0cut1H6Gy3zg7UAV7lt6+1P3Y3f9eMa8/wrLnBpbKrXw1V/JOee
 P2XT1zrCHpopTYrGMIbaiP3ApAqoWiTdvYWGW2LxvmPdPjAefFYj6bZ1il3+OTPpnvf9
 k1QNNnt8IMNOgUOJrKq68GK/EvirkF67QOup/gplEpNyQ/0lPsQ1CcaBw5tZWv6osD/D jw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m6k3yg67t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 03:31:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B13VXGY004783
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Dec 2022 03:31:33 GMT
Received: from [10.216.5.116] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 19:31:26 -0800
Message-ID: <24f8252f-b843-4a48-0a98-addf1f56cab5@quicinc.com>
Date: Thu, 1 Dec 2022 09:01:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: qcom: lpass-sc7180: Add maybe_unused tag for system
 PM ops
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Matthias Kaehlcke <mka@chromium.org>
References: <1669726428-3140-1-git-send-email-quic_srivasam@quicinc.com>
 <Y4eN4utrDnEnKu/8@google.com> <Y4eP2yFKsmxzyX/4@sirena.org.uk>
 <Y4eU7ra4w3Fm+wLM@google.com> <Y4erFaRfGXbSJLMm@sirena.org.uk>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <Y4erFaRfGXbSJLMm@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: PgCB5VPgXqdJlAIFZEeTFpcNsyD3VJyQ
X-Proofpoint-ORIG-GUID: PgCB5VPgXqdJlAIFZEeTFpcNsyD3VJyQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_02,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=703 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212010020
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, quic_plai@quicinc.com,
 swboyd@chromium.org, judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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


On 12/1/2022 12:42 AM, Mark Brown wrote:
> On Wed, Nov 30, 2022 at 05:37:50PM +0000, Matthias Kaehlcke wrote:
>
>> The tag of the applied patch is incorrect too, which is actually what I noticed:
>>
>> Fixes: a3a96e93cc88 ("ASoC: qcom: lpass-sc7280: Add system suspend/resume PM ops")
>>
>> This patch is for sc7180, so it should be:
>>
>> Fixes: 2d68148f8f85 ("ASoC: qcom: lpass-sc7180: Add system suspend/resume PM ops")
Actually with the fix already posted v2.
> Oh, well.  It's just a fixes tag for something that has only been in
> -next, it doesn't really matter that much.
Okay. Sorry for Inconvenience.
