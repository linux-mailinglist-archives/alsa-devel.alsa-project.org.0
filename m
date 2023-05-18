Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C810707E4D
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 12:42:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7A531FA;
	Thu, 18 May 2023 12:41:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7A531FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684406541;
	bh=moM73Zyb/LbfiLl1EnWTGoUsnM+qPDpxFwC8ZO3F9Rg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I8WXAprmN5A2ojUXl83tIcl2NkQJc2K85VA+1P/O2/QbuC3ErpNiC9Lb34Qwu/0ak
	 OOI8FlMqhpdiXB/Gzxyp5aVAUrqDT2N5t8IrhL9xYZ9aKtoOwUX3TiOmN4CmL+XaGW
	 Rzj5DyFvfTsKNIE3bLQNuejGEm9QqXtic9ACQM54=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12115F805AF; Thu, 18 May 2023 12:40:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82323F8055B;
	Thu, 18 May 2023 12:40:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3ADB5F80553; Thu, 18 May 2023 12:40:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02B5DF80087
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 12:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02B5DF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eA+nEtgW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684406433; x=1715942433;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=moM73Zyb/LbfiLl1EnWTGoUsnM+qPDpxFwC8ZO3F9Rg=;
  b=eA+nEtgWEDV56u6R+wOrlfTS9K503InvwwPUhwG4kbf19p6XkQUplUZT
   w26WPv1ctt2YE4yBDxrmfBb9VEzidC5ohPQ41wZaGKMJALqgAs5Y3nMzp
   PjdNhyUiepCqHl73YGnVN3xTqyRz0s2Oc9PumFPcblAzvvPPSBH0V61+J
   kMtcGTXsU5XOUW9/r7+7YLvAIZ49C7aXmc89veIPFfg+LeKZjJuLeGjtW
   wuGan8+pPETK/b26wgPp70PFCKwhTyHUqHD4NQ3rQWFNrIyGuNnKCIEJS
   k4S4dVzuop6L3KWeGWCvltEDBHs5Fq7MRVaOgS7L4WGxT3RqanGwCpHv3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="331648851"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="331648851"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 03:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="767149379"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="767149379"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 03:40:26 -0700
Message-ID: <6176a582-848c-9e2d-8f1e-02891751866c@linux.intel.com>
Date: Thu, 18 May 2023 12:40:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 19/20] ASoC: soc-compress.c: replace dpcm_playback/capture
 to playback/capture_only
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: alsa-devel@alsa-project.org
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
 <87bkiip4sl.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87bkiip4sl.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TQLA7IRSQPBFLA7XJH5BJTTFPG5SIIPO
X-Message-ID-Hash: TQLA7IRSQPBFLA7XJH5BJTTFPG5SIIPO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQLA7IRSQPBFLA7XJH5BJTTFPG5SIIPO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/18/2023 7:49 AM, Kuninori Morimoto wrote:
> soc_get_playback_capture() is now handling DPCM and normal comprehensively
> for playback/capture stream. We can use playback/capture_only flag
> instead of using dpcm_playback/capture. This patch replace these.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

