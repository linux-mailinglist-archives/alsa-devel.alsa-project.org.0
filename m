Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5246283812
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 16:43:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 416F417C5;
	Mon,  5 Oct 2020 16:42:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 416F417C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601908984;
	bh=zXcMNekq4BBEbayKNh0ZM0PQe6dlhY3ZtF3cDN6LKNM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FCnwnAvEU7SnIdASaZ8SAw+cgopCD0RCGZ7AOxN1U+FI3/CScYQnhHZASE9FJM9gS
	 RepeElvvU6rHuMwjJG9+aQIK2IeggttJtoaWHYWPYmKMd4SB0t6FAYgV0ZOF9kG74K
	 igEnBF2OwMFzRSeWfDDlrC4aB+dwysetMA/78KMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 786A6F802F8;
	Mon,  5 Oct 2020 16:38:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AA4EF8025A; Mon,  5 Oct 2020 12:37:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC964F800C9
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 12:37:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC964F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JMXtpOzB"
Received: by mail-ej1-x643.google.com with SMTP id lw21so7168369ejb.6
 for <alsa-devel@alsa-project.org>; Mon, 05 Oct 2020 03:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EQcMf3aBHGTHbFtiLcGPyEnLeByAfRIiKvJYpM7dHjI=;
 b=JMXtpOzBphG2KW05zXFj2vXclgc2K+H8JNLe4wZm7v+D9biCrsBBlunvumrZBdu1ay
 dGsC3P+vCBgpuvq8Us5VYT17QD/j1PGdTs3yayROXo3Im6WBME+yzVPRs9dhmCnhv+Kp
 deAaGEl4mX/k8HNSg+lcAp97KgIlUIgmSSwwdLTGDqN7XE8+lWKnDQvOaVfL9MZ14U+a
 QRIvo/0Rw3hXEZYEYP0VkWPlkV5tVRSOzoq3CiZiRn3rvyx0WeBnBNIUIK3FrMGOYn9N
 QIQdKyuVIgtZvtCvpApddnOAphNZZn8AUAHtmpPXbjSAxqojzQj+J6GDsnofUdkYSHTP
 MAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EQcMf3aBHGTHbFtiLcGPyEnLeByAfRIiKvJYpM7dHjI=;
 b=Vl8pLz+jh8Me00sI9oaupOjQwpZteakWHFPOCHTbVEE70nSfA+oM5vx9AHy6JNJhVe
 BL4rlr3UBi+LE5IwMFdHKpyt3TKQXf0aTXfBOjM1Fw202p69e65uWAyZ5jbwReQ7bWFP
 /KJORd4gtmw8m5hnzHvXqCafH9eSO5b1jJuu7c7hYEZVBXJIj62m5/BcdbsGlThOLqPP
 yfsH/ZjHMDr0hQqMf5CUTlAk2b7eqJPOhoFmITJKpzcDrCTo/bFo6S8yCtl7roYjaO1P
 RoSz1ZyV9XXRzAf3S1ppuM3m4uluIIYMqO1bLHQf5YUgkABbALgDn2WK1pUkkwLPeoe5
 Wlhg==
X-Gm-Message-State: AOAM530sYI+1BnzAUPc6LxgT/FV//o+oov4cEJcZGo0bzYmEXC58fA8z
 HxE9FhAUKbJHIKcj9GS28g0=
X-Google-Smtp-Source: ABdhPJyAUrA9v+oT7mNxthuQoeotTCXMOOGXsGx3LdAG3pM2W9hPKJEenugRGvwJUGZXAZHqegPZ7g==
X-Received: by 2002:a17:906:6545:: with SMTP id
 u5mr14725364ejn.346.1601894226145; 
 Mon, 05 Oct 2020 03:37:06 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id yz15sm7567670ejb.9.2020.10.05.03.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 03:37:04 -0700 (PDT)
Date: Mon, 5 Oct 2020 12:37:03 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Another round of adding missing
 'additionalProperties'
Message-ID: <20201005103703.GN425362@ulmo>
References: <20201002234143.3570746-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CQDko/0aYvuiEzgn"
Content-Disposition: inline
In-Reply-To: <20201002234143.3570746-1-robh@kernel.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
X-Mailman-Approved-At: Mon, 05 Oct 2020 16:38:46 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-mips@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 openipmi-developer@lists.sourceforge.net,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, Baolin Wang <baolin.wang7@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
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


--CQDko/0aYvuiEzgn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 02, 2020 at 06:41:43PM -0500, Rob Herring wrote:
[...]
>  .../arm/tegra/nvidia,tegra20-pmc.yaml         |  2 ++
[...]
>  .../bindings/sound/nvidia,tegra186-dspk.yaml  |  2 ++
>  .../sound/nvidia,tegra210-admaif.yaml         |  2 ++
>  .../bindings/sound/nvidia,tegra210-dmic.yaml  |  2 ++
>  .../bindings/sound/nvidia,tegra210-i2s.yaml   |  2 ++
[...]
>  .../bindings/usb/nvidia,tegra-xudc.yaml       |  2 ++
[...]

Acked-by: Thierry Reding <treding@nvidia.com>

--CQDko/0aYvuiEzgn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl96908ACgkQ3SOs138+
s6Hn/g/+OAyAW+yLaNZ0EuRduaLOLtd19HpvVqZdf68FWcAxWHANPdIKnVuc++CF
2r+nHjgPy4zI3LGP1bGlgPufCdAapy2QTx9sGt/VeTEOuo9uTjb6J4Y7xXC11qQT
pVI+v4ofSi48FN6vY6VWsotDscDJFLkJy/eZdb1RRuU44SG4dw04Z3fn1STm9wAN
PS6hKtpUTbZYzgI0hngx2Ph30t7fyu18NIRPsKZ6/3WgR4HwD8cdpVi+06ThN3GQ
s5CEQ/J7l9z1tfQhUypxLic1JV21su9fCERZQd96CKyIvcpJ5RByk7d7EnnZ4A53
ZDRzwiymRP29X0IUzvEoHc7XvUP/mIZIkRNtTc3tLGZHZ34+Gc805Hcy5slbzhRz
V+Gl3oXG56OhWLSbyNQXOOlbJJAmdFS1IDAoV752G6kq5fFZ397AW34DLF5YJX0k
lYF3NWBTpuxxWCGuceKkACfscLE1dAifN2Rtgf9mbM1k2mIG7mVa6tdpxJ3sjf8Y
1T0v3HYAwfOKTajaYUY4UYLMIJcZNjjJsw/olvcM6a9c8x/g79W3BgSjS6F/pEww
DtuObW8366dl2WoqlYTJ9eWvKXSbCHRBhPpYLamHRBOBj7HKqGSHyyq0hEGPvd6X
Hr+OJUghj7CHS+5vXEq5oNiT4bE6x9ytJdHNf5hIiRchRu6TeOQ=
=hMJa
-----END PGP SIGNATURE-----

--CQDko/0aYvuiEzgn--
