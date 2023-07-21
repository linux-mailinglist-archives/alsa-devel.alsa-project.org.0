Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B4575C742
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 14:59:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1ADE4E;
	Fri, 21 Jul 2023 14:58:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1ADE4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689944360;
	bh=zHA3NMVEahQuxN9TbalHSR//3tVFIu25x6Hg5W/vUXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m6CQo2EJfirlIRruAZzjIVJSEVuyjF2PLJqR0Av5yzoQoChXEiSD43kJO96v+ttD1
	 Q3IzCbTCdpw//Gm/jutzpddgCeJ42jH/skC47OcQzxZGB4A6kf18z1bNJ5aWgtcx+7
	 Z8bfasTpXEnbSNkrPvXlu7IWuieED+Vgj5i9w+tY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EB2DF804DA; Fri, 21 Jul 2023 14:58:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC753F8032D;
	Fri, 21 Jul 2023 14:58:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54B5BF8047D; Fri, 21 Jul 2023 14:58:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 576C3F800D2
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 14:58:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 576C3F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SFT8aKD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689944297; x=1721480297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zHA3NMVEahQuxN9TbalHSR//3tVFIu25x6Hg5W/vUXk=;
  b=SFT8aKD0lQzi3DeYzJF8ywgxr5dFNnp2LgOYUBq+5RL5nCj13plIT0vx
   8dGL/gJ6pdrm2w3xGMg4ssWpeOBI6PT4Khn1DaLGYwqFy/Op6xwC4la7w
   oi84b5UvMZcaUer9NeYUQdjfOjT3vE9wmJ9G3K8vi77rPcOB0+GoVSQWw
   YCLnFyibiGkViRGlP7X8Wrc8aRxra6y+TlqHPUj63e+Xue2HaSPyC5cRO
   K7Xffm3e3cVfDfpjq9WItvnCHp8FI0KkMLAY9pDr8M9GeCvbAj1I9ryA7
   nVkIfj7FjB9cfIvQjLMT/NXLkPDPuQmub1gbnO24dU41q1PrJ1jC0Ddng
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="346614671"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="346614671"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 05:58:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="718806314"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="718806314"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 21 Jul 2023 05:58:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qMpht-005DfM-2R;
	Fri, 21 Jul 2023 15:58:05 +0300
Date: Fri, 21 Jul 2023 15:58:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v1 1/1] ALSA: korg1212: Re-use sockptr_t and respective
 APIs
Message-ID: <ZLqA3f8tdqxzZn/k@smile.fi.intel.com>
References: <20230721100146.67293-1-andriy.shevchenko@linux.intel.com>
 <878rb9h901.wl-tiwai@suse.de>
 <ZLphAJG4Tz8zLUSN@smile.fi.intel.com>
 <87y1j9fs55.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y1j9fs55.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: AHTIK5II3MGX3VORUP7MJL5POSK4RFZW
X-Message-ID-Hash: AHTIK5II3MGX3VORUP7MJL5POSK4RFZW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AHTIK5II3MGX3VORUP7MJL5POSK4RFZW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 21, 2023 at 12:58:14PM +0200, Takashi Iwai wrote:
> On Fri, 21 Jul 2023 12:42:08 +0200,
> Andy Shevchenko wrote:
> > On Fri, Jul 21, 2023 at 12:08:46PM +0200, Takashi Iwai wrote:
> > > On Fri, 21 Jul 2023 12:01:46 +0200,
> > > Andy Shevchenko wrote:

...

> > > While I see the benefit, I feel this is very confusing.  If we use the
> > > API for a generic use, it should be renamed at first.

> > Any suggestion for the name?
> 
> It's a universal pointer...  uniptr_t?
> Or a generic pointer, genptr_t?
> 
> I'm not good at naming, and I'm open for it.

It seems it's already spread enough with this name, I would rather stick with
it for now (besides net it's used in crypto, nvme, and security).

The (new) callback though makes a lot of sense on its own.

What do you think?

-- 
With Best Regards,
Andy Shevchenko


