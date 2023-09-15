Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEC17A22E2
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 17:47:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 200AF4E;
	Fri, 15 Sep 2023 17:46:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 200AF4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694792855;
	bh=4wmbU8p90diEkfrKmJrux8txyti0J57vdMv+IMd9Zrk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vVWyvPvxtqYd69ccsLb+ILmTlD87uKTlSgg7hFc7pAtkdoEG0Oh5Bs1HCP8hfsiRz
	 IqawLfVNoIbRt79DpnD4rTS+7R4RCMTp1nqXwDdBwESBBpD8oNRkMMIsBVuogquyKc
	 7ziflHiU48Qb1fH/xVDGZXaZwcHIwEVD18ECOw1g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C194F80549; Fri, 15 Sep 2023 17:46:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E32CAF80246;
	Fri, 15 Sep 2023 17:46:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34AA9F80425; Fri, 15 Sep 2023 17:46:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BCE6F801F5
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 17:46:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BCE6F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gG1OGdXL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694792799; x=1726328799;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4wmbU8p90diEkfrKmJrux8txyti0J57vdMv+IMd9Zrk=;
  b=gG1OGdXLtgIOxmfwNEeYiY3HDCzjxr/G3wYyPGOLvDKCIOGmmrzp//od
   PREUEM5BQWstG8+vQ1zSbac5AFIfPTm4mLjMxJc7uK7DZstMvldfNaFGs
   86pwcYhuOkqXuSgBCg1Wud+Tl9sLDwYk1nuNyUFGNeKexGJzR2c29KygB
   4ElrhCGy7mLkByoCoU9gKbv5r88setm8cAsjSD1Wwl1BFi4ZGiDwDYZU+
   Ou8NYuTaPDyJa4ja5ilXSrI5D2E4Ni0s/RiDG0I649y6als6tFmtuUnXv
   k2E4ScZm3stwX70EXUks/9FG/eFpiovLgZWmJE+LI4J0fMyf1lJCqTGNV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358696868"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358696868"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 08:46:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="918694698"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="918694698"
Received: from teoliyon-mobl.gar.corp.intel.com (HELO [10.212.118.44])
 ([10.212.118.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 08:46:33 -0700
Message-ID: <9c2e08db-4baf-72fa-2b07-0a08c6a0299b@linux.intel.com>
Date: Fri, 15 Sep 2023 11:46:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [PATCH] ALSA: hda: hdac-i915: make i915 timeout configurable
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: tiwai@suse.com, perex@perex.cz, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 fred.oh@linux.intel.com, chao.song@linux.intel.com
References: <20230915134527.16679-1-peter.ujfalusi@linux.intel.com>
 <87fs3fv3vd.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87fs3fv3vd.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PN6TQPUGSVC22E6TI2X2C4BYGN5UZKV6
X-Message-ID-Hash: PN6TQPUGSVC22E6TI2X2C4BYGN5UZKV6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PN6TQPUGSVC22E6TI2X2C4BYGN5UZKV6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/15/23 11:43, Takashi Iwai wrote:
> On Fri, 15 Sep 2023 15:45:27 +0200,
> Peter Ujfalusi wrote:
>>
>> From: Fred Oh <fred.oh@linux.intel.com>
>>
>> When enabling new platforms, missing dependencies on i915 driver
>> updates cause i915 timeouts. Rather than wait 60s for no good reason,
>> this patch adds a kernel parameter so that developers can cut to the
>> chase and skip a known problem.
>>
>> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> Reviewed-by: Chao Song <chao.song@linux.intel.com>
>> Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> 
> The change looks trivial, but this would be little use if we support
> EPROBE_DEFER, right?  Or does it need to be merged into 6.6?

It'd be fine to keep this in the SOF tree for now, and remove it from
our tree once the deferred probe is implemented.
