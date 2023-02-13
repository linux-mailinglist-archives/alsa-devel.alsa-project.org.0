Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B66E694F4C
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 19:26:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 833CB868;
	Mon, 13 Feb 2023 19:26:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 833CB868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676312812;
	bh=RXnL+HngXrp/cyWpmOPHoDtZ6ssV4/DG94YKJsp0gME=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YEtIpM4KIyM8Sn7u1mQREDzxaioCldc31v3O4A8gHqhwWbwxkyRbPkXvY6B9lJiEA
	 S6lS/9sfjf9LggVKQAcsszmJ2o3MKrlp7k0OnqBNpFd3JK5F3xuPoENdrUJCCKZZ53
	 QmdCXXi0i1Z0BabHEjXTit5VPqqKMqSzK3/rPqS8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D56BFF8053B;
	Mon, 13 Feb 2023 19:25:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7D12F80526; Mon, 13 Feb 2023 19:25:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC117F800B0
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 19:24:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC117F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EXAzIDPm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676312693; x=1707848693;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RXnL+HngXrp/cyWpmOPHoDtZ6ssV4/DG94YKJsp0gME=;
  b=EXAzIDPm0XfObc6I92QXuXR7rSp2E2Y6e5k3R/IdAMX00NzZyeGGSKG9
   gCGIfc5K5yCD3/uIeHhRUr1Gmlp6wUVcmtIdhK6spc9sDwbPdMsRLP50r
   ZtuefFDjtzvBmTiJrM7fK9DYv8o50+yQ/543HglGydf48FfAG9CbGAYjy
   rAJrNepMOPF9htELSoM+jx8gTvx8UITXlh0AjnRU0Wuoq45rOmy2vg7IE
   ELtl5U4hI5qsunoy0wo45NV2rKWeOnvqFvPTosVY+7ur2s4DVjHVjcAcE
   yfOBznX1GmtMELeA+gtUoQ5fGrSgUBC77I93RY+zZqH53bzR5w/BcN7Xo
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="328664063"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000";
   d="scan'208";a="328664063"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 10:24:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="701369279"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000";
   d="scan'208";a="701369279"
Received: from eatoledo-mobl.amr.corp.intel.com (HELO [10.212.18.132])
 ([10.212.18.132])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 10:24:34 -0800
Message-ID: <a3a75ead-5430-ae32-a6ae-78314bc637f1@linux.intel.com>
Date: Mon, 13 Feb 2023 12:05:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V2 2/8] soundwire: amd: Add support for AMD Manager driver
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
References: <20230213094031.2231058-1-Vijendar.Mukunda@amd.com>
 <20230213094031.2231058-3-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230213094031.2231058-3-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7TOPAHHRV3EB7E6CXCNIKLT2T5HZBM6A
X-Message-ID-Hash: 7TOPAHHRV3EB7E6CXCNIKLT2T5HZBM6A
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: amadeuszx.slawinski@linux.intel.com, Mario.Limonciello@amd.com,
 Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUNDWIRE SUBSYSTEM" <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7TOPAHHRV3EB7E6CXCNIKLT2T5HZBM6A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +static void amd_enable_sdw_pads(struct amd_sdw_manager *amd_manager)
> +{
> +	u32 sw_pad_pulldown_val;
> +	u32 val = 0;

useless init

> +
> +	mutex_lock(amd_manager->sdw_lock);
> +	val = acp_reg_readl(amd_manager->acp_mmio + ACP_SW_PAD_KEEPER_EN);
> +	val |= amd_manager->reg_mask->sw_pad_enable_mask;
> +	acp_reg_writel(val, amd_manager->acp_mmio + ACP_SW_PAD_KEEPER_EN);
> +	usleep_range(1000, 1500);
> +
> +	sw_pad_pulldown_val = acp_reg_readl(amd_manager->acp_mmio + ACP_PAD_PULLDOWN_CTRL);
> +	sw_pad_pulldown_val &= amd_manager->reg_mask->sw_pad_pulldown_mask;
> +	acp_reg_writel(sw_pad_pulldown_val, amd_manager->acp_mmio + ACP_PAD_PULLDOWN_CTRL);
> +	mutex_unlock(amd_manager->sdw_lock);
> +}
> +
> +static int amd_init_sdw_manager(struct amd_sdw_manager *amd_manager)
> +{
> +	u32 val = 0;

useless init

> +	u32 timeout = 0;
> +	u32 retry_count = 0;
> +
> +	acp_reg_writel(AMD_SDW_ENABLE, amd_manager->mmio + ACP_SW_EN);
> +	do {
> +		val = acp_reg_readl(amd_manager->mmio + ACP_SW_EN_STATUS);
> +		if (val)
> +			break;
> +		usleep_range(10, 50);
> +	} while (retry_count++ < AMD_SDW_STAT_MAX_RETRY_COUNT);
> +
> +	if (retry_count > AMD_SDW_STAT_MAX_RETRY_COUNT)
> +		return -ETIMEDOUT;
> +
> +	/* Soundwire manager bus reset */
> +	acp_reg_writel(AMD_SDW_BUS_RESET_REQ, amd_manager->mmio + ACP_SW_BUS_RESET_CTRL);
> +	val = acp_reg_readl(amd_manager->mmio + ACP_SW_BUS_RESET_CTRL);
> +	while (!(val & AMD_SDW_BUS_RESET_DONE)) {
> +		val = acp_reg_readl(amd_manager->mmio + ACP_SW_BUS_RESET_CTRL);
> +		if (timeout > AMD_DELAY_LOOP_ITERATION)
> +			break;
> +		usleep_range(1, 5);
> +		timeout++;
> +	}
> +	if (timeout == AMD_DELAY_LOOP_ITERATION)
> +		return -ETIMEDOUT;
> +	timeout = 0;
> +	acp_reg_writel(AMD_SDW_BUS_RESET_CLEAR_REQ, amd_manager->mmio + ACP_SW_BUS_RESET_CTRL);
> +	val = acp_reg_readl(amd_manager->mmio + ACP_SW_BUS_RESET_CTRL);
> +	while (val) {
> +		val = acp_reg_readl(amd_manager->mmio + ACP_SW_BUS_RESET_CTRL);
> +		if (timeout > AMD_DELAY_LOOP_ITERATION)
> +			break;
> +		usleep_range(1, 5);
> +		timeout++;
> +	}
> +	if (timeout == AMD_DELAY_LOOP_ITERATION) {
> +		dev_err(amd_manager->dev, "Failed to reset Soundwire manager instance%d\n",
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
> +	return 0;
> +}
> +
> +static int amd_enable_sdw_manager(struct amd_sdw_manager *amd_manager)
> +{
> +	u32 val = 0;

useless init

> +	u32 retry_count = 0;
> +
> +	acp_reg_writel(AMD_SDW_ENABLE, amd_manager->mmio + ACP_SW_EN);
> +	do {
> +		val = acp_reg_readl(amd_manager->mmio + ACP_SW_EN_STATUS);
> +		if (val)
> +			break;
> +		usleep_range(10, 50);
> +	} while (retry_count++ < AMD_SDW_STAT_MAX_RETRY_COUNT);
> +
> +	if (retry_count > AMD_SDW_STAT_MAX_RETRY_COUNT)
> +		return -ETIMEDOUT;
> +	return 0;
> +}
> +
> +static int amd_disable_sdw_manager(struct amd_sdw_manager *amd_manager)
> +{
> +	u32 val = 0;

useless init

> +	u32 retry_count = 0;
> +
> +	acp_reg_writel(AMD_SDW_DISABLE, amd_manager->mmio + ACP_SW_EN);
> +	/*
> +	 * After invoking manager disable sequence, check whether
> +	 * manager has executed clock stop sequence. In this case,
> +	 * manager should ignore checking enable status register.
> +	 */
> +	val = acp_reg_readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
> +	if (val)
> +		return 0;
> +
> +	do {
> +		val = acp_reg_readl(amd_manager->mmio + ACP_SW_EN_STATUS);
> +		if (!val)
> +			break;
> +		usleep_range(10, 50);
> +	} while (retry_count++ < AMD_SDW_STAT_MAX_RETRY_COUNT);
> +
> +	if (retry_count > AMD_SDW_STAT_MAX_RETRY_COUNT)
> +		return -ETIMEDOUT;
> +	return 0;
> +}
> +
> +static void amd_enable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
> +{
> +	struct sdw_manager_reg_mask *reg_mask = amd_manager->reg_mask;
> +	u32 val;
> +
> +	mutex_lock(amd_manager->sdw_lock);
> +	val = acp_reg_readl(amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(amd_manager->instance));
> +	val |= reg_mask->acp_sdw_intr_mask;
> +	acp_reg_writel(val, amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(amd_manager->instance));
> +	val = acp_reg_readl(amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(amd_manager->instance));
> +	mutex_unlock(amd_manager->sdw_lock);
> +	dev_dbg(amd_manager->dev, "%s: acp_ext_intr_ctrl[0x%x]:0x%x\n", __func__,
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
> +}
> +
> +static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
> +{
> +	struct sdw_manager_reg_mask *reg_mask = amd_manager->reg_mask;
> +	u32 val;
> +
> +	mutex_lock(amd_manager->sdw_lock);
> +	val = acp_reg_readl(amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(amd_manager->instance));
> +	val &= ~reg_mask->acp_sdw_intr_mask;
> +	acp_reg_writel(val, amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(amd_manager->instance));
> +	mutex_unlock(amd_manager->sdw_lock);
> +
> +	acp_reg_writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
> +	acp_reg_writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
> +	acp_reg_writel(0x00, amd_manager->mmio + ACP_SW_ERROR_INTR_MASK);
> +}
> +
> +static void amd_sdw_set_frameshape(struct amd_sdw_manager *amd_manager)
> +{
> +	u32 frame_size;
> +
> +	frame_size = (amd_manager->rows_index << 3) | amd_manager->cols_index;
> +	acp_reg_writel(frame_size, amd_manager->mmio + ACP_SW_FRAMESIZE);
> +}
> +
> +static void amd_sdw_ctl_word_prep(u32 *low_word, u32 *high_word, u32 cmd_type,
> +				  struct sdw_msg *msg, int cmd_offset)
> +{
> +	u32 low_data = 0, high_data = 0;

init for high_data is useless

> +	u16 addr;
> +	u8 addr_high, addr_low;
> +	u8 data = 0;
> +
> +	addr = msg->addr + cmd_offset;
> +	addr_high = (addr & 0xFF00) >> 8;
> +	addr_low = addr & 0xFF;
> +
> +	if (cmd_type == AMD_SDW_CMD_WRITE)
> +		data = msg->buf[cmd_offset];
> +
> +	high_data = FIELD_PREP(AMD_SDW_MCP_CMD_DEV_ADDR, msg->dev_num);
> +	high_data |= FIELD_PREP(AMD_SDW_MCP_CMD_COMMAND, cmd_type);
> +	high_data |= FIELD_PREP(AMD_SDW_MCP_CMD_REG_ADDR_HIGH, addr_high);
> +	low_data |= FIELD_PREP(AMD_SDW_MCP_CMD_REG_ADDR_LOW, addr_low);
> +	low_data |= FIELD_PREP(AMD_SDW_MCP_CMD_REG_DATA, data);
> +
> +	*high_word = high_data;
> +	*low_word = low_data;
> +}
> +
> +static u64 amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lword, u32 uword)
> +{
> +	u64 resp = 0;

useless init

> +	u32 resp_lower, resp_high;
> +	u32 sts = 0;

useless init

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
> +	}
> +	resp = resp_high;
> +	resp = (resp << 32) | resp_lower;
> +	return resp;
> +}

> +static unsigned int _amd_sdw_xfer_msg(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg,
> +				      int cmd, int cmd_offset)
> +{
> +	u64 response = 0;

useless init

> +	u32 uword = 0, lword = 0;
> +
> +	amd_sdw_ctl_word_prep(&lword, &uword, cmd, msg, cmd_offset);
> +	response = amd_sdw_send_cmd_get_resp(amd_manager, lword, uword);
> +	return amd_sdw_fill_msg_resp(amd_manager, msg, response, cmd_offset);
> +}
> +
> +static enum sdw_command_response amd_sdw_xfer_msg(struct sdw_bus *bus, struct sdw_msg *msg)
> +{
> +	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
> +	int ret, i;
> +	int cmd = 0;
> +
> +	ret = amd_prep_msg(amd_manager, msg, &cmd);
> +	if (ret)
> +		return SDW_CMD_FAIL_OTHER;
> +	for (i = 0; i < msg->len; i++) {
> +		ret = _amd_sdw_xfer_msg(amd_manager, msg, cmd, i);
> +		if (ret)
> +			return ret;
> +	}
> +	return SDW_CMD_OK;
> +}
> +
> +static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
> +{
> +	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
> +	u64 response;
> +	u32 slave_stat = 0;

useless init

> +
> +	response = amd_sdw_send_cmd_get_resp(amd_manager, 0, 0);
> +	/* slave status from ping response*/
> +	slave_stat = FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response);
> +	slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
> +	dev_dbg(amd_manager->dev, "%s: slave_stat:0x%x\n", __func__, slave_stat);
> +	return slave_stat;
> +}

> +static void amd_sdw_probe_work(struct work_struct *work)
> +{
> +	struct amd_sdw_manager *amd_manager = container_of(work, struct amd_sdw_manager,
> +							   probe_work);
> +	struct sdw_master_prop *prop;
> +	int ret;
> +
> +	prop = &amd_manager->bus.prop;
> +	if (!prop->hw_disabled) {
> +		amd_enable_sdw_pads(amd_manager);
> +		ret = amd_init_sdw_manager(amd_manager);
> +		if (ret)
> +			return;
> +		amd_enable_sdw_interrupts(amd_manager);
> +		ret = amd_enable_sdw_manager(amd_manager);
> +		if (ret)
> +			return;
> +		amd_sdw_set_frameshape(amd_manager);
> +	}
> +}

There should be an explanation as to why you need a workqueue to
complete the probe.

> +
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
> +	amd_manager->sdw_lock = pdata->sdw_lock;
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
> +		dev_err(dev, "Failed to register Soundwire manager(%d)\n", ret);
> +		return ret;
> +	}
> +	dev_set_drvdata(dev, amd_manager);
> +	INIT_WORK(&amd_manager->probe_work, amd_sdw_probe_work);
> +	schedule_work(&amd_manager->probe_work);
> +	return 0;
> +}
> +
> +static int amd_sdw_manager_remove(struct platform_device *pdev)
> +{
> +	struct amd_sdw_manager *amd_manager = dev_get_drvdata(&pdev->dev);
> +	int ret;
> +
> +	if (!amd_manager)
> +		return -ENODEV;

is this possible? From the code just above wioth dev_set_drvdata() it
seems there's no error code, so the remove can blindly use the pointer.

> +	cancel_work_sync(&amd_manager->probe_work);
> +	amd_disable_sdw_interrupts(amd_manager);
> +	sdw_bus_master_delete(&amd_manager->bus);
> +	ret = amd_disable_sdw_manager(amd_manager);
> +	return ret;

return amd_disable_sdw_manager(amd_manager); ?

> +}
> +
> +static struct platform_driver amd_sdw_driver = {
> +	.probe	= &amd_sdw_manager_probe,
> +	.remove = &amd_sdw_manager_remove,
> +	.driver = {
> +		.name	= "amd_sdw_manager",
> +	}
> +};
> +module_platform_driver(amd_sdw_driver);

> +struct acp_sdw_pdata {
> +	u16 instance;
> +	/* mutex to protect acp common register access */
> +	struct mutex *sdw_lock;

may be acp_sdw_lock then? sdw_lock sounds very generic and confusing IMHO.

> +};
