Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A802653411E
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 18:12:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E1CA15E2;
	Wed, 25 May 2022 18:12:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E1CA15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653495173;
	bh=aD/hPHlsUNUIRn34Dh4yG8ptkHfhEO6BSUtoBQthEdM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aYE0DlHRTYY/o0NagMhlsr+w3i3EOAxiW3Jm340om/2zvY+jdBeLjUFMC6l/vlPoF
	 4sE02Og4arm/0TJY8cNRbLGpPGEW5eV9YIvbkkQMdeHfv+2ZaeOTlAJeYzroOQMc2V
	 zXMjnUbtyk4zKex3Iy3RTk5ls+Adqf7s8yTMf8nA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C55BF801EC;
	Wed, 25 May 2022 18:11:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB4E8F8016D; Wed, 25 May 2022 18:11:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D26AF800D0
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 18:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D26AF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GIoKBMd5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653495109; x=1685031109;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aD/hPHlsUNUIRn34Dh4yG8ptkHfhEO6BSUtoBQthEdM=;
 b=GIoKBMd5kS53UNFRScCUDZUk/qU3lDt0XqRFQJ7oX/qlOiA1plLUlfZI
 slJkarcn/TOGWJe8mxGmlFyo32l9mvlrya96p47u9HnS/KhMbYZmZKJll
 qJH9FdQfMh5rq6jLMH78Qh/Nki5JHUoVr7WPKL5pFNxlb2SVfktBd14Nj
 0MktCX7VDOBTiMRblKlciEUKqGZ8THYiCO03G+erSF3dicv0Lh95Po7eN
 wPqLw6V35ZWoJ9E+BBSDRmDb/e+8S4excATC3GxQJp1nKQiKjHcWnWB+0
 bE1cS3eV+haI/4gMBLmHzDWF235FJ29ShuxeRLc4dq5uPY4nWUh2r5SdT w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="255919214"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="255919214"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 09:11:42 -0700
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="745812598"
Received: from srotter-mobl1.amr.corp.intel.com (HELO [10.212.216.74])
 ([10.212.216.74])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 09:11:41 -0700
Message-ID: <349ddb89-6f1e-f087-2399-795cf82b92b3@linux.intel.com>
Date: Wed, 25 May 2022 11:11:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: About Cleanup ASoC
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>
 <db3b90d3-d356-9a2a-7411-ccf487b25416@linux.intel.com>
 <a5e3c40c-ea84-c2c4-54f9-70b4c509567e@intel.com>
 <87a6b6cofh.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87a6b6cofh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 5/24/22 21:54, Kuninori Morimoto wrote:
> 
> Hi Amadeusz, Cezary
> 
> Thank you for your feedback.
> 
>>> I would like to understand the problem here, before I start to discuss 
>>> potential solutions. You seem to be saying that there is some kind of 
>>> card<->component connection limitation? Is there specific use case you 
>>> have in mind?
>>>
>>> Personally I don't see a reason for connecting component to multiple 
>>> cards. Even if it would be possible it soon becomes problematic when you 
>>> for example try to decide which card controls clock on component. As 
>>> I've wrote I would like to first see some use case definition, before 
>>> jumping into a rewrite.
> 
> Sorry, my head was biased.
> I thought people are thinking same things as me.
> 
> In my case, my CPU Component has many channels.
> We have "basic board" which has simple sound system,
> it is using CPU ch0 for example.
> 
> And customer can expand it by using "expansion board",
> it can use CPU ch1 or later channels.

did you mean 'channels' or 'streams'?

I think it's very hard to expose a different card for content that need
to start at the same time and remain phase-synchronized.

If however the 'ch0' and 'ch1' can be independent content then this
configuration would make sense indeed, and it would be quite similar to
the ideas on the Intel side.

One example is e.g. Chromebooks, where we typically have a stream for
headphone/headset, and another for amplifiers. But there are cases where
the jack is not present and the headphone is not populated on a board,
so we end-up having multiple versions of the card, with and without the
headphone path. It could be argued that the headphone could be handled
on a different card. That information is however not known to the 'cpu'
parts, it's really a board-level decision.

> 
> 	+-- basic board --------+
> 	|+--------+             |
> 	|| CPU ch0| <--> CodecA |
> 	||     ch1| <-+         |
> 	|+--------+   |         |
> 	+-------------|---------+
> 
> 	+-- expansion board ----+
> 	|             |         |
> 	|             +-> CodecB|
> 	+-----------------------+
> 
> Both sounds are using same CPU Component, but different Codecs.
> 
> I'm not sure how to count the Card, but
> "basic     board sound" is 1st card,
> "expansion board sound" is 2nd card for us in intuitively.
> 
> But, because we can't use same Component (= CPU) to different Cards,
> we need to merge both sound into one Card.
> We can do that, but not intuitively, and needs overwrite settings.
