Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0839B4196CB
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 16:56:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A78A16B8;
	Mon, 27 Sep 2021 16:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A78A16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632754582;
	bh=dS9B5xPSYxl/u12LnCs3smk6VXQNO5F6s5ftjRPq9Vg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n1AgruWVEQ9Z2FctNqu16fEV4mLRS524ekjGRnM8/Fj0cGc9uFXSN1U4/p3OMwjBL
	 bnoq8K1SZJvw2tQ6oEfMiRq3NzS+WY8jdl1JLP2HDJBATriL7cZcVSVZo9Z+F5XkOu
	 Vwbw2XslKs2y1hmfqxEh/Yz7zQ1gsjBpS2JWPNq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C493EF801EC;
	Mon, 27 Sep 2021 16:55:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A52EF80227; Mon, 27 Sep 2021 16:55:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C530F80161
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 16:54:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C530F80161
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="203979479"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="203979479"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 07:54:46 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="486172557"
Received: from asen4-mobl2.amr.corp.intel.com (HELO [10.212.27.2])
 ([10.212.27.2])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 07:54:45 -0700
Subject: Re: [PATCH] ASoC: max98373: Mark cache dirty before entering sleep
To: Ryan Lee <ryans.lee@maximintegrated.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 yung-chuan.liao@linux.intel.com, guennadi.liakhovetski@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20210924221305.17886-1-ryans.lee@maximintegrated.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1b21bbf1-12c7-726d-bff8-76ec88ff8635@linux.intel.com>
Date: Mon, 27 Sep 2021 09:54:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210924221305.17886-1-ryans.lee@maximintegrated.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: sathya.prakash.m.r@intel.com, ryan.lee.maxim@gmail.com
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



On 9/24/21 5:13 PM, Ryan Lee wrote:
> Amp lose its register values in case amp power loss or
> 'ForceReset' over Soundwire SCP_ctrl register(0x0044) or
> HW_RESET pin control during the audio suspend and resume.
> Mark cache dirty before audio suspension to restore
> existing values when audio resume.
> 
> Signed-off-by: Ryan Lee <ryans.lee@maximintegrated.com>
> ---
>  sound/soc/codecs/max98373-sdw.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
> index dc520effc61c..a7e4a6e880b0 100644
> --- a/sound/soc/codecs/max98373-sdw.c
> +++ b/sound/soc/codecs/max98373-sdw.c
> @@ -259,6 +259,7 @@ static __maybe_unused int max98373_suspend(struct device *dev)
>  		regmap_read(max98373->regmap, max98373->cache[i].reg, &max98373->cache[i].val);
>  
>  	regcache_cache_only(max98373->regmap, true);
> +	regcache_mark_dirty(max98373->regmap);

We already do the following sequence in max98373_io_init() when the
amplifier re-attaches:

	if (max98373->first_hw_init) {
		regcache_cache_bypass(max98373->regmap, false);
		regcache_mark_dirty(max98373->regmap);
	}

I don't see what marking the cache as dirty on suspend might do, we will
do a sync only in the resume step.

IIRC this is a patch that we've seen before and removed since it wasn't
aligned with any other codec driver.

Does this actually improve anything?


