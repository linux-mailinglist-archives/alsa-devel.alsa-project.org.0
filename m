Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 571AE7791D1
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 16:27:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2F9F1DA;
	Fri, 11 Aug 2023 16:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2F9F1DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691764067;
	bh=2WaUJzJkXuwZB5Q1vSSpWM3U+LO+IToRDHKbdOJcf98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y6HhKk8rWhv95vdinaf3UD+jk3EfD+/oaPQo84mMtpknlc+9JYAJH5UNd2Fldcc3h
	 x4lKR/76TjdfLQiCb/gZwCdFfSoj96xCQOsRYj4aXyOkmdL9zWaZjZ5E6C/tWSTxdu
	 Sr1q0u8AEpKTBYIOhx6jZ7bmyn43ftqL3YgTqssU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA1A6F80551; Fri, 11 Aug 2023 16:26:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EB64F80134;
	Fri, 11 Aug 2023 16:26:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12BDEF80166; Fri, 11 Aug 2023 16:26:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out-71.mta1.migadu.com (out-71.mta1.migadu.com
 [IPv6:2001:41d0:203:375::47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0E0CF80016
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 16:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0E0CF80016
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=od31vtjh
Date: Sat, 12 Aug 2023 00:26:15 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691764002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ThgEcDB8JUzTndOqcy+Y5WmjStMnn8tsicZSZ/0y+p8=;
	b=od31vtjhsH6yLn0+f3Xn0B057WY6B0uUIZNA7ZxIVUHn99CyOCcNo4Geoykt07xRnCEC31
	ka1/woyaNakdNOs2NcizNBfqnLz8fDOLplrgacm7xqsLMlfvfFjA7QN6EZM4BQS0vl2baP
	vTTn/X8N6ebfa49tNWutNpONQEN+XRiTBNKJNGlxy4ICIRmtvRIll1QXRaV9AOS2wj7q59
	wrr2r25yZb8S8kKtY0mGcdcd8byttl441GzZeVzKWlyWzQXu5U8JhCxVp8FUTdlznU1m8U
	8ElCWg83QMYTMI6IZExxwzGZpblilcv01CxXMrPGNnvE9Dnnoy3CUOFDkhimqA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: wlf,wm8782: Add max-rate property
Message-ID: <ZNZFB2-kBrpnMSn1@titan>
References: <20230810224930.3216717-1-contact@jookia.org>
 <20230810224930.3216717-4-contact@jookia.org>
 <ZNY+x/R8/T5ysPhy@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNY+x/R8/T5ysPhy@finisterre.sirena.org.uk>
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: XQCWCTVIV64BSK3BEWT72BY26D6MTRBX
X-Message-ID-Hash: XQCWCTVIV64BSK3BEWT72BY26D6MTRBX
X-MailFrom: contact@jookia.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XQCWCTVIV64BSK3BEWT72BY26D6MTRBX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Aug 11, 2023 at 02:59:35PM +0100, Mark Brown wrote:
> On Fri, Aug 11, 2023 at 08:49:30AM +1000, John Watts wrote:
> 
> > + - max-rate    : max supported audio rate configured by FSAMPEN pin, defaults to 48000
> 
> This seems like a cumbersome and error prone way to configure this - why
> not just have the binding specify the state of the pin?  That's just a
> boolean high/low whereas this requires getting the rate right and then
> having the driver validate it.

Hi there, the pin is tristate, Z, 0 and 1. How would that be represented?

John.
