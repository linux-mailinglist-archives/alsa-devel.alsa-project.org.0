Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C44E269E561
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 18:01:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F1DAE79;
	Tue, 21 Feb 2023 18:00:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F1DAE79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676998866;
	bh=6moRbn9LHrkq8wHU5QRl+XdeMGFzTjj1yLlLgdMDgOQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DaMwEnO9aN5b781BdIhrANxs10Vf/K1pdOBwQ9rVGkgDYQbiJjzMdkq1CbbrLhtmv
	 j5S3lIRWE+ksv00CVF0+xPYB7nTQyG2N9Wb0MXxpwggJi70JQndbbtzCjtYerjbRBa
	 5u1flZSDGn6PMf0x+35Gz8c7Og9JcUnbBpYfRgdI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78349F8053B;
	Tue, 21 Feb 2023 17:59:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 173E8F804FC; Tue, 21 Feb 2023 17:59:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78A78F8047C
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 17:58:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78A78F8047C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NfYB6zbn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676998736; x=1708534736;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6moRbn9LHrkq8wHU5QRl+XdeMGFzTjj1yLlLgdMDgOQ=;
  b=NfYB6zbnpLqhFRJTVDcu+4J8K4JQQ99QyzCrvCcCLeazw8S/jusnR8jl
   a5tkImuKR3+2v5Giy/jINcQKX/PGvl7yhddaoQGefPSCy4wZ/0oyYhcuI
   OlJv8QKhZfSnNcSRaoajpAp2e1XwvQJrMkGjtGE9z9pQNmdK7yBj7lOHO
   eEYOX59AdEGv1PniLoP84PU3iLSxM97MQxhbnGjFQr8AUinwfSTX+YYhA
   FLFP5kK+574JWneqJ1jWnrPLGzJ/56YJm2LTLH7fclUdryieXwoA5uJF/
   HDRCCQZkMBF+mz2JFlXpR4Ox9xtJjOTyXchNpv4tnoTegZX9gJfs2aopV
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334884707"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000";
   d="scan'208";a="334884707"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 08:58:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="814569123"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000";
   d="scan'208";a="814569123"
Received: from taevough-mobl.amr.corp.intel.com (HELO [10.209.174.213])
 ([10.209.174.213])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 08:58:41 -0800
Message-ID: <8a002459-37aa-47c2-4e7d-50adac6015f6@linux.intel.com>
Date: Tue, 21 Feb 2023 11:13:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V3 7/8] soundwire: amd: handle SoundWire wake enable
 interrupt
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
References: <20230220100418.76754-1-Vijendar.Mukunda@amd.com>
 <20230220100418.76754-8-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230220100418.76754-8-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XHJPF263J5RVQBAGTAWNFX5YEDSLRB52
X-Message-ID-Hash: XHJPF263J5RVQBAGTAWNFX5YEDSLRB52
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XHJPF263J5RVQBAGTAWNFX5YEDSLRB52/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/20/23 05:04, Vijendar Mukunda wrote:
> Add wake enable interrupt support for both the SoundWire manager
> instances.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Signed-off-by: Mastan Katragadda <Mastan.Katragadda@amd.com>
> ---
>  drivers/soundwire/amd_manager.c | 10 ++++++++++
>  drivers/soundwire/amd_manager.h |  1 +
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index 3322adeca0d8..a7182aa78652 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -932,6 +932,13 @@ static void amd_sdw_update_slave_status(u32 status_change_0to7, u32 status_chang
>  	}
>  }
>  
> +static void amd_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
> +{
> +	pm_request_resume(amd_manager->dev);

is this needed?

In the Intel case, the wakes do not necessarily come as in-band wakes,
but they can also be notified by the PCI subsystem, so we do have to use
pm_request_resume.

In the AMD case, what happens if you don't do this? Doesn't the
interrupt trigger a pm_runtime_resume already?

> +	acp_reg_writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
> +	acp_reg_writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
> +}
\
