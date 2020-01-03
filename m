Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 691ED12F253
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 01:43:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC6631673;
	Fri,  3 Jan 2020 01:42:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC6631673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578012221;
	bh=1+ZjUf+KbFQyw/7rW379PdMb9UhSem150v80+4YX1fk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JpNimVb7Ukzqvgyz0ws++vKInfF1OK8ah03C9GDMgrT8u9Y6VWZFjnKCLndFg/BBj
	 emq8ak1rqgGR5rbARhXSbXFwoayJoPJiqNtsmqrvCc8Cg44ApchY9I6zcWUFxAc1qK
	 MGF4RKc0iYr2Lt8BwF4HwY71fkUxIAdO1gmnkmh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04348F80158;
	Fri,  3 Jan 2020 01:42:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C59E5F80157; Fri,  3 Jan 2020 01:41:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B60CCF8011E
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 01:41:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B60CCF8011E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jan 2020 16:41:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,388,1571727600"; d="scan'208";a="231960405"
Received: from lavazque-mobl.amr.corp.intel.com (HELO [10.255.86.75])
 ([10.255.86.75])
 by orsmga002.jf.intel.com with ESMTP; 02 Jan 2020 16:41:46 -0800
To: Sam McNally <sammc@chromium.org>, LKML <linux-kernel@vger.kernel.org>
References: <20200103112158.v2.1.Ib87c4a7fbb3fc818ea12198e291b87dc2d5bc8c2@changeid>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4fa9702a-f95c-6135-745b-5374eebb4880@linux.intel.com>
Date: Thu, 2 Jan 2020 18:41:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200103112158.v2.1.Ib87c4a7fbb3fc818ea12198e291b87dc2d5bc8c2@changeid>
Content-Language: en-US
Cc: Xun Zhang <xun2.zhang@intel.com>, alsa-devel@alsa-project.org,
 Jairaj Arava <jairaj.arava@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Sathya Prakash M R <sathya.prakash.m.r@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: Intel: sof_rt5682: Ignore the
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



On 1/2/20 6:22 PM, Sam McNally wrote:
> Some members of the Google_Hatch family include a rt5682, but not a
> speaker amp. When a speaker amp is also present, the first 10EC5682
> entry in snd_soc_acpi_intel_cml_machines[] matches, finding the
> MX98357A as well, resulting in the quirk_data field in the
> snd_soc_acpi_mach being non-null. When only the rt5682 is present, the
> second 10EC5682 entry is matched instead and quirk_data is left null.

Ah yes, I confused GLK and CML code names.

The code looks fine, but would you mind updating your commit message? 
We've reshuffled the 10EC5682 entries to account for the variations with 
RT1011, so it's technically the 3rd entry that does not have a speaker 
amplifier. And we should also mention that for CML we use the jack codec 
as the primary key, so the quirk data does really refer to the speaker 
amplifier.

> 
> The sof_rt5682 driver's DMI data matching identifies that a speaker amp
> is present for all Google_Hatch family devices. Detect cases where there
> is no speaker amp by checking for a null quirk_data in the
> snd_soc_acpi_mach and remove the speaker amp bit in that case.
> 
> Signed-off-by: Sam McNally <sammc@chromium.org>
> ---
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
