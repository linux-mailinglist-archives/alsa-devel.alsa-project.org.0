Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D4D6E959F
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 15:16:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34DD4EC2;
	Thu, 20 Apr 2023 15:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34DD4EC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681996613;
	bh=W0XRVsZRn8MnGBzqA9Vn88IL3uHL7Yez2aWoVZLNraQ=;
	h=Date:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=CJOSDxyfqZrgueMzlQ6XLRlMkUuyU+5qQRJL0ya1HnxQa3jOKIEyyiftLg777hbk/
	 X3MWPG70CBMsesxfcjgXZupd43ZWgEn/QiBrUhUFp7LyAs69nz0Sr/IyIDjXUr2T/A
	 g96bMmIbJGin+uFEbkf1pFyr9ZVNlEGZ7/ru48B8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 834B1F80149;
	Thu, 20 Apr 2023 15:16:02 +0200 (CEST)
Date: Thu, 20 Apr 2023 15:15:51 +0200
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v6 3/7] mfd: Add support for the Lantiq PEF2256 framer
In-Reply-To: <20230420123946.GB996918@google.com>
References: <20230417171601.74656-1-herve.codina@bootlin.com>
	<20230417171601.74656-4-herve.codina@bootlin.com>
	<20230420123946.GB996918@google.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3GE3GRRS45VSEFK23S3JDK7CFVNOIJ3J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168199656108.26.1396823662275947841@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 781A0F80155; Thu, 20 Apr 2023 15:15:58 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DDC09F800AC
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 15:15:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDC09F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A8w0OSj2
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 74178E0010;
	Thu, 20 Apr 2023 13:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681996553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mf7ZEqMnInD6phgYGwpuLntMIV868d1BcFV7kNAFuVc=;
	b=A8w0OSj2lidc4EuDhnUnEMUC/NHZfLwRyj7eA83lolXTf53qJbKyic8Yv3rhKMDygbl4WF
	p2NJfK5N8QMejhgYTeOaP9QkzIpKaE5e6wtIXh1IzSYpnzgc4BtYax6no3RFnFSwbE4vus
	cJ+fsUcBVh5iUVLa2LUm1700tpoQG/jVKLuoBOIJYCT/GCSE+KM3HDFpdrMq9OAVAb6CnQ
	wcvK+YSh0O2bNi3fdKIWQIEFg1svQ/TlXw8nas68tktzXO1FYFqyXPjKEab0QM3SZTpSYq
	N+COI7tYKW1xpDCbCMnQCFr8Q75SwTIfIT/vRGSaoSbenxXe87w98XQGwrQ0Ww==
Date: Thu, 20 Apr 2023 15:15:51 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v6 3/7] mfd: Add support for the Lantiq PEF2256 framer
Message-ID: <20230420151551.78c1288b@bootlin.com>
In-Reply-To: <20230420123946.GB996918@google.com>
References: <20230417171601.74656-1-herve.codina@bootlin.com>
	<20230417171601.74656-4-herve.codina@bootlin.com>
	<20230420123946.GB996918@google.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3GE3GRRS45VSEFK23S3JDK7CFVNOIJ3J
X-Message-ID-Hash: 3GE3GRRS45VSEFK23S3JDK7CFVNOIJ3J
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3GE3GRRS45VSEFK23S3JDK7CFVNOIJ3J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 20 Apr 2023 13:39:46 +0100
Lee Jones <lee@kernel.org> wrote:

> On Mon, 17 Apr 2023, Herve Codina wrote:
> 
> > The Lantiq PEF2256 is a framer and line interface component designed to
> > fulfill all required interfacing between an analog E1/T1/J1 line and the
> > digital PCM system highway/H.100 bus.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  drivers/mfd/Kconfig         |  16 +
> >  drivers/mfd/Makefile        |   1 +
> >  drivers/mfd/pef2256-regs.h  | 250 ++++++++++
> >  drivers/mfd/pef2256.c       | 950 ++++++++++++++++++++++++++++++++++++  
> 
> 95% of this driver needs to be moved somewhere else.
> 
> What is a Framer?  Perhaps sound/ is a good candidate?

The pef2256 framer is a device that transfers data to/from a TDM (time-slots
data) from/to quite old telecommunication lines (E1 in my case).
Several subsystem can set/get data to/from the TDM. Each device using their
own time-slots set.

On my use-case, I have some audio consumer and a not yet upstreamed HDLC
consumer. Both of them uses the framer to know the E1 link state.
The framer needs to be initialized 'globally' and not by a specific consumer
as several consumers can use the framer.

> 
> >  include/linux/mfd/pef2256.h |  52 ++
> >  5 files changed, 1269 insertions(+)
> >  create mode 100644 drivers/mfd/pef2256-regs.h
> >  create mode 100644 drivers/mfd/pef2256.c
> >  create mode 100644 include/linux/mfd/pef2256.h  
> 
> [...]
> 
> > +static int pef2256_add_audio_devices(struct pef2256 *pef2256)
> > +{
> > +	const char *compatible = "lantiq,pef2256-codec";
> > +	struct mfd_cell *audio_devs;
> > +	struct device_node *np;
> > +	unsigned int count = 0;
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	for_each_available_child_of_node(pef2256->dev->of_node, np) {
> > +		if (of_device_is_compatible(np, compatible))
> > +			count++;
> > +	}  
> 
> Converting Device Tree nodes into MFD cells to register with the
> Platform Device API is not a reasonable use-case of MFD.
> 
> Have the CODEC driver match on "lantiq,pef2256-codec" and let it
> instantiate itself.

As the framer is going to used by several subsystem, I cannot instantiate
it in the specific ASoC subsystem.

> 
> Your first version using of_platform_populate() was closer to the mark.

The issue was that I need MFD cells for the pinctrl part.

> 
> > +	if (!count)
> > +		return 0;
> > +
> > +	audio_devs = kcalloc(count, sizeof(*audio_devs), GFP_KERNEL);
> > +	if (!audio_devs)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < count; i++) {
> > +		(audio_devs + i)->name = "lantiq-pef2256-codec";
> > +		(audio_devs + i)->of_compatible = compatible;
> > +		(audio_devs + i)->id = i;
> > +	}
> > +
> > +	ret = mfd_add_devices(pef2256->dev, 0, audio_devs, count, NULL, 0, NULL);
> > +	kfree(audio_devs);
> > +	return ret;
> > +}  
> 

Best regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
