Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 864E465DAB7
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 17:49:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A52CFBD2E;
	Wed,  4 Jan 2023 17:49:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A52CFBD2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672850994;
	bh=mEq9W5dgWpSJiZZbrWI25k4VVJPZgYN5UhDmi7NHqNs=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Fmwm9Rm73rZgswWdu699wnFu9JIZr/5D+oL0GuiJd+PdZRmuTOjaAiaOT1a0vQ6ZN
	 0ebV4f7vu/AaPApiwwb0vq6W7JsQ62yUFs7ZhO3lDQmmXCyQGxJ/NbHh3Na7A8+YQl
	 6WLkIIokBHTEGRTBI7Sqt+1zxU8+1Nd4gHkXIYaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 768C6F8023B;
	Wed,  4 Jan 2023 17:49:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FF36F8024E; Wed,  4 Jan 2023 17:49:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38E16F8023A
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 17:48:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38E16F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EPpmoKl9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672850940; x=1704386940;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mEq9W5dgWpSJiZZbrWI25k4VVJPZgYN5UhDmi7NHqNs=;
 b=EPpmoKl9Ms5OLZbx8zNboiCXu5t4gzHEIQO5YXvh+e0FtyMt102DwzBA
 uAYSKp1MhmSX55x7g0+USeKntQARxXQgBQt58PGvB1ylDVee053Wt/ShE
 75LOWm1U/h/vh55KAcxS/DbX6gKvQX3NbdZLxo/02/hI5nw8R341DBk2/
 9RmjS7NzvvTdtzYXv6eMDVtnNUr1ECbj1bpxHC1g3mhttAKYJWCnPqKQ1
 gxOkE1HJHn2dlUauafmVxlHiySoh/eDpdPWMWETsWM27XV50qrVn7E8nm
 A2eS1ToS1sZy47gHoCSrYrG5TuVtZhM4fiOZmdXefA3pZf+TIORXOB/Da A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="302351237"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; d="scan'208";a="302351237"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 08:48:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="797600777"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; d="scan'208";a="797600777"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga001.fm.intel.com with ESMTP; 04 Jan 2023 08:48:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pD6vz-004Nt0-25; Wed, 04 Jan 2023 18:48:11 +0200
Date: Wed, 4 Jan 2023 18:48:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 1/5] ASoC: Intel: bytcht_cx2072x: Replace open coded
 acpi_dev_put()
Message-ID: <Y7WtywhUZCTx3akM@smile.fi.intel.com>
References: <20230102203037.16120-1-andriy.shevchenko@linux.intel.com>
 <731b2d59-22f1-a456-bcfc-040a1adccce0@linux.intel.com>
 <Y7VVCc7TjY3YsJoV@smile.fi.intel.com>
 <151a05a5-fc56-e005-e572-d031e6de0bb1@linux.intel.com>
 <Y7WsdF1rK/JmS01W@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7WsdF1rK/JmS01W@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 04, 2023 at 04:42:28PM +0000, Mark Brown wrote:
> On Wed, Jan 04, 2023 at 08:15:27AM -0600, Pierre-Louis Bossart wrote:
> 
> > For this series
> 
> > Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> According to b4 you've only acked the first patch here because Andy
> doesn't send cover letters :/

Is b4 capable to spread tags from cover letter to the whole series?
(Sorry, I'm a bit outdated with all Swiss-knife possibilities that
 b4 provides)

-- 
With Best Regards,
Andy Shevchenko


