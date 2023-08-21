Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DED92782CE4
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 17:05:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D6B3100;
	Mon, 21 Aug 2023 17:04:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D6B3100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692630304;
	bh=FOXYm5VWywlGAT1TeRLxwLIUYJ0LWhCgzf1ezQGQ3LM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Iinnln4ozjBj+s0jK3stmXk8u9UU0I6aQnisy7GsbbxWlwYomOiLkrjF9nRYuIQ2R
	 uv49kJwvr1ZVhy8+Lgs2yfH+4z94W/CIUb5DyhWpTuSGawmZEkI3uGWGxBoKPDYpJs
	 EbOep+3Y8qn9gYUwM6qjLgUS9AhM7Autbcjm91sI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B7C1F80272; Mon, 21 Aug 2023 17:04:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D4DEF8016C;
	Mon, 21 Aug 2023 17:04:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB580F80199; Mon, 21 Aug 2023 17:04:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68BEFF800BF
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 17:04:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68BEFF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Wg/BO/gU
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-26b56cc7896so1695580a91.3
        for <alsa-devel@alsa-project.org>;
 Mon, 21 Aug 2023 08:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692630243; x=1693235043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CqUh9skgpVHURP/Wnzp8MkCvg8JvCVWZ/A+CKRy7nI=;
        b=Wg/BO/gU5DjathycsdyIdaVkk4uKAhzGdSMJU6rd0JjzVAgz3pW2KZEFdLMROs3K9l
         pGTWwjqVJZlzRqEH3NBRypbuVvJOTLVYo+SDYWUUOGT1XAv9aJzwsgDo9XPZYxxn545M
         Cm00woQdEVJGXFDHBs9SHQPEPJvCIuQ7FeDDZ/GQ0H0UriA2y8krkIIRqED7P5Tc6TV0
         xV7VXsvj17AFj5wktkbdhVMmSby6ZHJpaXmbCjP4lYZpp+4SQyicKr7lHfLIHdjd51r1
         igwaovDa2r1xsRm7axVEQEiTZaL1jIGj9wVXbPjIYnr1vdOtkHkzzyee+bjhweeH3x6j
         3iUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692630243; x=1693235043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0CqUh9skgpVHURP/Wnzp8MkCvg8JvCVWZ/A+CKRy7nI=;
        b=bY0f/inU7zfmbp3m+KOjWsKq5uZQwNTcbbXvQdlZyj8yHnDH43qfGWpnOPVtwPO4gF
         c5uoX3gMcS3oGhiunz7O22Ab2KHfID4tt/s07zDHl/rChWAD9YvCPU77ebiB7TuOAl36
         Tt4CO+XDuIxJnXh3G/nmfPczWn1laQN4I4jrQfQl8n8TUAoAhFla857DcPD8ERkHAjqU
         Wd8u9DA4F8wCLZ9Cgus+A0bvsvufOC/lzA954Ovy73iMsUSwZGb1jCI//cCGMt5iG4Ky
         ubzVgUt/9XWyONn/bpFExRReVVKhgXLB+Vo8TxFNmS7wXLgCoKktKq+/PFv9wDN+yOAL
         fxYQ==
X-Gm-Message-State: AOJu0YzAA2cvR1ll4+g7CmLUvGJur48IiV7iPFCPFDOdKbntofI0mZkl
	Si4TT9UGC3eW3m9bh/OQAUlV13J8Nghv16oMOzs=
X-Google-Smtp-Source: 
 AGHT+IFiefGRjQhKwC66LQhERuF3DhfgmpQjrGA9OfwXu1NR1QIKeVOYGsAI4DZrDaxlNMwRiomEzPx7mp9QdkLU6M4=
X-Received: by 2002:a17:90b:3712:b0:26b:4ce1:9705 with SMTP id
 mg18-20020a17090b371200b0026b4ce19705mr4100514pjb.38.1692630242691; Mon, 21
 Aug 2023 08:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230820175655.206723-1-aford173@gmail.com>
 <f5b16676-04b9-7864-ffa7-1c48f3c2ca9c@linaro.org>
 <6089b46d-a580-af52-0cac-84b46fe11e6c@linaro.org>
 <CAHCN7xJyOjKSXbm17roAJDbk-gDKQHprE9t1d4VH2uYSMZcEDg@mail.gmail.com>
 <20230821140622.GA1473812-robh@kernel.org>
In-Reply-To: <20230821140622.GA1473812-robh@kernel.org>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 21 Aug 2023 10:03:51 -0500
Message-ID: 
 <CAHCN7xL4SDR=QOXhFPQyppcH5tsJJOuREuHzJVyrFS8B7oKexw@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl_easrc: Add support for
 imx8mp-easrc
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
	aford@beaconembedded.com, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
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
Message-ID-Hash: CHZF2H257ZKOVXJ3OHZUN2LK7OJIUANN
X-Message-ID-Hash: CHZF2H257ZKOVXJ3OHZUN2LK7OJIUANN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CHZF2H257ZKOVXJ3OHZUN2LK7OJIUANN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 21, 2023 at 9:06=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Sun, Aug 20, 2023 at 04:05:16PM -0500, Adam Ford wrote:
> > On Sun, Aug 20, 2023 at 3:33=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> > >
> > > On 20/08/2023 22:32, Krzysztof Kozlowski wrote:
> > > > On 20/08/2023 19:56, Adam Ford wrote:
> > > >> The i.MX8MP appears to have the same easrc support as the Nano, so
> > > >> add imx8mp as an option with a fallback to imx8mn.
> > > >>
> > > >> Signed-off-by: Adam Ford <aford173@gmail.com>
> > > >>
> > > >> diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yam=
l b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> > > >> index bdde68a1059c..2d53b3b10f2c 100644
> > > >> --- a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> > > >> +++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> > > >> @@ -14,7 +14,11 @@ properties:
> > > >>      pattern: "^easrc@.*"
> > > >>
> > > >>    compatible:
> > > >> -    const: fsl,imx8mn-easrc
> > > >> +    oneOf:
> > > >> +      - items:
> > > >> +          - enum:
> > > >> +              - fsl,imx8mp-easrc
> > > >> +          - const: fsl,imx8mn-easrc
> > > >
> > > > You need here also const for fsl,imx8mn-easrc, otherwise you do not
> > > > allow it alone. Test it for fsl,imx8mn-easrc DTS - you will notice =
warnings.
> > >
> > > Actually, I see now Rob's report... you did not have to test DTS even=
.
> > > It was enough to test your change and this test was missing :(. Pleas=
e
> > > test your changes before sending.
> >
> > For what it's worth, I did run 'make dt_binding_check', but I didn't
> > run it with the extra flags from Rob's e-mail.  The tool didn't return
> > any errors.
>
> The error is not related to the '-m' (undocumented compatible) warning.
> It is as Krzysztof said.

I was able to replicate the message after I updated the schema.  Is
there any way we can add the dt_binding_check to the 'make help' menu?
 I do this so infrequently that I don't necessarily know what the
proper flags are, and I sometimes forget to update the schema.  I have
seen others run into similar issues, so it seems like having it in the
help menu might be beneficial to more people.

adam

>
> Rob
