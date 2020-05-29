Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1D11E7D52
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 14:34:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 908CA17B7;
	Fri, 29 May 2020 14:33:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 908CA17B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590755673;
	bh=YxEeR08Nzk+RQntp3v1ECLc70Itjhyu7P0okAGRbMEc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C3qZES53ONGD/VrtTfmtFrE/lX+/FXkVVes+c0jmPOWWx9xnmeB4n+/LCKwFJ97PZ
	 iRJ5kpkQ/i9qmBNtIbpPHZePtKgu7oPnBvvTqyAF5VChp2Xl0j4hzscS8vyAp9TDJW
	 lMaJYXHv89EyMnFMo2EnPo+DUGp4B087VcFv7l8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9CC5F8016F;
	Fri, 29 May 2020 14:32:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 786BAF8014E; Fri, 29 May 2020 14:32:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03F43F800FF
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 14:32:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03F43F800FF
IronPort-SDR: /E47R5oRlAPd7CDOJQmNdxYv9aBEr3JX93m9RqX3O7/sTiv3EKyz0htM95D5vCzzDwkLPLHZHe
 JHMRMM6ZvaLA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 05:32:44 -0700
IronPort-SDR: OIZtGt19dZho+R6Y8OiL2JruPoGEu4+Y2eTnw+q9aLPKKW0NO22WtBotyrh1CGLBThN2osBTzY
 TIRwa9OnHh2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,448,1583222400"; d="scan'208";a="271201578"
Received: from snizamud-mobl2.amr.corp.intel.com (HELO [10.251.8.208])
 ([10.251.8.208])
 by orsmga006.jf.intel.com with ESMTP; 29 May 2020 05:32:43 -0700
Subject: Re: [PATCH] ASoC: reduce verbosity of error messages for sof-dai and
 sof-link
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20200529001526.3013-1-pierre-louis.bossart@linux.intel.com>
 <87h7vzz1xm.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d8fd9b8b-74ff-6090-132e-a123696585b8@linux.intel.com>
Date: Fri, 29 May 2020 07:32:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <87h7vzz1xm.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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



On 5/29/20 1:32 AM, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis
> 
>> Recent changes result in multiple dmesg traces such as:
>>
>> [ 14.410435] Audio Port: ASoC: error at snd_soc_link_startup on Audio
>> Port: 1
>>
>> [ 14.410446] sst-mfld-platform sst-mfld-platform: ASoC: error at
>> snd_soc_dai_startup on media-cpu-dai: 1
>>
>> These messages are not really errors, when dai and dai-link callbacks
>> return the value of e.g. snd_pcm_hw_constraint_single() the result is
>> "Positive if the value is changed, zero if it's not changed, or a
>> negative error code"
>>
>> Add a simple test to only log errors when the result is
>> negative.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
> 
> Thank you for pointing it.
> Some functions which has above rule isn't use soc_xxx_ret() actually.
> Anyway, more simply, how about this ?

Sounds good, will send a v2 with your suggestion.

> 
> ----------
> diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
> index ae8b2c93cb66..da83059faf4e 100644
> --- a/sound/soc/soc-dai.c
> +++ b/sound/soc/soc-dai.c
> @@ -14,10 +14,14 @@
>   static inline int _soc_dai_ret(struct snd_soc_dai *dai,
>   			       const char *func, int ret)
>   {
> +	/* Positive, Zero are not error */
> +	if (ret >= 0)
> +		return ret;
> +
> +	/* Negative might be error */
>   	switch (ret) {
>   	case -EPROBE_DEFER:
>   	case -ENOTSUPP:
> -	case 0:
>   		break;
>   	default:
>   		dev_err(dai->dev,
> ----------
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto
> 
