Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0497974FBD
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 12:33:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCD37843;
	Wed, 11 Sep 2024 12:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCD37843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726050826;
	bh=L3DfyRJyMBTh2hMe73ZBoYLf1innUkJOSEQ3kjB6jvE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DlkZE+j2NKV2vZ4PfulPZ+CvApxgYH6QOI6pytwzJsrrX0Ef3+xHGOD9EUfQv9FTv
	 Mvf0dMTU6xmvyqXG9Qv1gEEnSyIhqQcQ8TXnLH/2Ki5hSHoF+F+PzzLCNn2K/cNl9l
	 nMzbKrs+aIz9IVwczLs7kQAuQY8OKd4G+aw4yoDM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2E6BF805BD; Wed, 11 Sep 2024 12:33:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 094A7F8019B;
	Wed, 11 Sep 2024 12:33:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA3D6F801F5; Wed, 11 Sep 2024 12:33:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55388F80107
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 12:33:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55388F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jHbPFdyt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726050784; x=1757586784;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=L3DfyRJyMBTh2hMe73ZBoYLf1innUkJOSEQ3kjB6jvE=;
  b=jHbPFdytEp5Xs99qrdoxVXh3Nslz7rZQNgIxQDXVw2jRSCtqaKEbefAE
   oJPG0rOiJISi6vea8nnZo/03RtJEuLV6QIoIeuWCw0eWp/RUEycNoEpNa
   hu0fi0fBsAxiktlnFvSIyMHjQa5ZW99zthw4tHxhrv9sk8b5tvDLrYjDV
   TveQ2scMC7zEPmrdY0ReT4CXrupCglgvdD8iEx8QHOLMoH7DDGwEwx6bV
   c6h0Aq4jqBe1r9ikIWFUnynKALu85Qru+33PIUaSspRzsSQBmSr5X21AI
   FcPi72IpWuj11OoRIKk5xHZxVTbIY/PIkT6Jh0DuN/X+KyMYDzj8Ui3B4
   A==;
X-CSE-ConnectionGUID: iM8SVBjEQX2ibDOHWLy3LA==
X-CSE-MsgGUID: 7+nkam8tSrGw0IsZPY17KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="50255167"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600";
   d="scan'208";a="50255167"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 03:32:59 -0700
X-CSE-ConnectionGUID: BNEu4AC2T/CJ3e9psPx4QQ==
X-CSE-MsgGUID: 0lOjmVLITqO33NbgMFbjmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600";
   d="scan'208";a="72125867"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.58])
 ([10.245.244.58])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 03:32:53 -0700
Message-ID: <5c309853-c82c-475e-b8c2-fcdcfde20efc@linux.intel.com>
Date: Wed, 11 Sep 2024 13:33:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] ALSA: pcm: add more sample rate definitions
To: Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
 <20240905-alsa-12-24-128-v1-1-8371948d3921@baylibre.com>
 <1ab3efaa-863c-4dd0-8f81-b50fd9775fad@linux.intel.com>
 <87ed5q4kbe.wl-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87ed5q4kbe.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HB6RUIMJ6O266EO4UQF7HBEJJT5CDCZK
X-Message-ID-Hash: HB6RUIMJ6O266EO4UQF7HBEJJT5CDCZK
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HB6RUIMJ6O266EO4UQF7HBEJJT5CDCZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/09/2024 12:21, Takashi Iwai wrote:
>> Wondering if this is backwards compatible with the alsa-lib definitions,
>> specifically the topology parts which did unfortunately have a list of
>> rates that will map to a different index now:
>>
>>
>> typedef enum _snd_pcm_rates {
>> 	SND_PCM_RATE_UNKNOWN = -1,
>> 	SND_PCM_RATE_5512 = 0,
>> 	SND_PCM_RATE_8000,
>> 	SND_PCM_RATE_11025,
>> 	SND_PCM_RATE_16000,
>> 	SND_PCM_RATE_22050,
>> 	SND_PCM_RATE_32000,
>> 	SND_PCM_RATE_44100,
>> 	SND_PCM_RATE_48000,
>> 	SND_PCM_RATE_64000,
>> 	SND_PCM_RATE_88200,
>> 	SND_PCM_RATE_96000,
>> 	SND_PCM_RATE_176400,
>> 	SND_PCM_RATE_192000,
>> 	SND_PCM_RATE_CONTINUOUS = 30,
>> 	SND_PCM_RATE_KNOT = 31,
>> 	SND_PCM_RATE_LAST = SND_PCM_RATE_KNOT,
>> } snd_pcm_rates_t;
> 
> As far as I understand correctly, those rate bits used for topology
> are independent from the bits used for PCM core, although it used to
> be the same.  Maybe better to rename (such as SND_TPLG_RATE_*) so that
> it's clearer only for topology stuff.

Even if we rename these in alsa-lib we will need translation from
SND_TPLG_RATE_ to SND_PCM_RATE_ in kernel likely?

The topology files are out there and this is an ABI...

> But it'd be better if anyone can double-check.

Since the kernel just copies the rates bitfield, any rate above 11025
will be misaligned and result broken setup.

> 
> 
> thanks,
> 
> Takashi

-- 
Péter
