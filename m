Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F48F56A52A
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 16:13:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C34C11630;
	Thu,  7 Jul 2022 16:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C34C11630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657203237;
	bh=HZRjCKT8zEewyxRHTJ9nwE0aTYsxOQ/LuSd9LBdsu4s=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hbSlyqb8D5FH5maMBp/BvXmcQRq+BpeFD7i149sYi7oy6gYuqTehIL0u67rsA3r8w
	 oti8a9x/fX0ENW+f6zA7FMZWY1nnXkk8vyBMu2oNvK8AECjpybngRbJnw3+rT8nEgl
	 Aw/lfimk5H8me1mR8tWhuuhmChpEXYWW4SDKktLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45FB9F8028D;
	Thu,  7 Jul 2022 16:12:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48B78F8016A; Thu,  7 Jul 2022 16:12:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F8DCF80104
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 16:12:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F8DCF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hm2qtYKC"
Received: by mail-wr1-x42f.google.com with SMTP id v14so26530226wra.5
 for <alsa-devel@alsa-project.org>; Thu, 07 Jul 2022 07:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=references:from:to:cc:subject:date:in-reply-to:message-id
 :mime-version:content-transfer-encoding;
 bh=UK/Uy1rTqtEKNtkdnaFJwRoXL5W2xyfnuyiJpdc7QrM=;
 b=hm2qtYKCxByoLdw3utGxqAv4o6Trc/NKF83l46aF/xGoVk3dLfTVFAqZXgAYcQN+/O
 JsdmQtpqu3accFGOtzRoe8cbzpIdN7rmWMVy8SI3kY3LGjThkqQDMaZ0i2czkJAm/1nd
 FF3iBTQkEwjdTQvK7KXnPK43g2K9mAKgnlic9/3Cgh3noeu1hVDLCbTAx8fnx+r/EoBj
 BOESJqwmTrx5MiMeT3nbRJi3XNuC0XIopGGFSn9iX7zutr+xGCgKQCo5eTO2TUc2So/l
 cGfgn8SDw7dDKDHcqDh8VPxbjqMvLmA97sSU6P1tZmw1f4gjgvC+Ar/UzxLEdgx4lJfg
 a8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=UK/Uy1rTqtEKNtkdnaFJwRoXL5W2xyfnuyiJpdc7QrM=;
 b=n9HpjVj9SYqV4feGTwRsUTH8ljo6OdDRVAzfL2nhSmmIthNxneCeRIh+in4iuFXMYq
 uRLfxCYKzFaMsI0okkj4WByIhdsPAroZZo054gSTEaRuPnWugrMCy1lTc1YW64sF6bj4
 f5Xrce953fCZ4FydLnCKaLrLAV4H5SNuP0TSw36QGwYR8f3iAphMBZ+iyQFbcXpuvPPR
 iC3D4AznX8cIuLSchuIJeisGiFFpfyHCc+Rwml1+dxbocSgCFuj/vfgy/wFeDYNAhCC4
 kX0aQmRm9iC0nGszKvksVCJHDtX5Aikjjqd01WCfUqj0+CBEWEIObz/kAAEkUcsNO2JI
 FuGQ==
X-Gm-Message-State: AJIora/U0C3BuPn1Lu7YDR3LSKMOayunNcK9LvwMs8Mh3CKalOPfRo06
 jP3xnxCbrUXepKHbf0H7Adc=
X-Google-Smtp-Source: AGRyM1vuh1Vf1KlDryeeEaJMLhU90tR3OQwPIuT/ljlh0V2Ooghia8lb38Mr7SKhTstyeF6xSqtZww==
X-Received: by 2002:a05:6000:1448:b0:21b:b7db:c40b with SMTP id
 v8-20020a056000144800b0021bb7dbc40bmr43888197wrx.279.1657203166644; 
 Thu, 07 Jul 2022 07:12:46 -0700 (PDT)
Received: from localhost (92.40.203.183.threembb.co.uk. [92.40.203.183])
 by smtp.gmail.com with ESMTPSA id
 az42-20020a05600c602a00b003a1a02c6d7bsm14409800wmb.35.2022.07.07.07.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 07:12:46 -0700 (PDT)
References: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
 <20220706211330.120198-5-aidanmacdonald.0x0@gmail.com>
 <2C9NER.G722ABTZOI2P1@crapouillou.net>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 04/11] ASoC: jz4740-i2s: Simplify using regmap fields
Date: Thu, 07 Jul 2022 15:13:22 +0100
In-reply-to: <2C9NER.G722ABTZOI2P1@crapouillou.net>
Message-ID: <KeilmIUnQlqARmcM72Q5jSVQhZ4QaJZp@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, tiwai@suse.com,
 broonie@kernel.org
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


Paul Cercueil <paul@crapouillou.net> writes:

> Le mer., juil. 6 2022 at 22:13:23 +0100, Aidan MacDonald
> <aidanmacdonald.0x0@gmail.com> a =C3=A9crit :
>> The differences between register fields on different SoC versions
>> can be abstracted away using the regmap field API. This is easier
>> to understand and extend than comparisons based on the version ID.
>> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
>> ---
>>  sound/soc/jz4740/jz4740-i2s.c | 100 ++++++++++++++++++++++++----------
>>  1 file changed, 72 insertions(+), 28 deletions(-)
>> diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s=
.c
>> index 66a901f56392..cbb89f724f64 100644
>> --- a/sound/soc/jz4740/jz4740-i2s.c
>> +++ b/sound/soc/jz4740/jz4740-i2s.c
>> @@ -91,12 +91,22 @@ enum jz47xx_i2s_version {
>>  struct i2s_soc_info {
>>  	enum jz47xx_i2s_version version;
>>  	struct snd_soc_dai_driver *dai;
>> +
>> +	struct reg_field field_rx_fifo_thresh;
>> +	struct reg_field field_tx_fifo_thresh;
>> +	struct reg_field field_i2sdiv_capture;
>> +	struct reg_field field_i2sdiv_playback;
>>  };
>>  struct jz4740_i2s {
>>  	struct resource *mem;
>>  	struct regmap *regmap;
>> +	struct regmap_field *field_rx_fifo_thresh;
>> +	struct regmap_field *field_tx_fifo_thresh;
>> +	struct regmap_field *field_i2sdiv_capture;
>> +	struct regmap_field *field_i2sdiv_playback;
>> +
>>  	struct clk *clk_aic;
>>  	struct clk *clk_i2s;
>> @@ -222,12 +232,12 @@ static int jz4740_i2s_hw_params(struct
>> snd_pcm_substream *substream,
>>  	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
>>  {
>>  	struct jz4740_i2s *i2s =3D snd_soc_dai_get_drvdata(dai);
>> +	struct regmap_field *div_field;
>>  	unsigned int sample_size;
>> -	uint32_t ctrl, div_reg;
>> +	uint32_t ctrl;
>>  	int div;
>>  	regmap_read(i2s->regmap, JZ_REG_AIC_CTRL, &ctrl);
>> -	regmap_read(i2s->regmap, JZ_REG_AIC_CLK_DIV, &div_reg);
>>  	div =3D clk_get_rate(i2s->clk_i2s) / (64 * params_rate(params));
>> @@ -250,23 +260,16 @@ static int jz4740_i2s_hw_params(struct
>> snd_pcm_substream *substream,
>>  		else
>>  			ctrl &=3D ~JZ_AIC_CTRL_MONO_TO_STEREO;
>> -		div_reg &=3D ~I2SDIV_DV_MASK;
>> -		div_reg |=3D (div - 1) << I2SDIV_DV_SHIFT;
>> +		div_field =3D i2s->field_i2sdiv_playback;
>>  	} else {
>>  		ctrl &=3D ~JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_MASK;
>>  		ctrl |=3D sample_size << JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_OFFSET;
>> -		if (i2s->soc_info->version >=3D JZ_I2S_JZ4770) {
>> -			div_reg &=3D ~I2SDIV_IDV_MASK;
>> -			div_reg |=3D (div - 1) << I2SDIV_IDV_SHIFT;
>> -		} else {
>> -			div_reg &=3D ~I2SDIV_DV_MASK;
>> -			div_reg |=3D (div - 1) << I2SDIV_DV_SHIFT;
>> -		}
>> +		div_field =3D i2s->field_i2sdiv_capture;
>>  	}
>>  	regmap_write(i2s->regmap, JZ_REG_AIC_CTRL, ctrl);
>> -	regmap_write(i2s->regmap, JZ_REG_AIC_CLK_DIV, div_reg);
>> +	regmap_field_write(div_field, div - 1);
>>  	return 0;
>>  }
>> @@ -342,7 +345,6 @@ static int jz4740_i2s_resume(struct snd_soc_component
>> *component)
>>  static int jz4740_i2s_dai_probe(struct snd_soc_dai *dai)
>>  {
>>  	struct jz4740_i2s *i2s =3D snd_soc_dai_get_drvdata(dai);
>> -	uint32_t conf;
>>  	int ret;
>>  	ret =3D clk_prepare_enable(i2s->clk_aic);
>> @@ -352,22 +354,14 @@ static int jz4740_i2s_dai_probe(struct snd_soc_dai
>> *dai)
>>  	snd_soc_dai_init_dma_data(dai, &i2s->playback_dma_data,
>>  		&i2s->capture_dma_data);
>> -	if (i2s->soc_info->version >=3D JZ_I2S_JZ4760) {
>> -		conf =3D (7 << JZ4760_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET) |
>> -			(8 << JZ4760_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET) |
>> -			JZ_AIC_CONF_OVERFLOW_PLAY_LAST |
>> -			JZ_AIC_CONF_I2S |
>> -			JZ_AIC_CONF_INTERNAL_CODEC;
>> -	} else {
>> -		conf =3D (7 << JZ_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET) |
>> -			(8 << JZ_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET) |
>
> I believe you can remove these macros completely now that they are unused=
. Same
> goes for I2S_IDV_MASK, etc.
>
> Cheers,
> -Paul
>

Alright, I'll squash the macro and version ID removals into this patch.

>> -			JZ_AIC_CONF_OVERFLOW_PLAY_LAST |
>> -			JZ_AIC_CONF_I2S |
>> -			JZ_AIC_CONF_INTERNAL_CODEC;
>> -	}
>> -
>>  	regmap_write(i2s->regmap, JZ_REG_AIC_CONF, JZ_AIC_CONF_RESET);
>> -	regmap_write(i2s->regmap, JZ_REG_AIC_CONF, conf);
>> +
>> +	regmap_write(i2s->regmap, JZ_REG_AIC_CONF,
>> +		     JZ_AIC_CONF_OVERFLOW_PLAY_LAST |
>> +		     JZ_AIC_CONF_I2S | JZ_AIC_CONF_INTERNAL_CODEC);
>> +
>> +	regmap_field_write(i2s->field_rx_fifo_thresh, 7);
>> +	regmap_field_write(i2s->field_tx_fifo_thresh, 8);
>>  	return 0;
>>  }
>> @@ -414,11 +408,19 @@ static struct snd_soc_dai_driver jz4740_i2s_dai =
=3D {
>>  static const struct i2s_soc_info jz4740_i2s_soc_info =3D {
>>  	.version =3D JZ_I2S_JZ4740,
>>  	.dai =3D &jz4740_i2s_dai,
>> +	.field_rx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 12, 15),
>> +	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 8, 11),
>> +	.field_i2sdiv_capture	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>> +	.field_i2sdiv_playback	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>>  };
>>  static const struct i2s_soc_info jz4760_i2s_soc_info =3D {
>>  	.version =3D JZ_I2S_JZ4760,
>>  	.dai =3D &jz4740_i2s_dai,
>> +	.field_rx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 24, 27),
>> +	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
>> +	.field_i2sdiv_capture	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>> +	.field_i2sdiv_playback	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>>  };
>>  static struct snd_soc_dai_driver jz4770_i2s_dai =3D {
>> @@ -442,11 +444,19 @@ static struct snd_soc_dai_driver jz4770_i2s_dai =
=3D {
>>  static const struct i2s_soc_info jz4770_i2s_soc_info =3D {
>>  	.version =3D JZ_I2S_JZ4770,
>>  	.dai =3D &jz4770_i2s_dai,
>> +	.field_rx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 24, 27),
>> +	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
>> +	.field_i2sdiv_capture	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 8, 11),
>> +	.field_i2sdiv_playback	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>>  };
>>  static const struct i2s_soc_info jz4780_i2s_soc_info =3D {
>>  	.version =3D JZ_I2S_JZ4780,
>>  	.dai =3D &jz4770_i2s_dai,
>> +	.field_rx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 24, 27),
>> +	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
>> +	.field_i2sdiv_capture	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 8, 11),
>> +	.field_i2sdiv_playback	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>>  };
>>  static const struct snd_soc_component_driver jz4740_i2s_component =3D {
>> @@ -465,6 +475,36 @@ static const struct of_device_id jz4740_of_matches[=
] =3D {
>>  };
>>  MODULE_DEVICE_TABLE(of, jz4740_of_matches);
>> +static int jz4740_i2s_init_regmap_fields(struct device *dev,
>> +					 struct jz4740_i2s *i2s)
>> +{
>> +	i2s->field_rx_fifo_thresh =3D
>> +		devm_regmap_field_alloc(dev, i2s->regmap,
>> +					i2s->soc_info->field_rx_fifo_thresh);
>> +	if (IS_ERR(i2s->field_rx_fifo_thresh))
>> +		return PTR_ERR(i2s->field_rx_fifo_thresh);
>> +
>> +	i2s->field_tx_fifo_thresh =3D
>> +		devm_regmap_field_alloc(dev, i2s->regmap,
>> +					i2s->soc_info->field_tx_fifo_thresh);
>> +	if (IS_ERR(i2s->field_tx_fifo_thresh))
>> +		return PTR_ERR(i2s->field_tx_fifo_thresh);
>> +
>> +	i2s->field_i2sdiv_capture =3D
>> +		devm_regmap_field_alloc(dev, i2s->regmap,
>> +					i2s->soc_info->field_i2sdiv_capture);
>> +	if (IS_ERR(i2s->field_i2sdiv_capture))
>> +		return PTR_ERR(i2s->field_i2sdiv_capture);
>> +
>> +	i2s->field_i2sdiv_playback =3D
>> +		devm_regmap_field_alloc(dev, i2s->regmap,
>> +					i2s->soc_info->field_i2sdiv_playback);
>> +	if (IS_ERR(i2s->field_i2sdiv_playback))
>> +		return PTR_ERR(i2s->field_i2sdiv_playback);
>> +
>> +	return 0;
>> +}
>> +
>>  static const struct regmap_config jz4740_i2s_regmap_config =3D {
>>  	.reg_bits	=3D 32,
>>  	.reg_stride	=3D 4,
>> @@ -509,6 +549,10 @@ static int jz4740_i2s_dev_probe(struct platform_dev=
ice
>> *pdev)
>>  	if (IS_ERR(i2s->regmap))
>>  		return PTR_ERR(i2s->regmap);
>> +	ret =3D jz4740_i2s_init_regmap_fields(dev, i2s);
>> +	if (ret)
>> +		return ret;
>> +
>>  	platform_set_drvdata(pdev, i2s);
>>  	ret =3D devm_snd_soc_register_component(dev, &jz4740_i2s_component,
>> --
>> 2.35.1
>>=20

