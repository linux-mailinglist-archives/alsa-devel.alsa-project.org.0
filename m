Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 767DA84966E
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Feb 2024 10:27:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36E91844;
	Mon,  5 Feb 2024 10:27:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36E91844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707125258;
	bh=rHMp+3HUl38fXd92yWtNbr68AI7/ldR3UAk7XKf8c/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hv8yVN9sxaZl5A8n3htIKUP4TcBcISFM+6cUDqeqIkGz/y0Ftt1YSzzoUwZWNx/an
	 yOWiVyWajkMhpdzShSEpc+5TXX1Y0kAR7fu/9jrXcYD/+CC6uRFn0os7x3+3gIib0x
	 +O+7mmurVxgVnu5Gl40D16//EzRblI+OBmomkwR4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 473C6F80568; Mon,  5 Feb 2024 10:26:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C284F805A0;
	Mon,  5 Feb 2024 10:26:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00CC8F801EB; Mon,  5 Feb 2024 10:26:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB1D0F800EE
	for <alsa-devel@alsa-project.org>; Mon,  5 Feb 2024 10:26:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB1D0F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=foU6YdKK
Received: from pendragon.ideasonboard.com
 (99.141-128-109.adsl-dyn.isp.belgacom.be [109.128.141.99])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC5A4268;
	Mon,  5 Feb 2024 10:25:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707125120;
	bh=rHMp+3HUl38fXd92yWtNbr68AI7/ldR3UAk7XKf8c/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=foU6YdKKlM9CYYob1znc8ZbHPp9AotBroDPzPQoXy+b/czrpSr2+sCa6G+Ae/kfVB
	 25qzq1p6Da4NtDQRhfuNtUSKEzqrSE5R9H5IWOWjoTkOmLgq8fFGITxV+PjOybBUQL
	 lYZr6XhiRpmFvuU+yPl8n7b2fWnhBNp6lHkspcAE=
Date: Mon, 5 Feb 2024 11:26:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Uwe =?utf-8?B?S2xlaW5lLUvDg8K2bmln?= <u.kleine-koenig@pengutronix.de>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>, Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 00/13] of: property: add port base loop
Message-ID: <20240205092644.GK6804@pendragon.ideasonboard.com>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
 <20240129122736.GC8131@pendragon.ideasonboard.com>
 <ZbeoPBvGJlaJco_J@valkosipuli.retiisi.eu>
 <87zfwnirps.wl-kuninori.morimoto.gx@renesas.com>
 <Zbil22dm9x2ZudJC@valkosipuli.retiisi.eu>
 <582ede29-2df7-4f01-a03b-da59d9f56d74@ideasonboard.com>
 <Zbin6Pg6oNp0cTNO@valkosipuli.retiisi.eu>
 <87ttmu76co.wl-kuninori.morimoto.gx@renesas.com>
 <ZbtiAJklkLaXWY20@valkosipuli.retiisi.eu>
 <87ttmncw9f.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87ttmncw9f.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: NEAES7I2EPKU7RHFYZ32QZHGWCMHYAQE
X-Message-ID-Hash: NEAES7I2EPKU7RHFYZ32QZHGWCMHYAQE
X-MailFrom: laurent.pinchart@ideasonboard.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NEAES7I2EPKU7RHFYZ32QZHGWCMHYAQE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Morimoto-san,

On Mon, Feb 05, 2024 at 05:31:25AM +0000, Kuninori Morimoto wrote:
> 
> Hi Sakari
> 
> > > Thank you for your suggestion.
> > > But I'm not familiar with fwnode, and it seems we still need of_*,
> > > I will keep current style (= non fwnode) in v3
> > 
> > The fwnode API should be kept in sync with the OF (and other firmware
> > specific) API. Merging your set in its current form would leave fwnode API
> > impaired. Therefore I'd very much prefer to see this set add similar fwnode
> > APIs, too.
> 
> I will keep current fwnode API behavior, but I can't test it.

The fwnode API is an abstraction layer on top of the OF or ACPI APIs,
and allows drivers to work on both without needing to support OF and
ACPI explicitly and separately. You should be able to convert the
drivers you're using to the fwnode API, and it should work exactly the
same as when using the OF-specific functions. That will give you a way
to test the API.

For instance, if you look at the drivers/media/platform/rcar_drif.c
driver, you will see

        if (!fwnode_property_read_u32(fwnode, "sync-active", &val))

which, on OF platforms, is equivalent to

        if (!of_property_read_u32(np, "sync-active", &val))

This particular driver will never be used on an ACPI-based system, but
drivers are still encouraged to use the fwnode API. 

> Now, I'm separating the patch-set into small stages.
> There is no problem for a while, but I think I will ask you to test it in the
> final stage.

-- 
Regards,

Laurent Pinchart
