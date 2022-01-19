Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6612C4947D0
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 08:06:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D0302F02;
	Thu, 20 Jan 2022 08:05:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D0302F02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642662399;
	bh=N5UHvUo8yoJp7eSBQbs/HrkxotinQJL3d0n81Xt/kdk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oarvcryg6JFuuWMnMinyoyMRD4C5UuiIjPqgvTEeyfPFkU8XCbdsQH/SWXaz8SLuj
	 jEPWR84PF0X0Nl/Qt29Fow4PpehAuoMIhgiPJVOp9KSy2zkeKNd6uoYQedX3W4oGF6
	 O9KkqZU+a6x0jLnobGlEf5QR5U4GHKPvFO60cuJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AA2AF80525;
	Thu, 20 Jan 2022 08:03:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 150BDF801F7; Wed, 19 Jan 2022 11:32:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FC4AF80128
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 11:32:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FC4AF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Xp8s21ft"
Received: by mail-lf1-x12e.google.com with SMTP id p27so7591908lfa.1
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 02:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sr17yjVIJ3L6nqEXDMpIqK2xXImflLFzz6ALbEm9u68=;
 b=Xp8s21ftcZ0WG13DDgbdH7NIUsuYX+ghvkD5zw1hiLod5qbV+yjC9/iw3BxedgypWz
 j185xcOoN7LD6uCNH62mSJRvMAjwIi7qcbYCznd6Wd0VuvmCQ/sizMwR5aWhMScNA/rl
 hmuEc+DbVv1NqMjk5IXcy/Hk3oFXKZ0haMWzOfivc06wvoxpEiX1vitoLqGmZuk04L2x
 HC73i8VxJwVCI/4Mkmi2NET/E8BffuYg/4Zged81GUTCUySqRPVe2agczTV87+sP+2pN
 pDJV7fJq03+xTsoQaVBtN6S+RGEn7oHeifzgS2DkyqcDDGnQ9aAHk1KN9hJBM2T+WaJf
 EdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sr17yjVIJ3L6nqEXDMpIqK2xXImflLFzz6ALbEm9u68=;
 b=e9PjHiUw+RLsrTfFYFBg974FOEo0K5vDItLGoPiNUzNKFdnhuHYUJfg5BrUBMd5nn2
 pVTF1yLdiypyXNyeKOOpbqXv8Fsit0J6RDPs9Wx4D6XLL5QiWn8yWfjzn/2eRDdioSkD
 GxzbYm1Yy/0saLJIJPZaYXXYKfg3N5uOEQiZVqaP8uPv+nzqROrrj/w1kXv878/PYEDG
 BzCSILQRJODau8VzoBKLIV0T2C33QXDnS/BB1s9HyORWOVgXf15y6mmZbGbuVulc8m0H
 ga3k7p+Ur3mIRoWnfg6IcMlxh6pvQzJmbK8qhJG7gmxKUC3uJ+JW/KKSMeQQlH3AJ6Ai
 1ghA==
X-Gm-Message-State: AOAM530j2X1Obu/p2VJKpyo14AD6ckKHS6j7nagwBGzf0G01PYulQphT
 Hky/t5noshrE4xhmZhW0K7fjJjJOlXl6V34Zf0ok5w==
X-Google-Smtp-Source: ABdhPJz5t3UBuJxmMbI2E3pOLPGLQiV4ByMa0pgkUilXefnRDUK3bGbZ4bWfdB/wwOZVZ58x7DxfCbRQTc3tUAIioE8=
X-Received: by 2002:a2e:a26d:: with SMTP id k13mr10012578ljm.300.1642588342599; 
 Wed, 19 Jan 2022 02:32:22 -0800 (PST)
MIME-Version: 1.0
References: <20220119015038.2433585-1-robh@kernel.org>
In-Reply-To: <20220119015038.2433585-1-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 19 Jan 2022 11:31:45 +0100
Message-ID: <CAPDyKFr5uT3H8NaAvPyGajo2R6DriYC92y=RdAk=G4PMC4MxYw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Improve phandle-array schemas
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:03:34 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-remoteproc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 linux-ide@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, linux-phy@lists.infradead.org,
 netdev@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>, linux-riscv@lists.infradead.org,
 linux-leds@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Marc Zyngier <maz@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, iommu@lists.linux-foundation.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-usb@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-crypto@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Viresh Kumar <vireshk@kernel.org>, dmaengine@vger.kernel.org,
 Georgi Djakov <djakov@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Joerg Roedel <joro@8bytes.org>
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

On Wed, 19 Jan 2022 at 02:50, Rob Herring <robh@kernel.org> wrote:
>
> The 'phandle-array' type is a bit ambiguous. It can be either just an
> array of phandles or an array of phandles plus args. Many schemas for
> phandle-array properties aren't clear in the schema which case applies
> though the description usually describes it.
>
> The array of phandles case boils down to needing:
>
> items:
>   maxItems: 1
>
> The phandle plus args cases should typically take this form:
>
> items:
>   - items:
>       - description: A phandle
>       - description: 1st arg cell
>       - description: 2nd arg cell
>
> With this change, some examples need updating so that the bracketing of
> property values matches the schema.
>
> Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Georgi Djakov <djakov@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Wolfgang Grandegger <wg@grandegger.com>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Vivien Didelot <vivien.didelot@gmail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Vladimir Oltean <olteanv@gmail.com>
> Cc: Kalle Valo <kvalo@kernel.org>
> Cc: Viresh Kumar <vireshk@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Kevin Hilman <khilman@kernel.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: linux-ide@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: dmaengine@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-leds@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-can@vger.kernel.org
> Cc: linux-wireless@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

For CPUs and PM domains:

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
