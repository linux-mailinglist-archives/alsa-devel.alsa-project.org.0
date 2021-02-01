Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7FB30A996
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 15:23:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B00D176A;
	Mon,  1 Feb 2021 15:22:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B00D176A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612189402;
	bh=saXB81rCBp5cIBvK13wj/wHHDWVKYzlvS9EQuCXX8PM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X7L1PgPawTzQ7luRu8a2VL4emWG43WN31nVnz6uNfsKFI/yIPNjmFEjSb7cJ0K32M
	 akBOtAx1PmlhfaFgtTKy1U7xm9iVrISBlBOrL9HGSRejcdh6SapmMjfMvapdPm1IcH
	 T4AiRMtAbkBL0ZyzSFdeQtO4euZo1ZkGWSu0DB5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A262AF80154;
	Mon,  1 Feb 2021 15:21:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6EF5F80153; Mon,  1 Feb 2021 15:21:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78E16F800E9
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 15:21:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78E16F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OFPFpv/g"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26A8464DDE;
 Mon,  1 Feb 2021 14:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612189299;
 bh=saXB81rCBp5cIBvK13wj/wHHDWVKYzlvS9EQuCXX8PM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OFPFpv/gHreo3nMrGcJ1nGRzWenR5Tzq9Jooii0VBCICl9xgEeP6o43OwFFivofip
 alWyr+BHMaTxclfyYCERmvP+1vFWxCCfYFzQ6uJLhVOWwy7fIH3Wx6EIt8j0n4Kn6H
 7uFiYvsE8v3f41RFPmi1NNlu+hDMhSUFjMF0bhcUya0QbwjNVgzMCQMmkOkPr4aRxC
 /UB/nTrW5CgD+MFM6LLtX5NWC9tO0JHPYhcLucVbvV9xLOlP1uYlpvIDatrtLkVvwr
 edCJs7QelY+qSZ5pVV8GnRVE7i2G5EGuqSCLvyTRy2cXyegwHz5PPsQGnALzC1AC22
 ct8BY8QLyATeQ==
Date: Mon, 1 Feb 2021 19:51:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 4/6] soundwire: qcom: start the clock during initialization
Message-ID: <20210201142134.GC2771@vkoul-mobl>
References: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
 <20210129173248.5941-5-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210129173248.5941-5-srinivas.kandagatla@linaro.org>
Cc: sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On 29-01-21, 17:32, Srinivas Kandagatla wrote:
> Start the clock during initialization.

A detailed log please, which clock..? Also how do older controllers work
w/o this clk

> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/soundwire/qcom.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 3669bac11a32..83df15d83935 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -47,6 +47,8 @@
>  #define SWRM_MCP_FRAME_CTRL_BANK_ADDR(m)		(0x101C + 0x40 * (m))
>  #define SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK			GENMASK(2, 0)
>  #define SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK			GENMASK(7, 3)
> +#define SWRM_MCP_BUS_CTRL					0x1044
> +#define SWRM_MCP_BUS_CLK_START					BIT(1)
>  #define SWRM_MCP_CFG_ADDR					0x1048
>  #define SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK		GENMASK(21, 17)
>  #define SWRM_DEF_CMD_NO_PINGS					0x1f
> @@ -345,6 +347,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  	u32p_replace_bits(&val, SWRM_DEF_CMD_NO_PINGS, SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK);
>  	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
>  
> +	ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
>  	/* Configure number of retries of a read/write cmd */
>  	if (ctrl->version_major == 1 && ctrl->version_minor >= 5 &&
>  	    ctrl->version_step >= 1) {
> -- 
> 2.21.0

-- 
~Vinod
