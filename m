Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A736699F0
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 15:20:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B63FA6DA;
	Fri, 13 Jan 2023 15:19:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B63FA6DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673619629;
	bh=48ADDpQM9z/BZ40yXTCecgBCKKneMYXS0AEi6nY1rNY=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=uv+F09qLyR8pC/UuNppGQpgiHfEsRYaY0qDVjPiL9GnLl4xyXQsD8vODI18+Ltnw7
	 ztCwXsFQ6RYXObppPzyjMU0tkVh6N5XxMLSVvLMQJ9CQQNftcpNJXEQ5hvOxJ5MhEN
	 ljr7A/PgfjrDKMRohqvbf0gXkCEykhn2wgt2PM5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D36ADF803DC;
	Fri, 13 Jan 2023 15:19:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C36AF8030F; Fri, 13 Jan 2023 15:19:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 954ABF8016D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 15:19:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 954ABF8016D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pxDShVxp
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3A5AA60013;
 Fri, 13 Jan 2023 14:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1673619566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=48ADDpQM9z/BZ40yXTCecgBCKKneMYXS0AEi6nY1rNY=;
 b=pxDShVxpca+jED54OGgdBg2dQ/oLPtWL3k1XprzkQgOZNVmQB2J8anIbjl9TH5ndSi8EtM
 CVDwgeA/F1Rwz2aJFbe2d0uZMU8kwHdAq/sC33IEJYKedCQX6NkyE/Xhs6hNj1eFiczDsg
 MxGIigt6L9diQdCvI0t2FH80R9ieFCEml7Orp6TKOR/G0i2wQngnIXJH/3cpcfc6nQpN5s
 WO84G9SQyVaYOhrqgcXTjW5qRR9J30DCDtuvGO/9n2yWGs4irpkQLh+jnRHudKr2MV6S35
 T8m1yxS6wMWcU80yb9BPjOkelGxc9ooexqQI/4QwIZIxZRKqpr6PujFTFg8Q1Q==
Date: Fri, 13 Jan 2023 15:19:23 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] ASoC: codecs: Add support for the Renesas IDT821034
 codec
Message-ID: <20230113151923.086a0495@bootlin.com>
In-Reply-To: <Y8FVz/Mp5xSdI34a@sirena.org.uk>
References: <20230111134905.248305-1-herve.codina@bootlin.com>
 <20230111134905.248305-3-herve.codina@bootlin.com>
 <Y77DKSdZf27qE+xl@sirena.org.uk>
 <20230111174022.077f6a8c@bootlin.com>
 <Y774bY4icD8RuMnX@sirena.org.uk>
 <20230113090431.7f84c93a@bootlin.com>
 <Y8FVz/Mp5xSdI34a@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Mark,

On Fri, 13 Jan 2023 12:59:59 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Fri, Jan 13, 2023 at 09:04:31AM +0100, Herve Codina wrote:
>=20
> > For DAPM (struct snd_soc_dapm_widget), no kind of .put() and .get()
> > are available. I will use some Ids for the 'reg' value and use the
> > .write() and .read() hooks available in struct snd_soc_component_driver
> > in order to handle these Ids and so perform the accesses. =20
>=20
> That's what the event hooks are for - there's plenty of widgets using
> SND_SOC_NOPM as the register, look at those for examples.

Indeed, got it.
Thanks for pointing it.

Best regards,
Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
