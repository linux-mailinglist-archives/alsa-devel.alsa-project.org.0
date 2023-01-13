Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9206D66A2EC
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 20:28:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E43D8AFA4;
	Fri, 13 Jan 2023 20:28:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E43D8AFA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673638134;
	bh=NoSp4Yj8rM26hkY4skqXoBTM3TREEhqDQjQrCdEQ3rw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tZ7VuMC8XfBLqyoTEBYIKuraGZQVGAWcoZ35IrBb6Gw6Udx2YszkZwTEtvqLH2678
	 biET85tEtzARISV2Ze2FZCNO78yQ7xT+6/QavR2Wf5ig/k38sIqnWF+1S1186Svdzz
	 GneG2USHszUoaPuIyqF5F8e5j1XjhuEMNLWuBAeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DE78F8026D;
	Fri, 13 Jan 2023 20:27:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B666F80424; Fri, 13 Jan 2023 20:27:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72698F8026D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 20:27:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72698F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=E2SeAvNO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673638072; x=1705174072;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NoSp4Yj8rM26hkY4skqXoBTM3TREEhqDQjQrCdEQ3rw=;
 b=E2SeAvNOAlZ7IAW0PH7KYIWSr/zVhdqo1zUdyKDJge4p6kQTemLqvBBe
 vVZ9lW9RCdZbm74id0MvC52V1HgLeva5InmIB9RCXfk8CcgBRYcLFupBk
 5bF2+LpJzG1lRVX0KzfKSFpEHFmb8H1PLXcOeosv7GVMOnbV5AnQraP2H
 gsatKtH1zG0RDaMLRi1QlNcFOR7BH2zHHvWtD7UewKrcroO95Z4ZmSYMK
 j9hrjuVwFTsDHqyDFjdNGlpsDdwhPis4n7yaa6pmj1GhA3Y4o3TNVM1XK
 YWLeOF00D1TSAebvtNWRjk1S4Xx1T+YoEjJH/nV83DVR9vx7idD6sh6K4 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="322777184"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="322777184"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 11:27:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="608257437"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="608257437"
Received: from rerayess-mobl.amr.corp.intel.com (HELO [10.212.13.223])
 ([10.212.13.223])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 11:27:44 -0800
Message-ID: <3bb2114c-cd0c-f176-c837-90a665a25343@linux.intel.com>
Date: Fri, 13 Jan 2023 11:05:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 08/19] ASoC: amd: ps: add soundwire dma driver dma ops
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, broonie@kernel.org,
 vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-9-Vijendar.Mukunda@amd.com>
 <77e35f54-323e-42d0-9e74-be984eebc0fe@linux.intel.com>
 <6bb9b13c-2829-d7c3-872b-6e9586189300@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <6bb9b13c-2829-d7c3-872b-6e9586189300@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Mario.Limonciello@amd.com, arungopal.kondaveeti@amd.com,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


>>> +	sdw_data->sdw_stream[stream_id] = substream;
>>> +	size = params_buffer_bytes(params);
>>> +	period_bytes = params_period_bytes(params);
>>> +	sdw_stream_data->dma_addr = substream->runtime->dma_addr;
>>> +	sdw_stream_data->num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
>>> +	acp63_config_dma(sdw_stream_data, stream_id);
>>> +	ret = acp63_configure_sdw_ringbuffer(sdw_stream_data->acp_base, stream_id, size);
>>> +	if (ret) {
>>> +		dev_err(component->dev, "Invalid channel type\n");
>>> +		return -EINVAL;
>>> +	}
>>> +	switch (stream_id) {
>>> +	case ACP_SDW_AUDIO_TX:
>>> +		water_mark_size_reg = ACP_AUDIO_TX_INTR_WATERMARK_SIZE;
>>> +		irq_mask = BIT(ACP_AUDIO_TX_THRESHOLD);
>>> +		acp_ext_intr_cntl_reg = ACP_EXTERNAL_INTR_CNTL;
>>> +		break;
>> so there's ONE resource to deal with external codecs? How does this work
>> if you have a headset codec and an amplifier?
> Are you referring to playing a same stream over headset codec and
> amplifier?
> It's all about channel selection from DMA perspective.
> We have tested speaker aggregation and headset playback use cases.

No, I wasn't asking about playing the same content to different sinks.

I was referring to playing/recording different content to/from different
devices.

Even when interfacing with a single device, there are interesting
topologies in the SDCA spec that would require multiple DMA transfers
conveying unrelated content (or processed content from the same source).

