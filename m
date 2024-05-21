Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E59F8CA726
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 05:50:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 748C0200;
	Tue, 21 May 2024 05:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 748C0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716263452;
	bh=nT/UcWakmvnOxHqHJxkCVjPajiuq5sgmjr6Gdx1E7do=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aCBpDg1Wyi8WEaVI0+IW0tRoGhypa+wCuq0+9e62b2AucyQ4XabTCRa+YrNa8fxet
	 UpHZOkbH6nO9oBpU9ffAJVbQg527lrt7zH9AIhfccSqbjOHs6MhMzNMav9R+Y2Kv+F
	 MWQSUc5qqskHysZlOLBYXpz7Eu++eejCDgHxvdZw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 159F2F80051; Tue, 21 May 2024 05:50:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9203F805A8;
	Tue, 21 May 2024 05:50:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E640BF8026A; Tue, 21 May 2024 05:45:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 829C7F80051
	for <alsa-devel@alsa-project.org>; Tue, 21 May 2024 05:45:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 829C7F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=h7ww8AQ4
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7e21dfbc310so221164039f.1
        for <alsa-devel@alsa-project.org>;
 Mon, 20 May 2024 20:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716263104; x=1716867904;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92eG1R1+dxxcxoqnquEsD3l0yRmXMuTseq3SVxvuVCU=;
        b=h7ww8AQ4qfg6GxUReyTdyvVz/N/RQugPea75uoLc2Jv7Uq1d1qOPLnXyzjy04qBSkH
         4zVhIXTnIUXJcKi7iTNlPvsV/ydEOn8sRnFIZr9WcOkeijQmgktjFOXhSStO+ZThfEgi
         B+pxNCNiY7mwJqpDFOQ9R58Rl3IBOf3Gqz/vywJws7ZlfE42b44NaFjdo3ZIDIYT5mbC
         t9J61tEZpP9aCi2cW7e/LtqbUyEjVEYyVvGBfMw2plB0Pmuyi+9e4/sPeV7Nzu6Ty7LD
         0sb9DUEEMrUwv2t6FejKY0I+QGwkiMbKMohgDthLzqauP7BRmhq1xSwSFHDusn3Xeb3R
         BL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716263104; x=1716867904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92eG1R1+dxxcxoqnquEsD3l0yRmXMuTseq3SVxvuVCU=;
        b=VWb6ZecEYfBVWs1yHhK/FtGD+jgUtqCGTQOSZkSCMxz656MNePqx5Nwgo3rb6qzap3
         ocB4vSxzYDTxz50Pb/O7Ip4jhlejti02UrpoiBp2v6qQYz4j/7ElSYrp1C/TKSh9p1u5
         q8AM/MTX1AMhSUHdWC4Ga/qiPUA6uy11jVzz8CVI3S9kpZfmzmlZhcPTvxPayHkQUKyc
         qjNL8eCoknyUguMItUcKuOqKcVWqMaW5lBPCYrHHsaBAoDM8FPBNk42P4mMhxDBBNy+n
         TrWzNP+plIzjGHDItvJqsUYuyyzN7S2LxSq001HTECcRU/nIexjBfS/bmB7VRt7nWWfa
         1yzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKU8IoAnI2nm5CGsIqdrkxyRylYY5HC1KnoMSsKJ55A3asI+VymE5vA7gHfNHIb57ItXfbvGeNdts7bekGApFDmy19E/E2d62z4LM=
X-Gm-Message-State: AOJu0YwoQMy9QxTkuMAC8Y7Mt0KWHYFLqjzJeuLVsq9iPUc1L80LNt0S
	Oeh2cYNyhKZF/I7e5J2Oh9hDm4C4ZMApk+fB/yuFe0W7H6C09uOz2PzUC/y+3q0HsaUCuvoTrnM
	qwUGqSvM51qukimt5BbbIYBjAmMg=
X-Google-Smtp-Source: 
 AGHT+IGUqihHFeb7eWpabPg1q5Sh/AS8XKoMLly/pnZf7TI+p69vXi5+CsRbyhaNcvW9G0mXy1rLErzVIJjrmezSMvA=
X-Received: by 2002:a05:6e02:1caf:b0:36a:1f1a:f797 with SMTP id
 e9e14a558f8ab-36cc1501d23mr336656205ab.32.1716263103909; Mon, 20 May 2024
 20:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <1715656329-8061-1-git-send-email-shengjiu.wang@nxp.com>
 <1715656329-8061-2-git-send-email-shengjiu.wang@nxp.com>
 <20240520161602.GA733483-robh@kernel.org>
In-Reply-To: <20240520161602.GA733483-robh@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 21 May 2024 11:44:53 +0800
Message-ID: 
 <CAA+D8AOvuCKN0cU_TAHsz6h41qVXHbV0LfkFq9dSRujt2Lc2bw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: fsl,xcvr: Add compatible string
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
Message-ID-Hash: 7U2V5EK5QIEWEUL4DGX2K7ONS6AZS2TZ
X-Message-ID-Hash: 7U2V5EK5QIEWEUL4DGX2K7ONS6AZS2TZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7U2V5EK5QIEWEUL4DGX2K7ONS6AZS2TZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, May 21, 2024 at 12:16=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, May 14, 2024 at 11:12:08AM +0800, Shengjiu Wang wrote:
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
> > As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4'
> > for clocks and clock-names properties.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,xcvr.yaml   | 55 +++++++++++++++----
> >  1 file changed, 45 insertions(+), 10 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Do=
cumentation/devicetree/bindings/sound/fsl,xcvr.yaml
> > index 0eb0c1ba8710..70bcde33e986 100644
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
> > @@ -44,18 +45,12 @@ properties:
> >      minItems: 1
> >
> >    clocks:
> > -    items:
> > -      - description: Peripheral clock
> > -      - description: PHY clock
> > -      - description: SPBA clock
> > -      - description: PLL clock
>
> Leave these here and add pll8k and pll11k.
>
> > +    minItems: 4
>
> Keep this.
>
> > +    maxItems: 6
> >
> >    clock-names:
> > -    items:
> > -      - const: ipg
> > -      - const: phy
> > -      - const: spba
> > -      - const: pll_ipg
> > +    minItems: 4
> > +    maxItems: 6
>
> Same here.
>
> >
> >    dmas:
> >      items:
> > @@ -97,6 +92,46 @@ allOf:
> >        properties:
> >          interrupts:
> >            maxItems: 1
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx95-xcvr
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Peripheral clock
> > +            - description: PHY clock
> > +            - description: SPBA clock
> > +            - description: PLL clock
> > +            - description: PLL clock source for 8kHz series
> > +            - description: PLL clock source for 11kHz series
> > +          minItems: 4
> > +        clock-names:
> > +          items:
> > +            - const: ipg
> > +            - const: phy
> > +            - const: spba
> > +            - const: pll_ipg
> > +            - const: pll8k
> > +            - const: pll11k
> > +          minItems: 4
>
> Drop all this.
>
> > +    else:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Peripheral clock
> > +            - description: PHY clock
> > +            - description: SPBA clock
> > +            - description: PLL clock
> > +        clock-names:
> > +          items:
> > +            - const: ipg
> > +            - const: phy
> > +            - const: spba
> > +            - const: pll_ipg
>
> And for this case, you just need 'maxItems: 4'.
>

Thanks for the comments.

I will address them in the next version.

Best regards
Shengjiu Wang
