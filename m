Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1462F3BB1
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 22:04:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53FFF1685;
	Tue, 12 Jan 2021 22:03:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53FFF1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610485479;
	bh=gxKDCTc3DUx93qN2h8tjbxo280mrzQgbU7ADu5Y6x3w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GBqo6XbN1x0cAD13AG/y9M7H6pLpn1gEx67taRTkXHIh74m27BH6Tz1j0ITnuoJxN
	 eyfXMa79ocgKTPuTtdzD6sPMIK5qnBc72KwMtJidLMY/PdghUQJ/IfgYYz6kJDQMuF
	 q8XjeVkQ2UXev6e2n28+lPuvShIIeX8/1oQ0TZuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06226F804AA;
	Tue, 12 Jan 2021 22:03:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAAA6F8025E; Tue, 12 Jan 2021 22:03:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E52B8F80113;
 Tue, 12 Jan 2021 22:03:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E52B8F80113
IronPort-SDR: K4ZA+WSt0BzAbsZUWdEyrNjJHsHI/AajBJvDoj7DB/M+QSmZ5juZ1Bk1A7dKz1Xagauu10shQZ
 Pu5Pw7AAwPAA==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="165785806"
X-IronPort-AV: E=Sophos;i="5.79,342,1602572400"; d="scan'208";a="165785806"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 13:03:09 -0800
IronPort-SDR: Hr2wj0qb4AnX3SeG5E+v960eRrN756QMpKgqbMmhAAfcIxmN+IgJOyx/zqEK9E8xFSDQNnJrMR
 jr6BgHo3XJfA==
X-IronPort-AV: E=Sophos;i="5.79,342,1602572400"; d="scan'208";a="404604912"
Received: from clinton1-mobl1.amr.corp.intel.com (HELO [10.212.214.129])
 ([10.212.214.129])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 13:03:06 -0800
Subject: Re: [PATCH 2/2] ASoC: intel: fix soundwire dependencies
To: Arnd Bergmann <arnd@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>
References: <20210112203250.2576775-1-arnd@kernel.org>
 <20210112203250.2576775-2-arnd@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cde511d6-fa14-0cab-f00c-f75ad2d8281c@linux.intel.com>
Date: Tue, 12 Jan 2021 15:03:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112203250.2576775-2-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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



On 1/12/21 2:32 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The Kconfig logic around SND_SOC_SOF_INTEL_SOUNDWIRE tries to
> ensure that all sound modules can be built with the minimal
> dependencies, but this fails in some configurations:
> 
> x86_64-linux-ld: sound/hda/intel-dsp-config.o: in function `snd_intel_dsp_driver_probe':
> intel-dsp-config.c:(.text+0x134): undefined reference to `sdw_intel_acpi_scan'
> 
> Specifically, this happens if the dsp-config driver is built-in but does
> not need to use soundwire, while CONFIG_SOUNDWIRE_INTEL is enabled as
> a loadable module.
> 
> An easier and more correct way to do this is to remove
> CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE_LINK and instead have
> the two drivers that can link against SOUNDWIRE_INTEL,
> i.e. DSP_CONFIG and SND_SOC_SOF_HDA, select that driver whenever
> SND_SOC_SOF_INTEL_SOUNDWIRE_LINK is set.
> 
> This however means that SND_SOC_SOF_INTEL_SOUNDWIRE cannot be selected
> by users when SOUNDWIRE is only usable by loadable modules and one or
> more drivers using SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE is built-in.

The problem is real, but the proposal isn't completely right, there is 
absolutely no logical link or functional dependency between 
INTEL_DSP_CONFIG and SOUNDWIRE.

We have a similar case with HDaudio, the two buses can be selected as 
tristates, but the SOF configuration needs to match.

In both cases, either we add a 'depends' and users need to make sure the 
configurations match on the two sides. Or we use select but one of the 
selections will be overridden and becomes meaningless.

Arnd, do you mind if I give it a try on my side?

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   sound/hda/Kconfig           |  1 +
>   sound/soc/sof/intel/Kconfig | 16 ++++++----------
>   2 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/hda/Kconfig b/sound/hda/Kconfig
> index 3bc9224d5e4f..ecab814d7698 100644
> --- a/sound/hda/Kconfig
> +++ b/sound/hda/Kconfig
> @@ -44,5 +44,6 @@ config SND_INTEL_NHLT
>   config SND_INTEL_DSP_CONFIG
>   	tristate
>   	select SND_INTEL_NHLT if ACPI
> +	select SOUNDWIRE_INTEL if SND_SOC_SOF_INTEL_SOUNDWIRE
>   	# this config should be selected only for Intel DSP platforms.
>   	# A fallback is provided so that the code compiles in all cases.
> diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
> index 67365ce0d86d..df8f9760870e 100644
> --- a/sound/soc/sof/intel/Kconfig
> +++ b/sound/soc/sof/intel/Kconfig
> @@ -330,13 +330,17 @@ config SND_SOC_SOF_HDA
>   	tristate
>   	select SND_HDA_EXT_CORE if SND_SOC_SOF_HDA_LINK
>   	select SND_SOC_HDAC_HDA if SND_SOC_SOF_HDA_AUDIO_CODEC
> +	select SOUNDWIRE_INTEL if SND_SOC_SOF_INTEL_SOUNDWIRE
>   	help
>   	  This option is not user-selectable but automagically handled by
>   	  'select' statements at a higher level.
>   
> -config SND_SOC_SOF_INTEL_SOUNDWIRE_LINK
> +config SND_SOC_SOF_INTEL_SOUNDWIRE
>   	bool "SOF support for SoundWire"
> -	depends on SOUNDWIRE && ACPI
> +	depends on SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
> +	depends on SOUNDWIRE
> +	depends on ACPI
> +	depends on !(SOUNDWIRE=m && SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE=y)
>   	help
>   	  This adds support for SoundWire with Sound Open Firmware
>   	  for Intel(R) platforms.
> @@ -345,14 +349,6 @@ config SND_SOC_SOF_INTEL_SOUNDWIRE_LINK
>   
>   config SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
>   	tristate
> -	select SND_SOC_SOF_INTEL_SOUNDWIRE if SND_SOC_SOF_INTEL_SOUNDWIRE_LINK
> -	help
> -	  This option is not user-selectable but automagically handled by
> -	  'select' statements at a higher level.
> -
> -config SND_SOC_SOF_INTEL_SOUNDWIRE
> -	tristate
> -	select SOUNDWIRE_INTEL
>   	help
>   	  This option is not user-selectable but automagically handled by
>   	  'select' statements at a higher level.
> 
