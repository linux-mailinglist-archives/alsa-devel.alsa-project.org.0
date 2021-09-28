Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2BB41B5C3
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 20:17:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 509E5169F;
	Tue, 28 Sep 2021 20:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 509E5169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632853027;
	bh=iqV3pmiMDJgBA1kZKWZyMAIi6VoLY0W/vhqG6R05HZ4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RQXCQAG4cFosncE69GolAWUfxe6wVqKSYLAkwzz8/rkANqbx+WzQuyK1cCGw1B+Tj
	 1h+HWGDT1ptzvvI4fmYSRCDpGt2HgxdUJsL1GCygRFY7nxASz9ALkx2OFxxuLSi/Of
	 QS2BRbda5Q9V1xN+PgnjSYW9Bd0MTRAzHQWujZbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6444F80105;
	Tue, 28 Sep 2021 20:15:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED228F804AD; Tue, 28 Sep 2021 20:15:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D69CF800DE
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 20:15:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D69CF800DE
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="221569934"
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="221569934"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 11:15:35 -0700
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="438174376"
Received: from ppahwa-mobl1.amr.corp.intel.com (HELO [10.212.48.236])
 ([10.212.48.236])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 11:15:34 -0700
Subject: Re: [EXTERNAL] Re: [PATCH] ASoC: max98373: Mark cache dirty before
 entering sleep
To: Ryan Lee <RyanS.Lee@maximintegrated.com>, Mark Brown <broonie@kernel.org>
References: <20210924221305.17886-1-ryans.lee@maximintegrated.com>
 <1b21bbf1-12c7-726d-bff8-76ec88ff8635@linux.intel.com>
 <SJ0PR11MB566107A6AB3D18ABDEDCF245E7A79@SJ0PR11MB5661.namprd11.prod.outlook.com>
 <20210927160622.GE4199@sirena.org.uk>
 <7b8c3875-3f12-f3cb-7da8-4e850e59ee2b@linux.intel.com>
 <20210927171033.GF4199@sirena.org.uk>
 <0af258d4-e33c-15ec-5dcc-a1c9961c0740@linux.intel.com>
 <SJ0PR11MB56618B8B6DE3922613E83C15E7A89@SJ0PR11MB5661.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a8d2f176-df63-f81b-e47a-73b1c436b612@linux.intel.com>
Date: Tue, 28 Sep 2021 13:15:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <SJ0PR11MB56618B8B6DE3922613E83C15E7A89@SJ0PR11MB5661.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "guennadi.liakhovetski@linux.intel.com"
 <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ryan.lee.maxim@gmail.com" <ryan.lee.maxim@gmail.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
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




>>>> Instead of changing the suspend sequence, can we please try to modify
>>>> the max98373_io_init() routine to unconditionally flag the cache as
>>>> dirty, maybe this points to a problem with the management of the
>>>> max98373->first_hw_init flag.
>>>
>>> A quick survey of other drivers suggests that this pattern should be
>>> factored out into some helpers as it looks like there's several ways
>>> of implementing it that look very similar but not quite the same...
>>
>> No disagreement here, we tried really hard to enforce a common pattern for
>> suspend-resume, but i just noticed that the maxim amp driver is different on
>> suspend (resume is consistent with the rest).
> 
> OK. I believe it was similar before. But it looks like 'regcache_mark_dirty' is being
> disappeared on suspend function.

Not sure what you are trying to say?

> static int __maybe_unused rt5682_dev_suspend(struct device *dev)
> {
> 	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
> 
> 	if (!rt5682->hw_init)
> 		return 0;
> 
> 	cancel_delayed_work_sync(&rt5682->jack_detect_work);
> 
> 	regcache_cache_only(rt5682->regmap, true);
> 	regcache_mark_dirty(rt5682->regmap);
> 
> 	return 0;
> }

That last line is also not needed. If you look at rt5682-sdw.c, you'll
see a regcache_mark_dirty() when the device is re-initialized.

But now I am starting to wonder if this is due to Chrome kernel
differences and possibly a missing backport patch? I no longer believe
in coincidences, these two devices are ONLY used in Chromebooks so far...
