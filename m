Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19656714CA5
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 17:04:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E6F83E7;
	Mon, 29 May 2023 17:03:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E6F83E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685372646;
	bh=vcvjuDmY9snlXShKrgqzn/bDvLB0Pil9hm+3dLTjJd0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UbiN8zd0a1ctSDOyGN8npQoNGKooPJ0rcwbfAEg7yKBZoVnvd0l5jZOZfI8xO2xzb
	 JGt1V7vgYL7Me+LfO52/nMK7ZJrhpVRxXVYGXN7rgFZ3hyUaoVUcRJoYU2opfKYK67
	 TLTZHPGFEQ/x+2mugcI6jKq97hD5LCcLzScFKl1g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6530DF80542; Mon, 29 May 2023 17:02:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C897DF8026A;
	Mon, 29 May 2023 17:02:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C548DF8042F; Mon, 29 May 2023 16:58:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F02C5F8016B
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 16:57:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F02C5F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=K7eYeMVW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685372275; x=1716908275;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vcvjuDmY9snlXShKrgqzn/bDvLB0Pil9hm+3dLTjJd0=;
  b=K7eYeMVWwcxs+FwwBGQN3X4Ph82Pgq6HVAQLIjlXT7w8VTV7vyj31/q3
   82K3uwOaXHL2clxyCq1rQ5gGTTGOvyccQrgT7r4qROhZQCMY+ZlcYip9f
   xiYoyNSR2ZRoztFeHMjDbOGuPgErsGGd8t+hzeRg0PAOW8ZecslxZ7sgw
   0WQcfSLxv9Ggy6naqpJM9WTz3bqHSYOVPmt4WyTJrXc5AI4G/U0V+zA/q
   3/Ah511hGNkbjkH9BvEZ2vQdla3nvTi9yJ/5fbrQeu7DkqZD0XJvYfZU7
   ODIhq/5iNzYhws2xmZyzh5xI31BqHs+8t5EQ/E+/1Q+wFjmnuAWYrGq+2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="357098588"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400";
   d="scan'208";a="357098588"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 07:57:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="850424763"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400";
   d="scan'208";a="850424763"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 07:57:21 -0700
Message-ID: <c0471465-ce43-cb7f-9d0f-982e84bb8222@linux.intel.com>
Date: Mon, 29 May 2023 16:57:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 19/21] ASoC: soc-topology.c: replace
 dpcm_playback/capture to playback/capture_only
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=83=c2=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
 <87wn0skkuw.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87wn0skkuw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QASZWWYEDEUDS7ZYTTJIKLKM76TYZ2XF
X-Message-ID-Hash: QASZWWYEDEUDS7ZYTTJIKLKM76TYZ2XF
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QASZWWYEDEUDS7ZYTTJIKLKM76TYZ2XF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/29/2023 3:05 AM, Kuninori Morimoto wrote:
> soc_get_playback_capture() is now handling DPCM and normal comprehensively
> for playback/capture stream. We can use playback/capture_only flag
> instead of using dpcm_playback/capture. This patch replace these.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-topology-test.c | 2 --
>   sound/soc/soc-topology.c      | 4 ++--
>   2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
> index 2cd3540cec04..703a366e0abe 100644
> --- a/sound/soc/soc-topology-test.c
> +++ b/sound/soc/soc-topology-test.c
> @@ -94,8 +94,6 @@ static struct snd_soc_dai_link kunit_dai_links[] = {
>   		.nonatomic = 1,
>   		.dynamic = 1,
>   		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
> -		.dpcm_playback = 1,
> -		.dpcm_capture = 1,
>   		SND_SOC_DAILINK_REG(dummy, dummy, platform),
>   	},
>   };
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index 47ab5cf99497..cc1f08f2f17b 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -1735,8 +1735,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
>   	/* enable DPCM */
>   	link->dynamic = 1;
>   	link->ignore_pmdown_time = 1;
> -	link->dpcm_playback = le32_to_cpu(pcm->playback);
> -	link->dpcm_capture = le32_to_cpu(pcm->capture);
> +	link->playback_only = le32_to_cpu(pcm->playback) && !le32_to_cpu(pcm->capture);
> +	link->capture_only  = le32_to_cpu(pcm->capture)  && !le32_to_cpu(pcm->playback);
>   	if (pcm->flag_mask)
>   		set_link_flags(link,
>   			       le32_to_cpu(pcm->flag_mask),

Hi,

patches look ok - I haven't run tests yet on v3, will try to get results 
tomorrow. However looking at those assignments again, I wonder if we 
really need them to be "negative" ones? Can't we just have some simple 
fields like playback and capture (similar to dpcm_playback & 
dpcm_capture from before). My concern is that having fields with "_only" 
in name requires them to be handled properly - like in above code, while 
having just "playback" and "capture" would be just simple assignment and 
in the end a lot easier to understand. Is there any reason you chose to 
use the *_only fields?

Thanks,
Amadeusz

