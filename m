Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93381135F28
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jan 2020 18:20:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CCFC1779;
	Thu,  9 Jan 2020 18:19:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CCFC1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578590438;
	bh=FKLqhkjFUCvFcDMQ+DcSEMN+gpTyhdKt0xZIgzLOIF4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VjR7dVru1BgSkgz1bCpjrQa1TwW4ZZZ+uTeBvrcKNJcLmpw7BDDp1f7I8rrG3Bslz
	 w0ChLBqZbuEPeFyHYppvx+172uT5pwOfmx82pAjnksV9FmORt+rJcDMbX6OKwjZS8L
	 TEYkn8HTWNL+xRSrnagugFxmYFMS2UDv2MSQ0PqI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62F20F801EB;
	Thu,  9 Jan 2020 18:18:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30D5EF8015B; Thu,  9 Jan 2020 18:18:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBBF8F800E4
 for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2020 18:18:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBBF8F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vDN469ME"
Received: by mail-pl1-x642.google.com with SMTP id p9so2804153plk.9
 for <alsa-devel@alsa-project.org>; Thu, 09 Jan 2020 09:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QruM7l3SXYsrtTftygXWTt26xmnmd51hymBru/1sk+A=;
 b=vDN469ME9O0x1vwjid10Hgw5pByx0LPoB7vOdzhqJRFKnguE2dYv1Mb/JtV9KNovXj
 jKuWM5OJ56843S/WBYOWUgL8Mr9SZA4utT/ViCxykJPG6mTwSKlzcZmkPtKCGgVLg+hI
 waZAeb7DWj1lUljFIMsFOvw/JqfOXWAN01Ln/KG8vO47EeiRTK3UjrbnU54fwQGuRp8A
 t1L1GAu/ruk6lZaGXp5ipPLJ96V6gaASz9i9HQH6NAv4OyVDiBmd7DuIhw9zef5RyOhQ
 ZbkoOoD+km4xg7u/X2eZAisi/rwfBCepGux/a6Q8nG+a3oxcihUrAYo3UlijX2jB7zof
 60oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QruM7l3SXYsrtTftygXWTt26xmnmd51hymBru/1sk+A=;
 b=B799Zr9x2oRmTpSq0kXXPFAD55wWkJneibLvO8ycAbiBuWWRyIci53bZlSBNMrj8iB
 gGhiL9oXW35oja+qKEZHnzbyFqqPSs7Tx19MNvtIwtBJVbNNrR1yw94NclzL1kAceETB
 NuUFoKt13wzD/5wZjqRv8wu0CxpBhaai0GWmGv+2hqXO2AyHeHc5fZQCj2+vHSmFbzaw
 KamZDUf0Uls+2e6keG32sEbas6fXuiVmeV3sgp4vanjBPXvhlqoTj0qagYy3PGkdREJo
 svoYOL9cN5GnYa5h7EmkdCZmjw101oQDCuru3tTgqRCv0r63N0NsL/FWouUgVYrYsbPg
 iOIQ==
X-Gm-Message-State: APjAAAUZJPPTazp6fs31tH793biZIPXvWdWbT1PzZTSr56DJoLMh2MpX
 51IEcdak2Yk6QSXaiBsa0TE=
X-Google-Smtp-Source: APXvYqwAGw9yBi00yDxZBkva7g0lK9/ubOJMap59QLnLvz6Pb4obxJUDwn4byntRSZKeqYbhy9TWbQ==
X-Received: by 2002:a17:902:694b:: with SMTP id
 k11mr12805432plt.334.1578590326176; 
 Thu, 09 Jan 2020 09:18:46 -0800 (PST)
Received: from sriram-VirtualBox ([106.51.31.254])
 by smtp.gmail.com with ESMTPSA id a17sm4085998pjv.6.2020.01.09.09.18.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 Jan 2020 09:18:45 -0800 (PST)
Date: Thu, 9 Jan 2020 22:48:36 +0530
From: Sriram Periyasamy <sriram.oqensourz@gmail.com>
To: Jeff Chang <richtek.jeff.chang@gmail.com>
Message-ID: <20200109171833.GA2709@sriram-VirtualBox>
References: <1578366545-30251-1-git-send-email-richtek.jeff.chang@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578366545-30251-1-git-send-email-richtek.jeff.chang@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, matthias.bgg@gmail.com, broonie@kernel.org,
 jeff_chang@richtek.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v4] ASoC: Add MediaTek MT6660 Speaker Amp
 Driver
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jan 07, 2020 at 11:09:05AM +0800, Jeff Chang wrote:
> From: Jeff Chang <jeff_chang@richtek.com>
> 
> The MT6660 is a boosted BTL class-D amplifier with V/I sensing.
> A built-in DC-DC step-up converter is used to provide efficient
> power for class-D amplifier with multi-level class-G operation.
> The digital audio interface supports I2S, left-justified,
> right-justified, TDM and DSP A/B format for audio in with a data
> out used for chip information like voltage sense and current
> sense, which are able to be monitored via DATAO through proper
> 
> diff --git a/sound/soc/codecs/mt6660.c b/sound/soc/codecs/mt6660.c
> new file mode 100644
> index 0000000..b8fc53b
> --- /dev/null
> +++ b/sound/soc/codecs/mt6660.c
> @@ -0,0 +1,628 @@

> +
> +struct codec_reg_val {
> +	u32 addr;
> +	u32 mask;
> +	u32 data;
> +};

packed structures could have been better.

> +
> +struct reg_size_table {
> +	u32 addr;
> +	u8 size;
> +};

here as well.

> +static int mt6660_get_reg_size(uint32_t addr)
> +{
> +	int i = 0;

redundant initialization.

> +
> +	for (i = 0; i < ARRAY_SIZE(mt6660_reg_size_table); i++) {
> +		if (mt6660_reg_size_table[i].addr == addr)
> +			return mt6660_reg_size_table[i].size;
> +	}
> +	return 1;
> +}
> +
> +static int mt6660_reg_write(void *context, unsigned int reg, unsigned int val)
> +{
> +	struct mt6660_chip *chip = context;
> +	int size = mt6660_get_reg_size(reg);
> +	u8 reg_data[4] = {0};
> +	int i = 0, ret = 0;

redundant initialization.

> +
> +	for (i = 0; i < size; i++)
> +		reg_data[size - i - 1] = (val >> (8 * i)) & 0xff;
> +
> +	ret = i2c_smbus_write_i2c_block_data(chip->i2c, reg, size, reg_data);
> +	if (ret < 0)
> +		return ret;
> +	return 0;

one return can be removed.

> +}
> +
> +static int mt6660_reg_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +	struct mt6660_chip *chip = context;
> +	int size = mt6660_get_reg_size(reg);
> +	int i = 0, ret = 0;

redundant initialization.

> +
> +static int mt6660_codec_dac_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		usleep_range(1000, 1100);
> +		break;
> +	}

switch is redundant for one condition.

> +	return 0;
> +}
> +
> +static int mt6660_codec_classd_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	int ret = 0;

redundant intialization.

> +static inline int _mt6660_chip_power_on(struct mt6660_chip *chip, int on_off)

inline must here and other places also? Doesn't look like very small code. 
> +{
> +	u8 reg_data = 0;
> +	int ret = 0;
> +

redundant intialization.

> +
> +static int mt6660_apply_plat_data(struct mt6660_chip *chip,
> +		struct snd_soc_component *component)
> +{
> +	size_t i = 0;
> +	int num = chip->plat_data.init_setting_num;
> +	int ret = 0;
> +

redundant intialization and please take care of all places.

> +static inline int _mt6660_chip_sw_reset(struct mt6660_chip *chip)
> +{
> +	int ret;
> +
> +	/* turn on main pll first, then trigger reset */
> +	ret = regmap_write(chip->regmap, 0x03, 0x00);
> +	if (ret < 0)
> +		return ret;
> +	ret = regmap_write(chip->regmap, MT6660_REG_SYSTEM_CTRL, 0x80);

error check not needed?

> +static int mt6660_parse_dt(struct mt6660_chip *chip, struct device *dev)
> +{
> +	struct device_node *np = dev->of_node;
> +	u32 val;
> +	size_t i = 0;
> +
> +	if (!np) {
> +		dev_err(dev, "no device node\n");
> +		return -EINVAL;
> +	}
> +
> +	if (of_property_read_u32(np, "rt,init_setting_num", &val)) {
> +		dev_err(dev, "no init setting\n");
> +		chip->plat_data.init_setting_num = 0;
> +	} else {
> +		chip->plat_data.init_setting_num = val;
> +	}
> +
> +	chip->plat_data.init_setting_addr =
> +		devm_kzalloc(dev, sizeof(u32) *
> +				chip->plat_data.init_setting_num, GFP_KERNEL);
> +	chip->plat_data.init_setting_mask =
> +		devm_kzalloc(dev, sizeof(u32) *
> +				chip->plat_data.init_setting_num, GFP_KERNEL);
> +	chip->plat_data.init_setting_val =
> +		devm_kzalloc(dev, sizeof(u32) *
> +				chip->plat_data.init_setting_num, GFP_KERNEL);
> +

memory allocation failures not taken care of and if
chip->plat_data.init_setting_num is 0, allocation required.

> diff --git a/sound/soc/codecs/mt6660.h b/sound/soc/codecs/mt6660.h
> new file mode 100644
> index 0000000..6c40b40
> --- /dev/null
> +++ b/sound/soc/codecs/mt6660.h
> +
> +struct mt6660_platform_data {
> +	u8 init_setting_num;
> +	u32 *init_setting_addr;
> +	u32 *init_setting_mask;
> +	u32 *init_setting_val;
> +};

packed could have been better.

> +
> +struct mt6660_chip {
> +	struct i2c_client *i2c;
> +	struct device *dev;
> +	struct platform_device *param_dev;
> +	struct mt6660_platform_data plat_data;
> +	struct mutex io_lock;
> +	struct regmap *regmap;
> +	u16 chip_rev;
> +};
> +

here as well.

Thanks,
Sriram.

-- 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
