Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D068584A46B
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Feb 2024 20:54:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3A4982A;
	Mon,  5 Feb 2024 20:53:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3A4982A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707162848;
	bh=MKOiCSVybYFLlIPm81ntGadZ+pFtGxCUS8sJplhFQ4A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=frCpjZzuf+IuHW5w2ohBow7yMpft/5URn56fo4H7lPchYQcdSfZzBTzhzQfw6THOn
	 l7wL0w68goKTGPNDZxHpBQ3ugL0CykmD0lqNbsHU0DJxj6bCyvepXiYQLUdjaCjFoc
	 KuEIWYz5r8naMg6nNcjyh8j72q67fkD0WkKnsUck=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3C7CF805A0; Mon,  5 Feb 2024 20:53:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33C74F8016E;
	Mon,  5 Feb 2024 20:53:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A23ABF801EB; Mon,  5 Feb 2024 20:53:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A102F80153
	for <alsa-devel@alsa-project.org>; Mon,  5 Feb 2024 20:53:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A102F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jSV8P2t0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707162807; x=1738698807;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MKOiCSVybYFLlIPm81ntGadZ+pFtGxCUS8sJplhFQ4A=;
  b=jSV8P2t01lEB9xJd4m5G6e2iYcmNiwQY3jJ1C+Edb86rzwFOy0YV76Lh
   RGkybl0imutby6QYSr12QzwSNuENUEwt+Prn58fNZVUVuQ0G7cNW0MKd1
   gjBCPO/oAf2TN7dvvCc9hakkamcHlzhcrECCr9I0jbmlEDekX/JjXjW9M
   x/dws9DnlI+vy+RES5b4oYTdh0bur865eA2jje+xT6KH1LQ8RgssU06SU
   VLS+k++c8XhaWfdxiY1OjrO/OHzaO0mhTUn7VSDS31UbiDy8DGzaeA/sj
   2VOZEFU9VncsjiSyQ9v0yYv9dIaqHDrwvkg+5PJDnvDXa48iincKwP+v8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="4410909"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400";
   d="scan'208";a="4410909"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 11:53:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400";
   d="scan'208";a="799661"
Received: from ckuuniff-mobl.amr.corp.intel.com (HELO [10.212.98.15])
 ([10.212.98.15])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 11:53:21 -0800
Message-ID: <70c54f80-9fb1-4789-b371-eead597423f5@linux.intel.com>
Date: Mon, 5 Feb 2024 13:52:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] soundwire: intel_auxdevice: remove redundant
 assignment to variable link_flags
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240205182436.1843447-1-colin.i.king@gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240205182436.1843447-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EDYACAIIZKGN46WGP4W5M5HBE3NX46Q3
X-Message-ID-Hash: EDYACAIIZKGN46WGP4W5M5HBE3NX46Q3
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EDYACAIIZKGN46WGP4W5M5HBE3NX46Q3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thanks for the clean-up!

> The variable link_flags is being initialized with a value that is never
> read, it is being re-assigned later on. The initialization is
> redundant and can be removed.
> 
> Cleans up clang scan build warning:
> drivers/soundwire/intel_auxdevice.c:624:2: warning: Value stored
> to 'link_flags' is never read [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/soundwire/intel_auxdevice.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
> index 93698532deac..95125cc2fc59 100644
> --- a/drivers/soundwire/intel_auxdevice.c
> +++ b/drivers/soundwire/intel_auxdevice.c
> @@ -621,8 +621,6 @@ static int __maybe_unused intel_resume(struct device *dev)
>  		return 0;
>  	}
>  
> -	link_flags = md_flags >> (bus->link_id * 8);
> -

this redundant line is 3+ years old now, added in a2d9c161db24
("soundwire: intel: pm_runtime idle scheduling")

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

>  	if (pm_runtime_suspended(dev)) {
>  		dev_dbg(dev, "pm_runtime status was suspended, forcing active\n");
>  
