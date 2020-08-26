Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9720253336
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 17:14:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68F051776;
	Wed, 26 Aug 2020 17:13:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68F051776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598454847;
	bh=7leB6E9yhP9Wa5K7oNpJIqYcdqAHF26QpUA0FGOVGFs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ihm950P/AeBmPgk34FRoyMqap4EZvQUGv6XYWnhC4A4AwQvPFHrwiytMHpbx1xtHc
	 ambUGfrWsBNT5tycxPMTIayXEj/yU2DxRqM79lwFUDBIZbBRztdGwzaIWddgcUiE6+
	 irxkkV4cbRk/QED8PLAGz5zJeY473mVEhelCxEZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C9E9F802DD;
	Wed, 26 Aug 2020 17:11:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 538EBF802D2; Wed, 26 Aug 2020 17:11:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2805F8020C
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 17:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2805F8020C
IronPort-SDR: hQd/BwFyIIcBQRZhyRE1yvyBmWHX2FE88kOkhSMZh7xzBcEOU4bR1FZKDRk8D1CoIbEQ94mdUZ
 ML1/1F2TDgFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="143970592"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="143970592"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 08:11:25 -0700
IronPort-SDR: IGgxmkZop+YsRcGGramX/nJvANvQUeHyyD2q3q/ecm42zKIu7W2EkwkP3wmno/+0Q1JcO3f81m
 +5TVTJQlfGbQ==
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="299505130"
Received: from gillelas-mobl1.amr.corp.intel.com (HELO [10.255.231.51])
 ([10.255.231.51])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 08:11:24 -0700
Subject: Re: [PATCH 4/4] ASoC: rt715: Fix return check for
 devm_regmap_init_sdw()
To: Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20200826122811.3223663-1-vkoul@kernel.org>
 <20200826122811.3223663-4-vkoul@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e71ba625-ec1e-1adf-9e4c-b65a91562d9c@linux.intel.com>
Date: Wed, 26 Aug 2020 10:09:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200826122811.3223663-4-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Shuming Fan <shumingf@realtek.com>
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



On 8/26/20 7:28 AM, Vinod Koul wrote:
> devm_regmap_init_sdw() returns a valid pointer on success or ERR_PTR on
> failure which should be checked with IS_ERR. Also use PTR_ERR for
> returning error codes.

Do you mind changing these two additional codecs that were missed in 
this series? Thanks!

rt700-sdw.c:	sdw_regmap = devm_regmap_init_sdw(slave, &rt700_sdw_regmap);
rt700-sdw.c-	if (!sdw_regmap)
rt700-sdw.c-		return -EINVAL;

--
rt711-sdw.c:	sdw_regmap = devm_regmap_init_sdw(slave, &rt711_sdw_regmap);
rt711-sdw.c-	if (!sdw_regmap)
rt711-sdw.c-		return -EINVAL;
--

> 
> Reported-by: Takashi Iwai <tiwai@suse.de>
> Fixes: d1ede0641b05 ("ASoC: rt715: add RT715 codec driver")
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   sound/soc/codecs/rt715-sdw.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
> index d11b23d6b240..68a36739f1b0 100644
> --- a/sound/soc/codecs/rt715-sdw.c
> +++ b/sound/soc/codecs/rt715-sdw.c
> @@ -527,8 +527,8 @@ static int rt715_sdw_probe(struct sdw_slave *slave,
>   
>   	/* Regmap Initialization */
>   	sdw_regmap = devm_regmap_init_sdw(slave, &rt715_sdw_regmap);
> -	if (!sdw_regmap)
> -		return -EINVAL;
> +	if (IS_ERR(sdw_regmap))
> +		return PTR_ERR(sdw_regmap);
>   
>   	regmap = devm_regmap_init(&slave->dev, NULL, &slave->dev,
>   		&rt715_regmap);
> 
