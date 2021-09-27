Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FD4419C5C
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:26:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1369916AD;
	Mon, 27 Sep 2021 19:25:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1369916AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632763593;
	bh=n3pcYp/DcyyZuHkqSMKrhOn84OpbfzwCrysq16Pl5ag=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iYjmP0ZPekTdHUsT3+Lkm8V0YWbH39LcZ5QRqJK014NtnLgyDY800jUbKdgEApKPV
	 +AzdQi8RRarA8S3hHgNiNZCdEpZ8/UrciB1IYiIH4RmjBg4jmM+Gi1JZ7msHpMZ15H
	 s+ZJMt2CQeu/zYTmLUPEDYJsWpcXqojnSd4hz4LM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E7DBF80147;
	Mon, 27 Sep 2021 19:25:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A91AF80227; Mon, 27 Sep 2021 19:25:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECFDFF801EC
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:25:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECFDFF801EC
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="247017906"
X-IronPort-AV: E=Sophos;i="5.85,327,1624345200"; d="scan'208";a="247017906"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 10:23:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,327,1624345200"; d="scan'208";a="486218694"
Received: from asen4-mobl2.amr.corp.intel.com (HELO [10.212.27.2])
 ([10.212.27.2])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 10:23:08 -0700
Subject: Re: [EXTERNAL] Re: [PATCH] ASoC: max98373: Mark cache dirty before
 entering sleep
To: Mark Brown <broonie@kernel.org>
References: <20210924221305.17886-1-ryans.lee@maximintegrated.com>
 <1b21bbf1-12c7-726d-bff8-76ec88ff8635@linux.intel.com>
 <SJ0PR11MB566107A6AB3D18ABDEDCF245E7A79@SJ0PR11MB5661.namprd11.prod.outlook.com>
 <20210927160622.GE4199@sirena.org.uk>
 <7b8c3875-3f12-f3cb-7da8-4e850e59ee2b@linux.intel.com>
 <20210927171033.GF4199@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0af258d4-e33c-15ec-5dcc-a1c9961c0740@linux.intel.com>
Date: Mon, 27 Sep 2021 12:23:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210927171033.GF4199@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "guennadi.liakhovetski@linux.intel.com"
 <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ryan.lee.maxim@gmail.com" <ryan.lee.maxim@gmail.com>,
 Ryan Lee <RyanS.Lee@maximintegrated.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
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



On 9/27/21 12:10 PM, Mark Brown wrote:
> On Mon, Sep 27, 2021 at 11:48:56AM -0500, Pierre-Louis Bossart wrote:
>> On 9/27/21 11:06 AM, Mark Brown wrote:
> 
>>> More specifically what it does is make the invalidation of the register
>>> cache unconditional.  It doesn't really matter if the invalidation is
>>> done on suspend or resume, so long as it happens before we attempt to
>>> resync - this could also be done by deleting the first_hw_init check.
> 
>> Mark, that's exactly my point: if the amp rejoins the bus, we will
>> *always* mark the cache as dirty, before the resync is done in the
>> resume sequence.
> 
> Ah, yes - I see.
> 
>> I am really trying to figure out if we have a major flaw in the resume
>> sequence and why things are different in the case of the Maxim amp.
> 
>> Instead of changing the suspend sequence, can we please try to modify
>> the max98373_io_init() routine to unconditionally flag the cache as
>> dirty, maybe this points to a problem with the management of the
>> max98373->first_hw_init flag.
> 
> A quick survey of other drivers suggests that this pattern should be
> factored out into some helpers as it looks like there's several ways of
> implementing it that look very similar but not quite the same...

No disagreement here, we tried really hard to enforce a common pattern
for suspend-resume, but i just noticed that the maxim amp driver is
different on suspend (resume is consistent with the rest).


static int __maybe_unused rt711_dev_suspend(struct device *dev)
{
	struct rt711_priv *rt711 = dev_get_drvdata(dev);

	if (!rt711->hw_init)
		return 0;

	cancel_delayed_work_sync(&rt711->jack_detect_work);
	cancel_delayed_work_sync(&rt711->jack_btn_check_work);
	cancel_work_sync(&rt711->calibration_work);

	regcache_cache_only(rt711->regmap, true);

	return 0;
}

static int __maybe_unused rt1308_dev_suspend(struct device *dev)
{
	struct rt1308_sdw_priv *rt1308 = dev_get_drvdata(dev);

	if (!rt1308->hw_init)
		return 0;

	regcache_cache_only(rt1308->regmap, true);

	return 0;
}

static __maybe_unused int max98373_suspend(struct device *dev)
{
	struct max98373_priv *max98373 = dev_get_drvdata(dev);
	int i;

<<<< missing test

	/* cache feedback register values before suspend */
	for (i = 0; i < max98373->cache_num; i++)
		regmap_read(max98373->regmap, max98373->cache[i].reg,
&max98373->cache[i].val);

<<<< why is this needed???

	regcache_cache_only(max98373->regmap, true);

	return 0;
}



