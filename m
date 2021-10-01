Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A62D641E692
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 06:22:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F6E916E1;
	Fri,  1 Oct 2021 06:21:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F6E916E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633062133;
	bh=P1aX9F2pe3olEwuezxcNa6NkzrsGb7AJ7jerrhnDnJA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XTtCISxHiZ5oggFCuCqs4lqlwEoEC7vRxRJSyAJ2UnTVS2cQLRu0HA4xakdsNmMJp
	 FalDmTClv/F12YPfg25+eNlAPX9IOIzhOFIB2SGI+V8FwlWLny0UeVMQFyzn6ltwXQ
	 rYU6TJ8aZAyOH+VU1Pud7CnMgYgFDeoN+WuVxaL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7136F8026D;
	Fri,  1 Oct 2021 06:20:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ACCFF80245; Fri,  1 Oct 2021 06:20:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CD8AF80165
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 06:20:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CD8AF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eTHJJOzb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5E8461A40;
 Fri,  1 Oct 2021 04:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633062041;
 bh=P1aX9F2pe3olEwuezxcNa6NkzrsGb7AJ7jerrhnDnJA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eTHJJOzbxXLg7tBsiLtwlBQFBMMfVLEi9P3xu08vOt4JwboxSS6yyAWMxC9VB3pbj
 0IBzDTTFzqUlhTRnDYQJgnINkBN31hnzQPQ2DEJbFAfprsVfn+/94vY6R0L2NSBSyG
 zdzS/aNVE/R9tIHOj1f3ilaRSxzWTliuhgJR34CC/bpDaygjprIIQt/qTCtiVOZvpC
 gwMNdQxzFTQaXcETYdLIP8pcL7Ri/iy+v9p3CxPtIhcpLHITVAPze2eB+ly+XAsEGr
 JU8Zwn2spZLQSXPti1DXl1fHc/5e8Xjl7wtWqUG1EbEQsaP9z/qbTpPSFZb81MwNq8
 TjHxWTBZyGTlQ==
Date: Fri, 1 Oct 2021 09:50:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] soundwire: qcom: add debugfs entry for soundwire
 register dump
Message-ID: <YVaMlSbmFnrQyb0u@matsya>
References: <20210907105636.3171-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907105636.3171-1-srinivas.kandagatla@linaro.org>
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

HI Srini,

On 07-09-21, 11:56, Srinivas Kandagatla wrote:
> +#ifdef CONFIG_DEBUG_FS
> +static int swrm_reg_show(struct seq_file *s_file, void *data)
> +{
> +	struct qcom_swrm_ctrl *swrm = s_file->private;
> +	int reg, reg_val;
> +
> +	for (reg = 0; reg <= SWR_MSTR_MAX_REG_ADDR; reg += 4) {
> +		swrm->reg_read(swrm, reg, &reg_val);

Why not use regmap_read here, that would avoid reading from the bus when
we already have the values...

Second make sure later when pm_runtime support is added, this take a
reference ..

Thanks
-- 
~Vinod
