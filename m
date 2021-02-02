Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B2030B69D
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 05:43:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B16101753;
	Tue,  2 Feb 2021 05:42:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B16101753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612241006;
	bh=nX3/V7s2GfjVuoWmd8LLu4djIxPn2e4AMdAsfP9xNxo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vgyDaeF4zviRjg2xh7zbSfx4SdZI6z7cJ9r4Bsv6aXPQGDHzzo8E4s8mtng2ac6oE
	 57us8BG+8kJevlRTSP3g6eMgf/g7nkg8jm2Q8F+KGWYq9DUT1cktVRocD2L5XRd9Cl
	 FTzBrH58ebwR5Y2bwg8HHp/WlVDhwDPOIwgKrFHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 187DAF801F7;
	Tue,  2 Feb 2021 05:41:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6051F80171; Tue,  2 Feb 2021 05:41:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90DAFF80109
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 05:41:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90DAFF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KBAlsTZo"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7A5D64ED3;
 Tue,  2 Feb 2021 04:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612240903;
 bh=nX3/V7s2GfjVuoWmd8LLu4djIxPn2e4AMdAsfP9xNxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KBAlsTZoYJ7kCmoKDjbQR6NVHem1Yingf2BQgUp+mACYEyYvaky78aUieMODqBAXL
 wPiXHydG1oZc8O2ft/ksWi5u4RjbutGYJbW9ICQq1eas6YZ+h/gXBNkYV4lJyy22/R
 kKqSe/GJVO1D8a1kEUXcPkHkOAUayaU770/An6YRRYWc9EDmAaV5zYfPFnqN/x/IOA
 BOkGVIRnDxVBOswxwVZFmXhUDDUB5TSKBBrWXXu/rz22BGgbvzz8HilAAex6BtR48U
 maWJ3r0Jp8hz6W6tbPYdFso9T45+4WhZgX2QUZRN9RLn6p45ZDCPM/EaAw+A6P6ByS
 ACvM3kgoukrfQ==
Date: Tue, 2 Feb 2021 10:11:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/3] soundwire: intel: add
 SDW_MASTER_QUIRKS_CLEAR_INITIAL_CLASH quirk
Message-ID: <20210202044139.GH2771@vkoul-mobl>
References: <20210126083746.3238-1-yung-chuan.liao@linux.intel.com>
 <20210126083746.3238-3-yung-chuan.liao@linux.intel.com>
 <20210201104229.GY2771@vkoul-mobl>
 <0ed1c91b-09ca-dc6f-39d1-850d12f4f9c4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ed1c91b-09ca-dc6f-39d1-850d12f4f9c4@linux.intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org, jank@cadence.com,
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

On 01-02-21, 10:20, Pierre-Louis Bossart wrote:
> 
> 
> On 2/1/21 4:42 AM, Vinod Koul wrote:
> > On 26-01-21, 16:37, Bard Liao wrote:
> > > There is nothing we can do to handle the bus clash interrupt before
> > > interrupt mask is enabled.
> > > 
> > > Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> > > Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
> > > Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > > ---
> > >   drivers/soundwire/intel.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> > > index a2d5cdaa9998..f7ba1a77a1df 100644
> > > --- a/drivers/soundwire/intel.c
> > > +++ b/drivers/soundwire/intel.c
> > > @@ -1286,6 +1286,8 @@ static int sdw_master_read_intel_prop(struct sdw_bus *bus)
> > >   	if (quirk_mask & SDW_INTEL_QUIRK_MASK_BUS_DISABLE)
> > >   		prop->hw_disabled = true;
> > > +	prop->quirks = SDW_MASTER_QUIRKS_CLEAR_INITIAL_CLASH;
> > 
> > Should this not be last 'enabling' the quirk patch in series :)
> 
> Sorry, I don't understand the comment. Do you mind clarifying Vinod?

Sure, I would like to series built as, first defining the quirk
along/followed by bus changes. Then the last patch should be intel
controller changes and setting the quirks (like above) in the last
patch.

Let me know if you would need further clarification

-- 
~Vinod
