Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBCD956506
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Aug 2024 09:53:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CE70227B;
	Mon, 19 Aug 2024 09:53:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CE70227B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724054003;
	bh=XhaDNYPtumre+DlT/8KrzFiXd1NiecHLNyAbKknf9t4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=a/iJjyy8G7b3ZM/CYJojAOL4ObjAYiwwki+pp0E6YnJE4EVHFIY2p01GpzhdeEfX9
	 jCNLspZVGq4WYbxEMPdal6Khkghb+ro4P6W86CwzKjRRg+YU/k7dewybyrVxC6nS3f
	 8EknzGu+IJrWkk0nHZCLTQAD9pbzlQtAAaWc5uhk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB05CF805C7; Mon, 19 Aug 2024 09:52:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C034F805D7;
	Mon, 19 Aug 2024 09:52:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 210BCF80494; Mon, 19 Aug 2024 09:47:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0
	tests=RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	TIME_LIMIT_EXCEEDED,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47328F8014C
	for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2024 09:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47328F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JuK6lRS7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724053324; x=1755589324;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=XhaDNYPtumre+DlT/8KrzFiXd1NiecHLNyAbKknf9t4=;
  b=JuK6lRS7T9J3MeYKunrX333KRtDbcYqz+j7koDGC2leOxcLGsxL5lrP2
   uBNSQ6MFZPi0Qf0aQTHXssrFQM6x/lhBEaiszl5dtjBMNdN9em3sbUsvr
   25pcxVel61iKgpdeG0/xhbvmv5HVjOg4pCBiE8M5IEk758TlzpIrAQsxj
   gd4TuC3Ym6kT948lTzlQL0BuQ03sZiV9AeShsGIb4BAaXZsK2/jy4HTh6
   ruH3gErkM7LqnPrE45irLIsb/Jt+E5bsQwe7AH71NxIuviTpOBDVCyejZ
   aMAjO/rZy8SUHozAFv5adfcNsSGPc/LnM93wgoURO4lE3XPqPjI6jBvri
   g==;
X-CSE-ConnectionGUID: tEinDpq3Sdysd3LkZzsJzA==
X-CSE-MsgGUID: KBQw4KgtRYS+XUh6xJPClA==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="26079149"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600";
   d="scan'208";a="26079149"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 00:42:01 -0700
X-CSE-ConnectionGUID: 319Dz4XwQjqHxkKp+UQMeA==
X-CSE-MsgGUID: PrS+ec61QxCHcWL8Trew/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600";
   d="scan'208";a="64677106"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.246.57])
 ([10.245.246.57])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 00:41:57 -0700
Message-ID: <6d83cd58-5f02-414b-b627-a0022e071052@linux.intel.com>
Date: Mon, 19 Aug 2024 08:42:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 4/6] ASoC: fsl_asrc_m2m: Add memory to memory
 function
To: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, linuxppc-dev@lists.ozlabs.org
References: <1723804959-31921-1-git-send-email-shengjiu.wang@nxp.com>
 <1723804959-31921-5-git-send-email-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1723804959-31921-5-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NEIGXPGWP4IUMDAD7TNODOQZPEVNGZK4
X-Message-ID-Hash: NEIGXPGWP4IUMDAD7TNODOQZPEVNGZK4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NEIGXPGWP4IUMDAD7TNODOQZPEVNGZK4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/16/24 12:42, Shengjiu Wang wrote:
> Implement the ASRC memory to memory function using
> the compress framework, user can use this function with
> compress ioctl interface.
> 
> Define below private metadata key value for output
> format, output rate and ratio modifier configuration.
> ASRC_OUTPUT_FORMAT 0x80000001
> ASRC_OUTPUT_RATE   0x80000002
> ASRC_RATIO_MOD     0x80000003

Can the output format/rate change at run-time?

If no, then these parameters should be moved somewhere else - e.g.
hw_params or something.

I am still not very clear on the expanding the SET_METADATA ioctl to
deal with the ratio changes. This isn't linked to the control layer as
suggested before, and there's no precedent of calling it multiple times
during streaming.

I also wonder how it was tested since tinycompress does not support this?


> +static int fsl_asrc_m2m_fill_codec_caps(struct fsl_asrc *asrc,
> +					struct snd_compr_codec_caps *codec)
> +{
> +	struct fsl_asrc_m2m_cap cap;
> +	__u32 rates[MAX_NUM_BITRATES];
> +	snd_pcm_format_t k;
> +	int i = 0, j = 0;
> +	int ret;
> +
> +	ret = asrc->m2m_get_cap(&cap);
> +	if (ret)
> +		return -EINVAL;
> +
> +	if (cap.rate_in & SNDRV_PCM_RATE_5512)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_5512);

this doesn't sound compatible with the patch2 definitions?

cap->rate_in = SNDRV_PCM_RATE_8000_768000;

> +	if (cap.rate_in & SNDRV_PCM_RATE_8000)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_8000);
> +	if (cap.rate_in & SNDRV_PCM_RATE_11025)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_11025);
> +	if (cap.rate_in & SNDRV_PCM_RATE_16000)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_16000);
> +	if (cap.rate_in & SNDRV_PCM_RATE_22050)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_22050);

missing 24 kHz

> +	if (cap.rate_in & SNDRV_PCM_RATE_32000)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_32000);
> +	if (cap.rate_in & SNDRV_PCM_RATE_44100)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_44100);
> +	if (cap.rate_in & SNDRV_PCM_RATE_48000)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_48000);

missing 64kHz

> +	if (cap.rate_in & SNDRV_PCM_RATE_88200)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_88200);
> +	if (cap.rate_in & SNDRV_PCM_RATE_96000)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_96000);
> +	if (cap.rate_in & SNDRV_PCM_RATE_176400)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_176400);
> +	if (cap.rate_in & SNDRV_PCM_RATE_192000)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_192000);
> +	if (cap.rate_in & SNDRV_PCM_RATE_352800)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_352800);
> +	if (cap.rate_in & SNDRV_PCM_RATE_384000)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_384000);
> +	if (cap.rate_in & SNDRV_PCM_RATE_705600)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_705600);
> +	if (cap.rate_in & SNDRV_PCM_RATE_768000)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_768000);
> +
> +	pcm_for_each_format(k) {
> +		if (pcm_format_to_bits(k) & cap.fmt_in) {
> +			codec->descriptor[j].max_ch = cap.chan_max;
> +			memcpy(codec->descriptor[j].sample_rates, rates, i * sizeof(__u32));
> +			codec->descriptor[j].num_sample_rates = i;
> +			codec->descriptor[j].formats = k;
> +			j++;
> +		}
> +	}
> +
> +	codec->codec = SND_AUDIOCODEC_PCM;
> +	codec->num_descriptors = j;
> +	return 0;


