Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBC74C5027
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 21:54:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D47061F60;
	Fri, 25 Feb 2022 21:53:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D47061F60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645822457;
	bh=3JsOZNwsQvXKciuIUT13i+6CW2pSWhgfil71ZgQO41A=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cl9n2sBRMuwM5zRnAHSrJNrGE3kSFYj4Eza+8oTpAyGHHdesp6ULrDZ+7h6wRnCuw
	 g/16e7l9Ld+RHRi2SANKiovTz6DsEhDHCAkv3nXvVb6D2crf/rZAMjje3gsjbjezgQ
	 8MonHoX7UYpovg57Bx3gDMLUhwJBmfLzpEjParzc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FEDCF80515;
	Fri, 25 Feb 2022 21:52:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F822F80508; Fri, 25 Feb 2022 21:52:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82C33F800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 21:52:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82C33F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lGbNS65C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645822354; x=1677358354;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3JsOZNwsQvXKciuIUT13i+6CW2pSWhgfil71ZgQO41A=;
 b=lGbNS65CjYvTWe21yMeHZRUlaJwW7nf34tsSurnA3z031XNhBPSvZe3E
 zmeBWxS1pE4HlP/p+ZP848byCb0SHpGAyoevYW1WKJ4eCRyXlJo0U0Zi8
 PpLUUhF52PWP4zM8qxwpshTZm21sc5KHbf1F2phyLw0/Hh6H+tsxG42fa
 buXkc3+hCK4/z1Cjy0i5BUHN9E5ov+FmaWvM2DIKVSZw3Sx6mynrfy+Cg
 IYon5wn9zvgNv+whGAe4s4nRsp5JbWU6UVVdKY376H3c+jg9abfdlQqeh
 L0zkxc6sntCeb8h7SOhaL9mNvfCyS5SfLFF2hB6haauY1bOS6e1K+pOWC A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="313296125"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="313296125"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:31 -0800
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="777520540"
Received: from nnwogbe-mobl1.amr.corp.intel.com (HELO [10.212.101.231])
 ([10.212.101.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:30 -0800
Message-ID: <4a59eec7-f177-65fc-1c4a-3e8f34a828f1@linux.intel.com>
Date: Fri, 25 Feb 2022 12:51:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [RFC 05/13] ASoC: Intel: avs: Parse pipeline and module tuples
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
 <20220207132532.3782412-6-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220207132532.3782412-6-cezary.rojewski@intel.com>
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



On 2/7/22 07:25, Cezary Rojewski wrote:
> Shape of a stream on DSP side, that is, the number and the layout of
> its pipelines and modules is paramount for streaming to be efficient and
> low power-consuming. Add parsing helpers to support loading such
> information from the topology file.

again what is a 'stream'?


> +struct avs_tplg_path {
> +	u32 id;
> +};

A concept that boils down to a single integer is really far from clear
to me. What does this represent really?

> +
> +struct avs_tplg_pipeline {
> +	u32 id;
> +
> +	struct avs_tplg_pplcfg *cfg;
> +	struct avs_tplg_binding **bindings;
> +	u32 num_bindings;
> +	struct list_head mod_list;
> +
> +	struct avs_tplg_path *owner;

the cardinality between path and pipeline is far from clear. When you
have topologies where the same data can be rendered on multiple outputs
and demuxed into an echo reference, then what is the 'path'?

Worst case all connected pipelines could be a single path with this
hierarchical definition of ownership, but is this desired?

What happens when the user uses switches to disconnects pipelines?

> +	/* Path pipelines management. */

what is a path pipeline?

> +	struct list_head node;
> +};
> +
> +struct avs_tplg_module {
> +	u32 id;

what is the definition of id? is this local to the scope of a pipeline?
global for the entire topology?
> +
> +	struct avs_tplg_modcfg_base *cfg_base;
> +	struct avs_audio_format *in_fmt;
> +	u8 core_id;
> +	u8 domain;
> +	struct avs_tplg_modcfg_ext *cfg_ext;
> +
> +	struct avs_tplg_pipeline *owner;
> +	/* Pipeline modules management. */
> +	struct list_head node;
> +};

I would expect all modules to be seen as DAPM widgets, no?

> +
>  #endif
