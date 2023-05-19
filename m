Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 881AE709C03
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 18:07:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95F7F1F6;
	Fri, 19 May 2023 18:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95F7F1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684512431;
	bh=+LVYeWe2HwChnEehKmgdSAm0cauXcJfvA4AEp+uTTv8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cRULmY79BwwOh+nnH45izDKcVbeBz7g1Bt7K8lzNeAtPASQYAIY1Rpq5giuypFZw4
	 bz5Lp3WpzLHp78x8nLghSPpBdinl7BodY+97FACG3NC3JwfeKNs5GfpsBv7qAYvZgS
	 AfTJ5qsc1+326VxwEWXzx1g4AOzUG8Pqgu+oSa2Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDD38F8024E; Fri, 19 May 2023 18:06:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F2D1F8025A;
	Fri, 19 May 2023 18:06:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2975BF80272; Fri, 19 May 2023 18:06:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C99C6F8024E
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 18:06:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C99C6F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=S2kTjcc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684512369; x=1716048369;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+LVYeWe2HwChnEehKmgdSAm0cauXcJfvA4AEp+uTTv8=;
  b=S2kTjcc7ki04mFAB7CccanwaI25KEh8b7asMChjQ7/esUY2T75Jjoeu6
   AqXdBV/uQ9HzX8lvOvH58v798DqgqTMhA2Od9PSgKDqk3dgbGiOsnIyB4
   qlOFTDKDV0ruJq/KIKiNZ7StaYosyvbr7w2KFQ0rfZl17JJp/BBEJHFAm
   v45DjbwA/w39S19gd/rUbCOHDElEk4ksneql4IXsrqwbGU+Imz9TmeNb5
   m+EsJ3VXF6dDPRhq2fwnIGN9cNjN/TZRtGp3OkN+6efKqmk76+KP4nCcJ
   fusbrDaPiipzqNGEDus9Gf2xJTrgsmPSyjqb4yPR+fMcQB08RmHlnISwX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="351253577"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400";
   d="scan'208";a="351253577"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 09:05:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="792416671"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400";
   d="scan'208";a="792416671"
Received: from erichorx-mobl1.amr.corp.intel.com (HELO [10.209.33.235])
 ([10.209.33.235])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 09:05:55 -0700
Message-ID: <70dc9d36-622a-e8c0-6a1a-f2a0c787e99b@linux.intel.com>
Date: Fri, 19 May 2023 09:58:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 0/5] ASoC: topology: Clean up error messages handling
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai
 <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20230519195611.4068853-1-amadeuszx.slawinski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230519195611.4068853-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KIJ6NXFWLUMXUZRUTTMGJOT2WL3QNKLT
X-Message-ID-Hash: KIJ6NXFWLUMXUZRUTTMGJOT2WL3QNKLT
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KIJ6NXFWLUMXUZRUTTMGJOT2WL3QNKLT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/19/23 14:56, Amadeusz Sławiński wrote:
> Series of patches cleaning up error messages when loading topology. In
> few places instead of logging in place of failure message is logged in
> caller. Additionally there are places where both caller and failing
> function log error, leading to unnecessary logs. Clean all of the above
> up.
> 
> Amadeusz Sławiński (5):
>   ASoC: topology: Log control load errors in soc_tplg_control_load()
>   ASoC: topology: Remove redundant logs
>   ASoC: topology: Do not split message string on multiple lines
>   ASoC: topology: Remove redundant log
>   ASoC: topology: Remove redundant log

Nice cleanup.

For the series:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
>  sound/soc/soc-topology.c | 63 ++++++++++++----------------------------
>  1 file changed, 19 insertions(+), 44 deletions(-)
> 
