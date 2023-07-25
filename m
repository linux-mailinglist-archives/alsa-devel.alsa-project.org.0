Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB727760E64
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 11:20:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC9DDEC6;
	Tue, 25 Jul 2023 11:20:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC9DDEC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690276854;
	bh=3ftlTnZLDKGNw8f2OS/kJtQKY7p+STDvyqbF9dlRCEA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kxHJ685a60ZszQ5jtRTyNg1F/x7wzRttUEPCW0C5HvMGxl5+LtZSVbt+H4dzrW8oH
	 NNknDKWFaZ4Lab/aXB1U8uNyhVhHSd4GYSkVP53azd7tJXFDHyLMJ4wa6TqdXHanY+
	 GjNPI9kUvpueDDeNjpW5QvB2CsmQijux+1ELx5nU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 091C1F805A0; Tue, 25 Jul 2023 11:19:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82A17F80589;
	Tue, 25 Jul 2023 11:19:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E259F80589; Tue, 25 Jul 2023 11:19:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CBBCF802E8
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 11:19:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CBBCF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fdtx1UcB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690276752; x=1721812752;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3ftlTnZLDKGNw8f2OS/kJtQKY7p+STDvyqbF9dlRCEA=;
  b=fdtx1UcBh0xcivDQKAtm+UVpZwcSee9xBwBeAAX6PpNhA38ilr0TrZVd
   YxFyO6WtThK0Z56c/wB6J2kRlRp6CJYrYVFLL7FMwZ0OHZAXA2F2ML2sI
   TLCTV+LQSa4EJYYpE0rf/ax3T//3PjLhI/GiHRrt+7dlpdeM4GMuQVpI1
   anhsH86ZneLLZYOjnR457omI12Tr+8gAumcKNoPPM9+o/wBNSrg6mBjWK
   MqH6cm+KwfzXxvNTtMXJuzeKs9+Adwe2HRnuttMKO4aNMJpr6CgvJp7UG
   9OV4UDo51jjvseTHsfs5Swa9a6Iv8TDFK7Lfoo4QywaYegCuP2sklvQgW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="367690999"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200";
   d="scan'208";a="367690999"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 02:19:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="719980480"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200";
   d="scan'208";a="719980480"
Received: from mongola-mobl.ger.corp.intel.com (HELO [10.249.37.129])
 ([10.249.37.129])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 02:18:58 -0700
Message-ID: <987394fd-9724-aa42-37fe-be9707565405@linux.intel.com>
Date: Tue, 25 Jul 2023 11:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v4 29/32] sound: soc: qcom: q6usb: Add headphone jack for
 offload connection status
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_jackp@quicinc.com, oneukum@suse.com, albertccwang@google.com,
 o-takashi@sakamocchi.jp
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
 <20230725023416.11205-30-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230725023416.11205-30-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LNRAYK637DXRL7GS23PKYF2A3454634U
X-Message-ID-Hash: LNRAYK637DXRL7GS23PKYF2A3454634U
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LNRAYK637DXRL7GS23PKYF2A3454634U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/25/23 04:34, Wesley Cheng wrote:
> The headphone jack framework has a well defined intrastructure for

infrastructure

> notifying userspace entities through input devices.  Expose a jack device
> that carries information about if an offload capable device is connected.
> Applications can further identify specific offloading information through
> other SND kcontrols.

What if you connect a set of USB speakers? Would they show as a
headphone/headset?

> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/soc/qcom/qdsp6/q6usb.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
> index e4ccb9d912b0..860dff8c1438 100644
> --- a/sound/soc/qcom/qdsp6/q6usb.c
> +++ b/sound/soc/qcom/qdsp6/q6usb.c
> @@ -20,6 +20,7 @@
>  #include <sound/pcm_params.h>
>  #include <sound/asound.h>
>  #include <sound/q6usboffload.h>
> +#include <sound/jack.h>
>  
>  #include "q6dsp-lpass-ports.h"
>  #include "q6afe.h"
> @@ -37,6 +38,7 @@ struct q6usb_status {
>  struct q6usb_port_data {
>  	struct q6afe_usb_cfg usb_cfg;
>  	struct snd_soc_usb *usb;
> +	struct snd_soc_jack hs_jack;
>  	struct q6usb_offload priv;
>  	struct mutex mutex;
>  	unsigned long available_card_slot;
> @@ -279,6 +281,7 @@ static const struct snd_kcontrol_new q6usb_offload_control = {
>  /* Build a mixer control for a UAC connector control (jack-detect) */
>  static void q6usb_connector_control_init(struct snd_soc_component *component)
>  {
> +	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
>  	int ret;
>  
>  	ret = snd_ctl_add(component->card->snd_card,
> @@ -290,6 +293,11 @@ static void q6usb_connector_control_init(struct snd_soc_component *component)
>  				snd_ctl_new1(&q6usb_offload_dev_ctrl, component));
>  	if (ret < 0)
>  		return;
> +
> +	ret = snd_soc_card_jack_new(component->card, "USB offload",
> +					SND_JACK_HEADSET, &data->hs_jack);

not all USB devices are headsets...

> +	if (ret)
> +		return;
>  }
>  
>  static int q6usb_audio_ports_of_xlate_dai_name(struct snd_soc_component *component,
> @@ -322,7 +330,10 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb, int card_idx,
>  
>  	mutex_lock(&data->mutex);
>  	if (connected) {
> -		snd_soc_dapm_enable_pin(dapm, "USB_RX_BE");
> +		if (!data->available_card_slot) {
> +			snd_soc_dapm_enable_pin(dapm, "USB_RX_BE");
> +			snd_jack_report(data->hs_jack.jack, 1);
> +		}
>  		/*
>  		 * Update the latest USB headset plugged in, if session is
>  		 * idle.
> @@ -338,8 +349,10 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb, int card_idx,
>  		clear_bit(card_idx, &data->available_card_slot);
>  		data->status[card_idx].num_pcm = 0;
>  		data->status[card_idx].chip_index = 0;
> -		if (!data->available_card_slot)
> +		if (!data->available_card_slot) {
>  			snd_soc_dapm_disable_pin(dapm, "USB_RX_BE");
> +			snd_jack_report(data->hs_jack.jack, 0);
> +		}
>  	}
>  	snd_soc_dapm_sync(dapm);
>  	mutex_unlock(&data->mutex);
