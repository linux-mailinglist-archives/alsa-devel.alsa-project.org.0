Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 526997A94CC
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 15:29:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DAC4ECF;
	Thu, 21 Sep 2023 15:28:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DAC4ECF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695302957;
	bh=me873n3Yj9n1czKjtEbLrI/Z+x3xoMpgXSRWDChd8ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LsTUD3Ie/rhrTBEVxgBohJKKfkitgp0csroIlqDYhw9f8fi/eDEqagOP/SIZChAoD
	 AavpA8L9+iLXD5h8/eRKIoqlRs9kwvDSa16jL8FbfkA7XRPcURLl6GwfYxqV7l9GVt
	 Xxt5dsCKYCr1NbBcvuUffmwXI+wbdi2pZ0EFpv24=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81A53F805CA; Thu, 21 Sep 2023 15:24:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C901F8057C;
	Thu, 21 Sep 2023 15:24:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62400F8025A; Thu, 21 Sep 2023 12:30:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D1BAF800AA
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 12:30:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D1BAF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=msN/2AhI
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-31dcf18f9e2so746573f8f.0
        for <alsa-devel@alsa-project.org>;
 Thu, 21 Sep 2023 03:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695292223; x=1695897023;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=baNlgOJnWePw9cKCL/heNAHkNhAX0XDqCt8diliLsFk=;
        b=msN/2AhIYmuWzdxTnKufGR7I5QTyFfpbZJxKK3NUlvBUVQ503AwPsn7nVAWgX9Ydc5
         ZBvTo7q/MslV9FFRj6V0D2vblZxe43IOluOkKk29dch+ZnL/+/9LlsKJgHW+CkA6dBBp
         vck5Akmt/UF5/Zpe9+fg/kE7nOLc+PVs4TEHC354Hxa9dkRZswkpMTmi6u/3HtdA26W+
         AKA6mzDT65VgHGqRkF5HF5JNprGhMXNHUcVI8AvZzVBbrliwfyTAEgeavVSLlAXgOA0I
         KhLvA1Cv+DP9kgNnUO+aai/BGOVnWbNMPo4Uscj0DrRbA95hY0lG3I3/iIMkSw/YdQ3l
         pWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695292223; x=1695897023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baNlgOJnWePw9cKCL/heNAHkNhAX0XDqCt8diliLsFk=;
        b=Q9z+Bm04+uN66nPPJazfuIsOHqsI/veohPY/GWobH0omemJYo5m3qSre02zz4EsjA1
         ZHRakEmCWa/tzqqaoPkaFPFpKVo+/bLbdLxvOP8xv5ZTqYV5p9QrIm1N34hVJG1TFwOl
         4BdVlkd2UrSczTnFZr1WQK7uZx/4fw2HdfVX/j0aPcmkKfLVJTmWPxReJd4lyUb9cqUb
         cKV9Qk0VCr79LyXOswxLRinZuAQU3qvOgxNmjwqUV1aRvwm2uqYiAalgR1dqi3VedxAB
         L18nQ0XWL1TQWlV+khmYVrAi3lcxrvpvER2osbAPKU0nWp026hbBDMNAStbaDalSNdbM
         AYww==
X-Gm-Message-State: AOJu0YwHxFr1bmn1X+SY5R9yO1/RnIV6pnXnTBnHqg2cen7f4+Cky19d
	8N3PoybN+6f+ay4Ia0YjBrc=
X-Google-Smtp-Source: 
 AGHT+IH0koU/bsuvVlM3BjX3ipEkbzBkUBpc5x70WcHc8JTAs4gsHs92ZrhfG3MpQgIZzAVa/GzWJA==
X-Received: by 2002:adf:f084:0:b0:321:52fb:5703 with SMTP id
 n4-20020adff084000000b0032152fb5703mr4879118wro.13.1695292223361;
        Thu, 21 Sep 2023 03:30:23 -0700 (PDT)
Received: from ubuntu ([2a02:810d:1640:10d8:fd07:b1e6:bd19:371d])
        by smtp.gmail.com with ESMTPSA id
 n11-20020a5d4c4b000000b0031fbbe347ebsm1379868wrt.22.2023.09.21.03.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 03:30:22 -0700 (PDT)
Date: Thu, 21 Sep 2023 12:30:19 +0200
From: Joerg Schambacher <joerg.hifiberry@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: a-krasser@ti.com, joerg@hifiberry.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: pcm512x: Adds bindings for TAS575x devices
Message-ID: <ZQwbO6BuBOTuCI4C@ubuntu>
References: <20230907160851.14241-1-joerg.hifiberry@gmail.com>
 <20230912151535.GA812148-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230912151535.GA812148-robh@kernel.org>
X-MailFrom: joerg.hifiberry@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: H2R6P2GNVFLGGNCL3RDVJJSYRMRIHQ47
X-Message-ID-Hash: H2R6P2GNVFLGGNCL3RDVJJSYRMRIHQ47
X-Mailman-Approved-At: Thu, 21 Sep 2023 13:24:27 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H2R6P2GNVFLGGNCL3RDVJJSYRMRIHQ47/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Am 12.09.2023 um 10:15 hat Rob Herring geschrieben:
> On Thu, Sep 07, 2023 at 06:08:51PM +0200, Joerg Schambacher wrote:
> > The TAS5754/6 power amplifiers use the same pcm512x driver with
> > only minor restictions described in the bindings document.
> > 
> > Signed-off-by: Joerg Schambacher <joerg.hifiberry@gmail.com>
> > ---
> >  .../devicetree/bindings/sound/pcm512x.txt     | 22 +++++++++++++++----
> >  1 file changed, 18 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/pcm512x.txt b/Documentation/devicetree/bindings/sound/pcm512x.txt
> > index 3aae3b41bd8e..b16cd0463695 100644
> > --- a/Documentation/devicetree/bindings/sound/pcm512x.txt
> > +++ b/Documentation/devicetree/bindings/sound/pcm512x.txt
> > @@ -1,12 +1,12 @@
> > -PCM512x audio CODECs
> > +PCM512x and TAS575x audio CODECs/amplifiers
> >  
> >  These devices support both I2C and SPI (configured with pin strapping
> > -on the board).
> > +on the board). The TAS575x devices only support I2C.
> >  
> >  Required properties:
> >  
> > -  - compatible : One of "ti,pcm5121", "ti,pcm5122", "ti,pcm5141" or
> > -                 "ti,pcm5142"
> > +  - compatible : One of "ti,pcm5121", "ti,pcm5122", "ti,pcm5141",
> > +                 "ti,pcm5142", "ti,tas5754" or "ti,tas5756"
> >  
> >    - reg : the I2C address of the device for I2C, the chip select
> >            number for SPI.
> > @@ -25,6 +25,7 @@ Optional properties:
> >      through <6>.  The device will be configured for clock input on the
> >      given pll-in pin and PLL output on the given pll-out pin.  An
> >      external connection from the pll-out pin to the SCLK pin is assumed.
> > +    Caution: the TAS-desvices only support gpios 1,2 and 3
> >  
> >  Examples:
> >  
> > @@ -50,3 +51,16 @@ Examples:
> >  		pll-in = <3>;
> >  		pll-out = <6>;
> >  	};
> > +
> > +	tas5756: tas5756@4f {
> > +		compatible = "ti,tas5756";
> 
> Is there anything new here? Just a different compatible doesn't justify 
> another example.
> 
> With that dropped,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
Thanks for feedback. Actually, there is nothing really new. More to show
the reduced availability of GPIOs. I'm preparing a new version of the
patch and I will drop the example.
-- 


