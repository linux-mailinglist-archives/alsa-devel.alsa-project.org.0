Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 007D57DB57B
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Oct 2023 09:52:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44EE3950;
	Mon, 30 Oct 2023 09:51:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44EE3950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698655945;
	bh=8Svl2OIef/iELg/Wu3PXi8qtvE9agVW+eXmQX0CeRqo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qbj9Aj4nlrxyM8gWg3Nff3Txcbooyv0EfpT9itq9k8SCIampIjt5tBiOAIcoYiToj
	 4jFiLJezr31j7vkxW34PL/l35F2wQ3ngl6p/4EhKkOH7y1Io5byJoDB/RyfTHLlzAg
	 oshE4Y3JLNVH5SUr1tY1SkiyDWgkgqyZei6iOlrA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB243F80290; Mon, 30 Oct 2023 09:51:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A61DF80166;
	Mon, 30 Oct 2023 09:51:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BB01F8016D; Mon, 30 Oct 2023 09:48:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55156F8014B
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 09:48:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55156F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HzqpBsB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698655727; x=1730191727;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8Svl2OIef/iELg/Wu3PXi8qtvE9agVW+eXmQX0CeRqo=;
  b=HzqpBsB4LGmDZokpnlZFuaXUQEztrLRqSEK8HWT72NKoVdrJj/tlU6n8
   UqFtczv6WHt3roWOpRq7cQjNNs26KRO1FO5fnjUHrEIrh7ell+DR1koBr
   uAPgQt9RDTfkbfQb5xh9gnKXdMGAf2JxSQsmrEo0Ic+r8RJjp/26odNp+
   fAEx9OuluKgs4OjatW65R1Q9CVeSIAwkOndnFx/WMLWquFWsMddaRUQk/
   L+7E4/2o2dZg5aUyznmDI5FXuVS2cUgW3rZs1hUYYXXwHvUtHQkYUIKpd
   K1KJVzz6pVbB9B2D0DaEw0hqE2N73MH5obEsK0U2WGLQKb8HUzxSo+MX1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="900605"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200";
   d="scan'208";a="900605"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 01:48:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="850848905"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200";
   d="scan'208";a="850848905"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.91])
 ([10.94.0.91])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 01:48:37 -0700
Message-ID: <95e0e4a0-edff-43f6-a58b-f2324b730a99@linux.intel.com>
Date: Mon, 30 Oct 2023 09:48:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: intel-dsp-cfg: Use AVS driver on SKL/KBL/APL
 Chromebooks
Content-Language: en-US
To: Brady Norander <bradynorander@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
References: <ZTz9orCylVwn3Pye@arch>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <ZTz9orCylVwn3Pye@arch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NGDJGHEESMR25NTRVCKULZEN7TT5TGOR
X-Message-ID-Hash: NGDJGHEESMR25NTRVCKULZEN7TT5TGOR
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NGDJGHEESMR25NTRVCKULZEN7TT5TGOR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/28/2023 2:25 PM, Brady Norander wrote:
> The legacy SKL driver no longer works properly on these Chromebook
> platforms. Use the new AVS driver by default instead.
> 
> Signed-off-by: Brady Norander <bradynorander@gmail.com>
> ---
>   sound/hda/intel-dsp-config.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
> index 756fa0aa69bb..1045be1fd441 100644
> --- a/sound/hda/intel-dsp-config.c
> +++ b/sound/hda/intel-dsp-config.c
> @@ -16,10 +16,11 @@
>   static int dsp_driver;
>   
>   module_param(dsp_driver, int, 0444);
> -MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=legacy, 2=SST, 3=SOF)");
> +MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=legacy, 2=SST, 3=SOF, 4=AVS)");
>   
>   #define FLAG_SST			BIT(0)
>   #define FLAG_SOF			BIT(1)
> +#define FLAG_AVS			BIT(2)
>   #define FLAG_SST_ONLY_IF_DMIC		BIT(15)
>   #define FLAG_SOF_ONLY_IF_DMIC		BIT(16)
>   #define FLAG_SOF_ONLY_IF_SOUNDWIRE	BIT(17)
> @@ -56,7 +57,7 @@ static const struct config_entry config_table[] = {
>   /*
>    * Apollolake (Broxton-P)
>    * the legacy HDAudio driver is used except on Up Squared (SOF) and
> - * Chromebooks (SST), as well as devices based on the ES8336 codec
> + * Chromebooks (AVS), as well as devices based on the ES8336 codec
>    */
>   #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
>   	{
> @@ -81,7 +82,7 @@ static const struct config_entry config_table[] = {
>   #endif
>   #if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
>   	{
> -		.flags = FLAG_SST,
> +		.flags = FLAG_AVS,
>   		.device = PCI_DEVICE_ID_INTEL_HDA_APL,
>   		.dmi_table = (const struct dmi_system_id []) {
>   			{
> @@ -96,13 +97,13 @@ static const struct config_entry config_table[] = {
>   #endif
>   /*
>    * Skylake and Kabylake use legacy HDAudio driver except for Google
> - * Chromebooks (SST)
> + * Chromebooks (AVS)
>    */
>   
>   /* Sunrise Point-LP */
>   #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKL)
>   	{
> -		.flags = FLAG_SST,
> +		.flags = FLAG_AVS,
>   		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
>   		.dmi_table = (const struct dmi_system_id []) {
>   			{
> @@ -122,7 +123,7 @@ static const struct config_entry config_table[] = {
>   /* Kabylake-LP */
>   #if IS_ENABLED(CONFIG_SND_SOC_INTEL_KBL)
>   	{
> -		.flags = FLAG_SST,
> +		.flags = FLAG_AVS,
>   		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
>   		.dmi_table = (const struct dmi_system_id []) {
>   			{
> @@ -667,6 +668,9 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
>   		}
>   	}
>   
> +	if (cfg->flags & FLAG_AVS)
> +		return SND_INTEL_DSP_DRIVER_AVS;
> +
>   	return SND_INTEL_DSP_DRIVER_LEGACY;
>   }
>   EXPORT_SYMBOL_GPL(snd_intel_dsp_driver_probe);

+ Cezary
