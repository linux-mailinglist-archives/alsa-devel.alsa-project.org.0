Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C05E243509D
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 18:50:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 337821688;
	Wed, 20 Oct 2021 18:49:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 337821688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634748607;
	bh=BflLf1h1aQ9b0oY2sKOtQvK8tWamdZNo//ilYRtVwxs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NFDSsxuPBnfQyjymI9INzQpkO51LkCPR218QVmz+Q0kVaFQ6y5csXthmIoj/FLbNx
	 eUigeYMWekKOyPQuJtV4cZl7fSP3l87tNbtiAmuLedpGgt+7CbmgmjuCu7p+Co2LFl
	 acp1rRb24K14FCEfmUe7mI8RnzBOpkewZ+h1owZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0BCFF804CA;
	Wed, 20 Oct 2021 18:48:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2C7BF80229; Wed, 20 Oct 2021 09:45:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EB69F80155
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 09:45:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EB69F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="VYFxyK3Q"
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 504C5402E8
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 07:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634715910;
 bh=hn4G6B24NKuuI7XYmyB2qc+VHWq7V63yNRCu8uWR8QM=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=VYFxyK3QHN50YGW4T3CzzCNqEDA9evcQ1W25kCBi05gHPjNmCCo06F+3ybRDOs+7S
 FrygZZmYvTYSl0WMJTIg1nMO+dtka9ocIV6Fd4XUlXZajZYr3CI7YCN1B+WgTn512T
 zgzITg1NRhMP01zD5VSmDkBTmCdsKFu3oUKaXW8aoQc+JeKYcKFK99gttYciKlvsQg
 IfNWYycKbspGqaS0BS6IcF2VX5jGvV9PAfsEGWQlTDHYCJeR7GWIYNj1NVK3OhH2Hb
 vYopITVeEOM9iDr1u2BWZP3UGwFSezbr7D3R7IIA5zgrMFmxUXc1RvxMOboJaXR02p
 x7sgIXEjT0ASg==
Received: by mail-lf1-f71.google.com with SMTP id
 g10-20020a05651222ca00b003fda3f05c17so2768885lfu.11
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 00:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hn4G6B24NKuuI7XYmyB2qc+VHWq7V63yNRCu8uWR8QM=;
 b=4xQNNyVe6uMTKPV133nIufsDmFREYI2TEGAtpimmuSTc4gfNfPxgK9vfvfWJhoQwYn
 XlLprClpEX52o1VnoHdGW+gTbt7tLywHrpHHXAH07nw5mvrzjfd9CJTehmA6HnvN9eRZ
 NmEqEnzhhWZzh8aajDCW+DAznML4mw1G8botRBqPluUE4Gj/CVCLMYY580gYeiVKCPQN
 TTNeB+zVkRoWUKxRK6gjDMlYZUDzeuIj52tA8xAmW9ETt6qAoNEhTLxLJ3NWWf+SdVNp
 bMs5qMYMlyLZ7K4v/1H3k2EOUf9Qr5mnaTdIIachOWan900qxX68V6heEwIropnWGLzw
 2bYA==
X-Gm-Message-State: AOAM532bYtXDkPxwvxjLUIXrzpE9HpRY0iAh1TdevdalVU9GFqD/V2tc
 u4B9sk4n7OygukyoxbPkC9obezAXFpLnXL8hE/Zl1XBtUQnbbH88QSIOhFEhIJx7gXngy7XnP84
 gyJrfap4pVpnIi0+B5D2gP16QRWXoBwrm8W5X6lJq
X-Received: by 2002:a05:651c:10ac:: with SMTP id
 k12mr11579093ljn.296.1634715906798; 
 Wed, 20 Oct 2021 00:45:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylw2trvF0ZXu7khnQZx/gnaE1TXWFJT87p6K5VtMB66Foj+aVE5ln4wd6dcSv0cFlFYuFolg==
X-Received: by 2002:a05:651c:10ac:: with SMTP id
 k12mr11579071ljn.296.1634715906590; 
 Wed, 20 Oct 2021 00:45:06 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id s10sm127484lfr.172.2021.10.20.00.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 00:45:06 -0700 (PDT)
Subject: Re: dt-bindings: treewide: Update @st.com email address to
 @foss.st.com
To: patrice.chotard@foss.st.com, Rob Herring <robh+dt@kernel.org>,
 maxime coquelin <mcoquelin.stm32@gmail.com>,
 alexandre torgue <alexandre.torgue@foss.st.com>,
 michael turquette <mturquette@baylibre.com>, stephen boyd
 <sboyd@kernel.org>, herbert xu <herbert@gondor.apana.org.au>,
 "david s . miller" <davem@davemloft.net>, david airlie <airlied@linux.ie>,
 daniel vetter <daniel@ffwll.ch>, thierry reding <thierry.reding@gmail.com>,
 sam ravnborg <sam@ravnborg.org>, yannick fertre
 <yannick.fertre@foss.st.com>, philippe cornu <philippe.cornu@foss.st.com>,
 benjamin gaignard <benjamin.gaignard@linaro.org>,
 vinod koul <vkoul@kernel.org>, ohad ben-cohen <ohad@wizery.com>,
 bjorn andersson <bjorn.andersson@linaro.org>,
 baolin wang <baolin.wang7@gmail.com>, jonathan cameron <jic23@kernel.org>,
 lars-peter clausen <lars@metafoo.de>,
 olivier moysan <olivier.moysan@foss.st.com>,
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Lee Jones <lee.jones@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Matt Mackall
 <mpm@selenic.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Jagan Teki <jagan@amarulasolutions.com>, dillon min
 <dillon.minfei@gmail.com>, Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Ludovic Barre <ludovic.barre@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 pascal Paillet <p.paillet@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Le Ray <erwan.leray@foss.st.com>
References: <20211020065000.21312-1-patrice.chotard@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <22fb6f19-21eb-dcb5-fa31-bb243d4a7eaf@canonical.com>
Date: Wed, 20 Oct 2021 09:45:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211020065000.21312-1-patrice.chotard@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 20 Oct 2021 18:48:06 +0200
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-crypto@vger.kernel.org,
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

On 20/10/2021 08:50, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Not all @st.com email address are concerned, only people who have
> a specific @foss.st.com email will see their entry updated.
> For some people, who left the company, remove their email.
> 

Please split simple address change from maintainer updates (removal,
addition).

Also would be nice to see here explained *why* are you doing this.

Best regards,
Krzysztof
