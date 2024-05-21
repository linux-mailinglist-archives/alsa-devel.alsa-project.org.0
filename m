Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E903D8CA80E
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 08:36:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 276A6200;
	Tue, 21 May 2024 08:36:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 276A6200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716273415;
	bh=D2e3UIWaaCZthfsLSaAtaf3JVExndOtoZAyJOWE5QtA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XlducSFMB0tIlg1pdvTpgEWnfXUXH9zKiNFfs23HF28Xs6Z/l6PJwNPlLB7+w3rnX
	 xlbX2I/GCkSSXV+t9Dtymi4QgMwUywhDXBaQngPZKTwpTuMRbgxFGGxjiGG0J8YwKx
	 01Hz34O71OV2DBbYrambBQhAeZzBkkSZ9bcZ1RjM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4A28F800BA; Tue, 21 May 2024 08:36:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF8C1F804B2;
	Tue, 21 May 2024 08:36:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86F0BF8026A; Tue, 21 May 2024 08:32:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EAE69F800BA
	for <alsa-devel@alsa-project.org>; Tue, 21 May 2024 08:32:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAE69F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hADz/tMV
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-36cc579fd48so20381435ab.1
        for <alsa-devel@alsa-project.org>;
 Mon, 20 May 2024 23:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716273164; x=1716877964;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9v5h6PC3m5viZM1uwwljp97r1zeipYab7bRIWScSl2M=;
        b=hADz/tMVrP2x3FsRrDZCtUWI0GLJPy+OF0bPVAWe53FKXFprNwBPxiHpoc7zK4yFDL
         PVKsxTdYxHCWZ30al8eDbCFSP8BQEll8pETqhIn7BsImDE0B+KT/5KxSwaoiq5Hx2aCo
         iG09C5s773QO6rO0JguurGjTuS8fEAuHHKi/M8DRqU92IUJITykve30nmMmvZG7nShEJ
         jH3TsDenrcZgjN4hC7jr8uOGzWy+JVN1KpbWsCPg6nh+BQ78yCGMhnqCSubHBckkr3cn
         hT9TcDSPr7fe6iMaS8Sm4Cfdf4lGOk32VEDKEDSNvo+KSu7f3t6FU/vdWuo8gLxHBHTh
         C1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716273164; x=1716877964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9v5h6PC3m5viZM1uwwljp97r1zeipYab7bRIWScSl2M=;
        b=RdAtcaUdLdXee3bP0Jsv5gjwpjyNfIY0I6WPLyQHLIXvHA5K+IHmTQDyNtKCN/JT8j
         HBGQ+WbRgbS/dUwEc7y97dOwUAxcY+FW8jSYsTfL2xwarfpCj2UQwklKpaKeOh8W9pd3
         WMt7u/ElHTj8WPUvEvrnGBaYBgE+N1ZNC/yx4WexFs8Ab/RqsBCgeVKEmSfNPxkwNY6T
         oxqfXlWTn0NN4pG7glwV6tbrjY2ppLy6W+DcnKKInAtX0IysCfD/zHVxJ3hA2PxwFdrn
         ut3zsVVhSFBFE4ke3s6Uz9io2jdpV/05QtTTBwY5ZI/FdbvjHJ2TSyImCKQwVGMv+hAp
         kYeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhtyACdMeNBjRo8fRczR3d1vgha0b6e9Cq1MrwA437SXPtAqkpGU8/MObXIJpfKZJN6hX+s+Qsnf5z+tyfNXqiWXHZhhGKn/MhpTs=
X-Gm-Message-State: AOJu0YxD01jHNljF/SyAwkEYrw/jRiiup7f6KyxFqlnfUtKyIOoFIlp2
	3vtmQdPdiqq0qejvefqTIQTGHpfnsST0yqlnutpxK4vTLkcbplOYFCqtiCksvomBTGQzHv8c/gs
	FxeHxwvQEd8iR0i4UzjuUDhiSy7s=
X-Google-Smtp-Source: 
 AGHT+IHxK0DDX2uyvGgjkFhMSHqcRRzxekD6O/b+tOay3l5GstPgFhvbAwzUrXw/5NT70QAMEfkIjbuJ3XTfQfLanXw=
X-Received: by 2002:a05:6e02:1fea:b0:36c:4b17:e06a with SMTP id
 e9e14a558f8ab-36cc148e51amr385802135ab.18.1716273163845; Mon, 20 May 2024
 23:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <1715939146-13031-1-git-send-email-shengjiu.wang@nxp.com>
 <1715939146-13031-2-git-send-email-shengjiu.wang@nxp.com>
 <4727a091-bc64-46ea-8652-db6797dd93d2@linaro.org>
In-Reply-To: <4727a091-bc64-46ea-8652-db6797dd93d2@linaro.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 21 May 2024 14:32:32 +0800
Message-ID: 
 <CAA+D8APgcZo4fhmzft83ZFeG2bfF19Ew5Fi4o5Gqh3Ej=OPCuA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,mqs: Add i.MX95 platform
 support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: AHX42IDYHGE6BRGDIPEOI5ZUDMOQA7YR
X-Message-ID-Hash: AHX42IDYHGE6BRGDIPEOI5ZUDMOQA7YR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AHX42IDYHGE6BRGDIPEOI5ZUDMOQA7YR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, May 20, 2024 at 6:47=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 17/05/2024 11:45, Shengjiu Wang wrote:
> > In order to support the MQS module on i.MX95, a new property
> > "fsl,mqs-ctrl" needs to be added, as there are two MQS instances
> > on the i.MX95 platform, the definition of bit positions in the
> > control register is different. This new property is to distinguish
> > these two instances.
> >
> > Without this property, the difference of platforms except the
> > i.MX95 was handled by the driver itself. But this new property can
> > also be used for previous platforms.
> >
> > The MQS only has one control register, the register may be
> > in General Purpose Register memory space, or MQS its own
> > memory space, or controlled by System Manager.
> > The bit position in the register may be different for each
> > platform, there are four parts (bits for module enablement,
> > bits for reset, bits for oversampling ratio, bits for divider ratio).
> > This new property includes all these things.
>
> ...
>
> >
> >    clocks:
> >      minItems: 1
> > @@ -45,6 +46,22 @@ properties:
> >    resets:
> >      maxItems: 1
> >
> > +  fsl,mqs-ctrl:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 6
> > +    maxItems: 6
> > +    description: |
> > +      Contains the control register information, defined as,
> > +      Cell #1: register type
> > +               0 - the register in owned register map
> > +               1 - the register in general purpose register map
> > +               2 - the register in control of system manager
> > +      Cell #2: offset of the control register from the syscon
> > +      Cell #3: shift bits for module enable bit
> > +      Cell #4: shift bits for reset bit
> > +      Cell #5: shift bits for oversampling ratio bit
> > +      Cell #6: shift bits for divider ratio control bit
>
> Thanks for detailed explanation in commit msg, but no, please do not
> describe layout of registers in DTS. For the syscon phandles, you can
> pass an argument (although not 6 arguments...). Usually this is enough.
> For some cases, like you have differences in capabilities of this device
> or its programming model, maybe you need different compatible.
>
> If these are different capabilities, sometimes new properties are
> applicable (describing hardware, not register bits...).
>
The main difference between the two instances on i.MX95 is the register
difference. looks like I need to use two compatible strings:
      - fsl,imx95-aonmix-mqs
      - fsl,imx95-netcmix-mqs
to distinguish them.

best regards
Shengjiu Wang

> Best regards,
> Krzysztof
>
