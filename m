Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 494396366CB
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 18:17:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE38E16DF;
	Wed, 23 Nov 2022 18:16:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE38E16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669223847;
	bh=9xE2IqP0KBsfRtdmc8ZVF2DkL+MOQ8a+r0kEVIXmtoo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=faLKMn4CA+1buUIKAyYsLcGS3Hp1/jymz0Z/1MeZEnHoeJDIz6CDezhBPaAGFXtXY
	 lEaYFg28eFmZIOLvUN5ck2i5HCHWaOMrneBuWaiK7+JYb+7TPrVu11OW+B6UaRsXMY
	 rYVvM2hr9tZQbT26OUPdgb8Ibubh8ZruTGsR5nZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72C01F800BB;
	Wed, 23 Nov 2022 18:16:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF474F8025D; Wed, 23 Nov 2022 18:16:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7638F800BB
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 18:16:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7638F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p9LcoYSo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 50BBCB81FE3;
 Wed, 23 Nov 2022 17:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BEBC433C1;
 Wed, 23 Nov 2022 17:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669223782;
 bh=9xE2IqP0KBsfRtdmc8ZVF2DkL+MOQ8a+r0kEVIXmtoo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p9LcoYSoVrAIwZ1W7CImXNGOJg5h+R3VlUGErNgHl737BzFEgFTPDUycwRBLnTgXq
 6yqe3gNO4CoZeo21HbBm6SG6doXGN6jpAURLM/Kf+D8P1UK74ldFt+j6nBdHcyCqZ5
 X66s9vdFldMa6MEdsA54B32HFbtxgLmrn0e8b0lPP+fSFBOx2e142b9oDX+Z4PirN9
 /eO4/oiUEC5dCHFqA7FTu7JFNbe/pMCKFOQTc4XK/xIdKTaBF6JpO+VxoI77fmTPAp
 OBu0MSKnQvvvQh/rUjN5TDNlkHWQaMov3GPIe2dkE7B/4ugjFqI4zoG6oztThUI44d
 IODa5p40rvCJg==
Date: Wed, 23 Nov 2022 22:46:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/2] ASoC/soundwire: remove is_sdca boolean property
Message-ID: <Y35VYW/s8Cnv1jEV@matsya>
References: <20221118025807.534863-1-yung-chuan.liao@linux.intel.com>
 <20221118025807.534863-2-yung-chuan.liao@linux.intel.com>
 <Y3enHzY8XY70/nWR@sirena.org.uk> <Y34znr8o9+RceRif@matsya>
 <Y347f24Tx5yZtjLw@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y347f24Tx5yZtjLw@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
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

On 23-11-22, 15:25, Mark Brown wrote:
> On Wed, Nov 23, 2022 at 08:22:14PM +0530, Vinod Koul wrote:
> > On 18-11-22, 15:39, Mark Brown wrote:
> > > On Fri, Nov 18, 2022 at 10:58:06AM +0800, Bard Liao wrote:
> > > > From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> > > > The Device_ID registers already tell us if a device supports the SDCA
> > > > specification or not, in hindsight we never needed a property when the
> > > > information is reported by both hardware and ACPI.
> 
> > > Acked-by: Mark Brown <broonie@kernel.org>
> 
> > sound/soc/codecs/rt1318-sdw.c does not exist for me in sdw/next. Can I
> > get a tag for the changes merged into ASoC for this
> 
> Not reasonably, that's basically the entire tree since Linus doesn't
> like branches.

Okay.

Anyway we are close to merge window, lets postpone this after that

Thanks
-- 
~Vinod
