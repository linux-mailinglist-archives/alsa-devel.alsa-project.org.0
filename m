Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07760308E3F
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 21:19:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D2F81681;
	Fri, 29 Jan 2021 21:18:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D2F81681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611951578;
	bh=xtGXN/CoflUkyfaK5NC0m/x9j5Jy+lI2S2ed5cEIojQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BEPQgiuP6zD1sKi1ryVUASDJbocYHJ7ohtHXlsHcUk2hNRGxwAglC8Pf/1QuvrTe7
	 KvQBmggbsaKbBlak2k54Gs19ylh+RKKQDn9UHpUtI2IjI86LDdZ3Ed7w5moYb4GtOq
	 PKw5tHN6GAn2KiWTD50TvFk2EszsWBhEA/RHNGcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A46DAF80260;
	Fri, 29 Jan 2021 21:17:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EC1AF800E9; Fri, 29 Jan 2021 21:17:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAF59F800E9
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 21:17:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAF59F800E9
IronPort-SDR: QoW0e+pv/ah3JkSiEzUpghJWrDFY+bBCimtTUzaMkOSh/HrbUlkyQGKPkL0R1H73cxG3+mSEre
 OZDIUQJm21JQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9879"; a="177916018"
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; d="scan'208";a="177916018"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2021 12:17:08 -0800
IronPort-SDR: qHj/GQWRqrWl8Gv7Xv74XQ/ak345shFCLAWaWQwR7iVGOqIBp79D3eVwJFtmsfEOcS0v47wQ/7
 cyoWYq5/CPaA==
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; d="scan'208";a="431150003"
Received: from kagerrar-mobl.amr.corp.intel.com (HELO [10.212.16.186])
 ([10.212.16.186])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2021 12:17:07 -0800
Subject: Re: [PATCH 5/6] soundwire: qcom: update register read/write routine
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
 <20210129173248.5941-6-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5c69ed09-60be-2f3d-ed25-f6dbfcb9d62f@linux.intel.com>
Date: Fri, 29 Jan 2021 13:33:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210129173248.5941-6-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
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



On 1/29/21 11:32 AM, Srinivas Kandagatla wrote:
> In the existing code every soundwire register read and register write
> are kinda blocked. Each of these are using a special command id that

what does 'kinda blocked' mean?

> generates interrupt after it successfully finishes. This is really
> overhead, limiting and not really necessary unless we are doing
> something special.
> 
> We can simply read/write the fifo that should also give exactly
> what we need! This will also allow to read/write registers in
> interrupt context, which was not possible with the special
> command approach.

This is really unclear, sorry.

> +	if (id != SWR_BROADCAST_CMD_ID) {
> +		if (id < 14)
> +			id += 1;
> +		else
> +			id = 0;

that is really odd. if id=13 (group2) then id becomes 14 (master 
address). A comment is really needed here.

> +	if (cmd_id == SWR_BROADCAST_CMD_ID) {
> +		/*
> +		 * sleep for 10ms for MSM soundwire variant to allow broadcast
> +		 * command to complete.

that's also super-odd. There is nothing in SoundWire that makes any 
difference between a regular and a broadcast command. they all complete 
in the same time (a frame).
> +		 */
> +		ret = wait_for_completion_timeout(&swrm->broadcast, (2 * HZ/10));

is this 10ms really or dependent on CONFIG_HZ?

> +		if (!ret)
> +			ret = SDW_CMD_IGNORED;
> +		else
> +			ret = SDW_CMD_OK;

no CMD_FAILED support?

> +static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *swrm,
> +				     u8 dev_addr, u16 reg_addr,
> +				     u32 len, u8 *rval)
> +{
> +	u32 val;
> +	u32 retry_attempt = 0;
> +	u32 cmd_data;
> +	int ret = SDW_CMD_OK;
> +
> +	mutex_lock(&swrm->io_lock);
> +	val = swrm_get_packed_reg_val(&swrm->rcmd_id, len, dev_addr, reg_addr);
> +
> +	/* wait for FIFO RD to complete to avoid overflow */
> +	usleep_range(100, 105);
> +	swrm->reg_write(swrm, SWRM_CMD_FIFO_RD_CMD, val);
> +	/* wait for FIFO RD CMD complete to avoid overflow */
> +	usleep_range(250, 255);
> +
> +retry_read:
> +
> +	swrm->reg_read(swrm, SWRM_CMD_FIFO_RD_FIFO_ADDR, &cmd_data);
> +	rval[0] = cmd_data & 0xFF;
> +
> +	if ((((cmd_data) & 0xF00) >> 8) != swrm->rcmd_id) {
> +		if (retry_attempt < MAX_FIFO_RD_FAIL_RETRY) {
> +			/* wait 500 us before retry on fifo read failure */
> +			usleep_range(500, 505);
> +			if (retry_attempt == (MAX_FIFO_RD_FAIL_RETRY - 1)) {
> +				swrm->reg_write(swrm, SWRM_CMD_FIFO_CMD, 0x1);
> +				swrm->reg_write(swrm, SWRM_CMD_FIFO_RD_CMD, val);
> +			}
> +			retry_attempt++;
> +			goto retry_read;
> +		} else {
> +			dev_err(swrm->dev,
> +					"failed to read fifo: reg: 0x%x, \
> +					rcmd_id: 0x%x, dev_num: 0x%x, cmd_data: 0x%x\n",
> +					reg_addr, swrm->rcmd_id,
> +					dev_addr, cmd_data);
> +			ret = SDW_CMD_IGNORED;
> +		}
>   	}

the flow seems complicated with multiple tests and goto? Can this be 
simplified?
