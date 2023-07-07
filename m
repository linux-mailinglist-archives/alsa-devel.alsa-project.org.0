Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C8674B44A
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jul 2023 17:28:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46C4974C;
	Fri,  7 Jul 2023 17:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46C4974C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688743718;
	bh=W4ZKgiVzgoq95GfwprRoOXwWhzb9mpha12PYiBqGjrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LEU4QwuV1wsQOHNRcf1DGmzTetR/JD4Ywid9DLqnrMCORNC5uulLKzPGyinoA8DpI
	 9+AW5Z001lvjNtx1dglKi3vBzl89ArtEYLPgy+Oc+hBn1kBQjgrNuBewSmuwuyzTAk
	 0EGEuufj8gNNubKoUNJUT4q6XQpTAqg/HZCI93k4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3054F80549; Fri,  7 Jul 2023 17:27:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 569A4F8025F;
	Fri,  7 Jul 2023 17:27:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 685BCF80272; Fri,  7 Jul 2023 17:27:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19255F80104
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 17:27:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19255F80104
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-345df4e68afso7731675ab.0
        for <alsa-devel@alsa-project.org>;
 Fri, 07 Jul 2023 08:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688743650; x=1691335650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSMX3fbwS3ZdQ14KbIA9PVvNgGYdtwwGwe8Mi8kgYeU=;
        b=MKZ7plWJUq1j8NtjYQTxFs8Rva8b3oi8GtIyxjdeF+tut5HAUUCsmWjb5XBE/UxuvV
         lghHoOzSUy7sCIprxl4BxLljWQq1konG4NZxhqk1Oofzki9i+RU9047nhKCOXpKHkfFZ
         DO1OVMY+n/WYhLbSys3PO8dtjMLOlPTPvyP1uJQBVSspRtgPG9dK/WdBD6msrniLf5rl
         82CiUQ+zKgqzQN/Dh3JZK7VgyhL9Dubfv7c2XS1aWQJhah5qkQpLkHhCS353/HFXy0di
         E3vvA0yZXefEnd5OkG7nkOuD2G9tHmK+S+wNsCL5R/CfJrZM83LUI42x8wSU+08DnkSB
         EGHg==
X-Gm-Message-State: ABy/qLZ2XoGfJrXZtI2j8TwTmXq75jJEPC1kFH8m3uBRhelWgUf6czEY
	H9q3/xponQ0E3v3EB47FeQ==
X-Google-Smtp-Source: 
 APBJJlGQb/+NSo1YY2XQiOfry0niDhsIK8kPOwBt3oTrgIhTVOV41ugAIwkpb1OfmPqwJ646BYkBgA==
X-Received: by 2002:a92:c70f:0:b0:345:c11e:d1ad with SMTP id
 a15-20020a92c70f000000b00345c11ed1admr5255201ilp.26.1688743649601;
        Fri, 07 Jul 2023 08:27:29 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 ee17-20020a056638293100b0042b37080b23sm1279795jab.73.2023.07.07.08.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 08:27:28 -0700 (PDT)
Received: (nullmailer pid 334293 invoked by uid 1000);
	Fri, 07 Jul 2023 15:27:24 -0000
Date: Fri, 7 Jul 2023 09:27:24 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 "davem@davemloft.net" <davem@davemloft.net>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"olivier.moysan@foss.st.com" <olivier.moysan@foss.st.com>,
	"arnaud.pouliquen@foss.st.com" <arnaud.pouliquen@foss.st.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
	"fabrice.gasnier@foss.st.com" <fabrice.gasnier@foss.st.com>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"hugues.fruchet@foss.st.com" <hugues.fruchet@foss.st.com>,
 "lee@kernel.org" <lee@kernel.org>,
	"will@kernel.org" <will@kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"arnd@kernel.org" <arnd@kernel.org>,
 "richardcochran@gmail.com" <richardcochran@gmail.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 04/10] dt-bindings: treewide: add feature-domains
 description in binding files
Message-ID: <20230707152724.GA329615-robh@kernel.org>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-5-gatien.chevallier@foss.st.com>
 <875y6vzuga.fsf@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875y6vzuga.fsf@epam.com>
Message-ID-Hash: OVVXK7O6YF6EJ4ON5ZDQEDKAMYRDX7NN
X-Message-ID-Hash: OVVXK7O6YF6EJ4ON5ZDQEDKAMYRDX7NN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OVVXK7O6YF6EJ4ON5ZDQEDKAMYRDX7NN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 07, 2023 at 02:07:18PM +0000, Oleksii Moisieiev wrote:
> 
> Gatien Chevallier <gatien.chevallier@foss.st.com> writes:
> 
> > feature-domains is an optional property that allows a peripheral to
> > refer to one or more feature domain controller(s).
> >
> > Description of this property is added to all peripheral binding files of
> > the peripheral under the STM32 firewall controllers. It allows an accurate
> > representation of the hardware, where various peripherals are connected
> > to this firewall bus. The firewall can then check the peripheral accesses
> > before allowing it to probe.
> >
> > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> > ---
> >
> > Disclaimer: Some error with dtbs_check will be observed as I've
> > considered the property to be generic, as Rob asked
> >
> >  Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml  | 4 ++++
> >  Documentation/devicetree/bindings/dma/st,stm32-dma.yaml      | 4 ++++
> >  Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml   | 4 ++++
> >  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml      | 4 ++++
> >  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 4 ++++
> >  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 ++++
> >  Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 4 ++++
> >  .../devicetree/bindings/media/cec/st,stm32-cec.yaml          | 4 ++++
> >  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml   | 4 ++++
> >  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml       | 4 ++++
> >  Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml  | 4 ++++
> >  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml   | 5 +++++
> >  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml         | 4 ++++
> >  Documentation/devicetree/bindings/net/stm32-dwmac.yaml       | 4 ++++
> >  Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml | 4 ++++
> >  .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml      | 4 ++++
> >  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml      | 4 ++++
> >  Documentation/devicetree/bindings/serial/st,stm32-uart.yaml  | 4 ++++
> >  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml    | 4 ++++
> >  Documentation/devicetree/bindings/sound/st,stm32-sai.yaml    | 4 ++++
> >  .../devicetree/bindings/sound/st,stm32-spdifrx.yaml          | 4 ++++
> >  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml     | 4 ++++
> >  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml      | 4 ++++
> >  Documentation/devicetree/bindings/usb/dwc2.yaml              | 4 ++++
> >  24 files changed, 97 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> > index b767ec72a999..daf8dcaef627 100644
> > --- a/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> > +++ b/Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml
> > @@ -50,6 +50,10 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >  
> > +  feature-domains:
> > +    minItems: 1
> > +    maxItems: 3
> > +
> 
> I beliewe feature-domains is generic binding. This means that maxItems
> can be implementation dependend. I would rather drop maxItems so the
> following format will be possible:
> 
>           feature-domains = <&etzpc 1>, <&etzpc 2>, <&some_other_domain 1 2 3 4>
>           feature-domain-names = "firewall 1", "firewall 2", "other_domain"

The above already allows this (not -names, but the number of entries).
> 
> Also I beliewe driver will handle feature-domain-names property so it
> will parse feature-domains only related to the firewall.

Now I'm curious. What's an example that's not a firewall?

(Note I'm still not happy with the naming of 'feature' as anything is a 
feature, but that's the least of the issues really.)

Rob
