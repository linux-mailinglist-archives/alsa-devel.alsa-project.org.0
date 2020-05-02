Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7141A1C24FE
	for <lists+alsa-devel@lfdr.de>; Sat,  2 May 2020 14:01:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26C62168C;
	Sat,  2 May 2020 14:00:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26C62168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588420903;
	bh=CyubRpchMpkwfEUEN0ykrAy81QB5SdUHWOquX5a7Kas=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZME5CuTJnIiNM4HEjNUVJR+4oHm0UmEi1WztPLZYvTLCA+NUusf5A38VFfUuylPwI
	 JFiJJPBkV8h2Xaskz0Rz1XiDwnT4bINxyIx0k5taQg5jh+RpmaaPZWbbZZOLNhSZDf
	 UQBl/4t2BAj2jYzv1+2GYOsBw/WGA2Ew+M5DGXOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6137F801F7;
	Sat,  2 May 2020 14:00:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD130F801F7; Sat,  2 May 2020 13:59:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65D64F80087
 for <alsa-devel@alsa-project.org>; Sat,  2 May 2020 13:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65D64F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="id6RwLuT"
Received: from localhost (unknown [117.99.89.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D21F420731;
 Sat,  2 May 2020 11:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588420788;
 bh=CyubRpchMpkwfEUEN0ykrAy81QB5SdUHWOquX5a7Kas=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=id6RwLuTpaT1EB773COrRlT+xXtZcjd4/XLo9Ky2KdXywc+WUShHphGaUe7aWm6h6
 Hw+wQ9rZxSsM7IT2CGze7dWDD+w2OTyaxLYYhquoT38yBrEPdd8BqgSz/E4zJtkbjw
 1+QjJH66TN7sb5dGVPNpWU/IO/FWOfdfDd5fMSJ0=
Date: Sat, 2 May 2020 17:29:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH] soundwire: (cosmetic) remove multiple superfluous "else"
 statements
Message-ID: <20200502115934.GS948789@vkoul-mobl.Dlink>
References: <20200422151136.GA9425@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200422151136.GA9425@ubuntu>
Cc: alsa-devel@alsa-project.org, Sanyog Kale <sanyog.r.kale@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Hi Guennadi,

On 22-04-20, 17:11, Guennadi Liakhovetski wrote:
> No need for an "else" after a "return" statement. Remove multiple such
> occurrences.

lgtm, can you please split the patches, one for core sdw (bus.c) and one
for intel parts please

Thanks

> 
> Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> ---
>  drivers/soundwire/bus.c            | 17 ++++++++++-------
>  drivers/soundwire/cadence_master.c |  8 ++++++--
>  drivers/soundwire/intel_init.c     |  4 +++-
>  3 files changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 488c3c9..32de017 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -284,9 +284,10 @@ int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
>  	msg->flags = flags;
>  	msg->buf = buf;
>  
> -	if (addr < SDW_REG_NO_PAGE) { /* no paging area */
> +	if (addr < SDW_REG_NO_PAGE) /* no paging area */
>  		return 0;
> -	} else if (addr >= SDW_REG_MAX) { /* illegal addr */
> +
> +	if (addr >= SDW_REG_MAX) { /* illegal addr */
>  		pr_err("SDW: Invalid address %x passed\n", addr);
>  		return -EINVAL;
>  	}
> @@ -306,7 +307,9 @@ int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
>  	if (!slave) {
>  		pr_err("SDW: No slave for paging addr\n");
>  		return -EINVAL;
> -	} else if (!slave->prop.paging_support) {
> +	}
> +
> +	if (!slave->prop.paging_support) {
>  		dev_err(&slave->dev,
>  			"address %x needs paging but no support\n", addr);
>  		return -EINVAL;
> @@ -375,8 +378,8 @@ static int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value)
>  	ret = sdw_transfer(bus, &msg);
>  	if (ret < 0)
>  		return ret;
> -	else
> -		return buf;
> +
> +	return buf;
>  }
>  
>  static int
> @@ -471,8 +474,8 @@ int sdw_read(struct sdw_slave *slave, u32 addr)
>  	ret = sdw_nread(slave, addr, 1, &buf);
>  	if (ret < 0)
>  		return ret;
> -	else
> -		return buf;
> +
> +	return buf;
>  }
>  EXPORT_SYMBOL(sdw_read);
>  
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index ecd357d1..9ea8753 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -407,7 +407,9 @@ void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root)
>  	if (nack) {
>  		dev_err_ratelimited(cdns->dev, "Msg NACKed for Slave %d\n", msg->dev_num);
>  		return SDW_CMD_FAIL;
> -	} else if (no_ack) {
> +	}
> +
> +	if (no_ack) {
>  		dev_dbg_ratelimited(cdns->dev, "Msg ignored for Slave %d\n", msg->dev_num);
>  		return SDW_CMD_IGNORED;
>  	}
> @@ -520,7 +522,9 @@ void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root)
>  		dev_err_ratelimited(cdns->dev,
>  				    "SCP_addrpage NACKed for Slave %d\n", msg->dev_num);
>  		return SDW_CMD_FAIL;
> -	} else if (no_ack) {
> +	}
> +
> +	if (no_ack) {
>  		dev_dbg_ratelimited(cdns->dev,
>  				    "SCP_addrpage ignored for Slave %d\n", msg->dev_num);
>  		return SDW_CMD_IGNORED;
> diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
> index 4b76940..d5d4279 100644
> --- a/drivers/soundwire/intel_init.c
> +++ b/drivers/soundwire/intel_init.c
> @@ -86,7 +86,9 @@ static int sdw_intel_cleanup_pdev(struct sdw_intel_ctx *ctx)
>  		dev_err(&adev->dev, "Link count %d exceeds max %d\n",
>  			count, SDW_MAX_LINKS);
>  		return NULL;
> -	} else if (!count) {
> +	}
> +
> +	if (!count) {
>  		dev_warn(&adev->dev, "No SoundWire links detected\n");
>  		return NULL;
>  	}
> -- 
> 1.9.3

-- 
~Vinod
