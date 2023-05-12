Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0139700ACE
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 16:56:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C0DE209;
	Fri, 12 May 2023 16:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C0DE209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683903375;
	bh=uGW19VCfL7GXY1Mq1+j9cRUyiM2wju2JbHUARR1lJbw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DfphMdtFQgQKJdB/SyukpIZpcHFe2OGFSbNNt4nAXabBO7JdF2GJxKQ8ak2NgJ0R9
	 gaZqh8RZjUVvjL/IvxBnuHmq/gdr0zhmcG4qTKqc03C8nNb5ZcQfm8lSb12qSH8YGZ
	 hOJQh65KKW/2JzmRmZC9CmD8PuI0F9TACRh5g8Po=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EE1FF80563; Fri, 12 May 2023 16:54:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28C71F80552;
	Fri, 12 May 2023 16:54:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8462F8052E; Fri, 12 May 2023 16:54:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 58C55F8032D
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 16:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58C55F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nns4EXK5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683903267; x=1715439267;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uGW19VCfL7GXY1Mq1+j9cRUyiM2wju2JbHUARR1lJbw=;
  b=nns4EXK52n942jj5pgasA8G6/XudjTlf9JVVR2RnvdrJ/vMU3q21pCvB
   gz0/fbx3amM2uexKBo5OstyYChRG8ay9d6OE9HoD2oHb4+DjBnCHG2S+p
   gxxrLYDfo92U43Pa2RgYyGalczawR62f60ttsWAgJ95v9rHOocXTbbX4Q
   p1/UlzuEcqN9sbUrAo2FLzVdppzrf6fpXQneqfWxleRmLcCthWj3nXM2z
   wZNio4Tf4QBjMGQTuH46tOtA7rgk+OaQCxmc6CYXkVSErdOd6VfGLfUXR
   420p0L1RaapU8ImxvZSm+lKSDBF0KWW8xSedWnU4dd+NzrH+gLi8annnx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="437140415"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="437140415"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 07:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="844441294"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="844441294"
Received: from winkelru-mobl.amr.corp.intel.com (HELO [10.212.144.249])
 ([10.212.144.249])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 07:54:22 -0700
Message-ID: <138e5c73-c33b-806a-b64e-5c93aaefb140@linux.intel.com>
Date: Fri, 12 May 2023 08:48:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH 03/10] ASoC: ak4118: Update to use new component control
 notify helper
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org,
 lee@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, tglx@linutronix.de, maz@kernel.org,
 linus.walleij@linaro.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-4-ckeepax@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230512122838.243002-4-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MCVNWP4WONZHIDSE4EN74LTO46VP7SO7
X-Message-ID-Hash: MCVNWP4WONZHIDSE4EN74LTO46VP7SO7
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MCVNWP4WONZHIDSE4EN74LTO46VP7SO7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/12/23 07:28, Charles Keepax wrote:
> Update the driver to use the new ASoC core control notify helper.
> This also fixes a bug where the control would not be found if the
> CODEC was given a name prefix.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  sound/soc/codecs/ak4118.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/codecs/ak4118.c b/sound/soc/codecs/ak4118.c

should patches 2, 3, 4 be part of a separate series, they really have
nothing to do with the Cirrus CS32L43?

> index b6d9a10bdccdc..74ccfb0d921d6 100644
> --- a/sound/soc/codecs/ak4118.c
> +++ b/sound/soc/codecs/ak4118.c
> @@ -264,8 +264,6 @@ static irqreturn_t ak4118_irq_handler(int irq, void *data)
>  	struct ak4118_priv *ak4118 = data;
>  	struct snd_soc_component *component = ak4118->component;
>  	struct snd_kcontrol_new *kctl_new;
> -	struct snd_kcontrol *kctl;
> -	struct snd_ctl_elem_id *id;
>  	unsigned int i;
>  
>  	if (!component)
> @@ -273,13 +271,8 @@ static irqreturn_t ak4118_irq_handler(int irq, void *data)
>  
>  	for (i = 0; i < ARRAY_SIZE(ak4118_iec958_controls); i++) {
>  		kctl_new = &ak4118_iec958_controls[i];
> -		kctl = snd_soc_card_get_kcontrol(component->card,
> -						 kctl_new->name);
> -		if (!kctl)
> -			continue;
> -		id = &kctl->id;
> -		snd_ctl_notify(component->card->snd_card,
> -			       SNDRV_CTL_EVENT_MASK_VALUE, id);
> +
> +		snd_soc_component_notify_control(component, kctl_new->name);
>  	}
>  
>  	return IRQ_HANDLED;
