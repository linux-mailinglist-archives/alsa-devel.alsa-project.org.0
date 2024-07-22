Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF79B938C0C
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 11:28:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05372E94;
	Mon, 22 Jul 2024 11:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05372E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721640490;
	bh=14I9FwmJiB4lHPlhS9NIA7Cq3dNMsDVHQAv+33WNKao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m1EFSBridyC6nNQj+I6SliHTKCGJuiZ4wt0v/PmvAOF568kxpWq4QPI7IO1XJfOEw
	 ZF8najLEBaMwOOadrfJZjJqd2Q6B0cxfNNjYDOY54p1ZMD9H/45SXHo+ZGLqlG4AGU
	 Iq8rgsS8Wcvnr6317Z97F203E7BN+SQyVpS+Kct4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D950F805B2; Mon, 22 Jul 2024 11:27:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92A20F805B0;
	Mon, 22 Jul 2024 11:27:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7ED98F801F5; Mon, 22 Jul 2024 11:27:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BA58F800C9
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 11:27:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BA58F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KQh7cMVD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721640450; x=1753176450;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=14I9FwmJiB4lHPlhS9NIA7Cq3dNMsDVHQAv+33WNKao=;
  b=KQh7cMVD3X8vFgCdoIQivvzsMiCKhzsJbYyAJYF36X+uUvWq04Y4bpjk
   X4D3ZT7+Bq7jGVZ6uDPHLzQIfk3j+YcVI37tL+QmhsfRE4AOCRGHfCBQ2
   ysTnbWgXT1PbsUJGLyidJAwpeE1pl3FJ4K8AZNikSDfOrTPCsdbS87hRC
   u+wmx61aduqOzXB+GQKvI+3eGIaaJVLtlqDY7r/mH93Qt6z4lFxFgPJq9
   66vDohZuNDJgzXB5E//TmWlUiN0O0NJNcLSHGWrhSsudovrJkCmkC97is
   3WAMLIAuPVEf3htTTRIK1XpJN9b4TmxssrN9+3CePntSiWU+l4wbk4am+
   g==;
X-CSE-ConnectionGUID: VwUO3P/8Q6CKNwWSTlX4Ew==
X-CSE-MsgGUID: WccGGH9ySUu3c9iF4tzpgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="19323892"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800";
   d="scan'208";a="19323892"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 02:27:25 -0700
X-CSE-ConnectionGUID: Ws5ALBdXR6KE8Jll+EqWWw==
X-CSE-MsgGUID: 6Jj1pU1wQBWKkdYA6X3zXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800";
   d="scan'208";a="55999063"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 02:27:23 -0700
Message-ID: <df2f2cc2-6d5b-4f4b-9edc-84ba1fde4d3f@linux.intel.com>
Date: Mon, 22 Jul 2024 11:27:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 01/xx] ALSA: add snd_stream_is_playback/capture() macro
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>
References: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
 <87y15yl1fa.wl-kuninori.morimoto.gx@renesas.com>
 <9d0a16c8-5539-4977-9ac0-9bbf3df56676@linux.intel.com>
 <87a5iab8gc.wl-kuninori.morimoto.gx@renesas.com>
 <87wmle9dda.wl-kuninori.morimoto.gx@renesas.com>
 <87v80xq1td.wl-tiwai@suse.de>
 <85450b77-d68f-45e2-bef1-6082bc56fa59@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <85450b77-d68f-45e2-bef1-6082bc56fa59@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AJSNYNALGFQRZMKZEUNLBEX6ZAKDE5YQ
X-Message-ID-Hash: AJSNYNALGFQRZMKZEUNLBEX6ZAKDE5YQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AJSNYNALGFQRZMKZEUNLBEX6ZAKDE5YQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/22/2024 10:47 AM, Pierre-Louis Bossart wrote:

> The main issue I have with this patch is the continued confusion in
> variable naming between 'stream' and 'direction'. It's problematic on
> multiple platforms where a stream is typically identified by a DMA
> channel or ID of some sort. There's also the SoundWire 'stream' which
> has nothing to do with PCM devices. In the end people end-up drowning in
> too many 'streams', no one knows if the code refers to the data flow or
> the data direction.
Oh yes, so I'm not the only one :D, I also would very much prefer if 
there was 'direction' instead of 'stream'.
