Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE1AF356F
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 18:09:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9850E1672;
	Thu,  7 Nov 2019 18:08:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9850E1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573146559;
	bh=V/vBVuvKP6Gqj7xVNf/zrf5p4GndokZVGgLJ9r/coTA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lizz4RutZp81Vz2ygHIpH06SS8nWKWcnsc5KbZQ9cxL0mCPYvSDKSCqKDqMtFv+xu
	 5O2v9D+ntZdUtWkrqOnS1uE/Ogt+n5Fw1Yh5kYjptQVYzrGKzBkNa6Su/3fw4EC4me
	 Mu93p2JpMTlYRDj09tcOvz3Zfo271I65/A54CD0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5308DF80638;
	Thu,  7 Nov 2019 18:05:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EE3DF805FF; Thu,  7 Nov 2019 18:05:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7232EF80291
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 18:05:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7232EF80291
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 09:05:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; d="scan'208";a="192880789"
Received: from cjense2x-mobl1.amr.corp.intel.com (HELO [10.251.130.63])
 ([10.251.130.63])
 by orsmga007.jf.intel.com with ESMTP; 07 Nov 2019 09:05:28 -0800
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573133093-28208-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1573133093-28208-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <dc3c320e-970f-ff49-b542-16dd7058e882@linux.intel.com>
Date: Thu, 7 Nov 2019 09:34:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1573133093-28208-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Content-Language: en-US
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, YueHaibing <yuehaibing@huawei.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Akshu.Agrawal@amd.com,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH v3 6/6] ASoC: amd: Added ACP3x system
 resume and runtime pm
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> +static int acp3x_power_on(void __iomem *acp3x_base)
> +{
> +	u32 val;
> +	u32 timeout = 0;
> +	int ret = 0;
> +
> +	val = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
> +
> +	if (val == 0)
> +		return val;
> +
> +	if (!((val & ACP_PGFSM_STATUS_MASK) ==
> +				ACP_POWER_ON_IN_PROGRESS))
> +		rv_writel(ACP_PGFSM_CNTL_POWER_ON_MASK,
> +			acp3x_base + mmACP_PGFSM_CONTROL);
> +	while (++timeout < 500) {
> +		val  = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
> +		if (!val)
> +			break;
> +		udelay(1);
> +		if (timeout > 500) {

your timeout cannot reach 500, isn't this dead code?

> +			pr_err("ACP is Not Powered ON\n");
> +			return -ETIMEDOUT;
> +		}
> +	}
> +}
> +
> +static int acp3x_power_off(void __iomem *acp3x_base)
> +{
> +	u32 val;
> +	u32 timeout = 0;
> +
> +	rv_writel(ACP_PGFSM_CNTL_POWER_OFF_MASK,
> +			acp3x_base + mmACP_PGFSM_CONTROL);
> +	while (++timeout < 500) {
> +		val  = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
> +		if ((val & ACP_PGFSM_STATUS_MASK) == ACP_POWERED_OFF)
> +			return 0;
> +		udelay(1);
> +		if (timeout > 500) {

same here, the timeout handling looks broken

> +			pr_err("ACP is Not Powered OFF\n");
> +			return -ETIMEDOUT;
> +		}
> +	}
> +}
> +
> +
> +static int acp3x_reset(void __iomem *acp3x_base)
> +{
> +	u32 val, timeout;
> +
> +	rv_writel(1, acp3x_base + mmACP_SOFT_RESET);
> +	timeout = 0;
> +	while (++timeout < 100) {
> +		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
> +		if ((val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK) ||
> +							timeout > 100) {

and here, how can timeout > 100 if the outer loops controls it.

> +			if (val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK)
> +				break;
> +			return -ENODEV;
> +		}
> +		cpu_relax();
> +	}
> +	rv_writel(0, acp3x_base + mmACP_SOFT_RESET);
> +	timeout = 0;
> +	while (++timeout < 100) {
> +		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
> +		if (!val)
> +			break;
> +		if (timeout > 100)

same here

> +static int  snd_acp3x_suspend(struct device *dev)
extra spaces?

> +{
> +	int status;
> +	struct acp3x_dev_data *adata = dev_get_drvdata(dev);
> +
> +	status = acp3x_deinit(adata->acp3x_base);
> +	if (status)
> +		dev_err(dev, "ACP de-init failed\n");
> +	else
> +		dev_info(dev, "ACP de-initialized\n");
> +
> +	return 0;
> +}
> +static int  snd_acp3x_resume(struct device *dev)

extra spaces?

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
