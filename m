Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8464E578A76
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jul 2022 21:15:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2459116B2;
	Mon, 18 Jul 2022 21:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2459116B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658171737;
	bh=Xp0ZNpYz19QNvdTmcofg5uiTtsnhZ7FV23L2OrUqiGk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YLwcAPZn9psSRyCVWpRNX6iP5YGg/XGoAWfx9lE6oWTGMB/ZJ5iO9wDE56guMFSxc
	 5qiCwbmOnAA/jCZsk06AiMhHsUDqS1lrBwknRpO8KfZsc1Ae3Z/XI30wYU7F6Cor6Q
	 XWZFZAoivHUVSIj1U4utDQ++U1kCR8YK52Ttd9c4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8037FF80095;
	Mon, 18 Jul 2022 21:14:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3905F80095; Mon, 18 Jul 2022 21:14:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98302F80095
 for <alsa-devel@alsa-project.org>; Mon, 18 Jul 2022 21:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98302F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RGsj1ORX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658171672; x=1689707672;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Xp0ZNpYz19QNvdTmcofg5uiTtsnhZ7FV23L2OrUqiGk=;
 b=RGsj1ORX2aVKSmmzp62uYRyzr6IV4qatgmtdhj10jGELSKvrjSL0UBkc
 3o9nOR1ufGQJeh0gwfj8VS7AnyMRPawmUQtOj3x3kmObECsA1c8fNs1RH
 VTiTRQQCqP9xIfwyDwF4j6NDWRrovW0BcDq5EI8PWCakHD82YxmOrn4q3
 M03pDDtAKDrFTwb+CSK95xAxpCrTEMAJ1CZOU8gMbxPd5yb0BQNb8iysu
 ncufUJ+jtKEh8azvNP4XETg7oK82vHtV4E5Qje+D2LfbmtlZDHc9ZNo2z
 P5c84H3VoOpCausdppwnFrxE9AIOthERni0HRdVZWBpWW4FBgZMtTNCTl w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="273130829"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="273130829"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 12:14:27 -0700
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="700145102"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 12:14:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oDWCE-001OPa-29; Mon, 18 Jul 2022 22:14:22 +0300
Date: Mon, 18 Jul 2022 22:14:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v1 1/1] ALSA: isa: Use INVALID_HWIRQ definition
Message-ID: <YtWxDmEtDMORLUSX@smile.fi.intel.com>
References: <20220715205737.83076-1-andriy.shevchenko@linux.intel.com>
 <87zgh9tuna.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zgh9tuna.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
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

On Sat, Jul 16, 2022 at 08:54:17AM +0200, Takashi Iwai wrote:
> On Fri, 15 Jul 2022 22:57:37 +0200,
> Andy Shevchenko wrote:

...

> > -#define INVALID_IRQ  ((unsigned)-1)
> > -
> > +#define INVALID_IRQ  ((unsigned)INVALID_HWIRQ)
> 
> This seems failing to build on my local tree as is.
> We need to include <linux/irq.h> explicitly.

As Marc told me this is probably the way to the wrong direction, so, please,
discard this patch anyway.

-- 
With Best Regards,
Andy Shevchenko


