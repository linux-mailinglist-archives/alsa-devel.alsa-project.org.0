Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 535C87080C1
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 14:09:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 493B31F6;
	Thu, 18 May 2023 14:08:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 493B31F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684411760;
	bh=v2g/h6/hSTqV/fsyRUQ1IqKgYjTgT4MfEFs885lanT8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f2fYm4vn7za4OgHwHRCzz9nS/+QChcDZWTNF1g1i2vSKObx8KXvERUb35wmxXdPZb
	 WrlDJzNyqd3kZNo/BG5i86IrUhTkL9+LuymSfgGnWYPDBtYbJ9iAPwYSB9sx5ow8qb
	 jnmLUBr/EbIYS8j57CTr4IAJe3Z2Q9HzOZ+CdgyI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93292F80272; Thu, 18 May 2023 14:08:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F330CF8025A;
	Thu, 18 May 2023 14:08:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E457F80272; Thu, 18 May 2023 14:08:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CC11F80087
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 14:08:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CC11F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UL2fto0m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684411701; x=1715947701;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=v2g/h6/hSTqV/fsyRUQ1IqKgYjTgT4MfEFs885lanT8=;
  b=UL2fto0mYsQb6CyPnRQuMeSwpwL29KeaOubG3/E5Y2covcqPaUi2NuyV
   eZzvo34Kv7bTMA+zZ2DdSdXskpiVPBG1U3aY2+c2J8Z0r3GWcHvYNLGUR
   b5LLpQYQqD7eM8QLrtnL+0GTlI41nfKR4pqDmNH59O/lnFGuDD7LXP7L/
   7Gfkm4jpwg9wwOinrAPyj1LqE++rcpbNkdq4z06wRxKwK7oO5hVGDAw16
   K+iusXXAyZ+gKNNfuZ/2J/ZXw4KQ0udT57kyaQ4CDCYnEhQBv8VALPEOF
   2wjadZooNN6P3nCjwgEHXcL81jmhHCD9uibfOdelQ5bdGh4Y72Q32zJeT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="438390666"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="438390666"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 05:08:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="696265946"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="696265946"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 05:08:13 -0700
Message-ID: <2bb0ade8-9144-1f03-4f6c-feeff012941b@linux.intel.com>
Date: Thu, 18 May 2023 14:08:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: soc-pcm: test if a BE can be prepared
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: tiwai@suse.de, broonie@kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20230517185731.487124-1-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20230517185731.487124-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4CADQZRONCAGN33CBL22JH2Q2KKTEN63
X-Message-ID-Hash: 4CADQZRONCAGN33CBL22JH2Q2KKTEN63
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4CADQZRONCAGN33CBL22JH2Q2KKTEN63/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/17/2023 8:57 PM, Pierre-Louis Bossart wrote:
> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> In the BE hw_params configuration, the existing code checks if any of the
> existing FEs are prepared, running, paused or suspended - and skips the
> configuration in those cases. This allows multiple calls of hw_params
> which the ALSA state machine supports.
> 
> This check is not handled for the prepare stage, which can lead to the
> same BE being prepared multiple times. This patch adds a check similar to
> that of the hw_params, with the main difference being that the suspended
> state is allowed: the ALSA state machine allows a transition from
> suspended to prepared with hw_params skipped.
> 
> This problem was detected on Intel IPC4/SoundWire devices, where the BE
> dailink .prepare stage is used to configure the SoundWire stream with a
> bank switch. Multiple .prepare calls lead to conflicts with the .trigger
> operation with IPC4 configurations. This problem was not detected earlier
> on Intel devices, HDaudio BE dailinks detect that the link is already
> prepared and skip the configuration, and for IPC3 devices there is no BE
> trigger.
> 
> Link: https://github.com/thesofproject/sof/issues/7596
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---

Makes sense, I lightly tested it myself with multi FE configuration and 
then asked validation to run a round of tests with multiple FE topology 
and everything seems to work, so

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

