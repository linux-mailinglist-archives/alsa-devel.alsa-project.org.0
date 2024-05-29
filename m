Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 414DE8D2AB8
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2024 04:19:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B63C85D;
	Wed, 29 May 2024 04:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B63C85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716949162;
	bh=jcVK57FbtJeQrFT8gv4gi4N3C+tc4HJy3psQqxo2nOI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZakRjEpCzgIT8oaOALFNm5oTAU3uAYvjVYaCPF5Hx1mx/TIQiUxgdqlSur+KhO5mE
	 DaQjQFK5pUXV4O8EhNdqTwjI3oMUpG837SO2rIzx8tWJ8jbROc/LewnbEIXj179uDn
	 gKK4Z3eUoDyQuLAFn7rHSfeFtym4DVEXy/loxdeY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2E19F805AA; Wed, 29 May 2024 04:18:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 750A7F8055C;
	Wed, 29 May 2024 04:18:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CFD8F80149; Wed, 29 May 2024 04:18:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51EEDF800BA
	for <alsa-devel@alsa-project.org>; Wed, 29 May 2024 04:18:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51EEDF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UvswOW3y
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7e201db9f47so68232539f.3
        for <alsa-devel@alsa-project.org>;
 Tue, 28 May 2024 19:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716949110; x=1717553910;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1zuMc6QVmp7ZjCjJt78h2VKZOxHAgfCEmVnh0EIazE=;
        b=UvswOW3yaaDab0d8pjPBwnrEIgXbO3X7HlmZCTYBo6ZcseYf/cY9e/OFcjpy47uX1Z
         oMuOjIxxs2BF8MPIcatG4IRma2xqzFJ2y3SCSRjY4bNQ/semOS+ACXPkUoMAFJNYFAEW
         B+rvxgM36+yq36CUecObZ5I38j2HfgtI+xhT9dWdP/T+6oVs8Qo7yfxolQZOZq8qjcnh
         Xz+Y5I+BIeUUwyeiZf/AM/tyyH0oIEUP5R74WGpqdsshwPsprGu02Vc9j1b1yBoPX+Qg
         T/i9AzerE4UH+aikI+Q0BiYoruwfg0fTwcRylMhS6JlLZiYpf2pZxvpJT+HZjf3n9g9T
         ZxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716949110; x=1717553910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1zuMc6QVmp7ZjCjJt78h2VKZOxHAgfCEmVnh0EIazE=;
        b=m0A9ko2eaE3mVUd+h0dWs4KPWx8t4/R9xd6mZw0qCx+WSCBth0IQNFbfOJ5jxv22ks
         WENPUE8Nt/I2zIKRTF042EXmIifGMKOq1lC7LQ361bD5EszktCCwydipv0LpiBMX4R0V
         pyEK17fUC2Ahb191Y8loxBSnMKBA4AFVt1XgxQ/06xY40cB2ukDdJTK1mWOSHIc+vEI7
         NDaladSEtOUGmvuLTO7tuTpKR+Sci3nMX/FqWzbphdu5jAzbSM21DmASn8c54vk/cyj3
         aVHi21qUCR6seUJcOde82IINH0BnZRE6Nv6cAbJdSmICuvFQ9PzXJu3QtoJiJuwPYt9S
         5vFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjrPqRxBLYsebs0gtibOu0wf9VbhIwBsEjM9nydHJoFlVV972bRQDeQma6Q63+RN3lukExw6vFyvLdzI3ZNSh5CPnkpzt3vH402H8=
X-Gm-Message-State: AOJu0YzmEC2gal1SCKSmw5Rz6ZY8/yXEx63YcC0Vvx1IdEPwYHAqFn/U
	NvV6WpWsDeVcquDtGT/ewQp2uYOqyG09WksRD4inXLmiQz8hj7CJEZpi+niYm4ENNDGVz3us6XV
	hQetggir3eCIC5It4LO3abIPLvoY=
X-Google-Smtp-Source: 
 AGHT+IFcF3TNc9ogUWcYtJiiuSJm+fWo3KnUCeZ2Iq6PTOrYl3WLncVJ7quYftqH5wIdf7b86ARTJGK34c1ksQ3R+ik=
X-Received: by 2002:a92:ca0e:0:b0:374:593f:914a with SMTP id
 e9e14a558f8ab-374593f9523mr79683085ab.4.1716949110033; Tue, 28 May 2024
 19:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <1716286416-17621-1-git-send-email-shengjiu.wang@nxp.com>
 <1716286416-17621-2-git-send-email-shengjiu.wang@nxp.com>
 <20240528151536.GA275498-robh@kernel.org>
In-Reply-To: <20240528151536.GA275498-robh@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 29 May 2024 10:18:18 +0800
Message-ID: 
 <CAA+D8AMyf9jEHapNkRdEguhi8T+WVQXhxcF_tESmgbrffvdTxg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: fsl,xcvr: Add compatible string
 for i.MX95
To: Rob Herring <robh@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: JDPSAV32MTSNJYO54OUX35RSEYRBRIQW
X-Message-ID-Hash: JDPSAV32MTSNJYO54OUX35RSEYRBRIQW
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDPSAV32MTSNJYO54OUX35RSEYRBRIQW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, May 28, 2024 at 11:15=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, May 21, 2024 at 06:13:35PM +0800, Shengjiu Wang wrote:
> > Add compatible string "fsl,imx95-xcvr" for i.MX95 platform.
> >
> > The difference between each platform is in below table.
> >
> > +---------+--------+----------+--------+
> > |  SOC          |  PHY   | eARC/ARC | SPDIF  |
> > +---------+--------+----------+--------+
> > | i.MX8MP |  V1    |  Yes     |  Yes   |
> > +---------+--------+----------+--------+
> > | i.MX93  |  N/A   |  N/A     |  Yes   |
> > +---------+--------+----------+--------+
> > | i.MX95  |  V2    |  N/A     |  Yes   |
> > +---------+--------+----------+--------+
> >
> > On i.MX95, there are two PLL clock sources, they are the parent
> > clocks of the XCVR root clock. one is for 8kHz series rates, named
> > as 'pll8k', another one is for 11kHz series rates, named as 'pll11k'.
> > They are optional clocks, if there are such clocks, then the driver
> > can switch between them to support more accurate sample rates.
> >
> > As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4' for
> > clocks and clock-names properties.
> >
> > On i.MX95, the 'interrupts' configuration has the same constraint
> > as i.MX93.
> >
> > Only on i.MX8MP, the 'resets' is required, but for i.MX95 and i.MX93
> > there is no such hardware setting.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,xcvr.yaml   | 37 ++++++++++++++++++-
> >  1 file changed, 36 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Do=
cumentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > index 0eb0c1ba8710..d1dcc27655eb 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > @@ -22,6 +22,7 @@ properties:
> >      enum:
> >        - fsl,imx8mp-xcvr
> >        - fsl,imx93-xcvr
> > +      - fsl,imx95-xcvr
> >
> >    reg:
> >      items:
> > @@ -49,6 +50,9 @@ properties:
> >        - description: PHY clock
> >        - description: SPBA clock
> >        - description: PLL clock
> > +      - description: PLL clock source for 8kHz series
> > +      - description: PLL clock source for 11kHz series
> > +    minItems: 4
> >
> >    clock-names:
> >      items:
> > @@ -56,6 +60,9 @@ properties:
> >        - const: phy
> >        - const: spba
> >        - const: pll_ipg
> > +      - const: pll8k
> > +      - const: pll11k
> > +    minItems: 4
> >
> >    dmas:
> >      items:
> > @@ -79,15 +86,24 @@ required:
> >    - clock-names
> >    - dmas
> >    - dma-names
> > -  - resets
> >
> >  allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx8mp-xcvr
> > +    then:
> > +      required:
> > +        - resets
> > +
> >    - if:
> >        properties:
> >          compatible:
> >            contains:
> >              enum:
> >                - fsl,imx93-xcvr
> > +              - fsl,imx95-xcvr
> >      then:
> >        properties:
> >          interrupts:
> > @@ -98,6 +114,25 @@ allOf:
> >          interrupts:
> >            maxItems: 1
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx95-xcvr
> > +    then:
> > +      properties:
> > +        clocks:
> > +          maxItems: 6
> > +        clock-names:
> > +          maxItems: 6
>
> 6 is already the max. Drop these and add a 'not' into the if schema (or
> list out the other compatibles).

Ok, will update it.

best regards
Shengjiu Wang
>
> > +    else:
> > +      properties:
> > +        clocks:
> > +          maxItems: 4
> > +        clock-names:
> > +          maxItems: 4
> > +
> >  additionalProperties: false
> >
> >  examples:
> > --
> > 2.34.1
> >
