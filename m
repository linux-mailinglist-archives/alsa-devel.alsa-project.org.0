Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DAB6AE5F8
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 17:08:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6BA814BD;
	Tue,  7 Mar 2023 17:07:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6BA814BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678205318;
	bh=QbkMlLN5gG1O1qHIBvT5vPDkGfTtH0GRhPyAlrPglYA=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m8XP/Kv4LWwlh/1eysuBf3ybaZ43LYUBeEeHHtJLVZZ0oCXqKukf2K8U5AC+/INEo
	 kT8hCD8pZ24dSUqr8tYXsWRvvgQ4lV2wKRYeqFCpCl6Z0FT8YAWMRhmi+YPZHnvAPz
	 h4J4KoWjhnzBytZy81W1aWS1KMHOQd7SDZDN21l4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0D99F804B1;
	Tue,  7 Mar 2023 17:07:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8EAAF8051B; Tue,  7 Mar 2023 17:07:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CFA0F8042F
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 17:07:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CFA0F8042F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iFcIWpLW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678205252; x=1709741252;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QbkMlLN5gG1O1qHIBvT5vPDkGfTtH0GRhPyAlrPglYA=;
  b=iFcIWpLWnFCgCMTGJqFGdxZVTkKU8Le0ItcS3fZKNHRojbALaAdzh5Cr
   n5idPVLDHVgpyL4p5E1EmxCmmNZBs6xMTfPot5lAM0L+ciwbjODMv+gyM
   FtArlfPgoc3hNB6D8/2vHg6mfuYosKKGvuFA+7V6HkrEkPcB8Gs+qHpvS
   9woTlVCCBA9g5xD6CFjbEeJswNX2spv6Ucu2UE38XlqF4y5sbb42Kr9/D
   G2fO+TBvqlFyhmQ+GbRJ57jqEgId+PQ25v3wwdjiJ52fE4j8Ncp45RTQe
   panUmydd5UjOdep7iCrDGm5edSGkZdjL2VFdL3y7HUYGLbbsBsyLe28vS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="334603077"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="334603077"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 08:06:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="786744585"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="786744585"
Received: from mcdoll-mobl.amr.corp.intel.com (HELO [10.255.36.231])
 ([10.255.36.231])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 08:06:19 -0800
Message-ID: <4330af6a-ce97-53ed-f675-6d3d0ac8f32f@linux.intel.com>
Date: Tue, 7 Mar 2023 09:28:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V6 8/8] soundwire: amd: add pm_prepare callback and pm ops
 support
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
References: <20230307133135.545952-1-Vijendar.Mukunda@amd.com>
 <20230307133135.545952-9-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230307133135.545952-9-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SOEDS5U2JMYR33GK5K5D33S4Z4EHFYSR
X-Message-ID-Hash: SOEDS5U2JMYR33GK5K5D33S4Z4EHFYSR
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
 Arungopal.kondaveeti@amd.com, claudiu.beznea@microchip.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SOEDS5U2JMYR33GK5K5D33S4Z4EHFYSR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +static int amd_resume_child_device(struct device *dev, void *data)
> +{
> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	int ret;
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

I still don't get why the test above was needed. It's racy and brings
limited benefits.

> +	if (ret < 0)
> +		dev_err(dev, "pm_request_resume failed: %d\n", ret);
> +
> +	return ret;
> +}

