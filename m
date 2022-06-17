Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCE954FD34
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 21:06:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BED531AEB;
	Fri, 17 Jun 2022 21:06:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BED531AEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655492812;
	bh=Acm7L0yWTfh7CU4NZXlwDb32M0Gx3Vy3Ky60jr8owbs=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lxKN/wlamMvlho8UnerhpdEThdxM6EwmkZCzx/091J4D1kMEIB+FGZ3U6jcKJn5KA
	 j1yYeYx1QZ8o2RkCzhB+hFm815btFWlGJKkS7cmDw14kUim9pyTB2yyLh2dHFFCvhE
	 M+UZtF8ewsHsREVJGgh1UsHjKj1HWxgA8stvWUc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F877F80528;
	Fri, 17 Jun 2022 21:05:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2F39F8028B; Fri, 17 Jun 2022 21:05:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E9C6F8028B
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 21:05:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E9C6F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LkJTnGxp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655492749; x=1687028749;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=Acm7L0yWTfh7CU4NZXlwDb32M0Gx3Vy3Ky60jr8owbs=;
 b=LkJTnGxpsBd9Bh/uCApH17qaa8Za2DsrkXmdn9t58VJglxAhsEUy6qAM
 DZKENVa6J34YFIyMh4xJ0nwVjQJGNkKquG1QIki5yH/z8KdrfUClWWWwM
 ymqbi0ydxAbMuOYuYM1y7gSLBTf6cmtHacd4S7TrgP2PlVHbaMpE1LKZs
 cvbgO9WREy2GIg4o17lXoNlcIXhNbeOvCiTZuG46z7MoepQfMQNfWNaCj
 fUoV1mBhCLTVLjsYR4QX4jWA8sDSh+CcNHcjNf1Gwt0ICLkU5XqZmaDPO
 1g3ynrq8KjK0Pll5BfJZ/m3BbQONfcc2VPSK4tLVOnQjRBr+BXqvz+iLq Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="279600195"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="279600195"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 12:05:43 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="642147472"
Received: from patelman-mobl1.amr.corp.intel.com (HELO [10.212.115.29])
 ([10.212.115.29])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 12:05:43 -0700
Message-ID: <59c76ae6-6d97-cdd4-ce1f-020ddf54593b@linux.intel.com>
Date: Fri, 17 Jun 2022 14:05:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] ASoC: codecs: soundwire: call pm_runtime_resume() in
 component probe
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
References: <20220616210825.132093-1-pierre-louis.bossart@linux.intel.com>
 <20220616210825.132093-3-pierre-louis.bossart@linux.intel.com>
 <YqxNEjG19K/RbbFM@sirena.org.uk>
 <1ddc85ea-4e40-eb07-ee5b-8bc58514223d@linux.intel.com>
 <Yqy7xahv6vTjT/KO@sirena.org.uk>
 <ed329dca-48f7-16fd-96eb-337becd372d8@linux.intel.com>
In-Reply-To: <ed329dca-48f7-16fd-96eb-337becd372d8@linux.intel.com>
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


>>> What this patch does it make sure that the bus is operation when the
>>> card is created. In usual cases, this is a no-op, this just helps with
>>> corner test cases. It's not plugging a major hole in the pm_runtime
>>> support, just fixing a programming sequence that was not tested before.
>>
>>> One possible objection is that we don't keep the reference and the bus
>>> active until all components are probed. I tried doing this at the ASoC
>>> core level, but that breaks all kinds of devices that have their own
>>> quirky way of dealing with pm_runtime - specifically HDaudio and HDMI.
>>> That's why I added this resume here.
>>
>>> Makes sense?
>>
>> Ish.  Ugh, right.  So it's not fixing anything really, it's mainly
>> papering over cracks where things are being missed.  In any case it's
>> not doing any harm and it helps things for now.
> 
> You got it right. There are additional patches that were sent to use
> pm_runtime_resume_and_get() on set_jack, and other clear cases that were
> missed, but this is more of a blanket "do not harm" resume in case codec
> drivers are missing something.

please wait for merges, we're chasing two regressions with nonsensical
mixer values

numid=5,iface=MIXER,name='PGA4.0 4 Master Capture Volume'
  ; type=BOOLEAN,access=rw---R--,values=2
  : values=on,on
  | dBscale-min=-50.00dB,step=1.00dB,mute=1

and a spurious log that we missed:

snd-soc-dummy snd-soc-dummy: Runtime PM usage count underflow!
