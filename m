Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E9677CF81
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 17:46:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8A2491;
	Tue, 15 Aug 2023 17:45:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8A2491
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692114397;
	bh=24HZ+W3/BPWICRHz4YSlTU3HA8tS2LdPxwy0RPTELLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CUlRaOC+CzLpw4/f23pCmE32AGOUXpG24v+WUnqvm0gWlex2Bp0rsuKixENZURCg5
	 07xDVF9mHtXE/gfGOokmKvHAj796n8Sk2aP2mJ4YPOPD7uKz5rkW+JwxRu79HgtP8g
	 EEjANhK1rY07W/tXqSg0+/AvpBIqm4u7+U55DtRE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A1AEF80290; Tue, 15 Aug 2023 17:45:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91497F8016A;
	Tue, 15 Aug 2023 17:45:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56872F8016D; Tue, 15 Aug 2023 17:45:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 463EEF800EE
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 17:45:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 463EEF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZidN1C2d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692114334; x=1723650334;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=24HZ+W3/BPWICRHz4YSlTU3HA8tS2LdPxwy0RPTELLA=;
  b=ZidN1C2dYwnAG1SfdH0ALj47WE8k6xDeyEExyvWqkng4kNRz9iNgHUO+
   FK9RDyJ28wke/7kTzI18JgLH1H9ieQzKkQkcirq7sBjsl1pyKGpR3rf0P
   2v22zjeRIKvGfW9sdgKYim9bQdxLuuh9oiA+Zi4vWU68N5OwaPdRqjjMB
   7gqy3H6P+3rjAWsPz2xaCLpU+/A/dS7VcVw5cpdBhz6Zkjr6z9KWXLV82
   bar5UZR9+Kqy0gVZBPOPHOawLqGSZnt7bIPVi97pOmBUVelz5YUmNE6Iw
   Unm75hWC8k0WlvJ+OUWTlOWsMLd6iW+qar4BmS+7iC21zc8h0GCYSiImq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="362458984"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200";
   d="scan'208";a="362458984"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 08:45:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="733882453"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200";
   d="scan'208";a="733882453"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 15 Aug 2023 08:45:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qVwEV-007spR-1c;
	Tue, 15 Aug 2023 18:45:23 +0300
Date: Tue, 15 Aug 2023 18:45:23 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 21/25] ASoC: dmaengine: Convert to generic PCM copy ops
Message-ID: <ZNudk4147ByqSNdP@smile.fi.intel.com>
References: <20230814115523.15279-1-tiwai@suse.de>
 <20230814115523.15279-22-tiwai@suse.de>
 <ZNuE5UunDd40e8vW@smile.fi.intel.com>
 <87wmxwxsmb.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmxwxsmb.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: K5NEXZFMO23CKQBB556OOI4NBIG33A4C
X-Message-ID-Hash: K5NEXZFMO23CKQBB556OOI4NBIG33A4C
X-MailFrom: andriy.shevchenko@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K5NEXZFMO23CKQBB556OOI4NBIG33A4C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 15, 2023 at 04:55:24PM +0200, Takashi Iwai wrote:
> On Tue, 15 Aug 2023 16:00:05 +0200,
> Andy Shevchenko wrote:
> > 
> > Can be compressed to a single conditional:
> > 
> > 	if (is_playback && copy_from_iter(dma_ptr, bytes, buf) != bytes)
> 
> I prefer keeping the changes minimalistic in this kind of conversion
> unless it becomes too ugly.  Then it's more clearer what's actually
> changed.

Fine by me!

-- 
With Best Regards,
Andy Shevchenko


