Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 449BD629E06
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 16:48:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7BC41679;
	Tue, 15 Nov 2022 16:48:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7BC41679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668527335;
	bh=QhtIFitBUVQQqjdVNUzXUsVTOtyY5X/TcbGpxY+iIVY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C7ct+kk8Dp5NB7CoxmQMUvv05Ags/nI3OfvX/1WTLOM5v7dyxkxjWPOYM5E90VkIr
	 qPxtTP4DJT+Lrsc6YA70yG8ouMcSqIJVkWq45Vx1UI2YN9MrnejYh3C01wphmBibM4
	 vb7kddARm2Uwb4FJgKCgrKEc7U2U0Yfmj+EyBvFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57BCFF8047C;
	Tue, 15 Nov 2022 16:48:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BD57F800B8; Tue, 15 Nov 2022 16:47:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03339F800B8
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 16:47:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03339F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JzmYeBRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668527277; x=1700063277;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QhtIFitBUVQQqjdVNUzXUsVTOtyY5X/TcbGpxY+iIVY=;
 b=JzmYeBREvlp1Gl3wDX56FHoXv37+ztKzZ/i1bf19//fQgByCwaQd6+95
 MaINODAI36wCXwlBqEhL2yyU54Nv3JdeLHbNWPcaTIHsMRfRUDBI2gink
 xnMeFYzN2lxAvpNGrqFiRGA8/4D9zQE/1vVyH13mX3Ag3mpStmJ0ZXLxF
 +0w5pcntV+4z5hVAPVsrLE2DCe9Gu+Z/3+6Hfq+RDf/V36sR5jkoWDNXO
 JnGWJ/y5qD+RicgqupDj3iNc3GNdw1TShuQUdx1OXLV/Y98YqOe7bSfDl
 yBIXbAbrZ+mp/pNlZaCp5Fl9zase0phLlyk9e0qgXTVehJzKmWJUFMOtK Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="312288467"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="312288467"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 07:47:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="968028185"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="968028185"
Received: from bathomp1-mobl1.amr.corp.intel.com (HELO [10.209.177.76])
 ([10.209.177.76])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 07:47:51 -0800
Message-ID: <f8206ecf-7215-1f85-02ef-7d4f57a7898f@linux.intel.com>
Date: Tue, 15 Nov 2022 09:12:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 2/4] soundwire: Provide build stubs for common functions
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20221114102956.914468-1-ckeepax@opensource.cirrus.com>
 <20221114102956.914468-3-ckeepax@opensource.cirrus.com>
 <90b01c76-fc65-a57f-9247-fae78241342c@linux.intel.com>
 <20221115110345.GM10437@ediswmail.ad.cirrus.com>
 <730128a9-46ce-02b2-f88d-c9982fff2e69@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <730128a9-46ce-02b2-f88d-c9982fff2e69@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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



On 11/15/22 05:41, Richard Fitzgerald wrote:
> On 15/11/2022 11:03, Charles Keepax wrote:
>> On Mon, Nov 14, 2022 at 10:13:07AM -0600, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 11/14/22 04:29, Charles Keepax wrote:
>>>> Provide stub functions when CONFIG_SOUNDWIRE is not set for functions
>>>> that are quite likely to be used from common code on devices supporting
>>>> multiple control buses.
>>>
>>> So far this case has been covered by splitting SoundWire related code
>>> away from, say I2C, and with a clear 'depends on SOUNDWIRE'. This is the
>>> case for rt5682, max98373, etc.
>>>
>>> Is this not good enough?
>>>
>>> I am not against this patch, just wondering if allowing code for
>>> different interfaces to be part of the same file will lead to confusions
>>> with e.g. register offsets or functionality exposed with different
>>> registers.
>>>
>>
>> I guess this is a bit of a grey area this one. Both work, I guess
>> the reason I was leaning this way is that in order to avoid a
>> circular dependency if I put all the soundwire DAI handling into
>> the soundwire code then I have to duplicate the snd_soc_dai_driver
>> structure into both the sdw and i2c specific code (worth noting
>> the I2S DAIs are still usable when the part is sdw to the host). But
>> there are also downsides to this approach in that it will likely have
>> some small impact on driver size when soundwire is not built in.
>>
> 
> I think we should just add the stubs. Other subsystems use stubs to help
> with code that references stuff that might not be available.
> 
> Splitting all the soundwire-specifics out into a separate module works
> for simple chips that are either I2S or soundwire. but can get messy for
> a complex codec. I used the separate file method for CS42L42, but for a
> driver I'm working on I abandoned that and put both DAIs in the core
> code. I didn't notice the missing stubs because my defconfig that was
> intended to omit soundwire apparently has something that is selecting
> it anyway.

It would be good if you could look into this, I don't see any 'select
SOUNDWIRE'.

I agree the premise of the split was that the device is used in one mode
of the other, I am not sure however what the a 'complex codec' would
change. It's likely that we will see a second level within a SoundWire
device to deal with independent 'functions', but I don't quite see how
this would matter.

That said, I don't write codec drivers so I am not going to lay on the
tracks over 2 stubs. We can revisit the sdw.h split as well later.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
