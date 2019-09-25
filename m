Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7F5BDC66
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2019 12:50:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C91316D8;
	Wed, 25 Sep 2019 12:50:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C91316D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569408654;
	bh=n0NWm1U5FqMVpY5YODufA27UcRPO7RY9Y7coXyDtXe8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nrov4l4yCEHH3uuOt514Ybv+R4H7dEqntpSlvNIojNgpIfNBAq881ErR+4mAZgR6m
	 7uVdgQneYDx9mMRgn5AQNJYK10p+jsmFwzyjvaQ1O9HxRnNpSRzrjP+PDc1u4yylxJ
	 jJgs93nK2aFr/DPe3VXfiEcwZLKRy2ugcezXJzmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91288F8044C;
	Wed, 25 Sep 2019 12:49:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBF40F8044C; Wed, 25 Sep 2019 12:49:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49ED6F802BD
 for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2019 12:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49ED6F802BD
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 03:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,547,1559545200"; d="scan'208";a="340373433"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga004.jf.intel.com with ESMTP; 25 Sep 2019 03:48:52 -0700
Received: from andy by smile with local (Exim 4.92.1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1iD4qp-00030k-6h; Wed, 25 Sep 2019 13:48:51 +0300
Date: Wed, 25 Sep 2019 13:48:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Message-ID: <20190925104851.GC5933@smile.fi.intel.com>
References: <20190925040841.29141-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925040841.29141-1-navid.emamdoost@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, kjlu@umn.edu,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, emamd001@umn.edu,
 smccaman@umn.edu, Thomas Gleixner <tglx@linutronix.de>,
 Enrico Weigelt <info@metux.net>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: Skylake: prevent memory leak
 in snd_skl_parse_uuids
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Sep 24, 2019 at 11:08:38PM -0500, Navid Emamdoost wrote:
> In snd_skl_parse_uuids if allocation for module->instance_id fails, the
> allocated memory for module shoulde be released.

Since it's using devm_*() for the second allocation it would be cleaner to
either switch it to regular kcalloc() or to switch the first one to
devm_kzalloc(), whatever suits better.

>  		module->instance_id = devm_kzalloc(ctx->dev, size, GFP_KERNEL);
>  		if (!module->instance_id) {

> +			kfree(module);

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
