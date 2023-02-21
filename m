Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 558D369E56B
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 18:01:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52EAEE83;
	Tue, 21 Feb 2023 18:01:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52EAEE83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676998918;
	bh=gmzudqXzLy9dZ3wVXmkCuKkUz/V1bw/53RLmgSciXh4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=mlacCtULf6DDeNoQoki5to/+WrKhPWZaB9KnA684BdwzXcUsq9mth4+tfqrSxUWZC
	 kJML4t3Ky/Cy5r3u2Am4gcR76gSwM3jMXRh7VrNsl6NcM6qmF+VPPLTR3ZjdJ02Rtv
	 f8yuPQ2fJupjFLDnMgRPp1PgcESoCBhe1j+oWZSI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCA5FF8055B;
	Tue, 21 Feb 2023 17:59:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D84CAF80533; Tue, 21 Feb 2023 17:59:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF057F804B2
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 17:58:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF057F804B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JGlUfESm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676998738; x=1708534738;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=gmzudqXzLy9dZ3wVXmkCuKkUz/V1bw/53RLmgSciXh4=;
  b=JGlUfESm7nxn1WgZF+7g4JS2V5Ric9i2icV77vZtSrZniTDdvzlDhHTe
   GVdESiopD/D5JksE6E7hPkrHV35yzINGPTifz0zEhEk90hc6s6HMSXRQZ
   MDyiOnZTNJJHQJhnVbq1Vght8uvwMRc80vDHVjPdiwijQm8gudGFOX4AO
   C8HbTGz9nYYNOr/NqV8cv937xwZOr5S+5DZYtSqGff0tZwi6F6iGWifHY
   MJGzDhZiX8EiNAjqyE1KMzLXrVjY7qR/lhhOAASn3+KVSlXfVcbrgJL6P
   LL4F8dqKUosQBrz7eYeAAthuEu4KL50WtZkUr00OzXS5Ls9EC+W2gbCk1
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334884713"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000";
   d="scan'208";a="334884713"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 08:58:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="814569125"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000";
   d="scan'208";a="814569125"
Received: from taevough-mobl.amr.corp.intel.com (HELO [10.209.174.213])
 ([10.209.174.213])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 08:58:43 -0800
Message-ID: <7d32d552-6ca0-3c40-11ce-c8d727cadc05@linux.intel.com>
Date: Tue, 21 Feb 2023 11:24:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V3 8/8] soundwire: amd: add pm_prepare callback and pm ops
 support
Content-Language: en-US
To: alsa-devel@alsa-project.org
References: <20230220100418.76754-1-Vijendar.Mukunda@amd.com>
 <20230220100418.76754-9-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230220100418.76754-9-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YMBYWP66J3DXHECK7SHSHY2YTUY27XCY
X-Message-ID-Hash: YMBYWP66J3DXHECK7SHSHY2YTUY27XCY
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YMBYWP66J3DXHECK7SHSHY2YTUY27XCY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +static int amd_resume_child_device(struct device *dev, void *data)
> +{
> +	int ret;
> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);

style: invert two lines?

> +
> +	if (!slave->probed) {
> +		dev_dbg(dev, "skipping device, no probed driver\n");
> +		return 0;
> +	}
> +	if (!slave->dev_num_sticky) {
> +		dev_dbg(dev, "skipping device, never detected on bus\n");
> +		return 0;
> +	}
> +	if (!pm_runtime_suspended(dev))
> +		return 0;
> +	ret = pm_request_resume(dev);

why not resume unconditionally and let the pm_runtime framework figure
things out?

That's what we did for Intel...

> +	if (ret < 0)
> +		dev_err(dev, "pm_request_resume failed: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused amd_pm_prepare(struct device *dev)
> +{
> +	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
> +	struct sdw_bus *bus = &amd_manager->bus;
> +	int ret;
> +
> +	if (bus->prop.hw_disabled) {
> +		dev_dbg(bus->dev, "SoundWire manager %d is disabled, ignoring\n",
> +			bus->link_id);
> +		return 0;
> +	}
> +	/*
> +	 * When multiple peripheral devices connected over the same link, if SoundWire manager
> +	 * device is not in runtime suspend state, observed that device alerts are missing
> +	 * without pm_prepare on AMD platforms in clockstop mode0.
> +	 */
> +	if (pm_runtime_suspended(dev) && amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
> +		ret = pm_request_resume(dev);

same, why not simplify and use:

if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
    ret = pm_request_resume(dev);

> +		if (ret < 0) {
> +			dev_err(bus->dev, "pm_request_resume failed: %d\n", ret);
> +			return 0;
> +		}
> +	}
> +	/* To force peripheral devices to system level suspend state, resume the devices
> +	 * from runtime suspend state first. Without that unable to dispatch the alert
> +	 * status to peripheral driver during system level resume as they are in runtime
> +	 * suspend state.
> +	 */
> +	ret = device_for_each_child(bus->dev, NULL, amd_resume_child_device);
> +	if (ret < 0)
> +		dev_err(dev, "amd_resume_child_device failed: %d\n", ret);
> +	return 0;
> +}
> +
> +static int __maybe_unused amd_suspend(struct device *dev)
> +{
> +	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
> +	struct sdw_bus *bus = &amd_manager->bus;
> +	int ret;
> +
> +	if (bus->prop.hw_disabled) {
> +		dev_dbg(bus->dev, "SoundWire manager %d is disabled, ignoring\n",
> +			bus->link_id);
> +		return 0;
> +	}
> +
> +	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
> +		ret = amd_sdw_clock_stop(amd_manager);
> +		if (ret)
> +			return ret;

you could do a return amd_sdw_clock_stop(amd_manager);

> +	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
> +		/*
> +		 * As per hardware programming sequence on AMD platforms,
> +		 * clock stop should be invoked first before powering-off
> +		 */
> +		ret = amd_sdw_clock_stop(amd_manager);
> +		if (ret)
> +			return ret;
> +		ret = amd_deinit_sdw_manager(amd_manager);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
