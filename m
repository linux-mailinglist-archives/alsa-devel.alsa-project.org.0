Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5581B1004E7
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 12:59:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA2C1168F;
	Mon, 18 Nov 2019 12:58:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA2C1168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574078383;
	bh=MwTWdQ+nV+bvnUCgbX3cORY9ZOPb3aP73ihMCcw9drs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eAw5nlrApyqcLPepqXeRIF83zqYuFrPf38JYoNg2NCBjGTPk9UxI9+So2CpfUGP+2
	 L67LdGn+hzlL2XgVz3SplzAnwzw/2Pf33mVEN0ZCC/2H9tF1BgBIlM+YYndKY8jrf2
	 SPyPYMl5FkatiAPRmLWg6lzSRR5zRBW8NSM1/yCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74A78F8013B;
	Mon, 18 Nov 2019 12:58:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B34AF8013B; Mon, 18 Nov 2019 12:57:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9FEBF800F6
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 12:57:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9FEBF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="AME6hCYH"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAIBsbju014603; Mon, 18 Nov 2019 05:57:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=a90LFI+4UGRRN7SiN+NnHb60zo8aNl0u0NCeb9mxiHk=;
 b=AME6hCYHgFoi0so5ng3/aZ9wLRPM0wv8J2BwCeJTZG1j97yGsixViaaHImVHmjKErj/V
 /yz5WiIuZPyqTatpNGCt1ihqyAgCgWsG18tPf1vzLd98824To4FwNYBmfFWPxLPS7Msv
 mPdXoJY4xsQKIHr+t+M4tmahSXAGZCCKs0dRGxwkwVucrG2WaKHE13Sduyo8xAy7SW8G
 nyjRZm9Tb/64Pb6C7ptlkXJneP3mfCE7l5eFpvXUNdQPUwe5kjv4kZFHCcrOBTcNP5nF
 1XKpeA4XRhyb5DlCikLQJ/vreHfCNF0WgQuJywb+7bSDGr2KR6qHR4fE3yR5VDFPC6Yl XA== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2wafd6teh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 18 Nov 2019 05:57:50 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 18 Nov
 2019 11:57:48 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Mon, 18 Nov 2019 11:57:48 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F17672C6;
 Mon, 18 Nov 2019 11:57:47 +0000 (UTC)
Date: Mon, 18 Nov 2019 11:57:47 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Chuhong Yuan <hslester96@gmail.com>
Message-ID: <20191118115747.GG10439@ediswmail.ad.cirrus.com>
References: <20191118073633.28237-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118073633.28237-1-hslester96@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=2 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911180108
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: wm2200: add missed operations in
 remove and probe failure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Nov 18, 2019 at 03:36:33PM +0800, Chuhong Yuan wrote:
> This driver misses calls to pm_runtime_disable and regulator_bulk_disable
> in remove and a call to free_irq in probe failure.
> Add the calls to fix it.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  sound/soc/codecs/wm2200.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/sound/soc/codecs/wm2200.c b/sound/soc/codecs/wm2200.c
> index cf64e109c658..7b087d94141b 100644
> --- a/sound/soc/codecs/wm2200.c
> +++ b/sound/soc/codecs/wm2200.c
> @@ -2410,6 +2410,8 @@ static int wm2200_i2c_probe(struct i2c_client *i2c,
>  
>  err_pm_runtime:
>  	pm_runtime_disable(&i2c->dev);
> +	if (i2c->irq)
> +		free_irq(i2c->irq, wm2200);

Might be worth also adding a return if the request of the IRQ
fails. We will get a large WARN in the log if the IRQ request
failed, then we fall down this error path.

>  err_reset:
>  	if (wm2200->pdata.reset)
>  		gpio_set_value_cansleep(wm2200->pdata.reset, 0);
> @@ -2426,12 +2428,15 @@ static int wm2200_i2c_remove(struct i2c_client *i2c)
>  {
>  	struct wm2200_priv *wm2200 = i2c_get_clientdata(i2c);
>  
> +	pm_runtime_disable(&i2c->dev);
>  	if (i2c->irq)
>  		free_irq(i2c->irq, wm2200);
>  	if (wm2200->pdata.reset)
>  		gpio_set_value_cansleep(wm2200->pdata.reset, 0);
>  	if (wm2200->pdata.ldo_ena)
>  		gpio_set_value_cansleep(wm2200->pdata.ldo_ena, 0);
> +	regulator_bulk_disable(ARRAY_SIZE(wm2200->core_supplies),
> +			       wm2200->core_supplies);

This one is a bit trickier since this regulator is being
controlled by PM runtime, and I don't think it necessarily leaves
things in an enabled state when it is disabled.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
