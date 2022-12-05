Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5306B642A8D
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 15:43:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D859017CF;
	Mon,  5 Dec 2022 15:42:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D859017CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670251381;
	bh=DVn5twW7JKlr/k6MWSpbsyWFYCqKmlrmxca5aYRBFNU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hn0XDHjWj/ia1gu5Mwvwny4loLhRVehC/6y2WsAUU6FtJIznZHwPTnLqzzmT8eerG
	 tq9MXiGKPELljoAVIZa8otGcF9tw/KNWTk5mPHRp/R4ukH2Up09fj/3eG47H9FwbrY
	 voITejs2+w87JI2Vc+8gHtYg0uPD4EKNHkLsdcAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B937F8047C;
	Mon,  5 Dec 2022 15:42:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF73DF80236; Mon,  5 Dec 2022 15:42:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0505F80155
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 15:41:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0505F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KGC9tpZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670251316; x=1701787316;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DVn5twW7JKlr/k6MWSpbsyWFYCqKmlrmxca5aYRBFNU=;
 b=KGC9tpZcQHhgdTJtvILNribs4JSUIjiTkqJOdRwRfmnsLK1tkiEDIPbT
 LyrHTxWurLwzinIL1D1xeIAz+oO38FShv51R6PVHGO0Y38V2JlBEMcQK8
 V9izxKKYFQRNG5tlLG/Z/54Fp74MQIGRGtDIevVo6Ony7hBPDYn6S/9ar
 yG2XaytriE0pj/kIq5woB/U0EbQ7JndrmK6laIuLo1BfpC8CHIdcDccIT
 BsEENsx2R3fQzPmCnsFjXWxE4HULZ9D48ESGL3hWTbQw7V858+3B8cbj6
 oU+vAuadbqq7Eo5CMbmroiSpig/knoeXFyC1lhrAmHKupn+uYoWcsLYJI w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="402636506"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; d="scan'208";a="402636506"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 06:41:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="678377371"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; d="scan'208";a="678377371"
Received: from lshi6-mobl2.amr.corp.intel.com (HELO [10.212.8.33])
 ([10.212.8.33])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 06:41:39 -0800
Message-ID: <6b85ebec-69f5-89cc-6606-a21a2194ed67@linux.intel.com>
Date: Mon, 5 Dec 2022 08:41:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH] ASoC: sof_es8336: fix possible use-after-free in
 sof_es8336_remove()
To: Yang Yingliang <yangyingliang@huawei.com>, alsa-devel@alsa-project.org
References: <20221205143721.3988988-1-yangyingliang@huawei.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221205143721.3988988-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, broonie@kernel.org, zhuning0077@gmail.com,
 kai.vehmanen@linux.intel.com
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



On 12/5/22 08:37, Yang Yingliang wrote:
> sof_es8336_remove() calls cancel_delayed_work(). However, that
> function does not wait until the work function finishes. This
> means that the callback function may still be running after
> the driver's remove function has finished, which would result
> in a use-after-free.
> 
> Fix by calling cancel_delayed_work_sync(), which ensures that
> the work is properly cancelled, no longer running, and unable
> to re-schedule itself.
> 
> Fixes: 89cdb224f2ab ("ASoC: sof_es8336: reduce pop noise on speaker")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/boards/sof_es8336.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
> index 70713e4b07dc..773e5d1d87d4 100644
> --- a/sound/soc/intel/boards/sof_es8336.c
> +++ b/sound/soc/intel/boards/sof_es8336.c
> @@ -783,7 +783,7 @@ static int sof_es8336_remove(struct platform_device *pdev)
>  	struct snd_soc_card *card = platform_get_drvdata(pdev);
>  	struct sof_es8336_private *priv = snd_soc_card_get_drvdata(card);
>  
> -	cancel_delayed_work(&priv->pcm_pop_work);
> +	cancel_delayed_work_sync(&priv->pcm_pop_work);
>  	gpiod_put(priv->gpio_speakers);
>  	device_remove_software_node(priv->codec_dev);
>  	put_device(priv->codec_dev);
