Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCDF5B2F88
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 09:12:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33912169C;
	Fri,  9 Sep 2022 09:12:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33912169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662707577;
	bh=fN5LYgf8ykM66XFTITzzmVqEhmAPH3iXrdqrj8qdGJk=;
	h=Date:To:From:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=tVpI3I4ssXYIEe5117nggS7OzWRO7HNcWu5YrvLtqwufSuGAsrmthCVY+dTrt/Gfu
	 1xnc/BmTZ0wC5V2FbfFfY+Zvc+IeSizyLXEB2sHFtEegUqIu98LWG5ztXLqbGfj2YE
	 XkplVsgSZw/zzQQUQcrZSS0xyPL7AA9R1jpo31no=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEBB2F8016D;
	Fri,  9 Sep 2022 09:12:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7073CF80217; Thu,  8 Sep 2022 18:03:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40B19F800CB
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 18:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40B19F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="x6GE+uyo"
Date: Thu, 08 Sep 2022 16:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1662652990; x=1662912190;
 bh=fN5LYgf8ykM66XFTITzzmVqEhmAPH3iXrdqrj8qdGJk=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=x6GE+uyoD3POaXSPg0gguTpBqEEI5gJLCH1YRle7DioyW1D+icZfUMKNT8rMe7Vcp
 9Hx0qnxZIhRliRWcUQo/c3Q5DwdLxqtnYS9GOGHA4z1WvUYKniC/V31QFaeA3zPaMk
 DwzMxHQah37SbwvcgiT523+e/LrrHNMu2t4gwt9JBY3C6yvIW7LalfIno27HKMuQzr
 LA7I8quOeOLGrvQwEuehLU3200bBh/pKjlWd+QlTG+dmk5y15XK/cQFqpkKv/t/0Di
 eriqkyLXXiJ6szVaVg7UoyxZpiPEI/HijmRaMWMx/0XWy/NazjF0MntxpB8nRaMLoE
 I+KARfqUU4OQQ==
To: Richard Fitzgerald <rf@opensource.cirrus.com>
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Subject: Re: [PATCH 09/12] ASoC: cs42l42: Split I2C identity into separate
 module
Message-ID: <90D59877-4FED-483D-8581-85E017614A57@protonmail.com>
Feedback-ID: 6533334:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 09 Sep 2022 09:12:05 +0200
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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
Reply-To: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> On 19. 8. 2022, at 14:52, Richard Fitzgerald <rf@opensource.cirrus.com> w=
rote:
>
> Split the I2C bus driver definition and probe()/remove() into a
> separate module so that a Soundwire build of CS42L42 support does
> not have a spurious dependency on I2C.
>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---


> +static int cs42l42_i2c_probe(struct i2c_client *i2c_client)
> +{
> +=09struct device *dev =3D &i2c_client->dev;
> +=09struct cs42l42_private *cs42l42;
> +=09struct regmap *regmap;
> +=09int ret;
> +
> +=09cs42l42 =3D devm_kzalloc(dev, sizeof(*cs42l42), GFP_KERNEL);
> +=09if (!cs42l42)
> +=09=09return -ENOMEM;
> +
> +=09regmap =3D devm_regmap_init_i2c(i2c_client, &cs42l42_regmap);
> +=09if (IS_ERR(regmap)) {
> +=09=09ret =3D PTR_ERR(regmap);
> +=09=09dev_err(&i2c_client->dev, "regmap_init() failed: %d\n", ret);
> +=09=09return ret;
> +=09}
> +
> +=09cs42l42->dev =3D dev;
> +=09cs42l42->regmap =3D regmap;
> +=09cs42l42->irq =3D i2c_client->irq;
> +
> +=09ret =3D cs42l42_common_probe(cs42l42, &cs42l42_soc_component, &cs42l4=
2_dai);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return cs42l42_init(cs42l42);

The common_remove should probably be called here if the init fails.

Best,
Martin

> +}
> +
> +static int cs42l42_i2c_remove(struct i2c_client *i2c_client)
> +{
> +=09struct cs42l42_private *cs42l42 =3D dev_get_drvdata(&i2c_client->dev)=
;
> +
> +=09cs42l42_common_remove(cs42l42);
> +
> +=09return 0;
> +}

