Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B03229F39
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 20:26:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C2621665;
	Wed, 22 Jul 2020 20:25:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C2621665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595442361;
	bh=y5yOqychhYvhyyyMpxyKSEJTCfjS6GWAw01311CmG4k=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nDtUa+oS5ybDIitFORHtrg9nETZgp9zR/K6O+R2Kr39ZeJO8Y8XXKyGh/9y+8W52a
	 zV71JPokC2d52DfX7xLQVPG7dWO8mtH11ES8ngIKV/5PBGbG8MIbgT/FQ/+Q4Qha+c
	 WusGykLQyIdli3FehFsPy9M8UuRemx5Rz24yzD2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42447F800CE;
	Wed, 22 Jul 2020 20:24:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FBA8F8015A; Wed, 22 Jul 2020 20:24:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E251CF80139
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 20:24:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E251CF80139
IronPort-SDR: UCCN2iq4uEvsu+0xV4TslPIaW5liq905l4qh0UNe5TQFN5Bx2ASiF5XgHFkDSfXkxj53B7Sdw0
 efg4u2xcGAKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="211946784"
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="211946784"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 11:24:21 -0700
IronPort-SDR: zwb4b0wp2rt4IU3/L9NxmP8T3C8Zmk5nzMNHGx1OKcJIZTknrLpDjgF828hbk0yAQrNJ17rrc2
 3li1XETA1jHg==
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="462553943"
Received: from aadl-mobl.amr.corp.intel.com (HELO [10.254.77.197])
 ([10.254.77.197])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 11:24:20 -0700
Subject: Re: [PATCH] ASoC: Intel: skl_hda_dsp_generic: Fix NULLptr dereference
 in autosuspend delay
To: Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200722173524.30161-1-mateusz.gorski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2674621e-1546-3048-3ba2-f8fe1265d6e1@linux.intel.com>
Date: Wed, 22 Jul 2020 13:24:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722173524.30161-1-mateusz.gorski@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, broonie@kernel.org, tiwai@suse.com
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



On 7/22/20 12:35 PM, Mateusz Gorski wrote:
> Different modules for HDMI codec are used depending on the
> "hda_codec_use_common_hdmi" option being enabled or not. Driver private
> context for both of them is different.
> This leads to null-pointer dereference error when driver tries to set
> autosuspend delay for HDMI codec while the option is off (hdac_hdmi
> module is used for HDMI).
> 
> Change the string in conditional statement to "ehdaudio0D0" to ensure
> that only the HDAudio codec is handled by this function.

I am not sure this is correct.

I may be wrong, but my understanding is the following:

Before 5bf73b1b1dec, the driver would use the first dailink of the card, 
and in the case of devices without an HDaudio codec (e.g. Up2 board) it 
would set the auto suspend delay using that first dailink. See the code 
in skl_hda_fill_card_info(), it reorders the dailinks when HDaudio 
codecs are not present so if you test for 'edhaudio00' you no longer 
allow for this HDMI-only case to be handled with autosuspend.

Kai would need to review this, so this will have to wait I am afraid.

> 
> Fixes: 5bf73b1b1dec ("ASoC: intel/skl/hda - fix oops on systems without i915 audio codec")
> Signed-off-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
> ---
>   sound/soc/intel/boards/skl_hda_dsp_generic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
> index ca4900036ead..bc50eda297ab 100644
> --- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
> +++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
> @@ -181,7 +181,7 @@ static void skl_set_hda_codec_autosuspend_delay(struct snd_soc_card *card)
>   	struct snd_soc_dai *dai;
>   
>   	for_each_card_rtds(card, rtd) {
> -		if (!strstr(rtd->dai_link->codecs->name, "ehdaudio"))
> +		if (!strstr(rtd->dai_link->codecs->name, "ehdaudio0D0"))
>   			continue;
>   		dai = asoc_rtd_to_codec(rtd, 0);
>   		hda_pvt = snd_soc_component_get_drvdata(dai->component);
> 
