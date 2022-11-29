Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E7F63C476
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 17:00:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A16681699;
	Tue, 29 Nov 2022 16:59:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A16681699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669737600;
	bh=DEAnB01cV8jdV29QvowiLKsxZGPw+SosFa066JGN8hk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=adkXICk8zSWYBbIPwtvgAdI9ZsyaK5mB+8i7tgDYKHmhbx6tj0xRhTR+FtFwHn2e8
	 BWiAMz+aFJ8xmn1WvlhSNL0DDDsQ5/xWsNIPiYh+N7sVtFLHZfZ+IfXK+xGXzGjG19
	 MXoIc+xNerruGOt6wQzBaXtqoW9l1qqnbMsLr8H8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D949F80137;
	Tue, 29 Nov 2022 16:59:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AFDEF80137; Tue, 29 Nov 2022 16:59:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5689F80166
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 16:58:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5689F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="j0PVXACH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ATFmncM016736; Tue, 29 Nov 2022 15:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=O1zHUKyMYg/N5w80x5NsEXIV4fzGlq8CSJOktCGLEoc=;
 b=j0PVXACHfpFiyiV3rnlCeFwBcG1yGYvTRRpsz9jkx5zIW59HM4QxuMVk79qmbgT+hktG
 iz14heoVMlFAzwEC9mtcaWwo8WMhh4olSeBDBBixOzm/XqHmH+RpybeHKrOFzITq14/I
 pQOqCyfxWs6uuIbJt/2jrQYDSErW7LXIWsXbMlDyfaLAA1aiUKibiDdL3mBIEgfgKAro
 s0I1NNWkrhnw3PIp4towyuNsE769NKX2bBvzzQrROjT0gVXiILVSZpgzxn3H2L/yiPUx
 PKBqq1hMChU4NmU8naQRiNLVE0ZquYFA9FYp2+BwQzJRZM4lLIBGN3WARjhkBhb6zWZu Zw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m5n1vg0v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 15:58:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2ATFwh5f029584
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 15:58:43 GMT
Received: from [10.216.9.244] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 29 Nov
 2022 07:58:37 -0800
Message-ID: <65fd2068-4744-221f-f398-da4303b64fca@quicinc.com>
Date: Tue, 29 Nov 2022 21:28:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: qcom: lpass-sc7180: Add maybe_unused tag for system
 PM ops
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
References: <1669726428-3140-1-git-send-email-quic_srivasam@quicinc.com>
 <Y4YpELN4/0cesonb@dev-arch.thelio-3990X>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <Y4YpELN4/0cesonb@dev-arch.thelio-3990X>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: c5Gnbz93EI3y_DZwAkv2U-Y1I-f7G-L1
X-Proofpoint-ORIG-GUID: c5Gnbz93EI3y_DZwAkv2U-Y1I-f7G-L1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_10,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 impostorscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1011 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290089
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, broonie@kernel.org, bgoswami@quicinc.com,
 quic_plai@quicinc.com, swboyd@chromium.org, judyhsiao@chromium.org,
 linux-kernel@vger.kernel.org
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

Thanks for your tie Nathan!!!

On 11/29/2022 9:15 PM, Nathan Chancellor wrote:
> On Tue, Nov 29, 2022 at 06:23:48PM +0530, Srinivasa Rao Mandadapu wrote:
>> Add __maybe_unused tag for system PM ops suspend and resume.
>> This is required to fix allmodconfig compilation issue.
>> Fixes: c3bf7699747c ("ASoC: qcom: lpass-sc7280: Add system suspend/resume PM ops")
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> A better solution would be replacing SET_SYSTEM_SLEEP_PM_OPS() with
> SYSTEM_SLEEP_PM_OPS(), which was added to avoid needing to add these
> '__maybe_unused' attributes to these functions. See commit 1a3c7bb08826
> ("PM: core: Add new *_PM_OPS macros, deprecate old ones") for more info.

Tried this option but as this patch required for Kernel 5.4 version code 
base,

SYSTEM_SLEEP_PM_OPS didn't work.

>> ---
>>   sound/soc/qcom/lpass-sc7180.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
>> index b96b85a..41db661 100644
>> --- a/sound/soc/qcom/lpass-sc7180.c
>> +++ b/sound/soc/qcom/lpass-sc7180.c
>> @@ -163,14 +163,14 @@ static int sc7180_lpass_exit(struct platform_device *pdev)
>>   	return 0;
>>   }
>>   
>> -static int sc7180_lpass_dev_resume(struct device *dev)
>> +static int __maybe_unused sc7180_lpass_dev_resume(struct device *dev)
>>   {
>>   	struct lpass_data *drvdata = dev_get_drvdata(dev);
>>   
>>   	return clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
>>   }
>>   
>> -static int sc7180_lpass_dev_suspend(struct device *dev)
>> +static int __maybe_unused sc7180_lpass_dev_suspend(struct device *dev)
>>   {
>>   	struct lpass_data *drvdata = dev_get_drvdata(dev);
>>   
>> -- 
>> 2.7.4
>>
>>
