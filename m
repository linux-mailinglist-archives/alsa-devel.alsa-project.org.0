Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9E789CAB5
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 19:24:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21B4423DE;
	Mon,  8 Apr 2024 19:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21B4423DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712597054;
	bh=PSdUNjxecv9/EH8TvrTsRyagADl80n4dir3Oe48bPOI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ULg02jKotosZaIhzY45cNH+nnkDjeX7fGwhTHaZjrKfialExtkQvO+Rd1Kfoj7B0J
	 q0ZpfkbYmQM3gvVGqiFnDLkMO5ifodaxY58qz999yH9fqO1GaWVN1OtE/CVgPvt4kN
	 NZuMKgjtvYNufFKJyNLGKL2yCNVPmkXMyVaaX5vI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3290DF805F3; Mon,  8 Apr 2024 19:23:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22D36F805E6;
	Mon,  8 Apr 2024 19:23:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81093F805B0; Mon,  8 Apr 2024 19:23:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61CDAF8026D
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 19:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61CDAF8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jUeIjzTl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712596982; x=1744132982;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PSdUNjxecv9/EH8TvrTsRyagADl80n4dir3Oe48bPOI=;
  b=jUeIjzTlJSj3aLsevjMC2f8HosHPA3Qa3VdKuWas4gMh1DvFFIRbHnyl
   Xfg3FG1QCAsVcobtpWjSZ6T5WB+mUawz/4jlscImO203MedBoDUT1Zjy0
   Ds1HQIy/76WW1/mv6iSlFqo2Z0VAsMdA6/uQyPcjfex06Eqg019pqTFg0
   nIkbdfgnKvy7m9gnOqBL1BIq2jKoJIHskn2pOP1Y7RQXFgLS/764LpEZ2
   JpEfxnMnbJDSTrLIoGVleB79Fef37K/94Bv0Zl/+SAHaNiFqW0AempNuc
   iGW9d6eMcQmWaeGkBCNDKk96/uuk/rN5d2d4YVLiOjyhUZ6GbbxmlSRzx
   w==;
X-CSE-ConnectionGUID: odHhPbSeR3uN1ZzK8Q1/CQ==
X-CSE-MsgGUID: mkyYIzhiSzSVlho+tdmiMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7757469"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000";
   d="scan'208";a="7757469"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:23:00 -0700
X-CSE-ConnectionGUID: a8sq+q/VRRmRTSHSWV6cuw==
X-CSE-MsgGUID: OlpQj4e/SoSchFFOlUJeuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000";
   d="scan'208";a="24697460"
Received: from shahsmit-mobl1.amr.corp.intel.com (HELO [10.212.101.141])
 ([10.212.101.141])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:22:59 -0700
Message-ID: <ba585faa-d761-45ed-9e44-784097b3439a@linux.intel.com>
Date: Mon, 8 Apr 2024 10:37:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: sof_rt5682: Fix uninitialized variable in
 probe
To: Dan Carpenter <dan.carpenter@linaro.org>, Brent Lu <brent.lu@intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Terry Cheong <htcheong@chromium.org>,
 Uday M Bhat <uday.m.bhat@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mac Chiang <mac.chiang@intel.com>, apoorv <apoorv@intel.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <6e16433f-1897-46a2-b3ee-e177e7d846b8@moroto.mountain>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <6e16433f-1897-46a2-b3ee-e177e7d846b8@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RZZMIYRAAKUIODDPSXW6IIKCAZX7YWZH
X-Message-ID-Hash: RZZMIYRAAKUIODDPSXW6IIKCAZX7YWZH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZZMIYRAAKUIODDPSXW6IIKCAZX7YWZH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/8/24 02:35, Dan Carpenter wrote:
> Initialize "is_legacy_cpu" to false to prevent an uninitialized variable
> bug.
> 
> Fixes: 8efcd4864652 ("ASoC: Intel: sof_rt5682: use common module for sof_card_private initialization")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Good catch.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/boards/sof_rt5682.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index aadd341a202c..966bcd3e8bdc 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -606,7 +606,7 @@ static int sof_audio_probe(struct platform_device *pdev)
>  {
>  	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
>  	struct sof_card_private *ctx;
> -	bool is_legacy_cpu;
> +	bool is_legacy_cpu = false;
>  	int ret;
>  
>  	if (pdev->id_entry && pdev->id_entry->driver_data)
