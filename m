Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39042565362
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:28:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95F9F1734;
	Mon,  4 Jul 2022 13:27:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95F9F1734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656934096;
	bh=sDrMlJqnDeKDYNsEYSgfP3tww/h6vhpGEkofwSTH9PY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vy+1fV2DlLBlRw3YTIcuiHhBi8STMJxIY/C8sXspwJ15GaSsW67Y88shH2LWBk2bf
	 OOiuaSLeiLYHGKp8YX3nBOF/TQkEebKSt/pFlvZ5e/JlFxFRJtgMsUBC/9bZhF8MZv
	 kjXCOXM+3WHOyvZs5fr6Zx1mNS62bzVyP+Kw6CVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED1DCF805B5;
	Mon,  4 Jul 2022 13:23:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 223E7F800F5; Thu, 30 Jun 2022 23:55:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 091CDF800F5
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 23:55:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 091CDF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AkPzOgMf"
Received: by mail-lf1-x136.google.com with SMTP id i18so610986lfu.8
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 14:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=80eW9Jq1ijIJLJtHfGhI83NTX/9vTLnN/UmyaBuaW4E=;
 b=AkPzOgMfGFfZSjZD7jfIt2VIntAlLoUSr3SbzTZY0tvDU2JAbZAB5jwCcqhRCkAM2f
 SZMaXzambC5XvJqoJSqZhCYJjt3IvVCp+6BwaWT4/O99SY2jx12hO35bgEKhKuKxejcQ
 dE2URnyS5yf1nh9ijeSAcPycHs2KVfpVtk/PdoQ7jD6COfYLF+mrcrO6e33CUzwQZPGY
 APDYTngSt7Y+GPy5o8I+w1G0pNyoFvpS1MDQY6Dnc7Ax6wnu+jMdv5Clu6vCV+9thnMt
 x6/8Y8TfDG/rsDa4DJ2sM0E7/R76fWr9+E3VerI/dstVRhBOWwsbw1sjWfdYFwEvwyeZ
 Vx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=80eW9Jq1ijIJLJtHfGhI83NTX/9vTLnN/UmyaBuaW4E=;
 b=PUPUFR6S2qo+y4Fwvg7pL+PCPPZ0uosD4mgK0dFzQlCrf2kqiEFy96ziFTxTILqn+J
 TKbDiSOVp6lSsBGmKyqtaB15RsV2PT5ft6cRIac5fRcFDwZvnf697ozJ1BRDy2WCTZPa
 Q6OubO0UGvRKh7Kd7JBKfNsDRofrPIHCZS1YG2E+H7g+RbP/2sL7UpUJxvRRSFJ4dkvf
 89D7ePTTRZo5pCr5M2JiDid41UlYYEIr2mmoSGsJfXEqYbsnOS/HMpG7+fRMgfHmxf9I
 nMGftEGiLj10RMqEMURAhiOJ6v1xWv7i3LSGlOOz6Zz2XlfZycaySLoa+WfwP6HbKaDW
 AcmA==
X-Gm-Message-State: AJIora8XkGodrZFYNXohSVuQGd3wdotSqEQ0Frph4+vlZ+T4UZJJ9kyz
 nRqI56IM/iMxdu1QGe9O+Nw=
X-Google-Smtp-Source: AGRyM1uQwi4ck8oI9eCwLDrSO3GQoKmA3R5saWkWWfnF2szv6WIcphr08hrqWMNbe4QePSuxVMEb9g==
X-Received: by 2002:a05:6512:118f:b0:47f:6a1a:20d4 with SMTP id
 g15-20020a056512118f00b0047f6a1a20d4mr6526103lfr.428.1656626143761; 
 Thu, 30 Jun 2022 14:55:43 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
 by smtp.gmail.com with ESMTPSA id
 e12-20020ac24e0c000000b00478a311d399sm3304595lfr.0.2022.06.30.14.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 14:55:43 -0700 (PDT)
Date: Fri, 1 Jul 2022 00:55:40 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v3 05/15] dt-bindings: dma: dw-axi-dmac: extend the
 number of interrupts
Message-ID: <20220630215540.cifnzovya57bgbsw@mobilestation>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-6-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629184343.3438856-6-mail@conchuod.ie>
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

On Wed, Jun 29, 2022 at 07:43:34PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
> controller, but according to the documentation & devicetree it has 6
> interrupts rather than the standard one. Support the 6 interrupt
> configuration by unconditionally extending the binding to a maximum of
> 8 per-channel interrupts thereby matching the number of possible
> channels.
> 
> Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 51
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> index 4324a94b26b2..e33ef22aec9c 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> @@ -34,7 +34,9 @@ properties:
>        - const: axidma_apb_regs
>  
>    interrupts:

> -    maxItems: 1
> +    description: per channel interrupts

Description is inaccurate. It's either combined or per-channel IRQs.

Other than that:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

> +    minItems: 1
> +    maxItems: 8
>  
>    clocks:
>      items:
> -- 
> 2.36.1
> 
