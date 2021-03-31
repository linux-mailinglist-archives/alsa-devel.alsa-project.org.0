Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDA935068A
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 20:40:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2D0E1669;
	Wed, 31 Mar 2021 20:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2D0E1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617216013;
	bh=Iuwt9HlaS45BKACjs8TORKTsIX8zUlROmzS9N7J5YI4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bpjehKhVxj39o8l350spnmwfiS70ET97TMMueVkSnRvXNeigsvTq3P/P4bCItn8gw
	 2LpEssrVfyqhwRjEDODadwfQD4+dZNvuaNqQtcg9l1EJYSmEo1LWSj5ZnYs3+a7RZK
	 A/TwOo7UI6/vjcpvZmoFK+w0tTA+6KEZOLG5IV5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19F4AF8016E;
	Wed, 31 Mar 2021 20:38:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD1CCF8013F; Wed, 31 Mar 2021 20:38:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AC24F8013F
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 20:38:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AC24F8013F
IronPort-SDR: mkZOV5zZIJeuUeucPfpR6kIBAGxDziMEDpgvvosOx0K6FxZq0XZ/w8J4TC38BDMVas2drOq4lp
 ZBGb+gTt2OLg==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="189838889"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="189838889"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 11:38:34 -0700
IronPort-SDR: tgecgx9ye8u3SLe947FDLLViSgVcOUu1AX+GTEuhluo/vICKFCAZjZIQerNZD6opH7meP9H+sY
 qP10KS/C30mw==
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="607291433"
Received: from tgvanner-mobl1.amr.corp.intel.com (HELO [10.254.114.81])
 ([10.254.114.81])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 11:38:33 -0700
Subject: Re: [PATCH] soundwire: qcom: wait for fifo space to be available
 before read/write
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20210331170033.17174-1-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ad9f1d18-8f72-9a53-535a-ab5a99379016@linux.intel.com>
Date: Wed, 31 Mar 2021 13:38:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210331170033.17174-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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


> +static int swrm_wait_for_rd_fifo_avail(struct qcom_swrm_ctrl *swrm)
> +{
> +	u32 fifo_outstanding_cmd, value;
> +	u8 fifo_retry_count = SWR_OVERFLOW_RETRY_COUNT;
> +
> +	/* Check for fifo underflow during read */
> +	swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
> +	fifo_outstanding_cmd = FIELD_GET(SWRM_RD_CMD_FIFO_CNT_MASK, value);
> +
> +	 /* Check number of outstanding commands in fifo before read */
> +	if (fifo_outstanding_cmd)
> +		return 0;
> +
> +	do {
> +		usleep_range(500, 510);
> +		swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
> +		fifo_outstanding_cmd = FIELD_GET(SWRM_RD_CMD_FIFO_CNT_MASK, value);
> +		if (fifo_outstanding_cmd > 0)
> +			break;
> +	} while (fifo_retry_count--);
> +
> +	if (fifo_outstanding_cmd == 0) {
> +		dev_err_ratelimited(swrm->dev, "%s err read underflow\n", __func__);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int swrm_wait_for_wr_fifo_avail(struct qcom_swrm_ctrl *swrm)
> +{
> +	u32 fifo_outstanding_cmd, value;
> +	u8 fifo_retry_count = SWR_OVERFLOW_RETRY_COUNT;
> +
> +	/* Check for fifo overflow during write */
> +	swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
> +	fifo_outstanding_cmd = FIELD_GET(SWRM_WR_CMD_FIFO_CNT_MASK, value);
> +
> +	/* Check number of outstanding commands in fifo before write */
> +	if (fifo_outstanding_cmd != swrm->wr_fifo_depth)
> +		return 0;
> +
> +	do {
> +		usleep_range(500, 510);
> +		swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
> +		fifo_outstanding_cmd = FIELD_GET(SWRM_WR_CMD_FIFO_CNT_MASK, value);
> +		if (fifo_outstanding_cmd < swrm->wr_fifo_depth)
> +			break;
> +	} while (fifo_retry_count--);
> +
> +	if (fifo_outstanding_cmd == swrm->wr_fifo_depth) {
> +		dev_err_ratelimited(swrm->dev, "%s err write overflow\n", __func__);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}

nit-pick: you could merge the prologue and loop body with a 
while(fifo_retry_count--) and put the usleep_range() at the end of the loop.

