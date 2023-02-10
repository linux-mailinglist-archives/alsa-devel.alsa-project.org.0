Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 732A7691F9A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 14:12:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BDF182E;
	Fri, 10 Feb 2023 14:12:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BDF182E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676034770;
	bh=Ors6grSxgwuBhPM/3ThJCElFazXKgPN4WnWqYGXUpkI=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=reJltrNmpq7bw7+9syJmWeForNLUQuzvwJlEwv95xhY0QO+5YYuSJfwRzhzDFUm4u
	 UhwR0Xtl8HY5031i9qhkJAxM/oVTN2xRVoxvuMzp/w8L6tddkuOSCzGjj7ywD07MhH
	 8LynmzCQhWgi0c2XTZbb52TggH4SZk0mJSbEv+Bc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9141AF800B8;
	Fri, 10 Feb 2023 14:11:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1196EF800E4; Fri, 10 Feb 2023 14:11:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DF45F80086
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 14:11:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DF45F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=johptTHv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676034695; x=1707570695;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ors6grSxgwuBhPM/3ThJCElFazXKgPN4WnWqYGXUpkI=;
  b=johptTHviT1FswsZ+qPWgf8etkj/9ea+z8huCDzLuvZsodvkqLq2lVZ9
   Td9gQ352yB8Kmudq5fXq1Mazu5D4L7pLG+sFqBoeVjVI1/uncoKwYgQOA
   vtvsF+GOR3PFCPvxclNygHnuk0zw7P4kfc5iCsay3urCfzomGA4+utcb8
   NrckAH5CPAE6sqJXxGGwygaJoaZJ2sUxFCuZdQFuYajKZZgD0XNrM744r
   L7qWTdMsXENX5DqRlnQBolJRQA//cxBsRVxPaywZZU0M/NkVKU0n8pjeI
   iN31QsntCPhNb3JjqIshillOXE8/oxvUsb7pipAqotrX+a2ZPpaQspCA6
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="329047476"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000";
   d="scan'208";a="329047476"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2023 05:11:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="661409495"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000";
   d="scan'208";a="661409495"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2023 05:10:59 -0800
Message-ID: <54d4ffb1-1488-1a4f-58b2-8b3471389729@linux.intel.com>
Date: Fri, 10 Feb 2023 14:10:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] ASoC: Intel: Skylake: Replace 1-element array with
 flex-array
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <20230210051447.never.204-kees@kernel.org>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230210051447.never.204-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: S2IJGXISWI4INHRAFBWW2NC2VZYOPF4M
X-Message-ID-Hash: S2IJGXISWI4INHRAFBWW2NC2VZYOPF4M
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Sasa Ostrouska <casaxa@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S2IJGXISWI4INHRAFBWW2NC2VZYOPF4M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2/10/2023 6:14 AM, Kees Cook wrote:
> The kernel is globally removing the ambiguous 0-length and 1-element
> arrays in favor of flexible arrays, so that we can gain both compile-time
> and run-time array bounds checking[1]. In this instance, struct
> skl_cpr_cfg contains struct skl_cpr_gtw_cfg, which defined "config_data"
> as a 1-element array.
> 
> Normally when switching from a 1-element array to a flex-array, any
> related size calculations must be adjusted too. However, it seems the
> original code was over-allocating space, since 1 extra u32 would be
> included by the sizeof():
> 
>                  param_size = sizeof(struct skl_cpr_cfg);
>                  param_size += mconfig->formats_config[SKL_PARAM_INIT].caps_size;
> 
> But the copy uses caps_size bytes, and cap_size / 4 (i.e. sizeof(u32))
> for the length tracking:
> 
>          memcpy(cpr_mconfig->gtw_cfg.config_data,
>                          mconfig->formats_config[SKL_PARAM_INIT].caps,
>                          mconfig->formats_config[SKL_PARAM_INIT].caps_size);
> 
>          cpr_mconfig->gtw_cfg.config_length =
>                          (mconfig->formats_config[SKL_PARAM_INIT].caps_size) / 4;
> 
> Therefore, no size calculations need adjusting. Change the struct
> skl_cpr_gtw_cfg config_data member to be a true flexible array, which
> also fixes the over-allocation, and silences this memcpy run-time false
> positive:
> 
>    memcpy: detected field-spanning write (size 100) of single field "cpr_mconfig->gtw_cfg.config_data" at sound/soc/intel/skylake/skl-messages.c:554 (size 4)
> 
> [1] For lots of details, see both:
>      https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
>      https://people.kernel.org/kees/bounded-flexible-arrays-in-c
> 
> Reported-by: Sasa Ostrouska <casaxa@gmail.com>
> Link: https://lore.kernel.org/all/CALFERdwvq5day_sbDfiUsMSZCQu9HG8-SBpOZDNPeMdZGog6XA@mail.gmail.com/
> Cc: Cezary Rojewski <cezary.rojewski@intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: "Amadeusz Sławiński" <amadeuszx.slawinski@linux.intel.com>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>   sound/soc/intel/skylake/skl-topology.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/skylake/skl-topology.h b/sound/soc/intel/skylake/skl-topology.h
> index 6db0fd7bad49..ad94f8020c27 100644
> --- a/sound/soc/intel/skylake/skl-topology.h
> +++ b/sound/soc/intel/skylake/skl-topology.h
> @@ -115,7 +115,7 @@ struct skl_cpr_gtw_cfg {
>   	u32 dma_buffer_size;
>   	u32 config_length;
>   	/* not mandatory; required only for DMIC/I2S */
> -	u32 config_data[1];
> +	u32 config_data[];
>   } __packed;
>   
>   struct skl_dma_control {

This fails in our validation. Maybe we can use the union workaround, to 
leave the size as is?

Following seems to work in manual test:
diff --git a/sound/soc/intel/skylake/skl-topology.h 
b/sound/soc/intel/skylake/skl-topology.h
index 6db0fd7bad49..ffbd2e60fede 100644
--- a/sound/soc/intel/skylake/skl-topology.h
+++ b/sound/soc/intel/skylake/skl-topology.h
@@ -115,7 +115,10 @@ struct skl_cpr_gtw_cfg {
         u32 dma_buffer_size;
         u32 config_length;
         /* not mandatory; required only for DMIC/I2S */
-       u32 config_data[1];
+       union {
+               u32 x;
+               u32 config_data[0];
+       };
  } __packed;

  struct skl_dma_control {

I can also run it through validation to make sure if it is acceptable.

