Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B093C54FD13
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 20:55:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46D451B52;
	Fri, 17 Jun 2022 20:55:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46D451B52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655492154;
	bh=HNb+oIz777Gj2FhD11nHWn0cF8zgS5hd5I6a5S4dCuE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U1UJGlCYXb3sttwQ0Y8undGykZJV0z85btFzYvDXEsd4ed7UiDj0MOCRE4RErsoux
	 4Gox/KP6Lu1ex6POpl6uqG5ZGmfY4vlz2oOBFYvwWB4AzMtwzoXKHeLLdtotD6ihQ9
	 lmqmkId8PPzgeJSbsN35ONx080lgg2mItLxmxK+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC2E6F80528;
	Fri, 17 Jun 2022 20:54:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56340F80527; Fri, 17 Jun 2022 20:54:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC240F8028B
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 20:54:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC240F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DLFb6e1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655492092; x=1687028092;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HNb+oIz777Gj2FhD11nHWn0cF8zgS5hd5I6a5S4dCuE=;
 b=DLFb6e1LqopGlA0O4fzKmvhnZp8LJSsCH1HzRQhsWWgEI28rUQHis0fT
 1FzqkHrKwmQBgUM8X6cT8BQScuxGak9In5tRpDTuZcVL0jD/dMIZsvLAO
 Fg04vBwSxTw08S69rhSBzDxZVahBRkPDTwmbh2qh0oCz54t+7k8oIYJKT
 nSGILSR1eSh69q4IYsoCd2E301KOLgSsSsnR7XcLLUOS5XjhRhgd4MN77
 k+VLFv80b5dIhDwzkO1mGz2R0Mysb+zAjqcFkh2nQkrDB+kgA1npPjJYH
 2nALlIP+xnLdTyq3t8CrMCeMlF/X+2aCma2wjY0CcWIf8AqJK+9Ee7LqA g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="278334206"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="278334206"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 11:54:45 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="642143857"
Received: from patelman-mobl1.amr.corp.intel.com (HELO [10.212.115.29])
 ([10.212.115.29])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 11:54:44 -0700
Message-ID: <ed329dca-48f7-16fd-96eb-337becd372d8@linux.intel.com>
Date: Fri, 17 Jun 2022 13:54:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] ASoC: codecs: soundwire: call pm_runtime_resume() in
 component probe
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220616210825.132093-1-pierre-louis.bossart@linux.intel.com>
 <20220616210825.132093-3-pierre-louis.bossart@linux.intel.com>
 <YqxNEjG19K/RbbFM@sirena.org.uk>
 <1ddc85ea-4e40-eb07-ee5b-8bc58514223d@linux.intel.com>
 <Yqy7xahv6vTjT/KO@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Yqy7xahv6vTjT/KO@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, vkoul@kernel.org,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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



On 6/17/22 12:37, Mark Brown wrote:
> On Fri, Jun 17, 2022 at 09:35:26AM -0500, Pierre-Louis Bossart wrote:
> 
>> What this patch does it make sure that the bus is operation when the
>> card is created. In usual cases, this is a no-op, this just helps with
>> corner test cases. It's not plugging a major hole in the pm_runtime
>> support, just fixing a programming sequence that was not tested before.
> 
>> One possible objection is that we don't keep the reference and the bus
>> active until all components are probed. I tried doing this at the ASoC
>> core level, but that breaks all kinds of devices that have their own
>> quirky way of dealing with pm_runtime - specifically HDaudio and HDMI.
>> That's why I added this resume here.
> 
>> Makes sense?
> 
> Ish.  Ugh, right.  So it's not fixing anything really, it's mainly
> papering over cracks where things are being missed.  In any case it's
> not doing any harm and it helps things for now.

You got it right. There are additional patches that were sent to use
pm_runtime_resume_and_get() on set_jack, and other clear cases that were
missed, but this is more of a blanket "do not harm" resume in case codec
drivers are missing something.
