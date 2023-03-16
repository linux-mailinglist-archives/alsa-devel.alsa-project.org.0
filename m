Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F05476BD598
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 17:30:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CD05109F;
	Thu, 16 Mar 2023 17:29:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CD05109F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678984205;
	bh=k/b1aHop4pw4H4A/g01EAMkT0bmn4FBdxp50LXt0CJo=;
	h=Date:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=OUnumNtBNyrlbL6ddiGnjsKdE5dhvI7lYsc6feWK2oWcSUbACMOBqdnQmIdbZ6yLQ
	 HlhobEImNSXpA6upYwINBrpT8YiF85f2ghIAuYXXxQ9k9Cq/JhiI4J+Xmt6Nd572y6
	 03uIQIAa54NcG8wU0BJ3zeUn5THH9P5fc3chPJcU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03584F8032D;
	Thu, 16 Mar 2023 17:29:15 +0100 (CET)
Date: Thu, 16 Mar 2023 17:29:00 +0100
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/7] drivers: misc: Add support for the Lantiq
 PEF2256 framer
In-Reply-To: <ZBMQTxFsrKQesd4v@kroah.com>
References: <20230316122741.577663-1-herve.codina@bootlin.com>
	<20230316122741.577663-3-herve.codina@bootlin.com>
	<ZBMQTxFsrKQesd4v@kroah.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K6JYDZJ2N2QBMPNRT5ECWLDPGR4PSRSN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167898415428.26.12040884489691786607@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CE66F80423; Thu, 16 Mar 2023 17:29:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E72B8F800C9
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 17:29:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E72B8F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mXFzboS0
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CF611FF811;
	Thu, 16 Mar 2023 16:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678984143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jeRzDs4ihJbeI7tp32i3vf2hG703FkbCNPgA50D/FNA=;
	b=mXFzboS07wKLrh31pNwHjrVSBN14J/n9oejyp51jQ/bRh1ex0pQ7a21J4KKzxljg005gqX
	pp45HUxC6IHCfX+F8PGrmOOe/FB8XqVLKHmpyjW1yXy3R2vmaaqTe+RfLiqjIa572fiwh1
	RiXLGu+b5LQW2DT+RLrmq9+oiqzS89YrL38unneeJIJ+7SpG81P2m+vSnxwz88EdkoB1sF
	VyzyCQSwkEHO3RqJ+C/o/N3qLhutNpOSA87VuQciRtJpa83iHr0vAJYZb7YRZTLMvqUb8f
	K4JbNS/lXslxJ//oyVuBGcG7p/c1fqW0TZPO/CAIRgW7v1iHsyAMjBZ955oItA==
Date: Thu, 16 Mar 2023 17:29:00 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/7] drivers: misc: Add support for the Lantiq
 PEF2256 framer
Message-ID: <20230316172900.2bb49a13@bootlin.com>
In-Reply-To: <ZBMQTxFsrKQesd4v@kroah.com>
References: <20230316122741.577663-1-herve.codina@bootlin.com>
	<20230316122741.577663-3-herve.codina@bootlin.com>
	<ZBMQTxFsrKQesd4v@kroah.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: K6JYDZJ2N2QBMPNRT5ECWLDPGR4PSRSN
X-Message-ID-Hash: K6JYDZJ2N2QBMPNRT5ECWLDPGR4PSRSN
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
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K6JYDZJ2N2QBMPNRT5ECWLDPGR4PSRSN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Greg,

On Thu, 16 Mar 2023 13:49:19 +0100
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Thu, Mar 16, 2023 at 01:27:36PM +0100, Herve Codina wrote:
> > +EXPORT_SYMBOL(pef2256_get_byphandle); =20
>=20
> You have a mixture of EXPORT_SYMBOL() and EXPORT_SYMBOL_GPL() in the
> same file here.  As this one:
>=20
> > +
> > +void pef2256_put(struct pef2256 *pef2256)
> > +{
> > +	put_device(pef2256->dev);
> > +}
> > +EXPORT_SYMBOL(pef2256_put); =20
>=20
> Is just a wrapper around a EXPORT_SYMBOL_GPL() function, please revisit
> and perhaps make them all EXPORT_SYMBOL_GPL() calls?
>=20

Indeed.
I will make them consistent in the v3 series.

Thanks for pointing that out.
Herv=C3=A9
--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
