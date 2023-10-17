Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6277CD0BA
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 01:26:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62420E0D;
	Wed, 18 Oct 2023 01:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62420E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697585212;
	bh=0FJzvTVerGtzjb/XtkA0Zjwjnc3FkHsgF3DnNB3GZGY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GMqVz1CclJfpjhVgH91jmeRtbdmQO//gI1MxFmwabGYt+D/PuX2m/1cMBcuBfxNOR
	 +0spxrh5OHfz5LFJJZNBCqOpDgMvItVcuwGM6NJ2YjbicBF0JqBdvRz+t6RMepHn7G
	 WA4/dLesn0lQI6f2Wkye80ZiL863W7MsZui+ysEE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29446F805E6; Wed, 18 Oct 2023 01:23:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AC99F805E2;
	Wed, 18 Oct 2023 01:23:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8590DF805AE; Wed, 18 Oct 2023 01:23:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33095F8056F
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 01:23:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33095F8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=euq6I7M7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697585009; x=1729121009;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0FJzvTVerGtzjb/XtkA0Zjwjnc3FkHsgF3DnNB3GZGY=;
  b=euq6I7M7iWWPgpolu5rL3/uAOTD39dB9Iw2V3+bRMqGNvzAmLWK4gJh+
   HCKEKOZkvTdmMtJIvG5KKES5X3jW0vEuwzCD5B5tnMg3QQeaRZ9ZOYt2l
   +gl2nHyvI6qPoxintWdxKb390qaBhl/9vZ2JknuRKwwMEq1EzB6hLp//t
   jSqDZMNx4DKyjLuF29Hh/+MKS9KVobRLaZrzzHETSUmO4SdB4HFwLk8v5
   CG1QDGpAZL9+GX40apzc5kQ+yE51kfhjrS3qjTqJvkTqXLv0BH0gedeVb
   43G/3/+hELuCSthPEcNN8/GejHt1SNu7KrNfpsEYjB0flh12pChxykZ2G
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384778195"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="384778195"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826637499"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="826637499"
Received: from asprado-mobl2.amr.corp.intel.com (HELO [10.212.55.179])
 ([10.212.55.179])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:26 -0700
Message-ID: <d218b8e2-d7b9-40a3-bfb3-da6a90404a8c@linux.intel.com>
Date: Tue, 17 Oct 2023 17:50:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 29/34] ASoC: qcom: qdsp6: Add SND kcontrol to select
 offload device
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20231017200109.11407-1-quic_wcheng@quicinc.com>
 <20231017200109.11407-30-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231017200109.11407-30-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FC2DTMHGSVMVN227VKEGVFLGZ6JNHIT4
X-Message-ID-Hash: FC2DTMHGSVMVN227VKEGVFLGZ6JNHIT4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FC2DTMHGSVMVN227VKEGVFLGZ6JNHIT4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/17/23 15:01, Wesley Cheng wrote:
> Expose a kcontrol on the platform sound card, which will allow for
> userspace to determine which USB card number and PCM device to offload.
> This allows for userspace to potentially tag an alternate path for a
> specific USB SND card and PCM device.  Previously, control was absent, and
> the offload path would be enabled on the last USB SND device which was
> connected.  This logic will continue to be applicable if no mixer input is
> received for specific device selection.
> 
> An example to configure the offload device using tinymix:
> tinymix -D 0 set 'Q6USB offload SND device select' 1 0
> 
> The above will set the Q6AFE device token to choose offload on card#1 and
> pcm#0.  Device selection is made possible by setting the Q6AFE device
> token.  The audio DSP utilizes this parameter, and will pass this field
> back to the USB offload driver within the QMI stream requests.

This still begs the question on how userspace would figure what the
card1 is and which endpoint is used when PCM0 is opened?

Ideally userpace would not have to know anything about "Q6USB".
Presumably when other vendors expose their USB offload solution, we
would want a generic control name, no?

Jaroslav should chime in on this one :-)


> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/soc/qcom/qdsp6/q6usb.c | 125 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 122 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
> index d697cbe7f184..a95276b7d91d 100644
> --- a/sound/soc/qcom/qdsp6/q6usb.c
> +++ b/sound/soc/qcom/qdsp6/q6usb.c
> @@ -14,6 +14,7 @@
>  #include <linux/dma-map-ops.h>
>  
>  #include <sound/pcm.h>
> +#include <sound/control.h>
>  #include <sound/soc.h>
>  #include <sound/soc-usb.h>
>  #include <sound/pcm_params.h>
> @@ -35,9 +36,12 @@ struct q6usb_port_data {
>  	struct q6afe_usb_cfg usb_cfg;
>  	struct snd_soc_usb *usb;
>  	struct q6usb_offload priv;
> +	struct mutex mutex;

missing comment on what this protects. "mutex" is really a poor
choice/name if I am honest.

>  	unsigned long available_card_slot;
>  	struct q6usb_status status[SNDRV_CARDS];
> -	int active_idx;
> +	bool idx_valid;
> +	int sel_card_idx;
> +	int sel_pcm_idx;
>  };

> +/* Build a mixer control for a UAC connector control (jack-detect) */
> +static void q6usb_connector_control_init(struct snd_soc_component *component)
> +{
> +	int ret;
> +
> +	ret = snd_ctl_add(component->card->snd_card,
> +				snd_ctl_new1(&q6usb_offload_dev_ctrl, component));
> +	if (ret < 0)
> +		return;

that error handling does not seem terribly useful...

> +}
> +
>  static int q6usb_audio_ports_of_xlate_dai_name(struct snd_soc_component *component,
>  					const struct of_phandle_args *args,
>  					const char **dai_name)
> @@ -115,9 +227,11 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
>  
>  	data = dev_get_drvdata(usb->component->dev);
>  
> +	mutex_lock(&data->mutex);
>  	if (connected) {
>  		/* We only track the latest USB headset plugged in */
> -		data->active_idx = sdev->card_idx;
> +		if (!data->idx_valid || data->sel_card_idx < 0)
> +			data->sel_card_idx = sdev->card_idx;
>  
>  		set_bit(sdev->card_idx, &data->available_card_slot);
>  		data->status[sdev->card_idx].num_pcm = sdev->num_playback;
> @@ -127,6 +241,7 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
>  		data->status[sdev->card_idx].num_pcm = 0;
>  		data->status[sdev->card_idx].chip_index = 0;
>  	}
> +	mutex_unlock(&data->mutex);
>  
>  	return 0;
>  }
> @@ -135,6 +250,8 @@ static int q6usb_component_probe(struct snd_soc_component *component)
>  {
>  	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
>  
> +	q6usb_connector_control_init(component);
> +
>  	data->usb = snd_soc_usb_add_port(component->dev, &data->priv, q6usb_alsa_connection_cb);
>  	if (IS_ERR(data->usb)) {
>  		dev_err(component->dev, "failed to add usb port\n");
> @@ -189,6 +306,8 @@ static int q6usb_dai_dev_probe(struct platform_device *pdev)
>  
>  	data->priv.domain = iommu_get_domain_for_dev(&pdev->dev);
>  
> +	mutex_init(&data->mutex);
> +
>  	data->priv.dev = dev;
>  	dev_set_drvdata(dev, data);
>  
