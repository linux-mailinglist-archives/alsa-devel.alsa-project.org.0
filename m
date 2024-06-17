Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E611790C946
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 13:27:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90A38832;
	Tue, 18 Jun 2024 13:27:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90A38832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718710042;
	bh=c4CGIueJgo3FyF0lUSOsJIiD5YkmHOWg5+dfrNt3KDo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vesZ1GzymLH9fCrnI4QF0kzYJp1LHNBozp8rTyyE492WsKBxgj/BW9xzP8HW06bOb
	 yTmN6ao+QlNrI32cDJfnkrGz2a9EqQdM3GlhheoVYDjKKVMO2AZtJdGIiWe/kV8445
	 m9bs2EowM0mx0hFGsi0If0nVO/7u17tqsUc2GFFc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39480F805C9; Tue, 18 Jun 2024 13:26:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3D9DF805C3;
	Tue, 18 Jun 2024 13:26:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7BEAF8023A; Mon, 17 Jun 2024 18:30:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09351F80154
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 18:30:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09351F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Mjlkf62s
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6fa0edb64bdso2486238a34.1
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jun 2024 09:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718641812;
 x=1719246612; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4CGIueJgo3FyF0lUSOsJIiD5YkmHOWg5+dfrNt3KDo=;
        b=Mjlkf62sgXXi/68kFhr70VMYL1ZV+7rAIZ7wkZlZJtlwVSbSuiIPP+MY5sTi6kdYVi
         xc7ClHYlptFkinFFBBZy1E/TX/IGOz3oUZv7RrSpivgMdtj0EnKphIWRDJVmBrJJ08ZP
         GSXyBMjaXVV/C8WdoTwGPNO6vUOfg17NG3L9d+CGAfGeVwTO62kL0kgtChXRzU16CBI/
         6LODFDh9filxcObBYhYBNcpsFEwgIz4zUml1ldm5zICcU8tO7P51jdn8asgcaEzka4f1
         yrHssX7xumCpPVM0suYhtcy2UBUW99pJugbW/nOZnU6nx1wVL0rHL3s/2OExIFs3skQw
         U0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718641812; x=1719246612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4CGIueJgo3FyF0lUSOsJIiD5YkmHOWg5+dfrNt3KDo=;
        b=ubBygqLh9oEJR623kekMnfQVH5czS5+luSNyIrfKZ8AK1XlC6Ld+kCq5DzVRkvJNos
         THgP4ZLo4paW/Vb9R79aA/16y6Mt8AlxYpSs2h9PN1aBqW34z2sI/d7cLvtJ9dU40CHR
         kaSO58rziHdBjbpXXFzyyZNjhbkI3CFvRWeVa0fJx60Fz4eR1lWs/ZjwGY8sJQuwaj8+
         zKfJn9xef+ar1BTRkrjEg9Fg28grH57+BSlNiffXfKRWGpteRnx3ITXJySWGkcJ8EM8D
         PVnNsosX5czDUEwq0BXYfpHphbMUR9vC3M9IOsFPcahpGIrM6yg2oLdB/H+6m5xJ1MTX
         C7Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxJTOl/TDY52uKiwZc1oi/NGOrQky2WrifTV4wwVEbgDSY4RDR5btMwWjrkkn+gVQ9GrYm+l83HQxoys0ExIZjoEh/rsH07zXlch4=
X-Gm-Message-State: AOJu0YwRsAJWHXPAk5Ts/IujqGibx6Xc8x7WbZFPhlMJ3kGmApGWOmJO
	d5JfBwsc/9V2sr6T7/LRHQLCHTrC3S2qIHXpG1ANESImzMkIKNRP2KU+xD4N96fQtNkHe7pwpk+
	q9kRe3GFknqe+gmsTTWG34YhdrDfTTHnjOPvDVg==
X-Google-Smtp-Source: 
 AGHT+IHjzvlrr838N1DpEkEeLzzIsELYsb2zHrhaAqxCRJTNhyRbdCIQiZBSmvhFuWqlSzeRBTrPNi1jOBSJAcQmjjA=
X-Received: by 2002:a9d:62ca:0:b0:6fd:5445:c6cc with SMTP id
 46e09a7af769-6fd5445c914mr6508564a34.23.1718641811875; Mon, 17 Jun 2024
 09:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
 <20240614163500.386747-2-piotr.wojtaszczyk@timesys.com>
 <83cbf43e-c927-449f-8b7e-5c8d3ee8cece@kernel.org>
 <CAG+cZ06EeXUDiLsDXkz+6EHqJwpvv2MWwfpvB8AYw0=ZhUkTfQ@mail.gmail.com>
 <83a45f7c-d90b-44d3-b57e-9dad21045e27@kernel.org>
 <CAG+cZ06kzikieaD_JCBybwWk8XKZQjJxa34Cg4QHxrxpT+j0eA@mail.gmail.com>
 <2fe7ba36-05b9-42c7-8726-ea891cfc7afc@kernel.org>
In-Reply-To: <2fe7ba36-05b9-42c7-8726-ea891cfc7afc@kernel.org>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Mon, 17 Jun 2024 18:30:00 +0200
Message-ID: 
 <CAG+cZ06XNV=ZZ8Ag00kaz1xWitXDN-yezUoc7M9JwQ5MUu7hTA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>, Russell King <linux@armlinux.org.uk>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
 "J.M.B. Downing" <jonathan.downing@nautel.com>,
	Arnd Bergmann <arnd@arndb.de>, Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JNKQKS53LG2FZYNAFDSE2L6W2XC7WCJP
X-Message-ID-Hash: JNKQKS53LG2FZYNAFDSE2L6W2XC7WCJP
X-Mailman-Approved-At: Tue, 18 Jun 2024 11:26:37 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JNKQKS53LG2FZYNAFDSE2L6W2XC7WCJP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 17, 2024 at 5:48=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 17/06/2024 16:04, Piotr Wojtaszczyk wrote:
> >>
> >>> It's used by snd_soc_dai_init_dma_data() in [PATCH v3 4/4] to give th=
e
> >>> dmaengine a
> >>> hint which dma config to use. The LPC32xx doesn't have yet a dmamux d=
river like
> >>
> >> and if I change driver platform data to foo and bar, does the DTS work=
? No.
> >
> > They shouldn't change the same way as expected dma-names shouldn't chan=
ge.
> > Lots of drivers expect the dma-names to be "rx", "tx"
> >
> >>
> >>> lpc18xx-dmamux.c therefore it still uses platform data entries for
> >>> pl08x dma channels
> >>> and 'SND_DMAENGINE_PCM_FLAG_NO_DT | SND_DMAENGINE_PCM_FLAG_COMPAT'
> >>> flags in the devm_snd_dmaengine_pcm_register().
> >>> Typically instead of this platform data you would use regular 'dma'
> >>> and 'dma-names' if it had
> >>> proper dmamux driver like lpc18xx-dmamux.c
> >>
> >> Exactly. Use these.
> >
> > Then I need to write a lpc32xx dma mux driver, device tree binding for
> > it and adjust the
> > LPC32xx I2S driver for it. Is this a hard requirement to accept this
> > patch set for the
> > legacy LPC32xx SoC?
>
> I do not see at all analogy with dma-names. dma-names are used ONLY by
> the consumer to pick up proper property "dmas" from DT. They are not
> passed to DMA code. They are not used to configure DMA provider at all.
>
> You parse string from DT and pass it further as DMA filtering code. This
> is abuse of hardware description for programming your driver and their
> dependencies.
>
> Why you cannot hard-code them?
>
> Sorry, to be clear: NAK

That's fine, clear answers are always good.
I considered to hardcode this as it was in the first version of the patch s=
et
but LPC32XX has two I2S interfaces which use different DMA signals
and mux settings and I really didn't want to pick the virtual DMA channel
name based on hardcoded I2S node name therefore I thought having a DT
property to select proper dma channel is a better solution.

--=20
Piotr Wojtaszczyk
Timesys
