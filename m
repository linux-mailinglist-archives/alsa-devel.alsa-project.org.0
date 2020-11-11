Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5832AEE21
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 10:52:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44D15171F;
	Wed, 11 Nov 2020 10:51:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44D15171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605088329;
	bh=uJUzaI5mR4miX1Ahgn2Sg9GDB6QwcuZh2u5UWBIUAaE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nCAXOq7zle/h67HDz9p9GYhmA45pqDUwrJjLWTGtNA1f7HFG90tKaVahsKrtrWq00
	 vjvcBzyW3xyf7/J6hB6o7a8Q0QUK/QgoK33trJY6HYjMshHtAiNnxjkFo93fcIHjKk
	 w4X2zQ75cZWwPfSQUJ3Ko3lLEUIDfNNzOap6PbgM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B331CF8007E;
	Wed, 11 Nov 2020 10:50:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24267F8020C; Wed, 11 Nov 2020 10:50:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7C16F8007E
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 10:50:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7C16F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="hTvC0Kxc"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AB9lSow032064; Wed, 11 Nov 2020 03:50:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=b9mTvsu5KMcLPmzbFZmuzKM1eD6AdfI9UB+vjRJel4Y=;
 b=hTvC0KxcU6IlwSOknwSvWkpxl6/uFZzMjSUXX+JIqAfhR0WyJS/jievtpXxrtcBxSZyH
 FmBLV+rI7UWivQ1TDKdOfLvYr/WLPWbELBEPitFZBfEi0HtM0GX7MxXBjverpN4cEwGh
 Gb8xdr7g3on21HDfSBKwUXak+VWmy4kpIGm6ZNr8GER0BBapCvyBqn7hPkLJBAjc7eMb
 w6W0hFuiH+ck2Q+Pqomb25AmJ/kbWabBa3qxHhIsUSljb2/egM7XWHMD6uapEP9dLyCL
 3rPTiKL05tz2lwXLlLFqT3wSsuH5K1gcM02D/llqyV9qf8TfwrmDS0BPnMASlto3r2Wq dQ== 
Received: from ediex01.ad.cirrus.com ([5.172.152.52])
 by mx0b-001ae601.pphosted.com with ESMTP id 34qg5xtrmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 11 Nov 2020 03:50:25 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 11 Nov
 2020 09:50:23 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Wed, 11 Nov 2020 09:50:23 +0000
Received: from [10.0.2.15] (ausnpc0lsnw1.ad.cirrus.com [198.61.64.168])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 705C07C;
 Wed, 11 Nov 2020 09:50:23 +0000 (UTC)
Subject: Re: [PATCH 3/3] ASoC: wm8998: Fix PM disable depth imbalance on error
To: Zhang Qilong <zhangqilong3@huawei.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>
References: <20201111041326.1257558-1-zhangqilong3@huawei.com>
 <20201111041326.1257558-4-zhangqilong3@huawei.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <04e35b24-165b-ccdb-b55e-05a90b8cb6c3@opensource.cirrus.com>
Date: Wed, 11 Nov 2020 09:50:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201111041326.1257558-4-zhangqilong3@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=932
 mlxscore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 bulkscore=0 suspectscore=2 lowpriorityscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011110053
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
> Fixes: 31833ead95c2c ("ASoC: arizona: Move request of speaker IRQs into bus probe")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>   sound/soc/codecs/wm8998.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wm8998.c b/sound/soc/codecs/wm8998.c
> index f6c5cc80c970..5413254295b7 100644
> --- a/sound/soc/codecs/wm8998.c
> +++ b/sound/soc/codecs/wm8998.c
> @@ -1375,7 +1375,7 @@ static int wm8998_probe(struct platform_device *pdev)
>   
>   	ret = arizona_init_spk_irqs(arizona);
>   	if (ret < 0)
> -		return ret;
> +		goto err_pm_disable;
>   
>   	ret = devm_snd_soc_register_component(&pdev->dev,
>   					      &soc_component_dev_wm8998,
> @@ -1390,6 +1390,8 @@ static int wm8998_probe(struct platform_device *pdev)
>   
>   err_spk_irqs:
>   	arizona_free_spk_irqs(arizona);
> +err_pm_disable:
> +	pm_runtime_disable(&pdev->dev);
>   
>   	return ret;
>   }
> 

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
