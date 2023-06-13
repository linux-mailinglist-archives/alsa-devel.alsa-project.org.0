Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6F072E4B1
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 15:56:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A458CE74;
	Tue, 13 Jun 2023 15:55:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A458CE74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686664605;
	bh=rKh1x9qpHdbNWIQvWWCYtv9D6lRd1rF6C9UFrQxZOQw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OX+aQipiploT9zNHrpoZ1HcB9mTVZHMgml5ecxKiS4QUP0sxnD71AvICSlENFu4EY
	 3S71CxLdZ7b0Es+h0OuKI6Qs4MqT90VPPvHvRtZUgfoyqqZ7CX/XHODm45fsxdLYht
	 aPwx9BcQwHSwHI4Ldjo8Pnb0JsgyTpV8BfprZiPs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68148F8025E; Tue, 13 Jun 2023 15:55:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0138FF80132;
	Tue, 13 Jun 2023 15:55:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7C9CF80149; Tue, 13 Jun 2023 15:55:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87C93F80130
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 15:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87C93F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QftuhZpB
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686664546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RInDDoo3F9fiMPBADCTZLN5rnGkLVd2Za/vXzH5dQ/c=;
	b=QftuhZpBqsP2B3CLtbE+wTeYh7Ogb7O3ewjH04cfBt5faJ/2C8x9gR0fuovseLhV3B/PDv
	DKpPbwBXTC+TbwcGQAHA26J2W0Vw8N9x8r1MHClpBAdzHAbVHEQuMnHznYF9/7ZOLSSVjX
	lhbelEMGkjLCZyKrjKlCGVyaV9HEL0G1HGOM+QCIubSlqCF9t0w9K105iVk6FKH28bXUOu
	7tDDfVQMuPE9ZtJLoE0CHP2zvQgrE5tEYFnG3EYNbqsDnp4XIjjpnbVqD1RMTK7/BOCv2t
	ckKTpXK24XRaJX2Wvf58rEtLKsMEDUo+A9lNzZpsNp49wfS5V6B+NyWSSy/1lA==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0A751BF219;
	Tue, 13 Jun 2023 13:55:41 +0000 (UTC)
Date: Tue, 13 Jun 2023 15:55:36 +0200
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
Message-ID: <20230613155536.7ce2d1db@bootlin.com>
In-Reply-To: 
 <CAHp75Vd0SNY6XgKwS5j74VftY46MDQ9=Zc3wXwGLOiMc_ZX8Ow@mail.gmail.com>
References: <20230612122926.107333-1-herve.codina@bootlin.com>
	<20230612122926.107333-12-herve.codina@bootlin.com>
	<CAHp75Vfz+vSJ7rQ4sxb0R+zRbrjipXUX3VpaHyvOWWePdPxejQ@mail.gmail.com>
	<20230613113707.0b5d9648@bootlin.com>
	<CAHp75Vd0SNY6XgKwS5j74VftY46MDQ9=Zc3wXwGLOiMc_ZX8Ow@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RQH3SV26LO3I2TT53VTZPXG7NXCIZP3Y
X-Message-ID-Hash: RQH3SV26LO3I2TT53VTZPXG7NXCIZP3Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RQH3SV26LO3I2TT53VTZPXG7NXCIZP3Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Jun 2023 16:24:58 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Tue, Jun 13, 2023 at 12:37 PM Herve Codina <herve.codina@bootlin.com> wrote:
> > On Mon, 12 Jun 2023 17:37:00 +0300
> > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:  
> 
> ...
> 
> > > > +       struct snd_kcontrol_new control = {0};  
> > >
> > > 0 is not needed.  
> >
> > Not for this one.
> >
> > The variable is in stack.
> > Some of the structure members will be set in the code but we need to ensure
> > that all others are set to 0.  
> 
> Yes, and as I said, 0 is not needed. Compiler assumes that if you just
> use plain {}.
> 

My bad, sorry, I misunderstood.
Will be update to an empty {} in the next iteration.

Thanks,
Hervé


-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
