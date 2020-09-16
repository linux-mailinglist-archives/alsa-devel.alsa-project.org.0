Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1B226C2EE
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 14:48:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE1D816A1;
	Wed, 16 Sep 2020 14:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE1D816A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600260517;
	bh=IpFNcwpgMGhaIjjYrhn3RrCKJAOKHJ/C9PHWEAEGuwc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FXGQdmWaVsIcE1jQSUf1m97/QRXGHPxktYGB0T9O7dVfsANmlyWf8fj9BtU3qn9og
	 Jm209zB+Jz/I6YJrHGlYSKyQ7qeZqevAEiLnyL/GnTMcucuF2WxiEh9Elgif4+5q2/
	 72N2z4J7pV41GTQKAu3f7P6RUDIVJ8cSl617u1qc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6C24F8015C;
	Wed, 16 Sep 2020 14:46:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AAB9F800E8; Wed, 16 Sep 2020 14:46:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0620F8015A
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 14:46:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0620F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="wdmTyPZ+"
Received: from localhost (unknown [122.172.186.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A865A20658;
 Wed, 16 Sep 2020 12:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600260402;
 bh=IpFNcwpgMGhaIjjYrhn3RrCKJAOKHJ/C9PHWEAEGuwc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wdmTyPZ+ChCahHH7J8zYPseh58htz4QL4nWTppk8PToYfyp1NH1p4VgPbS3HXQa51
 ilxcZ4QKeNPFvJKXJ1P8b/qCjfgok7LdgE2zyYdvQ4vTGeiJKhSTpMx5m2x8hb+P4O
 KE6kvVoBMHD7zGdaj71NJNQyeLNWhzaYNBUqIYC0=
Date: Wed, 16 Sep 2020 18:16:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 1/3] soundwire: qcom: clear BIT FIELDs before value set.
Message-ID: <20200916124634.GM2968@vkoul-mobl>
References: <20200916092125.30898-1-srinivas.kandagatla@linaro.org>
 <20200916092125.30898-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916092125.30898-2-srinivas.kandagatla@linaro.org>
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

Hi Srini,

On 16-09-20, 10:21, Srinivas Kandagatla wrote:
> According to usage (bitfields.h) of REG_FIELDS,
> Modify is:
>   reg &= ~REG_FIELD_C;
>   reg |= FIELD_PREP(REG_FIELD_C, c);
> 
> Patch ("soundwire: qcom : use FIELD_{GET|PREP}") seems to have
> accidentally removed clearing bit field while modifying the register.
> 
> Fix this by adding back clear register mask before setting it up!
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/soundwire/qcom.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index d7aabdaffee3..5d26361ab4f6 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -311,6 +311,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  
>  	/* Configure No pings */
>  	ctrl->reg_read(ctrl, SWRM_MCP_CFG_ADDR, &val);
> +	val &= ~SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK;
>  	val |= FIELD_PREP(SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK, SWRM_DEF_CMD_NO_PINGS);

Should we rather use u32_replace_bits() here, I think the intention is
to replace bits.

>  	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
>  
> @@ -372,6 +373,9 @@ static int qcom_swrm_pre_bank_switch(struct sdw_bus *bus)
>  
>  	ctrl->reg_read(ctrl, reg, &val);
>  
> +	val &= ~SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK;
> +	val &= ~SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK;
> +
>  	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, SWRM_MAX_COL_VAL);
>  	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, SWRM_MAX_ROW_VAL);
>  
> -- 
> 2.21.0

-- 
~Vinod
