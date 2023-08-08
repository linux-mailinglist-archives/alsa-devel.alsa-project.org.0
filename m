Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 659EA77393C
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 11:07:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A29E82B;
	Tue,  8 Aug 2023 11:06:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A29E82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691485641;
	bh=OvdF5z6WuPl1P5QAod+2PgSczL5ie2gRUQU8jlDIft0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Eh4/TIlsKS86CqMV6X8Aq1zrvKn0FXK0Ys5gIvwMJbeKbhkPwH2FxeZ/h0MzqU+fV
	 xi3bigixtqJumV/rB3ykaZh9++RwDWizmtuTuaG2vnoKpiJY8ydjHS+5AfLG1u6Uo6
	 4jUywlU0dejA/OmCIF+NEQhFYzkiMDOBv+Ylug4g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AA66F80544; Tue,  8 Aug 2023 11:06:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F8F4F80154;
	Tue,  8 Aug 2023 11:06:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82C97F80534; Tue,  8 Aug 2023 11:06:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 936C5F800FE
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 11:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 936C5F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=flZfpRXq
Received: by mail.gandi.net (Postfix) with ESMTPSA id 167A31C000E;
	Tue,  8 Aug 2023 09:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691485578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yV4jZ6QrskrDU/HVotl7NEUNo5CW4ftnk7BIqgEB1+w=;
	b=flZfpRXqaC4cOa0lUVXQGmj6OEssvWZubCe2w5MHqI8U2vWQwtOj0FQFAqgAJBxJ8I75XZ
	I0TZlmNSRmqSWR5xLTIKJ/1FDCZ4stZY0pIriPzLH17o1+eZR+fqsAFgkHhfKw1IeHA6F/
	BRImFTSpS5Rv0R1y0afDagZYKTek8UGg0TZs9w8hjDyqKGA3Umv42FjNTa+dNkNUSu3Gue
	Tx2D6FfesdOvac81rHxEHFQ6xKJfocvJHBN0OnBZAPqs83Owy9ptNTQG7K7UjxPB67/rcA
	8c/v/aUZh+TVfJDMed/1Ph30nJadiv+LXoAjitpDUEWw4zjs+hG26YAH/4HjPQ==
Date: Tue, 8 Aug 2023 11:06:13 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang
 Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Randy Dunlap
 <rdunlap@infradead.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 26/28] ASoC: codecs: Add support for the framer codec
Message-ID: <20230808110613.07e222a3@bootlin.com>
In-Reply-To: <a1b5120b-feb0-5c87-0605-e1e170d9268d@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-27-herve.codina@bootlin.com>
	<a1b5120b-feb0-5c87-0605-e1e170d9268d@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: EVYSCQGB2PDBCWL7OE4HXASI6NDCIMAB
X-Message-ID-Hash: EVYSCQGB2PDBCWL7OE4HXASI6NDCIMAB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EVYSCQGB2PDBCWL7OE4HXASI6NDCIMAB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 8 Aug 2023 08:26:16 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Le 26/07/2023 à 17:02, Herve Codina a écrit :
> > The framer codec interracts with a framer.
> > It allows to use some of the framer timeslots as audio channels to
> > transport audio data over the framer E1/T1/J1 lines.
> > It also reports line carrier detection events through the ALSA jack
> > detection feature.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> See below
> 
> > +static int framer_dai_hw_rule_channels_by_format(struct snd_soc_dai *dai,
> > +						 struct snd_pcm_hw_params *params,
> > +						 unsigned int nb_ts)
> > +{
> > +	struct snd_interval *c = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
> > +	snd_pcm_format_t format = params_format(params);
> > +	struct snd_interval ch = {0};
> > +
> > +	switch (snd_pcm_format_physical_width(format)) {
> > +	case 8:
> > +		ch.max = nb_ts;
> > +		break;
> > +	case 16:
> > +		ch.max = nb_ts / 2;
> > +		break;
> > +	case 32:
> > +		ch.max = nb_ts / 4;
> > +		break;
> > +	case 64:
> > +		ch.max = nb_ts / 8;
> > +		break;
> > +	default:
> > +		dev_err(dai->dev, "format physical width %u not supported\n",
> > +			snd_pcm_format_physical_width(format));
> > +		return -EINVAL;
> > +	}  
> 
> What about
> 
> 	width = snd_pcm_format_physical_width(format);
> 
> 	if (width == 8 || width == 16 || width == 32 || width == 64) {
> 		ch.max = nb_ts * 8 / width;
> 	} else {
> 		dev_err(dai->dev, "format physical width %u not supported\n", width);
> 		return -EINVAL;
> 	}
> 

Yes, indeed.
Will be changed in the next iteration.

Regards,
Hervé
