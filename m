Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 945E74947EE
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 08:11:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 412E6304D;
	Thu, 20 Jan 2022 08:10:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 412E6304D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642662708;
	bh=ZevsLrH2DiZV0+pZF++FaUb0v+ZNOgFo24NPW5G4Qs0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YW/eV/CkQ12XZMFsUk67EZ9f0nJPENgintwcGBlpms1rOQnUdxSjBJYT+wINbDhkY
	 WLahQMd4+X2bKbuOVtMnTC9aHvzZVRn6GbP5ZCnJL+f3UccXuZ/OTD8Q3KI+hVJUfc
	 /DAsn130KtQ1sne/HgX9twnCmxDN1uaXF2PQAf/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44B09F805C3;
	Thu, 20 Jan 2022 08:03:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBB80F801F7; Wed, 19 Jan 2022 10:43:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA56EF80128
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 10:43:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA56EF80128
Received: by mail-qk1-f177.google.com with SMTP id s12so2123433qkg.6
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 01:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dbd6K2EXZQ3nddK61UlQKh6WscvPVU8DNsk9wwBVt84=;
 b=S2FIHG2kOOOh7D6FC2Unmt8gKPy43yEKA7BwPPDfv8kl3d+cZhcgTHOKs7m98oQ3u3
 a41uAwxyq1R978beaAMQy7m6xPkAiVXvRgXJ1c5jXihOJvfm0XqPQY7TpjZQyzJQ2N1W
 vuqkbE7vmrJk0kO+WMGQVcpoul9663+AH+YVqyDRJtw6v9nPGChedJK8P7BtdATEBheR
 WVrFln4Se9VcDIQ5BTinXYcLl7Qyr/wkRg2c/L+sQdGnyum3cpEMUlO3R27qK4fBA1Fn
 7wjSxS7WCsDWwctaOUo/JE1dTICnlEI75Q03/2/Hb//gtZXR1cxD234/2c0pLGXdDYbJ
 8psA==
X-Gm-Message-State: AOAM532NHXkEVreG2GseV29duTrH1iwe0SfhhkWDddEGd3sVa47dBwFz
 gd2WUwiqHR5pSAMxcPn++2RsNE4PHonjCZsw
X-Google-Smtp-Source: ABdhPJw1HF+orY0QTY1K/wXA+ojaE9qGY6/5e5ErB3DQjfYFpU5QMsvqQNw5/7JWf94jbvE8/6fPAA==
X-Received: by 2002:a05:620a:40d5:: with SMTP id
 g21mr4748695qko.121.1642585395416; 
 Wed, 19 Jan 2022 01:43:15 -0800 (PST)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com.
 [209.85.219.41])
 by smtp.gmail.com with ESMTPSA id u6sm12350745qko.83.2022.01.19.01.43.15
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 01:43:15 -0800 (PST)
Received: by mail-qv1-f41.google.com with SMTP id a8so2290402qvx.2
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 01:43:15 -0800 (PST)
X-Received: by 2002:a1f:384b:: with SMTP id f72mr11960099vka.0.1642585384422; 
 Wed, 19 Jan 2022 01:43:04 -0800 (PST)
MIME-Version: 1.0
References: <20220119015038.2433585-1-robh@kernel.org>
In-Reply-To: <20220119015038.2433585-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Jan 2022 10:42:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdja+XaXGP7YFfSgFCTHzOHQkuV5EF_9AFWY2tppyRWA@mail.gmail.com>
Message-ID: <CAMuHMdVdja+XaXGP7YFfSgFCTHzOHQkuV5EF_9AFWY2tppyRWA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Improve phandle-array schemas
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:03:34 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-pm@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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

Hi Rob,

On Wed, Jan 19, 2022 at 2:50 AM Rob Herring <robh@kernel.org> wrote:

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

> Signed-off-by: Rob Herring <robh@kernel.org>

The Renesas parts look good to me.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
