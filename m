Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EF5750A31
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 15:58:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AAD01F1;
	Wed, 12 Jul 2023 15:57:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AAD01F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689170283;
	bh=VXHS3xFpizDVY2aWYLnjoKyQjbQnUw1MPOV+IXb5Pz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I5ug0D57x702vD2Db5PjFe6UOO9y2H/S99pnOpgzIJz4qvIYPU1JfGfCt/gAaysGS
	 DsaF67KeaC13NrYfW47G7umaZ8AnSHa/TY/mLP+SX8LIxs48KaM6RYmTTzYsiYltim
	 Ek6YZju11TRr3jfkLTUjaIkVquJdKhWpSHeBcHa8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44703F8024E; Wed, 12 Jul 2023 15:57:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D54DF80236;
	Wed, 12 Jul 2023 15:57:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3AB8F80249; Wed, 12 Jul 2023 15:57:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B7EFF80153
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 15:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B7EFF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jSs0Xsde
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689170221; x=1720706221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VXHS3xFpizDVY2aWYLnjoKyQjbQnUw1MPOV+IXb5Pz0=;
  b=jSs0Xsdeope8/nmYsGFOPlv0HAg/aaXKt71AT+6heACg80hAi+EtgZbk
   uICfvYZjDvM+2PZoV5unweuiZtKf8gu6YIo20iMhswWW95rIQmBHSFGI9
   TfPYuTM2oZ5WoMfZGfT2HKaK6azl/+ZH8B4xs2XJmamnOQeI/SsmSww2X
   HPUOVRVZNDwlXFlfOCuV9zhGG9XYBe65Dc+4pdscqS1uPl0z9IAxip/tS
   ov7nG1U0DqC9ntYOZi4xDXuvCGhVzjfrcY+geiGL0+DB3Sec2Eg8UszeN
   bQvpQ7tnnuYpefiIymjjbj9DuUEjCKzZuQESPRjMoQ8V25RE+LwiJpR1/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="428630603"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200";
   d="scan'208";a="428630603"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 06:56:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="671873184"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200";
   d="scan'208";a="671873184"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 12 Jul 2023 06:56:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJaKq-00295F-0J;
	Wed, 12 Jul 2023 16:56:52 +0300
Date: Wed, 12 Jul 2023 16:56:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v2 0/4] ASoC: rt5677: Refactor GPIO and use
 device_get_match_data()
Message-ID: <ZK6xI8l7Vdp35yJG@smile.fi.intel.com>
References: <20230630172155.83754-1-andriy.shevchenko@linux.intel.com>
 <168916242630.46574.7633971537485557226.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168916242630.46574.7633971537485557226.b4-ty@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: WGEPNTAPTLSTGZFJAZFYXU3NQCYKYIG4
X-Message-ID-Hash: WGEPNTAPTLSTGZFJAZFYXU3NQCYKYIG4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WGEPNTAPTLSTGZFJAZFYXU3NQCYKYIG4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 12, 2023 at 12:47:06PM +0100, Mark Brown wrote:
> On Fri, 30 Jun 2023 20:21:51 +0300, Andy Shevchenko wrote:
> > The code can be simplified with refactored GPIO parts and with use of
> > device_get_match_data(). Besides that couple of additional changes,
> > one for maintenance and one for making IRQ domain agnostic (not being
> > pinned to OF).

> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

JFYI: You might need to amend your scripts (?) as in the merge commit
      the Subject is cut (I believe that your scripts doesn't handle
      RFC2822 long lines in the email headers).

-- 
With Best Regards,
Andy Shevchenko


