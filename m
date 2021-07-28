Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7923D89EE
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jul 2021 10:40:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01B2B17C5;
	Wed, 28 Jul 2021 10:39:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01B2B17C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627461646;
	bh=LWQcwadDCUHK2kCzBYJuH+Aq+pAoNreDQMiB8/3+pYE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tWOLx4dzy6ZxfnRJujalsONF6a80dgduPj3O92dfIB2OePkDAy1kP8MGJHPoM4j6R
	 nAmBSEGAj1ucquE04o/ZuP7ID3cAdgSxBTsRuxBVVtpSWmYeR3c7GGYioS81olUeWN
	 /9xC9PfkwY6LE/pQbhHTSlN3N2u/WGcW3zVsZ4SQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65703F8025E;
	Wed, 28 Jul 2021 10:39:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A655F8025A; Wed, 28 Jul 2021 10:39:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0C7FF8020D
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 10:39:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0C7FF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="pOlUmjXE"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16S62g8l023725; 
 Wed, 28 Jul 2021 03:39:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=hqF20eLyVojdLtjiSNXymtIII8khZZOzbgPMB6mFMug=;
 b=pOlUmjXEsBcFxk93ilMUviz9JatsfxrzDJt+zXNU8v1xSHJRANvKipidzEr7z/Ll55pZ
 zL5MTK5iUG4vC1vD5o63dOe6QWpOFenpE4ld4rRzJvHUlFIl4PlkzDwthKYof8XHWoCy
 CEcliVHOoBBUwaB+E6gTm6mJDIyCSO0waJxUZU6NF/1tNS4EwqvhwqFpO9doQ86VDXmB
 /x5EWP3qJBwzpEUeImH6A6LHqY6pW4T0G87stCCG7RLQKJbxzXasfOhzmv33ks7KplOo
 4rJBba6m8pAdARB3svF3RujV7j+jvGvASigkHgRBW+N1USvbLzfgf0l3cnM560PLsRqv Cw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a31m2r4rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 28 Jul 2021 03:39:04 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 28 Jul
 2021 09:39:02 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 28 Jul 2021 09:39:02 +0100
Received: from [198.61.64.62] (unknown [198.61.64.62])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DA73D2BA;
 Wed, 28 Jul 2021 08:38:55 +0000 (UTC)
Subject: Re: [PATCH] ASoC: component: Remove misplaced prefix handling in pin
 control functions
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
References: <20210726194123.54585-1-broonie@kernel.org>
From: Lucas tanure <tanureal@opensource.cirrus.com>
Message-ID: <242c4628-30e9-097e-4f08-b3675bec1b95@opensource.cirrus.com>
Date: Wed, 28 Jul 2021 09:38:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726194123.54585-1-broonie@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NpzE-eqDFWeojxcMfo4PVLgoPJkBWX-o
X-Proofpoint-ORIG-GUID: NpzE-eqDFWeojxcMfo4PVLgoPJkBWX-o
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 impostorscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 clxscore=1011 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107280048
Cc: alsa-devel@alsa-project.org, Richard Fitzgerald <rf@opensource.cirrus.com>
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

On 7/26/21 8:41 PM, Mark Brown wrote:
> When the component level pin control functions were added they for some
> no longer obvious reason handled adding prefixing of widget names. This
> meant that when the lack of prefix handling in the DAPM level pin
> operations was fixed by ae4fc532244b3bb4d (ASoC: dapm: use component
> prefix when checking widget names) the one device using the component
> level API ended up with the prefix being applied twice, causing all
> lookups to fail.
> 
> Fix this by removing the redundant prefixing from the component code,
> which has the nice side effect of also making that code much simpler.
> 
> Reported-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   sound/soc/soc-component.c | 63 +++++++++++++++++----------------------
>   1 file changed, 27 insertions(+), 36 deletions(-)
> 
> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> index 3a5e84e16a87..c8dfd0de30e4 100644
> --- a/sound/soc/soc-component.c
> +++ b/sound/soc/soc-component.c
> @@ -148,86 +148,75 @@ int snd_soc_component_set_bias_level(struct snd_soc_component *component,
>   	return soc_component_ret(component, ret);
>   }
>   
> -static int soc_component_pin(struct snd_soc_component *component,
> -			     const char *pin,
> -			     int (*pin_func)(struct snd_soc_dapm_context *dapm,
> -					     const char *pin))
> -{
> -	struct snd_soc_dapm_context *dapm =
> -		snd_soc_component_get_dapm(component);
> -	char *full_name;
> -	int ret;
> -
> -	if (!component->name_prefix) {
> -		ret = pin_func(dapm, pin);
> -		goto end;
> -	}
> -
> -	full_name = kasprintf(GFP_KERNEL, "%s %s", component->name_prefix, pin);
> -	if (!full_name) {
> -		ret = -ENOMEM;
> -		goto end;
> -	}
> -
> -	ret = pin_func(dapm, full_name);
> -	kfree(full_name);
> -end:
> -	return soc_component_ret(component, ret);
> -}
> -
>   int snd_soc_component_enable_pin(struct snd_soc_component *component,
>   				 const char *pin)
>   {
> -	return soc_component_pin(component, pin, snd_soc_dapm_enable_pin);
> +	struct snd_soc_dapm_context *dapm =
> +		snd_soc_component_get_dapm(component);
> +	return snd_soc_dapm_enable_pin(dapm, pin);
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_component_enable_pin);
>   
>   int snd_soc_component_enable_pin_unlocked(struct snd_soc_component *component,
>   					  const char *pin)
>   {
> -	return soc_component_pin(component, pin, snd_soc_dapm_enable_pin_unlocked);
> +	struct snd_soc_dapm_context *dapm =
> +		snd_soc_component_get_dapm(component);
> +	return snd_soc_dapm_enable_pin_unlocked(dapm, pin);
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_component_enable_pin_unlocked);
>   
>   int snd_soc_component_disable_pin(struct snd_soc_component *component,
>   				  const char *pin)
>   {
> -	return soc_component_pin(component, pin, snd_soc_dapm_disable_pin);
> +	struct snd_soc_dapm_context *dapm =
> +		snd_soc_component_get_dapm(component);
> +	return snd_soc_dapm_disable_pin(dapm, pin);
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_component_disable_pin);
>   
>   int snd_soc_component_disable_pin_unlocked(struct snd_soc_component *component,
>   					   const char *pin)
>   {
> -	return soc_component_pin(component, pin, snd_soc_dapm_disable_pin_unlocked);
> +	struct snd_soc_dapm_context *dapm =
> +		snd_soc_component_get_dapm(component);
> +	return snd_soc_dapm_disable_pin_unlocked(dapm, pin);
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_component_disable_pin_unlocked);
>   
>   int snd_soc_component_nc_pin(struct snd_soc_component *component,
>   			     const char *pin)
>   {
> -	return soc_component_pin(component, pin, snd_soc_dapm_nc_pin);
> +	struct snd_soc_dapm_context *dapm =
> +		snd_soc_component_get_dapm(component);
> +	return snd_soc_dapm_nc_pin(dapm, pin);
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_component_nc_pin);
>   
>   int snd_soc_component_nc_pin_unlocked(struct snd_soc_component *component,
>   				      const char *pin)
>   {
> -	return soc_component_pin(component, pin, snd_soc_dapm_nc_pin_unlocked);
> +	struct snd_soc_dapm_context *dapm =
> +		snd_soc_component_get_dapm(component);
> +	return snd_soc_dapm_nc_pin_unlocked(dapm, pin);
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_component_nc_pin_unlocked);
>   
>   int snd_soc_component_get_pin_status(struct snd_soc_component *component,
>   				     const char *pin)
>   {
> -	return soc_component_pin(component, pin, snd_soc_dapm_get_pin_status);
> +	struct snd_soc_dapm_context *dapm =
> +		snd_soc_component_get_dapm(component);
> +	return snd_soc_dapm_get_pin_status(dapm, pin);
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_component_get_pin_status);
>   
>   int snd_soc_component_force_enable_pin(struct snd_soc_component *component,
>   				       const char *pin)
>   {
> -	return soc_component_pin(component, pin, snd_soc_dapm_force_enable_pin);
> +	struct snd_soc_dapm_context *dapm =
> +		snd_soc_component_get_dapm(component);
> +	return snd_soc_dapm_force_enable_pin(dapm, pin);
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_component_force_enable_pin);
>   
> @@ -235,7 +224,9 @@ int snd_soc_component_force_enable_pin_unlocked(
>   	struct snd_soc_component *component,
>   	const char *pin)
>   {
> -	return soc_component_pin(component, pin, snd_soc_dapm_force_enable_pin_unlocked);
> +	struct snd_soc_dapm_context *dapm =
> +		snd_soc_component_get_dapm(component);
> +	return snd_soc_dapm_force_enable_pin_unlocked(dapm, pin);
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_component_force_enable_pin_unlocked);
>   
> 
Tested-by: Lucas Tanure <tanureal@opensource.cirrus.com>
