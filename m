Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7E92740DB
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 13:31:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E613170A;
	Tue, 22 Sep 2020 13:30:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E613170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600774276;
	bh=K85oP2JzJuryzOt/UY5Zuqxd/y+TDY32vyc1uiBl4Tc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FLk5FDcW7uqnqWQVnqdLDetCsdh+7xNUQMzkih6biiBGeO1tjniKhZWog8AinAM/v
	 XwYowB5PRfHCEUV9ST8YJ0cVgEgGWdVj5FjIRLnXsyj72PA5gArCNkYZtGMPSiBSuO
	 FTXK1wt6tALHt+Ki59APsqqFxjGfazGsxKSji6Wo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5051F80232;
	Tue, 22 Sep 2020 13:29:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C180EF80229; Tue, 22 Sep 2020 13:29:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D620F800ED
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 13:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D620F800ED
IronPort-SDR: 9LpY6tWp+DDLgP68Q4LZlpNA2jmjkNJ4iy2xamCbt+n24aREB/v8t221nRe+7RrNuqSMu7ItZL
 O2SmzJZeXdgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="159872726"
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="159872726"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 04:29:18 -0700
IronPort-SDR: JJoprP5cXbgG3TXYZ4DXw/jFiegSrdVM3xtnEt1HEPqblvMy6dL9y/3SkumPH/tRcJXsihk9K9
 2Lz4kmqBOw+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="338262646"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 22 Sep 2020 04:29:14 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kKgTu-0014wV-Eh; Tue, 22 Sep 2020 14:29:10 +0300
Date: Tue, 22 Sep 2020 14:29:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: Re: [PATCH v7 03/14] ASoC: Intel: catpt: Add IPC message handlers
Message-ID: <20200922112910.GM3956970@smile.fi.intel.com>
References: <20200921115424.4105-1-cezary.rojewski@intel.com>
 <20200921115424.4105-4-cezary.rojewski@intel.com>
 <20200921125934.GT3956970@smile.fi.intel.com>
 <55266617b42843839fb85309d3097fd6@intel.com>
 <20200921184129.GH3956970@smile.fi.intel.com>
 <191afe965b1e46799bf776be3254d28f@intel.com>
 <20200922090442.GJ3956970@smile.fi.intel.com>
 <4e51e628f9df457c8253a3ef6d7095eb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e51e628f9df457c8253a3ef6d7095eb@intel.com>
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

On Tue, Sep 22, 2020 at 11:04:31AM +0000, Rojewski, Cezary wrote:
> On 2020-09-22 11:04 AM, Andy Shevchenko wrote:
> > On Mon, Sep 21, 2020 at 08:48:12PM +0000, Rojewski, Cezary wrote:
> >> On 2020-09-21 8:41 PM, Andy Shevchenko wrote:
> 
> ...
> 
> >> While this should never happen (means user is somehow not making use of
> >> officially released firmware binary), coredumps are useful only if you
> >> have access to debug tools. In cases you'd mentioned, invalid hash would
> >> have been dumped to coredump and crash reader simply wouldn't have been
> >> able to navigate to actual build for it. The rest of the coredump is still
> >> vital though.
> >>
> >> memcpy() could be gated behind an 'if' for safety if needed:
> >>
> >> 	info = cdev->ipc.config.fw_info;
> >> 	eof = info + FW_INFO_SIZE_MAX;
> >> 	/* navigate to fifth info segment (fw hash) */
> >> 	for (i = 0; i < 4 && info < eof; i++, info++)
> >> 		/* info segments are separated by space each */
> >> 		if ((info = strnchr(info, eof - info, ' ')) == NULL)
> >> 			break;
> > 
> >> 	if (i == 4 && info < eof)
> >> 		memcpy(pos, info, min(eof - info, CATPT_DUMP_HASH_SIZE));
> > 
> > And here basically enough check is info against NULL, right?
> > Just try to look at different possibilities how to make code simpler and neater.
> > 
> >> Didn't compile this, some typecheck fixes might be in order and so on.
> > 
> 
> What you meant is:
> 	if (i == 4 && !info) // instead of 'info < eof'
> 
> right?

Simply if (!info)...

> If 4th space is last char in this string then info would end up being
> non-NULL and equal to 'eof' and thus memcpy() would get invoked with
> size=eof-info=0.

...which is not a problem.

> catpt_coredump() is here to gather debug info for Intel folks to analyze
> in case of critical error. In ideal world, it should not be required at
> all as when we get here, there are bigger problems on our head.
> Above solution is simpler than what is prevent in v7 while also
> maintaining good readability - variable names - plus comments which you
> suggested.

Thanks!

-- 
With Best Regards,
Andy Shevchenko


