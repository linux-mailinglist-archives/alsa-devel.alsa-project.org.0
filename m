Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9DC12B23A
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 08:02:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 647451713;
	Fri, 27 Dec 2019 08:01:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 647451713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577430127;
	bh=CZi1yBMQC2rE1ePor5WLDGuNRoqZ5O+6/4f0ZZzmymw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RKiOFKq7LgfZ0TyOH00ZLZQDVHvEeJLSfoQkwuUkBjbPIO6P//gmJrkWNF9yX1HYp
	 RH9guK3rRuBT/T+NvU6Gd1l0sZdcHsChXSdj9rOkhlUpXBAdZP+UvCINZWeN8okXU0
	 I2Kwprzkj6yqnNUcjFxhhuyK0V7drblw5euwZBZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 501E0F80132;
	Fri, 27 Dec 2019 08:00:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6ADBF80132; Fri, 27 Dec 2019 08:00:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDF63F800E3
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 08:00:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDF63F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ilvXcicE"
Received: from localhost (unknown [106.201.34.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 18451206CB;
 Fri, 27 Dec 2019 07:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577430015;
 bh=1z8mayJa999Z2o7h/Q4jAKny+evFFOv8o8wb9X4zdj0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ilvXcicEtRtE7JkYp5OrXXn91OeqUCIPAqvQnsreM0llMjHsWFAx82Dq5TCwWTYVk
 wnj1sI77OdEsich8EewqKSXz12tklUzWn+bqEZeLJW8NY34R2ELhWIAHY/T9Q8j3iu
 hCmdrvmGjO5jD9xxX/UH5ir1owYIjzm4424MTETc=
Date: Fri, 27 Dec 2019 12:30:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191227070011.GJ3006@vkoul-mobl>
References: <20191217210314.20410-1-pierre-louis.bossart@linux.intel.com>
 <20191217210314.20410-4-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217210314.20410-4-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v5 03/17] soundwire: rename
	drv_to_sdw_slave_driver macro
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

On 17-12-19, 15:03, Pierre-Louis Bossart wrote:
> Align with previous renames and shorten macro
> 
> No functionality change
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/bus_type.c       | 9 ++++-----
>  include/linux/soundwire/sdw_type.h | 3 ++-
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index c0585bcc8a41..2b2830b622fa 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -34,7 +34,7 @@ sdw_get_device_id(struct sdw_slave *slave, struct sdw_driver *drv)
>  static int sdw_bus_match(struct device *dev, struct device_driver *ddrv)
>  {
>  	struct sdw_slave *slave = to_sdw_slave_device(dev);
> -	struct sdw_driver *drv = drv_to_sdw_slave_driver(ddrv);
> +	struct sdw_driver *drv = to_sdw_slave_driver(ddrv);

so patch 1 does:

-       struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
+       struct sdw_driver *drv = drv_to_sdw_slave_driver(dev->driver);

and here we move drv_to_sdw_slave_driver to to_sdw_slave_driver... why
not do this in first patch and save step1... or did i miss something??

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
