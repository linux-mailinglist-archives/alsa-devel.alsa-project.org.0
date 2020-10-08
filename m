Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A263287AE0
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Oct 2020 19:22:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B12F5167A;
	Thu,  8 Oct 2020 19:21:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B12F5167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602177727;
	bh=qqJaQ8w9+/FSFtBNLOGYEQ7wz4IYZfeGaGac4ucM/GA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L6XxL+ggG4xnXlz/xfF8YvBpyCM09UDg7+hMqzlWI6AZLqOZRoZxi+BAKu41cWwDh
	 yHffYWYe4oglWw6ahnvrzA2ycTyvPalX55RXknMS8PuJqHGWQOyuokUQVk58mZ8IZE
	 WY2KavjJiWpgP0yWFb7mK+Tv1CiIL3vAsDiAvgfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69F13F80163;
	Thu,  8 Oct 2020 19:20:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73687F80164; Thu,  8 Oct 2020 19:20:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ADEAF80090
 for <alsa-devel@alsa-project.org>; Thu,  8 Oct 2020 19:20:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ADEAF80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V7Xmgrp5"
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E413204EF;
 Thu,  8 Oct 2020 17:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602177616;
 bh=qqJaQ8w9+/FSFtBNLOGYEQ7wz4IYZfeGaGac4ucM/GA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V7Xmgrp5RI+cknUfCHil8Usd4zBVjfPjV1rt2Tlr4BVtZCM2VuLRGE1I+Xecomqoj
 bP8LYTXylGlFZp2ZdcuKZMVSaA1OMWsS0acb4Jc6VGA93XjPr0U2tOT7g74WmZvB0l
 QfVGV1A1O3YC1l60ZCwG5ka9VFOLPKrwkpT475jg=
Date: Thu, 8 Oct 2020 20:20:11 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Dave Ertman <david.m.ertman@intel.com>
Subject: Re: [PATCH v2 1/6] Add ancillary bus support
Message-ID: <20201008172011.GO13580@unreal>
References: <20201005182446.977325-1-david.m.ertman@intel.com>
 <20201005182446.977325-2-david.m.ertman@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005182446.977325-2-david.m.ertman@intel.com>
Cc: alsa-devel@alsa-project.org, parav@mellanox.com, tiwai@suse.de,
 netdev@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, fred.oh@linux.intel.com,
 linux-rdma@vger.kernel.org, dledford@redhat.com, broonie@kernel.org,
 jgg@nvidia.com, gregkh@linuxfoundation.org, kuba@kernel.org,
 dan.j.williams@intel.com, shiraz.saleem@intel.com, davem@davemloft.net,
 kiran.patil@intel.com
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

On Mon, Oct 05, 2020 at 11:24:41AM -0700, Dave Ertman wrote:
> Add support for the Ancillary Bus, ancillary_device and ancillary_driver.
> It enables drivers to create an ancillary_device and bind an
> ancillary_driver to it.
>
> The bus supports probe/remove shutdown and suspend/resume callbacks.
> Each ancillary_device has a unique string based id; driver binds to
> an ancillary_device based on this id through the bus.
>
> Co-developed-by: Kiran Patil <kiran.patil@intel.com>
> Signed-off-by: Kiran Patil <kiran.patil@intel.com>
> Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Co-developed-by: Fred Oh <fred.oh@linux.intel.com>
> Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Shiraz Saleem <shiraz.saleem@intel.com>
> Reviewed-by: Parav Pandit <parav@mellanox.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Dave Ertman <david.m.ertman@intel.com>
> ---

<...>

> +
> +static const struct ancillary_device_id *ancillary_match_id(const struct ancillary_device_id *id,
> +							    const struct ancillary_device *ancildev)
> +{
> +	while (id->name[0]) {
> +		const char *p = strrchr(dev_name(&ancildev->dev), '.');
> +		int match_size;
> +
> +		if (!p) {
> +			id++;
> +			continue;
> +		}
> +		match_size = p - dev_name(&ancildev->dev);
> +
> +		/* use dev_name(&ancildev->dev) prefix before last '.' char to match to */
> +		if (!strncmp(dev_name(&ancildev->dev), id->name, match_size))

This check is wrong, it causes to wrong matching if strlen(id->name) > match_size
In my case, the trigger was:
[    5.175848] ancillary:ancillary_match_id: dev mlx5_core.ib.0, id mlx5_core.ib_rep

From cf8f10af72f9e0d57c7ec077d59238cc12b0650f Mon Sep 17 00:00:00 2001
From: Leon Romanovsky <leonro@nvidia.com>
Date: Thu, 8 Oct 2020 19:40:03 +0300
Subject: [PATCH] fixup! Fixes to ancillary bus

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/bus/ancillary.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/ancillary.c b/drivers/bus/ancillary.c
index 54858f744ef5..615ce40ef8e4 100644
--- a/drivers/bus/ancillary.c
+++ b/drivers/bus/ancillary.c
@@ -31,8 +31,10 @@ static const struct ancillary_device_id *ancillary_match_id(const struct ancilla
 		match_size = p - dev_name(&ancildev->dev);

 		/* use dev_name(&ancildev->dev) prefix before last '.' char to match to */
-		if (!strncmp(dev_name(&ancildev->dev), id->name, match_size))
+		if (match_size == strlen(id->name) && !strncmp(dev_name(&ancildev->dev), id->name, match_size)) {
 			return id;
+		}
+
 		id++;
 	}
 	return NULL;
--
2.26.2



> +			return id;
> +		id++;
> +	}
> +	return NULL;
> +}
