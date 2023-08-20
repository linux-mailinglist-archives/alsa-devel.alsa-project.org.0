Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ADB78200D
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Aug 2023 23:06:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A8F71EF;
	Sun, 20 Aug 2023 23:06:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A8F71EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692565611;
	bh=PUzxUsTBfQK/zjiaxjgLbyq0O/Am0HUIKcPRM9hLKVI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jKrwYtgUx5chPoNU7JLQZxbBALQJu/ko+ovD2nbtAuKo1zllVjlnjx25FbrDxJpW9
	 HgLhVFBZ9kxoVVXWLD8f5xVLJh0xQvx3NIg5tupLEbf6aBUnjy2DnwXkqZkYm41GNx
	 YmzMs5PMZUgHHTBvJ1PJ5aXz1gcMGlTFWdbQtShI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B852F804DA; Sun, 20 Aug 2023 23:05:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AEEE4F8016C;
	Sun, 20 Aug 2023 23:05:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8435F80199; Sun, 20 Aug 2023 23:05:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EBE1BF800D1
	for <alsa-devel@alsa-project.org>; Sun, 20 Aug 2023 23:05:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBE1BF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=VYvvXIPf
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6bcac140aaaso2282647a34.2
        for <alsa-devel@alsa-project.org>;
 Sun, 20 Aug 2023 14:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692565529; x=1693170329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYJNnbU74bFD9hOO6r8SqtnfQbVsJ6JUf4XpbDxQI/4=;
        b=VYvvXIPfbp6oj7zukU1xIAJ7zQuYMs6qKqGUOOPbCi4y0J82TALRurcVgTPKpIviV/
         OWIzQNMRLZu/rIXhxBTMX0CNgry3yfCothPmmQWDoos4Qr4+BODcVgGMUu2yEU/xsFu5
         0sk2U+JSKfdOSatvc6ghKvlH8Wtp+eA8exNfaVAS8jukR1wmXTXkPSPcdLS1IdxRAYMs
         zGUVmO/YV9IacVC3nffflio6WIQ0jkc7z8xx0tIyjq9wMlNRrqjj+2zyqSKQBDjnYGtB
         RpIWUaVj8o7yLuxLxbUz8YykQy4jMQGIIpC56VbWQr1FoWE+Nx3vQfvYM5RHV0i0fbHc
         5MFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692565529; x=1693170329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYJNnbU74bFD9hOO6r8SqtnfQbVsJ6JUf4XpbDxQI/4=;
        b=M6ZFFvdWnioP83Hww8ImylJtJ/IAWgFXlpM16sAIfYNGhFaI4YHWmpnuFavHdNZO7a
         2O7G3w7MOh137EHW3QzzZzyOJAQh3ouFqaHcvox6DhVHuxyTkIgnRtU8wrbZsflDtyGM
         yA6l52oceqhsE9D6MSZ36AMeDpJJF3DiTDJVJfHXFMAIdzgeoliZGk0yjFcyQjsRqylL
         jbIiLBmPt9i85fwj3mWcMWM80IEDIKCgY42AuDE5ogGlgwroPOmeLJF1HgkQ9OiUnIGf
         ekftTOHI26t5ZlFyelfUS8IYBMnmxK/qX+RAXaubbl3cTRoIyg5/Lwz+avnclRQ5fe1a
         p1qw==
X-Gm-Message-State: AOJu0YwByaNNceqPHPiBFup4eaqd0ImKupJ+OlScEzl3NZU4ozkBeyLl
	V+7JEk2k+g9sB6gciTCoGLa6AoRasDm1oLFJOm4=
X-Google-Smtp-Source: 
 AGHT+IH3nthfQp95+TcBsYptvt9ZSdyYti+7boLwXDHruL5qv6FYYQ78Rq3UNQWZjF6a0405lF/0TiepHKxIStoGRoc=
X-Received: by 2002:a05:6870:f153:b0:1be:f46d:a26c with SMTP id
 l19-20020a056870f15300b001bef46da26cmr7517879oac.27.1692565529140; Sun, 20
 Aug 2023 14:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230820175655.206723-1-aford173@gmail.com>
 <f5b16676-04b9-7864-ffa7-1c48f3c2ca9c@linaro.org>
 <6089b46d-a580-af52-0cac-84b46fe11e6c@linaro.org>
In-Reply-To: <6089b46d-a580-af52-0cac-84b46fe11e6c@linaro.org>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 20 Aug 2023 16:05:16 -0500
Message-ID: 
 <CAHCN7xJyOjKSXbm17roAJDbk-gDKQHprE9t1d4VH2uYSMZcEDg@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl_easrc: Add support for
 imx8mp-easrc
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: LO6H4A6LJBBLNVJATZAIA6BGNDDBXWIG
X-Message-ID-Hash: LO6H4A6LJBBLNVJATZAIA6BGNDDBXWIG
X-MailFrom: aford173@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LO6H4A6LJBBLNVJATZAIA6BGNDDBXWIG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Aug 20, 2023 at 3:33=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 20/08/2023 22:32, Krzysztof Kozlowski wrote:
> > On 20/08/2023 19:56, Adam Ford wrote:
> >> The i.MX8MP appears to have the same easrc support as the Nano, so
> >> add imx8mp as an option with a fallback to imx8mn.
> >>
> >> Signed-off-by: Adam Ford <aford173@gmail.com>
> >>
> >> diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/=
Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> >> index bdde68a1059c..2d53b3b10f2c 100644
> >> --- a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> >> +++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> >> @@ -14,7 +14,11 @@ properties:
> >>      pattern: "^easrc@.*"
> >>
> >>    compatible:
> >> -    const: fsl,imx8mn-easrc
> >> +    oneOf:
> >> +      - items:
> >> +          - enum:
> >> +              - fsl,imx8mp-easrc
> >> +          - const: fsl,imx8mn-easrc
> >
> > You need here also const for fsl,imx8mn-easrc, otherwise you do not
> > allow it alone. Test it for fsl,imx8mn-easrc DTS - you will notice warn=
ings.
>
> Actually, I see now Rob's report... you did not have to test DTS even.
> It was enough to test your change and this test was missing :(. Please
> test your changes before sending.

For what it's worth, I did run 'make dt_binding_check', but I didn't
run it with the extra flags from Rob's e-mail.  The tool didn't return
any errors.

adam

>
> Best regards,
> Krzysztof
>
