Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8951D13AB0A
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:28:27 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA12C2BC2;
	Tue, 14 Jan 2020 07:27:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA12C2BC2
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16240F8014D;
	Tue, 14 Jan 2020 07:26:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 574E3F8014E; Tue, 14 Jan 2020 07:26:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F343F80121
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 07:26:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F343F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VzzCnZs/"
Received: from localhost (unknown [49.207.51.160])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC6C220678;
 Tue, 14 Jan 2020 06:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578983169;
 bh=mxczTMmm2Pg7j2c9xrST05zaDM8ERDYB9c1YmyaS3VM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VzzCnZs/bXszwYJhlH0/Q+3HqrsYS0QlHJUgcEEdrVNoaLATlyVxn9/CeuIXWvCBo
 taTGVPmhzSqDBkQ7Ie/kW2ZVHpH1B2psOM6r2yr8ny4aLcv+jpak19PQHzTli77rnd
 Ftfr/ir+2XFglll1NWQU6ZK7jGO6ozBJ6bDlyi5g=
Date: Tue, 14 Jan 2020 11:56:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200114062605.GD2818@vkoul-mobl>
References: <20200110220016.30887-1-pierre-louis.bossart@linux.intel.com>
 <a70c54c0-c691-d8eb-4f99-da1bb9306c2f@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a70c54c0-c691-d8eb-4f99-da1bb9306c2f@linux.intel.com>
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

On 10-01-20, 16:31, Pierre-Louis Bossart wrote:
> 
> 
> On 1/10/20 4:00 PM, Pierre-Louis Bossart wrote:
> > From: Bard Liao <yung-chuan.liao@linux.intel.com>
> > 
> > The existing link_mask flag is no longer sufficient to detect the
> > hardware and identify which topology file and a machine driver to load.
> > 
> > By reporting the slave_ids exposed in ACPI tables, the parent SOF
> > driver will be able to compare against a set of static configurations.
> > 
> > This patch only adds the interface change, the functionality is added
> > in future patches.
> 
> Vinod, this patch would need to be shared as an immutable tag for Mark, once
> this is done I can share the SOF parts that make use of the information (cf.
> https://github.com/thesofproject/linux/pull/1692 for reference)
> 
> Sorry we missed this in the earlier interface changes, we didn't think we
> would have so many hardware variations so quickly.

do you want the tag now..? I can provide... We are already in -rc6
and i will send PR to greg later this week...
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
