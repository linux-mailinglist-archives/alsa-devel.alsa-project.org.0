Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A74553D4A
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 23:13:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 100A21FCA;
	Tue, 21 Jun 2022 23:12:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 100A21FCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655845990;
	bh=3VYHZtc2ikkG3vblkfL1teN+9Lm6Baqu+NS6YC6loys=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=msNc1Gjrw3Y8v+cn3mqAWOLSJe3VVjMRVEc5sjfRqWeLa/CJqGEikmiXyU5IasXSa
	 W1E8WLRA6390kroH7u0Jd4HAPqXduJpdcmgD4RwPKVQFDBubk9oav4+so50JyG6uJP
	 nPrSl2DjBialCWMZRAZnt6EWYJvGMeuFWUEggkzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DE5EF80253;
	Tue, 21 Jun 2022 23:12:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7022F80152; Tue, 21 Jun 2022 23:12:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5924FF80155
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 23:12:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5924FF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZHkolWSf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655845927; x=1687381927;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3VYHZtc2ikkG3vblkfL1teN+9Lm6Baqu+NS6YC6loys=;
 b=ZHkolWSfw8oI9iH1cBsbuqY1G6GCtN9BUtZoV1BGbA4GhXX4E6IKaMW/
 2nvvGvp4LzOFDcx7G1JbKGuxe0K+WzF1GEM2dOE6m6oCTtraSIquSI6gu
 wxJT9rtYtsiGVQbfUwyNOnFJZHq/xhZMv+XW8ALNEKBM0P6OanyjhIy3B
 DZf8DNkCEyw70Y3qZ6PyJlxHybYs8EDIVX4TyaaKCDqfwAbOUC3x1803o
 xjQkeu/lEgSSt/yrvENsxw8Bbt5t4yshmamqrtumKVevs9ZYk2Y6Q1mUu
 Fk5FdwY8/bhY+YGRDQWkgDCM9wd03rYDjs8Kx0WEaUtHptZJmQqEcB+Zg Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="263270959"
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; d="scan'208";a="263270959"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 14:11:47 -0700
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; d="scan'208";a="591834528"
Received: from dpasupul-mobl.amr.corp.intel.com (HELO [10.209.178.35])
 ([10.209.178.35])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 14:11:47 -0700
Message-ID: <11ef5841-6c33-4647-7309-ba94da6308aa@linux.intel.com>
Date: Tue, 21 Jun 2022 16:11:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH v4 00/17] ASoC: Intel: haswell and broadwell boards update
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220620101402.2684366-1-cezary.rojewski@intel.com>
 <95a7a219-8330-628f-aa10-28a078217de7@linux.intel.com>
 <2ed532a4-a232-eb14-7122-e5b08cb79bb3@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <2ed532a4-a232-eb14-7122-e5b08cb79bb3@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: hdegoede@redhat.com, tiwai@suse.com, amadeuszx.slawinski@linux.intel.com
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



On 6/21/22 12:47, Cezary Rojewski wrote:
> On 2022-06-21 6:36 PM, Pierre-Louis Bossart wrote:
>> On 6/20/22 05:13, Cezary Rojewski wrote:
>>> A number of patches improving overall quality and readability of
>>> haswell.c and broadwell.c source files found in sound/soc/intel/boards.
>>> Both files are first renamed and only then actual changes are being
>>> incrementally added. The respective names are: hsw_rt5640 and bdw_rt286
>>> to match the pattern found in more recent boards.
>>>
>>> Most patches bring no functional change - the more impactful patches at
>>> are placed the end:
>>>
>>> Refactor of suspend/resume flow for the bdw_rt286 board by dropping
>>> dev->remove() in favour of card->remove() and adjust jack handling to
>>> reduce code size slightly by implementing card_set_jack().
>>>
>>> The last patch is removing of FE DAI ops. Given the existence of
>>> platform FE DAI capabilities (either static declaration or through
>>> topology file), this code is redundant.
>>
>> Possibly a mistake in our tests, but this error seems to be introduced:
>>
>> [  107.397637] kernel: rt286 i2c-INT343A:00: ASoC: DAPM unknown pin LDO1
>>
>> I'll have to re-run the tests, sharing this information as is.
> 
> 
> Hello,
> 
> Thanks for the report! However, this has been reported earlier during
> the v2 review [1]. This is also why a fix have been provided [2] earlier
> today. Notice that shape of link->exit() found here is shared by other
> Intel boards e.g.: SOF ones. In general, the initial discussion
> regarding card->remove() revealed some 'probe vs remove' problems within
> the framework.
> 
> 
> [1]:
> https://lore.kernel.org/alsa-devel/69e4263a-e036-cb21-2360-55b06600911e@intel.com/
> 
> [2]:
> https://lore.kernel.org/alsa-devel/1cff4ac0-6d45-95e1-ed9f-6abaded3f8b7@intel.com/T/#t

It's rather difficult to follow these changes and error reports buried
in email report sent on a Sunday of a three-day week-end for me.
I also had additional errors not reported,

[   36.125113] kernel: rt286 i2c-INT343A:00: ASoC: unknown pin HV
[   36.125128] kernel: rt286 i2c-INT343A:00: ASoC: unknown pin VREF
[   36.125130] kernel: rt286 i2c-INT343A:00: ASoC: unknown pin LDO1
[   36.125921] kernel: rt286 i2c-INT343A:00: ASoC: DAPM unknown pin LDO1

it's unclear to me why a dailink change in a machine driver would cause
such codec-side issues.

If the changes in this 17-patch series need to be tied to a framework
fix, you have to make the dependencies explicit and better yet provide a
self-contained patch series that does not introduce a temporary
regression, or introduce the framework change first and clearly describe
the dependency in a longer Broadwell-specific patchset. This is an 8-yr
old device, it shouldn't be that hard.


