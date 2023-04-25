Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BF76F2ED2
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 08:43:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F2D417A2;
	Mon,  1 May 2023 08:43:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F2D417A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682923435;
	bh=g3l8P57GZugXVGTim/FLGb/oXEM9bYJ8C0AiMVB5g5E=;
	h=References:In-Reply-To:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=gOKQnIg166YQ22ALR0GusUvW48Ur0iMtVIT2VrMdzidgcRQXbM8PGfU4jU1GopCgg
	 mm8l0Y9CPqAGetY6fAcoKCdSMG5vM4nmSnwd96pGDq5cHhX1v5Bso5DsK8/8YAg5Ir
	 cTwNHU1IUozpgADEedxyNRFtM5KV+vIwJpXC88p0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46EDCF8057C;
	Mon,  1 May 2023 08:40:25 +0200 (CEST)
References: <20230414140203.707729-1-pan@semihalf.com>
 <20230414140203.707729-4-pan@semihalf.com>
 <20230417204150.GA3328603-robh@kernel.org>
In-Reply-To: <20230417204150.GA3328603-robh@kernel.org>
Date: Tue, 25 Apr 2023 18:01:47 +0200
Subject: Re: [PATCH 3/9] dt-bindings: ASoC: Add chv3-audio
To: Rob Herring <robh@kernel.org>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Mon, 01 May 2023 06:39:58 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z7WA2GWEUOJJSCQ6U76WS76XPYVSS7NI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168292322480.26.2637023655839536365@mailman-core.alsa-project.org>
From: =?utf-8?q?Pawe=C5=82_Anikiel_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 tiwai@suse.com, krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org,
 lars@metafoo.de, nuno.sa@analog.com, upstream@semihalf.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14E6EF80236; Tue, 25 Apr 2023 18:02:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3EE9F80137
	for <alsa-devel@alsa-project.org>; Tue, 25 Apr 2023 18:01:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3EE9F80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=SsRkaEkM
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-506c04dd879so10318782a12.3
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Apr 2023 09:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1682438518; x=1685030518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3RJ+5zJDDMo1/8WJAqxVpdeeLTssXpHq2gUqzpKG5vI=;
        b=SsRkaEkMdg2ndcTNrHlpzZVcvHCluT+lcwzJla6/VU/U35aKL49OMaSKIjnq1o7qNl
         dpePGp7DgeKnjKsOL7mQLIUaShpvWZWxY5SZbMbjO1JeKSNg43koPozOF3iToBrlcwyV
         jzqY5vBpVLEQqO/WlLjdCoC92YNS8ZIW1ReLH7M+7f3mTCGP/hQRYx+vgstLlnZ2lyqu
         Ju1R3yVWOeyvlFEFe4d8Ky4ZFP0ItLLqst/zpKcZcXP7oCrnvZabXzhPT0DzTjySRZYJ
         iBTkV4pe9z72PDSKVaQ7rXJdffKctoRy5T/B4TOr9aBv/aKdi1qlbnwujrJfN2vzVKha
         ou+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682438518; x=1685030518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3RJ+5zJDDMo1/8WJAqxVpdeeLTssXpHq2gUqzpKG5vI=;
        b=AIASX0BY33XZQRuhrMX4Si053fremiH17tn84BOY4cq8mLEIYJSabC/GiNWOFpr1L6
         a56pMdRQ9Nq2QWizEe8z4SsP3DfsKYaLXYvS6z/yJmmcAkCXCt8P/86yetCgBcCqnYO2
         cKfLkBSiHhW34MfJJPFf7WUXFfyHvpuGVU0F4tCpLCItgywSqI+SUJNW1h614yYsKTp7
         bXIe90FnI00dG0+9o1Vwr7jneeg+C9vPaqwi3ks0BR335hHlq66V5vgPdHMf0+o4C1xa
         7AuoR8nT7t39BXvT65X4v9DdD/P4/F+ed+usugKP5pPU587eXsJ06llQGPWjIG+73lXV
         bFFg==
X-Gm-Message-State: AAQBX9em6YBA8mvAUU6qxCCZBhWHCz+r1kSxgabr//LM11A3TBrkEb4+
	ejH37jTBIOdWQtyi7gy1VOg0DqqVrA2BVIUBP/Ra5Q==
X-Google-Smtp-Source: 
 AKy350aCYt9+H38EzOymUUlzq2ywL6EUgQE4nvIPdQc3H/fw2KwwLtvgjTktdRJECEpkkCcDc+g99yPJJsFFAy6ETQ0=
X-Received: by 2002:a50:fc01:0:b0:502:7d3f:25e9 with SMTP id
 i1-20020a50fc01000000b005027d3f25e9mr15129919edr.1.1682438518376; Tue, 25 Apr
 2023 09:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230414140203.707729-1-pan@semihalf.com>
 <20230414140203.707729-4-pan@semihalf.com>
 <20230417204150.GA3328603-robh@kernel.org>
In-Reply-To: <20230417204150.GA3328603-robh@kernel.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Date: Tue, 25 Apr 2023 18:01:47 +0200
Message-ID: 
 <CAF9_jYQc1QwVNwFjhqgvzO1CHmmKxPLK_MFcqus2S=6Vd8QpYg@mail.gmail.com>
Subject: Re: [PATCH 3/9] dt-bindings: ASoC: Add chv3-audio
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: pan@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Z7WA2GWEUOJJSCQ6U76WS76XPYVSS7NI
X-Message-ID-Hash: Z7WA2GWEUOJJSCQ6U76WS76XPYVSS7NI
X-Mailman-Approved-At: Mon, 01 May 2023 06:39:58 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 tiwai@suse.com, krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org,
 lars@metafoo.de, nuno.sa@analog.com, upstream@semihalf.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z7WA2GWEUOJJSCQ6U76WS76XPYVSS7NI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 17, 2023 at 10:41=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Fri, Apr 14, 2023 at 04:01:57PM +0200, Pawe=C5=82 Anikiel wrote:
> > Add binding for chv3-audio device.
> >
> > Signed-off-by: Pawe=C5=82 Anikiel <pan@semihalf.com>
> > ---
> >  .../bindings/sound/google,chv3-audio.yaml     | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/google,chv3=
-audio.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/google,chv3-audio.=
yaml b/Documentation/devicetree/bindings/sound/google,chv3-audio.yaml
> > new file mode 100644
> > index 000000000000..8b602b60eaee
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/google,chv3-audio.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/google,chv3-audio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Chameleon v3 audio
> > +
> > +maintainers:
> > +  - Pawe=C5=82 Anikiel <pan@semihalf.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: google,chv3-audio
> > +
> > +  google,audio-cpu0:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: The phandle of controller #0
> > +
> > +  google,audio-codec0:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: The phandle of codec #0
> > +
> > +  google,audio-cpu1:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: The phandle of controller #1
> > +
> > +  google,audio-codec1:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: The phandle of codec #1
>
> Why do you need custom properties when we have standard property to
> point to these things (sound-dai). We also have bindings to handle
> multiple devices.

Thanks, I will read up on that and try to use it here

Regards,
Pawe=C5=82
