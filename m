Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CD478AD79
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 12:49:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AAB684B;
	Mon, 28 Aug 2023 12:48:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AAB684B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693219743;
	bh=hqTn4OWArUED+Sh4oIj6OK93XFWFbPb60hshBveyuLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ibbJDklfdHzJfQ7IaAMPdagQ+t1sB/pFhPlE4THU4+95LGuC+7Nu+t8m0qSfKkr2E
	 Wzso0Kq62sWaoMwKeEryodCTtApHGEss3k5HJ7UZKQUPFgUsMKkbcs4yT/muBUXg+/
	 fWtflsoQ35vNxTH+9sKonhmuM/a4ulRS9gB0OfYo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7840F8032D; Mon, 28 Aug 2023 12:48:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ED81F80155;
	Mon, 28 Aug 2023 12:48:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AB04F80158; Mon, 28 Aug 2023 12:48:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43D7DF800F5
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 12:48:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43D7DF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iFv2P+z+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693219685; x=1724755685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hqTn4OWArUED+Sh4oIj6OK93XFWFbPb60hshBveyuLU=;
  b=iFv2P+z+40ejyJW9r2zeK+0y+KIrY5XER/ZnpEXDfz5yBDeVc2DuUKCE
   4F2HmPnf+4uJtnOGIhZWkM+7B6IKJTlJ0faTWR7YVvjxO5XsBifrJyEY2
   V/54DEwaNmV0TuSaGy7nGMWkVXHg+lcmkg5U/a88VoCX3KX+2q/VwpBeo
   i7HbUYvYp7CMjyHzWtNqTbmSmYoK3lEGlPADSDwy/mZ3JVjVNy40AyAtm
   tkDmViYOlk/GD35P2ReqnAWQXhjNAUlDJaghghZgVAYNsMel7bLR2F6DF
   Y1lYD9ZYcqZjQX5cTEovHphvrMxQD/hqPdNV2cpeMkejzj+htFZSATu6P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="373961579"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000";
   d="scan'208";a="373961579"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 03:48:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="738201018"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000";
   d="scan'208";a="738201018"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 28 Aug 2023 03:47:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qaZmk-00Er8N-1m;
	Mon, 28 Aug 2023 13:47:54 +0300
Date: Mon, 28 Aug 2023 13:47:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Shenghao Ding <shenghao-ding@ti.com>, robh+dt@kernel.org,
	lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	mengdong.lin@intel.com, baojun.xu@ti.com, thomas.gfeller@q-drop.com,
	peeyush@ti.com, navada@ti.com, broonie@kernel.org,
	gentuser@gmail.com
Subject: Re: [PATCH v5 1/2] ALSA: hda/tas2781: Add tas2781 HDA driver
Message-ID: <ZOx7WjdGPzPkqiQv@smile.fi.intel.com>
References: <20230828022556.578-1-shenghao-ding@ti.com>
 <87cyz71y7j.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cyz71y7j.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: YGOYSVIQA7PSP5EHP3UVI6LE75SLZJ3P
X-Message-ID-Hash: YGOYSVIQA7PSP5EHP3UVI6LE75SLZJ3P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YGOYSVIQA7PSP5EHP3UVI6LE75SLZJ3P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 28, 2023 at 08:24:16AM +0200, Takashi Iwai wrote:
> On Mon, 28 Aug 2023 04:25:55 +0200,
> Shenghao Ding wrote:
> > 
> > Integrate tas2781 configs for Lenovo Laptops. All of the tas2781s in the
> > laptop will be aggregated as one audio device. The code support realtek
> > as the primary codec.
> > 
> > Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> 
> Shenghao, your previous patches have been already merged!
> Please take the latest sound.git tree before the submission.
> 
> Make your changes on top of the latest sound.git tree in a
> fine-grained incremental way, and submit those instead *ASAP*, so that
> the necessary fixes can be merged for 6.6-rc1.

...with Cc'ing me, please.

-- 
With Best Regards,
Andy Shevchenko


