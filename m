Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 689DE7A881D
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 17:21:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E68DA823;
	Wed, 20 Sep 2023 17:20:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E68DA823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695223275;
	bh=EmXFqkTuFNEaiLGXrgBSisJ8kBCI85FLrWVY62a5974=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Obrxf+OhzUsT18XgHhtR6/2Vihucn6tZRJegR3AWPrKgjEJl1fo85VU436dPNzXzs
	 C4/TEzX4Jf1b0tfwp6Jz656llceSywaF+Lex2FewPHscxnNInFlt6itHBrmvuejZTL
	 3txobBftWCJMlhLi7EmgBxpNJeb8sKV2qXmy0xwo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6826AF80552; Wed, 20 Sep 2023 17:20:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27044F801F5;
	Wed, 20 Sep 2023 17:20:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA0BFF8025A; Wed, 20 Sep 2023 17:20:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFE4FF800F4
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 17:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFE4FF800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PGuza+Gv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695223214; x=1726759214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EmXFqkTuFNEaiLGXrgBSisJ8kBCI85FLrWVY62a5974=;
  b=PGuza+GvFTJgqzBmjTc0PB5HAbx6PF8470p3UB3N9jkdUDxKW/7micWJ
   9ezf0rsrRToqMT6TQLJ/CY+00lYzX7MBvmGJ5Qbh8VWibxLQA+CXTz0kA
   jo/PoeobljU/JHbxpe6XO/jceq50SHmS+jq5pmA4vCmS1oYId00SQlHUf
   iwu/Egw31IRawARKmzawfsKuwDju/Yt4QZ/L5Sh1Pg9wYcwROgGzboMLS
   otg0BGVVm61/fiZniLl/lns2yln8tXNCu9vJmffiFCaFAXWBmUzIgbekn
   vFG1w3SmazdzPLN6M5T3PDKQ2mxTHHgZwLhI5Dv/PY/h4Ib60SeK4hI5U
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="444349109"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200";
   d="scan'208";a="444349109"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 08:19:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="862024014"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200";
   d="scan'208";a="862024014"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 08:19:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qiyzY-0000000Gc8Z-1pGW;
	Wed, 20 Sep 2023 18:19:52 +0300
Date: Wed, 20 Sep 2023 18:19:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>, tiwai@suse.com,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH 2/2] ALSA: hda: cirrus_scodec: Add KUnit test
Message-ID: <ZQsNl146RFAYdjSL@smile.fi.intel.com>
References: <20230918095129.440-1-rf@opensource.cirrus.com>
 <20230918095129.440-3-rf@opensource.cirrus.com>
 <ZQoILN6QCjzosCOs@google.com>
 <874jjpwd4i.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874jjpwd4i.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: W5VGGAKV7OGPHYAWQ7Q6PGVIOSHDUTPE
X-Message-ID-Hash: W5VGGAKV7OGPHYAWQ7Q6PGVIOSHDUTPE
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W5VGGAKV7OGPHYAWQ7Q6PGVIOSHDUTPE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 20, 2023 at 08:51:57AM +0200, Takashi Iwai wrote:
> On Tue, 19 Sep 2023 22:44:28 +0200,
> Nick Desaulniers wrote:
> > 
> > On Mon, Sep 18, 2023 at 10:51:29AM +0100, Richard Fitzgerald wrote:
> (snip)
> > > +static void cirrus_scodec_test_set_gpio_ref_arg(struct software_node_ref_args *arg,
> > > +						int gpio_num)
> > > +{
> > > +	struct software_node_ref_args template =
> > > +		SOFTWARE_NODE_REFERENCE(&cirrus_scodec_test_gpio_swnode, gpio_num, 0);
> > 
> > I'm observing the following error when building with:
> > 
> > $ make LLVM=1 -j128 allmodconfig sound/pci/hda/cirrus_scodec_test.o
> > 
> > sound/pci/hda/cirrus_scodec_test.c:151:60: error: initializer element is not a compile-time constant
> >   151 |                 SOFTWARE_NODE_REFERENCE(&cirrus_scodec_test_gpio_swnode, gpio_num, 0);
> >       |                                                                          ^~~~~~~~
> > /builds/linux/include/linux/property.h:291:37: note: expanded from macro 'SOFTWARE_NODE_REFERENCE'
> >   291 |         .nargs = ARRAY_SIZE(((u64[]){ 0, ##__VA_ARGS__ })) - 1, \
> >       |                                            ^~~~~~~~~~~
> > /builds/linux/include/linux/kernel.h:57:75: note: expanded from macro 'ARRAY_SIZE'
> >    57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
> >       |                                                                           ^~~
> > /builds/linux/include/linux/compiler.h:228:59: note: expanded from macro '__must_be_array'
> >   228 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
> >       |                                                                ^
> > /builds/linux/include/linux/compiler_types.h:366:63: note: expanded from macro '__same_type'
> >   366 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
> >       |                                                               ^
> > /builds/linux/include/linux/build_bug.h:16:62: note: expanded from macro 'BUILD_BUG_ON_ZERO'
> >    16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
> >       |                                                              ^
> 
> Hm, this looks like some inconsistent handling of the temporary array
> passed to ARRAY_SIZE() in the SOFTWARE_NODE_REFERENCE macro.  LLVM
> can't treat it if it contains a variable in the given array, while GCC
> doesn't care.
> 
> A hackish workaround would be the patch like below, but it's really
> ugly.  Ideally speaking, it should be fixed in linux/properties.h, but
> I have no idea how to fix there for LLVM.
> 
> Adding more relevant people to Cc.

Thank you, I think it's quite easy to fix. Lemme cook the patch...

-- 
With Best Regards,
Andy Shevchenko


