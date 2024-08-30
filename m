Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E200B965A2E
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 10:23:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32EA683B;
	Fri, 30 Aug 2024 10:23:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32EA683B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725006228;
	bh=rL/BCHCppOB+4kjRHLB3TQR00PqdYxOwufSyGuX/SfM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Su2SlVJQXmraWDG2UzjmSxwWCWBXh1yqNv2dokZ4SX0t3V5o0e04qdYds9JMfuBFv
	 hJS1A6CmY55m0nD0iOSzc1YzQgjTV7D8B3hehiCLc/YqYN1UmAd5ZFA2GzUtaZPjec
	 937g80+celMvEbWyEOAojtr53Z9IQku6FxmmGZXU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61958F805B4; Fri, 30 Aug 2024 10:23:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3F73F8059F;
	Fri, 30 Aug 2024 10:23:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C39FF80518; Fri, 30 Aug 2024 10:23:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2E6DF80107;
	Fri, 30 Aug 2024 10:23:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2E6DF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aJBwG5Bx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725006200; x=1756542200;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=rL/BCHCppOB+4kjRHLB3TQR00PqdYxOwufSyGuX/SfM=;
  b=aJBwG5BxrFDHv8o5dG9m8Pq9fkHVv5dd5C7rO4ckFkrx4xK59HXV84CL
   UimqIcHMs3shyMB1UZptZlZ/1ff368r/LYneSH1jtyyfAIer2jtlPguHr
   00prJya8V5jj4XwrS3C6Y1kCiqgKls8okpzPQUh/SLtSSP0C0KQ3EzLH5
   MQ9Djy8Rzs59cmn7ONiYWPCHvSyMWhAi5axAbm+N+Wnz6fmgWEMGrBIo0
   QX5ep1QFV2dXUfNrtYoKTl4FPLU0nlhMr9Wu7iR7gh7zupNAjZXjcxgOc
   unOn3ZvdASkVe6qUCVI8vf79pc8VrZEkSrBUQ1E7VXo9lK+M6xbiii9HD
   g==;
X-CSE-ConnectionGUID: 4aSfgMJOTRSEwjOVK1FHPg==
X-CSE-MsgGUID: OL7klBeGR5qGgI31xsCMZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="26534160"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="26534160"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 01:23:15 -0700
X-CSE-ConnectionGUID: 4pptGwQlQ/S0Kxj6lEMCtA==
X-CSE-MsgGUID: edp9cz0/TZWz/dp0LoW36w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="68646763"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101])
 ([10.245.246.101])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 01:23:14 -0700
Message-ID: <b03f6c4a-500a-4651-b8ba-3d1313ee23a4@linux.intel.com>
Date: Fri, 30 Aug 2024 10:23:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ALSA question
To: Hai Nguyen <kevinnnguyen@yahoo.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "alsa-user@alsa-project.org" <alsa-user@alsa-project.org>
References: <1709880450.660675.1724894372069.ref@mail.yahoo.com>
 <1709880450.660675.1724894372069@mail.yahoo.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1709880450.660675.1724894372069@mail.yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YVSA554V5ALXJLA6FG5RK7MXHC3MDA6A
X-Message-ID-Hash: YVSA554V5ALXJLA6FG5RK7MXHC3MDA6A
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YVSA554V5ALXJLA6FG5RK7MXHC3MDA6A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

 
> I have a C++ audio application that plays back audio data on the sound card, Digigram VX882e. https://www.digigram.com/support/vx882e-support/

Nice to see those cards still being used. I was employee #37 back in
1997 :-)

> The application runs on HPE ProLiant DL380 Gen9 Server. HPE ProLiant DL380 Gen9 Server
> 
> It has worked well under RHEL 7 (kernel 3.10) and RHEL 8 (kernel 4.x). Asthe OS is upgraded to RHEL 9 (kernel 5.14), there is an buffer underrun. When investigating the issue, I run “speaker-test” utility. It fails with the error below. 
> I'm just wonder if this has something to do with the changes in ALSA driver from kernel 4.x to kernel 5.14?  If not, what could cause the buffer underrun issue?

These kernels are rather old and usually contain lots of backports,
it'll be difficult to figure out what change caused a regression.

If you can try with unmodified mainline kernels, you may be able to use
git bisect to find out at what point things started to go wrong.

> Stream parameters are 48000Hz, S16_LE, 2 channels
> 
> Using 16 octaves of pink noise
> 
> Rate set to 48000Hz (requested 48000Hz)
> 
> Buffer size range from 128 to 8192
> 
> Period size range from 64 to 4096
> 
> Using max buffer size 8192
> 
> Periods = 4
> 
> was set period_size = 2048
> 
> was set buffer_size = 8192

that's 10.66ms per period, that's not unusual or extreme. you can also
try to increase this to see at what point the xrun disappears, just to
see if more slack to handle deadlines help.


