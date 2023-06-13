Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 180C472DDF0
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 11:38:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 660C0828;
	Tue, 13 Jun 2023 11:37:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 660C0828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686649127;
	bh=XZ+tMOyCj7A6zWh3FIKLwNwu1RjF2Fbolep0ySTPB9s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RjN/VnV9Pd5znRqXHaqcX0u++9k2T53HHcDV6rdCS2DXgiNiGVXgc9ql9PbR+++W3
	 vMGd5etTKldR1SdpTxPa0LBB/waqvwO/lew7/5BOhKBQAa4IqDht49J2bKrgkPrAvu
	 wGj1yi2wdFfC5kq4Hf9b1ki8HylyXaxgsCyK1OdY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35FB4F8052E; Tue, 13 Jun 2023 11:37:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3938BF80149;
	Tue, 13 Jun 2023 11:37:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98199F80155; Tue, 13 Jun 2023 11:37:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69F29F800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 11:37:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69F29F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cI4E+0KO
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686649030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eEwfBJFCHzxYRQZi7kEFO2bxAicvTJZZs7UatO3IpJY=;
	b=cI4E+0KOLchkY75M01qJZk03RB9OYLGMIknmHlekjZAFP9rMQm4qdF0plxkJvW4o0wQb3V
	aeOKu0+VWSa+XUy0hxzF17L3AyuurA1xLK/8403rCjD34EdOaVFxFBuQvaoGKhfT+sU63P
	8VpipIM3aay0z2B77mUXpat210sCtstH5/ByVej4cne+lLryxekrqE9YtnGoHCkfJT++U4
	j32ezAkUWMdd4ILDfcxzg+8fI0CcCMTB5bVwNzI2mAYfMyHvynBFzTYu6avs8GGNEzTdtz
	UXB3+Crd46nY2Qsey6k71iqGnlTyj5iGRVCQH/sTtqBREr1QCPP6SeOKDt9EZw==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76FB11C0005;
	Tue, 13 Jun 2023 09:37:08 +0000 (UTC)
Date: Tue, 13 Jun 2023 11:37:07 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 11/12] ASoC: codecs: Add support for the generic IIO
 auxiliary devices
Message-ID: <20230613113707.0b5d9648@bootlin.com>
In-Reply-To: 
 <CAHp75Vfz+vSJ7rQ4sxb0R+zRbrjipXUX3VpaHyvOWWePdPxejQ@mail.gmail.com>
References: <20230612122926.107333-1-herve.codina@bootlin.com>
	<20230612122926.107333-12-herve.codina@bootlin.com>
	<CAHp75Vfz+vSJ7rQ4sxb0R+zRbrjipXUX3VpaHyvOWWePdPxejQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: R7W225PCISERKU5TQN2MHM56CYO6CZDJ
X-Message-ID-Hash: R7W225PCISERKU5TQN2MHM56CYO6CZDJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R7W225PCISERKU5TQN2MHM56CYO6CZDJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andy,

On Mon, 12 Jun 2023 17:37:00 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> ...
> 
> > +       struct snd_kcontrol_new control = {0};  
> 
> 0 is not needed.

Not for this one.

The variable is in stack.
Some of the structure members will be set in the code but we need to ensure
that all others are set to 0.

The full context:
--- 8< ---
static int audio_iio_aux_add_controls(struct snd_soc_component *component,
				      struct audio_iio_aux_chan *chan)
{
	struct snd_kcontrol_new control = {0};

	control.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
	control.name = chan->name;
	control.info = audio_iio_aux_info_volsw;
	control.get = audio_iio_aux_get_volsw;
	control.put = audio_iio_aux_put_volsw;
	control.private_value = (unsigned long)chan;

	return snd_soc_add_component_controls(component, &control, 1);
}
--- 8< ---

Thanks for the review,
Hervé
