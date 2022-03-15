Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E37A74D9E7B
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 16:17:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70F68171C;
	Tue, 15 Mar 2022 16:16:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70F68171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647357459;
	bh=vWrZqjVUqKczBnIKybfSbIZbZf1sWzQtygbOwVuVtiY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bzWWiGkhGZc1P09OiCCWWLEDJMvtztAhSz3/pLO8CqNFgXd5g7lDt4wybu5usV/Ak
	 4mK4mipR7RoaH6t02KtNJXlVlA7aQSJRAFyeizTkddZQ8pMMCQO/o0NgnSbyobocA+
	 Em1Od2ZX5D6BqNzaLx8GwzzLayTmXwveSZzSIfFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8912F80162;
	Tue, 15 Mar 2022 16:16:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D18A4F801F7; Tue, 15 Mar 2022 16:16:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47915F80095
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 16:16:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47915F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nkNjFtlK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647357385; x=1678893385;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vWrZqjVUqKczBnIKybfSbIZbZf1sWzQtygbOwVuVtiY=;
 b=nkNjFtlKr9UrxVVRctmk+KdZKfyV2EKckn3HHVomI7XU8h383AOjSiCt
 CJ3z5/WHvrLJx5Y87p2HAm/O17cQa0ZGeKCLIV2XgqoEgI/7THX8Zu92t
 xYyzUMaRWlvSd4/YAoG0/9iB0RvVw9BYw8VsWY1HRm2PSnhc80pkdw5zc
 zukF30qAFdSbYoe1T7PdN+d9bEK80GGRW6GohsbMNZcOjxolDRMfnGS50
 zjRilwL5bcetsoglCoiV3P8ZaZj0DVsEEnGZVeVwLJcR+WdfVXEcXtBec
 LwZEVC5mkt/rSYSulssr270/yioPXYklMmsL+TwTwwlt92i9lmldlnwVn g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="236276575"
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; d="scan'208";a="236276575"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 08:15:45 -0700
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; d="scan'208";a="690230016"
Received: from mjmeeuws-mobl.amr.corp.intel.com (HELO [10.209.37.30])
 ([10.209.37.30])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 08:15:27 -0700
Message-ID: <57591669-7a3c-c67a-74a3-f749ed464e4d@linux.intel.com>
Date: Tue, 15 Mar 2022 10:03:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: rt1308-sdw: get calibration params after power on
Content-Language: en-US
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
References: <20220315093740.12008-1-shumingf@realtek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220315093740.12008-1-shumingf@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, jfmiranda@gmail.com,
 flove@realtek.com, pierre-louis.bossart@intel.com
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



On 3/15/22 04:37, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> It will be safe when getting the calibration params after power-on.
> All powers are ready to read the calibration params from EFUSE.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>

For more context, this patch solves 'cracking sound' on speakers and was 
tested by the bug reporter on Dell XPS 17 9710 (SoundWire-based device)

BugLink: https://github.com/thesofproject/sof/issues/5436
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/codecs/rt1308-sdw.c | 73 +++++++++++++++++++----------------
>   1 file changed, 40 insertions(+), 33 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
> index 149a76075c76..1ef836a68a56 100644
> --- a/sound/soc/codecs/rt1308-sdw.c
> +++ b/sound/soc/codecs/rt1308-sdw.c
> @@ -50,6 +50,8 @@ static bool rt1308_volatile_register(struct device *dev, unsigned int reg)
>   	case 0x3008:
>   	case 0x300a:
>   	case 0xc000:
> +	case 0xc860 ... 0xc863:
> +	case 0xc870 ... 0xc873:
>   		return true;
>   	default:
>   		return false;
> @@ -159,12 +161,45 @@ static int rt1308_read_prop(struct sdw_slave *slave)
>   	return 0;
>   }
>   
> +static void rt1308_apply_calib_params(struct rt1308_sdw_priv *rt1308)
> +{
> +	unsigned int efuse_m_btl_l, efuse_m_btl_r, tmp;
> +	unsigned int efuse_c_btl_l, efuse_c_btl_r;
> +
> +	/* read efuse to apply calibration parameters */
> +	regmap_write(rt1308->regmap, 0xc7f0, 0x04);
> +	regmap_write(rt1308->regmap, 0xc7f1, 0xfe);
> +	msleep(100);
> +	regmap_write(rt1308->regmap, 0xc7f0, 0x44);
> +	msleep(20);
> +	regmap_write(rt1308->regmap, 0xc240, 0x10);
> +
> +	regmap_read(rt1308->regmap, 0xc861, &tmp);
> +	efuse_m_btl_l = tmp;
> +	regmap_read(rt1308->regmap, 0xc860, &tmp);
> +	efuse_m_btl_l = efuse_m_btl_l | (tmp << 8);
> +	regmap_read(rt1308->regmap, 0xc863, &tmp);
> +	efuse_c_btl_l = tmp;
> +	regmap_read(rt1308->regmap, 0xc862, &tmp);
> +	efuse_c_btl_l = efuse_c_btl_l | (tmp << 8);
> +	regmap_read(rt1308->regmap, 0xc871, &tmp);
> +	efuse_m_btl_r = tmp;
> +	regmap_read(rt1308->regmap, 0xc870, &tmp);
> +	efuse_m_btl_r = efuse_m_btl_r | (tmp << 8);
> +	regmap_read(rt1308->regmap, 0xc873, &tmp);
> +	efuse_c_btl_r = tmp;
> +	regmap_read(rt1308->regmap, 0xc872, &tmp);
> +	efuse_c_btl_r = efuse_c_btl_r | (tmp << 8);
> +	dev_dbg(&rt1308->sdw_slave->dev, "%s m_btl_l=0x%x, m_btl_r=0x%x\n", __func__,
> +		efuse_m_btl_l, efuse_m_btl_r);
> +	dev_dbg(&rt1308->sdw_slave->dev, "%s c_btl_l=0x%x, c_btl_r=0x%x\n", __func__,
> +		efuse_c_btl_l, efuse_c_btl_r);
> +}
> +
>   static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
>   {
>   	struct rt1308_sdw_priv *rt1308 = dev_get_drvdata(dev);
>   	int ret = 0;
> -	unsigned int efuse_m_btl_l, efuse_m_btl_r, tmp;
> -	unsigned int efuse_c_btl_l, efuse_c_btl_r;
>   
>   	if (rt1308->hw_init)
>   		return 0;
> @@ -196,37 +231,6 @@ static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
>   	/* sw reset */
>   	regmap_write(rt1308->regmap, RT1308_SDW_RESET, 0);
>   
> -	/* read efuse */
> -	regmap_write(rt1308->regmap, 0xc360, 0x01);
> -	regmap_write(rt1308->regmap, 0xc361, 0x80);
> -	regmap_write(rt1308->regmap, 0xc7f0, 0x04);
> -	regmap_write(rt1308->regmap, 0xc7f1, 0xfe);
> -	msleep(100);
> -	regmap_write(rt1308->regmap, 0xc7f0, 0x44);
> -	msleep(20);
> -	regmap_write(rt1308->regmap, 0xc240, 0x10);
> -
> -	regmap_read(rt1308->regmap, 0xc861, &tmp);
> -	efuse_m_btl_l = tmp;
> -	regmap_read(rt1308->regmap, 0xc860, &tmp);
> -	efuse_m_btl_l = efuse_m_btl_l | (tmp << 8);
> -	regmap_read(rt1308->regmap, 0xc863, &tmp);
> -	efuse_c_btl_l = tmp;
> -	regmap_read(rt1308->regmap, 0xc862, &tmp);
> -	efuse_c_btl_l = efuse_c_btl_l | (tmp << 8);
> -	regmap_read(rt1308->regmap, 0xc871, &tmp);
> -	efuse_m_btl_r = tmp;
> -	regmap_read(rt1308->regmap, 0xc870, &tmp);
> -	efuse_m_btl_r = efuse_m_btl_r | (tmp << 8);
> -	regmap_read(rt1308->regmap, 0xc873, &tmp);
> -	efuse_c_btl_r = tmp;
> -	regmap_read(rt1308->regmap, 0xc872, &tmp);
> -	efuse_c_btl_r = efuse_c_btl_r | (tmp << 8);
> -	dev_dbg(&slave->dev, "%s m_btl_l=0x%x, m_btl_r=0x%x\n", __func__,
> -		efuse_m_btl_l, efuse_m_btl_r);
> -	dev_dbg(&slave->dev, "%s c_btl_l=0x%x, c_btl_r=0x%x\n", __func__,
> -		efuse_c_btl_l, efuse_c_btl_r);
> -
>   	/* initial settings */
>   	regmap_write(rt1308->regmap, 0xc103, 0xc0);
>   	regmap_write(rt1308->regmap, 0xc030, 0x17);
> @@ -323,6 +327,8 @@ static int rt1308_classd_event(struct snd_soc_dapm_widget *w,
>   {
>   	struct snd_soc_component *component =
>   		snd_soc_dapm_to_component(w->dapm);
> +	struct rt1308_sdw_priv *rt1308 =
> +		snd_soc_component_get_drvdata(component);
>   
>   	switch (event) {
>   	case SND_SOC_DAPM_POST_PMU:
> @@ -331,6 +337,7 @@ static int rt1308_classd_event(struct snd_soc_dapm_widget *w,
>   			RT1308_SDW_OFFSET | (RT1308_POWER_STATUS << 4),
>   			0x3,	0x3);
>   		msleep(40);
> +		rt1308_apply_calib_params(rt1308);
>   		break;
>   	case SND_SOC_DAPM_PRE_PMD:
>   		snd_soc_component_update_bits(component,
