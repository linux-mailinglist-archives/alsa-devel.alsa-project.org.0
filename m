Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F25965E47
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 12:15:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9B24B71;
	Fri, 30 Aug 2024 12:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9B24B71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725012925;
	bh=HrgdFRv+lXfslsvbcAXp5fBoNUyY1o8RZhx3C1do6Qk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fq3e7SwcTha6bMdJcwHr5DNouf2bY5NJuyAp0G3OnIBouII8Tjj09bR/ifs28mjhG
	 gXr0RJQKPx9ZsqtX5NYDZSWcuHN5fz/wf1ctUE5EPpB8J3JqIJEh/D4H4bXsKwf4l8
	 OWN8GW+gVAsw7GzqdS2JtVuh+WXC8pHmF/jOMYXQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C10BF80717; Fri, 30 Aug 2024 12:12:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18FEEF80713;
	Fri, 30 Aug 2024 12:12:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF0D8F8060A; Fri, 30 Aug 2024 12:12:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D915BF805D3
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 12:12:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D915BF805D3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IcVo+YfU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012766; x=1756548766;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HrgdFRv+lXfslsvbcAXp5fBoNUyY1o8RZhx3C1do6Qk=;
  b=IcVo+YfUsV31UE8MXafk0Z7NNf8rzZOP9bXMa5/7RzXB30POEkZ5JrlM
   fAjvly/1NG9krtWMHFL7lK2coiUPrFRBxW3Zbr7+9u+GVAXn7H29y94W4
   4l9Pz1QyAmUTiAGMTRQR35SJx/Tpf52D6r+3bYkf/XqD7Pfw3YanvJlHK
   cz5kUIj1VO/d0L5bSy/GSDyNlm+QyFWdghGYJ0qY982UENWBKhQi0DcfT
   VNPh+EyN5dgXq4kAAPKzHK59dGxujhniHL9FMlUAcVvV5NL5iQd+lDb/Q
   UAyiN5eDJuy6NPp+JEP7kBcIU+eqK6VhexsRQBXl04hLI+6Sz8USu/lJe
   g==;
X-CSE-ConnectionGUID: Vr9HUTAgTQec7qLNVfP8Dw==
X-CSE-MsgGUID: 4jWqt3VBTfWN/cOi2MkX8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218916"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="34218916"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:12:45 -0700
X-CSE-ConnectionGUID: J6GSR4NpT1qMEUGftZCY8Q==
X-CSE-MsgGUID: dJ64kR0dS4GsEAj7TzWY6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="63481807"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101])
 ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:12:38 -0700
Message-ID: <87b06b92-8e58-414d-ba53-db7c88ac525a@linux.intel.com>
Date: Fri, 30 Aug 2024 11:34:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 23/33] ASoC: qcom: qdsp6: Fetch USB offload mapped
 card and PCM device
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, robh@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
 <20240829194105.1504814-24-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-24-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UKKY65V3E3IIS4DGRPT32HUSDDS64P2I
X-Message-ID-Hash: UKKY65V3E3IIS4DGRPT32HUSDDS64P2I
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UKKY65V3E3IIS4DGRPT32HUSDDS64P2I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/29/24 21:40, Wesley Cheng wrote:
> The USB SND path may need to know how the USB offload path is routed, so
> that applications can open the proper sound card and PCM device.  The
> implementation for the QC ASoC design has a "USB Mixer" kcontrol for each
> possible FE (Q6ASM) DAI, which can be utilized to know which front end link
> is enabled.
> 
> When an application/userspace queries for the mapped offload devices, the
> logic will lookup the USB mixer status though the following path:
> 
> MultiMedia* <-> MM_DL* <-> USB Mixer*
> 
> The "USB Mixer" is a DAPM widget, and the q6routing entity will set the
> DAPM connect status accordingly if the USB mixer is enabled.  If enabled,
> the Q6USB backend link can fetch the PCM device number from the FE DAI
> link (Multimedia*).  With respects to the card number, that is
> straightforward, as the ASoC components have direct references to the ASoC
> platform sound card.
> 
> An example output can be shown below:
> 
> Number of controls: 9
> name                                    value
> Capture Channel Map                     0, 0 (range 0->36)
> Playback Channel Map                    0, 0 (range 0->36)
> Headset Capture Switch                  On
> Headset Capture Volume                  1 (range 0->4)
> Sidetone Playback Switch                On
> Sidetone Playback Volume                4096 (range 0->8192)
> Headset Playback Switch                 On
> Headset Playback Volume                 20, 20 (range 0->24)
> USB Offload Playback Route PCM#0        0, 1 (range -1->255)
> 
> The "USB Offload Playback Route PCM#*" kcontrol will signify the
> corresponding card and pcm device it is offload to. (card#0 pcm - device#1)
> If the USB SND device supports multiple audio interfaces, then it will
> contain several PCM streams, hence in those situations, it is expected
> that there will be multiple playback route kcontrols created.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/soc/qcom/qdsp6/q6usb.c | 104 +++++++++++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
> index 10337d70eb27..c2fc0dedf430 100644
> --- a/sound/soc/qcom/qdsp6/q6usb.c
> +++ b/sound/soc/qcom/qdsp6/q6usb.c
> @@ -132,6 +132,109 @@ static int q6usb_audio_ports_of_xlate_dai_name(struct snd_soc_component *compone
>  	return ret;
>  }
>  
> +static int q6usb_get_pcm_id_from_widget(struct snd_soc_dapm_widget *w)
> +{
> +	struct snd_soc_pcm_runtime *rtd;
> +	struct snd_soc_dai *dai;
> +
> +	for_each_card_rtds(w->dapm->card, rtd) {
> +		dai = snd_soc_rtd_to_cpu(rtd, 0);
> +		/*
> +		 * Only look for playback widget. RTD number carries the assigned
> +		 * PCM index.
> +		 */
> +		if (dai->stream[0].widget == w)
> +			return rtd->num;
> +	}
> +
> +	return -1;
> +}
> +
> +static int q6usb_usb_mixer_enabled(struct snd_soc_dapm_widget *w)
> +{
> +	struct snd_soc_dapm_path *p;
> +
> +	/* Checks to ensure USB path is enabled/connected */
> +	snd_soc_dapm_widget_for_each_sink_path(w, p)
> +		if (!strcmp(p->sink->name, "USB Mixer") && p->connect)
> +			return 1;
> +
> +	return 0;
> +}
> +
> +static int q6usb_get_pcm_id(struct snd_soc_component *component)
> +{
> +	struct snd_soc_dapm_widget *w;
> +	struct snd_soc_dapm_path *p;
> +	int pidx;
> +
> +	/*
> +	 * Traverse widgets to find corresponding FE widget.  The DAI links are
> +	 * built like the following:
> +	 *    MultiMedia* <-> MM_DL* <-> USB Mixer*
> +	 */
> +	for_each_card_widgets(component->card, w) {
> +		if (!strncmp(w->name, "MultiMedia", 10)) {
> +			/*
> +			 * Look up all paths associated with the FE widget to see if
> +			 * the USB BE is enabled.  The sink widget is responsible to
> +			 * link with the USB mixers.
> +			 */
> +			snd_soc_dapm_widget_for_each_sink_path(w, p) {
> +				if (q6usb_usb_mixer_enabled(p->sink)) {
> +					pidx = q6usb_get_pcm_id_from_widget(w);
> +					return pidx;
> +				}
> +			}

Humm, there should be a note that the design assumes that the USB
offload path exposes a single PCM per endpoints - same as the
non-offloaded path. If the ASoC card has multiple PCMs for each
endpoint, possibly with different processing on each PCM, then the
mapping would fail.

The other question is whether you need to walk in the DAPM graph, in
theory DPCM has helpers to find which FEs are connected to which BE.

