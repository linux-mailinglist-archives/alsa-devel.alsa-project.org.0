Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F846959C2D
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2024 14:44:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E21D8829;
	Wed, 21 Aug 2024 14:44:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E21D8829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724244281;
	bh=AxCBDTEYfVQ9IsGSLpQotFqq9fcF1kvIuqMrhOPXuQI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E0W9r9CvvVhYrtMbJ76Y/z7SYnGnuS8gB8/xtoOVVyItQvbfwAG0alQoimpsPEhhH
	 te0giJFKJ4Fyzy0eo0S7j380gNZz+DLsci+zDGptPM9rtSksF4miTC97dk24AsPxKK
	 ZM9/zjMtRanu2wPr1P7JVJYHkqR5Fns/ecv7Dapk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C11AF805BB; Wed, 21 Aug 2024 14:44:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90259F805A8;
	Wed, 21 Aug 2024 14:44:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A448AF80496; Wed, 21 Aug 2024 14:43:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61150F800F0
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 14:43:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61150F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KLam8ShO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724244219; x=1755780219;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=AxCBDTEYfVQ9IsGSLpQotFqq9fcF1kvIuqMrhOPXuQI=;
  b=KLam8ShOhdpv/vMW9K2bSCHXgjoVRzynn2XNdW6HAxct1BvpGVTX5VCP
   X1Rg9VuWatKcn/7zwnUSBxtOjpMii98TnDS8dmvjfKn5TbQGBZLUYMf6d
   yLrYiSSTZiMz+uHHixYiRYHABIdTtWwWl1ZjDVMb3DIQM/Iu64Oo3TZLu
   KNAzuPlA9seIBM4ENum/ZDhg9+WXJbBiMrmb9NBObB76Fg/ziBhHkdBo2
   5w9Gnoj7/vzO3Ow14SdEescX0LqEZHcI7dhBDsoMqRv9/mYrr9OCdGtmA
   BSkAbf+EL627dIWRgp5+vDYr5tmxI7eTiPYgsCWVAY4V4ys9Pkr9VqJch
   w==;
X-CSE-ConnectionGUID: yMGPkW1ZRlSyW/xzZWm9Og==
X-CSE-MsgGUID: 3i0AQup4Rwa5nnw+PZQjXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22483553"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600";
   d="scan'208";a="22483553"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:43:33 -0700
X-CSE-ConnectionGUID: sPRhrjbuSlOAnuDBxyHZSQ==
X-CSE-MsgGUID: rF7m9vlpToSKbp1czvsHsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600";
   d="scan'208";a="65427863"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.16])
 ([10.245.246.16])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:43:30 -0700
Message-ID: <83f81553-6dfa-46a3-9ca2-d42f54295eb1@linux.intel.com>
Date: Wed, 21 Aug 2024 14:43:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] ASoC: Conditional PCM support
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, tiwai@suse.com,
 perex@perex.cz, amadeuszx.slawinski@linux.intel.com, hdegoede@redhat.com
References: <20240821101816.1494541-1-cezary.rojewski@intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240821101816.1494541-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4QIZRREFCW7DUSAUQVVLJUT3QDXGZH6K
X-Message-ID-Hash: 4QIZRREFCW7DUSAUQVVLJUT3QDXGZH6K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4QIZRREFCW7DUSAUQVVLJUT3QDXGZH6K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/21/24 12:18, Cezary Rojewski wrote:
> Conditional PCM (condpcm) helps facilitate modern audio usecases such as
> Echo Cancellations and Noise Reduction. These are not invoked by the
> means of userspace application opening an endpoint (FrontEnd) but are a
> "side effect" of selected PCMs running simultaneously e.g.: if both
> Speaker (source) and Microphone Array (sink) are running, reference
> data from the Speaker and take it into account when processing capture
> for better voice command detection ratio.

The point about dependencies between capture/playback usages is
certainly valid, and we've faced it multiple times for SOF - and even
before in the mobile phone days. I am not convinced however that the
graph management suggested here solves the well-known DPCM routing
problems? See notes in no specific order below.

I am not following what the 'source' and 'sink' concepts refer to in
this context. It looks like you are referring to regular PCM devices,
i.e. Front Ends in soc-pcm parlance but examples and code make
references to Back Ends.

There are also complicated cases where the amplifiers can provide an
echo reference for AEC and I/V sensing for speaker protection. You would
want to capture both even if there's no capture happening at the
userspace level. This is a well-know DPCM routing issue where we have to
rely on a Front-End being opened and some tags in UCM to deal with loose
coupling.

It would help if you added precisions on your assumptions of where the
processing takes place. In some cases Echo cancellation is handled in
userspace, others in SOC firmware and others externally in a codec.

The notion of source/sink is also problematic when the same BE provides
two sources of information that will be split, again same problem with
amplifier feedback being used for two separate functions. What happens
if you have multiple sinks for one source?

Same for the cases where the mic input is split multiple ways with
different processing added on different PCM capture devices, e.g. for
WebRTC there's an ask for a raw input, an AEC-processed input and
AEC+NS-processed input. That's typically implemented with two splitters,
 the echo reference would be used by an intermediate node inside a
firmware graph, not at the DAI/BE or host/FE levels, and such
intermediate nodes are usually not handled by soc-pcm. We really need
more than the notion of FE and BE, a two-layer solution is no longer
sufficient.

The other thing that looks weird is the dependency on both sink and
source sharing a common state. For a noise reduction there are cases
where you'd want the mic input to be stored in a history buffer so that
the noise parameters can be estimated as soon as the actual capture starts.

> Which PCMs are needed for given conditional PCM to be spawned is
> determinated by the driver when registering the condpcm.

Presumably such links should be described by a topology file? It would
be odd for a driver to have to guess when to connect processing elements.

> The functionality was initially proposed for the avs-driver [1] and,
> depending on feedback and review may either go back into avs -or- become
> a ASoC-core feature. Implementation present here is an example of how
> such functionality could look and work on the ASoC side. Compared to
> what was provided initially, the patch carries simplified version of the
> feature: no priority/overriding for already running conditional PCMs.
> Whatever is spawned is treated as a non-conflicting entity.
> 
> Assumptions and design decisions:
> 
> - existence and outcome of condpcm operations is entirely optional and
>   shall not impact the runtime flow of PCMs that spawned given condpcm,
>   e.g.: fail in cpcm->hw_params() shall not impact fe->hw_params() or
>   be->hw_params() negatively. Think of it as of debugfs. Useful? Yes.
>   Required for system to operate? No.

that's debatable, if the AEC setup isn't successful then is the
functionality implemented correctly? My take is no, don't fail silently
if the AEC doesn't work.

If this functionality is listed as a product requirement then it cannot
be treated as a debugfs optional thing.

Exhibit A for this is the countless cases where validation reported a
problem with a path remaining active or conversely not being setup, or a
voice quality issue. Those are not optional...

> - a condpcm is a runtime entity that's audio format independent - since
>   certain FE/BEs are its dependencies already, that's no need to do
>   format ruling twice. Driver may still do custom checks thanks to
>   ->match() operation.
> 
> - a condpcm allows for additional processing of data that flows from
>   data-source - a substream instance acting as data provider -
>   to sink - a substream acting as data consumer. At the same time,
>   regardless of substream->stream, given substream may act as data
>   source for one condpcm and data sink for another, simultaneously.
> 
> - while condpcm's behaviour mimics standard PCM one, there is no
>   ->open() and ->close() - FE/BEs are treated as operational starting
>   with successful ->hw_params(), when hw_ruling is done and hardware is
>   configured.
> 
> - cpcm->prepare() gets called only when both data source and sink are
>   prepared
> - cpcm->trigger(START) gets called only when both data source and sink
>   are running
> - cpcm->trigger(STOP) gets called when either data source or sink is
>   stopped
> 
> Simplified state machine:
> 
> 			     |
> 	register_condpcm()   |
> 			     v
> 			  +--+-------------+
> 			  |  DISCONNECTED  |<-+
> 			  +--+-------------+  |
> 			     |		      |
> 	condpcm_hw_params()  |		      |
> 			     v		      |
> 			  +--+-------------+  |
> 			  |     SETUP      |  |	condpcm_hw_free()
> 			  +--+-------------+  |
> 			     |		      |
> 	condpcm_prepare()    |		      |
> 			     v		      |
> 			  +--+----+--------+  |
> 			  |    PREPARED    |--+
> 			  +--+----------+--+
> 			     |          ^
> 	condpcm_start()	     |		|	condpcm_stop()
> 			     v		|
> 			  +--+----------+--+
> 			  |    RUNNING     |
> 			  +----------------+
> 
> What's missing?
> I've not covered the locking part yet. While some operations are covered
> by default thanks to snd_soc_dpcm_mutex(), it is insufficient.
> If feature goes back to the avs-driver, then I'm set due to path->mutex.
> 
> The locking is one of the reasons I'm leaning towards leaving the
> condpcm within the avs-driver. For soc_condpcm_find_match() to be
> precise and do no harm, a lock must prepend the list_for_each_entry().
> Entries (substreams) of that list may be part of number of different
> components and the search may negatively impact runtime flow of
> substreams that do not care about condpcms at all.
> 
> Has this been tested?
> 
> Unit-like only. Typical case below with avs_condpcm_ops representing
> bunch of stubs with printfs.
> 
> static struct snd_soc_condpcm_pred pred1 = {
> 	.card_name = "ssp0-loopback",
> 	.link_name = "SSP0-Codec",	/* BE */
> 	.direction = SNDRV_PCM_STREAM_PLAYBACK,
> };
> 
> static struct snd_soc_condpcm_pred pred2 = {
> 	.card_name = "hdaudioB0D2",
> 	.link_name = "HDMI1",		/* FE */
> 	.direction = SNDRV_PCM_STREAM_PLAYBACK,
> };

It's not intuitive to follow what HDMI and SSP might have to do with
each other, nor why one is a BE and one is an FE?

If I follow the code below, the SSP loopback is a source feeds into an
HDMI sink, and SSP is a BE and HDMI an FE? Confusing example...


> static void avs_condpcms_register(struct avs_dev *adev)
> {
> 	(...)
> 	snd_soc_register_condpcm(&pred1, &pred2, &avs_condpcm_ops, adev);
> }
> 
> [1]: https://lore.kernel.org/alsa-devel/20211208111301.1817725-21-cezary.rojewski@intel.com/
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  include/sound/pcm.h     |   1 +
>  include/sound/soc.h     |  65 ++++++++
>  sound/core/pcm.c        |   1 +
>  sound/soc/Makefile      |   2 +-
>  sound/soc/soc-condpcm.c | 348 ++++++++++++++++++++++++++++++++++++++++
>  sound/soc/soc-condpcm.h |  17 ++
>  sound/soc/soc-core.c    |   2 +
>  sound/soc/soc-pcm.c     |  11 ++
>  8 files changed, 446 insertions(+), 1 deletion(-)
>  create mode 100644 sound/soc/soc-condpcm.c
>  create mode 100644 sound/soc/soc-condpcm.h
> 
> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> index ac8f3aef9205..7e635b3103a2 100644
> --- a/include/sound/pcm.h
> +++ b/include/sound/pcm.h
> @@ -482,6 +482,7 @@ struct snd_pcm_substream {
>  	struct list_head link_list;	/* linked list member */
>  	struct snd_pcm_group self_group;	/* fake group for non linked substream (with substream lock inside) */
>  	struct snd_pcm_group *group;		/* pointer to current group */
> +	struct list_head cpcm_candidate_node;

It wouldn't hurt to describe what 'candidate' might mean here?

>  	/* -- assigned files -- */
>  	int ref_count;
>  	atomic_t mmap_count;
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index e844f6afc5b5..32a6b5092192 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -426,6 +426,7 @@ struct snd_jack;
>  struct snd_soc_card;
>  struct snd_soc_pcm_stream;
>  struct snd_soc_ops;
> +struct snd_soc_condpcm;
>  struct snd_soc_pcm_runtime;
>  struct snd_soc_dai;
>  struct snd_soc_dai_driver;
> @@ -1154,6 +1155,64 @@ struct snd_soc_card {
>  #define for_each_card_widgets_safe(card, w, _w)	\
>  	list_for_each_entry_safe(w, _w, &card->widgets, list)
>  
> +/* Conditional PCM operations called by soc-pcm.c. */
> +struct snd_soc_condpcm_ops {
> +	int (*match)(struct snd_soc_condpcm *, struct snd_pcm_substream *,
> +		     struct snd_pcm_substream *);
> +	int (*hw_params)(struct snd_soc_condpcm *, struct snd_pcm_hw_params *);
> +	int (*hw_free)(struct snd_soc_condpcm *);
> +	int (*prepare)(struct snd_soc_condpcm *, struct snd_pcm_substream *);
> +	int (*trigger)(struct snd_soc_condpcm *, struct snd_pcm_substream *, int);
> +};
> +
> +/**
> + * struct snd_soc_condpcm_pred - Predicate, describes source or sink (substream)
> + *                               dependency for given conditional PCM.
> + *
> + * @card_name: Name of card owning substream to find.
> + * @link_name: Name of DAI LINK owning substream to find.
> + * @direction: Whether its SNDRV_PCM_STREAM_PLAYBACK or CAPTURE.
> + */
> +struct snd_soc_condpcm_pred {
> +	const char *card_name;

Please tell me the runtimes and links are in the same card...
If not, there's all kinds of power management and probe/remove issues...

> +	const char *link_name;

dai link name?

> +	int direction;
> +};
> +
> +/**
> + * struct snd_soc_condpcm - Conditional PCM descriptor.
> + *
> + * @ops: custom PCM operations.
> + * @preds: predicates for identifying source and sink for given conditional PCM.

predicate is a verb and a noun, not clear what you are trying to document.

> + *
> + * @source: substreaming acting as a data source, assigned at runtime.
> + * @sink: substreaming acting as a data sink, assigned at runtime.
> + * @state: current runtime state.

presumably this state is already defined that the state of sink/source?

> + *
> + * @source_node: list navigation for rtd->source_list.
> + * @sink_node: list navigation for rtd->sink_list.
> + * @node: list navigation for condpcm_list (soc-condpcm.c).
> + */
> +struct snd_soc_condpcm {
> +	const struct snd_soc_condpcm_ops *ops;
> +	struct snd_soc_condpcm_pred preds[2];
> +
> +	struct snd_pcm_substream *source;
> +	struct snd_pcm_substream *sink;
> +	snd_pcm_state_t state;
> +	void *private_data;
> +
> +	/* Condpcms navigation for the pcm runtime. */
> +	struct list_head source_node;
> +	struct list_head sink_node;
> +	struct list_head node;
> +};
> +
> +int snd_soc_unregister_condpcm(struct snd_soc_condpcm *cpcm);
> +struct snd_soc_condpcm *snd_soc_register_condpcm(struct snd_soc_condpcm_pred *source,
> +						 struct snd_soc_condpcm_pred *sink,
> +						 const struct snd_soc_condpcm_ops *ops,
> +						 void *private_data);
>  
>  static inline int snd_soc_card_is_instantiated(struct snd_soc_card *card)
>  {
> @@ -1161,6 +1220,10 @@ static inline int snd_soc_card_is_instantiated(struct snd_soc_card *card)
>  }
>  
>  /* SoC machine DAI configuration, glues a codec and cpu DAI together */
> +/*
> + * @source_cpcm_list:   List of condpcms this pcm is source for.
> + * @sink_cpcm_list:     List of condpcms this pcm is sink for.
> + */
>  struct snd_soc_pcm_runtime {
>  	struct device *dev;
>  	struct snd_soc_card *card;
> @@ -1172,6 +1235,8 @@ struct snd_soc_pcm_runtime {
>  	/* Dynamic PCM BE runtime data */
>  	struct snd_soc_dpcm_runtime dpcm[SNDRV_PCM_STREAM_LAST + 1];
>  	struct snd_soc_dapm_widget *c2c_widget[SNDRV_PCM_STREAM_LAST + 1];
> +	struct list_head cpcm_source_list;
> +	struct list_head cpcm_sink_list;
>  
>  	long pmdown_time;
>  
> diff --git a/sound/core/pcm.c b/sound/core/pcm.c
> index dc37f3508dc7..12243cecaa11 100644
> --- a/sound/core/pcm.c
> +++ b/sound/core/pcm.c
> @@ -663,6 +663,7 @@ int snd_pcm_new_stream(struct snd_pcm *pcm, int stream, int substream_count)
>  		substream->pstr = pstr;
>  		substream->number = idx;
>  		substream->stream = stream;
> +		INIT_LIST_HEAD(&substream->cpcm_candidate_node);
>  		sprintf(substream->name, "subdevice #%i", idx);
>  		substream->buffer_bytes_max = UINT_MAX;
>  		if (prev == NULL)
> diff --git a/sound/soc/Makefile b/sound/soc/Makefile
> index 775bb38c2ed4..8004de7c500c 100644
> --- a/sound/soc/Makefile
> +++ b/sound/soc/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  snd-soc-core-y := soc-core.o soc-dapm.o soc-jack.o soc-utils.o soc-dai.o soc-component.o
> -snd-soc-core-y += soc-pcm.o soc-devres.o soc-ops.o soc-link.o soc-card.o
> +snd-soc-core-y += soc-pcm.o soc-devres.o soc-ops.o soc-link.o soc-card.o soc-condpcm.o
>  snd-soc-core-$(CONFIG_SND_SOC_COMPRESS) += soc-compress.o
>  
>  ifneq ($(CONFIG_SND_SOC_TOPOLOGY),)
> diff --git a/sound/soc/soc-condpcm.c b/sound/soc/soc-condpcm.c
> new file mode 100644
> index 000000000000..786b3fafd714
> --- /dev/null
> +++ b/sound/soc/soc-condpcm.c
> @@ -0,0 +1,348 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Conditional-PCM management
> +//
> +// Copyright(c) 2024 Intel Corporation
> +//
> +// Author: Cezary Rojewski <cezary.rojewski@intel.com>
> +//
> +
> +#include <linux/export.h>
> +#include <linux/list.h>
> +#include <linux/slab.h>
> +#include <sound/pcm.h>
> +#include <sound/soc.h>
> +#include "soc-condpcm.h"
> +
> +/*
> + * condpcm_list - Stores all registered conditional pcms.
> + * condpcm_candidate_list - Stores all substreams that passed hw_params() step.
> + */
> +static LIST_HEAD(condpcm_list);
> +static LIST_HEAD(condpcm_candidate_list);
> +
> +static bool dpcm_prepare_done(const struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	enum snd_soc_dpcm_state state = rtd->dpcm[substream->stream].state;
> +
> +	return state == SND_SOC_DPCM_STATE_PREPARE ||
> +	       state == SND_SOC_DPCM_STATE_START ||
> +	       state == SND_SOC_DPCM_STATE_PAUSED;
> +}
> +
> +static bool dpcm_hw_params_done(const struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	enum snd_soc_dpcm_state state = rtd->dpcm[substream->stream].state;
> +
> +	return state >= SND_SOC_DPCM_STATE_HW_PARAMS &&
> +	       state < SND_SOC_DPCM_STATE_HW_FREE;
> +}
> +
> +static bool dpcm_start_done(const struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	enum snd_soc_dpcm_state state = rtd->dpcm[substream->stream].state;
> +
> +	return state == SND_SOC_DPCM_STATE_START ||
> +	       state == SND_SOC_DPCM_STATE_PAUSED;
> +}
> +
> +static int soc_condpcm_hw_params(struct snd_soc_condpcm *cpcm,
> +				 struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(cpcm->source);
> +	struct snd_soc_pcm_runtime *rtd2 = snd_soc_substream_to_rtd(cpcm->sink);

how are the 'params' defined?

I read above

"
a condpcm is a runtime entity that's audio format independent - since
certain FE/BEs are its dependencies already, that's no need to do
format ruling twice.
"

That doesn't tell us how this 'params' is determined. This is important
for cases where the speaker output is e.g. 2ch 48kHz and the mic input
is 4ch 96kHz. If this condpcm is not managed by any usersapce action,
then what is the logic for selecting the settings in 'params'?


> +	int ret;
> +
> +	ret = cpcm->ops->hw_params(cpcm, params);
> +	if (ret)
> +		return ret;
> +
> +	list_add_tail(&cpcm->source_node, &rtd->cpcm_source_list);
> +	list_add_tail(&cpcm->sink_node, &rtd2->cpcm_sink_list);
> +	cpcm->state = SNDRV_PCM_STATE_SETUP;
> +	return 0;
> +}

There's also the well-known problem that hw_params can be called
multiple times. Here  this wouldn't work with the same source/sink added
multiple times in a list.

> +
> +static void soc_condpcm_hw_free(struct snd_soc_condpcm *cpcm)
> +{
> +	cpcm->ops->hw_free(cpcm);
> +	list_del(&cpcm->source_node);
> +	list_del(&cpcm->sink_node);
> +	cpcm->state = SNDRV_PCM_STATE_DISCONNECTED;
> +}
> +
> +static void soc_condpcm_prepare(struct snd_soc_condpcm *cpcm,
> +				struct snd_pcm_substream *substream)
> +{
> +	int ret;
> +
> +	ret = cpcm->ops->prepare(cpcm, substream);
> +	if (!ret)
> +		cpcm->state = SNDRV_PCM_STATE_PREPARED;
> +}

you probably need to look at the xruns and resume cases, where prepare()
is used for vastly different purposes.

> +
> +static void soc_condpcm_start(struct snd_soc_condpcm *cpcm,
> +			      struct snd_pcm_substream *substream, int cmd)
> +{
> +	int ret;
> +
> +	ret = cpcm->ops->trigger(cpcm, substream, cmd);
> +	if (ret)
> +		cpcm->state = SNDRV_PCM_STATE_SETUP;
> +	else
> +		cpcm->state = SNDRV_PCM_STATE_RUNNING;
> +}
> +
> +static void soc_condpcm_stop(struct snd_soc_condpcm *cpcm,
> +			     struct snd_pcm_substream *substream, int cmd)
> +{
> +	int ret;
> +
> +	ret = cpcm->ops->trigger(cpcm, substream, cmd);
> +	if (ret || cmd != SNDRV_PCM_TRIGGER_PAUSE_PUSH)
> +		cpcm->state = SNDRV_PCM_STATE_SETUP;
> +	else
> +		cpcm->state = SNDRV_PCM_STATE_PREPARED;
> +}
> +
> +void snd_soc_condpcms_prepare(struct snd_soc_pcm_runtime *rtd,
> +			      struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_condpcm *cpcm;
> +
> +	/* Prepare conditional pcms only if source and sink are both preprared. */
> +	list_for_each_entry(cpcm, &rtd->cpcm_source_list, source_node) {
> +		if (cpcm->state == SNDRV_PCM_STATE_SETUP &&
> +		    dpcm_prepare_done(cpcm->sink))
> +			soc_condpcm_prepare(cpcm, substream);
> +	}
> +
> +	list_for_each_entry(cpcm, &rtd->cpcm_sink_list, sink_node) {
> +		if (cpcm->state == SNDRV_PCM_STATE_SETUP &&
> +		    dpcm_prepare_done(cpcm->source))
> +			soc_condpcm_prepare(cpcm, substream);
> +	}
> +}
> +
> +static void soc_condpcms_start(struct snd_soc_pcm_runtime *rtd,
> +			       struct snd_pcm_substream *substream, int cmd)
> +{
> +	struct snd_soc_condpcm *cpcm;
> +
> +	/* Start conditional pcms only if source and sink are both running. */
> +	list_for_each_entry(cpcm, &rtd->cpcm_source_list, source_node) {
> +		if (cpcm->state == SNDRV_PCM_STATE_PREPARED &&
> +		    dpcm_start_done(cpcm->sink))
> +			soc_condpcm_start(cpcm, substream, cmd);
> +	}
> +
> +	list_for_each_entry(cpcm, &rtd->cpcm_sink_list, sink_node) {
> +		if (cpcm->state == SNDRV_PCM_STATE_PREPARED &&
> +		    dpcm_start_done(cpcm->source))
> +			soc_condpcm_start(cpcm, substream, cmd);
> +	}
> +}
> +
> +static void soc_condpcms_stop(struct snd_soc_pcm_runtime *rtd,
> +			      struct snd_pcm_substream *substream, int cmd)
> +{
> +	struct snd_soc_condpcm *cpcm;
> +
> +	/* Stop conditional pcms if either source or sink is not running. */
> +	list_for_each_entry(cpcm, &rtd->cpcm_source_list, source_node)
> +		if (cpcm->state == SNDRV_PCM_STATE_RUNNING)
> +			soc_condpcm_stop(cpcm, substream, cmd);
> +
> +	list_for_each_entry(cpcm, &rtd->cpcm_sink_list, sink_node)
> +		if (cpcm->state == SNDRV_PCM_STATE_RUNNING)
> +			soc_condpcm_stop(cpcm, substream, cmd);
> +}
> +
> +void snd_soc_condpcms_trigger(struct snd_soc_pcm_runtime *rtd,
> +			      struct snd_pcm_substream *substream, int cmd)
> +{
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		soc_condpcms_start(rtd, substream, cmd);
> +		break;
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		soc_condpcms_stop(rtd, substream, cmd);
> +		break;
> +	}
> +}
> +
> +void snd_soc_condpcms_teardown(struct snd_soc_pcm_runtime *rtd,
> +			       struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_condpcm *cpcm, *save;
> +
> +	list_del(&substream->cpcm_candidate_node);
> +
> +	/* Free all condpcms this substream spawned. */
> +	list_for_each_entry_safe(cpcm, save, &rtd->cpcm_source_list, source_node)
> +		soc_condpcm_hw_free(cpcm);
> +	list_for_each_entry_safe(cpcm, save, &rtd->cpcm_sink_list, sink_node)
> +		soc_condpcm_hw_free(cpcm);
> +}
> +
> +static bool soc_condpcm_test(struct snd_soc_condpcm *cpcm,
> +			     struct snd_pcm_substream *substream, int dir)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_condpcm_pred *pred = &cpcm->preds[dir];
> +
> +	return pred->direction == substream->stream &&
> +	       !strcmp(pred->card_name, rtd->card->name) &&
> +	       !strcmp(pred->link_name, rtd->dai_link->name);
> +}
> +
> +static struct snd_pcm_substream *
> +soc_condpcm_find_match(struct snd_soc_condpcm *cpcm, struct snd_pcm_substream *ignore, int dir)
> +{
> +	struct snd_pcm_substream *substream;
> +
> +	list_for_each_entry(substream, &condpcm_candidate_list, cpcm_candidate_node) {
> +		if (substream == ignore)
> +			continue;
> +
> +		/* Only substreams that passed hw_params() are valid candidates. */
> +		if (!dpcm_hw_params_done(substream))
> +			continue;
> +
> +		if (soc_condpcm_test(cpcm, substream, dir))
> +			return substream;
> +	}
> +
> +	return NULL;
> +}
> +
> +static int soc_condpcm_walk(struct snd_soc_pcm_runtime *rtd,
> +			    struct snd_pcm_substream *substream,
> +			    struct snd_pcm_hw_params *params, int dir)
> +{
> +	/* Temporary source/sink cache. */
> +	struct snd_pcm_substream *substreams[2];
> +	struct snd_soc_condpcm *cpcm;
> +	int ret;
> +
> +	substreams[dir] = substream;
> +
> +	list_for_each_entry(cpcm, &condpcm_list, node) {
> +		if (cpcm->state != SNDRV_PCM_STATE_DISCONNECTED)
> +			continue;
> +
> +		/* Does this cpcm match @substream? */
> +		if (!soc_condpcm_test(cpcm, substream, dir))
> +			continue;
> +
> +		/* Find pair for the @substream. */
> +		substreams[!dir] = soc_condpcm_find_match(cpcm, substream, !dir);
> +		if (!substreams[!dir])
> +			continue;
> +
> +		/* Allow driver to have the final word. */
> +		ret = cpcm->ops->match(cpcm, substreams[0], substreams[1]);
> +		if (ret)
> +			continue;
> +		cpcm->source = substreams[0];
> +		cpcm->sink = substreams[1];
> +
> +		ret = soc_condpcm_hw_params(cpcm, params);
> +		if (ret) {
> +			cpcm->source = NULL;
> +			cpcm->sink = NULL;
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/* Called by soc-pcm.c after each successful hw_params(). */
> +int snd_soc_condpcms_walk_all(struct snd_soc_pcm_runtime *rtd,
> +			      struct snd_pcm_substream *substream,
> +			      struct snd_pcm_hw_params *params)
> +{
> +	int ret;
> +
> +	list_add_tail(&substream->cpcm_candidate_node, &condpcm_candidate_list);
> +
> +	/* Spawn all condpcms this substream is the missing source of. */
> +	ret = soc_condpcm_walk(rtd, substream, params, SNDRV_PCM_STREAM_CAPTURE);
> +	if (ret)
> +		return ret;
> +
> +	/* Spawn all condpcms this substream is the missing sink of. */
> +	return soc_condpcm_walk(rtd, substream, params, SNDRV_PCM_STREAM_PLAYBACK);
> +}

Are loops supported?
Is the order between capture and playback intentional?
Is the notion of playback/capture even relevant when trying to add
loopbacks?

Lots of questions...



