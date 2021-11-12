Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4308F4500A4
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 09:58:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B07971670;
	Mon, 15 Nov 2021 09:57:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B07971670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636966700;
	bh=IWWgq3EQVOe+uiZBemzO2FQgxRJkUC8FYft5Gm0mcGQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t43ajqQ0mIxahYPZh0W7plLlFAPPgdkv+nSzRMa90fi2P7cnxsqL/a9qrbEksi3vt
	 a1EX3vzfiNQe+tVDkXy79NKEaBT0UPOdHFeliaJEI1wo17dj7sc8eO5Pg5y2FTqUtd
	 ZLxmHvGFLXtVCwvOoGyBDnfg5HJwivxNNaefmbPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40BA6F800FA;
	Mon, 15 Nov 2021 09:57:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BC79F8049E; Fri, 12 Nov 2021 08:42:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1D9CF800C1
 for <alsa-devel@alsa-project.org>; Fri, 12 Nov 2021 08:42:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1D9CF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="L0G7vqzI"
Received: by mail-wm1-x334.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so6148308wmd.1
 for <alsa-devel@alsa-project.org>; Thu, 11 Nov 2021 23:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=d4YpBbYWP9wG3LFBKWknnju7IW21BdQrAXLAFoUfJjk=;
 b=L0G7vqzIu4OmVtWPcfcfA5NzLtPk2i0H7s2BzObNlHQTFEkm03sqk/2QHQ4kjpk9BH
 XMXouE5QpmwrxFfo6B5ZLvuccwWWhT/w9Ko9Yi7L+7BfDDnicqyRLnT+TM8ck5H5bQEY
 cyD6P6qfh9iWldNqTQR7o5UJ+sXkSMXyDzLNU6kkBq7ka/+ZuUqEk/qcSbQ3GxXC7kiU
 cm9dyledHK9n0gr3crraQGaAfhd3vfTQwfXVu/kwmwojjE1dRCSgNEVgeiJJB70r7ke9
 OYePQHHEPa/usZJXytv516/nCeAGVXFsmZBOHnIcNaOTOhsULeXowN7ikvsxKqOo/gxw
 3O2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=d4YpBbYWP9wG3LFBKWknnju7IW21BdQrAXLAFoUfJjk=;
 b=0IbJ8+BlMbDYvs3qAztj8JKI19UfP4dsDoFEsWIWQjlrYQEZ/04ko+O+PgTfO6p13r
 hg1uJ6ciEj9CK/F+KrIDeObuspLLhHzYZ++R9pD/+zX6EimGCF8ywoY5nCcLNK1eJEWJ
 m87sF5mt9P3ltpaudBwq/ddPX4wDQNAh4nhSIkGL6YqPTJJfvEhhSaegRqjPBRrp+NPs
 KTqyq9kanl/0NfgcbAwp7EOET2aaY+cgHMGujAw5sZte5Z5Il6HeIz4T+G7ENtuJz+qb
 h/7pNkV2NH4tPbqyZ1Lb5qvolEpvOPoU89/ik/CAL2N+ozMdUzcVUpJ21hfpotRbnswI
 Ghow==
X-Gm-Message-State: AOAM530kqJEjMkzWo0+opGl8CL7wHYz7x6777QaUyMkbsJ6+1mn/4/Jw
 SxOWT98vvWKgPfKZBzZjZKceNg==
X-Google-Smtp-Source: ABdhPJyYtg+MHn61GMl0MRFqSO/sm1wnHgrm7yORmq7WT7ihtvN7d0mp317CBhRDaom5mAlXGDszmg==
X-Received: by 2002:a05:600c:2107:: with SMTP id
 u7mr32377342wml.82.1636702961238; 
 Thu, 11 Nov 2021 23:42:41 -0800 (PST)
Received: from google.com ([95.148.6.174])
 by smtp.gmail.com with ESMTPSA id q8sm4978469wrx.71.2021.11.11.23.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 23:42:40 -0800 (PST)
Date: Fri, 12 Nov 2021 07:42:37 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: mfd: timers: Update maintainers for
 st,stm32-timers
Message-ID: <YY4a7ZxzhNq6Or+t@google.com>
References: <20211110150144.18272-1-patrice.chotard@foss.st.com>
 <20211110150144.18272-3-patrice.chotard@foss.st.com>
 <YYwjPAoCtuM6iycz@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YYwjPAoCtuM6iycz@robh.at.kernel.org>
X-Mailman-Approved-At: Mon, 15 Nov 2021 09:57:03 +0100
Cc: Ludovic Barre <ludovic.barre@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-clk@vger.kernel.org,
 Jassi Brar <jassisinghbrar@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 olivier moysan <olivier.moysan@foss.st.com>,
 Guenter Roeck <linux@roeck-us.net>, ohad ben-cohen <ohad@wizery.com>,
 linux-pm@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 david airlie <airlied@linux.ie>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 thierry reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 linux-spi@vger.kernel.org, lars-peter clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Amelie Delaunay <amelie.delaunay@foss.st.com>,
 linux-gpio@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, stephen boyd <sboyd@kernel.org>,
 pascal Paillet <p.paillet@foss.st.com>,
 maxime coquelin <mcoquelin.stm32@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, jonathan cameron <jic23@kernel.org>,
 Le Ray <erwan.leray@foss.st.com>, linux-iio@vger.kernel.org,
 michael turquette <mturquette@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 alsa-devel@alsa-project.org, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 benjamin gaignard <benjamin.gaignard@linaro.org>,
 linux-phy@lists.infradead.org, sam ravnborg <sam@ravnborg.org>,
 linux-rtc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>, patrice.chotard@foss.st.com,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, baolin wang <baolin.wang7@gmail.com>,
 "david s . miller" <davem@davemloft.net>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-remoteproc@vger.kernel.org,
 alexandre torgue <alexandre.torgue@foss.st.com>,
 bjorn andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Lionel Debieve <lionel.debieve@foss.st.com>, Marek Vasut <marex@denx.de>,
 Marc Zyngier <maz@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 herbert xu <herbert@gondor.apana.org.au>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 dillon min <dillon.minfei@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>,
 netdev@vger.kernel.org, yannick fertre <yannick.fertre@foss.st.com>,
 vinod koul <vkoul@kernel.org>, philippe cornu <philippe.cornu@foss.st.com>,
 daniel vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>,
 dmaengine@vger.kernel.org
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

On Wed, 10 Nov 2021, Rob Herring wrote:

> On Wed, 10 Nov 2021 16:01:41 +0100, patrice.chotard@foss.st.com wrote:
> > From: Patrice Chotard <patrice.chotard@foss.st.com>
> > 
> > Benjamin has left the company, remove his name from maintainers.
> > 
> > Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> 
> Lee indicated he was going to pick this one up, so:
> 
> Acked-by: Rob Herring <robh@kernel.org>

Since you already merged the treewide patch, you may as well take
this too.  We'll work through any conflicts that may occur as a
result.

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
