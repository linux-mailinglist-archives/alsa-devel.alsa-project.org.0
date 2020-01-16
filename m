Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2407213D98C
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 13:05:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 827F917C3;
	Thu, 16 Jan 2020 13:04:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 827F917C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579176340;
	bh=3yjZ7hHKPrQrN+IZTGGowCV6I0OCN6PrObOHbCQ87GM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m/+ny7xvv8Sd2nRh8jHQt680vALzgENXnDsTi6kHfI8tvDrAMp3/a1arg3ie8busY
	 8rT2v5HyLBxh0MxfWSMX/MFZgPzzHIghhpncNpMS1tqJDsdguFjOl9UrKxLzqepm4L
	 OLZwLxCMbAXKm/weSKzkYGmeFZ60HH3xRHN17Eq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27D09F8014D;
	Thu, 16 Jan 2020 13:03:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51DEEF8014E; Thu, 16 Jan 2020 13:03:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42BEEF800E9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 13:03:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42BEEF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jKjXit/0"
Received: from localhost (unknown [223.226.122.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 49FC920663;
 Thu, 16 Jan 2020 12:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579176230;
 bh=KtX5tJKy5Hk3+x2VzUvP3+AgfvpKUSFz7vDwZZvkPO0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jKjXit/0EUNKfr25VxztK6cSK/DlonwNmDSBhZMLAbORjYVE/+GZ3eAQs2zAAvjcU
 Ch9tr6BUblYK4vlYJtdBjjVJw3fmV+RRQpruB/WUC69HKqCRJPnReedsfiSef+tx/S
 e3F/mCoBt68OtSTFrdJytuEGq1NHpTqOxOvncTtw=
Date: Thu, 16 Jan 2020 17:33:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200116120344.GO2818@vkoul-mobl>
References: <20200110220016.30887-1-pierre-louis.bossart@linux.intel.com>
 <a70c54c0-c691-d8eb-4f99-da1bb9306c2f@linux.intel.com>
 <20200114062605.GD2818@vkoul-mobl>
 <7a2e514c-edd1-fbeb-3ebb-df289c7436e2@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a2e514c-edd1-fbeb-3ebb-df289c7436e2@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] soundwire: intel: report slave_ids for
 each link to SOF driver
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 14-01-20, 10:05, Pierre-Louis Bossart wrote:
> On 1/14/20 12:26 AM, Vinod Koul wrote:
> > On 10-01-20, 16:31, Pierre-Louis Bossart wrote:
> > > On 1/10/20 4:00 PM, Pierre-Louis Bossart wrote:
> > > > From: Bard Liao <yung-chuan.liao@linux.intel.com>
> > > > 
> > > > The existing link_mask flag is no longer sufficient to detect the
> > > > hardware and identify which topology file and a machine driver to load.
> > > > 
> > > > By reporting the slave_ids exposed in ACPI tables, the parent SOF
> > > > driver will be able to compare against a set of static configurations.
> > > > 
> > > > This patch only adds the interface change, the functionality is added
> > > > in future patches.
> > > 
> > > Vinod, this patch would need to be shared as an immutable tag for Mark, once
> > > this is done I can share the SOF parts that make use of the information (cf.
> > > https://github.com/thesofproject/linux/pull/1692 for reference)
> > > 
> > > Sorry we missed this in the earlier interface changes, we didn't think we
> > > would have so many hardware variations so quickly.
> > 
> > do you want the tag now..? I can provide... We are already in -rc6
> > and i will send PR to greg later this week...
> 
> yes please, I'd like to send the SOF patches this week as well.

Applied now and pushed tag 'sdw_interfaces_2_5.6' for this, thanks

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
