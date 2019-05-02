Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D55112A2
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 07:36:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64C1F177C;
	Thu,  2 May 2019 07:36:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64C1F177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556775419;
	bh=EqIJ9KsE9dddwFbNR7QNqWd+o8iYLpd4ZR+Ev59RWig=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tA5kIYvWHjlBMP3BQqA+2FbdDWdoFOG9v+UhO9ZCFywOWG+a9jMoMMbqRCXxNg/3+
	 SySvggCyZ8oTy9HFg29td6YAv/3bES+k+KwWvapVtzTn5HM9X8uswhwtbtmcwM2ivu
	 TUTswaoh0o40lQb3Cq0AKlqRbDonj70adiOCY468=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15FEAF89693;
	Thu,  2 May 2019 07:35:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB335F896AA; Thu,  2 May 2019 07:35:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 917D8F8075A
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 07:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 917D8F8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cauEQ6Go"
Received: from localhost (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D24402085A;
 Thu,  2 May 2019 05:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556775300;
 bh=hAisqfEvQTxJ8xXEfRDybbcjmnUSXZRkHD4KnM2NLic=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cauEQ6Gok7DnE2+986Bis/ko1A6ZCfZTA1uVWCRonQHVXmrDMLGMEGUFMyzC2lQ57
 /AYZ0otXx5A1KdGPtcsmqZUzGEr/RSuDaCJyVKOCH+8Sns1GZJRajSW2tpJxCsTKGH
 /W9yLVA4GddKRK9nI5vdGwubmL5f7fUdpAO/qIGg=
Date: Thu, 2 May 2019 11:04:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190502053451.GD3845@vkoul-mobl.Dlink>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
 <20190501155745.21806-11-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190501155745.21806-11-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH v4 10/22] soundwire: mipi_disco: fix
	alignment issues
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

On 01-05-19, 10:57, Pierre-Louis Bossart wrote:
> Use Linux style. In some cases parenthesis alignment is modified to
> keep the code readable.

lgtm, It would have been okay to have this and previous as a single
patch. It is the same module, but more split is welcome, makes it easier to
review in smaller chunks.

Thanks

> 
> Reviewed-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/mipi_disco.c | 112 ++++++++++++++++++---------------
>  1 file changed, 62 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
> index fdeba0c3b589..95efa82dc73b 100644
> --- a/drivers/soundwire/mipi_disco.c
> +++ b/drivers/soundwire/mipi_disco.c
> @@ -35,11 +35,12 @@ int sdw_master_read_prop(struct sdw_bus *bus)
>  	int nval, i;
>  
>  	device_property_read_u32(bus->dev,
> -			"mipi-sdw-sw-interface-revision", &prop->revision);
> +				 "mipi-sdw-sw-interface-revision",
> +				 &prop->revision);
>  
>  	/* Find master handle */
>  	snprintf(name, sizeof(name),
> -			"mipi-sdw-master-%d-subproperties", bus->link_id);
> +		 "mipi-sdw-master-%d-subproperties", bus->link_id);
>  
>  	link = device_get_named_child_node(bus->dev, name);
>  	if (!link) {
> @@ -56,7 +57,8 @@ int sdw_master_read_prop(struct sdw_bus *bus)
>  		prop->clk_stop_mode |= SDW_CLK_STOP_MODE1;
>  
>  	fwnode_property_read_u32(link,
> -			"mipi-sdw-max-clock-frequency", &prop->max_freq);
> +				 "mipi-sdw-max-clock-frequency",
> +				 &prop->max_freq);
>  
>  	nval = fwnode_property_read_u32_array(link,
>  			"mipi-sdw-clock-frequencies-supported", NULL, 0);
> @@ -64,7 +66,7 @@ int sdw_master_read_prop(struct sdw_bus *bus)
>  
>  		prop->num_freq = nval;
>  		prop->freq = devm_kcalloc(bus->dev, prop->num_freq,
> -				sizeof(*prop->freq), GFP_KERNEL);
> +					  sizeof(*prop->freq), GFP_KERNEL);
>  		if (!prop->freq)
>  			return -ENOMEM;
>  
> @@ -91,44 +93,47 @@ int sdw_master_read_prop(struct sdw_bus *bus)
>  
>  		prop->num_clk_gears = nval;
>  		prop->clk_gears = devm_kcalloc(bus->dev, prop->num_clk_gears,
> -				sizeof(*prop->clk_gears), GFP_KERNEL);
> +					       sizeof(*prop->clk_gears),
> +					       GFP_KERNEL);
>  		if (!prop->clk_gears)
>  			return -ENOMEM;
>  
>  		fwnode_property_read_u32_array(link,
> -				"mipi-sdw-supported-clock-gears",
> -				prop->clk_gears, prop->num_clk_gears);
> +					       "mipi-sdw-supported-clock-gears",
> +					       prop->clk_gears,
> +					       prop->num_clk_gears);
>  	}
>  
>  	fwnode_property_read_u32(link, "mipi-sdw-default-frame-rate",
> -			&prop->default_frame_rate);
> +				 &prop->default_frame_rate);
>  
>  	fwnode_property_read_u32(link, "mipi-sdw-default-frame-row-size",
> -			&prop->default_row);
> +				 &prop->default_row);
>  
>  	fwnode_property_read_u32(link, "mipi-sdw-default-frame-col-size",
> -			&prop->default_col);
> +				 &prop->default_col);
>  
>  	prop->dynamic_frame =  fwnode_property_read_bool(link,
>  			"mipi-sdw-dynamic-frame-shape");
>  
>  	fwnode_property_read_u32(link, "mipi-sdw-command-error-threshold",
> -			&prop->err_threshold);
> +				 &prop->err_threshold);
>  
>  	return 0;
>  }
>  EXPORT_SYMBOL(sdw_master_read_prop);
>  
>  static int sdw_slave_read_dp0(struct sdw_slave *slave,
> -		struct fwnode_handle *port, struct sdw_dp0_prop *dp0)
> +			      struct fwnode_handle *port,
> +			      struct sdw_dp0_prop *dp0)
>  {
>  	int nval;
>  
>  	fwnode_property_read_u32(port, "mipi-sdw-port-max-wordlength",
> -			&dp0->max_word);
> +				 &dp0->max_word);
>  
>  	fwnode_property_read_u32(port, "mipi-sdw-port-min-wordlength",
> -			&dp0->min_word);
> +				 &dp0->min_word);
>  
>  	nval = fwnode_property_read_u32_array(port,
>  			"mipi-sdw-port-wordlength-configs", NULL, 0);
> @@ -136,8 +141,8 @@ static int sdw_slave_read_dp0(struct sdw_slave *slave,
>  
>  		dp0->num_words = nval;
>  		dp0->words = devm_kcalloc(&slave->dev,
> -				dp0->num_words, sizeof(*dp0->words),
> -				GFP_KERNEL);
> +					  dp0->num_words, sizeof(*dp0->words),
> +					  GFP_KERNEL);
>  		if (!dp0->words)
>  			return -ENOMEM;
>  
> @@ -146,20 +151,21 @@ static int sdw_slave_read_dp0(struct sdw_slave *slave,
>  				dp0->words, dp0->num_words);
>  	}
>  
> -	dp0->flow_controlled = fwnode_property_read_bool(
> -			port, "mipi-sdw-bra-flow-controlled");
> +	dp0->flow_controlled = fwnode_property_read_bool(port,
> +				"mipi-sdw-bra-flow-controlled");
>  
> -	dp0->simple_ch_prep_sm = fwnode_property_read_bool(
> -			port, "mipi-sdw-simplified-channel-prepare-sm");
> +	dp0->simple_ch_prep_sm = fwnode_property_read_bool(port,
> +				"mipi-sdw-simplified-channel-prepare-sm");
>  
> -	dp0->device_interrupts = fwnode_property_read_bool(
> -			port, "mipi-sdw-imp-def-dp0-interrupts-supported");
> +	dp0->device_interrupts = fwnode_property_read_bool(port,
> +				"mipi-sdw-imp-def-dp0-interrupts-supported");
>  
>  	return 0;
>  }
>  
>  static int sdw_slave_read_dpn(struct sdw_slave *slave,
> -		struct sdw_dpn_prop *dpn, int count, int ports, char *type)
> +			      struct sdw_dpn_prop *dpn, int count, int ports,
> +			      char *type)
>  {
>  	struct fwnode_handle *node;
>  	u32 bit, i = 0;
> @@ -173,7 +179,7 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
>  
>  	for_each_set_bit(bit, &addr, 32) {
>  		snprintf(name, sizeof(name),
> -			"mipi-sdw-dp-%d-%s-subproperties", bit, type);
> +			 "mipi-sdw-dp-%d-%s-subproperties", bit, type);
>  
>  		dpn[i].num = bit;
>  
> @@ -184,9 +190,9 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
>  		}
>  
>  		fwnode_property_read_u32(node, "mipi-sdw-port-max-wordlength",
> -					&dpn[i].max_word);
> +					 &dpn[i].max_word);
>  		fwnode_property_read_u32(node, "mipi-sdw-port-min-wordlength",
> -					&dpn[i].min_word);
> +					 &dpn[i].min_word);
>  
>  		nval = fwnode_property_read_u32_array(node,
>  				"mipi-sdw-port-wordlength-configs", NULL, 0);
> @@ -194,8 +200,9 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
>  
>  			dpn[i].num_words = nval;
>  			dpn[i].words = devm_kcalloc(&slave->dev,
> -					dpn[i].num_words,
> -					sizeof(*dpn[i].words), GFP_KERNEL);
> +						    dpn[i].num_words,
> +						    sizeof(*dpn[i].words),
> +						    GFP_KERNEL);
>  			if (!dpn[i].words)
>  				return -ENOMEM;
>  
> @@ -205,28 +212,28 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
>  		}
>  
>  		fwnode_property_read_u32(node, "mipi-sdw-data-port-type",
> -				&dpn[i].type);
> +					 &dpn[i].type);
>  
>  		fwnode_property_read_u32(node,
> -				"mipi-sdw-max-grouping-supported",
> -				&dpn[i].max_grouping);
> +					 "mipi-sdw-max-grouping-supported",
> +					 &dpn[i].max_grouping);
>  
>  		dpn[i].simple_ch_prep_sm = fwnode_property_read_bool(node,
>  				"mipi-sdw-simplified-channelprepare-sm");
>  
>  		fwnode_property_read_u32(node,
> -				"mipi-sdw-port-channelprepare-timeout",
> -				&dpn[i].ch_prep_timeout);
> +					 "mipi-sdw-port-channelprepare-timeout",
> +					 &dpn[i].ch_prep_timeout);
>  
>  		fwnode_property_read_u32(node,
>  				"mipi-sdw-imp-def-dpn-interrupts-supported",
>  				&dpn[i].device_interrupts);
>  
>  		fwnode_property_read_u32(node, "mipi-sdw-min-channel-number",
> -				&dpn[i].min_ch);
> +					 &dpn[i].min_ch);
>  
>  		fwnode_property_read_u32(node, "mipi-sdw-max-channel-number",
> -				&dpn[i].max_ch);
> +					 &dpn[i].max_ch);
>  
>  		nval = fwnode_property_read_u32_array(node,
>  				"mipi-sdw-channel-number-list", NULL, 0);
> @@ -234,7 +241,8 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
>  
>  			dpn[i].num_ch = nval;
>  			dpn[i].ch = devm_kcalloc(&slave->dev, dpn[i].num_ch,
> -					sizeof(*dpn[i].ch), GFP_KERNEL);
> +						 sizeof(*dpn[i].ch),
> +						 GFP_KERNEL);
>  			if (!dpn[i].ch)
>  				return -ENOMEM;
>  
> @@ -265,13 +273,13 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
>  				"mipi-sdw-modes-supported", &dpn[i].modes);
>  
>  		fwnode_property_read_u32(node, "mipi-sdw-max-async-buffer",
> -				&dpn[i].max_async_buffer);
> +					 &dpn[i].max_async_buffer);
>  
>  		dpn[i].block_pack_mode = fwnode_property_read_bool(node,
>  				"mipi-sdw-block-packing-mode");
>  
>  		fwnode_property_read_u32(node, "mipi-sdw-port-encoding-type",
> -				&dpn[i].port_encoding);
> +					 &dpn[i].port_encoding);
>  
>  		/* TODO: Read audio mode */
>  
> @@ -293,7 +301,7 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
>  	int num_of_ports, nval, i, dp0 = 0;
>  
>  	device_property_read_u32(dev, "mipi-sdw-sw-interface-revision",
> -				&prop->mipi_revision);
> +				 &prop->mipi_revision);
>  
>  	prop->wake_capable = device_property_read_bool(dev,
>  				"mipi-sdw-wake-up-unavailable");
> @@ -311,10 +319,10 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
>  			"mipi-sdw-simplified-clockstopprepare-sm-supported");
>  
>  	device_property_read_u32(dev, "mipi-sdw-clockstopprepare-timeout",
> -			&prop->clk_stop_timeout);
> +				 &prop->clk_stop_timeout);
>  
>  	device_property_read_u32(dev, "mipi-sdw-slave-channelprepare-timeout",
> -			&prop->ch_prep_timeout);
> +				 &prop->ch_prep_timeout);
>  
>  	device_property_read_u32(dev,
>  			"mipi-sdw-clockstopprepare-hard-reset-behavior",
> @@ -333,13 +341,13 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
>  			"mipi-sdw-port15-read-behavior", &prop->p15_behave);
>  
>  	device_property_read_u32(dev, "mipi-sdw-master-count",
> -				&prop->master_count);
> +				 &prop->master_count);
>  
>  	device_property_read_u32(dev, "mipi-sdw-source-port-list",
> -				&prop->source_ports);
> +				 &prop->source_ports);
>  
>  	device_property_read_u32(dev, "mipi-sdw-sink-port-list",
> -				&prop->sink_ports);
> +				 &prop->sink_ports);
>  
>  	/* Read dp0 properties */
>  	port = device_get_named_child_node(dev, "mipi-sdw-dp-0-subproperties");
> @@ -348,7 +356,8 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
>  	} else {
>  
>  		prop->dp0_prop = devm_kzalloc(&slave->dev,
> -				sizeof(*prop->dp0_prop), GFP_KERNEL);
> +					      sizeof(*prop->dp0_prop),
> +					      GFP_KERNEL);
>  		if (!prop->dp0_prop)
>  			return -ENOMEM;
>  
> @@ -364,23 +373,25 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
>  	/* Allocate memory for set bits in port lists */
>  	nval = hweight32(prop->source_ports);
>  	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
> -				sizeof(*prop->src_dpn_prop), GFP_KERNEL);
> +					  sizeof(*prop->src_dpn_prop),
> +					  GFP_KERNEL);
>  	if (!prop->src_dpn_prop)
>  		return -ENOMEM;
>  
>  	/* Read dpn properties for source port(s) */
>  	sdw_slave_read_dpn(slave, prop->src_dpn_prop, nval,
> -			prop->source_ports, "source");
> +			   prop->source_ports, "source");
>  
>  	nval = hweight32(prop->sink_ports);
>  	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
> -				sizeof(*prop->sink_dpn_prop), GFP_KERNEL);
> +					   sizeof(*prop->sink_dpn_prop),
> +					   GFP_KERNEL);
>  	if (!prop->sink_dpn_prop)
>  		return -ENOMEM;
>  
>  	/* Read dpn properties for sink port(s) */
>  	sdw_slave_read_dpn(slave, prop->sink_dpn_prop, nval,
> -			prop->sink_ports, "sink");
> +			   prop->sink_ports, "sink");
>  
>  	/* some ports are bidirectional so check total ports by ORing */
>  	nval = prop->source_ports | prop->sink_ports;
> @@ -388,7 +399,8 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
>  
>  	/* Allocate port_ready based on num_of_ports */
>  	slave->port_ready = devm_kcalloc(&slave->dev, num_of_ports,
> -				sizeof(*slave->port_ready), GFP_KERNEL);
> +					 sizeof(*slave->port_ready),
> +					 GFP_KERNEL);
>  	if (!slave->port_ready)
>  		return -ENOMEM;
>  
> -- 
> 2.17.1

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
