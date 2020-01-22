Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE59145ED0
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 23:53:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09F7E16A4;
	Wed, 22 Jan 2020 23:52:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09F7E16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579733585;
	bh=dPSGDSC9mT5BDeaM/FJsYAXfHiWbi904L8/Vd+dmN1w=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lE50FQ9j3ASDtBR/sNSJEEmZfdcWEhZzqPpoJvwKOj7mukpHRpZ24AQtTVQJyXGCC
	 TBjMfHlz9564RtXEFpdecLzGG8+sOieff12AeiiepLfNPwKqo5cyZhxnHyhy9EAfak
	 nGmGFIcksij2juYS/ESO8/llg/unikQUXZOp5R0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E4A6F80248;
	Wed, 22 Jan 2020 23:50:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FEFAF80245; Wed, 22 Jan 2020 23:50:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAC45F800E7
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 23:50:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAC45F800E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 14:50:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,351,1574150400"; d="scan'208";a="229541549"
Received: from jovercas-mobl1.amr.corp.intel.com (HELO [10.254.105.26])
 ([10.254.105.26])
 by orsmga006.jf.intel.com with ESMTP; 22 Jan 2020 14:50:25 -0800
To: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
References: <20200122181254.22801-1-cezary.rojewski@intel.com>
 <0c4a19c3-f1e3-7b76-be42-e4902645955b@linux.intel.com>
 <CAFQqKeVi8OBNc0ON+ogFBv07fYV25G3oK9Hsnydfg-sTwYZx5A@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b6809ad7-10dd-2afd-6d46-953d0e59c249@linux.intel.com>
Date: Wed, 22 Jan 2020 15:54:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFQqKeVi8OBNc0ON+ogFBv07fYV25G3oK9Hsnydfg-sTwYZx5A@mail.gmail.com>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, tiwai@suse.com,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: skl_hda_dsp_common: Fix
 global-out-of-bounds bug
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


>> Kai and Ranjani, do you think this impacts SOF as well? Or does our BE
>> override somehow suppresses the problem?
>>
> Hi Pierre/Cezary,
> 
> SOF does have the same problem too but I thought we're allowed to have dai
> links without platform component? An alternative to adding the platform
> component would be to do something like below.
> 
> Thanks,
> Ranjani
> diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c
> b/sound/soc/intel/boards/skl_hda_dsp_generic.c
> index 11eaee9ae41f..dacf8014b870 100644
> --- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
> +++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
> @@ -112,6 +112,7 @@ static char hda_soc_components[30];
> 
>   static int skl_hda_fill_card_info(struct snd_soc_acpi_mach_params
> *mach_params)
>   {
> +       struct snd_soc_dai_link_component *platform;
>          struct snd_soc_card *card = &hda_soc_card;
>          struct snd_soc_dai_link *dai_link;
>          u32 codec_count, codec_mask;
> @@ -148,7 +149,8 @@ static int skl_hda_fill_card_info(struct
> snd_soc_acpi_mach_params *mach_params)
>          card->num_dapm_routes = num_route;
> 
>          for_each_card_prelinks(card, i, dai_link)
> -               dai_link->platforms->name = mach_params->platform;
> +               for_each_link_platforms(dai_link, i, platform)
> +                       platform->name = mach_params->platform;

we already do this indirectly with:

skl_hda_add_dai_link(struct snd_soc_card *card, struct snd_soc_dai_link 
*link)
{
	link->platforms->name = ctx->platform_name; <<<

I suspect the issue is that the plaforms part is not allocated. The 
8-byte out of bounds is not a string, it looks like a pointer stored in 
the wrong location.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
