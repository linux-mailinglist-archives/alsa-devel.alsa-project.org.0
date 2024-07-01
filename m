Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC0B91DAA2
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 10:55:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F22B2317;
	Mon,  1 Jul 2024 10:55:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F22B2317
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719824128;
	bh=lDEozFRfTCwEKXHhCwMeLrpdH7bHbFFnfjg0uB9M5Ok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jRZDLojZWcz1pnZj9c/D/ausJhfAHHP5Y9PRKHyhAQ4ascRc5AQJKqAeHqq0GTOCV
	 E9cBouoA2MIL4iurC+UK4H5BFFUiPJyeiEAVcDW7GGnMvWJLJTO75bcSi8j8K2a7oa
	 41YPlJDKJHn+TFF0/xPitExBcCqmg3F/RMBqxE28=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37044F805AD; Mon,  1 Jul 2024 10:54:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1096F8028B;
	Mon,  1 Jul 2024 10:54:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC624F8028B; Mon,  1 Jul 2024 10:50:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87C9BF8013D
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 10:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87C9BF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fl9+zN2X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719823828; x=1751359828;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lDEozFRfTCwEKXHhCwMeLrpdH7bHbFFnfjg0uB9M5Ok=;
  b=fl9+zN2XN3TWFnvWZ0ErTYfY09JfYTp2+pSIz6naDLrbSnxshJ00BhEo
   G8I2Ci93C68yqlnGGqsQavFsg05WubKGHA2spUOCfqf39UxIU5zFLAJns
   tat9i6SJZyzhn+//4qijsYDLP8E5iHaY+kV/OD4zEFPBn7m1jY9+/5FA2
   4euxT8hUKToDMdwUSFC0WHzGANROjGIUJTL1q2YTH5hhvsZU66cknRV+E
   E/J0K0WTx6cGoL0kb3CLjs41BOGN5MIPVZoBRSJYm+KIZwqDNprnc4gkR
   iGd7XVOrTUaunPVIIyxof6uwsOaWVIoyrH8ZUt2i2fqrRmS2+/+d4Dg4K
   A==;
X-CSE-ConnectionGUID: gyt9264LThezIh0W9JIDPw==
X-CSE-MsgGUID: HXcIP06YSz2Wj4R4rOLklA==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="16770392"
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800";
   d="scan'208";a="16770392"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 01:50:22 -0700
X-CSE-ConnectionGUID: 83ZZ+qo/Qj2W8cdVYxPECA==
X-CSE-MsgGUID: hQYQXUYaQSWbavLwd0gThA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800";
   d="scan'208";a="45445134"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 01:50:19 -0700
Message-ID: <326792b9-e706-4ab0-a1e8-cc48943e357d@linux.intel.com>
Date: Mon, 1 Jul 2024 10:50:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ALSA: pcm: add support for 128kHz sample rate
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240628122429.2018059-1-jbrunet@baylibre.com>
 <20240628122429.2018059-2-jbrunet@baylibre.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240628122429.2018059-2-jbrunet@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FPSVESHKI23YCI77MUIWZRU6GCSNMF67
X-Message-ID-Hash: FPSVESHKI23YCI77MUIWZRU6GCSNMF67
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FPSVESHKI23YCI77MUIWZRU6GCSNMF67/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 6/28/2024 2:23 PM, Jerome Brunet wrote:
> The usual sample rate possible on an SPDIF link are
> 32k, 44.1k, 48k, 88.2k, 96k, 172.4k and 192k.
> 
> With higher bandwidth variant, such as eARC, and the introduction of 8
> channels mode, the spdif frame rate may be multiplied by 4. This happens
> when the interface use an IEC958_SUBFRAME format.
> 
> The spdif 8 channel mode rate list is:
> 128k, 176.4k, 192k, 352.8k, 384k, 705.4k and 768k.
> 
> All are already supported by ASLA expect for the 128kHz one.
> Add support for it but do not insert it the SNDRV_PCM_RATE_8000_192000
> macro. Doing so would silently add 128k support to a lot of HW which
> probably do not support it.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

 From what I remember the recommendation is to not add new rates, but 
use SNDRV_PCM_RATE_KNOT for all rates not included already.

