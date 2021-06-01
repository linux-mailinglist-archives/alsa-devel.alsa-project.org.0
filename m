Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 273E4398CB8
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 16:26:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A684D16EB;
	Wed,  2 Jun 2021 16:25:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A684D16EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622644007;
	bh=ns2Myd2SD/MJabVg1FbNAA72sIqxZq8ix6DasEjLXNw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ExmVIyVX3uyg8g9ogWmMDCNS9Wb9CQvEV5CvX8ftzaBQPaOXJN5L6/442qPa2njYD
	 1FqchIOASp0CxbfiNpN+omgIiLQHNaHlYetFtcdi/jEzJL4aLdQNrTEXlmAkqlcv0D
	 oEO392E7niBKIfK2Ua+Xe07YNGP4ecLbt2nVC9tc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D957FF804E0;
	Wed,  2 Jun 2021 16:23:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A96CF80254; Tue,  1 Jun 2021 12:02:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D82C5F80253
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 12:01:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D82C5F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com
 header.b="rggJ/NJj"
Received: by mail-ej1-x62f.google.com with SMTP id jt22so20803023ejb.7
 for <alsa-devel@alsa-project.org>; Tue, 01 Jun 2021 03:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=60Kdajo/BKEdpmYUDsCGYGVgkz7HdEw6Jt5LKgGDZ+Y=;
 b=rggJ/NJj6tLFy8ZuA+tKrAKvIO9kxyd2uSFgRxgYsMo5jr0GlUx8AggaJgYNe51dBx
 Ny7oNE8RhXSl8h+Vi88PTW+i4JWtztI04Isltmd7XOo9Ad/OVphA5Wh9uhDbSlmpJXxp
 nlpZKbtzL0ZAUlka6FpI9rrM4R1/zDl9JpHAUm92zHdSRDn2QnI4MzOQt1avXRHIFV7p
 AvKvuxPmDviMggN/C3DhBk4/cdU7beOuKINFvK16d1BXogwyCLmB6vYMlOv4l3vcO2iy
 WaOYEKl/INy684O5YE7aQB7LQ9m5oeZH4qEkLhuYECAeXdsIB7C9VXA0T+DdUNaGzDSj
 pSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=60Kdajo/BKEdpmYUDsCGYGVgkz7HdEw6Jt5LKgGDZ+Y=;
 b=gL/l7XINZjxBDZxMQNgi+ti49JtQYQY+EwFPLIUhlgq5P2sqMmzT51eXFzLiyXp9yL
 uCdm1FJ9OKS99rhWObexJti8fpoJ+SpGxuNsRbi6oXAb8YGiIGGqk/xw9Uhw2tk8+wOa
 1aQJSl9v8b4W4SLgLKHHDzLps9HWkkiCij0Yb9fXyd7R+MKN/zqD/TtkHlVNyQsJA7IS
 /WH2Ww9ZuZlU16FxhANF6vR4nZOJ1zS+d2hjoN5FNeewFy8wQHW74o6RS6qK4P+wkWNv
 UlfuX2DzedfagCcVfJuc6Namd1eViq+PNP/bJZgfd05E/iE/AqWTIJCAFX67qyvF4n7c
 tA0g==
X-Gm-Message-State: AOAM530qu6gp2G/Mn3BN34GLDLo9XRPylX94udvs77KashWufThZxMH9
 THkXAjG72n1buePXtZASbSNqM/c6nDhe3qbadz2p6A==
X-Google-Smtp-Source: ABdhPJxHdOPJhWhLABsUexCJTnW7WAsOGgduFBuEyhdzFLDjcZON6lkvHgNzf1kNzy4ZauJeZqqYlw1JdlVKeC8qRbs=
X-Received: by 2002:a17:906:5285:: with SMTP id
 c5mr27813952ejm.282.1622541708707; 
 Tue, 01 Jun 2021 03:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-10-maxime@cerno.tech>
 <813942f4864d87ef0b9c5dff98c23c919bdd88a9.camel@kernel.org>
In-Reply-To: <813942f4864d87ef0b9c5dff98c23c919bdd88a9.camel@kernel.org>
From: Dom Cobley <dom@raspberrypi.com>
Date: Tue, 1 Jun 2021 11:01:37 +0100
Message-ID: <CANUESCF8wpZzv4yEODk+J8gt2div=3Zsgt7S0yoPSb2XN=2RsQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] drm/vc4: hdmi: Remove firmware logic for MAI
 threshold setting
To: nicolas saenz julienne <nsaenz@kernel.org>
X-Mailman-Approved-At: Wed, 02 Jun 2021 16:23:04 +0200
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Tim Gover <tim.gover@raspberrypi.com>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 Eric Anholt <eric@anholt.net>, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Dom Cobley <popcornmix@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 1 Jun 2021 at 09:52, nicolas saenz julienne <nsaenz@kernel.org>
wrote:

> What's to expect sound wise on older RPis?


I'd say 8 channel 48kHz is good. 2 channel 192KHz is good.
Higher than that and we start to lose samples in the HDMI MAI bus fifo.

The firmware workaround made 4 channel 192kHz somewhat more reliable, but
it would still fail when sdram was busy,
so I don't think it's worth maintaining that.
