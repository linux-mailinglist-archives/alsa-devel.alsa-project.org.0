Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B4B630D8A
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Nov 2022 09:49:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 930B4170F;
	Sat, 19 Nov 2022 09:49:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 930B4170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668847791;
	bh=jO7XNxPKSOf1oCj/Sq5o4R0auO1YqROjY7PX0zI12c0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VA9i1/qfzIC4AEXUIYseNNSrOzBxC4RFMPyzKqFImxIrIPJ15BTkY4FKQlSMfq5MO
	 pub2AVH5nztWGHSWhHcQqdHsFEDVxhBxHkDbQkCS/f/+E74umYNVoHLtT/ezqJ7fLG
	 CK7D0Izh1PqmwqSA/qigwXqKA8bVrt39HVAjySmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1F9BF80613;
	Sat, 19 Nov 2022 09:40:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E068BF80217; Sat, 19 Nov 2022 07:38:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_ZEN_BLOCKED_OPENDNS, 
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3A11F800B5
 for <alsa-devel@alsa-project.org>; Sat, 19 Nov 2022 07:37:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3A11F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cNFOo+Vq"
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-14263779059so7627704fac.1
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 22:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cLYrlsSUJ/3iV70MlNgEm3O6sI1BB8dOzm7Fo6KqsgM=;
 b=cNFOo+VqMgo+mnOiJFXxMwMeFQLoitwcWJzIOOFWlhDZn66wiP2M4eBUI7NktrM1uC
 yaoxkbPYDfgg1iDxd9fZ4xi9O867toY85OU0FO1wgrIcYtErgNqSkIaDFS1yLEWy06Ze
 Nw1/AIkSKmJKMc018JElW0dxYRL+GkqGyoV263phPIjoXOrycZ0f4UAzEZVysgHM2sCC
 u3DTAZg7k0XUYqkROhzjmjl20OPHdLpF2N4VWXL/gTSjK7lRgBotEJdsiOLa4wIH6cX7
 RdwHdpMT7MwsU0JqQ6wxuSX6BvrKyH1TcIs0CmWyKM61aIq78ZXPr1jlmFDGDcT3Hvct
 8DkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cLYrlsSUJ/3iV70MlNgEm3O6sI1BB8dOzm7Fo6KqsgM=;
 b=51d+6suwEy5llRo3pc1/N/jDCUiCnhl0vdE3nrH1adG5+x2TxNpVOQe7SqchWrxWA0
 dPrVWJjXcqWqwa6wB8uKzjljm1O6n+GjUc8BPEmAvFA287cbZCBG0LI97LOiWj87mZaL
 6zQw05ta3SzqZmKqCQ4opxZrEhi0wuKk7i5O009IY0YrZuWXv3XkDJGzEWVa2aHvcxPw
 gKz7KYm1ToZN1dpE4hFXwFi6y9TD0b7sRy4LhyPfmQgaHeqS1O1bSnVX/gKS7hmZUv2b
 eJNm8ic9qqB6IcA6HRhMzbyQOz7DIQ/iAGsN/HnyZCeHPiO8AiY/xbTLeTCRmQSJj7PE
 N1WQ==
X-Gm-Message-State: ANoB5pngHJm+yufL78jxnyUkZOqj8hIYpWjPOmdoaCJ+Hn9Ld3I+WzE6
 8mhkPur7shM1vz+NZr/fbYJRLWeouDk6HbrA09s=
X-Google-Smtp-Source: AA0mqf4YHBgpQyRnlsR8IJwpaWfoiK6RVHKjHFNz8PNwpwXg9+N4cVuAs+273DwuP7yKjh9Nyq4wN2dl85vztU/s7dM=
X-Received: by 2002:a05:6870:9591:b0:13a:eee0:b499 with SMTP id
 k17-20020a056870959100b0013aeee0b499mr378364oao.83.1668839875548; Fri, 18 Nov
 2022 22:37:55 -0800 (PST)
MIME-Version: 1.0
References: <20221118223728.1721589-1-robh@kernel.org>
In-Reply-To: <20221118223728.1721589-1-robh@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sat, 19 Nov 2022 07:37:43 +0100
Message-ID: <CAMhs-H99X9aV7cdotCPar6g50KXL+qNS+jM16Tveq9nxfUY4Rg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Add missing start and/or end of line regex
 anchors
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 19 Nov 2022 09:40:30 +0100
Cc: Nishanth Menon <nm@ti.com>, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-spi@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Samuel Holland <samuel@sholland.org>,
 Ilia Lin <ilia.lin@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, linux-pci@vger.kernel.org,
 Javier Martinez Canillas <javier@dowhile0.org>, linux-sunxi@lists.linux.dev,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Mack <zonque@gmail.com>,
 linux-renesas-soc@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
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

On Fri, Nov 18, 2022 at 11:38 PM Rob Herring <robh@kernel.org> wrote:
>
> json-schema patterns by default will match anywhere in a string, so
> typically we want at least the start or end anchored. Fix the obvious
> cases where the anchors were forgotten.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml         | 2 +-

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos
