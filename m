Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CE9563635
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 16:53:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1989F16AF;
	Fri,  1 Jul 2022 16:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1989F16AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656687195;
	bh=ADcjVOQEABdFUO8/WCmMSMFW4pzaVj9Tjd29HR8rXDQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JM03xJttWyoTpLXSAvhoOT7ulFaG6p04uSDjIPhS5VwGImM+GNoAJMfEL1OfPoi2D
	 fEa27Sg/8sOGptE2A6gbrruXCaO+t5ZEFrhewt8N7yTUD1QRFpupIH2oI70B0D9rvP
	 fRJ7Oev0hpIUeoGGTtjCNNLJb16mQDe2eSdWc9yg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81065F8047C;
	Fri,  1 Jul 2022 16:52:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B9FEF80152; Fri,  1 Jul 2022 16:52:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 498B8F8014E
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 16:52:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 498B8F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SBboVPsH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656687131; x=1688223131;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ADcjVOQEABdFUO8/WCmMSMFW4pzaVj9Tjd29HR8rXDQ=;
 b=SBboVPsHIaalt76SwP5hIm6XE9M14J5Ho8MP8TpTXh6616RCaW7QbmHj
 5EjhWRSUf0jAnSu51wQGoR2NoL7S6/9HsrUoJi13UI3RhlHCMaHmgjgUA
 W/QEVI+RIuoyVTD3KGfws7ns1++GEvrECCk1geFNKClwFdPzUHBxQvU2r
 cxaCiSxq+Ro9k1yqZj97rRoxCKUx4KOIJ6C52TeYe1NBkv4QdmPebkz+F
 NeJd4DMJ79K6INbE7A1oMHz+WsWOD/NYxGizBKBOz1I1sztG50PiRUUWt
 BqJl9eyuhBtsAkoX/kt6LxwKyyBXHHDNCsnQSsA4L++hsheQLS84OYVH4 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="308183749"
X-IronPort-AV: E=Sophos;i="5.92,237,1650956400"; d="scan'208";a="308183749"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 07:52:06 -0700
X-IronPort-AV: E=Sophos;i="5.92,237,1650956400"; d="scan'208";a="541758285"
Received: from swathigo-mobl3.amr.corp.intel.com (HELO [10.209.128.76])
 ([10.209.128.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 07:52:05 -0700
Message-ID: <068e141c-c0d8-e759-8cb6-36fc27c88465@linux.intel.com>
Date: Fri, 1 Jul 2022 08:44:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: codes: Add support for ES8316 producer mode
Content-Language: en-US
To: Zhu Ning <zhuning0077@gmail.com>, alsa-devel@alsa-project.org
References: <20220701020537.970950-1-zhuning0077@gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220701020537.970950-1-zhuning0077@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: broonie@kernel.org, tiwai@suse.com,
 David Yang <yangxiaohua@everest-semi.com>, vijendar.mukunda@amd.com
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


>  	/* Validate supported sample rates that are autodetected from MCLK */
> @@ -477,19 +478,24 @@ static int es8316_pcm_hw_params(struct snd_pcm_substream *substream,
>  	}
>  	if (i == NR_SUPPORTED_MCLK_LRCK_RATIOS)
>  		return -EINVAL;
> -
> +	lrck_divider = es8316->sysclk/params_rate(params);
> +	bclk_divider = lrck_divider/4;
>  	switch (params_format(params)) {
>  	case SNDRV_PCM_FORMAT_S16_LE:
>  		wordlen = ES8316_SERDATA2_LEN_16;
> +		bclk_divider/=16;
>  		break;
>  	case SNDRV_PCM_FORMAT_S20_3LE:
>  		wordlen = ES8316_SERDATA2_LEN_20;
> +		bclk_divider/=32;

S20_3LE uses 3 bytes, is the 32 divider correct here?

>  		break;
>  	case SNDRV_PCM_FORMAT_S24_LE:
>  		wordlen = ES8316_SERDATA2_LEN_24;
> +		bclk_divider/=24;>  		break;
>  	case SNDRV_PCM_FORMAT_S32_LE:
>  		wordlen = ES8316_SERDATA2_LEN_32;
> +		bclk_divider/=32;
>  		break;
>  	default:
>  		return -EINVAL;
