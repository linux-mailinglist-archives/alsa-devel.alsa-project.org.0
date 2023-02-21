Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A1D69E55A
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 17:59:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5F7CDF2;
	Tue, 21 Feb 2023 17:59:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5F7CDF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676998795;
	bh=fXvc7PvF0yHpEa4W/g0V4IwVvpyWrb+80rTHTG5cEVc=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eX/d1UO0rT8SsYegVwuhOz6L1R3nRANVzSOaYNJBYGuXywZv9TsgpRuMra0MPocEb
	 9HfxisQvHKPGMCYU2PTEH/0eT1I1aiMvLnbhXuTBv1lQ8jQQRESMT6rxBZVZCCC/oP
	 E9bXqAy+WjsKq9jKMbNc76MtvH9wJR13ewhvVoqs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 795B4F800B6;
	Tue, 21 Feb 2023 17:59:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF923F80527; Tue, 21 Feb 2023 17:58:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E52C6F80125
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 17:58:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E52C6F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BWt7qE5/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676998729; x=1708534729;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fXvc7PvF0yHpEa4W/g0V4IwVvpyWrb+80rTHTG5cEVc=;
  b=BWt7qE5/+hK0+1VQx/pMCZkqawpiqvXaJaSfGdriK+COwx3ANxzQjTr3
   3XccvHAh+LWgMBFJuQeN0d0bG1/rqfZthzb9KS2Ow29UWwanUx0QwmG6b
   Z7fA7HtRhqU22BT9mnvXtlMxAAt/PR9KPEee8Frsjys7r+4USiPihaTgy
   X1ejJS3wOxDyupwi4CmiKYZu9Ba/EJtJzgu4DCTWNPdZ0nZRgDe5d30lR
   6PmXOj4Rtyx0xeXIsZxJXrVnq2EU1XiuvFkkTeJbnt9soeqKWJ/0Jqmpx
   J42RilwkZZFlYhtUgNueM0H906Iuo+y+udRMV15w0MBqidty9MZgu26a1
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334884626"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000";
   d="scan'208";a="334884626"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 08:58:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="814569086"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000";
   d="scan'208";a="814569086"
Received: from taevough-mobl.amr.corp.intel.com (HELO [10.209.174.213])
 ([10.209.174.213])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 08:58:31 -0800
Message-ID: <03cac551-b77e-0109-5895-5a009e0fba61@linux.intel.com>
Date: Tue, 21 Feb 2023 10:57:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V3 2/8] soundwire: amd: Add support for AMD Manager driver
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
References: <20230220100418.76754-1-Vijendar.Mukunda@amd.com>
 <20230220100418.76754-3-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230220100418.76754-3-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: W2WCIB6IAVE6HG2QUCAPFO6BXE5HBEOA
X-Message-ID-Hash: W2WCIB6IAVE6HG2QUCAPFO6BXE5HBEOA
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
 Mario.Limonciello@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W2WCIB6IAVE6HG2QUCAPFO6BXE5HBEOA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +static int amd_init_sdw_manager(struct amd_sdw_manager *amd_manager)
> +{
> +	u32 val;
> +	u32 timeout = 0;
> +	u32 retry_count = 0;
> +
> +	acp_reg_writel(AMD_SDW_ENABLE, amd_manager->mmio + ACP_SW_EN);
> +	do {
> +		val = acp_reg_readl(amd_manager->mmio + ACP_SW_EN_STATUS);
> +		if (val)
> +			break;
> +		usleep_range(10, 50);

that's a 5x range used for all usleep_range() in this file, is this
intentional?

> +	} while (retry_count++ < AMD_SDW_STAT_MAX_RETRY_COUNT);
> +
> +	if (retry_count > AMD_SDW_STAT_MAX_RETRY_COUNT)
> +		return -ETIMEDOUT;
> +
> +	/* SoundWire manager bus reset */
> +	acp_reg_writel(AMD_SDW_BUS_RESET_REQ, amd_manager->mmio + ACP_SW_BUS_RESET_CTRL);
> +	val = acp_reg_readl(amd_manager->mmio + ACP_SW_BUS_RESET_CTRL);
> +	while (!(val & AMD_SDW_BUS_RESET_DONE)) {
> +		val = acp_reg_readl(amd_manager->mmio + ACP_SW_BUS_RESET_CTRL);
> +		if (timeout > AMD_DELAY_LOOP_ITERATION)
> +			break;

so if you break here...

> +		usleep_range(1, 5);
> +		timeout++;
> +	}
> +	if (timeout == AMD_DELAY_LOOP_ITERATION)
> +		return -ETIMEDOUT;

... this test will never be used. the timeout management looks wrong?

> +	timeout = 0;
> +	acp_reg_writel(AMD_SDW_BUS_RESET_CLEAR_REQ, amd_manager->mmio + ACP_SW_BUS_RESET_CTRL);
> +	val = acp_reg_readl(amd_manager->mmio + ACP_SW_BUS_RESET_CTRL);
> +	while (val) {
> +		val = acp_reg_readl(amd_manager->mmio + ACP_SW_BUS_RESET_CTRL);
> +		if (timeout > AMD_DELAY_LOOP_ITERATION)
> +			break;

same here...

> +		usleep_range(1, 5);
> +		timeout++;
> +	}
> +	if (timeout == AMD_DELAY_LOOP_ITERATION) {

... and here.

> +		dev_err(amd_manager->dev, "Failed to reset SoundWire manager instance%d\n",
> +			amd_manager->instance);
> +		return -ETIMEDOUT;
> +	}
> +	retry_count = 0;
> +	acp_reg_writel(AMD_SDW_DISABLE, amd_manager->mmio + ACP_SW_EN);
> +	do {
> +		val = acp_reg_readl(amd_manager->mmio + ACP_SW_EN_STATUS);
> +		if (!val)
> +			break;
> +		usleep_range(10, 50);
> +	} while (retry_count++ < AMD_SDW_STAT_MAX_RETRY_COUNT);
> +
> +	if (retry_count > AMD_SDW_STAT_MAX_RETRY_COUNT)
> +		return -ETIMEDOUT;

that one looks correct though.

> +	return 0;
> +}

> +static void amd_enable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
> +{
> +	struct sdw_manager_reg_mask *reg_mask = amd_manager->reg_mask;
> +	u32 val;
> +
> +	mutex_lock(amd_manager->acp_sdw_lock);
> +	val = acp_reg_readl(amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(amd_manager->instance));
> +	val |= reg_mask->acp_sdw_intr_mask;
> +	acp_reg_writel(val, amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(amd_manager->instance));

here you handle a read-modify-write sequence on the INTL_CNTL register...

> +	val = acp_reg_readl(amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(amd_manager->instance));

... but here you only read from the same register. what's the purpose of
this read?

> +	mutex_unlock(amd_manager->acp_sdw_lock);
> +	dev_dbg(amd_manager->dev, "acp_ext_intr_ctrl[0x%x]:0x%x\n",
> +		ACP_EXTERNAL_INTR_CNTL(amd_manager->instance), val);
> +	val = acp_reg_readl(amd_manager->acp_mmio + ACP_EXTERNAL_INTR_STAT(amd_manager->instance));
> +	if (val)
> +		acp_reg_writel(val, amd_manager->acp_mmio +
> +			       ACP_EXTERNAL_INTR_STAT(amd_manager->instance));
> +
> +	acp_reg_writel(AMD_SDW_IRQ_MASK_0TO7, amd_manager->mmio +
> +		       ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
> +	acp_reg_writel(AMD_SDW_IRQ_MASK_8TO11, amd_manager->mmio +
> +		       ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
> +	acp_reg_writel(AMD_SDW_IRQ_ERROR_MASK, amd_manager->mmio + ACP_SW_ERROR_INTR_MASK);

can you explain why the writes are not protected by the mutex?

> +}
> +
> +static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
> +{
> +	struct sdw_manager_reg_mask *reg_mask = amd_manager->reg_mask;
> +	u32 val;
> +
> +	mutex_lock(amd_manager->acp_sdw_lock);
> +	val = acp_reg_readl(amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(amd_manager->instance));
> +	val &= ~reg_mask->acp_sdw_intr_mask;
> +	acp_reg_writel(val, amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(amd_manager->instance));

you don't have the read here as in the enable sequence to presumably
that wasn't needed?

> +	mutex_unlock(amd_manager->acp_sdw_lock);
> +
> +	acp_reg_writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
> +	acp_reg_writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
> +	acp_reg_writel(0x00, amd_manager->mmio + ACP_SW_ERROR_INTR_MASK);

same, not clear why the writes are not protected?

> +}

...

> +static u64 amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lword, u32 uword)
> +{
> +	u64 resp;
> +	u32 resp_lower, resp_high;
> +	u32 sts;
> +	u32 timeout = 0;
> +
> +	sts = acp_reg_readl(amd_manager->mmio + ACP_SW_IMM_CMD_STS);
> +	while (sts & AMD_SDW_IMM_CMD_BUSY) {
> +		sts = acp_reg_readl(amd_manager->mmio + ACP_SW_IMM_CMD_STS);
> +		if (timeout > AMD_SDW_RETRY_COUNT) {
> +			dev_err(amd_manager->dev, "SDW%x previous cmd status clear failed\n",
> +				amd_manager->instance);
> +			return -ETIMEDOUT;
> +		}
> +		timeout++;

no usleep_range() here?

Also is there any merit in using the same retry count across the board,
this is about command handling, not enabling the hardware - presumably
this should be tied to the SoundWire bus frame timing, not internal delays.

> +	}
> +
> +	timeout = 0;
> +	if (sts & AMD_SDW_IMM_RES_VALID) {
> +		dev_err(amd_manager->dev, "SDW%x manager is in bad state\n", amd_manager->instance);
> +		acp_reg_writel(0x00, amd_manager->mmio + ACP_SW_IMM_CMD_STS);
> +	}
> +	acp_reg_writel(uword, amd_manager->mmio + ACP_SW_IMM_CMD_UPPER_WORD);
> +	acp_reg_writel(lword, amd_manager->mmio + ACP_SW_IMM_CMD_LOWER_QWORD);
> +
> +	sts = acp_reg_readl(amd_manager->mmio + ACP_SW_IMM_CMD_STS);
> +	while (!(sts & AMD_SDW_IMM_RES_VALID)) {
> +		sts = acp_reg_readl(amd_manager->mmio + ACP_SW_IMM_CMD_STS);
> +		if (timeout > AMD_SDW_RETRY_COUNT) {
> +			dev_err(amd_manager->dev, "SDW%x cmd response timeout occurred\n",
> +				amd_manager->instance);
> +			return -ETIMEDOUT;

usleep_range?

> +		}
> +		timeout++;
> +	}
> +	resp_high = acp_reg_readl(amd_manager->mmio + ACP_SW_IMM_RESP_UPPER_WORD);
> +	resp_lower = acp_reg_readl(amd_manager->mmio + ACP_SW_IMM_RESP_LOWER_QWORD);
> +	timeout = 0;
> +	acp_reg_writel(AMD_SDW_IMM_RES_VALID, amd_manager->mmio + ACP_SW_IMM_CMD_STS);
> +	while ((sts & AMD_SDW_IMM_RES_VALID)) {
> +		sts = acp_reg_readl(amd_manager->mmio + ACP_SW_IMM_CMD_STS);
> +		if (timeout > AMD_SDW_RETRY_COUNT) {
> +			dev_err(amd_manager->dev, "SDW%x cmd status retry failed\n",
> +				amd_manager->instance);
> +			return -ETIMEDOUT;
> +		}
> +		timeout++;

usleep_range() ?

> +	}
> +	resp = resp_high;
> +	resp = (resp << 32) | resp_lower;
> +	return resp;
> +}
> +
> +static enum sdw_command_response
> +amd_program_scp_addr(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg)
> +{
> +	struct sdw_msg scp_msg = {0};
> +	u64 response_buf[2] = {0};
> +	u32 uword = 0, lword = 0;
> +	int nack = 0, no_ack = 0;
> +	int index, timeout = 0;
> +
> +	scp_msg.dev_num = msg->dev_num;
> +	scp_msg.addr = SDW_SCP_ADDRPAGE1;
> +	scp_msg.buf = &msg->addr_page1;
> +	amd_sdw_ctl_word_prep(&lword, &uword, AMD_SDW_CMD_WRITE, &scp_msg, 0);
> +	response_buf[0] = amd_sdw_send_cmd_get_resp(amd_manager, lword, uword);
> +	scp_msg.addr = SDW_SCP_ADDRPAGE2;
> +	scp_msg.buf = &msg->addr_page2;
> +	amd_sdw_ctl_word_prep(&lword, &uword, AMD_SDW_CMD_WRITE, &scp_msg, 0);
> +	response_buf[1] = amd_sdw_send_cmd_get_resp(amd_manager, lword, uword);
> +
> +	/* check response the writes */

revisit comment, grammar does not add up - missing to/if/after?

> +	for (index = 0; index < 2; index++) {

what is the 2 here?

> +		if (response_buf[index] == -ETIMEDOUT) {
> +			dev_err(amd_manager->dev, "Program SCP cmd timeout\n");

that's one log here, possibly 2 ...

> +			timeout = 1;
> +		} else if (!(response_buf[index] & AMD_SDW_MCP_RESP_ACK)) {
> +			no_ack = 1;
> +			if (response_buf[index] & AMD_SDW_MCP_RESP_NACK) {
> +				nack = 1;
> +				dev_err(amd_manager->dev, "Program SCP NACK received\n");
> +			}
> +		}
> +	}
> +
> +	if (timeout) {
> +		dev_err_ratelimited(amd_manager->dev,
> +				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);

... and one more here. Is this needed/useful?

> +		return SDW_CMD_TIMEOUT;
> +	}
> +
> +	if (nack) {
> +		dev_err_ratelimited(amd_manager->dev,
> +				    "SCP_addrpage NACKed for Slave %d\n", msg->dev_num);
> +		return SDW_CMD_FAIL;
> +	}
> +
> +	if (no_ack) {
> +		dev_dbg_ratelimited(amd_manager->dev,
> +				    "SCP_addrpage ignored for Slave %d\n", msg->dev_num);
> +		return SDW_CMD_IGNORED;
> +	}
> +	return SDW_CMD_OK;
> +}

> +static int amd_sdw_manager_probe(struct platform_device *pdev)
> +{
> +	const struct acp_sdw_pdata *pdata = pdev->dev.platform_data;
> +	struct resource *res;
> +	struct device *dev = &pdev->dev;
> +	struct sdw_master_prop *prop;
> +	struct sdw_bus_params *params;
> +	struct amd_sdw_manager *amd_manager;
> +	int ret;
> +
> +	if (!pdev->dev.platform_data) {
> +		dev_err(dev, "platform_data not retrieved\n");

can this happen?

> +		return -ENODEV;
> +	}
> +	amd_manager = devm_kzalloc(dev, sizeof(struct amd_sdw_manager), GFP_KERNEL);
> +	if (!amd_manager)
> +		return -ENOMEM;
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENOMEM;
> +	amd_manager->acp_mmio = devm_ioremap(dev, res->start, resource_size(res));
> +	if (IS_ERR(amd_manager->mmio)) {
> +		dev_err(dev, "mmio not found\n");
> +		return PTR_ERR(amd_manager->mmio);
> +	}
> +	amd_manager->instance = pdata->instance;
> +	amd_manager->mmio = amd_manager->acp_mmio +
> +			    (amd_manager->instance * SDW_MANAGER_REG_OFFSET);
> +	amd_manager->acp_sdw_lock = pdata->acp_sdw_lock;
> +	amd_manager->cols_index = sdw_find_col_index(AMD_SDW_DEFAULT_COLUMNS);
> +	amd_manager->rows_index = sdw_find_row_index(AMD_SDW_DEFAULT_ROWS);
> +	amd_manager->dev = dev;
> +	amd_manager->bus.ops = &amd_sdw_ops;
> +	amd_manager->bus.port_ops = &amd_sdw_port_ops;
> +	amd_manager->bus.compute_params = &amd_sdw_compute_params;
> +	amd_manager->bus.clk_stop_timeout = 200;
> +	amd_manager->bus.link_id = amd_manager->instance;
> +	switch (amd_manager->instance) {
> +	case ACP_SDW0:
> +		amd_manager->num_dout_ports = AMD_SDW0_MAX_TX_PORTS;
> +		amd_manager->num_din_ports = AMD_SDW0_MAX_RX_PORTS;
> +		break;
> +	case ACP_SDW1:
> +		amd_manager->num_dout_ports = AMD_SDW1_MAX_TX_PORTS;
> +		amd_manager->num_din_ports = AMD_SDW1_MAX_RX_PORTS;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	amd_manager->reg_mask = &sdw_manager_reg_mask_array[amd_manager->instance];
> +	params = &amd_manager->bus.params;
> +	params->max_dr_freq = AMD_SDW_DEFAULT_CLK_FREQ * 2;
> +	params->curr_dr_freq = AMD_SDW_DEFAULT_CLK_FREQ * 2;
> +	params->col = AMD_SDW_DEFAULT_COLUMNS;
> +	params->row = AMD_SDW_DEFAULT_ROWS;
> +	prop = &amd_manager->bus.prop;
> +	prop->clk_freq = &amd_sdw_freq_tbl[0];
> +	prop->mclk_freq = AMD_SDW_BUS_BASE_FREQ;
> +
> +	ret = sdw_bus_master_add(&amd_manager->bus, dev, dev->fwnode);
> +	if (ret) {
> +		dev_err(dev, "Failed to register SoundWire manager(%d)\n", ret);
> +		return ret;
> +	}
> +	dev_set_drvdata(dev, amd_manager);
> +	INIT_WORK(&amd_manager->probe_work, amd_sdw_probe_work);
> +	/*
> +	 * Instead of having lengthy probe sequence, spilt probe in two and

typo: split.

> +	 * use work queue for SoundWire manager startup sequence.

The wording 'startup' is confusing in that you do not have a startup
sequence as for Intel. It's just deferred probe to avoid taking too much
time.

> +	 */
> +	schedule_work(&amd_manager->probe_work);
> +	return 0;
> +}

