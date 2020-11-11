Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0217B2AEE4F
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 10:58:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78006174E;
	Wed, 11 Nov 2020 10:57:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78006174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605088724;
	bh=z0Ggv79/MstvmFCSrEexmJ12XLOj5uG1QgcfBGO4J1Y=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fAaYe1M5R+qjji/A4MfViadTE7Kf0ioM2Ks0VmpZ2hrPFsh+nQle2kvlBpjgtFZru
	 2u/CZ34T4E50+MmhFVAXiIEuzEMJ/WcE1nUbDcjE1hg8a1/grQ1m/gMwJg/VXW5t1L
	 rjvGF53reWmdoWXJirV7Jtb0ZUC2rpt+slbqd1GI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F05C0F801F5;
	Wed, 11 Nov 2020 10:57:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 756F5F8022D; Wed, 11 Nov 2020 10:57:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40794F801F5
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 10:57:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40794F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="i6cVKx/a"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AB9u1mu006743; Wed, 11 Nov 2020 03:57:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=htbcwH2AKXWq02ymb+blui8X4yqE4ccarLkLLQJaLuk=;
 b=i6cVKx/aEOiWwpAZdFaqvhx+OXvtKsA7zlapN1pATcPF21ebRqmKr9xHk/OFIQMwelgD
 0J3lOf7hEgZj44JlEKsJq3jap8l51Pumt1pLGgaOw/O006c5HJJV/w+njAQnueMGoxBc
 29o25BbxujkYH2YZr09zPCvHujH5IL2PqPcHooZvIWq14xou2b9KP76KONVnlrXOjnNC
 jQTcTp6Nj8P+3COw7ndhY6CXCFTiXAIc19CW86T5f5yGx726tDmNPP581FlE/KuGHGlK
 sYlrPOXRCVT0biPbjuEFJVm7+yooXMDbvceQ9m1Rqcfd1nouU1SXIRb6dbxkAAIrYLxq Kg== 
Received: from ediex02.ad.cirrus.com ([5.172.152.52])
 by mx0a-001ae601.pphosted.com with ESMTP id 34qg62jxc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 11 Nov 2020 03:57:37 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 11 Nov
 2020 09:57:30 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Wed, 11 Nov 2020 09:57:30 +0000
Received: from [10.0.2.15] (ausnpc0lsnw1.ad.cirrus.com [198.61.64.168])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A79597C;
 Wed, 11 Nov 2020 09:57:30 +0000 (UTC)
Subject: Re: [PATCH 1/3] ASoC: wm8994: Fix PM disable depth imbalance on error
To: Zhang Qilong <zhangqilong3@huawei.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>
References: <20201111041326.1257558-1-zhangqilong3@huawei.com>
 <20201111041326.1257558-2-zhangqilong3@huawei.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <ec70295a-b0bb-d77a-7bb9-22ba7cb87292@opensource.cirrus.com>
Date: Wed, 11 Nov 2020 09:57:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201111041326.1257558-2-zhangqilong3@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=850 phishscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011110054
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org
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

On 11/11/2020 04:13, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context.
> 
> Fixes: 57e265c8d71fb ("ASoC: wm8994: Move runtime PM init to platform device init")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>   sound/soc/codecs/wm8994.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
> index fc9ea198ac79..f57884113406 100644
> --- a/sound/soc/codecs/wm8994.c
> +++ b/sound/soc/codecs/wm8994.c
> @@ -4645,8 +4645,12 @@ static int wm8994_probe(struct platform_device *pdev)
>   	pm_runtime_enable(&pdev->dev);
>   	pm_runtime_idle(&pdev->dev);
>   
> -	return devm_snd_soc_register_component(&pdev->dev, &soc_component_dev_wm8994,
> +	ret = devm_snd_soc_register_component(&pdev->dev, &soc_component_dev_wm8994,
>   			wm8994_dai, ARRAY_SIZE(wm8994_dai));
> +	if (ret < 0)
> +		pm_runtime_disable(&pdev->dev);
> +
> +	return ret;
>   }
>   
>   static int wm8994_remove(struct platform_device *pdev)
> 

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
