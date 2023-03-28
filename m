Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F1D6CC4AE
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 17:07:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 490C41EE;
	Tue, 28 Mar 2023 17:06:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 490C41EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680016041;
	bh=xUNlQk4ZeG4wB7Jntilk/cJVavfxutCo2LLVtiAW/2M=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RbKBq3K8D2GqO1t/sBPx73xuPOwHq7MK5zzvKeAg9URKDFcLih1J29knPokqLrG+0
	 roTrOlOkFyW/1aOd37aq+RJeJMKmHtqMXEJaGedqTOjMnryMSw10fUbHnj+1L+ozc8
	 Jx91rkYSP9xoTlr8rFEx42mFsBFCrys2wVBtFa+s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0521F8024E;
	Tue, 28 Mar 2023 17:06:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7616EF80272; Tue, 28 Mar 2023 17:06:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B084F8021D
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 17:06:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B084F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YNlazFSs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680015982; x=1711551982;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xUNlQk4ZeG4wB7Jntilk/cJVavfxutCo2LLVtiAW/2M=;
  b=YNlazFSsT3OP39tz8owjwSEB8xzfnURdIKRcKMAILLNAXnkUscPcmlUK
   owjFwgIEFgV5UaOfKzUCgSrmRTaPKgxtWT8U3rpJrhWiDmGzXO1kj+OfN
   aJDEN/p7dUTWZLmFOWFY+VkAtFmxtIac3mcH9jb2ipb4Im4xAa1fw9k7L
   xKgVrqOith5MJOugzhlgL+WIdYknI9YTufFU4A8wvMp0vECKM1/voshLx
   1pXILtymloTVfy1siL79ZuQkJc6pdLKCVW/umYl5SHjkZwkLQs3B9J1S7
   eL2CWrdSK8Sjkn6WsiqIXTD/O2/SbG+Anl3SROnq562/weE6Txp3CxvmD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="320243745"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400";
   d="scan'208";a="320243745"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 08:05:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="794860772"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400";
   d="scan'208";a="794860772"
Received: from nchadha-mobl.amr.corp.intel.com (HELO [10.212.131.27])
 ([10.212.131.27])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 08:05:54 -0700
Message-ID: <d826c3ac-4211-d4b7-38d4-059ccaea179c@linux.intel.com>
Date: Tue, 28 Mar 2023 08:24:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH 08/18] ASoC: SOF: Intel: hda-mlink: introduce helpers for
 'extended links' PM
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org, tiwai@suse.de, perex@perex.cz
References: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
 <20230327112931.23411-9-peter.ujfalusi@linux.intel.com>
 <cc5a4267-f050-c311-5d56-a2e7cfe7e747@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <cc5a4267-f050-c311-5d56-a2e7cfe7e747@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3KACBEGBPUZ4X5ZMP4DAZUCQVAJHHU7F
X-Message-ID-Hash: 3KACBEGBPUZ4X5ZMP4DAZUCQVAJHHU7F
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KACBEGBPUZ4X5ZMP4DAZUCQVAJHHU7F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




>> +static int check_power_active(u32 __iomem *lctl, int sublink, bool
>> enable)
> 
> Should last argument be named 'active' instead of 'enable'? It would
> make more sense to me.

Naming is the hardest part, eh?

I am not super happy with 'active', since the 'not-active' part is not
very clear: it's not suspended, it's really powered-off/disabled.

I also didn't want to introduce a power state, since again it's on or
off and we don't want to introduce the Dx concepts here.

If I had to revisit this, my preference would be:

static int check_sublink_power(u32 __iomem *lctl, int sublink, bool enabled)
