Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 164C37B6206
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 09:03:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54337AE9;
	Tue,  3 Oct 2023 09:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54337AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696316632;
	bh=eMdkPedttFDR2L5zieOFQ8KsShh5j2eTTclPL8AeZcw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W7y604ZFCjbfAz42NMuCVX2iEno9/O66EBoA72Afw2rO3iRfC4Qmi7QsCXDdDL0sG
	 LPfGtpK16FJl/U4qZY4iSrr9xOQJbX0SJsSmnHxVOO8WRLRiFT71XW0cMOeVdgBGqk
	 7lLJZfjrtrClthMcM2UTkrmNJ0CgE7BJdwXj1b4I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEE8FF80558; Tue,  3 Oct 2023 09:02:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 764F8F80310;
	Tue,  3 Oct 2023 09:02:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E650F8047D; Tue,  3 Oct 2023 08:55:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29D3BF80130;
	Tue,  3 Oct 2023 08:55:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29D3BF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BGJprhvu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696316127; x=1727852127;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eMdkPedttFDR2L5zieOFQ8KsShh5j2eTTclPL8AeZcw=;
  b=BGJprhvuvjwROFjDmWQXSPaY3nFTM6p7LLWFXfGgw93Iz8+IJgLMjc7Z
   kgmSBxCqQEVrCeDy5WIhPVoDJn7TcTruf2YBi+X5Mp95lgCLT4pXPDoot
   GOmzKWPLG31LxdyH2y742aIgRHbWodqE1riBszQJC3biFQhP814frPGKp
   0Jv6tvAA4Wp3v1KchjYNU5UBZJ7SnRHwjq7vaU6jgbg8hiB9dpvRB6+gM
   se9++aPXzQrBX2uBqFDmKmlgfxhHNIn3HY0o/a8RjJpgNWnJj6cvwXlKA
   llCKPZ2NoakNU5pa19Tl0bPQ1NJdav3mO7oiZu6zJU6CdVnmXFe9flD0/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="381689190"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200";
   d="scan'208";a="381689190"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 23:55:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="874617410"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200";
   d="scan'208";a="874617410"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.91])
 ([10.94.0.91])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 23:55:10 -0700
Message-ID: <8a506cfa-7274-b760-1fc1-60d0e5b75a8b@linux.intel.com>
Date: Tue, 3 Oct 2023 08:55:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 10/12] ASoC: Intel: Skylake: Move snd_hdac_i915_init to
 before probe_work.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: Mark Brown <broonie@kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
References: <20230929145123.233838-1-maarten.lankhorst@linux.intel.com>
 <20231002165202.17863-1-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20231002165202.17863-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HOW2K26A55SHR5R5A6ULLKWD77BAHADY
X-Message-ID-Hash: HOW2K26A55SHR5R5A6ULLKWD77BAHADY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HOW2K26A55SHR5R5A6ULLKWD77BAHADY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/2/2023 6:52 PM, Maarten Lankhorst wrote:
> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
> the snd_hdac_i915_init into a workqueue. It's likely the whole workqueue
> can be destroyed, but I don't have the means to test this.
> 
> Removing the workqueue would simplify init even further, but is left
> as exercise for the reviewer.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---

Isn't the convention that your Signed-off should be last when you are 
sending the patches? Or does it only apply to Signed-off lines 
themselves and other lines can be anywhere?

