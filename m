Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9081471187E
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 22:53:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 547301FC;
	Thu, 25 May 2023 22:52:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 547301FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685048020;
	bh=jAcuNet3WnTKkxf1bcIBxk1dsgzjCeCWRcKPNcLDGu8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g3jfggV69YXYEwv974BLRPJXjeERHCIsUqDGBpEiKBXYqe7fMf+Eaba+tL83vcokk
	 zNS907788U41tPEGIFK2u1D3eoNfzZcsFmGqy41A6tWfEuiCggP0AkYxG7MKyH+pSq
	 D7DzquM9kjikBZd30V0yxXLK8ueWDv8rltZ2fUvA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA2FAF80249; Thu, 25 May 2023 22:52:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DF80F8016A;
	Thu, 25 May 2023 22:52:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F8A4F80249; Thu, 25 May 2023 22:52:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EEDFEF8001F
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 22:52:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEDFEF8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fUalf6GQ
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685047961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jAcuNet3WnTKkxf1bcIBxk1dsgzjCeCWRcKPNcLDGu8=;
	b=fUalf6GQHStHmVlCQb3CeQs3aX2uEwLvCEJ5St2MiUwCn5w11vpIJphwW43uxVjtnSsXMI
	fvV4S0rAIY6wCJkX5iWDg+4bWTjRFIHCuxVS4rEEEZr18UepWdc/dl9n34opElcOJX9LhT
	ov+f7AE1UGYNA9v7GeCjhlPfbOfMvxEfotMs51OYXSvvMYGh/iuv7GjdUmGBQUdQjLS0xE
	ZYqSIjyYJLDLJZSW09r7j9AINLVVklWdaWAI6Gi+rLUZi4FXip+Y28Gzo3r2onr6VV239v
	5t0QL/KPHJFX32DigzHylqrd9QYxdviGU/UWk30qRlNzD9Byc6KpFqx+cqt8Ng==
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4B6740004;
	Thu, 25 May 2023 20:52:36 +0000 (UTC)
Date: Thu, 25 May 2023 22:52:35 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Uwe =?UTF-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Johannes Berg <johannes@sipsolutions.net>, James Schulman
 <james.schulman@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, Lucas
 Tanure <tanureal@opensource.cirrus.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Wolfram Sang <wsa@kernel.org>, Krzysztof
 =?UTF-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sebastian Reichel
 <sebastian.reichel@collabora.com>, Adrien Grassein
 <adrien.grassein@gmail.com>, Peter Senna Tschudin <peter.senna@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Corey Minyard
 <cminyard@mvista.com>, linuxppc-dev@lists.ozlabs.org,
 alsa-devel@alsa-project.org, kernel@pengutronix.de,
 patches@opensource.cirrus.com
Subject: Re: [PATCH] sound: Switch i2c drivers back to use .probe()
Message-ID: <20230525225235.1c3dc475@booty>
In-Reply-To: <20230525203640.677826-1-u.kleine-koenig@pengutronix.de>
References: <20230525203640.677826-1-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VA7OHVWTRBCNFGBEW6GOO6576T6YHABQ
X-Message-ID-Hash: VA7OHVWTRBCNFGBEW6GOO6576T6YHABQ
X-MailFrom: luca.ceresoli@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VA7OHVWTRBCNFGBEW6GOO6576T6YHABQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Uwe,

On Thu, 25 May 2023 22:36:40 +0200
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
