Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E28722606
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 14:37:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B7B3825;
	Mon,  5 Jun 2023 14:36:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B7B3825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685968623;
	bh=+pcYwVX25f4OuHnjgeoeS1ElCeIHGyJ5TTPkdAIkaOM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M7I1LDd4O5EEWAQr12zaKQipzB6HmkTt0/SBL7ytMyiq++0soV8NTrPGdPxxk2Th1
	 t0S+K2Bhdg6HH9h2IZZKe3Wzcvy0cG/+ohEs2q4mWgcOdimmuSwj/vIxn6sY8WodBK
	 TRs9gB+WVuTTP1D/npFg42EQWjg1bXMSTjoWgII0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECC0BF80544; Mon,  5 Jun 2023 14:35:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6242DF8016C;
	Mon,  5 Jun 2023 14:35:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78F5DF80199; Mon,  5 Jun 2023 14:35:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D164BF80130
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 14:35:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D164BF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y3PTcyCD
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685968540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=euSzWbdAJIhobvITCThSqCY0UiRHVup0lZuS9yKCiCI=;
	b=Y3PTcyCD1Xh1PS3bwIAeEasa8DsJNB6JUDLbYfgzXu4kJnbAOccGVoygE4DmyImLDLzv/N
	ykGK7bH96jGj1PFLEx/TTVTHTqG1kWdumuw1YrLn9FxhVruYnQWyqsDFGwU/PuoE1ZvTnl
	Zmu1FjT9tzN0ZA4RIuooqFWksce2JYGokae0dLwVm/EwXWowEniZESfui4bjrCs0xWqgjI
	GDj3H4NH25F+uUfMQrrznoZsuEeRGUd0DWy/EiqyZlb+qB3yHKGy/8w9YNEDiXJfIWNayP
	engkRUb60X+hNYH7z9M1j1WNapxP6RUdP7b4p0DeeZZt7Q+Esx+pxmLaQSq08w==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A38AE000C;
	Mon,  5 Jun 2023 12:35:37 +0000 (UTC)
Date: Mon, 5 Jun 2023 14:35:36 +0200
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
Subject: Re: [PATCH v2 6/9] ASoC: soc-dapm.h: Add a helper to build a DAPM
 widget dynamically
Message-ID: <20230605143536.5a3b5bbe@bootlin.com>
In-Reply-To: <ZHtJLxNReoc4Yjqj@surfacebook>
References: <20230523151223.109551-1-herve.codina@bootlin.com>
	<20230523151223.109551-7-herve.codina@bootlin.com>
	<ZHtJLxNReoc4Yjqj@surfacebook>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YBIRH46MLILO6J2X32FVLTOWDWTGSHLK
X-Message-ID-Hash: YBIRH46MLILO6J2X32FVLTOWDWTGSHLK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YBIRH46MLILO6J2X32FVLTOWDWTGSHLK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andy,

On Sat, 3 Jun 2023 17:07:43 +0300
andy.shevchenko@gmail.com wrote:

> Tue, May 23, 2023 at 05:12:20PM +0200, Herve Codina kirjoitti:
> > The SND_SOC_DAPM_* helpers family are used to build widgets array in a
> > static way.
> > 
> > Introduce SND_SOC_DAPM_WIDGET() in order to use the SND_SOC_DAPM_*
> > helpers family in a dynamic way. The different SND_SOC_DAPM_* parameters
> > can be computed by the code and the widget can be built based on this
> > parameter computation.
> > For instance:
> >   static int create_widget(char *input_name)
> >   {
> > 	struct snd_soc_dapm_widget widget;
> > 	char name*;
> > 	...
> > 	name = input_name;
> > 	if (!name)
> > 		name = "default";
> > 
> > 	widget = SND_SOC_DAPM_WIDGET(SND_SOC_DAPM_INPUT(name));
> > 	...
> >   }  
> 
> Maybe instead of adding a helper, simply convert those macros to provide
> a compaund literal? (See, for example,
> https://elixir.bootlin.com/linux/v6.4-rc4/source/include/linux/pinctrl/pinctrl.h#L42)
> 

Yes, I will convert them in the next iteration.

Thanks for the review,
Hervé
