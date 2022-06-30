Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6C356534B
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:26:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B47A1744;
	Mon,  4 Jul 2022 13:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B47A1744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656933968;
	bh=eFds5R69kfJPzd0u5cfkH0O58OSu7oo6577dkq2KCGw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CgS3omQ6VaMwtAY4ZeCcWCwRofwOiS490XUX3RCYTM9S2dxnDeJqEuxOfi0weaSyk
	 T+VBm6Mbhd+lb3sTKjQSNle5lZdERwU5daIn1Y1aTZd1PQTLkImijHN3mp+OOfRpC0
	 8qqrI4ebIuOis1mvYa1clAQkHqtjXcH1YDNmSTLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDBECF8055C;
	Mon,  4 Jul 2022 13:23:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07DF7F804D8; Thu, 30 Jun 2022 23:43:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DD68F800F5
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 23:43:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DD68F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lrWda6wW"
Received: by mail-lj1-x231.google.com with SMTP id b23so318667ljh.7
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 14:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=m2lAzkI1kyUA6X4SSjR8xwr1vZy0wQogLl8c1xpaHQU=;
 b=lrWda6wWNqrPSJmZGSOm1ISr7wKduLFWi1rtfL/yScVS9rHmDVD4N/9zCj+VSJ1+Oa
 FO9NZKuJMIQLUjdIYTiAb8HTBGYm+o9Ez2NIlum6kfuR5+fovJBM/7p+CV2LxVlJ3E6G
 KbNf1TNhzph7T0TL/sDQ4Hw8iQagGqS9jY2lgDmk2pKIsLr0eEUC7CM3K/ir9SVbBuVr
 mnIbczJybBGXfmK7KjkwqGLjfxGX15NKjz6h67HEK5siEgqdufHy9gcSjXVGAN/0WIOu
 yx7sM7I+pjTlcSePBegIfy7IPhw66UH8cQ9c4cOTJEpeHnzk0zgK/utetinXxDnU/V10
 Rp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m2lAzkI1kyUA6X4SSjR8xwr1vZy0wQogLl8c1xpaHQU=;
 b=JMWLA3dNctEsc5/rZzQnX6chkaay6QgxCXXhpPRhsSgeVip5aDruU46vzwq/q71A2B
 /UUGqzGEbCnFZgT1NstjBNfN9liKoqJzXb0MysecJ0s5xMJH313OQn6zEOrucwidLZjj
 jA1vpONoKqfX9EDXMVoADkA7tdEypkIzizeNRAo0Pxua/3HjqQEh94gLX9paXOFf/O9n
 M8OpuS3ihKgsxUUFvwoPnH1u3F3ksMseC9iLIsbLptIS4Al5KJZEVC2sfuJpLQ+dBcF6
 VhCRhHIb5ZOYVRkin1Q2qib3NmsjSbKYeMBYU+YLubVnlDEA6uD4ADbwmaHucJawup1h
 hBOQ==
X-Gm-Message-State: AJIora9UWfoq2nKQ9J7VsbCacsaIJbiK4Ya6MpIQNEW+aHrPOV9L2XwM
 IetVK++0KlMrIF25TXQ5dIE=
X-Google-Smtp-Source: AGRyM1tiXOSoDewIDtJQjZ6heJh2v6Etx9okcGhLJIyxUHhTxknHodjEWzqlCQs2mLldDoYhOHP8Ow==
X-Received: by 2002:a2e:a793:0:b0:25a:74f4:b377 with SMTP id
 c19-20020a2ea793000000b0025a74f4b377mr6429372ljf.177.1656625419868; 
 Thu, 30 Jun 2022 14:43:39 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
 by smtp.gmail.com with ESMTPSA id
 v22-20020ac258f6000000b00478f739f1fdsm3296894lfo.103.2022.06.30.14.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 14:43:39 -0700 (PDT)
Date: Fri, 1 Jul 2022 00:43:36 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v3 04/15] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width
Message-ID: <20220630214336.tyhll4ldrgdibnjv@mobilestation>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-5-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629184343.3438856-5-mail@conchuod.ie>
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
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>,
 dmaengine@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
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

On Wed, Jun 29, 2022 at 07:43:33PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Most users of dw-apb-ssi use spi-{r,t}x-bus-width of 1, however the
> Canaan k210 is wired up for a width of 4.
> Quoting Serge:
> The modern DW APB SSI controllers of v.4.* and newer also support the
> enhanced SPI Modes too (Dual, Quad and Octal). Since the IP-core
> version is auto-detected at run-time there is no way to create a
> DT-schema correctly constraining the Rx/Tx SPI bus widths.
> /endquote
> 
> As such, drop the restriction on only supporting a bus width of 1.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

> 
> Link: https://lore.kernel.org/all/20220620205654.g7fyipwytbww5757@mobilestation/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> index e25d44c218f2..0a43d6e0ef91 100644
> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -143,12 +143,6 @@ patternProperties:
>          minimum: 0
>          maximum: 3
>  
> -      spi-rx-bus-width:
> -        const: 1
> -
> -      spi-tx-bus-width:
> -        const: 1
> -
>  unevaluatedProperties: false
>  
>  required:
> -- 
> 2.36.1
> 
