Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 375947A5ACD
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 09:23:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B667A4C;
	Tue, 19 Sep 2023 09:23:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B667A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695108231;
	bh=4nhSq78Yr3q8i+7KxdcUZ+kvrvsLhAvcnZr3eDIBprw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BeHVQKuXwbKgjjnaTSMz3eYhEAlrLOK6dkqLafKDHwVspvVJ45WvmIropBdXwQz+s
	 O94BNW43NEwsCf3xtWm8UoAFgQrvYHBNww8gDm/YgjFaIotX6xO3WLAETAPrS4HY+Q
	 yGXbIQBK+wandm4Hq1xnCCkOWZV4MnXTWILOfAnc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC18DF801F5; Tue, 19 Sep 2023 09:23:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3B18F801F5;
	Tue, 19 Sep 2023 09:23:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5760F8025A; Tue, 19 Sep 2023 09:22:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 167CCF80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 09:22:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 167CCF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mpn6NdIS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695108175; x=1726644175;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4nhSq78Yr3q8i+7KxdcUZ+kvrvsLhAvcnZr3eDIBprw=;
  b=mpn6NdISMpAHR+rpNbF6OKi+PkJ4YaOiHWmZ4x84eq0/CAXkKoqEB0Zc
   HB2bRGSsTzKxVrzQPkqXgdeODGk7iM9af8gqiGrCaMo4eFsgkmZMbNILR
   KmLrH7xqST4qCOHDga5QIhFlA53M9UkbQJEtJU74vxX/wySOkLFlUq26K
   Px8EahFJ49dOUtq7j0VmrsK13Yht/MnHbEzcdepg79Al6F9dxaWadvyYE
   BAwDOznd6FwcMXHxL3JgNAEm4F57UFBpk1ySRiQQA/gybCHgBEBdGTfDw
   +yeJXsWvLLLA90teglsvc1XZ3vxCn4OL/1faqzMamwaACq/wcWA3t3My2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="382626997"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000";
   d="scan'208";a="382626997"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 00:22:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="816345555"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000";
   d="scan'208";a="816345555"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO [10.249.47.169])
 ([10.249.47.169])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 00:22:50 -0700
Message-ID: <12419771-0fa4-4d44-86fb-440ae14ffda2@linux.intel.com>
Date: Tue, 19 Sep 2023 10:22:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: usb-audio: scarlett_gen2: Fix another
 -Wformat-truncation warning
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, perex@perex.cz, alsa-devel@alsa-project.org
References: <20230919071205.10684-1-peter.ujfalusi@linux.intel.com>
 <875y46zl3f.wl-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <875y46zl3f.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AXVECEW5G6IE6L4OQ2ETIJHBAU6TAESV
X-Message-ID-Hash: AXVECEW5G6IE6L4OQ2ETIJHBAU6TAESV
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AXVECEW5G6IE6L4OQ2ETIJHBAU6TAESV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 19/09/2023 10:19, Takashi Iwai wrote:
> On Tue, 19 Sep 2023 09:12:05 +0200,
> Peter Ujfalusi wrote:
>>
>> The recent enablement of -Wformat-truncation leads to a false-positive
>> warning for mixer_scarlett_gen2.c.
>>
>> For suppressing the warning, replace snprintf() with scnprintf().
>> As stated in the above, truncation doesn't matter.
>>
>> Fixes: 78bd8f5126f8 ("ALSA: usb-audio: scarlett_gen2: Fix -Wformat-truncation warning")
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> 
> While I applied it now, I wonder why this didn't show up with my local
> test.

I wondered about the same thing...

> Which compiler are you using?

$ gcc --version
gcc (GCC) 13.2.1 20230801

-- 
Péter
