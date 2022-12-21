Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4173B6534B0
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 18:12:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D02CC16DC;
	Wed, 21 Dec 2022 18:11:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D02CC16DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671642724;
	bh=Wka9nixoQhSQpZMewUy1mTEp3oCjGne3Bir7NjGErYw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XU0OBTz0mBavEC3nYjIn5ijCzRJO2ml+Bz4l2KcS+HA6hYvBFw6izlhFFqOaz3yho
	 CP3AkyZpwJSWBdCk4zSjM1+CjcdX9x/41tlNJacfZQa6ofOX61dErZ1yj0BThjvIEp
	 4+GWzaitDQZfPkqGkuxxmrEayPzZkElmBCduhRWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBCEDF80519;
	Wed, 21 Dec 2022 18:10:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02786F804CB; Wed, 21 Dec 2022 18:10:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1391DF804B0
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 18:10:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1391DF804B0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Uw40SGWc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671642643; x=1703178643;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Wka9nixoQhSQpZMewUy1mTEp3oCjGne3Bir7NjGErYw=;
 b=Uw40SGWcTsNiRlXmmYAY/WX+QHZBRkzASC45yrUUTObBfXTM8xo/A2bL
 BOhvBmEVPce6qKbQyC8+sakTCgtUUi0+cJZA3TSAgahaRS7zfql4vTJwf
 1K4ODQCK4XknTxScsBf0D6LE12A3JcZJ6beVGREdfpPjM3U+BkTg9UvEJ
 DrZan6eVcg3+/BXrfiA5fKPEde61llyisSsSpZR2E3Pnt7bFMjpLcyvfX
 1diD3peBnnpRsasegpgZlr6YAadGvvAe08PMCX8Q4JprNz7C6/cQQF87x
 NGPS+8CkAFHATf9Awn8XccmWugPa40QkOqdXsZ3apxrEObNGZcdlxWV/0 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="317562113"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="317562113"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 09:08:41 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="720009149"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="720009149"
Received: from sgeiser-mobl.amr.corp.intel.com (HELO [10.212.42.29])
 ([10.212.42.29])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 09:08:39 -0800
Message-ID: <3917a0cf-20bb-2e7f-60a8-d7ec0069d8fa@linux.intel.com>
Date: Wed, 21 Dec 2022 09:42:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH] ASoC: Intel: fix sof-nau8825 link failure
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20221221132559.2402341-1-arnd@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221221132559.2402341-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 "balamurugan.c" <balamurugan.c@intel.com>, Mac Chiang <mac.chiang@intel.com>,
 Mark Brown <broonie@kernel.org>, David Lin <CTLIN0@nuvoton.com>,
 Gongjun Song <gongjun.song@intel.com>, Brent Lu <brent.lu@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 12/21/22 07:25, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The snd-soc-sof_nau8825.ko module fails to link unless the
> sof_realtek_common support is also enabled:
> 
> ERROR: modpost: "sof_rt1015p_codec_conf" [sound/soc/intel/boards/snd-soc-sof_nau8825.ko] undefined!
> ERROR: modpost: "sof_rt1015p_dai_link" [sound/soc/intel/boards/snd-soc-sof_nau8825.ko] undefined!
> 
> Fixes: 8d0872f6239f ("ASoC: Intel: add sof-nau8825 machine driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks!

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/boards/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
> index a472de1909f4..9aee729c2406 100644
> --- a/sound/soc/intel/boards/Kconfig
> +++ b/sound/soc/intel/boards/Kconfig
> @@ -558,6 +558,7 @@ config SND_SOC_INTEL_SOF_NAU8825_MACH
>  	select SND_SOC_HDAC_HDMI
>  	select SND_SOC_INTEL_HDA_DSP_COMMON
>  	select SND_SOC_INTEL_SOF_MAXIM_COMMON
> +	select SND_SOC_INTEL_SOF_REALTEK_COMMON
>  	help
>  	   This adds support for ASoC machine driver for SOF platforms
>  	   with nau8825 codec.
