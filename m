Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD56F69E566
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 18:01:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17E48DFA;
	Tue, 21 Feb 2023 18:00:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17E48DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676998888;
	bh=GmFG1YKCb0Q/ommkmUjwup7T9MZg39/d3oY0mhMCpc0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C8AqwBsg+1KVTlfHig3crWmvvP/wXGT3vdHYPg8NVNPxMUqT/pwIJQ6k9+7d177Ls
	 KKyNO8QXXY+rdK0mVwUs8EzRSVX+meSGfM6zcbor9XrxVngskFoUC3RY1sHbpKGoTO
	 45LUm09FGY7BsHfU4spVRFkmw8+1Qf0f/4x0rdCY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67549F80525;
	Tue, 21 Feb 2023 17:59:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C32D4F8052D; Tue, 21 Feb 2023 17:59:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B0C8F80266
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 17:58:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B0C8F80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=H/4EZrn1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676998735; x=1708534735;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GmFG1YKCb0Q/ommkmUjwup7T9MZg39/d3oY0mhMCpc0=;
  b=H/4EZrn1NbJJtkH+eWZwQdVfHPLSmJsdSIoLydOo4p6qW0uC7TFaolzJ
   BbTPm6+srxnylXvKdrynHO3igTvECTKnlXBr4ksTPJcJqTQeV42sKk+Fe
   5I0LE6ao1MOUDBIre/ghymxJt6X1QmGEMbuF81J0gZxITKSZxstPhhI3C
   mjvlm7keB+D4825xq32NpJfXsUZ4+cp8MkF9l9MI9TFUlANG47D1ds3U/
   4Ur5aXbWQb4eRqzrFNt5/sHPaD3XJIZa64P9zhlG86x6YA3z5DVbETPqV
   9FTk1zp9v0xL2XG1ssKnAquTFei4U+OQ0G31KeUjWcu8vsTP9uy70tuLf
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334884695"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000";
   d="scan'208";a="334884695"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 08:58:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="814569114"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000";
   d="scan'208";a="814569114"
Received: from taevough-mobl.amr.corp.intel.com (HELO [10.209.174.213])
 ([10.209.174.213])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 08:58:39 -0800
Message-ID: <72b601b9-93bf-b9f5-c898-c63ad46e5167@linux.intel.com>
Date: Tue, 21 Feb 2023 11:10:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V3 6/8] soundwire: amd: add runtime pm ops for AMD
 SoundWire manager driver
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
References: <20230220100418.76754-1-Vijendar.Mukunda@amd.com>
 <20230220100418.76754-7-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230220100418.76754-7-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PK2WX3NQVZ5KKT3XHDTTAUNP2TVDBB3V
X-Message-ID-Hash: PK2WX3NQVZ5KKT3XHDTTAUNP2TVDBB3V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PK2WX3NQVZ5KKT3XHDTTAUNP2TVDBB3V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +static int amd_deinit_sdw_manager(struct amd_sdw_manager *amd_manager)
> +{
> +	int ret;
> +
> +	amd_disable_sdw_interrupts(amd_manager);
> +	ret = amd_disable_sdw_manager(amd_manager);
> +	return ret;

return amd_disable_sdw_manager(amd_manager); ?

> +}

> +static int amd_sdw_clock_stop(struct amd_sdw_manager *amd_manager)
> +{
> +	u32 val;
> +	u32 retry_count = 0;
> +	int ret;
> +
> +	ret = sdw_bus_prep_clk_stop(&amd_manager->bus);
> +	if (ret < 0 && ret != -ENODATA) {
> +		dev_err(amd_manager->dev, "prepare clock stop failed %d", ret);
> +		return 0;
> +	}
> +	ret = sdw_bus_clk_stop(&amd_manager->bus);
> +	if (ret < 0 && ret != -ENODATA) {
> +		dev_err(amd_manager->dev, "bus clock stop failed %d", ret);
> +		return 0;
> +	}
> +
> +	do {
> +		val = acp_reg_readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);

don't you need a minimal usleep_range to avoid re-reading the same
register over and over?

This is tied to the frame duration, isn't it? this is 20us typically.

> +		if (val & AMD_SDW_CLK_STOP_DONE) {
> +			amd_manager->clk_stopped = true;
> +			break;
> +		}
> +	} while (retry_count++ < AMD_SDW_CLK_STOP_MAX_RETRY_COUNT);
> +
> +	if (!amd_manager->clk_stopped) {
> +		dev_err(amd_manager->dev, "SDW%x clock stop failed\n", amd_manager->instance);
> +		return 0;
> +	}
> +
> +	if (amd_manager->wake_en_mask)
> +		acp_reg_writel(0x01, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
> +
> +	dev_dbg(amd_manager->dev, "SDW%x clock stop successful\n", amd_manager->instance);
> +	return 0;
> +}
> +
> +static int amd_sdw_clock_stop_exit(struct amd_sdw_manager *amd_manager)
> +{
> +	int ret;
> +	u32 val;
> +	u32 retry_count = 0;
> +
> +	if (amd_manager->clk_stopped) {
> +		val = acp_reg_readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
> +		val |= AMD_SDW_CLK_RESUME_REQ;
> +		acp_reg_writel(val, amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
> +		do {
> +			val = acp_reg_readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
> +			if (val & AMD_SDW_CLK_RESUME_DONE)
> +				break;
> +			usleep_range(10, 100);

that's 10x range for sleep, that sounds a vague and suspicious, no?

> +		} while (retry_count++ < AMD_SDW_CLK_STOP_MAX_RETRY_COUNT);
> +		if (val & AMD_SDW_CLK_RESUME_DONE) {
> +			acp_reg_writel(0, amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
> +			ret = sdw_bus_exit_clk_stop(&amd_manager->bus);
> +			if (ret < 0)
> +				dev_err(amd_manager->dev, "bus failed to exit clock stop %d\n",
> +					ret);
> +			amd_manager->clk_stopped = false;
> +		}
> +	}
> +	if (amd_manager->clk_stopped) {
> +		dev_err(amd_manager->dev, "SDW%x clock stop exit failed\n", amd_manager->instance);
> +		return 0;
> +	}
> +	dev_dbg(amd_manager->dev, "SDW%x clock stop exit successful\n", amd_manager->instance);
> +	return 0;

