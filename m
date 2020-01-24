Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8533A148F50
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 21:26:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25E251698;
	Fri, 24 Jan 2020 21:25:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25E251698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579897608;
	bh=XIMEEqerTNowFNl4MkM0sy6c/B4SWvybsX5OKpVU+cs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YKQTfS2U0FRhrT2Cat4FEk7jjXnsyrE2Ydw97ca2RIYZtRMadt4OVZlR8DPFh8N64
	 9Axn4UHiYUxRr4FC9i4ps9KIKdBl4lzUQozbrUwIREqrgcjiYRPPh7zh5d7N/7iOXJ
	 FefMwBn9iNhHWrN90+hPZSbfIcptEU5NTj+yC9eY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC678F80217;
	Fri, 24 Jan 2020 21:24:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F22D8F80271; Fri, 24 Jan 2020 21:24:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DC78F800BA
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 21:24:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DC78F800BA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 12:24:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; d="scan'208";a="400759961"
Received: from iifeduba-mobl1.amr.corp.intel.com (HELO [10.254.110.26])
 ([10.254.110.26])
 by orsmga005.jf.intel.com with ESMTP; 24 Jan 2020 12:24:08 -0800
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200124190413.18154-1-cezary.rojewski@intel.com>
 <20200124190413.18154-8-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20e4b888-0766-f211-9adf-4f6794a39f4a@linux.intel.com>
Date: Fri, 24 Jan 2020 13:55:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200124190413.18154-8-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 07/12] ASoC: SOF: Implement Probe IPC API
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> +/**
> + * sof_ipc_probe_dma_add - attach to specified dmas
> + * @sdev:	SOF sound device
> + * @dma:	List of streams (dmas) to attach to
> + * @num_dma:	Number of elements in @dma
> + *
> + * Contrary to extraction, injection streams are never assigned
> + * on init. Before attempting any data injection, host is responsible
> + * for specifying streams which will be later used to transfer data
> + * to connected probe points.
> + */
> +int sof_ipc_probe_dma_add(struct snd_sof_dev *sdev,
> +		struct sof_probe_dma *dma, size_t num_dma)
> +{
> +	struct sof_ipc_probe_dma_add_params *msg;
> +	struct sof_ipc_reply reply;
> +	size_t bytes = sizeof(*dma) * num_dma;
> +	int ret;
> +
> +	msg = kmalloc(sizeof(*msg) + bytes, GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
> +	msg->hdr.size = sizeof(*msg);
> +	msg->num_elems = num_dma;
> +	msg->hdr.cmd = SOF_IPC_GLB_PROBE | SOF_IPC_PROBE_DMA_ADD;
> +	memcpy(&msg->dma[0], dma, bytes);
> +
> +	ret = sof_ipc_tx_message(sdev->ipc, msg->hdr.cmd, msg,
> +			msg->hdr.size + bytes, &reply, sizeof(reply));
> +	kfree(msg);
> +	return ret;
> +}
> +EXPORT_SYMBOL(sof_ipc_probe_dma_add);
> +
> +/**
> + * sof_ipc_probe_dma_remove - detach from specified dmas
> + * @sdev:		SOF sound device
> + * @stream_tag:	List of stream tags to detach from
> + * @num_stream_tag:	Number of elements in @stream_tag
> + *
> + * Host sends DMA_REMOVE request to free previously attached stream
> + * from being occupied for injection. Each detach operation should
> + * match equivalent DMA_ADD. Detach only when all probes tied to
> + * given stream have been disconnected.
> + */
> +int sof_ipc_probe_dma_remove(struct snd_sof_dev *sdev,
> +		unsigned int *stream_tag, size_t num_stream_tag)
> +{
> +	struct sof_ipc_probe_dma_remove_params *msg;
> +	struct sof_ipc_reply reply;
> +	size_t bytes = sizeof(*stream_tag) * num_stream_tag;
> +	int ret;
> +
> +	msg = kmalloc(sizeof(*msg) + bytes, GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
> +	msg->hdr.size = sizeof(*msg);
> +	msg->num_elems = num_stream_tag;
> +	msg->hdr.cmd = SOF_IPC_GLB_PROBE | SOF_IPC_PROBE_DMA_REMOVE;
> +	memcpy(&msg->stream_tag[0], stream_tag, bytes);
> +
> +	ret = sof_ipc_tx_message(sdev->ipc, msg->hdr.cmd, msg,
> +			msg->hdr.size + bytes, &reply, sizeof(reply));
> +	kfree(msg);
> +	return ret;
> +}
> +EXPORT_SYMBOL(sof_ipc_probe_dma_remove);

a lot of the code is identical with only minor difference in num_elems 
and the flags, could we use helper functions here?

This would help btw when we transition to the multi-client support, we'd 
only need to update the IPC stuff in few locations.


> diff --git a/sound/soc/sof/probe.h b/sound/soc/sof/probe.h
> new file mode 100644
> index 000000000000..a5cc24405e7e
> --- /dev/null
> +++ b/sound/soc/sof/probe.h
> @@ -0,0 +1,85 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> +/*
> + * This file is provided under a dual BSD/GPLv2 license.  When using or
> + * redistributing this file, you may do so under either license.
> + *
> + * Copyright(c) 2019 Intel Corporation. All rights reserved.

2019-2020. Happy New Year.

I'd prefer it if we have the new header file in a separate patch added 
first, I find it odd to review an implementation with the header added last.


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
