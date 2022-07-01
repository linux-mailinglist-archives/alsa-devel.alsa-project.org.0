Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A99AA5653AC
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:35:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B52517EB;
	Mon,  4 Jul 2022 13:35:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B52517EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656934555;
	bh=Dj7V5Xz9MB/J0iCtVzbAD5S4vnmPfv7oAFjVND6HPP0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZXja/xfZLx909OHzDzXUxXdipFi7HsfQ0+IRDPA6u0/dMZdRFt3KC8RIeeIWPySNN
	 WOtyrqePmzwqbLv5y9EnG6UbU+nsBUqFFb13UukDFfs1sIeqrchZX0tJu6/A/g4UvT
	 xsEFxe9SOAhx5UcdoOEclveShFMnax68jHT9+6iA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A26BF80649;
	Mon,  4 Jul 2022 13:23:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4427AF800E8; Fri,  1 Jul 2022 21:41:21 +0200 (CEST)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 297B7F800E8
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 21:41:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 297B7F800E8
Received: by mail-io1-f49.google.com with SMTP id p128so3242622iof.1
 for <alsa-devel@alsa-project.org>; Fri, 01 Jul 2022 12:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RHrkVsGF6yh4atuN/qmRjWl7VEZw4egW+a3OkfBFnbM=;
 b=o/dm4fNWZPY19EgcCosibxowpJLTGQ4k39wMWmr3expB/qjhzViPK+vk4y0ueYNru+
 C/ngM8YEBhDogvsOdcxOnZy12/zkMVJ2ABRKgfqiUqYY43leROb9+KPW4gSQC05lcUFN
 etsnLU9AF4blSbHjbz3yhARIVHTmUi+/QlqZZ1hZyqkCt84pT2I+kmaTb1LrG/207Ans
 WEbO0TMldiQCWh9LZtMpr3cZXutdT3Fk/P8t399Dg0aAKaUP5T3jWKZ2xypmdpzL9E0Q
 03/YBnYre2jN7CwyppHjio0Evwllq8dWwm7f7Qse7J0hCzlXqDXYkWd0wb6OzR9Imzba
 raFg==
X-Gm-Message-State: AJIora+y0+DAmJ0h4Tq6KTyG+/C4HY5FoAOnc43IF31VP+BsnXFw3oF2
 mzkDtrOnVc/McFZKXr4rSQ==
X-Google-Smtp-Source: AGRyM1tlsN2RCONvqgzA0GpBUrUts90pmA7r74l1wJj1YnzPtK+Cu6hEsfzhUTYnzJsijdJvLVfcBg==
X-Received: by 2002:a05:6638:33a4:b0:33e:9335:9f0e with SMTP id
 h36-20020a05663833a400b0033e93359f0emr5171953jav.260.1656704473689; 
 Fri, 01 Jul 2022 12:41:13 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 y1-20020a02a381000000b00339c855eb15sm10186415jak.27.2022.07.01.12.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 12:41:13 -0700 (PDT)
Received: (nullmailer pid 1390347 invoked by uid 1000);
 Fri, 01 Jul 2022 19:41:10 -0000
Date: Fri, 1 Jul 2022 13:41:10 -0600
From: Rob Herring <robh@kernel.org>
To: Conor.Dooley@microchip.com
Subject: Re: [PATCH v3 05/15] dt-bindings: dma: dw-axi-dmac: extend the
 number of interrupts
Message-ID: <20220701194110.GA1388036-robh@kernel.org>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-6-mail@conchuod.ie>
 <20220630215540.cifnzovya57bgbsw@mobilestation>
 <f7d64f1d-9fb8-6259-cd60-8bfc65636300@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7d64f1d-9fb8-6259-cd60-8bfc65636300@microchip.com>
X-Mailman-Approved-At: Mon, 04 Jul 2022 13:23:02 +0200
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org,
 sam@ravnborg.org, damien.lemoal@opensource.wdc.com, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com, mail@conchuod.ie,
 tglx@linutronix.de, dillon.minfei@gmail.com, lgirdwood@gmail.com,
 fancer.lancer@gmail.com, linux-spi@vger.kernel.org, vkoul@kernel.org,
 palmer@dabbelt.com, daniel@ffwll.ch, dmaengine@vger.kernel.org,
 masahiroy@kernel.org
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

On Thu, Jun 30, 2022 at 11:12:53PM +0000, Conor.Dooley@microchip.com wrote:
> On 30/06/2022 22:55, Serge Semin wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Wed, Jun 29, 2022 at 07:43:34PM +0100, Conor Dooley wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
> >> controller, but according to the documentation & devicetree it has 6
> >> interrupts rather than the standard one. Support the 6 interrupt
> >> configuration by unconditionally extending the binding to a maximum of
> >> 8 per-channel interrupts thereby matching the number of possible
> >> channels.
> >>
> >> Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 51
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >> ---
> >>  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> >> index 4324a94b26b2..e33ef22aec9c 100644
> >> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> >> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> >> @@ -34,7 +34,9 @@ properties:
> >>        - const: axidma_apb_regs
> >>
> >>    interrupts:
> > 
> >> -    maxItems: 1
> >> +    description: per channel interrupts
> > 
> > Description is inaccurate. It's either combined or per-channel IRQs.
> 
> I will change it to:
>   interrupts:
>     description: |

Don't need '|'.

>       If the IP-core synthesis parameter DMAX_INTR_IO_TYPE is set to 1, this
>       will be per-channel interrupts. Otherwise, this is a single combined IRQ
>       for all channels.
>     minItems: 1
>     maxItems: 8
> 
> How's that sound?

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
