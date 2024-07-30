Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B3C9429B6
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:55:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 689532DB3;
	Wed, 31 Jul 2024 10:55:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 689532DB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722416127;
	bh=+SZusJMwP5eTibZ0Xgy1WVMZxJPy4VghvcWPJCa+v2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dn3O8uX6DBaRaDM2gsQaf+vTDTHVhr+/iDezl3bSDDpkOA/IeBogrB0FwHDBCUYeq
	 hWbNup+AhXhVyE0o+zmVjcyDIuhJ0kMPn4vUgNbPEZU7/t7ldrNbStkvCjNXhL4hLH
	 NU1eXhy7aWNeDkgq1GMAdpZD+Af1K86DZOhg7MMA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15BBEF896FA; Wed, 31 Jul 2024 10:50:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9EC9F896F1;
	Wed, 31 Jul 2024 10:50:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7151DF802DB; Tue, 30 Jul 2024 12:30:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31057F800E3
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 12:30:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31057F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FiuxUBES
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5b01af9b0c9so3241582a12.3
        for <alsa-devel@alsa-project.org>;
 Tue, 30 Jul 2024 03:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722335440; x=1722940240;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gfgTeO7eFehEfuHZo0dSc8+LCrIJf/o/Tpdg8fxovkI=;
        b=FiuxUBESBOBK1nVv0UE60b3K3EWiFDZWHh+WvCcYkZravIdDa/HW8ePVk1J462Si3T
         RQSi6vcPL+m1gGgnPtiWRgvI/ooB5GyhSqB/n9mFDBEgJwbzIQ2pvXaShm6zkoEZzSqE
         olORhRNBehwTqKnbPc3KKWIvsPvDjvCafGEA47xVqXibNcXeuNHbr2wdexELfEaFt/uH
         Xm1fISb3XcLoP/1kvHPI4luiNxwipa6vnzJX52J8+r5Dn/U5SLH9SopXQKr7wb+zbjjd
         8FpP/lgSA9wtqm1vxpMeDKT+KbtRh75KiMn4Tt6dnV1TLE2Jk+NH9uFSEjahC3JWgFuZ
         2t5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722335440; x=1722940240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfgTeO7eFehEfuHZo0dSc8+LCrIJf/o/Tpdg8fxovkI=;
        b=lIGFKYrt2AZZeSnN332eipCkZMkerdc6g59TUT9BywFXQEffNZZNk2/Ku3xz5IXixA
         KSLGY75dKJ0V/c6sNNqvMDkX+Vyj02sQeA7mm5mt3T9vfa+vM9SCjbhGGS9ZD57UiytM
         k9wah6zEHRQ4BNr3/i8BU/kx5+cMIsLjWyv6h9yCgu//SnZ53WuCzklOfyuC/ENA18+A
         qNTR1vrHOViW5pJKegCKr4QsAZcjgZaN/DhQmNSpG/V4mrd23gXBK/s5f1ENnKYo/lSP
         fLyCq2dPn32OX9qldb9OpxiQg/cES1bkFP4tXrbWs7IUtTQeQvHYSo5IfGXbLf99geo8
         oDLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW21x2yrJDmPUmnZSLNPmdsausdlRF+bI49Y+OfWmaY4X1hTMXiD7owafez60TY8yX6z6DneydDadLt+k7jaKh5VffU4aT0wNdqCuE=
X-Gm-Message-State: AOJu0Yw0uFUUQX9uwGCCSBiafXEBvu859g9SyGWI5/HQd+DaDJNvzQQf
	D4jomWRn9YyObAKW8kC5kwTABFgHrqYb6amSubMrG2mBKgfRB4LJXMJzKYoKRyk=
X-Google-Smtp-Source: 
 AGHT+IGxx92z7IX9vhw/RN+EO3wwfQ/M++6atfLPhpUAf+bjo2ykfbCE8+G6Hz0TR83vimf4DR4ZTQ==
X-Received: by 2002:a17:906:dc8b:b0:a7a:aa35:4091 with SMTP id
 a640c23a62f3a-a7d3ff5b256mr842252966b.25.1722335440243;
        Tue, 30 Jul 2024 03:30:40 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff1f:b280:8303:a4e9:79c5:e939])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab4ddefsm625461366b.59.2024.07.30.03.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 03:30:39 -0700 (PDT)
Date: Tue, 30 Jul 2024 12:30:38 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephan Gerhold <stephan@gerhold.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Adam Skladowski <a39.skl@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,apq8016-sbc-sndcard: move to
 separate binding
Message-ID: <ZqjAzgoKo-5vaCtK@linaro.org>
References: <20240723083300.35605-1-krzysztof.kozlowski@linaro.org>
 <ZqVXUI37fNB5D0DM@gerhold.net>
 <3d9f76c1-2e14-43dc-b438-5fac94ffc73e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d9f76c1-2e14-43dc-b438-5fac94ffc73e@kernel.org>
X-MailFrom: stephan.gerhold@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KG6EITHZTRMX3YH3A4OGGDTTMTJS7VOZ
X-Message-ID-Hash: KG6EITHZTRMX3YH3A4OGGDTTMTJS7VOZ
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:50:13 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KG6EITHZTRMX3YH3A4OGGDTTMTJS7VOZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Jul 28, 2024 at 12:30:12PM +0200, Krzysztof Kozlowski wrote:
> On 27/07/2024 22:23, Stephan Gerhold wrote:
> > On Tue, Jul 23, 2024 at 10:33:00AM +0200, Krzysztof Kozlowski wrote:
> >> The APQ8016 SBC and MSM8916 QDSP6 sound cards are a bit different from
> >> others: they have additional IO muxing address space and pin control.
> >> Move them to separate schema, so the original qcom,sm8250.yaml will be
> >> easier to manage.  New schema is going to grow for other platforms
> >> having more of IO muxing address spaces.
> >>
> >> Cc: Adam Skladowski <a39.skl@gmail.com>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >> .../sound/qcom,apq8016-sbc-sndcard.yaml       | 205 ++++++++++++++++++
> >> .../bindings/sound/qcom,sm8250.yaml           | 137 ------------
> >> 2 files changed, 205 insertions(+), 137 deletions(-)
> >> create mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
> >> new file mode 100644
> >> index 000000000000..6ad451549036
> >> [...]
> >> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> >> index c9076dcd44c1..1d3acdc0c733 100644
> >> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> >> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> >> @@ -27,9 +27,7 @@ properties:
> >>               - qcom,sm8650-sndcard
> >>           - const: qcom,sm8450-sndcard
> >>       - enum:
> >> -          - qcom,apq8016-sbc-sndcard
> >>           - qcom,apq8096-sndcard
> >> -          - qcom,msm8916-qdsp6-sndcard
> >>           - qcom,qcm6490-idp-sndcard
> >>           - qcom,qcs6490-rb3gen2-sndcard
> >>           - qcom,qrb5165-rb5-sndcard
> >> @@ -58,18 +56,6 @@ properties:
> >>     $ref: /schemas/types.yaml#/definitions/string
> >>     description: User visible long sound card name
> >>
> >> -  pin-switches:
> >> -    description: List of widget names for which pin switches should be created.
> >> -    $ref: /schemas/types.yaml#/definitions/string-array
> >> -
> >> -  widgets:
> >> -    description: User specified audio sound widgets.
> >> -    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> >> -
> > 
> > These two properties are also valid and supported on all newer
> > platforms, please keep them here! There are certain use cases where
> > these are needed independent of the platform, e.g. to control an analog
> > switch or mux connected to speaker or headphone outputs.
> > 
> > I agree that it is cleaner to move the IO muxing to a new schema though.
> > Perhaps we could define something like a shared qcom,sndcard-common.yaml
> > schema to avoid duplication for these generic properties? In the Linux
> > driver, these are handled for all platforms in sound/soc/qcom/common.c.
> 
> This was added to the common driver code but it does not mean it is
> reasonable binding. I don't understand why for example we even accept
> here aux-devs, instead of putting them into one of DAI links.
> 

The auxiliary devices (typically analog audio components) are not
necessarily related to one particular digital audio interface link. It
is typically the case (e.g. an analog speaker amplifier connected in
parallel to the headphone output of one of the codecs), but I don't
think we can assume that as a general rule. There are often multiple DAI
links that go to one codec and then it might be tricky to decide which
of the DAI links the aux-dev belongs to.

> The pin-switches and widgets could be used, but are they? The only valid
> argument to keep them is that you added them to common driver code.

These go hand in hand with the aux-devs property. If you have multiple
analog audio components connected to a codec output (e.g. an analog
speaker amplifier connected to the codec headphone output) then the
pin-switches/widgets describe that the output paths (speaker and
headphones) should be separately controllable.

The alternative for pin-switches and widgets in the DT is to hardcode
them in the ASoC board/machine driver with a separate board-specific
compatible. Personally, I would prefer to keep the machine driver
specific to the SoC instead of having definitions for each and every
board.

Thanks,
Stephan
