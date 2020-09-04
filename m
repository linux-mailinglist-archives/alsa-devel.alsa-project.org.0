Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C994F25D0D2
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 07:12:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D3EF1ABF;
	Fri,  4 Sep 2020 07:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D3EF1ABF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599196357;
	bh=JL5hlEqAO1CvuAIi2Pmv3JSHZEXfeYK3TlK8ZhEqdLE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YxLY7sr5LzxjSmrxl1TTTDu1oGVM/EGHSN0hYXaQs+nHme9/nkwAttViyTYhBGafn
	 duZZ8Jl0LZpDzt+sKdBOqKOvhw5afJtz8L9i/Y02u1V/7cEzyg1wdnU0E+Vm7NVElw
	 baA5+uEqFUMxJMZLNfgBrLIiBfHytObz7MFj21wE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ADB9F800F0;
	Fri,  4 Sep 2020 07:10:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F231F8024A; Fri,  4 Sep 2020 07:10:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3360CF800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 07:10:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3360CF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EKR4i72o"
Received: from localhost (unknown [122.182.253.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B9F03206B7;
 Fri,  4 Sep 2020 05:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599196242;
 bh=JL5hlEqAO1CvuAIi2Pmv3JSHZEXfeYK3TlK8ZhEqdLE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EKR4i72o6KurMdZKZBFgw9SN1ygVPqUQod9OmNx6AroxLoah11kRndIyyZuBZ8tR/
 WxkEwUIA5KCTCRsY0FLc41Dm8DmaWLdTrB2iXL0771wVVenKdh7rennjUhJJgNxx3P
 bWAPnrmMAwIrXqFx4iihi+34VI324MCDcGPro+mU=
Date: Fri, 4 Sep 2020 10:40:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/7] ASoC: soundwire: Move sdw stream operations to
Message-ID: <20200904051036.GU2639@vkoul-mobl>
References: <20200901150240.19288-1-yung-chuan.liao@linux.intel.com>
 <20200903104248.GQ2639@vkoul-mobl>
 <033ea005-e948-c2c6-9bd4-e074d3effde0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <033ea005-e948-c2c6-9bd4-e074d3effde0@linux.intel.com>
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

On 03-09-20, 09:05, Pierre-Louis Bossart wrote:
> 
> 
> On 9/3/20 5:42 AM, Vinod Koul wrote:
> > On 01-09-20, 23:02, Bard Liao wrote:
> > > sdw stream operation APIs can be called once per stream. dailink
> > > callbacks are good places to call these APIs.
> > 
> > Again, please mention here if this is to be merged thru sdw tree or ASoC
> > tree
> 
> Good point, I thought it wouldn't matter but it does. I just gave it a try
> and there seems to be a conflict on Mark's tree w/ drivers/soundwire/intel.c
> (likely due to missing patches already added to Vinod's tree).
> 
> So this should go to Vinod's tree with Mark's Acked-by tag on the ASoC
> changes.
> 
> Alternatively we can also split this in two, with ASoC-only and
> SoundWire-only patches in separate series if it's easier for maintainers. We
> would lose the rationale for the changes but that's not essential.

If there are no dependencies on each other, that is best preferred
option. One should mention in cover-letter about the linked series
though.

> 
> > > Pierre-Louis Bossart (7):
> > >    ASoC: soc-dai: clarify return value for get_sdw_stream()
> > >    soundwire: stream: fix NULL/IS_ERR confusion
> > >    soundwire: intel: fix NULL/ERR_PTR confusion
> > >    ASOC: Intel: sof_sdw: add dailink .trigger callback
> > >    ASOC: Intel: sof_sdw: add dailink .prepare and .hw_free callback
> > 
> > These should be ASoC
> 
> Right. if you are fine with the content and this goes in your tree, can this
> be modified while applying? Or do want a v2?
> 
> > >    soundwire: intel: remove .trigger operation
> > >    soundwire: intel: remove stream handling from .prepare and .hw_free
> > > 
> > >   drivers/soundwire/intel.c        | 60 ++++-------------------
> > >   drivers/soundwire/stream.c       |  2 +-
> > >   include/sound/soc-dai.h          |  3 +-
> > >   sound/soc/intel/boards/sof_sdw.c | 81 ++++++++++++++++++++++++++++++++
> > >   4 files changed, 92 insertions(+), 54 deletions(-)
> > > 
> > > -- 
> > > 2.17.1
> > 

-- 
~Vinod
