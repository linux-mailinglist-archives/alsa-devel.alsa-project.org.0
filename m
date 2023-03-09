Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DED6B2C6B
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 18:56:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45D83189C;
	Thu,  9 Mar 2023 18:55:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45D83189C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678384572;
	bh=6MXUOHdjb8jqVok5oVRdfSDjvQDcZ3pm1AVfycFxb3w=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PdJKFo8EN5pKHVEYBXaSUgo7bRoLz8R7ir9M0MOK4Mpr8mZ5QlrNwLUzrBn6oPShc
	 mq3YVPf8aFOSS6aar/F2Dukfd+5AFNb/B5xJRHXLjuA8XzOKf4VSOJQAmGKXW+kmjV
	 tn+mBp0G3NXHIKxffoeEaGV1D1hS5ZJRomIVA0FU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D852F80236;
	Thu,  9 Mar 2023 18:55:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E8A2F8042F; Thu,  9 Mar 2023 18:55:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABAF5F80093
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 18:55:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABAF5F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=I9BealP4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678384501; x=1709920501;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6MXUOHdjb8jqVok5oVRdfSDjvQDcZ3pm1AVfycFxb3w=;
  b=I9BealP4435ydc6L91tC2ISsOsxWx8c1QL74vQKcpnB8z76BZcnd0QwW
   +PVt+7FIB9B9SKcZJgvtk7t6M2d4HuYiIAVm7EP/6zatRzd89gverP25x
   eaCCNUFKB8YshCzxvNYOw7/jFo5SNNcPSE6gxSmRdPUjHEzQ1UTPCju2F
   zeGROhFyru4Q3mSedfgK+PRoKTS8HHwNjRhTvIIiNTRIOWIptSiLS8dey
   yQnOsiaui2JHGVSMaAxkpTGBobTuwGN/EpXzDznil7neJEhS96AFaF8DM
   F6jpeVSOPg1knfk2PLGcjBeskufOPGhiQH8yRrsy1/+idA2LRSnao5WjR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="316911789"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400";
   d="scan'208";a="316911789"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 09:54:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="851583472"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400";
   d="scan'208";a="851583472"
Received: from hamannjo-mobl1.amr.corp.intel.com (HELO [10.255.34.234])
 ([10.255.34.234])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 09:54:52 -0800
Message-ID: <e4a49852-8753-d82e-ee86-866825a26844@linux.intel.com>
Date: Thu, 9 Mar 2023 11:54:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH v3 15/28] sound: usb: Introduce QC USB SND offloading
 support
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, broonie@kernel.org,
 lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, andersson@kernel.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, tiwai@suse.com
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-16-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230308235751.495-16-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 774MAO5F3D2PA5DDORKTXVHBTYPUYSMR
X-Message-ID-Hash: 774MAO5F3D2PA5DDORKTXVHBTYPUYSMR
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/774MAO5F3D2PA5DDORKTXVHBTYPUYSMR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +config QC_USB_AUDIO_OFFLOAD
> +	tristate "Qualcomm Audio Offload driver"

"Qualcomm USB Audio Offload driver"

> +	select SND_PCM

depends on SND_USB_AUDIO ?

> +	help
> +	  Say Y here to enable the Qualcomm USB audio offloading feature
> +
> +	  This module sets up the required QMI stream enable/disable
> +	  responses to requests generated by the audio DSP.  It passes the
> +	  USB transfer resource references, so that the audio DSP can issue
> +	  USB transfers to the host controller.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called qc-audio-offload.

> +#include <linux/ctype.h>
> +#include <linux/moduleparam.h>
> +#include <linux/module.h>
> +#include <linux/usb.h>
> +#include <linux/init.h>

alphabetical order?

> +#include <linux/usb/hcd.h>
> +#include <linux/usb/xhci-intr.h>
> +#include <linux/usb/quirks.h>
> +#include <linux/usb/audio.h>
> +#include <linux/usb/audio-v2.h>
> +#include <linux/usb/audio-v3.h>
> +#include <linux/soc/qcom/qmi.h>
> +#include <linux/iommu.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/dma-map-ops.h>
> +#include <sound/q6usboffload.h>
> +
> +#include <sound/control.h>
> +#include <sound/core.h>
> +#include <sound/info.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/initval.h>
> +
> +#include <sound/soc.h>
> +#include <sound/soc-usb.h>
> +#include "../usbaudio.h"
> +#include "../card.h"
> +#include "../midi.h"
> +#include "../mixer.h"
> +#include "../proc.h"
> +#include "../quirks.h"
> +#include "../endpoint.h"
> +#include "../helper.h"
> +#include "../pcm.h"
> +#include "../format.h"
> +#include "../power.h"
> +#include "../stream.h"
> +#include "../media.h"

this looks weird, are all these needed?

> +
> +#define SND_PCM_CARD_NUM_MASK 0xffff0000
> +#define SND_PCM_DEV_NUM_MASK 0xff00
> +#define SND_PCM_STREAM_DIRECTION 0xff

The prefix looks wrong, or it duplicates SND_PCM stuff?

> +
> +/* iommu resource parameters and management */
> +#define PREPEND_SID_TO_IOVA(iova, sid) ((u64)(((u64)(iova)) | \
> +					(((u64)sid) << 32)))
> +#define IOVA_BASE 0x1000
> +#define IOVA_XFER_RING_BASE (IOVA_BASE + PAGE_SIZE * (SNDRV_CARDS + 1))
> +#define IOVA_XFER_BUF_BASE (IOVA_XFER_RING_BASE + PAGE_SIZE * SNDRV_CARDS * 32)
> +#define IOVA_XFER_RING_MAX (IOVA_XFER_BUF_BASE - PAGE_SIZE)
> +#define IOVA_XFER_BUF_MAX (0xfffff000 - PAGE_SIZE)
> +
> +#define MAX_XFER_BUFF_LEN (24 * PAGE_SIZE)
> +
> +struct iova_info {
> +	struct list_head list;
> +	unsigned long start_iova;
> +	size_t size;
> +	bool in_use;
> +};
> +
> +struct intf_info {
> +	unsigned long data_xfer_ring_va;
> +	size_t data_xfer_ring_size;
> +	unsigned long sync_xfer_ring_va;
> +	size_t sync_xfer_ring_size;
> +	unsigned long xfer_buf_va;
> +	size_t xfer_buf_size;
> +	phys_addr_t xfer_buf_pa;
> +	unsigned int data_ep_pipe;
> +	unsigned int sync_ep_pipe;
> +	u8 *xfer_buf;
> +	u8 intf_num;
> +	u8 pcm_card_num;
> +	u8 pcm_dev_num;
> +	u8 direction;
> +	bool in_use;
> +};
> +
> +struct uaudio_qmi_dev {
> +	struct device *dev;
> +	u32 sid;
> +	u32 intr_num;
> +	struct xhci_interrupter *ir;
> +	struct xhci_ring *sec_ring;
> +	struct iommu_domain *domain;
> +
> +	/* list to keep track of available iova */
> +	struct list_head xfer_ring_list;
> +	size_t xfer_ring_iova_size;
> +	unsigned long curr_xfer_ring_iova;
> +	struct list_head xfer_buf_list;
> +	size_t xfer_buf_iova_size;
> +	unsigned long curr_xfer_buf_iova;
> +
> +	/* bit fields representing pcm card enabled */
> +	unsigned long card_slot;
> +	/* indicate event ring mapped or not */
> +	bool er_mapped;
> +	/* reference count to number of possible consumers */
> +	atomic_t qdev_in_use;
> +	/* idx to last udev card number plugged in */
> +	unsigned int last_card_num;
> +};
> +
> +struct uaudio_dev {
> +	struct usb_device *udev;
> +	/* audio control interface */
> +	struct usb_host_interface *ctrl_intf;
> +	unsigned int card_num;
> +	unsigned int usb_core_id;
> +	atomic_t in_use;
> +	struct kref kref;
> +	wait_queue_head_t disconnect_wq;
> +
> +	/* interface specific */
> +	int num_intf;
> +	struct intf_info *info;
> +	struct snd_usb_audio *chip;
> +};

This looks too detailed, isnt' that a duplication of other structures
that exist in the regular USB audio part?

There's nothing that looks QCOM-specific anyways.

> +
> +static struct uaudio_dev uadev[SNDRV_CARDS];
> +static struct uaudio_qmi_dev *uaudio_qdev;
> +static struct uaudio_qmi_svc *uaudio_svc;
> +static DEFINE_MUTEX(qdev_mutex);
> +
> +struct uaudio_qmi_svc {
> +	struct qmi_handle *uaudio_svc_hdl;
> +	struct work_struct qmi_disconnect_work;
> +	struct workqueue_struct *uaudio_wq;
> +	struct sockaddr_qrtr client_sq;
> +	bool client_connected;
> +};
> +
> +enum mem_type {
> +	MEM_EVENT_RING,
> +	MEM_XFER_RING,
> +	MEM_XFER_BUF,
> +};

prefixes better than 'MEM'?

> +
> +/* Supported audio formats */
> +enum usb_qmi_audio_format {
> +	USB_QMI_PCM_FORMAT_S8 = 0,
> +	USB_QMI_PCM_FORMAT_U8,
> +	USB_QMI_PCM_FORMAT_S16_LE,
> +	USB_QMI_PCM_FORMAT_S16_BE,
> +	USB_QMI_PCM_FORMAT_U16_LE,
> +	USB_QMI_PCM_FORMAT_U16_BE,
> +	USB_QMI_PCM_FORMAT_S24_LE,
> +	USB_QMI_PCM_FORMAT_S24_BE,
> +	USB_QMI_PCM_FORMAT_U24_LE,
> +	USB_QMI_PCM_FORMAT_U24_BE,
> +	USB_QMI_PCM_FORMAT_S24_3LE,
> +	USB_QMI_PCM_FORMAT_S24_3BE,
> +	USB_QMI_PCM_FORMAT_U24_3LE,
> +	USB_QMI_PCM_FORMAT_U24_3BE,
> +	USB_QMI_PCM_FORMAT_S32_LE,
> +	USB_QMI_PCM_FORMAT_S32_BE,
> +	USB_QMI_PCM_FORMAT_U32_LE,
> +	USB_QMI_PCM_FORMAT_U32_BE,
> +};
> +
> +static enum usb_audio_device_speed_enum_v01
> +get_speed_info(enum usb_device_speed udev_speed)
> +{
> +	switch (udev_speed) {
> +	case USB_SPEED_LOW:
> +		return USB_AUDIO_DEVICE_SPEED_LOW_V01;
> +	case USB_SPEED_FULL:
> +		return USB_AUDIO_DEVICE_SPEED_FULL_V01;
> +	case USB_SPEED_HIGH:
> +		return USB_AUDIO_DEVICE_SPEED_HIGH_V01;
> +	case USB_SPEED_SUPER:
> +		return USB_AUDIO_DEVICE_SPEED_SUPER_V01;
> +	case USB_SPEED_SUPER_PLUS:
> +		return USB_AUDIO_DEVICE_SPEED_SUPER_PLUS_V01;
> +	default:
> +		return USB_AUDIO_DEVICE_SPEED_INVALID_V01;
> +	}
> +}

this doesn't look qcom-specific, why is this here?

> +
> +static struct snd_usb_substream *find_substream(unsigned int card_num,
> +	unsigned int pcm_idx, unsigned int direction)
> +{
> +	struct snd_usb_stream *as;
> +	struct snd_usb_substream *subs = NULL;
> +	struct snd_usb_audio *chip;
> +
> +	chip = uadev[card_num].chip;
> +	if (!chip || atomic_read(&chip->shutdown))
> +		goto done;
> +
> +	if (pcm_idx >= chip->pcm_devs)
> +		goto done;
> +
> +	if (direction > SNDRV_PCM_STREAM_CAPTURE)
> +		goto done;
> +
> +	list_for_each_entry(as, &chip->pcm_list, list) {
> +		if (as->pcm_index == pcm_idx) {
> +			subs = &as->substream[direction];
> +			goto done;
> +		}
> +	}
> +
> +done:
> +	return subs;
> +}
> +
> +static int info_idx_from_ifnum(int card_num, int intf_num, bool enable)
> +{
> +	int i;
> +
> +	/*
> +	 * default index 0 is used when info is allocated upon
> +	 * first enable audio stream req for a pcm device
> +	 */
> +	if (enable && !uadev[card_num].info)
> +		return 0;
> +
> +	for (i = 0; i < uadev[card_num].num_intf; i++) {
> +		if (enable && !uadev[card_num].info[i].in_use)
> +			return i;
> +		else if (!enable &&
> +				uadev[card_num].info[i].intf_num == intf_num)
> +			return i;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int get_data_interval_from_si(struct snd_usb_substream *subs,
> +	u32 service_interval)
> +{
> +	unsigned int bus_intval, bus_intval_mult, binterval;
> +
> +	if (subs->dev->speed >= USB_SPEED_HIGH)
> +		bus_intval = BUS_INTERVAL_HIGHSPEED_AND_ABOVE;
> +	else
> +		bus_intval = BUS_INTERVAL_FULL_SPEED;
> +
> +	if (service_interval % bus_intval)
> +		return -EINVAL;
> +
> +	bus_intval_mult = service_interval / bus_intval;
> +	binterval = ffs(bus_intval_mult);
> +	if (!binterval || binterval > MAX_BINTERVAL_ISOC_EP)
> +		return -EINVAL;
> +
> +	/* check if another bit is set then bail out */
> +	bus_intval_mult = bus_intval_mult >> binterval;
> +	if (bus_intval_mult)
> +		return -EINVAL;
> +
> +	return (binterval - 1);
> +}

this doesn't look qcom-specific either, is this a set of helpers that
need to be moved somewhere else?


> +/**
> + * disable_audio_stream() - disable usb snd endpoints
> + * @subs: usb substream
> + *
> + * Closes the USB SND endpoints associated with the current audio stream
> + * used.  This will decrement the USB SND endpoint opened reference count.
> + *
> + */
> +static void disable_audio_stream(struct snd_usb_substream *subs)
> +{
> +	struct snd_usb_audio *chip = subs->stream->chip;
> +
> +	if (subs->data_endpoint || subs->sync_endpoint) {
> +		close_endpoints(chip, subs);
> +
> +		mutex_lock(&chip->mutex);
> +		subs->cur_audiofmt = NULL;
> +		mutex_unlock(&chip->mutex);
> +	}
> +
> +	snd_usb_autosuspend(chip);
> +}

also not qcom-specific?

> +/* kref release callback when all streams are disabled */

what does "all streams disabled" mean, and when does this happen?

> +static void uaudio_dev_release(struct kref *kref)
> +{
> +	struct uaudio_dev *dev = container_of(kref, struct uaudio_dev, kref);
> +
> +	uaudio_event_ring_cleanup_free(dev);
> +	atomic_set(&dev->in_use, 0);
> +	wake_up(&dev->disconnect_wq);
> +}


> +static int __init qc_usb_audio_offload_init(void)
> +{
> +	struct uaudio_qmi_svc *svc;
> +	int ret;
> +
> +	ret = snd_usb_register_platform_ops(&offload_ops);
> +	if (ret < 0)
> +		return ret;

so what happens if snd_usb is blacklisted or takes time to probe?

This seems to assume a timing dependency when USB is initialized/probed
first?

> +
> +	svc = kzalloc(sizeof(struct uaudio_qmi_svc), GFP_KERNEL);
> +	if (!svc) {
> +		ret = -ENOMEM;
> +		goto unreg_ops;
> +	}
> +
> +	svc->uaudio_wq = create_singlethread_workqueue("uaudio_svc");
> +	if (!svc->uaudio_wq) {
> +		ret = -ENOMEM;
> +		goto free_svc;
> +	}
> +
> +	svc->uaudio_svc_hdl = kzalloc(sizeof(struct qmi_handle), GFP_KERNEL);
> +	if (!svc->uaudio_svc_hdl) {
> +		ret = -ENOMEM;
> +		goto free_wq;
> +	}
> +
> +	ret = qmi_handle_init(svc->uaudio_svc_hdl,
> +				QMI_UAUDIO_STREAM_REQ_MSG_V01_MAX_MSG_LEN,
> +				&uaudio_svc_ops_options,
> +				&uaudio_stream_req_handlers);
> +	ret = qmi_add_server(svc->uaudio_svc_hdl, UAUDIO_STREAM_SERVICE_ID_V01,
> +					UAUDIO_STREAM_SERVICE_VERS_V01, 0);
> +
> +	INIT_WORK(&svc->qmi_disconnect_work, qmi_disconnect_work);
> +	uaudio_svc = svc;
> +
> +	return 0;
> +
> +free_wq:
> +	destroy_workqueue(svc->uaudio_wq);
> +free_svc:
> +	kfree(svc);
> +unreg_ops:
> +	snd_usb_unregister_platform_ops();
> +
> +	return ret;
> +}
> +
> +static void __exit qc_usb_audio_offload_exit(void)
> +{
> +	struct uaudio_qmi_svc *svc = uaudio_svc;
> +
> +	qmi_handle_release(svc->uaudio_svc_hdl);
> +	flush_workqueue(svc->uaudio_wq);
> +	destroy_workqueue(svc->uaudio_wq);
> +	kfree(svc);
> +	uaudio_svc = NULL;
> +	snd_usb_unregister_platform_ops();
> +}
> +
> +module_init(qc_usb_audio_offload_init);
> +module_exit(qc_usb_audio_offload_exit);

what causes this module to be loaded?

> +
> +MODULE_DESCRIPTION("QC USB Audio Offloading");
> +MODULE_LICENSE("GPL");
> diff --git a/sound/usb/qcom/usb_audio_qmi_v01.c b/sound/usb/qcom/usb_audio_qmi_v01.c
> new file mode 100644
> index 000000000000..1a0f2f579786
> --- /dev/null
> +++ b/sound/usb/qcom/usb_audio_qmi_v01.c
> @@ -0,0 +1,892 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/soc/qcom/qmi.h>
> +
> +#include "usb_audio_qmi_v01.h"
> +
> +static struct qmi_elem_info mem_info_v01_ei[] = {
> +	{
> +		.data_type	= QMI_UNSIGNED_8_BYTE,
> +		.elem_len	= 1,
> +		.elem_size	= sizeof(u64),
> +		.array_type	= NO_ARRAY,
> +		.tlv_type	= 0,
> +		.offset		= offsetof(struct mem_info_v01, va),
> +	},

maybe move these arrays to a different patch that we don't need to
scroll-through or review...

> +	{
> +		.data_type	= QMI_UNSIGNED_8_BYTE,
> +		.elem_len	= 1,
> +		.elem_size	= sizeof(u64),
> +		.array_type	= NO_ARRAY,
> +		.tlv_type	= 0,
> +		.offset		= offsetof(struct mem_info_v01, pa),
> +	},
> +	{
> +		.data_type	= QMI_UNSIGNED_4_BYTE,
> +		.elem_len	= 1,
> +		.elem_size	= sizeof(u32),
> +		.array_type	= NO_ARRAY,
> +		.tlv_type	= 0,
> +		.offset		= offsetof(struct mem_info_v01, size),
> +	},
> +	{
> +		.data_type	= QMI_EOTI,
> +		.array_type	= NO_ARRAY,
> +		.tlv_type	= QMI_COMMON_TLV_TYPE,
> +	},
> +};

