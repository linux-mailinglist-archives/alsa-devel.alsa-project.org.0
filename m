Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C213948EF8E
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 18:56:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 652A41B4F;
	Fri, 14 Jan 2022 18:56:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 652A41B4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642183011;
	bh=doUB/pKBDJqy6j6WmEvX+v/9LR0IPAN2M5yEKEe05ak=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ndPLJX7YPkulqGjEuFNvDBVdrdXLcDnntYADRPqifwVE7NrnQgUHfviIqSbD9+X1h
	 5SYtzDgBZ8Mz4ROoB2yMWPWDaEozHQ9YVL26+8c3UUgQtM2GMtAyLKPB1RnvsfPm9i
	 e4AoO0cnIGWMBL6ncEW/fl9RbsoiDRKgA9orXcR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4F71F80310;
	Fri, 14 Jan 2022 18:55:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DFDCF8030F; Fri, 14 Jan 2022 18:55:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A5DDF80141
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 18:55:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A5DDF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JTd1qPAl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642182940; x=1673718940;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=doUB/pKBDJqy6j6WmEvX+v/9LR0IPAN2M5yEKEe05ak=;
 b=JTd1qPAlyWrKXpxDwsDA8Ass5Jcfsm/DcOPZf1StQYqP2QNbscnpfkUK
 C6aJkdNU3cKikIZCFTgpE3BGVeD69VIHgv1lKHwe/WXekmismkRAMu70U
 jMZp4HPs7eMGiMjp1PJ4PGQW+pYEu3Zde28qUYerj2DOLoRkEqcDNpN4j
 qiUvLnoFLza2aj5VdIvQlxALr1UxwZ1Dd7ATnBoSi4Yu3rNnETIImf/6L
 lphJuzXFL1b1YV8A0sIaL2FWRow6uU1CVKFMGqzPVX9hR7NrAz0A38fU4
 JSqlePobW3MHcl7BYeeyFHJaJl0q8tUC9Mfp+WMFk0DWy6eY/+agguxay Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10227"; a="305026675"
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; d="scan'208";a="305026675"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 09:55:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; d="scan'208";a="624426987"
Received: from dsubasic-mobl.amr.corp.intel.com (HELO [10.212.67.37])
 ([10.212.67.37])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 09:55:32 -0800
Subject: Re: [PATCH] ASoC: SOF: compr: Add compress ops implementation
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220113161341.371345-1-daniel.baluta@oss.nxp.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9b3d28f3-aa2b-ade9-4160-752b349bdeab@linux.intel.com>
Date: Fri, 14 Jan 2022 11:55:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113161341.371345-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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


Thanks for starting this work Daniel.

> +int sof_compr_get_params(struct snd_soc_component *component,
> +			 struct snd_compr_stream *cstream, struct snd_codec *params)
> +{
> +	return 0;
> +}

You should probably add a statement along the lines of:

/* TODO: we don't query the supported codecs for now, if the application
asks for an unsupported codec the set_params() will fail
*/

.get_codec_caps is also missing, it should be documented as something we
want to add.

> +static int sof_compr_pointer(struct snd_soc_component *component,
> +			     struct snd_compr_stream *cstream,
> +			     struct snd_compr_tstamp *tstamp)
> +{
> +	struct snd_compr_runtime *runtime = cstream->runtime;
> +	struct sof_compr_stream *sstream = runtime->private_data;
> +
> +	tstamp->sampling_rate = sstream->sample_rate;
> +	tstamp->copied_total = sstream->copied_total;

Humm, this doesn't return any information on how many PCM samples were
generated (pcm_frames) or rendered (pcm_io_frames).

I don't think the existing SOF firmware has this level of detail for
now, you should at least document it as to be added in the future.

In addition, the .pointer callback can be used at different times, and
for added precision the information should be queried from the firmware
via IPC or by looking up counters in the SRAM windows.

I don't think it's good enough to update the information on a fragment
elapsed event. It will work for sure in terms of reporting compressed
data transfers, but it's not good enough for an application to report
time elapsed.

> +struct sof_compr_stream {
> +	unsigned int copied_total;
> +	unsigned int sample_rate;
> +	size_t posn_offset;
> +};

do you need an SOF-specific definition? This looks awfully similar to
snd_compr_tstamp:

struct snd_compr_tstamp {
	__u32 byte_offset;
	__u32 copied_total;
	__u32 pcm_frames;
	__u32 pcm_io_frames;
	__u32 sampling_rate;
}
