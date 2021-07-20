Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C05BE3D466E
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Jul 2021 10:55:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CD86178F;
	Sat, 24 Jul 2021 10:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CD86178F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627116956;
	bh=bmoPWbEuHeLW2Qm2Cx991lVf+b7y/Xx5dl6+rTxFCzs=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hGDE+UAyO9qwDzm5O9Ye5/8i3EI1WtLoUj7UZJQ9j3VmIi09FmIIExBR5ApCBY0C8
	 dEUfpSZm48exBgRPSFI/oVBoD0DtJWUmdYUzo2rSu8GwALDDHtekoK47OZ9MAp8D7s
	 e7wRSEMqbm0W2h2i2JGPrWejxSBF1VaecHb2peb8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D6A4F804E2;
	Sat, 24 Jul 2021 10:53:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14CDBF80218; Tue, 20 Jul 2021 20:15:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,PRX_BODY_26,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8672F800DA
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 20:15:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8672F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cd8j7p6h"
Received: by mail-wr1-x42f.google.com with SMTP id d2so27055402wrn.0
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 11:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:content-transfer-encoding:date:message-id:cc:subject
 :from:to:references:in-reply-to;
 bh=hhS705SlOjkRoqTojYTgrsq95q0IEJuqc4XsQcf1hRc=;
 b=cd8j7p6hzpYM2CDZBWvTlYy7pGIlXLU17lyrTUFOhXD6yrR6ygv7WL6ti1WU+HeSO/
 fnTsqAbq4LOPoAFw2Vo8qqNWxzXvtRmEL1euDBs9j8O6TbubOCrVEbY59/V1TW8nYQmD
 zDSQbMpCepP7JRbrfQYhpF8rLB2A8Egvbc6LRQvIWVnZgDT1BRfP7Ni7TlVdCqbxg+U0
 DoC50iEEhHDDlYmqz0uJXqr9uCetgb1pcKaJPv2dCGXpuLHbyUeUr/259exCLwL+7Som
 1ZBRsYw26DtMQaPdGBwQEgpU5PWcfASQ1TKQUWAX49VgxZB4zo4xoqM/Qt9RHS53AxiM
 CDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding:date
 :message-id:cc:subject:from:to:references:in-reply-to;
 bh=hhS705SlOjkRoqTojYTgrsq95q0IEJuqc4XsQcf1hRc=;
 b=nE+v/mTiiSfF23VxoNc3mbAPBEwO8zgx1vS/s3Y8vWoIsK0s/1wRV2i26wXIQIeQG7
 /d7grzU/H04sYrbNiFt4MUeS01Xu8PIUvbLZxmvFQmZgoGW35XaTCag0TfSKn/ayTXKJ
 qroFRf8/Tl//BvJrdrSCLbeK/pds3/T/YwP2G8PB+QGEUCRiDZLGtIkcPK4oOJbSlNcX
 MCa+9AA/OCwyf3UvwS8N/nMjA+R++bopmQzWqQszXR4UOdy9STtWg38d6Nqlrdq6qR/z
 Y676AFcncNYmaNycKs93uetxbQlMm+wDt6pfOkbpVuIaBzYrCNhT8bl3XuONTk8td//b
 GhOg==
X-Gm-Message-State: AOAM533iclNM97DL/lodoUnKOVNwV4ng3VNWyooA4CqzhZoBJc0JBqzI
 qZU9yDXAXi1iVof1A6dF8TI=
X-Google-Smtp-Source: ABdhPJxLKTXitFRX4kR6CpMpKBy2kBjAfXucf7wNYwW+mqaI3etVNE0PqF25MsCMX6/0mP7aRWmRYA==
X-Received: by 2002:a05:6000:1281:: with SMTP id
 f1mr38817689wrx.114.1626804928215; 
 Tue, 20 Jul 2021 11:15:28 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
 by smtp.gmail.com with ESMTPSA id p5sm19571717wme.2.2021.07.20.11.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 11:15:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jul 2021 19:15:27 +0100
Message-Id: <CCY67UA29K2Q.2DEZ5GOF4HPTR@arch-thunder>
Subject: Re: [PATCH] dt-bindings: Remove "status" from schema examples
From: "Rui Miguel Silva" <rmfrfs@gmail.com>
To: "Rob Herring" <robh@kernel.org>, <devicetree@vger.kernel.org>
References: <20210720172025.363238-1-robh@kernel.org>
In-Reply-To: <20210720172025.363238-1-robh@kernel.org>
X-Mailman-Approved-At: Sat, 24 Jul 2021 10:53:22 +0200
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Olivier
 Moysan <olivier.moysan@st.com>, Mateusz Holenko <mholenko@antmicro.com>,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 ChiYuan Huang <cy_huang@richtek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>,
 Karol Gugala <kgugala@antmicro.com>, linux-rtc@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dilip Kota <eswara.kota@linux.intel.com>, Wei Xu <xuwei5@hisilicon.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Chen-Yu Tsai <wens@csie.org>, Jakub
 Kicinski <kuba@kernel.org>, linux-media@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Ramesh Shanmugasundaram <rashanmu@gmail.com>, Mark Brown <broonie@kernel.org>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, Robert
 Marko <robert.marko@sartura.hr>, Alessandro Zummo <a.zummo@towertech.it>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>
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

On Tue Jul 20, 2021 at 6:20 PM WEST, Rob Herring wrote:

> There's no reason to have "status" properties in examples. "okay" is the
> default, and "disabled" turns off some schema checks ('required'
> specifically).
>
> Enabling qca,ar71xx causes a warning, so let's fix the node names:
>
> Documentation/devicetree/bindings/net/qca,ar71xx.example.dt.yaml: phy@3: =
'#phy-cells' is a required property
>         From schema: schemas/phy/phy-provider.yaml
>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rui Miguel Silva <rmfrfs@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Robert Marko <robert.marko@sartura.hr>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Ramesh Shanmugasundaram <rashanmu@gmail.com>
> Cc: "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> Cc: ChiYuan Huang <cy_huang@richtek.com>
> Cc: Wei Xu <xuwei5@hisilicon.com>
> Cc: Dilip Kota <eswara.kota@linux.intel.com>
> Cc: Karol Gugala <kgugala@antmicro.com>
> Cc: Mateusz Holenko <mholenko@antmicro.com>
> Cc: Olivier Moysan <olivier.moysan@st.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-rtc@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../display/allwinner,sun8i-a83t-dw-hdmi.yaml |  2 --
>  .../display/panel/boe,tv101wum-nl6.yaml       |  1 -
>  .../bindings/media/nxp,imx7-mipi-csi2.yaml    |  2 --

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
   Rui
