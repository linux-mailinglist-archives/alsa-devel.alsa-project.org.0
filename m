Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D798F102C66
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 20:14:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58D59169A;
	Tue, 19 Nov 2019 20:13:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58D59169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574190864;
	bh=UmNdzZ0AfRTPk7LNAb1K0u/xsj8VAMDuvr3gtHarGRo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jVOYEERI66WOTdjBnp3ew3FuvMunfZsbdXqzlIJk5g+5fzlTZAzlmbKmgv7C8Ct8h
	 b4U/wpy38TmeUYyaSsDl5KU9++HmQuQkOY6H8ng2tuwbLvvVejiXUsKWH1bMnfJPPq
	 Xi8/MDecKlYhZjHrArVChXquzpdBsThXt9fu2TN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A059F80145;
	Tue, 19 Nov 2019 20:12:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A33ADF80138; Tue, 19 Nov 2019 20:12:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CE14F800F4
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 20:12:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CE14F800F4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Nov 2019 11:12:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,219,1571727600"; d="scan'208";a="200458874"
Received: from pbossart-mobl3.an.intel.com (HELO [10.122.138.49])
 ([10.122.138.49])
 by orsmga008.jf.intel.com with ESMTP; 19 Nov 2019 11:12:31 -0800
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20191119174933.25526-1-perex@perex.cz>
 <20191119174933.25526-2-perex@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <72dfc285-70e8-706d-3018-535bda1e8630@linux.intel.com>
Date: Tue, 19 Nov 2019 13:12:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191119174933.25526-2-perex@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: Intel - use control components
 to describe card config
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



On 11/19/19 11:49 AM, Jaroslav Kysela wrote:
> Use the control interface (field 'components' in the info structure)
> to pass the I/O configuration details. The long card name might
> be used in GUI. This information should be hidden.
> 
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Mark Brown <broonie@kernel.org>
> ---
>   sound/soc/intel/Kconfig                |  9 +++++++++
>   sound/soc/intel/boards/bytcht_es8316.c | 16 ++++++++++++----
>   sound/soc/intel/boards/bytcr_rt5640.c  | 14 +++++++++++---
>   sound/soc/intel/boards/bytcr_rt5651.c  | 26 ++++++++++++++++----------
>   4 files changed, 48 insertions(+), 17 deletions(-)
> 
> diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
> index c8de0bb5bed9..3421957adedb 100644
> --- a/sound/soc/intel/Kconfig
> +++ b/sound/soc/intel/Kconfig
> @@ -47,6 +47,15 @@ config SND_SOC_INTEL_SST_FIRMWARE
>   	# Haswell/Broadwell/Baytrail legacy and will be set
>   	# when these platforms are enabled
>   
> +config SND_SOC_INTEL_USE_CTL_COMPONENTS
> +	bool "Use CTL components for I/O configuration"
> +	help
> +	  Some drivers might pass the I/O configuration through the
> +	  soundcard's driver name in the control user space API.
> +	  The new scheme is to put this information to the components
> +	  field in the ALSA's card info structure. Say Y, if you
> +	  have ALSA user space version 1.2.2+.
> +

If this is at the board level, then maybe move this to 
sound/soc/intel/boards/Kconfig

I am not sure about the alsa-lib dependency, it's a bit odd, isn't it?
shouldn't this be handled via protocol versions? or a configuration 
provided by alsa-lib somehow?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
