Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F885773AC6
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 16:50:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7FDC82B;
	Tue,  8 Aug 2023 16:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7FDC82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691506209;
	bh=7RXOOjW82f2Cvg5KpTRae48K3BMcXxBjhG2q8fJzNiY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R+kawt+sQql31YyVxcfp76caeqahrXuYWPzbHx9Ydjzd9J/jSRJdTyoZ54h7siUTo
	 tsPdzmzJT+qioN4lTj8zTWkg9xjqZvhxhhgE/x08Dmor9K/vzN9XAok1V8UHayUlzH
	 oPUfBlCNjGhazhutlsC4ScAw0qQrMP5XMp4DSKgA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BF99F80154; Tue,  8 Aug 2023 16:49:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68704F80154;
	Tue,  8 Aug 2023 16:49:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FCF4F80534; Tue,  8 Aug 2023 16:49:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9804CF800B8
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 16:49:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9804CF800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=g3/nUXGb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691506141; x=1723042141;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7RXOOjW82f2Cvg5KpTRae48K3BMcXxBjhG2q8fJzNiY=;
  b=g3/nUXGbzybVHFBDgyRCneO17C5W3+YrZLgS6rlJSU5g1zO8vpegaGZ3
   Tp3D4TTNv+SBgvCXGypYz+5mmW2QPbCqkRbsspcVDLhsR+mYoXEO96z+y
   XG8T/nEGG+qvlKUvV7hBsHRyOM3Baf7XzTHxCd4Du1yky2JmadAk5VDx1
   6JBQLNuwfvKqsiEnt05EF2/OVANXE+8itQQnLqtWBD99c9044kBBizdd5
   zN5xHddJ9at9KQQeilqLh7pFwzHypAmmjoJO3UzSEa0mbcJX19ebIAp3n
   7j78JDIqXRGnVThtfz/pxhmxIzRMCN3DPhzdC6vcfmBVzvd0Fh3ZoG516
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="457231450"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200";
   d="scan'208";a="457231450"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 07:48:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="855119047"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200";
   d="scan'208";a="855119047"
Received: from bvenkata-mobl5.amr.corp.intel.com (HELO [10.209.137.103])
 ([10.209.137.103])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 07:48:55 -0700
Message-ID: <001a6472-ec0a-2147-57d0-79ea1796cf90@linux.intel.com>
Date: Tue, 8 Aug 2023 09:48:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] ASoC: Intel: sof-sdw-cs42142: fix for codec button
 mapping
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 jairaj-arava <jairaj.arava@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20230807215000.515846-1-pierre-louis.bossart@linux.intel.com>
 <20230807215000.515846-2-pierre-louis.bossart@linux.intel.com>
 <3d6850b0-d6e4-4ca6-9f06-98deabeac33e@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <3d6850b0-d6e4-4ca6-9f06-98deabeac33e@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FUJJMHUBCG2NJVRMR5EPZQQKKHZKZP5E
X-Message-ID-Hash: FUJJMHUBCG2NJVRMR5EPZQQKKHZKZP5E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FUJJMHUBCG2NJVRMR5EPZQQKKHZKZP5E/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/7/23 17:11, Mark Brown wrote:
> On Mon, Aug 07, 2023 at 04:49:59PM -0500, Pierre-Louis Bossart wrote:
>> From: jairaj-arava <jairaj.arava@intel.com>
>>
>> The CS42142 soundwire codec button mapping is corrected to
>> handle the button detection correctly.
>>
>> Fixes: 1340018d8683 ("ASoC: Intel: sof_sdw: Add helper function for cs42l42 codec")
> 
> Sorry, it's this one with the incorrect ID - you've referenced something
> from the SOF tree I guess.  I'll fix it up.

Indeed, sorry about this one. I took Jai's patch after a long set of
rebases and didn't check the commit ID. oops.
