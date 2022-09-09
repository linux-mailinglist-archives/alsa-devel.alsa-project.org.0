Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EE25B3C49
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 17:45:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A20E1654;
	Fri,  9 Sep 2022 17:44:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A20E1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662738324;
	bh=vBYV9fjF8zV5w/TSyLZajAwIpYMMV6AQ/kbJjsBNSIo=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ahb7+0VivL9elhqZUPKdGax/dCrom3rwlMKO2TfB+qrf2utWUz1TWWZR6gc2xg5oI
	 s52UIU98OQyCgryvHBnEU1P69GFx+Php4JBYa8d/5s28YhUtQ33EJDdv5Mxlz+Kh/1
	 4gsR/2YmoHVylGDbXF8qFu/4Ftc+CMXspMGKffrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD1E9F8032B;
	Fri,  9 Sep 2022 17:44:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 538BFF8023A; Fri,  9 Sep 2022 17:44:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABC84F8011C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 17:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABC84F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="n2eWeH6Z"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1662738255; bh=iQf3eHuSRWeGotbEYofBZciMp+NjvuT3Kv1h/4d/X3M=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=n2eWeH6ZvPApY9mJ0yKUXl1e12MAK+7kor4NjJZ6CufN8lt/yiaXpx8DrOKCJHWU+
 ruPpKHk10oPnza/ORTzLinO+9fJU1PvwkRit9928gEFuRIODfVqk4B/wWs5IzJ0HNz
 MzbcedJpnccEHAPsnk8WWsu3dbsSjobljAn8uTy8=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 07/10] ASoC: cs42l42: Split I2C identity into separate
 module
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <aabae52f-8230-f837-c17a-59d781b5af62@opensource.cirrus.com>
Date: Fri, 9 Sep 2022 17:44:14 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <5C349ED8-BD51-40BA-BD02-A44FBBEF9C52@cutebit.org>
References: <20220909135334.98220-1-povik+lin@cutebit.org>
 <20220909135334.98220-8-povik+lin@cutebit.org>
 <aabae52f-8230-f837-c17a-59d781b5af62@opensource.cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, devicetree@vger.kernel.org,
 - <patches@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, David Rhodes <david.rhodes@cirrus.com>,
 ChiYuan Huang <cy_huang@richtek.com>, Rob Herring <robh+dt@kernel.org>,
 asahi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 James Schulman <james.schulman@cirrus.com>, Matt Flax <flatmax@flatmax.com>
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


> On 9. 9. 2022, at 17:40, Richard Fitzgerald <rf@opensource.cirrus.com> =
wrote:
>=20
> On 09/09/2022 14:53, Martin Povi=C5=A1er wrote:
>> +static int cs42l42_i2c_probe(struct i2c_client *i2c_client)
>> +{
>> +	struct device *dev =3D &i2c_client->dev;
>> +	struct cs42l42_private *cs42l42;
>> +	struct regmap *regmap;
>> +	int ret;
>> +
>> +	cs42l42 =3D devm_kzalloc(dev, sizeof(*cs42l42), GFP_KERNEL);
>> +	if (!cs42l42)
>> +		return -ENOMEM;
>> +
>> +	regmap =3D devm_regmap_init_i2c(i2c_client, &cs42l42_regmap);
>> +	if (IS_ERR(regmap)) {
>> +		ret =3D PTR_ERR(regmap);
>> +		dev_err(&i2c_client->dev, "regmap_init() failed: %d\n", =
ret);
>> +		return ret;
>> +	}
>> +
>> +	cs42l42->dev =3D dev;
>> +	cs42l42->regmap =3D regmap;
>> +	cs42l42->irq =3D i2c_client->irq;
>> +
>> +	ret =3D cs42l42_common_probe(cs42l42, &cs42l42_soc_component, =
&cs42l42_dai);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D cs42l42_init(cs42l42);
>> +	if (ret)
>> +		cs42l42_common_remove(cs42l42);
>=20
> This introduces a bug that regulator_bulk_disable() is called
> twice if there is an error.
>=20
> cs42l42_init() was supposed to clean up if it returns an error, which
> it nearly does, but my original patch is missing the call to =
free_irq()
> in the error paths of cs42l42_init().

Ah! I didn=E2=80=99t inspect it closely enough then, I only ran into the =
missing
free_irq.

Martin

