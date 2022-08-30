Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD805AA796
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Sep 2022 08:04:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2364A1637;
	Fri,  2 Sep 2022 08:03:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2364A1637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662098663;
	bh=Dsk0SooBKPf/Lft7q4oFtVz2Ky3ndRgdAtoP4xCNe2E=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UxoW9hDzx0NQgrE3eUtdiKI/3K1pLFe06BjfN3ZoBr/Q6pp5PEq2g+J6wuzUZVMOz
	 GA92HrheblYb1jHJPtJFXIeIhTESE/xzl330SGT7BKE6Jp/qMBd33ck1T91cCoAQxB
	 Y8H8vMwDZwFU08O0IZiLhvNKXAL+6qOBvW9OzQmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15B14F804AC;
	Fri,  2 Sep 2022 08:02:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 804CDF8023A; Tue, 30 Aug 2022 19:34:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B800F800F2
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 19:34:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B800F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="Q6aVkRA3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27UFx294005591;
 Tue, 30 Aug 2022 17:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=F+JHeRN8PToozitBrhdv/oNgrBd/V/BN8qJ5YgZ6y3A=;
 b=Q6aVkRA3hwQE7Dx4uV30w0WB0adFEdbn0/BIURgSZjy6fFOK/PMuDjqRYp3zml7h7lzY
 HuM51aBFO2aCbT1d3bheglCJIrM6bkDYqDlfwJ3PCoIid5kqFuRb7CEJNLybd8w7vZ6x
 o2d+cs/TrvcT4oyRRlDdjl5dbjhi2urRZ+WKJ/OuMu6iv6A1zbE0QSOAS2T/IsBGMdyG
 1j7isLrrj9fL/7WDKRMja3Wru1hS/0vtVTOnZlGxiYfyI/wb53uCwvLq4R8SaqycjrFk
 QKKFeA6c7cEHlejyk/71m6KLYspVoLW0nj5IptNWKpKFHc9U39Lb6InA0s4wkNTgIf3X Ug== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j9m2t0m8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 17:34:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27UHXxOg005519
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 17:33:59 GMT
Received: from [10.110.39.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 30 Aug
 2022 10:33:58 -0700
Message-ID: <a437b91a-281d-56b3-41bf-15d9593ece74@quicinc.com>
Date: Tue, 30 Aug 2022 10:33:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/3] slimbus: qcom-ngd: use correct error in message of
 pdr_add_lookup() failure
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@somainline.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>
References: <20220830121359.634344-1-krzysztof.kozlowski@linaro.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220830121359.634344-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: kCyURfhdLxmWT3BuVaOOtQftpVhRUuqZ
X-Proofpoint-ORIG-GUID: kCyURfhdLxmWT3BuVaOOtQftpVhRUuqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_10,2022-08-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxlogscore=963 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1011 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208300081
X-Mailman-Approved-At: Fri, 02 Sep 2022 08:02:51 +0200
Cc: stable@vger.kernel.org
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

On 8/30/2022 5:13 AM, Krzysztof Kozlowski wrote:
> Use cprrect error code, instead of previous 'ret' value, when printing

s/cprrect/correct/

> error from pdr_add_lookup() failure.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: e1ae85e1830e ("slimbus: qcom-ngd-ctrl: add Protection Domain Restart Support")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/slimbus/qcom-ngd-ctrl.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 0aa8408464ad..6fe6abb86061 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1581,6 +1581,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>   
>   	pds = pdr_add_lookup(ctrl->pdr, "avs/audio", "msm/adsp/audio_pd");
>   	if (IS_ERR(pds) && PTR_ERR(pds) != -EALREADY) {
> +		ret = PTR_ERR(pds);
>   		dev_err(dev, "pdr add lookup failed: %d\n", ret);
>   		return PTR_ERR(pds);

return ret?

>   	}

