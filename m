Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F5278EA06
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 12:15:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 853741FC;
	Thu, 31 Aug 2023 12:15:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 853741FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693476958;
	bh=RklcOlR9Ft6ToyxZkI1TycwhFtZjpvj3ZdgDkjh9OkQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qV6jfY2wHVjq7ydAp31UgkVXqTw2pflYYdEXOJ7yw9AKx/E+iPKd30tT0xUrYK3Y/
	 jdl0VK/7NqzRqQFaVtMcJ79RZu7T7wbhTSq+KHEbkfU7XWzHDzfskk2N3PCYS6YJXb
	 mtQXrqoEBUpjVOvvf3qBmUY2g+V63caGYgO3hoYI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E53ACF80236; Thu, 31 Aug 2023 12:15:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FF8EF800F5;
	Thu, 31 Aug 2023 12:15:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CE01F80155; Thu, 31 Aug 2023 12:15:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6582F800D1;
	Thu, 31 Aug 2023 12:14:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6582F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cMavoiLh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693476897; x=1725012897;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RklcOlR9Ft6ToyxZkI1TycwhFtZjpvj3ZdgDkjh9OkQ=;
  b=cMavoiLhx+eeCsJVoyVqI0tn6WT9eDCAksNsu3QRrhnq0aYZiMz4RUvw
   eW+vlioG7T7l7SdeMzNwV6PElPz3tS5iIsA5uW49YASFVHn2t/6NxOTcG
   AiowY6zbwFo48B4+7r0baqe7wVREAEszZZ+kcDK56j1NBzlV9LJ703k1I
   NZ0ont8Fc0CuFP3NYeDhpA+vF6T1dBxTRdxr9SWpsNEaOLn+l2ocxnI5E
   y6EcYUkcMAOtzvDA/qv0oXi5X2TKxruCmdhM7+gUGFoaZcM/VXn4wvUZe
   05kRDD9uBCEjqEiWNiqqxqbe/el3AEvNKVaHoAynh7GPbqq6lTjmPc4P8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="378601011"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000";
   d="scan'208";a="378601011"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 03:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="689270188"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000";
   d="scan'208";a="689270188"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.91])
 ([10.94.0.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 03:14:42 -0700
Message-ID: <153723a3-1742-4cf1-b549-50da70f30e8f@linux.intel.com>
Date: Thu, 31 Aug 2023 12:14:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 07/11] ASoC: Intel: avs: Move snd_hdac_i915_init to
 before probe_work.
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
References: <20230830153652.217855-1-maarten.lankhorst@linux.intel.com>
 <20230830153652.217855-8-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230830153652.217855-8-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NI6A7MTNGINKWWUH23HEF5KBUUEW55TC
X-Message-ID-Hash: NI6A7MTNGINKWWUH23HEF5KBUUEW55TC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NI6A7MTNGINKWWUH23HEF5KBUUEW55TC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 8/30/2023 5:36 PM, Maarten Lankhorst wrote:
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

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

