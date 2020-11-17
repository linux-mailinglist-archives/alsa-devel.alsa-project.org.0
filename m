Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3C82B690B
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 16:51:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CF531789;
	Tue, 17 Nov 2020 16:50:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CF531789
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605628293;
	bh=5+nIbkYbhzkRqN60Y9TgQAzehdvb8IcMXIuYLyxbSbc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NaM336Jp9g8Kbn84d93jo545q3RzNsWoodxBMUG4FfQDD8kQMMDAJh7bTcCHNwqmd
	 pVzBy6iSsn6Tni5haL72QjSeaqNlnEU0Sd1+uaNeWonERykT+tzLpv8aO09LXhau8S
	 1JVG0Vb3L+LOl03sJwII87zSSPHcliRbQ0ThrrmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E737DF801F9;
	Tue, 17 Nov 2020 16:50:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30AA7F801F5; Tue, 17 Nov 2020 16:49:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB036F8010A
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 16:49:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB036F8010A
IronPort-SDR: 9wh+93C6cl2DmtWHKf2ZsphyLDodce2/in6Y+2IzGURJ3ky+77X54tenaAuUowiGGEhZPfWEUj
 jZsuNHUQw/BA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="157977182"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; d="scan'208";a="157977182"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 07:49:39 -0800
IronPort-SDR: DB6VKKE5nQTxBaYQ7AHm6dGkLlr3L4Be76/B1jvjW8x8L/IoStokm45BV62toind2MTA6WPkfR
 Qv3vjIGYxnyQ==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; d="scan'208";a="330116334"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 07:49:36 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1kf3Fe-007MHw-Is; Tue, 17 Nov 2020 17:50:38 +0200
Date: Tue, 17 Nov 2020 17:50:38 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Subject: Re: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Message-ID: <20201117155038.GO4077@smile.fi.intel.com>
References: <20201117080354.4309-1-michael.wei.hong.sit@intel.com>
 <20201117080354.4309-4-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117080354.4309-4-michael.wei.hong.sit@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 lars@metafoo.de, alsa-devel@alsa-project.org, jee.heng.sia@intel.com,
 tiwai@suse.com, liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 broonie@kernel.org
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

On Tue, Nov 17, 2020 at 04:03:48PM +0800, Michael Sit Wei Hong wrote:
> Enabling custom prepare and submit function to overcome DMA limitation.
> 
> In the Intel KeemBay solution, the DW AXI-based DMA has a limitation on
> the number of DMA blocks per transfer. In the case of 16 bit audio ASoC
> would allocate blocks exceeding the DMA block limitation.

I'm still not sure the hardware has such a limitation.

The Synopsys IP supports linked list (LLI) transfers and I hardly can
imagine the list has any limitation. Even though, one can always emulate
LLI in software how it's done in the DesignWare AHB DMA driver.

I have briefly read chapter 4.6 "AXI_DMA" of Keem Bay TRM and didn't
find any errata or limits like this.

-- 
With Best Regards,
Andy Shevchenko


