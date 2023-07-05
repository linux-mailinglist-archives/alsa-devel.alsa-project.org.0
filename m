Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FBC748593
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 15:58:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 763963E8;
	Wed,  5 Jul 2023 15:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 763963E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688565536;
	bh=PdRHsWcUvKlFxrNHtPGxrZat7W9p+9tZkkMZRNnSzjQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dLRUIeiP6WwBwuCJs+te+DeVk4WNVCeqZvvViDW5V4zZUxchdtAdemAnD429140B7
	 egSMXGLyl6aSkcpcTn2GpOBjIuCEBovcU5OIiRlwmKKNbu29HxqM5ezZ79DqJ8q7ct
	 rkBaduM0N29KPuPawcCfxjKKWrCzEuhy1mLQV/D4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA6DFF80535; Wed,  5 Jul 2023 15:58:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 499EAF80124;
	Wed,  5 Jul 2023 15:58:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD39FF80125; Wed,  5 Jul 2023 15:58:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1776AF80100
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 15:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1776AF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ex282C1m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688565477; x=1720101477;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PdRHsWcUvKlFxrNHtPGxrZat7W9p+9tZkkMZRNnSzjQ=;
  b=ex282C1mJ1Tf1X24rO8W7GinM+rY2Ne6iNMcIZ7MHpvJ6Jd5CrRpMvmM
   i7g6/ZNdnLAOyU5CtHu0gvL3VUMbNKOEBAqQ5rZBC1et3kY9ZGPrhrmx2
   bJblPOks/v/bco8U2MADSdgXKzwHc95RleV9/Rkk94S7C63tdRzgQEhm6
   7u19C0GITU5kUw1xyj2rqxW8FErb/gWEeSglXIQo3PTvaF+KZb1FTtWr0
   KrJeDAvyI+ONUkycQWO2f9uR2nOlwHRoOsKxanilBWi9xRBXpE6WOuCp+
   dKpRdnl+BG0SBeO/XU2cgykHEtWVD/SAeD363LdYJ+8/Ui54+uUiQ2nNH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="342934606"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200";
   d="scan'208";a="342934606"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 06:57:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="965835533"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200";
   d="scan'208";a="965835533"
Received: from meggieha-mobl.ger.corp.intel.com (HELO [10.252.48.235])
 ([10.252.48.235])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 06:57:49 -0700
Message-ID: <907ad7a3-3384-c0c4-90a9-5beab4cc45e0@linux.intel.com>
Date: Wed, 5 Jul 2023 14:53:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 1/8] soundwire: fix enumeration completion
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Rander Wang <rander.wang@linux.intel.com>
References: <20230705123018.30903-1-johan+linaro@kernel.org>
 <20230705123018.30903-2-johan+linaro@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230705123018.30903-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DYU4DX6HZ4U7RV4LO6GACLFUFBNH3WCQ
X-Message-ID-Hash: DYU4DX6HZ4U7RV4LO6GACLFUFBNH3WCQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DYU4DX6HZ4U7RV4LO6GACLFUFBNH3WCQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/5/23 14:30, Johan Hovold wrote:
> The soundwire subsystem uses two completion structures that allow
> drivers to wait for soundwire device to become enumerated on the bus and
> initialised by their drivers, respectively.
> 
> The code implementing the signalling is currently broken as it does not
> signal all current and future waiters and also uses the wrong
> reinitialisation function, which can potentially lead to memory
> corruption if there are still waiters on the queue.

That change sounds good, but I am not following the two paragraphs below.

> Not signalling future waiters specifically breaks sound card probe
> deferrals as codec drivers can not tell that the soundwire device is
> already attached when being reprobed. 

What makes you say that? There is a test in the probe and the codec
driver will absolutely be notified, see bus_type.c

	if (drv->ops && drv->ops->update_status) {
		ret = drv->ops->update_status(slave, slave->status);
		if (ret < 0)
			dev_warn(dev, "%s: update_status failed with status %d\n", __func__,
ret);
	}

> Some codec runtime PM
> implementations suffer from similar problems as waiting for enumeration
> during resume can also timeout despite the device already having been
> enumerated.

I am not following this either. Are you saying the wait_for_completion()
times out because of the init_completion/reinit_completion confusion, or
something else.

> Fixes: fb9469e54fa7 ("soundwire: bus: fix race condition with enumeration_complete signaling")
> Fixes: a90def068127 ("soundwire: bus: fix race condition with initialization_complete signaling")
> Cc: stable@vger.kernel.org      # 5.7
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Rander Wang <rander.wang@linux.intel.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/soundwire/bus.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 1ea6a64f8c4a..66e5dba919fa 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -908,8 +908,8 @@ static void sdw_modify_slave_status(struct sdw_slave *slave,
>  			"initializing enumeration and init completion for Slave %d\n",
>  			slave->dev_num);
>  
> -		init_completion(&slave->enumeration_complete);
> -		init_completion(&slave->initialization_complete);
> +		reinit_completion(&slave->enumeration_complete);
> +		reinit_completion(&slave->initialization_complete);
>  
>  	} else if ((status == SDW_SLAVE_ATTACHED) &&
>  		   (slave->status == SDW_SLAVE_UNATTACHED)) {
> @@ -917,7 +917,7 @@ static void sdw_modify_slave_status(struct sdw_slave *slave,
>  			"signaling enumeration completion for Slave %d\n",
>  			slave->dev_num);
>  
> -		complete(&slave->enumeration_complete);
> +		complete_all(&slave->enumeration_complete);
>  	}
>  	slave->status = status;
>  	mutex_unlock(&bus->bus_lock);
> @@ -1941,7 +1941,7 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
>  				"signaling initialization completion for Slave %d\n",
>  				slave->dev_num);
>  
> -			complete(&slave->initialization_complete);
> +			complete_all(&slave->initialization_complete);
>  
>  			/*
>  			 * If the manager became pm_runtime active, the peripherals will be
