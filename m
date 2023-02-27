Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3616A47A1
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 18:14:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D567A20C;
	Mon, 27 Feb 2023 18:13:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D567A20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677518048;
	bh=ahUrroTHl6zZ2xmQQr9wwI5mo7+SqybLJn4AYfRsubY=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MPv3Qb/747TQhL7BmogHorWvfDpceREVbh1K6XILcCgz2/fqdqycRwu+dBDJAwIcZ
	 044R6F0dR+fmyyJnRGTW0pku2rUcN4r65r6KcmPJKcK0H3wkRjdM55HMMnq3NupZbG
	 C7sByRpP9jhdG6nKbClh3lvX9ljgK/bzMfJ8OG0Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0EA4F8049C;
	Mon, 27 Feb 2023 18:13:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB062F80527; Mon, 27 Feb 2023 18:13:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DAC9F80236
	for <alsa-devel@alsa-project.org>; Mon, 27 Feb 2023 18:13:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DAC9F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=K8NQd64n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677517982; x=1709053982;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ahUrroTHl6zZ2xmQQr9wwI5mo7+SqybLJn4AYfRsubY=;
  b=K8NQd64npyUGADTJYtnJsbSgqr1m1lXT1pttwD5cv0V3oOQKMiqe/0ZM
   6fEWIc0afD2d6P17zTAr2Pwwhp8d2xzWsRLBiIE8Ci2FKTd+oMCUmYQlh
   P2PGjfW4g3xnBtSkMJeFEt1ShSjiCVluL8Frrun5rBdjcW9ZeDWinZQ99
   0xQBZXUVpNBGxil251e96kGECkZnA4lLxsjMAoeVHmAYzsLpQmyQ+VqZD
   V3J78zJfAp/Rkmd7c+XCZHU0WhLyhqDmcGVm0tkCUNn3LF2I7T+8ElyxE
   Ch/MImnYp4951kbrKy5q7GTAA6SNpKtHSdD4F1ZBLQjGl0wHQ6Jraa9xT
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="313583656"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400";
   d="scan'208";a="313583656"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 09:08:27 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="651302239"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400";
   d="scan'208";a="651302239"
Received: from jaidenno-mobl.amr.corp.intel.com (HELO [10.212.85.4])
 ([10.212.85.4])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 09:08:23 -0800
Message-ID: <606c1b31-d83e-6ef0-8b01-45e7e0be4cbc@linux.intel.com>
Date: Mon, 27 Feb 2023 11:35:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V4 2/8] soundwire: amd: Add support for AMD Manager driver
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
References: <20230227154801.50319-1-Vijendar.Mukunda@amd.com>
 <20230227154801.50319-3-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230227154801.50319-3-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: R6CCQXWX46RCLYSQDOLADGEJN7TUVXV2
X-Message-ID-Hash: R6CCQXWX46RCLYSQDOLADGEJN7TUVXV2
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
 amadeuszx.slawinski@linux.intel.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R6CCQXWX46RCLYSQDOLADGEJN7TUVXV2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/27/23 10:47, Vijendar Mukunda wrote:
> AMD ACP(v6.x) IP block has two SoundWire manager devices.
> Add support for
>   - Manager driver probe & remove sequence
>   - Helper functions to enable/disable interrupts,
>     Initialize sdw manager, enable sdw pads
>   - Manager driver sdw_master_ops & port_ops callbacks
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  drivers/soundwire/amd_manager.c   | 749 ++++++++++++++++++++++++++++++
>  drivers/soundwire/amd_manager.h   | 252 ++++++++++
>  include/linux/soundwire/sdw_amd.h |  67 +++
>  3 files changed, 1068 insertions(+)
>  create mode 100644 drivers/soundwire/amd_manager.c
>  create mode 100644 drivers/soundwire/amd_manager.h
>  create mode 100644 include/linux/soundwire/sdw_amd.h
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> new file mode 100644
> index 000000000000..63cd8d066602
> --- /dev/null
> +++ b/drivers/soundwire/amd_manager.c
> @@ -0,0 +1,749 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * SoundWire AMD Manager driver
> + *
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/completion.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_registers.h>
> +#include <linux/wait.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include "bus.h"
> +#include "amd_manager.h"
> +
> +#define DRV_NAME "amd_sdw_manager"
> +
> +#define to_amd_sdw(b)	container_of(b, struct amd_sdw_manager, bus)
> +
> +static void amd_enable_sdw_pads(struct amd_sdw_manager *amd_manager)
> +{
> +	u32 sw_pad_pulldown_val;
> +	u32 val;
> +
> +	mutex_lock(amd_manager->acp_sdw_lock);
> +	val = acp_reg_readl(amd_manager->acp_mmio + ACP_SW_PAD_KEEPER_EN);
> +	val |= amd_manager->reg_mask->sw_pad_enable_mask;
> +	acp_reg_writel(val, amd_manager->acp_mmio + ACP_SW_PAD_KEEPER_EN);
> +	usleep_range(1000, 1500);
> +
> +	sw_pad_pulldown_val = acp_reg_readl(amd_manager->acp_mmio + ACP_PAD_PULLDOWN_CTRL);
> +	sw_pad_pulldown_val &= amd_manager->reg_mask->sw_pad_pulldown_mask;
> +	acp_reg_writel(sw_pad_pulldown_val, amd_manager->acp_mmio + ACP_PAD_PULLDOWN_CTRL);
> +	mutex_unlock(amd_manager->acp_sdw_lock);
> +}
> +
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
> +		usleep_range(10, 20);
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
> +		usleep_range(1, 5);
> +		timeout++;
> +	}
> +	if (timeout > AMD_DELAY_LOOP_ITERATION)
> +		return -ETIMEDOUT;

nit-pick: add a new line here since you're starting a different sequence.

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
> +	if (timeout > AMD_DELAY_LOOP_ITERATION) {
> +		dev_err(amd_manager->dev, "Failed to reset SoundWire manager instance%d\n",
> +			amd_manager->instance);
> +		return -ETIMEDOUT;
> +	}

and same here, this is a new sequence starting here so a newline would help

> +	retry_count = 0;
> +	acp_reg_writel(AMD_SDW_DISABLE, amd_manager->mmio + ACP_SW_EN);
> +	do {
> +		val = acp_reg_readl(amd_manager->mmio + ACP_SW_EN_STATUS);
> +		if (!val)
> +			break;
> +		usleep_range(10, 20);
> +	} while (retry_count++ < AMD_SDW_STAT_MAX_RETRY_COUNT);
> +
> +	if (retry_count > AMD_SDW_STAT_MAX_RETRY_COUNT)
> +		return -ETIMEDOUT;
> +	return 0;
> +}
> +
> +static int amd_enable_sdw_manager(struct amd_sdw_manager *amd_manager)
> +{
> +	u32 val;
> +	u32 retry_count = 0;
> +
> +	acp_reg_writel(AMD_SDW_ENABLE, amd_manager->mmio + ACP_SW_EN);
> +	do {
> +		val = acp_reg_readl(amd_manager->mmio + ACP_SW_EN_STATUS);
> +		if (val)
> +			break;
> +		usleep_range(10, 20);
> +	} while (retry_count++ < AMD_SDW_STAT_MAX_RETRY_COUNT);
> +
> +	if (retry_count > AMD_SDW_STAT_MAX_RETRY_COUNT)
> +		return -ETIMEDOUT;
> +	return 0;
> +}

> +static void amd_sdw_ctl_word_prep(u32 *low_word, u32 *high_word, u32 cmd_type,
> +				  struct sdw_msg *msg, int cmd_offset)
> +{
> +	u32 low_data = 0, high_data;
> +	u16 addr;
> +	u8 addr_high, addr_low;
> +	u8 data = 0;

nit-pick: this looks a bit messy, usually it's simpler to have
initialized variables on separate lines. If you keep the low and high on
the same line, then at least use the same order.

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
> +	u64 resp;
> +	u32 resp_lower, resp_high;

nit-pick: resp_low? you seem to use this low/high pattern in a number of
places.

> +	u32 sts;
> +	u32 timeout = 0;
> +
> +	sts = acp_reg_readl(amd_manager->mmio + ACP_SW_IMM_CMD_STS);
> +	while (sts & AMD_SDW_IMM_CMD_BUSY) {
> +		if (timeout++ > AMD_SDW_RETRY_COUNT) {
> +			dev_err(amd_manager->dev, "SDW%x previous cmd status clear failed\n",
> +				amd_manager->instance);
> +			return -ETIMEDOUT;
> +		}
> +		usleep_range(5, 10);
> +		sts = acp_reg_readl(amd_manager->mmio + ACP_SW_IMM_CMD_STS);
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
> +		if (timeout++ > AMD_SDW_RETRY_COUNT) {
> +			dev_err(amd_manager->dev, "SDW%x cmd response timeout occurred\n",
> +				amd_manager->instance);
> +			return -ETIMEDOUT;
> +		}
> +		usleep_range(5, 10);
> +		sts = acp_reg_readl(amd_manager->mmio + ACP_SW_IMM_CMD_STS);
> +	}
> +	resp_high = acp_reg_readl(amd_manager->mmio + ACP_SW_IMM_RESP_UPPER_WORD);
> +	resp_lower = acp_reg_readl(amd_manager->mmio + ACP_SW_IMM_RESP_LOWER_QWORD);

nit-pick: newline here.

> +	timeout = 0;
> +	acp_reg_writel(AMD_SDW_IMM_RES_VALID, amd_manager->mmio + ACP_SW_IMM_CMD_STS);
> +	sts = acp_reg_readl(amd_manager->mmio + ACP_SW_IMM_CMD_STS);
> +	while ((sts & AMD_SDW_IMM_RES_VALID)) {
> +		if (timeout++ > AMD_SDW_RETRY_COUNT) {
> +			dev_err(amd_manager->dev, "SDW%x cmd status retry failed\n",
> +				amd_manager->instance);
> +			return -ETIMEDOUT;
> +		}
> +		usleep_range(5, 10);
> +		sts = acp_reg_readl(amd_manager->mmio + ACP_SW_IMM_CMD_STS);
> +	}
> +	resp = resp_high;
> +	resp = (resp << 32) | resp_lower;
> +	return resp;
> +}

> +static unsigned int _amd_sdw_xfer_msg(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg,
> +				      int cmd, int cmd_offset)
> +{
> +	u64 response;
> +	u32 uword = 0, lword = 0;

couldn't figure out what uword and lword refer to. Is this high/low as
above or something else?

> +
> +	amd_sdw_ctl_word_prep(&lword, &uword, cmd, msg, cmd_offset);
> +	response = amd_sdw_send_cmd_get_resp(amd_manager, lword, uword);
> +	return amd_sdw_fill_msg_resp(amd_manager, msg, response, cmd_offset);
> +}
