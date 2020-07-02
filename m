Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC82A212748
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 17:05:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D54C16E7;
	Thu,  2 Jul 2020 17:04:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D54C16E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593702324;
	bh=hKCJ5aQJ7cuw5HB7p6sJmraZeUULXrLC4LuTKJJX8L8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fxw8VRtBxTIrQujNLv7oHkKkg14ZUZm9a1182KLsffTKMepfOkTK335N/sLEkErT4
	 1KUPQ91syMhU0lMtMdnXO+PK1z5mFecG7vR3L2whAjdJJWSBVURaQehJWsxJ3XG/7t
	 TJ9hpjJH31YIFq2NO9hgVgYRk7yWbsPMMIeu3C0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 693AAF80134;
	Thu,  2 Jul 2020 17:02:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C85BF80247; Thu,  2 Jul 2020 17:02:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00D84F800C1
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 17:02:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00D84F800C1
IronPort-SDR: PjZD3APLzHqiM0uTGuFVaVgmkVW7+nZ2C7IYLSYE7x03WOk35lFpsZxYsC0oPoS8AsCT15XOHm
 WphVui4/vNHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="145063694"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="145063694"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 08:02:43 -0700
IronPort-SDR: g9KHZtn+dpB+rln7D4IWEm3Us2IMiwL8/XfFecXINP8MXWWwUKauOb0QsNJMRNpXH3rPFpB9fO
 yvwINN8+Yj6A==
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="304275487"
Received: from nchava-mobl1.amr.corp.intel.com (HELO [10.252.135.144])
 ([10.252.135.144])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 08:02:42 -0700
Subject: Re: [PATCH][next] ASoC: Intel: bxt-da7219-max98357a: return -EINVAL
 on unrecognized speaker amplifier
To: Colin King <colin.king@canonical.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <20200702114835.37889-1-colin.king@canonical.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d79c5d6b-5bb6-3552-d1a6-bbd40f6c3081@linux.intel.com>
Date: Thu, 2 Jul 2020 09:40:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200702114835.37889-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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



On 7/2/20 6:48 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently if the ctx->spkamp is not recognized an error message is
> reported but the code continues to set up the device with uninitialized
> variables such as the number of widgets.  Fix this by returning -EINVAL
> for unrecognized speaker amplifier types.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: e1435a1feb18 ("ASoC: Intel: bxt-da7219-max98357a: support MAX98390 speaker amp")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Sounds good, thanks Colin.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/intel/boards/bxt_da7219_max98357a.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
> index 4d39253e796b..0c0a717823c4 100644
> --- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
> +++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
> @@ -677,7 +677,7 @@ static int bxt_card_late_probe(struct snd_soc_card *card)
>   		break;
>   	default:
>   		dev_err(card->dev, "Invalid speaker amplifier %d\n", ctx->spkamp);
> -		break;
> +		return -EINVAL;
>   	}
>   
>   	err = snd_soc_dapm_new_controls(&card->dapm, widgets, num_widgets);
> 
