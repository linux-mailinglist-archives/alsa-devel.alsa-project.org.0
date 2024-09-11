Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E806B974E17
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 11:10:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FF901DD;
	Wed, 11 Sep 2024 11:10:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FF901DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726045852;
	bh=7hXzo1gtAmWQBm4/YCS0mRlX5+6bEz9+z5FQDrLjvUM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YgUFSqAEnAjLNO0mM0Bc/U+ACse2M4OB1ER1gDWEguY7he98LyqCYwrWfZ3Idzfdo
	 eueOLkcrgZtSp2xD/Mrd7h0ssARje9+ZNH9rb8mFWCmrAg7E2WeUzaGr9mrekWYYTT
	 hy8i5L05OM0Ij5zeaVt9JTxYCrvbkJfIl/+zCwVc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E061F805B6; Wed, 11 Sep 2024 11:10:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2C8DF80527;
	Wed, 11 Sep 2024 11:10:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64212F801F5; Wed, 11 Sep 2024 11:10:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE110F8010B
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 11:10:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE110F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lC/X39qX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726045815; x=1757581815;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7hXzo1gtAmWQBm4/YCS0mRlX5+6bEz9+z5FQDrLjvUM=;
  b=lC/X39qXQFQ7xJWt4iGd1mYTMA4MaAPK46mPke+YHPmKSv5cmNNCV76e
   2KfUpyN/Od6jAHrQV7y5olRD11vHBbYfwfisbCopugjOFuYlVPSUNkZK9
   I7zRZynKJsjXDmbz46VOLKuThxqO24ryr3W1Sa65MNQTEesvzF1/DKN07
   JZSlUDKaorINcjjOw8O3q7ay4GM2TZyxyiBQ0khrjhlVprSuwO8pplNrb
   IDcN1JsfzbnVe4CHMyPF51ujVOjLWM05P8jYNkyK4sRulZadKGVhIfAwa
   AirXVksDWcrHej04d2BB+x/77z9LZJFofbMD2fw8eqh4ZnqoiuJyuLn/u
   A==;
X-CSE-ConnectionGUID: C7LSO7MbSwKLaycak74dng==
X-CSE-MsgGUID: LIyFMNIpRbOBmwpAo8M0mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35425196"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600";
   d="scan'208";a="35425196"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 02:10:10 -0700
X-CSE-ConnectionGUID: 31lL6o1/TaqLrSKlLBTY/w==
X-CSE-MsgGUID: azG953GiQ+Kp2FB4snQTrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600";
   d="scan'208";a="67593407"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.246.146])
 ([10.245.246.146])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 02:10:03 -0700
Message-ID: <1ab3efaa-863c-4dd0-8f81-b50fd9775fad@linux.intel.com>
Date: Wed, 11 Sep 2024 11:09:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] ALSA: pcm: add more sample rate definitions
To: Jerome Brunet <jbrunet@baylibre.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
 <20240905-alsa-12-24-128-v1-1-8371948d3921@baylibre.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240905-alsa-12-24-128-v1-1-8371948d3921@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: C647JPIICCHUZQ7J7SDTJSSQMDCIR3VI
X-Message-ID-Hash: C647JPIICCHUZQ7J7SDTJSSQMDCIR3VI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C647JPIICCHUZQ7J7SDTJSSQMDCIR3VI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/5/24 16:12, Jerome Brunet wrote:
> This adds a sample rate definition for 12kHz, 24kHz and 128kHz.
> 
> Admittedly, just a few drivers are currently using these sample
> rates but there is enough of a recurrence to justify adding a definition
> for them and remove some custom rate constraint code while at it.
> 
> The new definitions are not added to the interval definitions, such as
> SNDRV_PCM_RATE_8000_44100, because it would silently add new supported
> rates to drivers that may or may not support them. For sure the drivers
> have not been tested for these new rates so it is better to leave them out
> of interval definitions.
> 
> That being said, the added rates are multiples of well know rates families,
> it is very likely that a lot of devices out there actually supports them.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  include/sound/pcm.h     | 31 +++++++++++++++++--------------
>  sound/core/pcm_native.c |  6 +++---
>  2 files changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> index 732121b934fd..c993350975a9 100644
> --- a/include/sound/pcm.h
> +++ b/include/sound/pcm.h
> @@ -109,20 +109,23 @@ struct snd_pcm_ops {
>  #define SNDRV_PCM_RATE_5512		(1U<<0)		/* 5512Hz */
>  #define SNDRV_PCM_RATE_8000		(1U<<1)		/* 8000Hz */
>  #define SNDRV_PCM_RATE_11025		(1U<<2)		/* 11025Hz */
> -#define SNDRV_PCM_RATE_16000		(1U<<3)		/* 16000Hz */
> -#define SNDRV_PCM_RATE_22050		(1U<<4)		/* 22050Hz */
> -#define SNDRV_PCM_RATE_32000		(1U<<5)		/* 32000Hz */
> -#define SNDRV_PCM_RATE_44100		(1U<<6)		/* 44100Hz */
> -#define SNDRV_PCM_RATE_48000		(1U<<7)		/* 48000Hz */
> -#define SNDRV_PCM_RATE_64000		(1U<<8)		/* 64000Hz */
> -#define SNDRV_PCM_RATE_88200		(1U<<9)		/* 88200Hz */
> -#define SNDRV_PCM_RATE_96000		(1U<<10)	/* 96000Hz */
> -#define SNDRV_PCM_RATE_176400		(1U<<11)	/* 176400Hz */
> -#define SNDRV_PCM_RATE_192000		(1U<<12)	/* 192000Hz */
> -#define SNDRV_PCM_RATE_352800		(1U<<13)	/* 352800Hz */
> -#define SNDRV_PCM_RATE_384000		(1U<<14)	/* 384000Hz */
> -#define SNDRV_PCM_RATE_705600		(1U<<15)	/* 705600Hz */
> -#define SNDRV_PCM_RATE_768000		(1U<<16)	/* 768000Hz */
> +#define SNDRV_PCM_RATE_12000		(1U<<3)		/* 12000Hz */
> +#define SNDRV_PCM_RATE_16000		(1U<<4)		/* 16000Hz */
> +#define SNDRV_PCM_RATE_22050		(1U<<5)		/* 22050Hz */
> +#define SNDRV_PCM_RATE_24000		(1U<<6)		/* 24000Hz */
> +#define SNDRV_PCM_RATE_32000		(1U<<7)		/* 32000Hz */
> +#define SNDRV_PCM_RATE_44100		(1U<<8)		/* 44100Hz */
> +#define SNDRV_PCM_RATE_48000		(1U<<9)		/* 48000Hz */
> +#define SNDRV_PCM_RATE_64000		(1U<<10)	/* 64000Hz */
> +#define SNDRV_PCM_RATE_88200		(1U<<11)	/* 88200Hz */
> +#define SNDRV_PCM_RATE_96000		(1U<<12)	/* 96000Hz */
> +#define SNDRV_PCM_RATE_128000		(1U<<13)	/* 128000Hz */
> +#define SNDRV_PCM_RATE_176400		(1U<<14)	/* 176400Hz */
> +#define SNDRV_PCM_RATE_192000		(1U<<15)	/* 192000Hz */
> +#define SNDRV_PCM_RATE_352800		(1U<<16)	/* 352800Hz */
> +#define SNDRV_PCM_RATE_384000		(1U<<17)	/* 384000Hz */
> +#define SNDRV_PCM_RATE_705600		(1U<<18)	/* 705600Hz */
> +#define SNDRV_PCM_RATE_768000		(1U<<19)	/* 768000Hz */
>  
>  #define SNDRV_PCM_RATE_CONTINUOUS	(1U<<30)	/* continuous range */
>  #define SNDRV_PCM_RATE_KNOT		(1U<<31)	/* supports more non-continuous rates */
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 44381514f695..7461a727615c 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -2418,13 +2418,13 @@ static int snd_pcm_hw_rule_sample_bits(struct snd_pcm_hw_params *params,
>  	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
>  }
>  
> -#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_192000 != 1 << 12
> +#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_768000 != 1 << 19
>  #error "Change this table"
>  #endif
>  
>  static const unsigned int rates[] = {
> -	5512, 8000, 11025, 16000, 22050, 32000, 44100,
> -	48000, 64000, 88200, 96000, 176400, 192000, 352800, 384000, 705600, 768000
> +	5512, 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000,
> +	88200, 96000, 128000, 176400, 192000, 352800, 384000, 705600, 768000,
>  };
>  
>  const struct snd_pcm_hw_constraint_list snd_pcm_known_rates = {

Wondering if this is backwards compatible with the alsa-lib definitions,
specifically the topology parts which did unfortunately have a list of
rates that will map to a different index now:


typedef enum _snd_pcm_rates {
	SND_PCM_RATE_UNKNOWN = -1,
	SND_PCM_RATE_5512 = 0,
	SND_PCM_RATE_8000,
	SND_PCM_RATE_11025,
	SND_PCM_RATE_16000,
	SND_PCM_RATE_22050,
	SND_PCM_RATE_32000,
	SND_PCM_RATE_44100,
	SND_PCM_RATE_48000,
	SND_PCM_RATE_64000,
	SND_PCM_RATE_88200,
	SND_PCM_RATE_96000,
	SND_PCM_RATE_176400,
	SND_PCM_RATE_192000,
	SND_PCM_RATE_CONTINUOUS = 30,
	SND_PCM_RATE_KNOT = 31,
	SND_PCM_RATE_LAST = SND_PCM_RATE_KNOT,
} snd_pcm_rates_t;
