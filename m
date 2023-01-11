Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7707C665D37
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 15:00:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BECBE14C;
	Wed, 11 Jan 2023 15:00:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BECBE14C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673445655;
	bh=6GmdrrfPAFrTCzpxyHGgTB46FlBc6juYoJFaKX7l39E=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DprDoWmtbdzUU3I6brcctGSHJ645BDjwXq1Yzt6E8bUNyE2DULhB+n/gxobmohJnW
	 hBESaUi7C9vCt7lWL4UsQU/zyLXYKX95vCdyZV0gmiVii6V8xQkw479mGA0mscRQj1
	 oCnULq01sfRNfClrq/iCma24g1cRLFRzti6y6PKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39BA8F8030F;
	Wed, 11 Jan 2023 14:59:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D228F803DC; Wed, 11 Jan 2023 14:59:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CCE0F8026A
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 14:59:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CCE0F8026A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=d3ulNJdJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673445594; x=1704981594;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6GmdrrfPAFrTCzpxyHGgTB46FlBc6juYoJFaKX7l39E=;
 b=d3ulNJdJ5sUYzW2WA/B7SJJntFuhMcVTchUocSDnnJKy503g14t1F6wn
 3tRrts4C61KlTD7yhEvZ9C5nLEkkuphZnaBAxu51AWh/68oNdgFJ2oc5X
 7MD/PzdwR9P/djzOB76if1kbmThrv8SPk3fmDwPVckkAi+scBnXXQeVnX
 BqOEKW3UHPvLLbTSEq8/IUngObj6rxoKp+HXxoAkqwpmGXXr8Ji1FgdCL
 coRgOKPVNmYT80oNazc+VSzr3Ws4eKPVKSzbBAsaR8ASgL/ZypS15e84r
 MDGW9i2+73rJTxm2ikQlB4nUMCQnSMFzy4ylNsBv01P4eemSjBtP0g3xy w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="324652533"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="324652533"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 05:59:49 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="687931532"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="687931532"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 05:59:46 -0800
Message-ID: <5dfc3961-206c-5a42-b648-74944de9212f@linux.intel.com>
Date: Wed, 11 Jan 2023 14:59:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 02/19] soundwire: amd: Add support for AMD Master driver
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-3-Vijendar.Mukunda@amd.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230111090222.2016499-3-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mario.Limonciello@amd.com, arungopal.kondaveeti@amd.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 1/11/2023 10:02 AM, Vijendar Mukunda wrote:
> AMD ACP IP block has two soundwire controller devices.
> Add support for
> - Master driver probe & remove sequence
> - Helper functions to enable/disable interrupts, Initialize sdw controller,
>    enable sdw pads
> - Master driver sdw_master_ops & port_ops callbacks
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---

...

> +
> +static int amd_sdwc_compute_params(struct sdw_bus *bus)
> +{
> +	struct sdw_transport_data t_data = {0};
> +	struct sdw_master_runtime *m_rt;
> +	struct sdw_port_runtime *p_rt;
> +	struct sdw_bus_params *b_params = &bus->params;
> +	int port_bo, hstart, hstop, sample_int;
> +	unsigned int rate, bps;
> +
> +	port_bo  = 0;

Double space before '='.

> +	hstart = 1;
> +	hstop = bus->params.col - 1;
> +	t_data.hstop = hstop;
> +	t_data.hstart = hstart;
> +
> +	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
> +		rate = m_rt->stream->params.rate;
> +		bps = m_rt->stream->params.bps;
> +		sample_int = (bus->params.curr_dr_freq / rate);
> +		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
> +			port_bo = (p_rt->num * 64) + 1;
> +			dev_dbg(bus->dev, "p_rt->num=%d hstart=%d hstop=%d port_bo=%d\n",
> +				p_rt->num, hstart, hstop, port_bo);
> +			sdw_fill_xport_params(&p_rt->transport_params, p_rt->num,
> +					      false, SDW_BLK_GRP_CNT_1, sample_int,
> +					      port_bo, port_bo >> 8, hstart, hstop,
> +					      SDW_BLK_PKG_PER_PORT, 0x0);
> +
> +			sdw_fill_port_params(&p_rt->port_params,
> +					     p_rt->num, bps,
> +					     SDW_PORT_FLOW_MODE_ISOCH,
> +					     b_params->m_data_mode);
> +			t_data.hstart = hstart;
> +			t_data.hstop = hstop;
> +			t_data.block_offset = port_bo;
> +			t_data.sub_block_offset = 0;
> +		}
> +		amd_sdwc_compute_slave_ports(m_rt, &t_data);
> +	}
> +	return 0;
> +}
> +

...

> +
> +static int amd_sdwc_port_enable(struct sdw_bus *bus,
> +				struct sdw_enable_ch *enable_ch,
> +				unsigned int bank)
> +{
> +	struct amd_sdwc_ctrl *ctrl = to_amd_sdw(bus);
> +	u32 dpn_ch_enable;
> +	u32 ch_enable_reg, channel_type;
> +
> +	switch (ctrl->instance) {
> +	case ACP_SDW0:
> +		channel_type = enable_ch->port_num;
> +		break;
> +	case ACP_SDW1:
> +		channel_type = enable_ch->port_num + ACP_SDW0_MAX_DAI;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	switch (channel_type) {
> +	case ACP_SDW0_AUDIO_TX:
> +		ch_enable_reg = ACP_SW_AUDIO_TX_CHANNEL_ENABLE_DP0;
> +		break;
> +	case ACP_SDW0_HS_TX:
> +		ch_enable_reg = ACP_SW_HEADSET_TX_CHANNEL_ENABLE_DP0;
> +		break;
> +	case ACP_SDW0_BT_TX:
> +		ch_enable_reg = ACP_SW_BT_TX_CHANNEL_ENABLE_DP0;
> +		break;
> +	case ACP_SDW1_BT_TX:
> +		ch_enable_reg = ACP_P1_SW_BT_TX_CHANNEL_ENABLE_DP0;
> +		break;
> +	case ACP_SDW0_AUDIO_RX:
> +		ch_enable_reg = ACP_SW_AUDIO_RX_CHANNEL_ENABLE_DP0;
> +		break;
> +	case ACP_SDW0_HS_RX:
> +		ch_enable_reg = ACP_SW_HEADSET_RX_CHANNEL_ENABLE_DP0;
> +		break;
> +	case ACP_SDW0_BT_RX:
> +		ch_enable_reg = ACP_SW_BT_RX_CHANNEL_ENABLE_DP0;
> +		break;
> +	case ACP_SDW1_BT_RX:
> +		ch_enable_reg = ACP_P1_SW_BT_RX_CHANNEL_ENABLE_DP0;
> +		break;
> +	default:
> +		dev_err(bus->dev, "%s:Invalid channel:%d\n", __func__, channel_type);
> +		return -EINVAL;
> +	}
> +
> +	dpn_ch_enable =  acp_reg_readl(ctrl->mmio + ch_enable_reg);

Double space after '='.

> +	u32p_replace_bits(&dpn_ch_enable, enable_ch->ch_mask, AMD_DPN_CH_EN_CHMASK);
> +	if (enable_ch->enable)
> +		acp_reg_writel(dpn_ch_enable, ctrl->mmio + ch_enable_reg);
> +	else
> +		acp_reg_writel(0, ctrl->mmio + ch_enable_reg);
> +	return 0;
> +}
> +

...

> +
> +static void amd_sdwc_probe_work(struct work_struct *work)
> +{
> +	struct amd_sdwc_ctrl *ctrl  = container_of(work, struct amd_sdwc_ctrl, probe_work);

Double space before '='.

> +	struct sdw_master_prop *prop;
> +	int ret;
> +
> +	prop = &ctrl->bus.prop;
> +	if (!prop->hw_disabled) {
> +		ret = amd_enable_sdw_pads(ctrl);
> +		if (ret)
> +			return;
> +		ret = amd_init_sdw_controller(ctrl);
> +		if (ret)
> +			return;
> +		amd_enable_sdw_interrupts(ctrl);
> +		ret = amd_enable_sdw_controller(ctrl);
> +		if (ret)
> +			return;
> +		ret = amd_sdwc_set_frameshape(ctrl, 50, 10);
> +		if (!ret)
> +			ctrl->startup_done = true;
> +	}
> +}
> +
> +static int amd_sdwc_probe(struct platform_device *pdev)
> +{
> +	const struct acp_sdw_pdata *pdata = pdev->dev.platform_data;
> +	struct resource *res;
> +	struct device *dev = &pdev->dev;

Same as in previous patch, you assign dev here, but keep using 
&pdev->dev below?

> +	struct sdw_master_prop *prop;
> +	struct sdw_bus_params *params;
> +	struct amd_sdwc_ctrl *ctrl;
> +	int ret;
> +
> +	if (!pdev->dev.platform_data) {
> +		dev_err(&pdev->dev, "platform_data not retrieved\n");
> +		return -ENODEV;
> +	}
> +	ctrl = devm_kzalloc(&pdev->dev, sizeof(struct amd_sdwc_ctrl), GFP_KERNEL);
> +	if (!ctrl)
> +		return -ENOMEM;
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
> +		return -ENOMEM;
> +	}
> +	ctrl->mmio = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> +	if (IS_ERR(ctrl->mmio)) {
> +		dev_err(&pdev->dev, "mmio not found\n");
> +		return PTR_ERR(ctrl->mmio);
> +	}
> +	ctrl->instance = pdata->instance;
> +	ctrl->sdw_lock  = pdata->sdw_lock;

Double space before '='.

> +	ctrl->rows_index = sdw_find_row_index(50);
> +	ctrl->cols_index = sdw_find_col_index(10);
> +
> +	ctrl->dev = dev;
> +	dev_set_drvdata(&pdev->dev, ctrl);
> +
> +	ctrl->bus.ops = &amd_sdwc_ops;
> +	ctrl->bus.port_ops = &amd_sdwc_port_ops;
> +	ctrl->bus.compute_params = &amd_sdwc_compute_params;
> +	ctrl->bus.clk_stop_timeout = 1;
> +	switch (ctrl->instance) {
> +	case ACP_SDW0:
> +		ctrl->num_dout_ports =  AMD_SDW0_MAX_TX_PORTS;

Double space after '='.

> +		ctrl->num_din_ports = AMD_SDW0_MAX_RX_PORTS;
> +		break;
> +	case ACP_SDW1:
> +		ctrl->num_dout_ports = AMD_SDW1_MAX_TX_PORTS;
> +		ctrl->num_din_ports = AMD_SDW1_MAX_RX_PORTS;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	params = &ctrl->bus.params;
> +	params->max_dr_freq = AMD_SDW_DEFAULT_CLK_FREQ * 2;
> +	params->curr_dr_freq = AMD_SDW_DEFAULT_CLK_FREQ * 2;
> +	params->col = 10;
> +	params->row = 50;
> +
> +	prop = &ctrl->bus.prop;
> +	prop->clk_freq = &amd_sdwc_freq_tbl[0];
> +	prop->mclk_freq = AMD_SDW_BUS_BASE_FREQ;
> +	ctrl->bus.link_id = ctrl->instance;
> +	ret = sdw_bus_master_add(&ctrl->bus, dev, dev->fwnode);
> +	if (ret) {
> +		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
> +			ret);
> +		return ret;
> +	}
> +	INIT_WORK(&ctrl->probe_work, amd_sdwc_probe_work);
> +	schedule_work(&ctrl->probe_work);
> +	return 0;
> +}
> +
> +static int amd_sdwc_remove(struct platform_device *pdev)
> +{
> +	struct amd_sdwc_ctrl *ctrl = dev_get_drvdata(&pdev->dev);
> +	int ret;
> +

You may need to cancel work if someone tries to unload driver before 
probe work completes. Something like

cancel_work_sync(&ctrl->probe_work);

should probably work here.

> +	amd_disable_sdw_interrupts(ctrl);
> +	sdw_bus_master_delete(&ctrl->bus);
> +	ret = amd_disable_sdw_controller(ctrl);
> +	return ret;
> +}
> +


