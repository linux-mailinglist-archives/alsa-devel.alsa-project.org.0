Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41679772874
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 16:59:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78472AE8;
	Mon,  7 Aug 2023 16:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78472AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691420396;
	bh=SUHQAeoPZgXBUwMl+B0ovX2ZyA2nHmqJqeRcETZsoR0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CaFcnmqvVrmyezdA8Azin1NXt/YoxyYJkAPjwsvZQZjbNSXct+bxaNCf/KI8FkeXq
	 OIhv8J8fxqAJZtqfg28CzlrIBd+S2Z3jvrPZh+bQa/OOpDrHgeyZNMUrux68cpGRJZ
	 cD6fLzkVQSOJWcGsqdO5l4LNe5jzLWhZdeVp9JSw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 861FBF805D4; Mon,  7 Aug 2023 16:57:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01111F805C4;
	Mon,  7 Aug 2023 16:57:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 036BAF80570; Mon,  7 Aug 2023 16:56:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F04DF80553;
	Mon,  7 Aug 2023 16:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F04DF80553
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aNsBNDWX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691420213; x=1722956213;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SUHQAeoPZgXBUwMl+B0ovX2ZyA2nHmqJqeRcETZsoR0=;
  b=aNsBNDWXcVh3VltuXqx/HwgSUn2Tqcg48DERV4E+S+ipHWqWdBfcHCLt
   BWUH8yu5BP08OrtTmsFqCvldH4Jr430VUf5zpMsY2ugVrPiV+nR948xAF
   eAS+sSALv9vwg+L2YADwW3azKyQdrMP+0mZlLuRn1rgxZV4uDMsh94Fnb
   fMXgF7DWSOwC/2I99TWe8xzkwUr1AuT6c14yQKjeBt5OV93BLKUY2D6ks
   /ibQMHPlH6sSt8DSaKaOvCR/XwKmIS0oklADbIWkngpA/JwdUVI9rl9nB
   fKFLwExNfD00EV1boN6QDV0jy9GmUX+4zegmNZtqbidvwbr7B278iYiKM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="434410645"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200";
   d="scan'208";a="434410645"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 07:56:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1061623896"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200";
   d="scan'208";a="1061623896"
Received: from hweelee-mobl.amr.corp.intel.com (HELO [10.209.181.215])
 ([10.209.181.215])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 07:56:44 -0700
Message-ID: <401de8fb-8d33-d699-ba09-a7b90356d915@linux.intel.com>
Date: Mon, 7 Aug 2023 09:28:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v3 9/9] ALSA: hda/i915: Remove extra argument from
 snd_hdac_i915_init
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: Maarten Lankhorst <dev@lankhorst.se>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
References: <20230807090045.198993-1-maarten.lankhorst@linux.intel.com>
 <20230807090045.198993-10-maarten.lankhorst@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230807090045.198993-10-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: O72CFINSW34Y5BYQBQ3GLOWNHHFE5CFE
X-Message-ID-Hash: O72CFINSW34Y5BYQBQ3GLOWNHHFE5CFE
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




> @@ -172,18 +172,10 @@ int snd_hdac_i915_init(struct hdac_bus *bus, bool allow_modprobe)
>  	acomp = bus->audio_component;
>  	if (!acomp)
>  		return -ENODEV;
> -	if (allow_modprobe && !acomp->ops) {
> -		if (!IS_ENABLED(CONFIG_MODULES) ||
> -		    !request_module("i915")) {
> -			/* 60s timeout */
> -			wait_for_completion_killable_timeout(&acomp->master_bind_complete,
> -							     msecs_to_jiffies(60 * 1000));

heads-up that I have a conflicting patch to make the 60s delay
configurable, see https://github.com/thesofproject/linux/pull/4505

> -		}
> -	}
>  	if (!acomp->ops) {
> -		int err = allow_modprobe ? -ENODEV : -EPROBE_DEFER;
>  		snd_hdac_acomp_exit(bus);
> -		return dev_err_probe(bus->dev, err, "couldn't bind with audio component\n");
> +		return dev_err_probe(bus->dev, -EPROBE_DEFER,
> +				     "couldn't bind with audio component\n");
>  	}
>  	return 0;
>  }
