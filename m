Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7EC2CFA51
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 08:46:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC31618C0;
	Sat,  5 Dec 2020 08:46:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC31618C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607154417;
	bh=Gz0uxcIaiBt6Rjn6Q9HJJFBVPnsUhEeLWQb4MJBQeW8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eIH6wb5Zs5gYPvX3Tg8ZaX8gxv6xkyslbST02s7Vs7gkh2mP83bfVhiet3/G9Q6rB
	 JGlGYpxhxjmfnu+xFaFbSeSuyfcSlmMxjx3niL+A9H96YdPkoBtVl6PH7Vz8esd4hr
	 SVADh0JeQQiy218F52ZYOlxyRvijc47NRTghk4Ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC1A0F800E2;
	Sat,  5 Dec 2020 08:45:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ED1EF8016D; Sat,  5 Dec 2020 08:45:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 763EBF800E2
 for <alsa-devel@alsa-project.org>; Sat,  5 Dec 2020 08:45:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 763EBF800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lbRnAZJR"
Date: Sat, 5 Dec 2020 13:15:08 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607154313;
 bh=Gz0uxcIaiBt6Rjn6Q9HJJFBVPnsUhEeLWQb4MJBQeW8=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=lbRnAZJR1Akmax6bMESQWV0r16MUqubGJUmDimPTWMRtHXCddM40rRR/XIv2x/K53
 eHI5LBtjBaJRfYlQtJxSlME7tlUfPGq+BTipVX03lJoSJtdqz6S3O6VfD3GoWLii7c
 lUbaPWnrm1/2ayNDg84p0xETN+1UA98PsAjUk7yL0xP+arRlPDziRPHeXqTigkWN1L
 BKiBDr1UpIZeKNQlVxPuSRb5fBf87Rz1R0xJOvz2GRXxYBp5Cp2Y/xRxxZ7fsLXcCw
 IOK3BzX+zycqZz3owElNZUbeq62/wphZE/WO9YJlyYxYeEhODfLU6EY2oz7pL5qoBZ
 G8MWMZfZzg/Zw==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 1/7] soundwire: bus: use sdw_update_no_pm when
 initializing a device
Message-ID: <20201205074508.GQ8403@vkoul-mobl>
References: <20201202204645.23891-1-yung-chuan.liao@linux.intel.com>
 <20201202204645.23891-2-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202204645.23891-2-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
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

On 03-12-20, 04:46, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> When a Slave device is resumed, it may resume the bus and restart the
> enumeration. During that process, we absolutely don't want to call
> regular read/write routines which will wait for the resume to
> complete, otherwise a deadlock occurs.
> 
> Fixes: 60ee9be25571 ('soundwire: bus: add PM/no-PM versions of read/write functions')

Change looks okay, but not sure why this is a fix for adding no pm
version?

> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  drivers/soundwire/bus.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index d1e8c3a54976..60c42508c6c6 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -489,6 +489,18 @@ sdw_read_no_pm(struct sdw_slave *slave, u32 addr)
>  		return buf;
>  }
>  
> +static int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u8 val)
> +{
> +	int tmp;
> +
> +	tmp = sdw_read_no_pm(slave, addr);
> +	if (tmp < 0)
> +		return tmp;
> +
> +	tmp = (tmp & ~mask) | val;
> +	return sdw_write_no_pm(slave, addr, tmp);
> +}
> +
>  /**
>   * sdw_nread() - Read "n" contiguous SDW Slave registers
>   * @slave: SDW Slave
> @@ -1256,7 +1268,7 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
>  	val = slave->prop.scp_int1_mask;
>  
>  	/* Enable SCP interrupts */
> -	ret = sdw_update(slave, SDW_SCP_INTMASK1, val, val);
> +	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1, val, val);
>  	if (ret < 0) {
>  		dev_err(slave->bus->dev,
>  			"SDW_SCP_INTMASK1 write failed:%d\n", ret);
> @@ -1271,7 +1283,7 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
>  	val = prop->dp0_prop->imp_def_interrupts;
>  	val |= SDW_DP0_INT_PORT_READY | SDW_DP0_INT_BRA_FAILURE;
>  
> -	ret = sdw_update(slave, SDW_DP0_INTMASK, val, val);
> +	ret = sdw_update_no_pm(slave, SDW_DP0_INTMASK, val, val);
>  	if (ret < 0)
>  		dev_err(slave->bus->dev,
>  			"SDW_DP0_INTMASK read failed:%d\n", ret);
> -- 
> 2.17.1

-- 
~Vinod
