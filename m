Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4917B54FBA9
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 18:55:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D77A71B45;
	Fri, 17 Jun 2022 18:54:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D77A71B45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655484930;
	bh=BOMz4eRHsI/doHclQMZA9JX+LMGw9XdFocJWup16nh4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U62HZp3+e0acsWhPICh++aJ726KKqQqianLv6icMopg97uxjlfuIe/k//4M29f63m
	 6tFojHkf7gZRyQhzniFScwhSY2GTvMOx8qBjgouIe/K50Zf4v8sHiUFC8nfD3lFOBX
	 hdxvRVY0WP8uc4MxyQOmqUO5oFEXGNWsKAmSNP0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04B08F8051F;
	Fri, 17 Jun 2022 18:54:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD7C9F80527; Fri, 17 Jun 2022 18:54:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9445BF800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 18:54:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9445BF800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CoCIdrhp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655484867; x=1687020867;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BOMz4eRHsI/doHclQMZA9JX+LMGw9XdFocJWup16nh4=;
 b=CoCIdrhp/L+OJITDGw+Syu2bhtdXG6NHJfUgIAQM4MrVpCSEtlO/S+OT
 znp+vYdM4x4MzFUi8yTWLDd+LeD9iCvHMyor3VCqwTUa7pMr4sZOagZqp
 miqd5tFO0bogWw/1lp4hbsFAdgYKyEjUdJfsj0A41kcfEkn0ugI+3GN76
 pskXxHqbZoO6x0tba1t4IoYV8wcD+Pp4AEpcdZCHTgWLpWqOzAhOktYOz
 wVw6n6YJcY1x7nC7r8AmiFuU3C9iEeR4pmxvmDu83WTR7CyL7d4ZXI+H+
 ssGy3ZYue95Mn+SeIrOiK9LGd8tS1M+nm94UwDBmGrNYPmmz43m5d44a8 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="304936849"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="304936849"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 08:01:23 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="536843176"
Received: from hamiline-mobl.amr.corp.intel.com (HELO [10.212.17.33])
 ([10.212.17.33])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 08:01:23 -0700
Message-ID: <1ddc85ea-4e40-eb07-ee5b-8bc58514223d@linux.intel.com>
Date: Fri, 17 Jun 2022 09:35:26 -0500
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <YqxNEjG19K/RbbFM@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, vkoul@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 6/17/22 04:44, Mark Brown wrote:
> On Thu, Jun 16, 2022 at 04:08:25PM -0500, Pierre-Louis Bossart wrote:
> 
>> Make sure that the bus and codecs are pm_runtime active when the card
>> is registered/created. This avoid timeouts when accessing registers.
> 
>> +static int max98373_sdw_probe(struct snd_soc_component *component)
>> +{
>> +	int ret;
>> +
>> +	ret = pm_runtime_resume(component->dev);
>> +	if (ret < 0 && ret != -EACCES)
>> +		return ret;
> 
> I'm not clear what the issue is here.  Is something that's accessing the
> registers forgetting to do a pm_runtime_get(), or doing that rather than
> using pm_runtime_get_sync()?  This doesn't feel safe or robust.

The context is that I have been trying to remove all timing dependencies
between components, and make sure that you can bind/unbind drivers in
any order, with the deferred probe making sure that all required
components are already probed. I started this after seeing reports of
kernel oopses when the machine driver was removed, and realizing that
the SoundWire bus itself didn't support bind/unbind tests by design.

In the case where you bind the machine driver after a delay, then the
bus might be suspended already, and there are cases where we see
timeouts for registers that are not regmap-managed (usually
vendor-specific stuff with an indirection mechanism), and even for
regmap the register read-write are cache-based when the bus is suspended.

What this patch does it make sure that the bus is operation when the
card is created. In usual cases, this is a no-op, this just helps with
corner test cases. It's not plugging a major hole in the pm_runtime
support, just fixing a programming sequence that was not tested before.

One possible objection is that we don't keep the reference and the bus
active until all components are probed. I tried doing this at the ASoC
core level, but that breaks all kinds of devices that have their own
quirky way of dealing with pm_runtime - specifically HDaudio and HDMI.
That's why I added this resume here.

Makes sense?

