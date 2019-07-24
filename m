Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B4272B90
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 11:39:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC49E1A3C;
	Wed, 24 Jul 2019 11:38:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC49E1A3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563961181;
	bh=BQejdKrga4+2BhkZwefp7dEW5wreilUDN1z/EsCXU9o=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EdG+gERKqaTNZzrSMbsVlib5IhiDWC3EgEups6ZIATMCrnLHvXyOSD6laiQw4/ZWO
	 JGIEIg6v0mFUpD+hbaiFm4wFp3893AIJq/Sa+sB4bZp0OI/XCGz5v+LKU3n+1Qawea
	 E81JsI8LdHduTVqiQeonupHWDxvX2kivFYvZeXQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B05DF803D6;
	Wed, 24 Jul 2019 11:37:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F23EEF803D1; Wed, 24 Jul 2019 11:37:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 460FDF800E8
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 11:37:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 460FDF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="A2SOd4es"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6O9Y2Jx006365; Wed, 24 Jul 2019 04:37:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=rUt6caAb5KRi/bUUHF5rUQltMXZTmYFg1gqsAJkReA0=;
 b=A2SOd4esgjgqcc8q9e5s1TNIb/KC4dtiRWGY7Rkh5FV/dCnyOVpiEyouFUMKl8Icsl+l
 sfdE4UrY1PZ+MKRtJu79SnBi+gzPSjwQ8o+cykoYz1Ir9R2aH6p62vA+sHpvyQasjken
 H1RD20pRqib9dVATFgU3OoYfbTTkWO/E5EN0GZmbKduWlY+OaGiCHVbHyXijxRbzJcZZ
 9MerDXtGvfyyKuID9k57F0j1y5sEFQ1usEuBWFeB8KKUnwZivpQCuFX+UfjrxRpk9pjL
 3O3n2pDS9oFTgfwYfun/5IrG9vEXUVNzHXtXScz7IaBlT7M7J965f3/k5kw2114CYViy /A== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2tx61s15f9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 24 Jul 2019 04:37:49 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 24 Jul
 2019 10:37:47 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Wed, 24 Jul 2019 10:37:47 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A8BF6447;
 Wed, 24 Jul 2019 10:37:47 +0100 (BST)
Date: Wed, 24 Jul 2019 10:37:47 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190724093747.GX54126@ediswmail.ad.cirrus.com>
References: <8736iwurtc.wl-kuninori.morimoto.gx@renesas.com>
 <874l3ctd42.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <874l3ctd42.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1907240107
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 24/25] ASoC: soc-component: move
 snd_soc_component_stream_event()
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

On Wed, Jul 24, 2019 at 10:53:37AM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch moves snd_soc_component_stream_event() to soc-component.c
> It will be used at soc-dapm.c :: dapm_power_widgets(),
> but no effect by this patch.
> 
> 	static int dapm_power_widgets(struct snd_soc_card *card, int event)
> 	{
> 		...
> 		list_for_each_entry(d, &card->dapm_list, list) {
> =>			if (d->stream_event)
> =>				d->stream_event(d, event);
> 		}
> 		...
> 	}
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> index e4e8fc4..ab8e7cc 100644
> --- a/sound/soc/soc-component.c
> +++ b/sound/soc/soc-component.c
> @@ -61,6 +61,16 @@ void snd_soc_component_seq_notifier(struct snd_soc_dapm_context *dapm,
>  		component->driver->seq_notifier(component, type, subseq);
>  }
>  
> +int snd_soc_component_stream_event(struct snd_soc_dapm_context *dapm,
> +				   int event)
> +{
> +	struct snd_soc_component *component = dapm->component;
> +
> +	if (component->driver->stream_event)
> +		return component->driver->stream_event(component, event);
> +	return 0;

Minor nitpick but a blank line before the return would be more
normal and consistent with your other patches.

> @@ -2729,8 +2721,7 @@ static int snd_soc_component_initialize(struct snd_soc_component *component,
>  	dapm->idle_bias_off = !driver->idle_bias_on;
>  	dapm->suspend_bias_off = driver->suspend_bias_off;
>  	dapm->seq_notifier = snd_soc_component_seq_notifier;
> -	if (driver->stream_event)
> -		dapm->stream_event = snd_soc_component_stream_event;
> +	dapm->stream_event = snd_soc_component_stream_event;

Obviously same comment regarding the NULL checks in DAPM applies
here.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
