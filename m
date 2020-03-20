Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8E018CF7F
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 14:53:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E65117DF;
	Fri, 20 Mar 2020 14:52:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E65117DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584712418;
	bh=y7qXF+Hq92w8TU6GgEqFOUEr/nQFz4OOWmZ7gzxYsA4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nwQTDnu4+qUm/1xQqpBjwUlv7n6ut/QeLUvfpjB6PTccqSwSsTBsISkcDlNdTyGRb
	 s5EKL9ZeDLFDeQsJDvot4I50ZEaMBxcGAePoj6RBe1687JndGYA8DBKtTxU29NEf/r
	 SEsXODDQ+9Pef5bf7YcqZ/O7K6qgeetbnK2abJPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 925A5F80162;
	Fri, 20 Mar 2020 14:51:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00A90F8015B; Fri, 20 Mar 2020 14:51:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 082D1F800DD
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 14:51:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 082D1F800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zFMvx0hv"
Received: from localhost (unknown [122.167.82.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C0B9120722;
 Fri, 20 Mar 2020 13:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584712309;
 bh=y7qXF+Hq92w8TU6GgEqFOUEr/nQFz4OOWmZ7gzxYsA4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zFMvx0hvqwr72N/dXhAnTJiI/Zoq9SBqCEQoOJk/KLnBuoVrVkMndisdyQLJ5D6y0
 uvOzDDB0t/BhtmTE3qI8RZrkjTgaJIM+djbmG/o/HH6xwK6wIRcnm4EOpedPZ8fBhw
 7QxD9h34B1JwaLNnS1n/OIiWLyTA5U80pRBBk/fw=
Date: Fri, 20 Mar 2020 19:21:45 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 5/7] soundwire: intel: follow documentation sequences for
 SHIM registers
Message-ID: <20200320135145.GE4885@vkoul-mobl>
References: <20200311221026.18174-1-pierre-louis.bossart@linux.intel.com>
 <20200311221026.18174-6-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311221026.18174-6-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>, Rander Wang <rander.wang@intel.com>,
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

On 11-03-20, 17:10, Pierre-Louis Bossart wrote:
> From: Rander Wang <rander.wang@intel.com>
> 
> Somehow the existing code is not aligned with the steps described in
> the documentation, refactor code and make sure the register

Is the documentation available public space so that we can correct

> programming sequences are correct.
> 
> This includes making sure SHIM_SYNC is programmed only once, before
> the first link is powered on.
> 
> Note that the SYNCPRD value is tied only to the XTAL value and not the
> current bus frequency or the frame rate.
> 
> Signed-off-by: Rander Wang <rander.wang@intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/intel.c | 186 ++++++++++++++++++++++++++++----------
>  1 file changed, 139 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 3c271a8044b8..9c6514fe1284 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -46,7 +46,8 @@
>  #define SDW_SHIM_LCTL_SPA		BIT(0)
>  #define SDW_SHIM_LCTL_CPA		BIT(8)
>  
> -#define SDW_SHIM_SYNC_SYNCPRD_VAL	0x176F
> +#define SDW_SHIM_SYNC_SYNCPRD_VAL_24	(24000 / SDW_CADENCE_GSYNC_KHZ - 1)
> +#define SDW_SHIM_SYNC_SYNCPRD_VAL_38_4	(38400 / SDW_CADENCE_GSYNC_KHZ - 1)
>  #define SDW_SHIM_SYNC_SYNCPRD		GENMASK(14, 0)
>  #define SDW_SHIM_SYNC_SYNCCPU		BIT(15)
>  #define SDW_SHIM_SYNC_CMDSYNC_MASK	GENMASK(19, 16)
> @@ -283,11 +284,48 @@ static int intel_link_power_up(struct sdw_intel *sdw)
>  {
>  	unsigned int link_id = sdw->instance;
>  	void __iomem *shim = sdw->link_res->shim;
> +	u32 *shim_mask = sdw->link_res->shim_mask;

this is a local pointer, so the one defined previously is not used.

> +	struct sdw_bus *bus = &sdw->cdns.bus;
> +	struct sdw_master_prop *prop = &bus->prop;
>  	int spa_mask, cpa_mask;
> -	int link_control, ret;
> +	int link_control;
> +	int ret = 0;
> +	u32 syncprd;
> +	u32 sync_reg;
>  
>  	mutex_lock(sdw->link_res->shim_lock);
>  
> +	/*
> +	 * The hardware relies on an internal counter,
> +	 * typically 4kHz, to generate the SoundWire SSP -
> +	 * which defines a 'safe' synchronization point
> +	 * between commands and audio transport and allows for
> +	 * multi link synchronization. The SYNCPRD value is
> +	 * only dependent on the oscillator clock provided to
> +	 * the IP, so adjust based on _DSD properties reported
> +	 * in DSDT tables. The values reported are based on
> +	 * either 24MHz (CNL/CML) or 38.4 MHz (ICL/TGL+).

Sorry this looks quite bad to read, we have 80 chars, so please use
like below:

	/*
         * The hardware relies on an internal counter, typically 4kHz,
         * to generate the SoundWire SSP - which defines a 'safe'
         * synchronization point between commands and audio transport
         * and allows for multi link synchronization. The SYNCPRD value
         * is only dependent on the oscillator clock provided to
         * the IP, so adjust based on _DSD properties reported in DSDT
         * tables. The values reported are based on either 24MHz
         * (CNL/CML) or 38.4 MHz (ICL/TGL+).
	 */

-- 
~Vinod
