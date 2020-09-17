Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF0B26E0DF
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 18:38:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8232316D4;
	Thu, 17 Sep 2020 18:37:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8232316D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600360698;
	bh=6PgUZcER+juKOkx9tHVSAgWGcyVldfPaELTitstw2QY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z/EZfcp3bZIrNN/IVyuL/lIFico0+CkhUEcpHWNYlJ+whOPtNZ4lE6MKcnG6nVgrx
	 kZBOd8axI2Ot3fogMgt1viJ2/i5ePlyz4p3YmnITicj8Ktr2QDAYSOm11C1JdmhAaq
	 vg5Tq71G8oZFa4Lfa7g6t04p+IYoinyiybUCZ38U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8380BF800E8;
	Thu, 17 Sep 2020 18:36:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C9F3F80212; Thu, 17 Sep 2020 18:36:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCB27F800E8
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 18:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCB27F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1Gf01jix"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C3CBE2078D;
 Thu, 17 Sep 2020 16:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600360585;
 bh=6PgUZcER+juKOkx9tHVSAgWGcyVldfPaELTitstw2QY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1Gf01jixLh8nAvil81bpoCH/LwoqE8Ld9LRfLdcNodoTRu1nN8JGYCEfdoPSTm9jr
 YGV71O1+IRdupBwfI5+/G4K+exn+/+8W53L6HNwuwHEHPvpWQ7k87cxvy9dOEzng/9
 HGUTQhdiJYnQysn7Bjfj47EJMeYPKaBzGgu/G32k=
Date: Thu, 17 Sep 2020 18:36:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 2/2] soundwire: sysfs: add slave status and device
 number before probe
Message-ID: <20200917163657.GB717532@kroah.com>
References: <20200917160007.153106-1-pierre-louis.bossart@linux.intel.com>
 <20200917160007.153106-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917160007.153106-3-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On Thu, Sep 17, 2020 at 11:00:07AM -0500, Pierre-Louis Bossart wrote:
> The MIPI DisCo device properties that are read by the driver from
> platform firmware, or hard-coded in the driver, should only be
> provided as sysfs entries when a driver probes successfully.
> 
> However the device status and device number is updated even when there
> is no driver present, and hence can be updated when a Slave device is
> detected on the bus without being described in platform firmware and
> without any driver registered/probed.
> 
> As suggested by GregKH, the attribute group for Slave status and
> device number is is added by default upon device registration.
> 
> Credits to Vinod Koul for the status_show() function, shared in a
> separate patch and used as is here. The status table was modified to
> remove an unnecessary enum and status_show() is handled in a different
> group attribute than what was suggested by Vinod.
> 
> Tested-by: Srinivas Kandgatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  .../ABI/testing/sysfs-bus-soundwire-slave     | 18 ++++++
>  drivers/soundwire/slave.c                     |  2 +
>  drivers/soundwire/sysfs_local.h               |  4 ++
>  drivers/soundwire/sysfs_slave.c               | 59 ++++++++++++++++++-
>  4 files changed, 82 insertions(+), 1 deletion(-)

Much nicer, thanks for the change:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
