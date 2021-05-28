Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EAF39423C
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 13:56:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE26916C8;
	Fri, 28 May 2021 13:55:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE26916C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622203001;
	bh=hooYDv4KKmmJIhadd2Vy0BljoZFc8ijow4wajsAzXPY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WXuvUl09UXDRm3bCNM7rbc37yI4DvPJ3Rek9f5Wgn1poAJhlSCT+lFvFrD2gq2EZ9
	 A9LNi165GRep9LNu4+6VeaclLpnSjDFJyuho4HoUvDlm9QRGUcBeWSTcEnYboVicwa
	 CfxQKcV0KL3IqKbqm3Oi/HwkvjFMHFtu6CNnZHiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B253F804AD;
	Fri, 28 May 2021 13:55:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78606F804AB; Fri, 28 May 2021 13:55:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24910F804A9
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 13:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24910F804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="r7Zylf9U"
ARC-Seal: i=1; a=rsa-sha256; t=1622202900; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=aQqcZXWT4XqPeHd8/2ibHiQiD1y0VfjXgM93IQawBsWKOFFaYg7Br3XRXwJLYWOed2
 5i4CPMnLy8DqoaPZ1rYrLQ08+MvyTdHHd6TAmJgjWcohAQXdyK6JpOTF4hbCXR3yD9TH
 56edytofCabbK6dkc/IvLSEEHenbmQv9YXApUDfcNxdpO8UplJ+zIDbb4bxT+OfHrs7P
 L1R4RSd9u7MJ8JNaVN17I/3RZTakBCX7U65NzmWV1ZTKUt3QsU8Qwf0/BB7zQhb4bFZX
 Nwnxlz4k2HnL3e6kKkIi/mlDHuSJtMjagupA0eYYOBobpKfIgP6/JbJxo7cJ/drKj7Qq
 fv5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622202900;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=WeqQN4mQvzS29AH4yAdf/GA2SB8Yu/Jx4YSHLw8KKYE=;
 b=bqf4cZk8Qnv8wHwLoJN03UmrYfSpdnKV1xjO0lspSs4rthlzJOqbdJnOw9bVQP4kTr
 U/BH4KXzQhaYPIez72f1hPVRbqTa/35VD5OI6RvcvtmeErJJAlfIghJJDVHYHsw5nNnU
 CH5lxIYHSbKQei7HrijXF6z0r9HpRuBPNgd03CnAZ780w9pG9aZN4ErBl78CrojgC4e7
 AkI9hu0h7N3cXvVgFJcWhUIZz+QKKRx71Ic/L4JR422WL0oKn7cho0laveUYHeotDLkY
 sRAsw7cTg4aERqRwBR1bpJtF7R/stkXVb1ZHNLoT6jsA3R8HHcDwrnPSMVzQQfbHX9Zl
 iwHQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622202900;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=WeqQN4mQvzS29AH4yAdf/GA2SB8Yu/Jx4YSHLw8KKYE=;
 b=r7Zylf9UuQSufvtraDgmWTNFpCe14DxFRNNm7J/TwKvYKTw8j0M1lHsl+TTeoTF8K6
 f2eTgAgDHuPBJIKuec3ey0NYauSLZVgZGxVwXohj1PL0R+iApOUjAGfOBsmQ4nyjGDC4
 sa5jwB1+O8TZOsGXeZh4n8PgOVORTTSlu1JvCGXevsnsaQ86tzlfeFUHj9TuIs3UeXzQ
 XusYsM4XcEaiOhSciF7+xYGVMUHk7KlvGI23QdgMm40KTNdoSnXC8rzP/tS5xOO2oR9u
 6Eptxcf+NrkFWHu8K386VOg0nPhuxsAtWfFaSch+EB9IeuVgjpObdxuwu98dcaovvVzz
 28BQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j6IczFY4o="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.26.3 DYNA|AUTH)
 with ESMTPSA id U0b2c9x4SBsx662
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 28 May 2021 13:54:59 +0200 (CEST)
Date: Fri, 28 May 2021 13:54:58 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Vincent Knecht <vincent.knecht@mailoo.org>
Subject: Re: [PATCH v1 4/4] ASoC: codecs: tfa989x: Add support for optional
 vddd-supply
Message-ID: <YLDaEnjGmCHrUMiz@gerhold.net>
References: <20210528105101.508254-1-vincent.knecht@mailoo.org>
 <20210528105101.508254-4-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528105101.508254-4-vincent.knecht@mailoo.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
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

On Fri, May 28, 2021 at 12:51:01PM +0200, Vincent Knecht wrote:
> Allow specifying Vddd regulator/supply to be enabled on I2C probing.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

> ---
>  sound/soc/codecs/tfa989x.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/sound/soc/codecs/tfa989x.c b/sound/soc/codecs/tfa989x.c
> index 6d94865c534b..643b45188b6f 100644
> --- a/sound/soc/codecs/tfa989x.c
> +++ b/sound/soc/codecs/tfa989x.c
> @@ -10,6 +10,7 @@
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  #include <sound/soc.h>
>  
>  #define TFA989X_STATUSREG		0x00
> @@ -51,6 +52,10 @@ struct tfa989x_rev {
>  	int (*init)(struct regmap *regmap);
>  };
>  
> +struct tfa989x {
> +	struct regulator *vddd_supply;
> +};
> +
>  static bool tfa989x_writeable_reg(struct device *dev, unsigned int reg)
>  {
>  	return reg > TFA989X_REVISIONNUMBER;
> @@ -242,10 +247,18 @@ static int tfa989x_dsp_bypass(struct regmap *regmap)
>  				 BIT(TFA989X_SYS_CTRL_AMPC));
>  }
>  
> +static void tfa989x_regulator_disable(void *data)
> +{
> +	struct tfa989x *tfa989x = data;
> +
> +	regulator_disable(tfa989x->vddd_supply);
> +}
> +
>  static int tfa989x_i2c_probe(struct i2c_client *i2c)
>  {
>  	struct device *dev = &i2c->dev;
>  	const struct tfa989x_rev *rev;
> +	struct tfa989x *tfa989x;
>  	struct regmap *regmap;
>  	unsigned int val;
>  	int ret;
> @@ -256,10 +269,31 @@ static int tfa989x_i2c_probe(struct i2c_client *i2c)
>  		return -ENODEV;
>  	}
>  
> +	tfa989x = devm_kzalloc(dev, sizeof(*tfa989x), GFP_KERNEL);
> +	if (!tfa989x)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(i2c, tfa989x);
> +
> +	tfa989x->vddd_supply = devm_regulator_get(dev, "vddd");
> +	if (IS_ERR(tfa989x->vddd_supply))
> +		return dev_err_probe(dev, PTR_ERR(tfa989x->vddd_supply),
> +				     "Failed to get vddd regulator\n");
> +
>  	regmap = devm_regmap_init_i2c(i2c, &tfa989x_regmap);
>  	if (IS_ERR(regmap))
>  		return PTR_ERR(regmap);
>  
> +	ret = regulator_enable(tfa989x->vddd_supply);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable vddd regulator: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = devm_add_action_or_reset(dev, tfa989x_regulator_disable, tfa989x);
> +	if (ret)
> +		return ret;
> +
>  	/* Bypass regcache for reset and init sequence */
>  	regcache_cache_bypass(regmap, true);
>  
> -- 
> 2.31.1
> 
> 
> 
