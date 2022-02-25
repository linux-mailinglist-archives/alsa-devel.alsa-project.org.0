Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F654C5026
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 21:54:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9A6A1F37;
	Fri, 25 Feb 2022 21:53:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9A6A1F37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645822455;
	bh=BziXm4rG5o8ule2VC+9eGMOUEp2AQwa5pJwMHslO3vU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZXLQi7C3rtVbIJZ+8j6QclogF+sXp3FLX9ftCEq3IECpoQRtSEXROFFnyG9I8SFdG
	 NdN5PrXPMVSOxTHfq6WfZwTEWxPYaLerzHV8XK5SkWqeKXlrzKVoUv/2UQUkP0rWMb
	 keP9sQOlPnwULn20vDOvJQUb1kEDPqwd02fgwB5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B26C7F8012F;
	Fri, 25 Feb 2022 21:52:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A965F8020D; Fri, 25 Feb 2022 21:52:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5485DF80132
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 21:52:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5485DF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MWDpOnQb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645822353; x=1677358353;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BziXm4rG5o8ule2VC+9eGMOUEp2AQwa5pJwMHslO3vU=;
 b=MWDpOnQbSvDbTlEtWLdqLSDf7d1Iehhw7JNApsHEKmL/TLaIbekB50hs
 Kcpc6l/Pe8L+TfiOtaq6DFckCt2+d2oj46cxHex7SOK4FNgnbyqpbehOo
 2i8E2d89dY+9Rtr0NZPHEwZbfgdkrHD1zN056Hx/muojs3kD1d27pakui
 5inliSNW5EWDM0F8FehAgSJ1EhaQ5zeAmqpB+LHU9q5D5bZ6nhsz5Jsnb
 QT/yRqP3u3UB2bhWESDQb05iCXXrsYNqPjhY631EBz4kMq6Pz3lFHOpjw
 tWHW5aNb5piSAoeGBhkDbSClUXqUVy4bT6ADHEuvqQYn7qelz1B2Nb1jT g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="313296121"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="313296121"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:28 -0800
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="777520530"
Received: from nnwogbe-mobl1.amr.corp.intel.com (HELO [10.212.101.231])
 ([10.212.101.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:27 -0800
Message-ID: <77ce39c4-b41d-88a9-b83e-e1ff3dc23584@linux.intel.com>
Date: Fri, 25 Feb 2022 11:24:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [RFC 03/13] ASoC: Intel: avs: Parse module-extension tuples
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
 <20220207132532.3782412-4-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220207132532.3782412-4-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
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


> +struct avs_tplg_modcfg_ext {
> +	guid_t type;
> +
> +	union {
> +		struct {
> +			u16 num_input_pins;
> +			u16 num_output_pins;
> +			struct avs_tplg_pin_format *pin_fmts;
> +		} generic;
> +		struct {
> +			struct avs_audio_format *out_fmt;
> +			struct avs_audio_format *blob_fmt; /* optional override */
> +			u32 feature_mask;
> +			union avs_virtual_index vindex;
> +			u32 dma_type;
> +			u32 dma_buffer_size;
> +			u32 config_length;
> +			/* config_data part of priv data */
> +		} copier;
> +		struct {
> +			u32 out_channel_config;
> +			u32 coefficients_select;
> +			s32 coefficients[AVS_CHANNELS_MAX];
> +			u32 channel_map;
> +		} updown_mix;
> +		struct {
> +			u32 out_freq;
> +		} src;
> +		struct {
> +			u32 out_freq;
> +			u8 mode;
> +			u8 disable_jitter_buffer;
> +		} asrc;
> +		struct {
> +			u32 cpc_lp_mode;
> +		} wov;
> +		struct {
> +			struct avs_audio_format *ref_fmt;
> +			struct avs_audio_format *out_fmt;
> +			u32 cpc_lp_mode;
> +		} aec;
> +		struct {
> +			struct avs_audio_format *ref_fmt;
> +			struct avs_audio_format *out_fmt;
> +		} mux;
> +		struct {
> +			struct avs_audio_format *out_fmt;
> +		} micsel;
> +	};
> +};

I am struggling to reconcile the notion of 'extension' with a fixed
structure that deals with Intel-specific modules.

How would a 3rd party add their own modules and expose parameters/tokens
through the topology?
