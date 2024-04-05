Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA4E89AF2D
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:25:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 552082BCE;
	Sun,  7 Apr 2024 09:25:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 552082BCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474721;
	bh=n3a9v5YOTVzzqn8EGQ+AL8Oqj4tc98RubfBVQuMg7Lw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JE2IR0snt5l4laethuU54st0yt8Ua4xnTg+RM+gxmfrgpd1T3IPpp2xHlMe1Rf61/
	 IXG5/cr1lLiqC51PiPC7w2GGyCnn36+ycxJGxm9/v1aa1CY20KOVt2pN96AdkLeiGe
	 Zu7GLg1HHZKVMVyskL301vR+krr1q5IwyenB1L2c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19949F897D3; Sun,  7 Apr 2024 09:18:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFBEAF897D3;
	Sun,  7 Apr 2024 09:18:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EDA6F80007; Fri,  5 Apr 2024 19:22:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B4DCF80007
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 19:22:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B4DCF80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=l/dngyl9
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d6fd3cfaa6so32192621fa.2
        for <alsa-devel@alsa-project.org>;
 Fri, 05 Apr 2024 10:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712337731; x=1712942531;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3a9v5YOTVzzqn8EGQ+AL8Oqj4tc98RubfBVQuMg7Lw=;
        b=l/dngyl9GM0aq9c0lwG31iWGfBHQG4ldyxNWYQteXb5jd8K9O74V3vho7Ynbimp32Y
         PgW3kS6Imrx7Bbd5OWTdaPjBmWNQVg96cSAgFO4djebCvt0qYnsZl87B7IvElvTtqMkZ
         zSnuSGiiZWVMbPtqmRbTheWffZUmbIzb0TxP8lii3njHUTisOqX+2jMqHSX8AvvtIeVa
         K7OiC7zegHGSPzedtFB5mL9aiU1L7yxcW4EoyX2zpnKsDcLVo1r46EHRRfPXVT7bo9TB
         yt/fTTR+ZbSzLDw4VMBwTpQE/eH+j5iKNQn2zgTg68UhYBtx/JDywWXFQY10+y3IcT1k
         9Lcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712337731; x=1712942531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3a9v5YOTVzzqn8EGQ+AL8Oqj4tc98RubfBVQuMg7Lw=;
        b=XHH1i2fbEeY5l+1K5JDTnl4u6FDgTnLdOOnEo3xvV5tRUtNBlQRqlXvnxqKVHFnaHW
         QoBSvFRAe9pIXxfyyLLTkrdDdfZhnjdbi9u+Paaw+akTF5nQgKYzw6riie5LCZZ1F7ul
         qc3U2lsfO4XSLGPQ9sfkZG1DEBlwcOxzQcQcnCNP8tp4rHo9fO0cj3T1NAIWPfjaxMbj
         Iv1Vy+TKK+dHy8hIVoy/68txrx7CesZa4ZWA0brTOpoS4XNc9q82WMtaNZENAxk/XwaC
         Rv6KuLuk7LtZ7qfaay3FmyylQUNfaGNBhwNHFHFIFISITumG2m52nf/FhC5Nx0tkqND3
         vRxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk31S4/bNByoXROyC7Dq3db/hsA78yb1fWqqC718GYt3IOGHI4K6eQViXDANlaMfZMMPKjJhCTOlzaeuolUMHMrjd+L8qQye/F6Po=
X-Gm-Message-State: AOJu0YyxnCPGhP4bpLs0UKxmBqqfOyrHRiEIR3Uhjsz7gWeUtsVto6S1
	cK+xsHkOKpL4e1cOEUT/c7/6tu2/5JN2RGGDLSQUoHjCiwstVycqrvwL/aaqsBBQdnNaLarRQ1C
	A0hRIKBNhDRVAFZ0ZRWfDiPV1jng=
X-Google-Smtp-Source: 
 AGHT+IHVWxEB5bg1gMnUoidt4kAlY2qbh0psf71zqBG4OKlkeQSXjPgyyWN5UHVvE2xlj9uZ+5X7c+JgDpEubkWNmOk=
X-Received: by 2002:a2e:a717:0:b0:2d8:71d4:4c62 with SMTP id
 s23-20020a2ea717000000b002d871d44c62mr605492lje.49.1712337730626; Fri, 05 Apr
 2024 10:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240404160649.967-1-bavishimithil@gmail.com>
 <78091796-fd0a-42dd-a4da-f7bed3025bf9@linaro.org>
 <CAGzNGRnuG_gLUrH1N57WvpKbpiNtFrcsG6nJcacQNJB_yMYNrA@mail.gmail.com>
 <ec7f77a7-2cf1-4ea6-b9c4-d4fe8a1673ab@linaro.org>
 <CAGzNGRktm5gMj=bhtX2RAzcn1v5ref+nV-HV3Fct56FzAzxjWA@mail.gmail.com>
 <c9084453-65f1-43b0-88df-5b73052ccb72@linaro.org>
In-Reply-To: <c9084453-65f1-43b0-88df-5b73052ccb72@linaro.org>
From: Mithil <bavishimithil@gmail.com>
Date: Fri, 5 Apr 2024 22:51:58 +0530
Message-ID: 
 <CAGzNGR=2-us8GRB3RNi4_24QZ9rNBC7Lx0PFsWwbvxuRKk5ngw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: omap-mcpdm: Convert to DT schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: bavishimithil@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: K3NRL6PLXGK7GOSAAR3MRC4SZQERNJP3
X-Message-ID-Hash: K3NRL6PLXGK7GOSAAR3MRC4SZQERNJP3
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:16:00 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K3NRL6PLXGK7GOSAAR3MRC4SZQERNJP3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Apr 5, 2024 at 10:38=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/04/2024 18:29, Mithil wrote:
> > On Fri, Apr 5, 2024 at 9:27=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 05/04/2024 16:48, Mithil wrote:
> >>> So sorry about the 2nd patch being sent as a new mail, here is a new
> >>> patch with the changes as suggested
> >>>
> >>>> Please use subject prefixes matching the subsystem
> >>> Changed the patch name to match the folder history.
> >>
> >> Nothing improved. What the history tells you?
> >>
> >
> > Referred to "ASoC: dt-bindings: rt1015: Convert to dtschema"
> > Not really sure what else I should change.
>
> But the subject you wrote here is "dt-bindings: omap-mcpdm: Convert to
> DT schema"?
>
> Where is the ASoC?
>
I did change it, will send the patch again.

>
> reg is not correct. Please point me to files doing that way, so I can
> fix them.
>
> You need items with description.
>
Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
I referred here for the description, but will add items for the 2 regs

> > Interrupts and hwmods use maxItems now.
>
> hwmods lost description, why?
Seems self explanatory.

> > Changed nodename to be generic in example as well.
>
> "mcpdm" does not feel generic. What is mcpdm? Google finds nothing.
> Maybe just "pdm"?
>
Multichannel PDM Controller. Kept it like that since the node is also
called as mcpdm in the devicetree. Calling it pdm might cause
confusion.

Best Regards,
Mithil
