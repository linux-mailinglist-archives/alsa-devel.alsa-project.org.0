Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FD26284DC
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 17:17:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D62231674;
	Mon, 14 Nov 2022 17:16:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D62231674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668442665;
	bh=++d+b9y7C1ZlnSJ0+RBzklvGqhH0Chu/OZ0XeO1oXZ4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o4bitEoKzMkH7lV5zGTKCu422BXpdNkKgVuU2G+8kNMFIpESiVBVx6IqpCZ3LhqCM
	 B9GitJcoMCiGxrNeEbnYGHbSvc8/aNzhDRkEE7Y/cfgJ4tGo0BaaKig1eWwXrHNojF
	 nVBHzxSoKbnIeIeQ8+ZKYSw4nluxURaSZxoEknR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E036F8049E;
	Mon, 14 Nov 2022 17:16:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03318F8049E; Mon, 14 Nov 2022 17:16:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78E91F800B6
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 17:16:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78E91F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AGG70NSN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668442603; x=1699978603;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=++d+b9y7C1ZlnSJ0+RBzklvGqhH0Chu/OZ0XeO1oXZ4=;
 b=AGG70NSNwCC/EbSOtztHF5DSKO4bI+x45o7YJNxYjC9N5qs4UUzBlbFm
 F9x3uIhw9kxOhKmWfwmhQ5L4pyEwvVFM8TqBfMdmfJpgKZWLfCKhyzfDL
 s84Ii3QwFNoIWxP3kt/A+olBSp3ZQqeolBaWE/pLSKjmBUyXps/iTCSmI
 O+/mP4SeVxbCGfbvw3527MpILmAceef+hAXLcAAs6uZggErNBXmXg7/Cz
 DfN9wQuaYkayQcMi4r8VLi0HNDEQaxm4HXstEiZkJYXbiusQiu/LY3mBE
 ksqOuI+BazydSNKj+KuhkPuVa4oVMhQASgFCJVd0vzXF5eu8tHPn2bDDI Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="398301395"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="398301395"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 08:16:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="638542498"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="638542498"
Received: from scewbso01.amr.corp.intel.com (HELO [10.212.76.77])
 ([10.212.76.77])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 08:16:35 -0800
Message-ID: <9d701845-7ad1-046c-b7c2-dd2a131212c8@linux.intel.com>
Date: Mon, 14 Nov 2022 10:04:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 4/4] soundwire: stream: Move remaining register accesses
 over to no_pm
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
References: <20221114102956.914468-1-ckeepax@opensource.cirrus.com>
 <20221114102956.914468-5-ckeepax@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221114102956.914468-5-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com
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



On 11/14/22 04:29, Charles Keepax wrote:
> There is no need to play with the runtime reference everytime a register
> is accessed. All the remaining "pm" style register accesses trace back
> to 4 functions:
> 
> sdw_prepare_stream
> sdw_deprepare_stream
> sdw_enable_stream
> sdw_disable_stream
> 
> Any sensible implementation will need to hold a runtime reference
> across all those functions, it makes no sense to be allowing the
> device/bus to suspend whilst streams are being prepared/enabled. And
> certainly in the case of the all existing users, they all call these
> functions from hw_params/prepare/trigger/hw_free callbacks in ALSA,
> which will have already runtime resumed all the audio devices
> associated during the open callback.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

I tend to agree with this one, and if this ever fails that would point
to a miss at a higher-level we'd need to address.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  drivers/soundwire/bus.c    |  2 +-
>  drivers/soundwire/stream.c | 30 +++++++++++++++---------------
>  2 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index ef4878258afad..d87a188fcce1e 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -1214,7 +1214,7 @@ int sdw_configure_dpn_intr(struct sdw_slave *slave,
>  		val &= ~SDW_DPN_INT_PORT_READY;
>  	}
>  
> -	ret = sdw_update(slave, addr, (mask | SDW_DPN_INT_PORT_READY), val);
> +	ret = sdw_update_no_pm(slave, addr, (mask | SDW_DPN_INT_PORT_READY), val);
>  	if (ret < 0)
>  		dev_err(&slave->dev,
>  			"SDW_DPN_INTMASK write failed:%d\n", val);
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index bd502368339e5..df3b36670df4c 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -81,14 +81,14 @@ static int _sdw_program_slave_port_params(struct sdw_bus *bus,
>  	}
>  
>  	/* Program DPN_OffsetCtrl2 registers */
> -	ret = sdw_write(slave, addr1, t_params->offset2);
> +	ret = sdw_write_no_pm(slave, addr1, t_params->offset2);
>  	if (ret < 0) {
>  		dev_err(bus->dev, "DPN_OffsetCtrl2 register write failed\n");
>  		return ret;
>  	}
>  
>  	/* Program DPN_BlockCtrl3 register */
> -	ret = sdw_write(slave, addr2, t_params->blk_pkg_mode);
> +	ret = sdw_write_no_pm(slave, addr2, t_params->blk_pkg_mode);
>  	if (ret < 0) {
>  		dev_err(bus->dev, "DPN_BlockCtrl3 register write failed\n");
>  		return ret;
> @@ -105,7 +105,7 @@ static int _sdw_program_slave_port_params(struct sdw_bus *bus,
>  	/* Program DPN_SampleCtrl2 register */
>  	wbuf = FIELD_GET(SDW_DPN_SAMPLECTRL_HIGH, t_params->sample_interval - 1);
>  
> -	ret = sdw_write(slave, addr3, wbuf);
> +	ret = sdw_write_no_pm(slave, addr3, wbuf);
>  	if (ret < 0) {
>  		dev_err(bus->dev, "DPN_SampleCtrl2 register write failed\n");
>  		return ret;
> @@ -115,7 +115,7 @@ static int _sdw_program_slave_port_params(struct sdw_bus *bus,
>  	wbuf = FIELD_PREP(SDW_DPN_HCTRL_HSTART, t_params->hstart);
>  	wbuf |= FIELD_PREP(SDW_DPN_HCTRL_HSTOP, t_params->hstop);
>  
> -	ret = sdw_write(slave, addr4, wbuf);
> +	ret = sdw_write_no_pm(slave, addr4, wbuf);
>  	if (ret < 0)
>  		dev_err(bus->dev, "DPN_HCtrl register write failed\n");
>  
> @@ -163,7 +163,7 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
>  	wbuf = FIELD_PREP(SDW_DPN_PORTCTRL_DATAMODE, p_params->data_mode);
>  	wbuf |= FIELD_PREP(SDW_DPN_PORTCTRL_FLOWMODE, p_params->flow_mode);
>  
> -	ret = sdw_update(s_rt->slave, addr1, 0xF, wbuf);
> +	ret = sdw_update_no_pm(s_rt->slave, addr1, 0xF, wbuf);
>  	if (ret < 0) {
>  		dev_err(&s_rt->slave->dev,
>  			"DPN_PortCtrl register write failed for port %d\n",
> @@ -173,7 +173,7 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
>  
>  	if (!dpn_prop->read_only_wordlength) {
>  		/* Program DPN_BlockCtrl1 register */
> -		ret = sdw_write(s_rt->slave, addr2, (p_params->bps - 1));
> +		ret = sdw_write_no_pm(s_rt->slave, addr2, (p_params->bps - 1));
>  		if (ret < 0) {
>  			dev_err(&s_rt->slave->dev,
>  				"DPN_BlockCtrl1 register write failed for port %d\n",
> @@ -184,7 +184,7 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
>  
>  	/* Program DPN_SampleCtrl1 register */
>  	wbuf = (t_params->sample_interval - 1) & SDW_DPN_SAMPLECTRL_LOW;
> -	ret = sdw_write(s_rt->slave, addr3, wbuf);
> +	ret = sdw_write_no_pm(s_rt->slave, addr3, wbuf);
>  	if (ret < 0) {
>  		dev_err(&s_rt->slave->dev,
>  			"DPN_SampleCtrl1 register write failed for port %d\n",
> @@ -193,7 +193,7 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
>  	}
>  
>  	/* Program DPN_OffsetCtrl1 registers */
> -	ret = sdw_write(s_rt->slave, addr4, t_params->offset1);
> +	ret = sdw_write_no_pm(s_rt->slave, addr4, t_params->offset1);
>  	if (ret < 0) {
>  		dev_err(&s_rt->slave->dev,
>  			"DPN_OffsetCtrl1 register write failed for port %d\n",
> @@ -203,7 +203,7 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
>  
>  	/* Program DPN_BlockCtrl2 register*/
>  	if (t_params->blk_grp_ctrl_valid) {
> -		ret = sdw_write(s_rt->slave, addr5, t_params->blk_grp_ctrl);
> +		ret = sdw_write_no_pm(s_rt->slave, addr5, t_params->blk_grp_ctrl);
>  		if (ret < 0) {
>  			dev_err(&s_rt->slave->dev,
>  				"DPN_BlockCtrl2 reg write failed for port %d\n",
> @@ -214,7 +214,7 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
>  
>  	/* program DPN_LaneCtrl register */
>  	if (slave_prop->lane_control_support) {
> -		ret = sdw_write(s_rt->slave, addr6, t_params->lane_ctrl);
> +		ret = sdw_write_no_pm(s_rt->slave, addr6, t_params->lane_ctrl);
>  		if (ret < 0) {
>  			dev_err(&s_rt->slave->dev,
>  				"DPN_LaneCtrl register write failed for port %d\n",
> @@ -319,9 +319,9 @@ static int sdw_enable_disable_slave_ports(struct sdw_bus *bus,
>  	 * it is safe to reset this register
>  	 */
>  	if (en)
> -		ret = sdw_write(s_rt->slave, addr, p_rt->ch_mask);
> +		ret = sdw_write_no_pm(s_rt->slave, addr, p_rt->ch_mask);
>  	else
> -		ret = sdw_write(s_rt->slave, addr, 0x0);
> +		ret = sdw_write_no_pm(s_rt->slave, addr, 0x0);
>  
>  	if (ret < 0)
>  		dev_err(&s_rt->slave->dev,
> @@ -476,9 +476,9 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
>  		addr = SDW_DPN_PREPARECTRL(p_rt->num);
>  
>  		if (prep)
> -			ret = sdw_write(s_rt->slave, addr, p_rt->ch_mask);
> +			ret = sdw_write_no_pm(s_rt->slave, addr, p_rt->ch_mask);
>  		else
> -			ret = sdw_write(s_rt->slave, addr, 0x0);
> +			ret = sdw_write_no_pm(s_rt->slave, addr, 0x0);
>  
>  		if (ret < 0) {
>  			dev_err(&s_rt->slave->dev,
> @@ -491,7 +491,7 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
>  		wait_for_completion_timeout(port_ready,
>  			msecs_to_jiffies(dpn_prop->ch_prep_timeout));
>  
> -		val = sdw_read(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
> +		val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
>  		if ((val < 0) || (val & p_rt->ch_mask)) {
>  			ret = (val < 0) ? val : -ETIMEDOUT;
>  			dev_err(&s_rt->slave->dev,
