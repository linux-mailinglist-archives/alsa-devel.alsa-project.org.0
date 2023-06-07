Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6988772612D
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 15:24:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 731E074C;
	Wed,  7 Jun 2023 15:23:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 731E074C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686144253;
	bh=sGI/xnjEdJjhlgy1a1nVNMn80wiTXNRLveVU6arqZJw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vqGYeTVWmenAahplwQDnkBTalyQ4yhUGe5GwDCrWs1bcMNQvQKiUkMG3FXKFwC6Zx
	 iLduvi2dZB5hktnbkiJabX5HvDPL4+nB7tVZTmj9N1sbLYJXbgmbsjM7MjcUChZK+M
	 YoauNCwQaGnV6r7rlean0y5AqkkMVolWRi0Isez4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C36B3F804DA; Wed,  7 Jun 2023 15:23:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A5EEF8016C;
	Wed,  7 Jun 2023 15:23:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C93C8F80199; Wed,  7 Jun 2023 15:23:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94580F80155
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 15:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94580F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jyfk1DMy
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686144191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=upXsJBaOapv3HfJgv1RgsURS5W6Qd+6TPxSPKkAE5j8=;
	b=jyfk1DMy8T+5r8MYSOQUudfcbk5sSXz5MeduU4Kee3pdk9FYRkqe9M7/Z7PZvEH0IpOZVG
	dZFuCOQskx1e/WzL0LIjkwDW2kG2L13bG0KMLcYUb3y5VOjjs0k18C17jfGkGJap7wuDHm
	F0qwd/wZyVlfhOHnZDqB51cFWB1Nz0y46LfhPiUacRrQxPYi19zNIfnC2a2lXo/dLsQK/k
	C7UiW/tl3AWH55f6nX1gHlGy792zZA6c1obgpiR9NYYuhiVpkxJEo3q6Cj2SDtQk07SXMV
	QcCtdd7gDT9P6zErA+YK7QicVFwQraPa6P9bli7/8OPC39m7MZWw0j2Wq1AcCQ==
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F55940017;
	Wed,  7 Jun 2023 13:23:09 +0000 (UTC)
Date: Wed, 7 Jun 2023 15:23:08 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: andy.shevchenko@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 7/9] ASoC: codecs: Add support for the generic IIO
 auxiliary devices
Message-ID: <20230607152308.02b404e1@bootlin.com>
In-Reply-To: <20230606155404.28ada064@bootlin.com>
References: <20230523151223.109551-1-herve.codina@bootlin.com>
	<20230523151223.109551-8-herve.codina@bootlin.com>
	<ZHuFywIrTnEFpX6e@surfacebook>
	<20230606155404.28ada064@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JJD2DS4766OKY2AOJDC366RPCOKJG54W
X-Message-ID-Hash: JJD2DS4766OKY2AOJDC366RPCOKJG54W
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JJD2DS4766OKY2AOJDC366RPCOKJG54W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andy,

On Tue, 6 Jun 2023 15:54:04 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

...
> >   
> > > +	platform_set_drvdata(pdev, iio_aux);    
> > 
> > Which callback is using this driver data?  
> 
> None -> I will remove platform_set_drvdata().
> 

My previous answer was not correct.
The platform_set_drvdata() call is needed.

In fact, the driver uses snd_soc_component_get_drvdata() 
  https://elixir.bootlin.com/linux/v6.4-rc5/source/include/sound/soc-component.h#L425
and this snd_soc_component_get_drvdata() get the driver data set by the
platform_set_drvdata() call.

I cannot use snd_soc_component_set_drvdata() to set the driver data because
I haven't got the struct snd_soc_component instance when I need to set the
driver data.

So, I will not remove the platform_set_drvdata() call.

The sequence is:
  --- 8< ---
  static int audio_iio_aux_probe(struct platform_device *pdev)
  {
	struct audio_iio_aux *iio_aux;

	iio_aux = devm_kzalloc(&pdev->dev, sizeof(*iio_aux), GFP_KERNEL);
	if (!iio_aux)
		return -ENOMEM;

	...

	platform_set_drvdata(pdev, iio_aux);

	return devm_snd_soc_register_component(iio_aux->dev,
					       &audio_iio_aux_component_driver,
					       NULL, 0);
  }
  --- 8< ---

The struct snd_soc_component instance will be create during the 
devm_snd_soc_register_component() call.

Regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
