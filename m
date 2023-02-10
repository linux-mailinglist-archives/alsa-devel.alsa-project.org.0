Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1C169189A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 07:41:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3987D846;
	Fri, 10 Feb 2023 07:40:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3987D846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676011268;
	bh=f8NY30SLdOWSeuMhKdkZO9eeCY5Ro0zlVLk5yejXmXk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=hPV52+StwNVxvyXLU+Es6iquYbfYZrstwqMcZL4FLbm0iDBzPbjicFstB+5T5tzjm
	 Q42uzp1g1aR6bnpuictogLcrOse9IsojLGvhieCAWTvbGQd3rlDxMOg8ai7dJanFEH
	 oQWj0Qgmhvm6DC75cThutTbd+j1zy96qB+WZygKc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90750F800B8;
	Fri, 10 Feb 2023 07:40:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB8F1F800E4; Fri, 10 Feb 2023 07:39:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2BA3EF80094
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 07:39:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BA3EF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=L4At2EQw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676011187; x=1707547187;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=f8NY30SLdOWSeuMhKdkZO9eeCY5Ro0zlVLk5yejXmXk=;
  b=L4At2EQwS6skWF6SYdYw+0Cu3kgKKNy//Ndy+y6oIOef05ZxjT9FAGvG
   b7iq5OG8Viwlj6MWx6Wc9GT/2kw4giaRmzCVHlqgS9DXWOR6QXxmlIH3i
   77oZyYpXsHfiOg9oBYvNMTZ2LvEBWQ/vz79GYKygrBVNs+qSR026UQpuB
   MC48RrTaKWi2/mj6KWqEuf1jbKxDoAWgod0GMWnnxjAkxrnwNq9aE76VR
   9KCgAqeoTNK/TUNEEhrnl4nUy2opTQSPshEfn9cH6lAxzvKNXC09YU4pf
   CVgOzIIU661R5bVdJ4r5Lchl91H7jtS0aCFd1HnjE5HpLf5l20qwnKLc2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="328980181"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000";
   d="scan'208";a="328980181"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 22:39:41 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="667947239"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000";
   d="scan'208";a="667947239"
Received: from pmannion-mobl1.ger.corp.intel.com (HELO [10.252.3.248])
 ([10.252.3.248])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 22:39:40 -0800
Message-ID: <df5a62fc-0754-2a55-58da-6215bc7f5914@linux.intel.com>
Date: Fri, 10 Feb 2023 08:39:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH] ASoC: Intel: Skylake: Replace 1-element array with
 flex-array
To: alsa-devel@alsa-project.org
References: <20230210051447.never.204-kees@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230210051447.never.204-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I5E2AKJLB46UTY6PUJCAB6G4QOTIX6IJ
X-Message-ID-Hash: I5E2AKJLB46UTY6PUJCAB6G4QOTIX6IJ
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I5E2AKJLB46UTY6PUJCAB6G4QOTIX6IJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/02/2023 07:14, Kees Cook wrote:
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
>                 param_size = sizeof(struct skl_cpr_cfg);
>                 param_size += mconfig->formats_config[SKL_PARAM_INIT].caps_size;
> 
> But the copy uses caps_size bytes, and cap_size / 4 (i.e. sizeof(u32))
> for the length tracking:
> 
>         memcpy(cpr_mconfig->gtw_cfg.config_data,
>                         mconfig->formats_config[SKL_PARAM_INIT].caps,
>                         mconfig->formats_config[SKL_PARAM_INIT].caps_size);
> 
>         cpr_mconfig->gtw_cfg.config_length =
>                         (mconfig->formats_config[SKL_PARAM_INIT].caps_size) / 4;
> 
> Therefore, no size calculations need adjusting. Change the struct
> skl_cpr_gtw_cfg config_data member to be a true flexible array, which
> also fixes the over-allocation, and silences this memcpy run-time false
> positive:
> 
>   memcpy: detected field-spanning write (size 100) of single field "cpr_mconfig->gtw_cfg.config_data" at sound/soc/intel/skylake/skl-messages.c:554 (size 4)
> 
> [1] For lots of details, see both:
>     https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
>     https://people.kernel.org/kees/bounded-flexible-arrays-in-c

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

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
>  sound/soc/intel/skylake/skl-topology.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/skylake/skl-topology.h b/sound/soc/intel/skylake/skl-topology.h
> index 6db0fd7bad49..ad94f8020c27 100644
> --- a/sound/soc/intel/skylake/skl-topology.h
> +++ b/sound/soc/intel/skylake/skl-topology.h
> @@ -115,7 +115,7 @@ struct skl_cpr_gtw_cfg {
>  	u32 dma_buffer_size;
>  	u32 config_length;
>  	/* not mandatory; required only for DMIC/I2S */
> -	u32 config_data[1];
> +	u32 config_data[];
>  } __packed;
>  
>  struct skl_dma_control {

-- 
Péter
