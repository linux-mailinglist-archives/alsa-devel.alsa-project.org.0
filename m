Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2790B27AF55
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 15:46:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D50A51853;
	Mon, 28 Sep 2020 15:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D50A51853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601300795;
	bh=5VA99diFkPcsf3ZEVSMqCjz5tX2UVbFJrVbUgwg4+58=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jBoSr9N0w6DVIk5MfR3MIrUywxv9NPpUa8e0i+M/hAG1PRyGK/km4umIUZ8X5gakV
	 bpY1U+UMpaAZA0C4l4mD7if93i5C8Eg4JwaNXIF8o2KvhWXxfvgTgZ1/cIBeAMbqbX
	 +XqLeR8wPwXMcW5kZj0NnfM4Jx918/xxcpkKnsGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3C82F800FD;
	Mon, 28 Sep 2020 15:44:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90720F801F9; Mon, 28 Sep 2020 15:44:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE304F800FD
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 15:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE304F800FD
IronPort-SDR: 7ZffS9npMQrt4mUk3kGbJuNAowxz7khZR2XWC36LiNsdnEfj9iWiU40YKpRciLRrNviq9yWuou
 qkcxeuVX16ww==
X-IronPort-AV: E=McAfee;i="6000,8403,9757"; a="149768158"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="149768158"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 06:44:34 -0700
IronPort-SDR: YTwDXtk//BfzgeGQ5MONmhJXILT4wkfys6xN0ptoKRXSRuYdOXHV3zTglQcQExYxB9pvRQN4qJ
 R9ULMhtbPZvw==
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="513448706"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 06:44:30 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kMtS4-002ZVU-PV; Mon, 28 Sep 2020 16:44:24 +0300
Date: Mon, 28 Sep 2020 16:44:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v9 02/14] ASoC: Intel: catpt: Implement IPC protocol
Message-ID: <20200928134424.GM3956970@smile.fi.intel.com>
References: <20200926085910.21948-1-cezary.rojewski@intel.com>
 <20200926085910.21948-3-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200926085910.21948-3-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com,
 gregkh@linuxfoundation.org, marcin.barlik@intel.com, zwisler@google.com,
 lgirdwood@gmail.com, tiwai@suse.com, filip.proborszcz@intel.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 michal.wasko@intel.com, cujomalainey@chromium.org,
 krzysztof.hejmowski@intel.com, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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

On Sat, Sep 26, 2020 at 10:58:58AM +0200, Cezary Rojewski wrote:
> Implement IRQ handlers for immediate and delayed replies and
> notifications. Communication is synchronous and allows for serialization
> of maximum one message at a time.
> 
> DSP may respond with ADSP_PENDING status for a request - known as
> delayed reply - and when situation occurs, framework keeps the lock and
> awaits upcoming response through IPCD channel which is handled in
> bottom-half. Immediate replies spawn no BH at all as their processing is
> very short.

...

> +static int catpt_dsp_do_send_msg(struct catpt_dev *cdev,
> +				 struct catpt_ipc_msg request,
> +				 struct catpt_ipc_msg *reply, int timeout)
> +{
> +	struct catpt_ipc *ipc = &cdev->ipc;
> +	unsigned long flags;
> +	int ret;
> +
> +	if (!ipc->ready)
> +		return -EPERM;
> +	if (request.size > ipc->config.outbox_size ||
> +	    (reply && reply->size > ipc->config.outbox_size))
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&ipc->lock, flags);
> +	catpt_ipc_msg_init(ipc, reply);
> +	catpt_dsp_send_tx(cdev, &request);
> +	spin_unlock_irqrestore(&ipc->lock, flags);
> +
> +	ret = catpt_wait_msg_completion(cdev, timeout);
> +	if (ret) {
> +		dev_crit(cdev->dev, "communication severed: %d, rebooting dsp..\n",
> +			 ret);
> +		ipc->ready = false;
> +		/* TODO: attempt recovery */
> +		return ret;
> +	}

> +	ret = ipc->rx.rsp.status;
> +	if (reply) {
> +		reply->header = ipc->rx.header;
> +		if (!ret && reply->data)
> +			memcpy(reply->data, ipc->rx.data, reply->size);
> +	}
> +
> +	return ret;

One more looking into this... What about

	if (reply)
		reply->header = ipc->rx.header;

	ret = ipc->rx.rsp.status; // or even directly if (status) return status.
	if (ret)
		return ret;

	if (reply->data)
		memcpy(reply->data, ipc->rx.data, reply->size);

	return 0;

It may be verbose but I think readability is better here.

> +}

...

> +	CATPT_CHANNEL_CONFIG_5_POINT_0	= 7, /* L, C, R, Ls & Rs */
> +	CATPT_CHANNEL_CONFIG_5_POINT_1	= 8, /* L, C, R, Ls, Rs & LFE */
> +	CATPT_CHANNEL_CONFIG_DUAL_MONO	= 9, /* One channel replicated in two */
> +	CATPT_CHANNEL_CONFIG_INVALID	= 10,

Hmm... I think I got the point why DUAL_MONO was at the end of the switch-case.

...

> +enum catpt_module_id {
> +	CATPT_MODID_BASE_FW = 0x0,
> +	CATPT_MODID_MP3 = 0x1,
> +	CATPT_MODID_AAC_5_1 = 0x2,
> +	CATPT_MODID_AAC_2_0 = 0x3,
> +	CATPT_MODID_SRC = 0x4,
> +	CATPT_MODID_WAVES = 0x5,
> +	CATPT_MODID_DOLBY = 0x6,
> +	CATPT_MODID_BOOST = 0x7,
> +	CATPT_MODID_LPAL = 0x8,
> +	CATPT_MODID_DTS = 0x9,
> +	CATPT_MODID_PCM_CAPTURE = 0xA,
> +	CATPT_MODID_PCM_SYSTEM = 0xB,
> +	CATPT_MODID_PCM_REFERENCE = 0xC,
> +	CATPT_MODID_PCM = 0xD, /* offload */
> +	CATPT_MODID_BLUETOOTH_RENDER = 0xE,
> +	CATPT_MODID_BLUETOOTH_CAPTURE = 0xF,
> +	CATPT_MODID_LAST = CATPT_MODID_BLUETOOTH_CAPTURE,
> +};

if you indent the values to be on the same column it will increase readability.

...

> +enum catpt_mclk_frequency {
> +	CATPT_MCLK_OFF = 0,
> +	CATPT_MCLK_FREQ_6_MHZ = 1,
> +	CATPT_MCLK_FREQ_21_MHZ = 2,
> +	CATPT_MCLK_FREQ_24_MHZ = 3,
> +};

Looks like a 3 MHz as base frequency with multiplicators 0, 2, 7, 8. 

...

> +#define CATPT_STREAM_MSG(msg_type) \
> +{ \
> +	.stream_msg_type = CATPT_STRM_##msg_type, \
> +	.global_msg_type = CATPT_GLB_STREAM_MESSAGE }
> +#define CATPT_STAGE_MSG(msg_type) \
> +{ \
> +	.stage_action = CATPT_STG_##msg_type, \
> +	.stream_msg_type = CATPT_STRM_STAGE_MESSAGE, \
> +	.global_msg_type = CATPT_GLB_STREAM_MESSAGE }

Hmm... This split is interesting. I would rather move } to a new line.

...

> @@ -15,7 +15,6 @@
>  #define CATPT_SHIM_REGS_SIZE	4096
>  #define CATPT_DMA_REGS_SIZE	1024
>  #define CATPT_DMA_COUNT		2

> -#define CATPT_SSP_COUNT		2

Why is this?

>  #define CATPT_SSP_REGS_SIZE	512
>  
>  /* DSP Shim registers */

-- 
With Best Regards,
Andy Shevchenko


