Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D48B4C5031
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 21:56:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17A0A1F78;
	Fri, 25 Feb 2022 21:55:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17A0A1F78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645822569;
	bh=/C5O+44swq7nXUgjieV9+8yLwXPVf09ux+gpONdw+vA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WvXsWbuqVYcXqgm8JFhyD+Hvh67Lg2FaQ2djWhOsDxJZ06HsyQPzbk9QQ6STZOUle
	 JYFRafm92b8wohX0saHz602W8zv5j+uac9/ii/0reAiNO5k2PxZSOO9GEeGj63VPu5
	 H1gQICz8S8XrJhKVk6NJGK+FIc+ot38rcq5Nb02c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C50BF80537;
	Fri, 25 Feb 2022 21:53:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFE27F80515; Fri, 25 Feb 2022 21:52:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99014F800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 21:52:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99014F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ScwqxSJP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645822360; x=1677358360;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/C5O+44swq7nXUgjieV9+8yLwXPVf09ux+gpONdw+vA=;
 b=ScwqxSJPZljqZ7p+f79TSkm1CmTkjmZAOoMPpOqHLALKr5q3Q0pz/A32
 bjMoQsD525c+NuVeFTDnSBaKYnK6e2xIHxBKFBJdDFO+1W/bllfr7LNpJ
 llssir/iEP58F9a50G/RO6XXZRgZ2W/eebvGj3ztfMXDm2J545JlGOScK
 xgUdGqqToil+98mg7frPfnyMM3UZvH8mMDO8r9fLFNg0RtZXfPDLT107n
 RH776q2s7vF9stvPVRYdDzzP/9glEorPSZzLrxHeyrlPB+IqcfLJu0/wr
 lWaXPLJOgz7MFv2/+UbvBl7tvA6GxUDL53UkLjw9LSyd9rS5drV2P/1k3 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="313296123"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="313296123"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:29 -0800
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="777520536"
Received: from nnwogbe-mobl1.amr.corp.intel.com (HELO [10.212.101.231])
 ([10.212.101.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:28 -0800
Message-ID: <a32be4cf-3d33-4ffe-71ce-84cd500d520f@linux.intel.com>
Date: Fri, 25 Feb 2022 11:40:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [RFC 04/13] ASoC: Intel: avs: Parse pplcfg and binding tuples
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
 <20220207132532.3782412-5-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220207132532.3782412-5-cezary.rojewski@intel.com>
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
> Stream on ADSP firmware is represented by one or more pipelines. Just

I have a lot of questions on this one line...

what is a 'stream'?

'stream' historically means 'direction' in ALSA.

Then we have sdw_stream, which describes how source and sink ports are
connected on a platform.

We also have DPCM front-ends, visible mostly through the PCM device they
expose to users.

In windows we have stream effects that are really meant to be on a
single dedicated pipeline.

other questions: can a stream represent data moving in different
directions, e.g. in full-duplex mode.

How would a loopback be described?

What happens when a data path is split (demux) or merged (mixer)?

How is a 'stream' different from a 'path template' that you referred to
in Patch RFC 02/13

You would need at least 10 lines of plain English to make sure no one
will misunderstand what 'stream' means.

> like modules, these are described by a config structure. Add parsing
> helpers to support loading such information from the topology file.
>
> +/* Specifies path behaviour during PCM ->trigger(START) commnand. */

typo: command.

> +enum avs_tplg_trigger {
> +	AVS_TPLG_TRIGGER_AUTO = 0,
> +	AVS_TPLG_TRIGGER_USERSPACE = 1, /* via sysfs */

The feedback in previous versions was that we should not expose any
sysfs interface that would interfere with decisions made by the driver.

This is very controversial and a major hurdle to upstream any of this.

Debugfs is fine, as suggested by Mark as well

"
If it's mainly used for debugging then it could be exposed through
debugfs with less worry.
"


> +};
> +
> +struct avs_tplg_pplcfg {
> +	u16 req_size;

what does this describe?

> +	u8 priority;
> +	bool lp;
> +	u16 attributes;
> +	enum avs_tplg_trigger trigger;
> +};
> +
> +struct avs_tplg_binding {
> +	char target_tplg_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
> +	u32 target_path_tmpl_id;
> +	u32 target_ppl_id;
> +	u32 target_mod_id;
> +	u8 target_mod_pin;

you really need to elaborate on what a template is, and how you use a
template and a ppl id concurrently.

> +	u32 mod_id;
> +	u8 mod_pin;
> +	u8 is_sink;
> +};
> +
>  #endif
