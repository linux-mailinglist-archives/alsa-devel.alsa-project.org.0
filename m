Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AAC12F2EA
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 03:25:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50D2416E9;
	Fri,  3 Jan 2020 03:25:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50D2416E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578018351;
	bh=rT3HrVB62rMa0SwxF8LASCtrX4ubI3DYD+8dDh9K9a4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=erNwMbzFrBQq6z/pH+sc7icq+5DaSO/A/t5KPPnn/tlhWSNuu0G0DWAomOL2p8AnY
	 /yTop7CTE/PjRMCYaQX2JitsjoewJ0298zsMXHKPOgGXULiSC2nVNz5btULwlt4fPC
	 3vBHDFVlWQ4GrPVUNlmn70OUmZhjTQwnulhUXn9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB040F80157;
	Fri,  3 Jan 2020 03:24:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB734F80157; Fri,  3 Jan 2020 03:24:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D257F8011F
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 03:24:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D257F8011F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jan 2020 18:23:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,389,1571727600"; d="scan'208";a="231982388"
Received: from lavazque-mobl.amr.corp.intel.com (HELO [10.255.86.75])
 ([10.255.86.75])
 by orsmga002.jf.intel.com with ESMTP; 02 Jan 2020 18:23:56 -0800
To: Sam McNally <sammc@chromium.org>, LKML <linux-kernel@vger.kernel.org>
References: <20200103124921.v3.1.Ib87c4a7fbb3fc818ea12198e291b87dc2d5bc8c2@changeid>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c7471ed8-a9ac-b261-b4b7-97198c92475e@linux.intel.com>
Date: Thu, 2 Jan 2020 20:23:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200103124921.v3.1.Ib87c4a7fbb3fc818ea12198e291b87dc2d5bc8c2@changeid>
Content-Language: en-US
Cc: Xun Zhang <xun2.zhang@intel.com>, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Sathya Prakash M R <sathya.prakash.m.r@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v3] ASoC: Intel: sof_rt5682: Ignore the
 speaker amp when there isn't one.
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



On 1/2/20 7:50 PM, Sam McNally wrote:
> Some members of the Google_Hatch family include a rt5682 jack codec, but
> no speaker amplifier. This uses the same driver (sof_rt5682) as a
> combination of rt5682 jack codec and max98357a speaker amplifier. Within
> the sof_rt5682 driver, these cases are not currently distinguishable,
> relying on a DMI quirk to decide the configuration. This causes an
> incorrect configuration when only the rt5682 is present on a
> Google_Hatch device.
> 
> For CML, the jack codec is used as the primary key when matching,
> with a possible speaker amplifier described in quirk_data. The two cases
> of interest are the second and third 10EC5682 entries in
> snd_soc_acpi_intel_cml_machines[]. The second entry matches the
> combination of rt5682 and max98357a, resulting in the quirk_data field
> in the snd_soc_acpi_mach being non-null, pointing at
> max98357a_spk_codecs, the snd_soc_acpi_codecs for the matched speaker
> amplifier. The third entry matches just the rt5682, resulting in a null
> quirk_data.
> 
> The sof_rt5682 driver's DMI data matching identifies that a speaker
> amplifier is present for all Google_Hatch family devices. Detect cases
> where there is no speaker amplifier by checking for a null quirk_data in
> the snd_soc_acpi_mach and remove the speaker amplifier bit in that case.
> 
> Signed-off-by: Sam McNally <sammc@chromium.org>

thanks, this is a great explanation

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


> ---
> 
> Changes in v3:
> - Rewrote commit message to refer to correct
>    snd_soc_acpi_intel_cml_machines[] entries and better describe the
>    change
> 
> Changes in v2:
> - Added details about the relevant ACPI matches to the description
> 
>   sound/soc/intel/boards/sof_rt5682.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index ad8a2b4bc709..8a13231dee15 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -603,6 +603,14 @@ static int sof_audio_probe(struct platform_device *pdev)
>   
>   	dmi_check_system(sof_rt5682_quirk_table);
>   
> +	mach = (&pdev->dev)->platform_data;
> +
> +	/* A speaker amp might not be present when the quirk claims one is.
> +	 * Detect this via whether the machine driver match includes quirk_data.
> +	 */
> +	if ((sof_rt5682_quirk & SOF_SPEAKER_AMP_PRESENT) && !mach->quirk_data)
> +		sof_rt5682_quirk &= ~SOF_SPEAKER_AMP_PRESENT;
> +
>   	if (soc_intel_is_byt() || soc_intel_is_cht()) {
>   		is_legacy_cpu = 1;
>   		dmic_be_num = 0;
> @@ -663,7 +671,6 @@ static int sof_audio_probe(struct platform_device *pdev)
>   	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
>   
>   	sof_audio_card_rt5682.dev = &pdev->dev;
> -	mach = (&pdev->dev)->platform_data;
>   
>   	/* set platform name for each dailink */
>   	ret = snd_soc_fixup_dai_links_platform_name(&sof_audio_card_rt5682,
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
