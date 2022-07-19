Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9A957A164
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 16:26:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F96B844;
	Tue, 19 Jul 2022 16:25:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F96B844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658240771;
	bh=QymwNLTw+r+SLmXB6/1tpXs8q8Yf+hUenOyUMN0/wGM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bD4bQ9gMVx2J5nyP3ePSjhMTaJEwk7y0kf43E+xMpOEJeXU8CUL9k3P9cnPB0qk+o
	 QCx8lQLHscjNCMEwUNJyi8dv8AFGQAEo2DIKv3LqWPpSQyffnUPySFAJfyXVjfeGVD
	 P/cOf72YIILLhaZ9ESgdtBhzWuZPa5zFMyeA8yxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E19AEF80224;
	Tue, 19 Jul 2022 16:25:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE90CF80125; Tue, 19 Jul 2022 16:25:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39804F80125
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 16:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39804F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lpARN0Ic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658240704; x=1689776704;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QymwNLTw+r+SLmXB6/1tpXs8q8Yf+hUenOyUMN0/wGM=;
 b=lpARN0IcezvB1twzlXSRnThklkDByTPvTEXLaGCbTBqduOArzpvieCWX
 fFZvUNTF5i9t+gsn+xGdNtvvj/3wJcqxdlkS3Zu8Tb/ltSBCWsCeOMOcF
 1ga1ayWgai2OQEnb5gPFv+nZar1cqzJGhWiFv6M5tBZ6cuP9FxSwkCwi8
 i3dPeWyZiNEZBBSJOfVvb6HtNeMLwQ5i3DyuYEIISS8bOMOlP6iZc8lFv
 r7E6bOjOOouq9zPjc08LT5DrpE3/BU6/K/HKnyZO5+EHI8Ftq3Kag5rd5
 iZt61J0EwY3gMeOV9o1oyo2h9Qge+grIcbd01z2OSSum+OZyvcsfahFq/ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="372805214"
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; d="scan'208";a="372805214"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 07:24:58 -0700
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; d="scan'208";a="594845495"
Received: from kckollur-mobl1.amr.corp.intel.com (HELO [10.212.118.182])
 ([10.212.118.182])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 07:24:56 -0700
Message-ID: <26e40344-453f-6bdb-cd4b-15431a930497@linux.intel.com>
Date: Tue, 19 Jul 2022 09:24:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH -next v2] ASoC: Intel: Fix missing clk_disable_unprepare()
 on err in platform_clock_control()
Content-Language: en-US
To: Zhang Zekun <zhangzekun11@huawei.com>, cezary.rojewski@intel.com,
 liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>
References: <20220719013628.40153-1-zhangzekun11@huawei.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220719013628.40153-1-zhangzekun11@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: xuqiang36@huawei.com, linux-kernel@vger.kernel.org
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



On 7/18/22 20:36, Zhang Zekun wrote:
> Fix the missing clk_disable_unprepare() before return
> from platform_clock_control() in error handling path.
> 
> Fixes: 9a87fc1e0619 ("ASoC: Intel: bytcr_wm5102: Add machine driver for BYT/WM5102")
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
> ---
>  sound/soc/intel/boards/bytcr_wm5102.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
> index 45a6805787f5..3e3cdee4b1ce 100644
> --- a/sound/soc/intel/boards/bytcr_wm5102.c
> +++ b/sound/soc/intel/boards/bytcr_wm5102.c
> @@ -111,6 +111,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
>  		ret = byt_wm5102_prepare_and_enable_pll1(codec_dai, 48000);
>  		if (ret) {
>  			dev_err(card->dev, "Error setting codec sysclk: %d\n", ret);
> +			clk_disable_unprepare(priv->mclk);

This change looks legit to me, but you want to CC: maintainers (Mark
Brown, Takashi Iwai), use the alsa-devel mailing list and CC: the
initial contributor Hans de Goede.

>  			return ret;
>  		}
>  	} else {
