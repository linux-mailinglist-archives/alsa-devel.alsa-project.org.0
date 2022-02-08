Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E36554ADDEE
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 17:05:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6423F174B;
	Tue,  8 Feb 2022 17:04:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6423F174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644336333;
	bh=eQpfYx3yw36mfWu3KmodnIsOfnRr+BPHhjc0zLAve7M=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=obsRj5puTPHm8opoe6VXHB8l03NoNnxMgSt4dwBwrFChQleLsG9Y7pZTHJDuv5zrF
	 5MeOAJr2TkyHwy72Icowkp8ENyaHc7rqr5Dyj5C4POZ1hC7FtNIbBcapCMfvXLYkkA
	 McFbYwO54URQWiGFqpRDAnrGxyfRApkrL1B5pm8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C722AF80154;
	Tue,  8 Feb 2022 17:04:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55012F8013C; Tue,  8 Feb 2022 17:04:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 990B2F800EB
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 17:04:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 990B2F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PqeTX0ts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644336263; x=1675872263;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=eQpfYx3yw36mfWu3KmodnIsOfnRr+BPHhjc0zLAve7M=;
 b=PqeTX0tsQvgDShID/nWubVumwU0JNlxpvnIutXEGkiGkZG8lAWuSNhDv
 v33I8I5U8IqGWHzpk+S1gSl7QZmak8KHG1eTABksThyLZA2cu8BZ+O0Nm
 zLhes+HL3+ZQkv78UweB6VU/C4GzaZmUWJzp6zdCWLqrhCJqNjV66paBJ
 jg5VCW5QPX9xFp0MGlt8AfFrtWGPCjquKnLCChrlj3XbjXL0yOzWC3bs4
 jwwrk5YvNs1O+zGzQe7gWxeSs/gJlO+JBxMln//B9ctsDFQEcZPeA+T6j
 GcPMPu9ruRNMAYiscV4/aiCgTeGPmCmlP4XlZn+M8LNiUXq9Iab+CZRTO w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="312271884"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="312271884"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 08:02:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="540656524"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 08:02:47 -0800
Date: Tue, 8 Feb 2022 17:54:05 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 3/4] ALSA: hda: Update and expose codec register procedures
In-Reply-To: <20220207114906.3759800-4-cezary.rojewski@intel.com>
Message-ID: <alpine.DEB.2.22.394.2202081753430.3088432@eliteleevi.tm.intel.com>
References: <20220207114906.3759800-1-cezary.rojewski@intel.com>
 <20220207114906.3759800-4-cezary.rojewski@intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 rad@semihalf.com, pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
 hdegoede@redhat.com, broonie@kernel.org, cujomalainey@chromium.org,
 lma@semihalf.com
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

Hi,

On Mon, 7 Feb 2022, Cezary Rojewski wrote:

> With few changes, snd_hda_codec_register() and its
> unregister-counterpart can be re-used by ASoC drivers. While at it,
> provide kernel doc for the exposed functions.

thanks, there is no doubt room to improve the HDA<->asoc interaction 
still and increase reuse. Some questions:

> Due to ALSA-device vs ASoC-component organization differences, new
> 'snddev_managed' argument is specified allowing for better control over
> codec registration process.

Can you maybe clarify this? The existing code to handle the different 
paths is already quite hairy (e.g. code in 
hda_codec.c:snd_hda_codec_dev_free() that does different actions 
depending on whether "codec->core.type == HDA_DEV_LEGACY) is true or 
false), so we'd need to have very clear semantics for the 
"snddev_managed". 

> @@ -940,12 +953,13 @@ int snd_hda_codec_new(struct hda_bus *bus, struct snd_card *card,
>  		return PTR_ERR(codec);
>  	*codecp = codec;
>  
> -	return snd_hda_codec_device_new(bus, card, codec_addr, *codecp);
> +	return snd_hda_codec_device_new(bus, card, codec_addr, *codecp, false);

So this sets snddev_managed to "false" for snd-hda-intel? How is this 
expected to work?

>  int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
> -			unsigned int codec_addr, struct hda_codec *codec)
> +			unsigned int codec_addr, struct hda_codec *codec,
> +			bool snddev_managed)
>  {
>  	char component[31];
>  	hda_nid_t fg;
> @@ -1020,9 +1034,12 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
>  		codec->core.subsystem_id, codec->core.revision_id);
>  	snd_component_add(card, component);
[...]  
> -	err = snd_device_new(card, SNDRV_DEV_CODEC, codec, &dev_ops);
> -	if (err < 0)
> -		goto error;
> +	if (snddev_managed) {
> +		/* ASoC features component management instead */
> +		err = snd_device_new(card, SNDRV_DEV_CODEC, codec, &dev_ops);
> +		if (err < 0)
> +			goto error;
> +	}

I might misunderstand semantics of snddev_managed here, but given 
in case of non-ASoC use, snddev_managed is false, this would 
mean we don't call snd_device_new() at all...? I don't see where this is 
added elsewhere in the series, so this would seem to break the flow for
non-ASoC case.

Br, Kai
