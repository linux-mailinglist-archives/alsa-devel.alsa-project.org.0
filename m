Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C77DB247E73
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 08:30:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 522A2171E;
	Tue, 18 Aug 2020 08:29:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 522A2171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597732221;
	bh=zBw9hFO+H66X4Rr03LngM7OaVXF0mK9y8qCEVNvyBVw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SLuP/aFj2kUZ/DkMGpcTrpqkginwHJzRAw5QNlER6SZyz4O9wbkANi4zZr0L972dz
	 2A+VMjZhwg9FezuKq886cIr2NkcAnTYqzMvBYXkKNRQNOP8kzeCVGw5mL/cZITuuGo
	 uAp54KTMcim55a7+rqE2P2JVIMps5yFOqcDZmQvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9913F800D3;
	Tue, 18 Aug 2020 08:29:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 732D1F80279; Tue, 18 Aug 2020 08:29:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEEFFF800D3
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 08:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEEFFF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BdGkNHmL"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B24B20825;
 Tue, 18 Aug 2020 06:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597732159;
 bh=zBw9hFO+H66X4Rr03LngM7OaVXF0mK9y8qCEVNvyBVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BdGkNHmLk2pD8vhckIj7kQXtI+aSrPKhj9pKMOHnMPS+QaPuN8td+x1ZzXfkOMgaz
 Sb7XmZP1K4Y2i/7naBcfrKZXcR6wL2fzwmNgf9zTHsy2e1knLwsWsAJCa7SVWm3vvC
 EkVIEdHbsKHoDTlzVRmPuqctTDKnKWBq0nx1oz/0=
Date: Tue, 18 Aug 2020 11:59:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/13] soundwire: intel: add power management support
Message-ID: <20200818062915.GT2639@vkoul-mobl>
References: <20200721203723.18305-1-yung-chuan.liao@linux.intel.com>
 <20200817120841.GQ2639@vkoul-mobl>
 <d8f8f64f-34db-9c9a-c821-83dda3b2db9a@linux.intel.com>
 <093dcb7d-e2b7-b568-6a23-aeaf9bfb6004@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <093dcb7d-e2b7-b568-6a23-aeaf9bfb6004@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, slawomir.blauciak@intel.com,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On 17-08-20, 11:10, Pierre-Louis Bossart wrote:
> 
> 
> > > I had applied except 3 & 9 (few skipped in middle due to conflict while
> > > applying), BUT I get a build failure on patch 2 onwards :(
> > > 
> > > drivers/soundwire/intel_init.c: In function ‘sdw_intel_cleanup’:
> > > drivers/soundwire/intel_init.c:72:4: error: implicit declaration of
> > > function ‘pm_runtime_disable’
> > > [-Werror=implicit-function-declaration]
> > >     72 |    pm_runtime_disable(&link->pdev->dev);
> > > 
> > > I suspect due to missing header? I was on x64 build with allmodconfig
> > > 
> > > So only patch 1 is applied and pushed now
> > 
> > I just tried on these series applied on top of soundwire/next
> > 
> > commit 9b3b4b3f2f2af863d2f6dd65afd295a5a673afa2 (soundwire/next)
> > 
> >      soundwire: intel: Add basic power management support
> > 
> > And I don't see any issue?
> 
> Sorry, I misunderstood the issue. Yes indeed the #include
> <linux/pm_runtime.h> is added to the wrong patch, I see Bard fixed this in
> our tree. Not sure what happened here, I ran a patch-by-patch compilation
> test a long time ago and kbuild was silent. Thanks for spotting this.
> 
> > If you want to double-check merge issues, I pushed the code here:
> > https://github.com/plbossart/sound/tree/sdw/pm_runtime_soundwire_next
> > 
> > I am really not sure what conflicts you are referring to, git am worked
> > fine for me, only skipped the first patch that's already applied.
> 
> But the point about conflicts does remain, I am not sure why you skipped
> patches, I have no merge conflicts on my side.

As noted above, I tried to apply except 3 & 9 due to questions on them.
It is quite normal that dependencies fail to apply, not sure why you are
confused.

-- 
~Vinod
