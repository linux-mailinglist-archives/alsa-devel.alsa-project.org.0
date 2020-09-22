Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B74273E2F
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 11:11:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F73A16BD;
	Tue, 22 Sep 2020 11:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F73A16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600765861;
	bh=75X1RnaqSFHSE4DGo7GYPix8ymnTMmYCl3WQsbxDp+w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tmhdyA75OjLie6+koR9smVSjbed9Cn2TKeUy+TWSkd7gaLpiKr6hQEz/Ipc7orVQy
	 UZoUMDy9nnme4i5gc37qZONKIYIHRrVObIKXRRTscUADH1uB464xnqZR9UXsbH5iSx
	 jfb5b8ktjTqD4ONLZR8aJBoaFwYzdXlbZON+grRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C449F80234;
	Tue, 22 Sep 2020 11:09:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3174BF80232; Tue, 22 Sep 2020 11:09:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E9DDF800ED
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 11:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E9DDF800ED
IronPort-SDR: 2MAmNGuyARTaRqmkkIpcpzWjpvON7BuRfl2P39XdpAFAqfxGi3ezKqejStBOelGqLHKdTnMOhA
 LOrF8+e/x4xQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="160635644"
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="160635644"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 02:09:11 -0700
IronPort-SDR: 9N9wE06v8UKMsVU/jhqo5e7NNTyoXnl1ry0kUjw78fhX50gad6c5MUvjsql5jgUQaybFg9AEtY
 lVcW8X2N8S+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="338222298"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 22 Sep 2020 02:09:07 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kKeE6-0013BQ-HO; Tue, 22 Sep 2020 12:04:42 +0300
Date: Tue, 22 Sep 2020 12:04:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: Re: [PATCH v7 03/14] ASoC: Intel: catpt: Add IPC message handlers
Message-ID: <20200922090442.GJ3956970@smile.fi.intel.com>
References: <20200921115424.4105-1-cezary.rojewski@intel.com>
 <20200921115424.4105-4-cezary.rojewski@intel.com>
 <20200921125934.GT3956970@smile.fi.intel.com>
 <55266617b42843839fb85309d3097fd6@intel.com>
 <20200921184129.GH3956970@smile.fi.intel.com>
 <191afe965b1e46799bf776be3254d28f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <191afe965b1e46799bf776be3254d28f@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Barlik,
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

On Mon, Sep 21, 2020 at 08:48:12PM +0000, Rojewski, Cezary wrote:
> On 2020-09-21 8:41 PM, Andy Shevchenko wrote:> On Mon, Sep 21, 2020 at 06:13:59PM +0000, Rojewski, Cezary wrote:
> >> On 2020-09-21 2:59 PM, Andy Shevchenko wrote:
> >>> On Mon, Sep 21, 2020 at 01:54:13PM +0200, Cezary Rojewski wrote:

...

> While this should never happen (means user is somehow not making use of
> officially released firmware binary), coredumps are useful only if you
> have access to debug tools. In cases you'd mentioned, invalid hash would
> have been dumped to coredump and crash reader simply wouldn't have been
> able to navigate to actual build for it. The rest of the coredump is still
> vital though.
> 
> memcpy() could be gated behind an 'if' for safety if needed:
> 
> 	info = cdev->ipc.config.fw_info;
> 	eof = info + FW_INFO_SIZE_MAX;
> 	/* navigate to fifth info segment (fw hash) */
> 	for (i = 0; i < 4 && info < eof; i++, info++)
> 		/* info segments are separated by space each */
> 		if ((info = strnchr(info, eof - info, ' ')) == NULL)
> 			break;

> 	if (i == 4 && info < eof)
> 		memcpy(pos, info, min(eof - info, CATPT_DUMP_HASH_SIZE));

And here basically enough check is info against NULL, right?
Just try to look at different possibilities how to make code simpler and neater.

> Didn't compile this, some typecheck fixes might be in order and so on.

-- 
With Best Regards,
Andy Shevchenko


