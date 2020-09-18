Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7B926FF33
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 15:54:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17E6F16DE;
	Fri, 18 Sep 2020 15:54:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17E6F16DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600437295;
	bh=v8BUhtjbaVeS3c5zNpv0Lrfz3XhD85Ait1P58p4a/WU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fhn9Zenbkh5YcwfzAAhdvYQzl5wU+AgsG3djV68baIjFexZaGtfXkMJQHNQM0isS7
	 /7eWnn4zbR23aogeA1TPmo9PwvRa6htvgqLD+a2sW1RkaKHqlaQN+ctLtnVaxFkK4d
	 CDGNvC6/X2BPHUyagKO6meV2gVb9GAZ/AB3uizYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47134F8015C;
	Fri, 18 Sep 2020 15:53:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9F0EF8015A; Fri, 18 Sep 2020 15:53:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E9E8F8013A
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 15:53:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E9E8F8013A
IronPort-SDR: ulJu3ENPaYCiXjRIQEMC+p/Y7/FC3w1VF5nXK9pB7D8nrX7LztoucjcDV2GYlL0jO5E4NjC6v3
 RBpyhyxIk0hA==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="159994234"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="159994234"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 06:52:56 -0700
IronPort-SDR: E+zL1FU9tWt/sGe4gw5lPRZklMzad8aUNWM0oQgKn2NA0p8xYuOCjs7LyQMjaGW94k/KYC5I0w
 kNz99184sEdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="336811479"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 18 Sep 2020 06:52:51 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kJGoi-0000CW-5I; Fri, 18 Sep 2020 16:52:48 +0300
Date: Fri, 18 Sep 2020 16:52:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: Re: [PATCH v5 02/13] ASoC: Intel: catpt: Define DSP operations
Message-ID: <20200918135248.GC3956970@smile.fi.intel.com>
References: <20200915162944.16241-1-cezary.rojewski@intel.com>
 <20200915162944.16241-3-cezary.rojewski@intel.com>
 <20200916154409.GQ3956970@smile.fi.intel.com>
 <96ee725f1aa746c78ee380bb8e754ff3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96ee725f1aa746c78ee380bb8e754ff3@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "Proborszcz, Filip" <filip.proborszcz@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Hejmowski,
 Krzysztof" <krzysztof.hejmowski@intel.com>, "Papierkowski,
 Piotr \(Habana\)" <ppapierkowski@habana.ai>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
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

On Thu, Sep 17, 2020 at 03:29:36PM +0000, Rojewski, Cezary wrote:
> On 2020-09-16 5:44 PM, Andy Shevchenko wrote:
> > On Tue, Sep 15, 2020 at 06:29:33PM +0200, Cezary Rojewski wrote:

...

> >> +	dmac->regs = cdev->lpe_ba +
> >> +		     cdev->spec->host_dma_offset[CATPT_DMA_DEVID];
> > 
> > One line?
> > 
> It's exactly 81 after one-lining - that's why I kept it as is.

And 81 is okay when there is better readability.

I'm wondering why you don't go 100...

In any case it's not a reason to resend.

-- 
With Best Regards,
Andy Shevchenko


