Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 770784CD8A4
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 17:10:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11264188A;
	Fri,  4 Mar 2022 17:10:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11264188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646410252;
	bh=YdbwaqKQ/Xkj+9qRee++belZlx/I90ulMTHoLDok1gk=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e/8Ig3VWcFnLwgHHeBPc0kISmqGPbiZT45dk83rbCGBIp3noG8oVJC2fqJF3FXodi
	 lWAVN+OUfhjz2ph83XL85OZVlnZ2C+yQCndlWaPJRO9u8TFcY1PNFVzfwqTV/g0LOM
	 hBi8JoYF+aOyZj61HHA+C/OPDKk/k5BnW0bq8CUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7902EF801F5;
	Fri,  4 Mar 2022 17:09:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56F64F801EC; Fri,  4 Mar 2022 17:09:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 906ACF800FA
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 17:09:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 906ACF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kZTmnjo2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646410175; x=1677946175;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YdbwaqKQ/Xkj+9qRee++belZlx/I90ulMTHoLDok1gk=;
 b=kZTmnjo2naOpMfQe2ddloLD6nwsru4XFYEtkdxrwDrZLvLnfjlzlPHUZ
 jrrJRStnbsgNgXvIlnIK2iRjr2WSI6w6gVvui/UAAB36soSn6nlJlxKlI
 yFDmUeUzDavITZMw87AkR2K+YM+ybiBAPmHBmWSFM4JVtYjge8/p1x3Ur
 QOLkoP1Bq0ghE8C/1ZtrtJ1lXkD6SpKbPCo/srM0fCjhjUSDIzD6LzQM+
 yjMwkAlIOqSACKQJF0KjsCjJ9OMOE6jdlRprzmsa/auFc4knMWHCkEUGL
 NLB6Eskq4qJsU8NZEcotEo5LA+NLjVOvm5EYb+RB8+LB27VgOgwcypDUy Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="241427523"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="241427523"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 08:09:26 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="552270887"
Received: from srstocke-mobl.amr.corp.intel.com ([10.251.130.3])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 08:09:25 -0800
Message-ID: <3a4bd57f06b9dddca6b7726c462bd0ccaaa508ff.camel@linux.intel.com>
Subject: Re: [PATCH v3 04/17] ASoC: Intel: avs: Inter process communication
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
Date: Fri, 04 Mar 2022 08:09:25 -0800
In-Reply-To: <20220304145755.2844173-5-cezary.rojewski@intel.com>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-5-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
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

On Fri, 2022-03-04 at 15:57 +0100, Cezary Rojewski wrote:
> Implement the IPC between Intel audio firmware and kernel driver. The
> IPC allows transmission of requests, handling of responses as well as
> unsolicited (i.e. firmware-generated) notifications.
> 
> A subscription mechanism is added to enable different parts of the
> driver to register for specific notifications.
> 
> The part of the DSP boot process that involves sending ROM message
> requires an extra step - must be followed by unstall operation of
> MAIN_CORE. All other types of messages do not require such specific
> handling, so separate set of functions is provided for sending these.
> 
> Signed-off-by: Amadeusz Sławiński <
> amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/avs/Makefile    |   2 +-
>  sound/soc/intel/avs/avs.h       | 100 +++++++++
>  sound/soc/intel/avs/ipc.c       | 387
> ++++++++++++++++++++++++++++++++
>  sound/soc/intel/avs/messages.h  | 170 ++++++++++++++
>  sound/soc/intel/avs/registers.h |  45 ++++
>  5 files changed, 703 insertions(+), 1 deletion(-)
>  create mode 100644 sound/soc/intel/avs/ipc.c
>  create mode 100644 sound/soc/intel/avs/messages.h
> 
> diff --git a/sound/soc/intel/avs/Makefile
> b/sound/soc/intel/avs/Makefile
> index 5f7976a95fe2..e243806dd38a 100644
> --- a/sound/soc/intel/avs/Makefile
> +++ b/sound/soc/intel/avs/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> -snd-soc-avs-objs := dsp.o
> +snd-soc-avs-objs := dsp.o ipc.o
>  
>  obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
> diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
> index d4e6310e4bf7..841b8541b101 100644
> --- a/sound/soc/intel/avs/avs.h
> +++ b/sound/soc/intel/avs/avs.h
> @@ -11,13 +11,27 @@
>  
>  #include <linux/device.h>
>  #include <sound/hda_codec.h>
> +#include "messages.h"
>  
>  struct avs_dev;
>  
> +/*
> + * struct avs_dsp_ops - Platform-specific DSP operations
> + *
> + * @power: Power on or off DSP cores
> + * @reset: Enter or exit reset state on DSP cores
> + * @stall: Stall or run DSP cores
> + * @irq_handler: Top half of IPC servicing
> + * @irq_thread: Bottom half of IPC servicing
> + * @int_control: Enable or disable IPC interrupts
> + */
>  struct avs_dsp_ops {
>  	int (* const power)(struct avs_dev *, u32, bool);
>  	int (* const reset)(struct avs_dev *, u32, bool);
>  	int (* const stall)(struct avs_dev *, u32, bool);
> +	irqreturn_t (* const irq_handler)(int, void *);
> +	irqreturn_t (* const irq_thread)(int, void *);
> +	void (* const int_control)(struct avs_dev *, bool);
>  };
>  
>  #define avs_dsp_op(adev, op, ...) \
> @@ -34,6 +48,9 @@ struct avs_spec {
>  
>  	const u32 core_init_mask;	/* used during DSP boot */
>  	const u64 attributes;		/* bitmask of AVS_PLATATTR_*
> */
> +	const u32 sram_base_offset;
> +	const u32 sram_window_size;
> +	const u32 rom_status;
>  };
>  
>  /*
> @@ -49,6 +66,9 @@ struct avs_dev {
>  
>  	void __iomem *dsp_ba;
>  	const struct avs_spec *spec;
> +	struct avs_ipc *ipc;
> +
> +	struct completion fw_ready;
>  };
>  
>  /* from hda_bus to avs_dev */
> @@ -68,4 +88,84 @@ int avs_dsp_core_stall(struct avs_dev *adev, u32
> core_mask, bool stall);
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
> +/*
> + * struct avs_ipc - DSP IPC context
> + *
> + * @dev: PCI device
> + * @rx: Reply message cache
> + * @default_timeout_ms: default message timeout in MS
> + * @ready: whether firmware is ready and communication is open
> + * @rx_completed: whether RX for previously sent TX has been
> received
> + * @rx_lock: for serializating manipulation of rx_* fields
> + * @msg_lock: for synchronizing request handling
> + * @done_completion: DONE-part of IPC i.e. ROM and ACKs from FW
> + * @busy_completion: BUSY-part of IPC i.e. receiving responses from
> FW
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
> +/*
> + * IPC handlers may return positive value (firmware error code) what
> denotes
> + * successful HOST <-> DSP communication yet failure to process
> specific request.
> + *
> + * Below macro converts returned value to linux kernel error code.
> + * All IPC callers MUST use it as soon as firmware error code is
> consumed.
> + */
> +#define AVS_IPC_RET(ret) \
> +	(((ret) <= 0) ? (ret) : -AVS_EIPC)
> +
> +static inline void avs_ipc_err(struct avs_dev *adev, struct
> avs_ipc_msg *tx,
> +			       const char *name, int error)
> +{
> +	/*
> +	 * If IPC channel is blocked e.g.: due to ongoing recovery,
Do you mean firmware recovery? In which cases do you perform a
recovery?
> +	 * -EPERM error code is expected and thus it's not an actual
> error.
And what happens in this case? do you retry the IPC after recovery?
> +	 */
> +	if (error == -EPERM)
> +		dev_dbg(adev->dev, "%s 0x%08x 0x%08x failed: %d\n",
> name,
> +			tx->glb.primary, tx->glb.ext.val, error);
> +	else
> +		dev_err(adev->dev, "%s 0x%08x 0x%08x failed: %d\n",
> name,
> +			tx->glb.primary, tx->glb.ext.val, error);
> +}
> +
> +irqreturn_t avs_dsp_irq_handler(int irq, void *dev_id);
> +irqreturn_t avs_dsp_irq_thread(int irq, void *dev_id);
> +void avs_dsp_process_response(struct avs_dev *adev, u64 header);
> +int avs_dsp_send_msg_timeout(struct avs_dev *adev,
> +			     struct avs_ipc_msg *request,
> +			     struct avs_ipc_msg *reply, int timeout);
> +int avs_dsp_send_msg(struct avs_dev *adev,
> +		     struct avs_ipc_msg *request, struct avs_ipc_msg
> *reply);
> +int avs_dsp_send_rom_msg_timeout(struct avs_dev *adev,
> +				 struct avs_ipc_msg *request, int
> timeout);
> +int avs_dsp_send_rom_msg(struct avs_dev *adev, struct avs_ipc_msg
> *request);
> +void avs_dsp_interrupt_control(struct avs_dev *adev, bool enable);
> +int avs_ipc_init(struct avs_ipc *ipc, struct device *dev);
> +void avs_ipc_block(struct avs_ipc *ipc);
> +
>  #endif /* __SOUND_SOC_INTEL_AVS_H */
> diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
> new file mode 100644
> index 000000000000..c0722f8b195f
> --- /dev/null
> +++ b/sound/soc/intel/avs/ipc.c
> @@ -0,0 +1,387 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright(c) 2021 Intel Corporation. All rights reserved.
> +//
> +// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
> +//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
> +//
> +
> +#include <linux/slab.h>
> +#include <sound/hdaudio_ext.h>
> +#include "avs.h"
> +#include "messages.h"
> +#include "registers.h"
> +
> +#define AVS_IPC_TIMEOUT_MS	300
> +
> +static void avs_dsp_receive_rx(struct avs_dev *adev, u64 header)
> +{
> +	struct avs_ipc *ipc = adev->ipc;
> +	union avs_reply_msg msg = AVS_MSG(header);
> +
> +	ipc->rx.header = header;
> +	/* Abort copying payload if request processing was
> unsuccessful. */
This seems misplaced? Why would you called this function is the status
showed an error?

> +	if (!msg.status)
> +		memcpy_fromio(ipc->rx.data, avs_uplink_addr(adev),
> +			      ipc->rx.size);
> +}
> +
> +static void avs_dsp_process_notification(struct avs_dev *adev, u64
> header)
> +{
> +	struct avs_notify_mod_data mod_data;
> +	union avs_notify_msg msg = AVS_MSG(header);
> +	size_t data_size = 0;
> +	void *data = NULL;
> +
> +	/* Ignore spurious notifications until handshake is
> established. */
> +	if (!adev->ipc->ready && msg.notify_msg_type !=
> AVS_NOTIFY_FW_READY) {
> +		dev_dbg(adev->dev, "FW not ready, skip notification:
> 0x%08x\n",
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
> +		/* To know the total payload size, header needs to be
> read first. */
> +		memcpy_fromio(&mod_data, avs_uplink_addr(adev),
> sizeof(mod_data));
> +		data_size = sizeof(mod_data) + mod_data.data_size;
> +		break;
> +
> +	default:
> +		dev_info(adev->dev, "unknown notification: 0x%08x\n",
> +			 msg.primary);
info? should it be a warning?
> +		break;
> +	}
> +
> +	if (data_size) {
> +		data = kmalloc(data_size, GFP_KERNEL);
> +		if (!data)
> +			return;
Should this function be modified to return the error? If it failed
here, all subsequent IPC's rec'd will also fail isnt it?
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
You alloc memory for "data", copy the data and free it? Where is it
used?
> +}
> +
> +void avs_dsp_process_response(struct avs_dev *adev, u64 header)
> +{
> +	struct avs_ipc *ipc = adev->ipc;
> +
> +	/*
> +	 * Response may either be solicited - a reply for a request
> that has
> +	 * been sent beforehand - or unsolicited (notification).
> +	 */
> +	if (avs_msg_is_reply(header)) {
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
> +	u32 adspis, hipc_rsp, hipc_ack;
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	adspis = snd_hdac_adsp_readl(adev, AVS_ADSP_REG_ADSPIS);
> +	if (adspis == UINT_MAX || !(adspis & AVS_ADSP_ADSPIS_IPC))
> +		return ret;
> +
> +	hipc_ack = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCIE);
> +	hipc_rsp = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCT);
> +
> +	/* DSP acked host's request */
> +	if (hipc_ack & SKL_ADSP_HIPCIE_DONE) {
> +		/*
> +		 * As an extra precaution, mask done interrupt. Code
> executed
> +		 * due to complete() found below does not assume any
> masking.
> +		 */
> +		snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCCTL,
> +				      AVS_ADSP_HIPCCTL_DONE, 0);
> +
> +		complete(&ipc->done_completion);
> +
> +		/* tell DSP it has our attention */
> +		snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCIE,
> +				      SKL_ADSP_HIPCIE_DONE,
> +				      SKL_ADSP_HIPCIE_DONE);
> +		/* unmask done interrupt */
> +		snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCCTL,
> +				      AVS_ADSP_HIPCCTL_DONE,
> +				      AVS_ADSP_HIPCCTL_DONE);
> +		ret = IRQ_HANDLED;
> +	}
> +
> +	/* DSP sent new response to process */
> +	if (hipc_rsp & SKL_ADSP_HIPCT_BUSY) {
> +		/* mask busy interrupt */
> +		snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCCTL,
> +				      AVS_ADSP_HIPCCTL_BUSY, 0);
> +
> +		ret = IRQ_WAKE_THREAD;
> +	}
> +
> +	return ret;
> +}
> +
> +irqreturn_t avs_dsp_irq_thread(int irq, void *dev_id)
> +{
> +	struct avs_dev *adev = dev_id;
> +	union avs_reply_msg msg;
> +	u32 hipct, hipcte;
> +
> +	hipct = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCT);
> +	hipcte = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCTE);
> +
> +	/* ensure DSP sent new response to process */
> +	if (!(hipct & SKL_ADSP_HIPCT_BUSY))
> +		return IRQ_NONE;
> +
> +	msg.primary = hipct;
> +	msg.ext.val = hipcte;
> +	avs_dsp_process_response(adev, msg.val);
> +
> +	/* tell DSP we accepted its message */
> +	snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCT,
> +			      SKL_ADSP_HIPCT_BUSY,
> SKL_ADSP_HIPCT_BUSY);
> +	/* unmask busy interrupt */
> +	snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCCTL,
> +			      AVS_ADSP_HIPCCTL_BUSY,
> AVS_ADSP_HIPCCTL_BUSY);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static bool avs_ipc_is_busy(struct avs_ipc *ipc)
> +{
> +	struct avs_dev *adev = to_avs_dev(ipc->dev);
> +	u32 hipc_rsp;
> +
> +	hipc_rsp = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCT);
> +	return hipc_rsp & SKL_ADSP_HIPCT_BUSY;
> +}
> +
> +static int avs_ipc_wait_busy_completion(struct avs_ipc *ipc, int
> timeout)
> +{
> +	u32 repeats_left = 128; /* to avoid infinite looping */
> +	int ret;
> +
> +again:
> +	ret = wait_for_completion_timeout(&ipc->busy_completion,
> +					  msecs_to_jiffies(timeout));
> +
> +	/* DSP could be unresponsive at this point. */
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
> +	}
> +
> +	/* Ongoing notification's bottom-half may cause early wakeup */
> +	spin_lock(&ipc->rx_lock);
> +	if (!ipc->rx_completed) {
> +		if (repeats_left) {
> +			/* Reply delayed due to notification. */
> +			repeats_left--;
> +			reinit_completion(&ipc->busy_completion);
> +			spin_unlock(&ipc->rx_lock);
> +			goto again;
> +		}
> +
> +		spin_unlock(&ipc->rx_lock);
> +		return -ETIMEDOUT;
> +	}
> +
> +	spin_unlock(&ipc->rx_lock);
> +	return 0;
> +}
> +
> +static void avs_ipc_msg_init(struct avs_ipc *ipc, struct avs_ipc_msg
> *reply)
> +{
> +	lockdep_assert_held(&ipc->rx_lock);
> +
> +	ipc->rx.header = 0;
> +	ipc->rx.size = reply ? reply->size : 0;
> +	ipc->rx_completed = false;
> +
> +	reinit_completion(&ipc->done_completion);
> +	reinit_completion(&ipc->busy_completion);
> +}
> +
> +static void avs_dsp_send_tx(struct avs_dev *adev, struct avs_ipc_msg
> *tx)
send_tx? send and tx both imply the same isnt it? maybe just use one or
the other?
> +{
> +	tx->header |= SKL_ADSP_HIPCI_BUSY;
> +
> +	if (tx->size)
> +		memcpy_toio(avs_downlink_addr(adev), tx->data, tx-
> >size);
> +	snd_hdac_adsp_writel(adev, SKL_ADSP_REG_HIPCIE, tx->header >>
> 32);
> +	snd_hdac_adsp_writel(adev, SKL_ADSP_REG_HIPCI, tx->header &
> UINT_MAX);
> +}
> +
> +static int avs_dsp_do_send_msg(struct avs_dev *adev, struct
> avs_ipc_msg *request,
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
> +			dev_crit(adev->dev, "communication severed: %d,
> rebooting dsp..\n",
Where does this reboot happen?
Thanks,
Ranjani

