Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0604C3BCF
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 03:41:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87C2E18F6;
	Fri, 25 Feb 2022 03:40:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87C2E18F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645756906;
	bh=lawUbwxLS8pJsMMtnhHHoC0fMaHb4wwa9FSJKHy7rjI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KugflxzU+ZN1HCFYdjaLJUY26JoDVyQhT1XCBsdDYxNcn6EjJMMMRl2WwOWIfQbB3
	 u1zOeUOqO6mUqaBrOXQShtSc0cL3TInAz/+EeVAS457IkuWrxPmdZAvdlHrhnBpuHi
	 opkDqj44Pc4kH1a+kucyqfYCRQIwO2C6K3YlyRs4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F3F8F8051C;
	Fri, 25 Feb 2022 03:39:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C66B6F80430; Fri, 25 Feb 2022 03:39:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8BA4F800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 03:39:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8BA4F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gyV4pfPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645756761; x=1677292761;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lawUbwxLS8pJsMMtnhHHoC0fMaHb4wwa9FSJKHy7rjI=;
 b=gyV4pfPNTeSL7S1A+dBWFp50cBkBxjAfbsEexcGd05IW/Gy7Oebyz6Uy
 WG9/ZDHyczVBhnOC0a5LSDTuvvAKMU8t1Sno+coYgYKB/5SQvTwbLSuGN
 AvswfDOOH5YJgLN5fk0AFju70SQdk5J4O0k6oQi9xcVbyfTO4tN7zR/Wz
 LHa2kQ2uekYzdgj9ipA9yvfPRAZf/L7BV/JrcRfNCVWvi6Y4yTyX0krsa
 QA7kWO8lGlvOPQ3NZx8jjgVhcbvXTbOwtnXHRZMd3E4IsbRO787tpgswa
 uTd0OSNGn8xNiAa/amgR/VJMR9jPZUexpxwtMoxs+kRIMUzBAUZqadP9v w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="277036141"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="277036141"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 18:39:13 -0800
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="491832616"
Received: from jsegev-mobl1.ger.corp.intel.com (HELO [10.212.99.193])
 ([10.212.99.193])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 18:39:11 -0800
Message-ID: <c2f249df-0b3e-1032-6514-81fabb544b6f@linux.intel.com>
Date: Thu, 24 Feb 2022 18:56:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 04/17] ASoC: Intel: avs: Inter process communication
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-5-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220207122108.3780926-5-cezary.rojewski@intel.com>
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




> The boot process involving ROM-code requires specific handling with
> 'unstall' operations which are not required post-boot with normal IPC so
> separate set of send-message handlers is added for each of the usecases.

consider splitting this long sentence and use simpler logic. It's quite
unclear how you went from boot to use cases.


> +#include "messages.h"

avs_messages.h?

>  
>  struct avs_dev;
>  
> @@ -18,6 +19,9 @@ struct avs_dsp_ops {
>  	int (* const power)(struct avs_dev *, u32, bool);
>  	int (* const reset)(struct avs_dev *, u32, bool);
>  	int (* const stall)(struct avs_dev *, u32, bool);
> +	irqreturn_t (* const irq_handler)(int, void *);
> +	irqreturn_t (* const irq_thread)(int, void *);
> +	void (* const int_control)(struct avs_dev *, bool);

kernel-doc or comments on what the last op might mean?

>  };
>  
>  #define avs_dsp_op(adev, op, ...) \
> @@ -34,6 +38,18 @@ struct avs_spec {
>  
>  	const u32 core_init_mask;	/* used during DSP boot */
>  	const u64 attributes;		/* bitmask of AVS_PLATATTR_* */
> +	const u32 sram_base_offset;
> +	const u32 sram_window_size;
> +
> +	const u32 rom_status;
> +	const u32 hipc_req_offset;
> +	const u32 hipc_req_ext_offset;
> +	const u32 hipc_req_busy_mask;
> +	const u32 hipc_ack_offset;
> +	const u32 hipc_ack_done_mask;
> +	const u32 hipc_rsp_offset;
> +	const u32 hipc_rsp_busy_mask;
> +	const u32 hipc_ctl_offset;

is this really desirable to describe the IPC registers, when we know
there were 3 generations of Intel IPC registers. this is ipc-1.5 only.

>  };
>  
>  struct avs_dev {
> @@ -42,6 +58,9 @@ struct avs_dev {
>  
>  	void __iomem *adsp_ba;
>  	const struct avs_spec *spec;
> +	struct avs_ipc *ipc;
> +
> +	struct completion fw_ready;
>  };
>  
>  /* from hda_bus to avs_dev */
> @@ -61,4 +80,78 @@ int avs_dsp_core_stall(struct avs_dev *adev, u32 core_mask, bool stall);
>  int avs_dsp_core_enable(struct avs_dev *adev, u32 core_mask);
>  int avs_dsp_core_disable(struct avs_dev *adev, u32 core_mask);
>  
> +/* Inter Process Communication */
> +
> +struct avs_ipc_msg {
> +	union {
> +		u64 header;
> +		union avs_global_msg glb;
> +		union avs_reply_msg rsp;
> +	};
> +	void *data;
> +	size_t size;
> +};
> +
> +struct avs_ipc {
> +	struct device *dev;
> +
> +	struct avs_ipc_msg rx;
> +	u32 default_timeout_ms;
> +	bool ready;

ready for what? This should be described or documented.

> +
> +	bool rx_completed;
> +	spinlock_t rx_lock;
> +	struct mutex msg_mutex;

checkpatch would tell you to add a comment for spinlock and mutex. it's
quite unclear what they might describe and if they are related.

> +	struct completion done_completion;
> +	struct completion busy_completion;
> +};
> +
> +#define AVS_EIPC	EREMOTEIO
> +/*
> + * IPC handlers may return positive value (firmware error code) what denotes
> + * successful HOST <-> DSP communication yet failure to process specific request.
> + *
> + * Below macro converts returned value to linux kernel error code.
> + * All IPC callers MUST use it as soon as firmware error code is consumed.
> + */
> +#define AVS_IPC_RET(ret) \
> +	(((ret) <= 0) ? (ret) : -AVS_EIPC)

why not use -EREMOTEIO directly? -AVS_EIPC is not very useful for the
reader.

And why -EREMOTEIO? I see that you used it in catpt but that's a very
surprising code that no one else uses in sound/

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
> +			tx->glb.primary, tx->glb.ext.val, error);
> +	else
> +		dev_err(adev->dev, "%s 0x%08x 0x%08x failed: %d\n", name,
> +			tx->glb.primary, tx->glb.ext.val, error);
> +}

we've used such functions before and the feedback, e.g. from GregKH and
Mark Brown, has consistenly been that this is pushing the use of dev_dbg
too far.


> +#define AVS_IPC_TIMEOUT_MS	300

skl-sst-ipc.c:#define IPC_TIMEOUT_MSECS         3000

that's one order of magniture lower. please add a comment or align.

> +static void avs_dsp_receive_rx(struct avs_dev *adev, u64 header)
> +{
> +	struct avs_ipc *ipc = adev->ipc;
> +	union avs_reply_msg msg = AVS_MSG(header);
> +
> +	ipc->rx.header = header;
> +	if (!msg.status)
> +		memcpy_fromio(ipc->rx.data, avs_uplink_addr(adev),
> +			      ipc->rx.size);

it wouldn't hurt to describe that the status determines whether
additional information can be read from a mailbox.

> +}
> +
> +static void avs_dsp_process_notification(struct avs_dev *adev, u64 header)
> +{
> +	struct avs_notify_mod_data mod_data;
> +	union avs_notify_msg msg = AVS_MSG(header);
> +	size_t data_size = 0;
> +	void *data = NULL;
> +
> +	if (!adev->ipc->ready && msg.notify_msg_type != AVS_NOTIFY_FW_READY) {
> +		dev_dbg(adev->dev, "FW not ready, skip notification: 0x%08x\n",
> +			msg.primary);

can this happen?

you should add a comment on what could be sent before the first 'real'
sign of life from the DSP.

it's also unclear why this dev_dbg() when 'unknown notifications' below
are handled as dev_warn()

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
> +		memcpy_fromio(&mod_data, avs_uplink_addr(adev), sizeof(mod_data));
> +		data_size = sizeof(mod_data) + mod_data.data_size;

it wouldn't hurt to describe the layout behing this formula.

> +		break;
> +
> +	default:
> +		dev_warn(adev->dev, "unknown notification: 0x%08x\n",
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

avs->ipc->fw_ready?

> +		complete(&adev->fw_ready);> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +	kfree(data);
> +}
> +
> +void avs_dsp_process_response(struct avs_dev *adev, u64 header)
> +{
> +	struct avs_ipc *ipc = adev->ipc;
> +
> +	if (avs_msg_is_reply(header)) {

the naming is confusing, it's difficult for me to understand that a
'response' could not be a 'reply'. The two terms are synonyms, aren't they?

> +		/* Response processing is invoked from IRQ thread. */
> +		spin_lock_irq(&ipc->rx_lock);
> +		avs_dsp_receive_rx(adev, header);
> +		ipc->rx_completed = true;
> +		spin_unlock_irq(&ipc->rx_lock);
> +	} else {
> +		avs_dsp_process_notification(adev, header);
> +	}
> +
> +	complete(&ipc->busy_completion);
> +}
> +
> +irqreturn_t avs_dsp_irq_handler(int irq, void *dev_id)
> +{
> +	struct avs_dev *adev = dev_id;
> +	struct avs_ipc *ipc = adev->ipc;
> +	const struct avs_spec *const spec = adev->spec;
> +	u32 adspis, hipc_rsp, hipc_ack;
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	adspis = snd_hdac_adsp_readl(adev, AVS_ADSP_REG_ADSPIS);
> +	if (adspis == UINT_MAX || !(adspis & AVS_ADSP_ADSPIS_IPC))
> +		return ret;
> +
> +	hipc_ack = snd_hdac_adsp_readl(adev, spec->hipc_ack_offset);
> +	hipc_rsp = snd_hdac_adsp_readl(adev, spec->hipc_rsp_offset);
> +
> +	/* DSP acked host's request */
> +	if (hipc_ack & spec->hipc_ack_done_mask) {
> +		/* mask done interrupt */
> +		snd_hdac_adsp_updatel(adev, spec->hipc_ctl_offset,
> +				      AVS_ADSP_HIPCCTL_DONE, 0);
> +
> +		complete(&ipc->done_completion);
> +
> +		/* tell DSP it has our attention */
> +		snd_hdac_adsp_updatel(adev, spec->hipc_ack_offset,
> +				      spec->hipc_ack_done_mask,
> +				      spec->hipc_ack_done_mask);
> +		/* unmask done interrupt */
> +		snd_hdac_adsp_updatel(adev, spec->hipc_ctl_offset,
> +				      AVS_ADSP_HIPCCTL_DONE,
> +				      AVS_ADSP_HIPCCTL_DONE);

does the order between the complete() and the next two register updates
matter?

I would have updated the registers immediately and signal the completion
later.

I am also not sure why it's necessary to mask the done interrupt then
unmask it. There is nothing that seems to require this masking?

Or are you expecting the code blocked on wait_for_completion to be
handled with interrupts masked, which could be quite racy?

> +		ret = IRQ_HANDLED;
> +	}
> +
> +	/* DSP sent new response to process */
> +	if (hipc_rsp & spec->hipc_rsp_busy_mask) {
> +		/* mask busy interrupt */
> +		snd_hdac_adsp_updatel(adev, spec->hipc_ctl_offset,
> +				      AVS_ADSP_HIPCCTL_BUSY, 0);
> +
> +		ret = IRQ_WAKE_THREAD;
> +	}
> +
> +	return ret;
> +}

> +static int avs_ipc_wait_busy_completion(struct avs_ipc *ipc, int timeout)
> +{
> +	int ret;
> +
> +again:
> +	ret = wait_for_completion_timeout(&ipc->busy_completion,
> +					  msecs_to_jiffies(timeout));
> +	/*
> +	 * DSP could be unresponsive at this point e.g. manifested by
> +	 * EXCEPTION_CAUGHT notification. If so, no point in continuing.

EXCEPTION_CAUGHT doesn't seem to be described in this patchset, so not
sure what this comment might mean.

> +	 */
> +	if (!ipc->ready)
> +		return -EPERM;
> +
> +	if (!ret) {
> +		if (!avs_ipc_is_busy(ipc))
> +			return -ETIMEDOUT;
> +		/*
> +		 * Firmware did its job, either notification or reply
> +		 * has been received - now wait until it's processed.
> +		 */
> +		wait_for_completion_killable(&ipc->busy_completion);

can you elaborate on why wait_for_completion() is not enough? I haven't
seen the 'killable' attribute been used by anyone in sound/

> +	}
> +
> +	/* Ongoing notification's bottom-half may cause early wakeup */
> +	spin_lock(&ipc->rx_lock);
> +	if (!ipc->rx_completed) {
> +		/* Reply delayed due to notification. */
> +		reinit_completion(&ipc->busy_completion);
> +		spin_unlock(&ipc->rx_lock);
> +		goto again;

shouldn't there be some counter to avoid potential infinite loops here?

> +	}
> +
> +	spin_unlock(&ipc->rx_lock);
> +	return 0;
> +}

> +static int avs_dsp_do_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request,
> +			       struct avs_ipc_msg *reply, int timeout)
> +{
> +	struct avs_ipc *ipc = adev->ipc;
> +	int ret;
> +
> +	if (!ipc->ready)
> +		return -EPERM;
> +
> +	mutex_lock(&ipc->msg_mutex);
> +
> +	spin_lock(&ipc->rx_lock);
> +	avs_ipc_msg_init(ipc, reply);
> +	avs_dsp_send_tx(adev, request);
> +	spin_unlock(&ipc->rx_lock);
> +
> +	ret = avs_ipc_wait_busy_completion(ipc, timeout);
> +	if (ret) {
> +		if (ret == -ETIMEDOUT) {
> +			dev_crit(adev->dev, "communication severed: %d, rebooting dsp..\n",
> +				 ret);

dev_crit() seems over the top if there is a recovery mechanism

> +
> +			avs_ipc_block(ipc);
> +		}
> +		goto exit;
> +	}
> +
> +	ret = ipc->rx.rsp.status;
> +	if (reply) {
> +		reply->header = ipc->rx.header;
> +		if (reply->data && ipc->rx.size)
> +			memcpy(reply->data, ipc->rx.data, reply->size);
> +	}
> +
> +exit:
> +	mutex_unlock(&ipc->msg_mutex);
> +	return ret;
> +}
> +
> +static int avs_dsp_send_msg_sequence(struct avs_dev *adev,
> +				     struct avs_ipc_msg *request,
> +				     struct avs_ipc_msg *reply, int timeout,
> +				     bool wake_d0i0, bool schedule_d0ix)

the last two arguments are not used. is this intentional?

> +{
> +	return avs_dsp_do_send_msg(adev, request, reply, timeout);
> +}
> +
> +int avs_dsp_send_msg_timeout(struct avs_dev *adev, struct avs_ipc_msg *request,
> +			     struct avs_ipc_msg *reply, int timeout)
> +{
> +	return avs_dsp_send_msg_sequence(adev, request, reply, timeout,
> +					 false, false);
> +}
> +
> +int avs_dsp_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request,
> +		     struct avs_ipc_msg *reply)
> +{
> +	return avs_dsp_send_msg_timeout(adev, request, reply,
> +					adev->ipc->default_timeout_ms);
> +}

is there really a 4-level nesting in your helpers?

avs_dsp_send_msg
  avs_dsp_send_msg_timeout
     avs_dsp_send_msg_sequence
           avs_dsp_do_send_msg

this seems complicated, no?

At the very least you should explain what a message and message sequence
are, and why this is split this way.

> +
> +int avs_dsp_send_pm_msg_timeout(struct avs_dev *adev,
> +				struct avs_ipc_msg *request,
> +				struct avs_ipc_msg *reply, int timeout,
> +				bool wake_d0i0)
> +{
> +	return avs_dsp_send_msg_sequence(adev, request, reply, timeout,
> +					 wake_d0i0, false);
> +}

so the 'pm' means 'wake-d0i0'? that's far from intuitive.

avs_dsp_send_d0i0_msg_timeout() would better describe what you are
trying to do.

In addition you need an explanation that d0i0 is a *firmware* concept
without direct links to the *device* Dx status.

> +int avs_dsp_send_pm_msg(struct avs_dev *adev,
> +			struct avs_ipc_msg *request,
> +			struct avs_ipc_msg *reply, bool wake_d0i0)
> +{
> +	return avs_dsp_send_pm_msg_timeout(adev, request, reply,
> +					   adev->ipc->default_timeout_ms,
> +					   wake_d0i0);
> +}

> +void avs_dsp_interrupt_control(struct avs_dev *adev, bool enable)
> +{
> +	const struct avs_spec *const spec = adev->spec;
> +	u32 value;
> +
> +	value = enable ? AVS_ADSP_ADSPIC_IPC : 0;
> +	snd_hdac_adsp_updatel(adev, AVS_ADSP_REG_ADSPIC,
> +			      AVS_ADSP_ADSPIC_IPC, value);
> +
> +	value = enable ? AVS_ADSP_HIPCCTL_DONE : 0;
> +	snd_hdac_adsp_updatel(adev, spec->hipc_ctl_offset,
> +			      AVS_ADSP_HIPCCTL_DONE, value);
> +
> +	value = enable ? AVS_ADSP_HIPCCTL_BUSY : 0;
> +	snd_hdac_adsp_updatel(adev, spec->hipc_ctl_offset,
> +			      AVS_ADSP_HIPCCTL_BUSY, value);

does the order matter? please add a comment.


