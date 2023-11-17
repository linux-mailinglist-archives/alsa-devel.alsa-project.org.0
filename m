Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C167EF09E
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 11:35:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7977AA4A;
	Fri, 17 Nov 2023 11:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7977AA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700217312;
	bh=YwmxsuemiunoPvodGlowGg9rVKe7oncRfoDdH88wc/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BOjJVf7w0IiVLpquXxeOg66fPz86VkM6cIy6oc8CL8PjByE2NlzNY6+m26KUAEjss
	 dhZxpJ4Rmt9MnedwC3J4fzeXmnpO1aCEc2Rwg9xZ8plNMePvU0kSgcR+JsNSbmB63b
	 F1fkzU4EPDNFl8Nxj9n8GSwhLwtrxC+0Jm/0DxU8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A341BF8022B; Fri, 17 Nov 2023 11:33:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DEF52F80093;
	Fri, 17 Nov 2023 11:33:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9F6AF801D5; Fri, 17 Nov 2023 11:31:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05456F80093
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 11:31:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05456F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AN9ERDyE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700217101; x=1731753101;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YwmxsuemiunoPvodGlowGg9rVKe7oncRfoDdH88wc/c=;
  b=AN9ERDyE/aq41xmSPQ6SHgga7N4Bdnr7Aj1FgV8K+6ayyXFsJYE/fp+K
   aOQKoMXvs4fR4p/NmlpSHVsW5bHJHj0s/1Hx8hUOzOmLSjVWWhqvH8Z3p
   uhKw2/BqRM0vDiWp8K4ua9K3m/88SbzmENtJlqMsVEeGqeAjy/9Y65gn4
   mRhYNS0tOx8Y+3cf+ez5DREyYgIMgy8+dbnt4KnXiB8oD8e7PPKuYB5IF
   QQp7etzgIslZJdzhK6Oc9pQgXknWj/GgFt2tuRq1KyGotDx7iSs9E0H0C
   BicjfN/hVveWXTgfKUNEP2863MBrTB5AA764nQf1hghoCwsCzZxSJwUI+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="422371490"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="422371490"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 02:31:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="1097062556"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="1097062556"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 02:31:36 -0800
Message-ID: <398a66f5-444a-4865-9ba6-68b85fd74058@linux.intel.com>
Date: Fri, 17 Nov 2023 11:31:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: Skylake: mem leak in skl register function
Content-Language: en-US
To: Kamil Duljas <kamil.duljas@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Cezary Rojewski <cezary.rojewski@intel.com>
References: <20231116224112.2209-2-kamil.duljas@gmail.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20231116224112.2209-2-kamil.duljas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XBQWNIIGOTIZZQAK3OV5F6AMWG6PZDFJ
X-Message-ID-Hash: XBQWNIIGOTIZZQAK3OV5F6AMWG6PZDFJ
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XBQWNIIGOTIZZQAK3OV5F6AMWG6PZDFJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/16/2023 11:41 PM, Kamil Duljas wrote:
> skl_platform_register() uses krealloc. When krealloc is fail,
> then previous memory is not freed. The leak is also when soc
> component registration failed.
> 
> Signed-off-by: Kamil Duljas <kamil.duljas@gmail.com>
> ---
>   sound/soc/intel/skylake/skl-pcm.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
> index d0c02e8a6785..e2578ee001ff 100644
> --- a/sound/soc/intel/skylake/skl-pcm.c
> +++ b/sound/soc/intel/skylake/skl-pcm.c
> @@ -1462,6 +1462,7 @@ int skl_platform_register(struct device *dev)
>   		dais = krealloc(skl->dais, sizeof(skl_fe_dai) +
>   				sizeof(skl_platform_dai), GFP_KERNEL);
>   		if (!dais) {
> +			kfree(skl->dais);
>   			ret = -ENOMEM;
>   			goto err;
>   		}
> @@ -1474,8 +1475,10 @@ int skl_platform_register(struct device *dev)
>   
>   	ret = devm_snd_soc_register_component(dev, &skl_component,
>   					 skl->dais, num_dais);
> -	if (ret)
> +	if (ret) {
> +		kfree(skl->dais);
>   		dev_err(dev, "soc component registration failed %d\n", ret);
> +	}
>   err:
>   	return ret;
>   }

Seems ok,
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
