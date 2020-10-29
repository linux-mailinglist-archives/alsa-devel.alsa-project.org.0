Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD9529F09F
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 16:56:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27E8F15DC;
	Thu, 29 Oct 2020 16:55:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27E8F15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603987007;
	bh=hlmWBrtYioM/0qynxBJFejwnH9uYVdTOQq3hwaltU6A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ar4AU1w2F26x6mzPLniC4EdeBwqF2fwRsEdCQvHC90RzvQj/AQxQCJ1+Pu21umiit
	 uvO/lF4eDm4n/7hrwTOmk1JC+dPGS3SIKfwJ+G+qEKUqxrR+/qXwlvPipHSgGhE22Y
	 j6TG71uSnE85P6Rurxsecex0W6yOPBcKZIMPsQtI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41D14F80217;
	Thu, 29 Oct 2020 16:55:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE660F8020D; Thu, 29 Oct 2020 16:55:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A09BDF800FF
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 16:55:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A09BDF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ezu8S5a0"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 09TFkceL016093; Thu, 29 Oct 2020 10:55:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=MZg49iuuuHeBKD5UTNZqq0HBwG/btR4Qu3Pi0xslXDk=;
 b=ezu8S5a02NS0Bmhv/lvOjQfnL6567/5Lh4vCGliWdf2Kwyse9tJB2cAVhRH4TjaegckA
 YuO0ZPPpvUfhY3Wq7ubENgJ0W42XAfFdJmVnVqVBNP+i1hpgYXcw6QEMp2ivsv0ozuAO
 Hb+nehNJviKlk0s2UfAL2NRm2Du3uFc6P49e+rwOf98Kf8xpM/jFs0WvcFES2ZK5d8oN
 MayeRFj7kfxyuj6Xlr9enjHf4o8/H8TuzFh//1NXNlLjTvy7J8QWPcoi2Tai+rJyQ8FY
 6PmhajES4kaTXFAIBVEfnAdK7jd+dJ44CzBvp9J6voMtV/tEEOL4AaMiSkCQyqTTLBlr GQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 34chp1r5we-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 29 Oct 2020 10:55:06 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 29 Oct
 2020 15:55:03 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 29 Oct 2020 15:55:03 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BBB432C1;
 Thu, 29 Oct 2020 15:55:03 +0000 (UTC)
Date: Thu, 29 Oct 2020 15:55:03 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Coiby Xu <coiby.xu@gmail.com>
Subject: Re: [PATCH 24/25] ASoC: wm8994: remove unnecessary CONFIG_PM_SLEEP
Message-ID: <20201029155503.GD10899@ediswmail.ad.cirrus.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
 <20201029074301.226644-24-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201029074301.226644-24-coiby.xu@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 spamscore=0 clxscore=1011 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010290112
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "open
 list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, open list <linux-kernel@vger.kernel.org>
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

On Thu, Oct 29, 2020 at 03:43:00PM +0800, Coiby Xu wrote:
> SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.
> 
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>  sound/soc/codecs/wm8994.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
> index fc9ea198ac79..9294ad06f76d 100644
> --- a/sound/soc/codecs/wm8994.c
> +++ b/sound/soc/codecs/wm8994.c
> @@ -4656,7 +4656,6 @@ static int wm8994_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int wm8994_suspend(struct device *dev)
>  {
>  	struct wm8994_priv *wm8994 = dev_get_drvdata(dev);
> @@ -4681,7 +4680,6 @@ static int wm8994_resume(struct device *dev)
>  
>  	return 0;
>  }
> -#endif
>  
>  static const struct dev_pm_ops wm8994_pm_ops = {
>  	SET_SYSTEM_SLEEP_PM_OPS(wm8994_suspend, wm8994_resume)

Not sure this really makes sense, what is going to stop the
unused function warning if PM isn't configured?

Thanks,
Charles
