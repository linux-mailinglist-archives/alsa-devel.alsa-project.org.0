Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB75C4D3D1A
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 23:38:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 604481689;
	Wed,  9 Mar 2022 23:37:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 604481689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646865518;
	bh=1xLGxn/aKA5XU7uaWHUpJjYehgqQcd0KJ7IwLGR/J4o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qBFdy5t7I/sJrORUqAWJAzjMvRDS+RsMlb6D+CRjGrVTKu15cAhfZirBZpUSThbL0
	 qbYaDw0oEw5tw3mqF5lh7CpB6sNZdnBHFtvMgoi9cP5/Mac8zCV/l0OqMlRV9Xm8pp
	 1kyyS/d5aQ8+kmILVXh/jYK/J2DGKdhpMXT57AS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCC51F800D2;
	Wed,  9 Mar 2022 23:37:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F3C5F800D2; Wed,  9 Mar 2022 23:37:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC5ACF800D2
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 23:37:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC5ACF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KfzaMPo7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646865447; x=1678401447;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1xLGxn/aKA5XU7uaWHUpJjYehgqQcd0KJ7IwLGR/J4o=;
 b=KfzaMPo7frXdyzBEEQ7rtfEUo+ZCkMqEgxh/1FignpwxxWkQVTVIS9Du
 yGC8HOG8u09feLFRxyxPswbNjBVaEq84+filzBwWj+ihwhoHLHslq+M+8
 36oSgtEwC9/gF8yrgqGJ9sQYlB7Wrbjixm1hR2McFqZ21uIl7CD65/O4/
 wZorrDIs9Jx+EPkSN+omyjORgjDpwWC/xVw2h2J6HFYJUtmupx1Lyf9X+
 KUBKt6DbRJZQfBgKgAmkjvE1ozJKltyJ+FRh84CjzUpe6XskIW+O6b2zC
 eia9pKSgBcGZCx3UiEHkOZhwusZjHXGW6TmmZDlhqF5iX3yn2v2sqcgv2 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="252677388"
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="252677388"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 14:37:24 -0800
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="688449478"
Received: from nhaouati-mobl2.amr.corp.intel.com (HELO [10.212.216.252])
 ([10.212.216.252])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 14:37:22 -0800
Message-ID: <e0f4bc39-91e6-aead-a6c4-90251298d37d@linux.intel.com>
Date: Wed, 9 Mar 2022 16:10:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v4 04/17] ASoC: Intel: avs: Inter process communication
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220309204029.89040-1-cezary.rojewski@intel.com>
 <20220309204029.89040-5-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220309204029.89040-5-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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


> +/*
> + * struct avs_dsp_ops - Platform-specific DSP operations
> + *
> + * @power: Power on or off DSP cores
> + * @reset: Enter or exit reset state on DSP cores
> + * @stall: Stall or run DSP cores

nit-pick: the description sounds like boolean states. add "callback to"

> + * @irq_handler: Top half of IPC servicing
> + * @irq_thread: Bottom half of IPC servicing
> + * @int_control: Enable or disable IPC interrupts

callback to ...

> + */
>   struct avs_dsp_ops {
>   	int (* const power)(struct avs_dev *, u32, bool);
>   	int (* const reset)(struct avs_dev *, u32, bool);
>   	int (* const stall)(struct avs_dev *, u32, bool);
> +	irqreturn_t (* const irq_handler)(int, void *);
> +	irqreturn_t (* const irq_thread)(int, void *);
> +	void (* const int_control)(struct avs_dev *, bool);
>   };

> +/*
> + * struct avs_ipc - DSP IPC context
> + *
> + * @dev: PCI device
> + * @rx: Reply message cache

cache? I find this confusing, what are you trying to say here?

> + * @default_timeout_ms: default message timeout in MS
> + * @ready: whether firmware is ready and communication is open
> + * @rx_completed: whether RX for previously sent TX has been received
> + * @rx_lock: for serializating manipulation of rx_* fields

typo: serializing

> + * @msg_lock: for synchronizing request handling
> + * @done_completion: DONE-part of IPC i.e. ROM and ACKs from FW
> + * @busy_completion: BUSY-part of IPC i.e. receiving responses from FW
> + */
> +struct avs_ipc {
> +	struct device *dev;
> +
> +	struct avs_ipc_msg rx;
> +	u32 default_timeout_ms;
> +	bool ready;
> +
> +	bool rx_completed;
> +	spinlock_t rx_lock;
> +	struct mutex msg_mutex;
> +	struct completion done_completion;
> +	struct completion busy_completion;
> +};
> +
> +#define AVS_EIPC	EREMOTEIO

I don't recall if I already mentioned this but I don't see the need for 
an intermediate redefinition of a Linux error code.

> +/*
> + * IPC handlers may return positive value (firmware error code) what denotes
> + * successful HOST <-> DSP communication yet failure to process specific request.
> + *
> + * Below macro converts returned value to linux kernel error code.
> + * All IPC callers MUST use it as soon as firmware error code is consumed.
> + */
> +#define AVS_IPC_RET(ret) \
> +	(((ret) <= 0) ? (ret) : -AVS_EIPC)
> +
> +static inline void avs_ipc_err(struct avs_dev *adev, struct avs_ipc_msg *tx,
> +			       const char *name, int error)
> +{
> +	/*
> +	 * If IPC channel is blocked e.g.: due to ongoing recovery,
> +	 * -EPERM error code is expected and thus it's not an actual error.
> +	 */
> +	if (error == -EPERM)
> +		dev_dbg(adev->dev, "%s 0x%08x 0x%08x failed: %d\n", name,

%# adds the 0x for you.

> +			tx->glb.primary, tx->glb.ext.val, error);
> +	else
> +		dev_err(adev->dev, "%s 0x%08x 0x%08x failed: %d\n", name,
> +			tx->glb.primary, tx->glb.ext.val, error);
> +}

> +static void avs_dsp_process_notification(struct avs_dev *adev, u64 header)
> +{
> +	struct avs_notify_mod_data mod_data;
> +	union avs_notify_msg msg = AVS_MSG(header);
> +	size_t data_size = 0;
> +	void *data = NULL;
> +
> +	/* Ignore spurious notifications until handshake is established. */

there's no handshake here, just an initial notification after which the 
IPC protocol can start?

> +	if (!adev->ipc->ready && msg.notify_msg_type != AVS_NOTIFY_FW_READY) {
> +		dev_dbg(adev->dev, "FW not ready, skip notification: 0x%08x\n",
> +			msg.primary);
> +		return;
> +	}
> +
> +	/* Calculate notification payload size. */
> +	switch (msg.notify_msg_type) {
> +	case AVS_NOTIFY_FW_READY:
> +		break;
> +
> +	case AVS_NOTIFY_PHRASE_DETECTED:
> +		data_size = sizeof(struct avs_notify_voice_data);
> +		break;
> +
> +	case AVS_NOTIFY_RESOURCE_EVENT:
> +		data_size = sizeof(struct avs_notify_res_data);
> +		break;
> +
> +	case AVS_NOTIFY_MODULE_EVENT:
> +		/* To know the total payload size, header needs to be read first. */
> +		memcpy_fromio(&mod_data, avs_uplink_addr(adev), sizeof(mod_data));
> +		data_size = sizeof(mod_data) + mod_data.data_size;
> +		break;
> +
> +	default:
> +		dev_info(adev->dev, "unknown notification: 0x%08x\n",
> +			 msg.primary);
> +		break;
> +	}
> +
> +	if (data_size) {
> +		data = kmalloc(data_size, GFP_KERNEL);
> +		if (!data)
> +			return;
> +
> +		memcpy_fromio(data, avs_uplink_addr(adev), data_size);
> +	}
> +
> +	/* Perform notification-specific operations. */
> +	switch (msg.notify_msg_type) {
> +	case AVS_NOTIFY_FW_READY:
> +		dev_dbg(adev->dev, "FW READY 0x%08x\n", msg.primary);
> +		adev->ipc->ready = true;
> +		complete(&adev->fw_ready);
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +	kfree(data);
> +}

