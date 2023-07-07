Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 237BF74B410
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jul 2023 17:22:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36A1474C;
	Fri,  7 Jul 2023 17:21:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36A1474C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688743325;
	bh=cJJPZi46bWM+uwHRkLNzoJ2gGXrUh7ol1SNbDaygmUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A4sztbTXtATt4kWH6bK9FH7bcieFSFXufcTj5SxgvcviDepaakPVR6r2EuOMWYHwI
	 9Y3fVCCYreg7CeiD5tcRym9gVX4IH6qAMOWr47a5ZqHYGHtHrupMYCccJQargBI3P3
	 W5AMK10HPhp3NiOumSJuQEBCQ/jwYcQ1lVpOvpWk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AD6DF80124; Fri,  7 Jul 2023 17:21:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5C8AF80124;
	Fri,  7 Jul 2023 17:21:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D86B3F80125; Fri,  7 Jul 2023 17:21:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6309F80093
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 17:21:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6309F80093
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3464c774f23so1030295ab.1
        for <alsa-devel@alsa-project.org>;
 Fri, 07 Jul 2023 08:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688743263; x=1691335263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rL/IqSliQWE/k5qHxsNvvh1YZrhQdGRZyr99h97/eUY=;
        b=PzdvhWxgMd4UcOB7+AiS6lsV4ixZcbIIZaLGFi5KeUUvk4gF9zaqQGNf8siEHnPQIw
         lndaoe0Ihi3jX77r3gr2rRi4kTMLGmY8kJb+JqJ+Xb7TYdeg+amTIhiLTJJEpEjnYh5y
         ZmAApsvemg5RnH/TakBYj9HR79xQe0A7wR/Mz7q8ymVWBRANimjj+sLFI/+QLJIDmn9v
         QePk3xvHXZmQGM/wZ2Gqaf/4iprhxhJZkwGOpuduozLd4QUMXp3+Msg7ASDPnw/2Lktx
         Xw/lccYk4E1GtE5+aVq/14hRkr4sSDKYHQ/HGfiqyZT0fObsDZgaUNmdfo5pry9mvEYK
         bf5A==
X-Gm-Message-State: ABy/qLZ5/9StZmO3zKhkT/nrMKay+rnlO5Toq+2cAeAqzmQXLzEvAE8d
	mGvVtrah69RXT1b+EgcPd9f58I2TJA==
X-Google-Smtp-Source: 
 APBJJlFyYg4jsqLMtrZwdHhLv4pwfC6duMAPrAIt71GIj1jKSnKNUViqYaVUZmofZqUjjxCTBsm9Mg==
X-Received: by 2002:a92:de12:0:b0:346:b85:5f2 with SMTP id
 x18-20020a92de12000000b003460b8505f2mr5198421ilm.23.1688743262706;
        Fri, 07 Jul 2023 08:21:02 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 b11-20020a92dccb000000b00325e56c1cdcsm1386377ilr.49.2023.07.07.08.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 08:21:01 -0700 (PDT)
Received: (nullmailer pid 327561 invoked by uid 1000);
	Fri, 07 Jul 2023 15:20:56 -0000
Date: Fri, 7 Jul 2023 09:20:56 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	alexandre.torgue@foss.st.com, vkoul@kernel.org, jic23@kernel.org,
	olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com, mchehab@kernel.org,
	fabrice.gasnier@foss.st.com, andi.shyti@kernel.org, ulf.hansson@linaro.org,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	hugues.fruchet@foss.st.com, lee@kernel.org, will@kernel.org,
	catalin.marinas@arm.com, arnd@kernel.org, richardcochran@gmail.com,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 04/10] dt-bindings: treewide: add feature-domains
 description in binding files
Message-ID: <20230707152056.GA317056-robh@kernel.org>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-5-gatien.chevallier@foss.st.com>
 <20230706145108.GA3858320-robh@kernel.org>
 <0aaace47-1bb4-82c5-57a5-6f5d27eb4d45@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0aaace47-1bb4-82c5-57a5-6f5d27eb4d45@foss.st.com>
Message-ID-Hash: 22KMB6QERUJMRG2P45LKWTGFU73VZH5V
X-Message-ID-Hash: 22KMB6QERUJMRG2P45LKWTGFU73VZH5V
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/22KMB6QERUJMRG2P45LKWTGFU73VZH5V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 07, 2023 at 02:28:28PM +0200, Gatien CHEVALLIER wrote:
> Hello Rob,
> 
> On 7/6/23 16:51, Rob Herring wrote:
> > On Wed, Jul 05, 2023 at 07:27:53PM +0200, Gatien Chevallier wrote:
> > > feature-domains is an optional property that allows a peripheral to
> > > refer to one or more feature domain controller(s).
> > > 
> > > Description of this property is added to all peripheral binding files of
> > > the peripheral under the STM32 firewall controllers. It allows an accurate
> > > representation of the hardware, where various peripherals are connected
> > > to this firewall bus. The firewall can then check the peripheral accesses
> > > before allowing it to probe.
> > > 
> > > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> > > ---
> > > 
> > > Disclaimer: Some error with dtbs_check will be observed as I've
> > > considered the property to be generic, as Rob asked
> > > 
> > >   Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml  | 4 ++++
> > >   Documentation/devicetree/bindings/dma/st,stm32-dma.yaml      | 4 ++++
> > >   Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml   | 4 ++++
> > >   Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml      | 4 ++++
> > >   Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 4 ++++
> > >   .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 ++++
> > >   Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 4 ++++
> > >   .../devicetree/bindings/media/cec/st,stm32-cec.yaml          | 4 ++++
> > >   Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml   | 4 ++++
> > >   .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml       | 4 ++++
> > >   Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml  | 4 ++++
> > >   Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml   | 5 +++++
> > >   Documentation/devicetree/bindings/mmc/arm,pl18x.yaml         | 4 ++++
> > >   Documentation/devicetree/bindings/net/stm32-dwmac.yaml       | 4 ++++
> > >   Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml | 4 ++++
> > >   .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml      | 4 ++++
> > >   Documentation/devicetree/bindings/rng/st,stm32-rng.yaml      | 4 ++++
> > >   Documentation/devicetree/bindings/serial/st,stm32-uart.yaml  | 4 ++++
> > >   Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml    | 4 ++++
> > >   Documentation/devicetree/bindings/sound/st,stm32-sai.yaml    | 4 ++++
> > >   .../devicetree/bindings/sound/st,stm32-spdifrx.yaml          | 4 ++++
> > >   Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml     | 4 ++++
> > >   Documentation/devicetree/bindings/spi/st,stm32-spi.yaml      | 4 ++++
> > >   Documentation/devicetree/bindings/usb/dwc2.yaml              | 4 ++++
> > >   24 files changed, 97 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> > > index b767ec72a999..daf8dcaef627 100644
> > > --- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> > > +++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> > > @@ -50,6 +50,10 @@ properties:
> > >     power-domains:
> > >       maxItems: 1
> > > +  feature-domains:
> > > +    minItems: 1
> > > +    maxItems: 3
> > 
> > What are the 3 entries?
> > 
> > Rob
> 
> I thought I was benefiting from the description of the pattern-property in
> the RIFSC YAML file. But yes anyway, it seems like it needs some description
> here as the dependency does not appear in this file.

Humm, that should limit the maximum entries to 2, so 3 would never work 
(if RIFSC is the parent). 

> I picked 3 as a maxItems for our ST needs, I'll give it some more thought
> when coming back with something clearer.

I'd expect you have 1 entry for register bus and 1 entry for DMA bus if 
there is one. It's block specific for how many entries, so the RIFSC 
schema should not be setting that. You could possibly say that 
'feature-domains' is required for all the child nodes though.

Rob
