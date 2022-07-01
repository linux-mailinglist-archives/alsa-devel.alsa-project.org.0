Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 966F45653A9
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:35:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32ADF17C6;
	Mon,  4 Jul 2022 13:34:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32ADF17C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656934539;
	bh=DyrTnFRCYabAdEWrvPD1VRj1XUM8xdno/FrL0v2t+L0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R5PRG4+PwVT/0BwPSYcLyhwNqWI2S5EElJb51AtEfmGW/NBamMC9tIxP1c03sApR0
	 +kT9QSXKp19+NqlKj36fWvIw/eRX9jGHcgnBkPNyZ/+uXNVWd8BFem4ymcqUNmclDF
	 zTkmM4wmEMIVPI2mCpK+siSuylAu8FpEUuJ1YiWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D15DFF8060E;
	Mon,  4 Jul 2022 13:23:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 750EBF80155; Fri,  1 Jul 2022 21:39:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BC8BF800E8
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 21:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BC8BF800E8
Received: by mail-io1-f49.google.com with SMTP id d3so3191351ioi.9
 for <alsa-devel@alsa-project.org>; Fri, 01 Jul 2022 12:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yIjC0VMQYlxHq3YH9uFPu/iSI53LcMMtf9U7T5PvCVs=;
 b=5m7xjvCL9bkyL2jSpdJfKZOL66fvbaP8QGZrAEo3KGftVKZr3rtGN6Jp4fv7RWPAVn
 gMHQ1+BFh1K9+Nm/5+QoP+fJt+hzcPgSQ6d5QjzS2nIpgtwhClafjnZgdE+2YV5QKcM8
 YCDZFW6DGkri6LA3MFxr13nCg5e0VuBTw3chmZ4QJoC4E80Olp93Zoh9C6FkyWM+sKa1
 qgAT4rLqvP8aIgR01ZLrHA4AfFFJff+kSeCykxoX7vl+Uf6GSIcmUKGzr6Om4xpEvSFV
 7JMjVy9U5CwDjzewBHqy3XoTg1pT1JLmzISzoI2HTleVrbqld9GGic7zmx1HO/lCWbZf
 03vA==
X-Gm-Message-State: AJIora9tC1aRUxXLJ/tiE9A84T5Igz0L40dMSHXD65aviMhgVNp8JUT6
 3w8mSYV198Euc6MkOieZJA==
X-Google-Smtp-Source: AGRyM1uDFG3jh7RbZC85xymUau5rtrth9s79OSclwWORLisSXLGll3gQmu6p4g13FmIUZ+MxpdIJrQ==
X-Received: by 2002:a05:6638:250b:b0:331:b103:8b2b with SMTP id
 v11-20020a056638250b00b00331b1038b2bmr10057080jat.246.1656704383511; 
 Fri, 01 Jul 2022 12:39:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a02a183000000b003316f4b9b26sm10145706jah.131.2022.07.01.12.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 12:39:43 -0700 (PDT)
Received: (nullmailer pid 1387930 invoked by uid 1000);
 Fri, 01 Jul 2022 19:39:39 -0000
Date: Fri, 1 Jul 2022 13:39:39 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v3 03/15] ASoC: dt-bindings: convert designware-i2s to
 dt-schema
Message-ID: <20220701193939.GA1387897-robh@kernel.org>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-4-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629184343.3438856-4-mail@conchuod.ie>
X-Mailman-Approved-At: Mon, 04 Jul 2022 13:23:02 +0200
Cc: Niklas Cassel <niklas.cassel@wdc.com>, alsa-devel@alsa-project.org,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Vetter <daniel@ffwll.ch>, dmaengine@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>
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

On Wed, 29 Jun 2022 19:43:32 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the Synopsys DesignWare I2S controller binding to dt-schema.
> There was no listed maintainer but Jose Abreu was the last editor of the
> txt binding so add him as maintainer.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/sound/designware-i2s.txt         | 35 -------
>  .../bindings/sound/snps,designware-i2s.yaml   | 94 +++++++++++++++++++
>  2 files changed, 94 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/designware-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
