Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ACA78732
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2019 10:20:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40CDF1823;
	Mon, 29 Jul 2019 10:19:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40CDF1823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564388429;
	bh=fSZSpeZTBWFg6LDbDotVWpJsLc5G7c45EUlFw6VRyUg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SGxt27vUvIM8yPdbypkuTzPZEYoYX5RKu4DQ2/1RjBKwOuo6Lhw1uRwSVfp81HdL6
	 fJUoGexOBaEaS37+t+3lavLdjtUu8h0dFxMEWGC6J1fnyJgwviRXfkretT6pqy/TvS
	 hNtfgV4lkRiO5MOskiNIAbnawVyyNLzIkfjONY+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 834AEF8048D;
	Mon, 29 Jul 2019 10:18:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75CF8F8048D; Mon, 29 Jul 2019 10:18:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D76ACF800BF
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 10:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D76ACF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="UExwS/mu"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6T8EAvi014828; Mon, 29 Jul 2019 03:18:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=WRFRbbdfaf0Y2ROtu21La93Edhg0Qj+U7zL+OJ4cOJo=;
 b=UExwS/mu1oC8AJJIO+I3MLnokg1b4ditpCvaNSLlHge7MQ5JZLyRa22nZ19JYdzqKZwn
 j7TgIew0AuMbfCF3yWZAJoFE86kpOdPQaoM1rQ1BZAfKce4Ulaq8m2jbMmzcQb1Tg1/f
 xQdS9+lyOrBZbDBubz0KMVXDBiESrbEHjvySeiYOBnrGMPEJI/312L+Q/0PESJQshGuW
 04tEWJo3db01NMlfHiX0hjE8mBoopot479VdCgWt9nWtHhXYT2E2f7gIj14lISnDDsa5
 UB1OPcRXbaaPrcEL7hRXaPUW6CMMxJtqp/IV0vU3vE8OVur5s2OWOpCIZWIDsQa76jlK qA== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 2u0k1qthc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 29 Jul 2019 03:18:37 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 29 Jul
 2019 09:18:35 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Mon, 29 Jul 2019 09:18:35 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AB50F2A1;
 Mon, 29 Jul 2019 09:18:35 +0100 (BST)
Date: Mon, 29 Jul 2019 09:18:35 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Satendra Singh Thakur <thakursatendra2003@yahoo.co.in>
Message-ID: <20190729081835.GE54126@ediswmail.ad.cirrus.com>
References: <20190725161335.4162-1-thakursatendra2003@yahoo.co.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725161335.4162-1-thakursatendra2003@yahoo.co.in>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=2
 mlxlogscore=830 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 clxscore=1011 phishscore=0 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1906280000
 definitions=main-1907290098
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] [ASoC][soc-dapm] : memory leak in the func
 snd_soc_dapm_new_dai
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

On Thu, Jul 25, 2019 at 09:43:35PM +0530, Satendra Singh Thakur wrote:
> In the func snd_soc_dapm_new_dai, if the inner func
> snd_soc_dapm_alloc_kcontrol fails, there will be memory leak.
> The label param_fail wont free memory which is allocated by
> the func devm_kcalloc. Hence new label is created for this purpose.
> 
> Signed-off-by: Satendra Singh Thakur <thakursatendra2003@yahoo.co.in>
> ---
>  sound/soc/soc-dapm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> index f013b24c050a..f62d41ee6d68 100644
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -4095,7 +4095,7 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card, struct snd_soc_pcm_runtime *rtd,
>  						w_param_text, &private_value);
>  		if (!template.kcontrol_news) {
>  			ret = -ENOMEM;
> -			goto param_fail;
> +			goto outfree_w_param;
>  		}
>  	} else {
>  		w_param_text = NULL;
> @@ -4114,6 +4114,7 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card, struct snd_soc_pcm_runtime *rtd,
>  
>  outfree_kcontrol_news:
>  	devm_kfree(card->dev, (void *)template.kcontrol_news);
> +outfree_w_param:
>  	snd_soc_dapm_free_kcontrol(card, &private_value,
>  				   rtd->dai_link->num_params, w_param_text);

This is not necessary snd_soc_dapm_alloc_kcontrol calls
snd_soc_dapm_free_kcontrol on its internal error path.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
