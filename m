Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C521D15BAE1
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 09:39:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37F831673;
	Thu, 13 Feb 2020 09:38:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37F831673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581583149;
	bh=R/I0seV/RhMJZgfT6421TdX6ajoMptoADgX3faigJMc=;
	h=References:From:To:In-reply-to:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QJ6wH8l0MYFb4V+oV214pVCSlmMS1RHfQf2S05b0BR8ebODpCnmqU0h9nzq1epSRs
	 tZkRRV4OJ8zRiI0GFIP96lI03Hvc7i7ytoWc0spgAZ33UCoDxZIIY5y12uzduF3o+9
	 0JthClRgxz2CVUqETPCpi41aYq63O59fITHexK0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BDDEF80146;
	Thu, 13 Feb 2020 09:37:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 255C8F80145; Thu, 13 Feb 2020 09:37:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B37CBF80138
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 09:37:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B37CBF80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="QqLT0mWV"
Received: by mail-wm1-x343.google.com with SMTP id a5so5200489wmb.0
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 00:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=SpOSiHd+ceklnjc83gflDmwLy0jKlR+qhKztdISCJPg=;
 b=QqLT0mWVbsMw+N9f4Im+jQL5BOZo+5jZXDOTzVWBKwPthjs9CXFw5kX2TVdcK/JYQS
 SgPW18YO1LCHbpThp+P6ZRoeZtLq69sCJ21cpm867TRwd/S54iTZrTK0XS7g3KDuffEC
 LzdwixSMCUskX2SPWImajF+SsDK+hX6EsXF5IIOUcxqE53Rf5pa1lImq3xbL90KcAEDN
 0gn2FqERO9F2jtW/KbFh/C07s4I+p1oJPmqz1Abj+EMbv/F3wF29lguemS0h4t2O6rrE
 jgHVzKVE4uD/30BlXw+InYiUcUz+GWXFTDCh81VHWnGbSUV8Yv1lyu7SoskuvZ3jakRD
 oijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=SpOSiHd+ceklnjc83gflDmwLy0jKlR+qhKztdISCJPg=;
 b=BwQ7nuAZhxE1GPL8yGzYyInK6oxhxVHsew5g7t3PBlSaJlgwpmPfCO0mJyidoV2y5V
 nW6zyPjLy23r3loVs7bKCoCK9jBSFq3jibP7VNcL/ofTnM4UTPqs1VMhFS+35JGQQ3k7
 tyU1mdHCDHFpDL8T25G6vHQZA2m+iUex0aL7yHIzzyekP2GTd8FiUUtO9+yk0+8xTkG0
 sf54Y+QUhXgHUsu/VWoJ4CeaHPO5jV3sUn6lwYmRQjDJ2RIdq5eGuM2jPM/pq4VoBRSo
 fsbwq3bZSGXEwMMHQBwHJIVhFZKaRw0tIQv+e+ggQX+3RBvP5wLdmdnCiRg3LXpaSmlF
 0tUw==
X-Gm-Message-State: APjAAAUlwvYUY+GjbycHsV0rcuS/PO92bltDMusv0ee9Pggzw8sC2i3b
 5v3EaayKp5LOZpDaMv+lzkn3AQ==
X-Google-Smtp-Source: APXvYqzCff8WTsFShTc3iju7U1CZeupb+EhRjNpiAZFEfcxo2uvaUfoSzx1vdoEkL6bd57iktFA6Nw==
X-Received: by 2002:a1c:4e01:: with SMTP id g1mr4269368wmh.12.1581583039666;
 Thu, 13 Feb 2020 00:37:19 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o77sm2154746wme.34.2020.02.13.00.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 00:37:19 -0800 (PST)
References: <20200213061147.29386-1-samuel@sholland.org>
 <20200213061147.29386-2-samuel@sholland.org>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Jonathan Corbet <corbet@lwn.net>
In-reply-to: <20200213061147.29386-2-samuel@sholland.org>
Date: Thu, 13 Feb 2020 09:37:18 +0100
Message-ID: <1jr1yyannl.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 1/4] ASoC: codec2codec: avoid
	invalid/double-free of pcm runtime
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


On Thu 13 Feb 2020 at 07:11, Samuel Holland <samuel@sholland.org> wrote:

> The PCM runtime was freed during PMU in the case that the event hook
> encountered an error. However, it is also unconditionally freed during
> PMD. Avoid a double-free by dropping the call to kfree in the PMU
> hook.

Oh ... Thanks for finding this.

I thought that a widget which has failed PMU would not go through PMD,
but It seems the return value dapm_seq_check_event is not checked.

This brings another question/problem:
A link which has failed in PMU, could try in PMD to hw_free/shutdown a
dai which has not gone through startup/hw_params, right ?

>
> Fixes: a72706ed8208 ("ASoC: codec2codec: remove ephemeral variables")
> Cc: stable@vger.kernel.org
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  sound/soc/soc-dapm.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> index b6378f025836..935b5375ecc5 100644
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -3888,9 +3888,6 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
>  	runtime->rate = params_rate(params);
>  
>  out:
> -	if (ret < 0)
> -		kfree(runtime);
> -
>  	kfree(params);
>  	return ret;
>  }

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
