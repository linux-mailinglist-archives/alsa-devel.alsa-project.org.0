Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA82255527
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 09:29:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5665184E;
	Fri, 28 Aug 2020 09:28:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5665184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598599757;
	bh=ZKgBgkPLZoJc/kStyrmzO8ZmcG3Mtvo7x+SL2dAs6h4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tHGSHeSYjrsivsDq5Zw5iu+X9B9nBFJKRt+7EG6SQJvRWJo2HhZ/bvNFp3B/zucJe
	 1Kfs2nz7HqMM6bK96ghwFTmRgZkpclR6u/WEEgOVrI0GhpvrlZ2y2esVieeDa1EFpr
	 R4H6eR8xvC2T5mkHpiEgkXjs2R+Ia7LJeVvYy2Hs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 256D1F8020C;
	Fri, 28 Aug 2020 09:28:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 339DEF80264; Fri, 28 Aug 2020 09:27:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9595DF80105
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 09:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9595DF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JAD8CL0E"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E4A1208CA;
 Fri, 28 Aug 2020 07:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598599667;
 bh=ZKgBgkPLZoJc/kStyrmzO8ZmcG3Mtvo7x+SL2dAs6h4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JAD8CL0Erh/teDxbTuuqQKHrcaC4IOjBehDT+dOCTzkSzWeRm6aLY/L0GxdYa0VnE
 umaTSwvQm7Jz3t9C7KjMKDt1NSAEiLqpHxe2pHdHW/GGem0ordiP4IKnZlBnVwoZOC
 G6rH4GRVGr2R2TSr3mFocrivVjQ7KYGo09mAQc94=
Date: Fri, 28 Aug 2020 12:57:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 05/11] soundwire: bus: update multi-link definition with
 hw sync details
Message-ID: <20200828072742.GL2639@vkoul-mobl>
References: <20200818024120.20721-1-yung-chuan.liao@linux.intel.com>
 <20200818024120.20721-6-yung-chuan.liao@linux.intel.com>
 <20200826094420.GA2639@vkoul-mobl>
 <d534afc3-3c38-275e-2f62-0432ffd91a36@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d534afc3-3c38-275e-2f62-0432ffd91a36@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, rander.wang@linux.intel.com,
 bard.liao@intel.com
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

On 26-08-20, 09:09, Pierre-Louis Bossart wrote:
> 
> 
> > > + * @hw_sync_min_links: Number of links used by a stream above which
> > > + * hardware-based synchronization is required. This value is only
> > > + * meaningful if multi_link is set. If set to 1, hardware-based
> > > + * synchronization will be used even if a stream only uses a single
> > > + * SoundWire segment.
> > 
> > Soundwire spec does not say anything about multi-link so this is left to
> > implementer. Assuming that value of 1 would mean hw based sync will
> > be used even for single stream does not make sense in generic terms.
> > Maybe yes for Intel but may not be true for everyone?
> 
> hw-based sync is required for Intel even for single stream. It's been part
> of the recommended programming flows since the beginning but ignored so far.
> 
> That said, this value is set by each master implementation, no one forces
> non-Intel users to implement an Intel-specific requirement.
> 
> > We already use m_rt_count in code for this, so the question is why is
> > that not sufficient?
> 
> Because as you rightly said above, Intel requires the hw_sync to be used
> even for single stream, but we didn't want others to be forced to use the
> hw-sync for single stream. the m_rt_count is not sufficient for Intel.
> 
> I think we are in agreement on not forcing everyone to follow what is
> required by Intel, and that's precisely why we added this setting. If you
> set it to two you would only use hw_sync when two masters are used.

Okay, it would be better if we move it to intel driver, but I see it may
not be trivial, so lets go with this approach.

-- 
~Vinod
