Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BA43BEC60
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 18:37:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CF21886;
	Wed,  7 Jul 2021 18:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CF21886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625675826;
	bh=WAZ4qNFm3qYovCDmTdVLyN1nai0ARwticmeA8ohqDfg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZOQUwEZsIX5qfX6qxySHxP7nEnFF8/1VDoudKy83QL9EdrTuP5KFQC+RQQxuaZdXj
	 bnE/NmOkr6v2hm43IC2hhI7502QWvhiHLMkFKEwIk0IYa4e+B88r2OAQ9klnkYHNUQ
	 OvMOE63gvjn3kzBYfSZ+YQnoxy1RVDug57FurYK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22090F802E3;
	Wed,  7 Jul 2021 18:35:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A639F802E3; Wed,  7 Jul 2021 18:35:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89709F8012A
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 18:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89709F8012A
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="209299007"
X-IronPort-AV: E=Sophos;i="5.84,220,1620716400"; d="scan'208";a="209299007"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 09:35:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,220,1620716400"; d="scan'208";a="645442731"
Received: from cmcarran-mobl.amr.corp.intel.com (HELO [10.213.189.140])
 ([10.213.189.140])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 09:35:27 -0700
Subject: Re: [PATCH 03/12] add acp5x init/de-init functions
To: Vijendar Mukunda <vijendar.mukunda@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
 <20210707055623.27371-4-vijendar.mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <dca2f367-59a3-6ea6-7abc-c9817442eb86@linux.intel.com>
Date: Wed, 7 Jul 2021 11:15:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707055623.27371-4-vijendar.mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Alexander.Deucher@amd.com, Takashi Iwai <tiwai@suse.com>,
 Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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

Missing 'ASoC: amd' prefix in commit subject?


> +static int acp5x_power_on(void __iomem *acp5x_base)
> +{
> +	u32 val;
> +	int timeout;
> +
> +	val = acp_readl(acp5x_base + ACP_PGFSM_STATUS);
> +
> +	if (val == 0)
> +		return val;
> +
> +	if ((val & ACP_PGFSM_STATUS_MASK) !=
> +				ACP_POWER_ON_IN_PROGRESS)
> +		acp_writel(ACP_PGFSM_CNTL_POWER_ON_MASK,
> +			   acp5x_base + ACP_PGFSM_CONTROL);
> +	timeout = 0;
> +	while (++timeout < 500) {
> +		val = acp_readl(acp5x_base + ACP_PGFSM_STATUS);
> +		if (!val)

Shouldn't you use something like 
if ((val & ACP_PGFSM_STATUS_MASK) == ACP_POWERED_ON)
for symmetry with the power-off case?

> +			return 0;
> +		udelay(1);
> +	}
> +	return -ETIMEDOUT;
> +}
> +
> +static int acp5x_power_off(void __iomem *acp5x_base)
> +{
> +	u32 val;
> +	int timeout;
> +
> +	acp_writel(ACP_PGFSM_CNTL_POWER_OFF_MASK,
> +		   acp5x_base + ACP_PGFSM_CONTROL);
> +	timeout = 0;
> +	while (++timeout < 500) {
> +		val = acp_readl(acp5x_base + ACP_PGFSM_STATUS);
> +		if ((val & ACP_PGFSM_STATUS_MASK) == ACP_POWERED_OFF)
> +			return 0;
> +		udelay(1);
> +	}
> +	return -ETIMEDOUT;
> +}
> +
> +static int acp5x_reset(void __iomem *acp5x_base)
> +{
> +	u32 val;
> +	int timeout;
> +
> +	acp_writel(1, acp5x_base + ACP_SOFT_RESET);
> +	timeout = 0;
> +	while (++timeout < 500) {
> +		val = acp_readl(acp5x_base + ACP_SOFT_RESET);
> +		if (val & ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK)
> +			break;
> +		cpu_relax();
> +	}
> +	acp_writel(0, acp5x_base + ACP_SOFT_RESET);
> +	timeout = 0;
> +	while (++timeout < 500) {
> +		val = acp_readl(acp5x_base + ACP_SOFT_RESET);
> +		if (!val)
> +			return 0;
> +		cpu_relax();
> +	}
> +	return -ETIMEDOUT;
> +}
> +
> +static void acp5x_enable_interrupts(void __iomem *acp5x_base)
> +{
> +	acp_writel(0x01, acp5x_base + ACP_EXTERNAL_INTR_ENB);
> +}
> +
> +static void acp5x_disable_interrupts(void __iomem *acp5x_base)
> +{
> +	acp_writel(ACP_EXT_INTR_STAT_CLEAR_MASK, acp5x_base +
> +		   ACP_EXTERNAL_INTR_STAT);
> +	acp_writel(0x00, acp5x_base + ACP_EXTERNAL_INTR_CNTL);
> +	acp_writel(0x00, acp5x_base + ACP_EXTERNAL_INTR_ENB);
> +}
> +
> +static int acp5x_init(void __iomem *acp5x_base)
> +{
> +	int ret;
> +
> +	/* power on */
> +	ret = acp5x_power_on(acp5x_base);
> +	if (ret) {
> +		pr_err("ACP5x power on failed\n");
> +		return ret;
> +	}
> +	/* Reset */
> +	ret = acp5x_reset(acp5x_base);
> +	if (ret) {
> +		pr_err("ACP5x reset failed\n");
> +		return ret;
> +	}
> +	acp5x_enable_interrupts(acp5x_base);
> +	return 0;
> +}
> +
> +static int acp5x_deinit(void __iomem *acp5x_base)
> +{
> +	int ret;
> +
> +	acp5x_disable_interrupts(acp5x_base);
> +	/* Reset */
> +	ret = acp5x_reset(acp5x_base);
> +	if (ret) {
> +		pr_err("ACP5x reset failed\n");
> +		return ret;
> +	}
> +	/* power off */
> +	if (acp_power_gating) {
> +		ret = acp5x_power_off(acp5x_base);
> +		if (ret) {
> +			pr_err("ACP5x power off failed\n");
> +			return ret;
> +		}
> +	}
> +	return 0;

shouldn't you have a sequence for shutdown that ignores the acp_power_gating parameter?

