Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6E690C93F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 13:26:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96E11A4A;
	Tue, 18 Jun 2024 13:26:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96E11A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718710008;
	bh=7NSvCXohwZLOOlJWIUDNVZNNLgZsT49wKsS05NVWjKs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tB3O9UsJyvc2lOJWTJCjFBDfGMXLuPA9msvlEuTVgzmLxZnBLoptCs06nlS7bDGEK
	 n75zHSCvrb56D9stEsSaAZ6kKCKsdgTG4E2iKm0x8uAEzNQG4u534lQuVSi85fgZZe
	 y3FJ297ahVSC3mzzT0V7ICObn7n/Z+lujjYM42Z4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D015F80656; Tue, 18 Jun 2024 13:25:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB0CCF80649;
	Tue, 18 Jun 2024 13:25:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69BF5F8023A; Mon, 17 Jun 2024 11:34:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91C66F800ED
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 11:34:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91C66F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=tNcM06lt
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-7979198531fso308853385a.0
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jun 2024 02:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718616838;
 x=1719221638; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dwjk23maxDbhwXR6knY3QoiO7g9DUPuAbXWMaxi9WAo=;
        b=tNcM06ltSWsOcqOjmgG+ONxNz0UK7kZByjy933qShRPJsb5egL63Wj7xfDP0J9HLeq
         wCymQdaDGFqsF9U4xZbVCgkudBVFWx6e9KR2bE2aklPx+a3xNgWu26h3QKuADxVMoh23
         eUyIQBic+86/L5eFTD8kSE7+Tzj6adX52wchJdrpw2JjF4jNYP4/b2440eSYJD5Zf3sV
         ZdymZogf1Y67V52oaY62MmdkVHeOY6udBIS44mGew4CjJwdthvnX3+iIbHRjI7m7JP4M
         4tFp31PgWh0COJkbxc5x4ffP/KSt7O02ybZwR8t3h63gvdq6nq/X/GybvPFAhJgW0I78
         QYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718616838; x=1719221638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dwjk23maxDbhwXR6knY3QoiO7g9DUPuAbXWMaxi9WAo=;
        b=ITJ7uF8XPEPUKLXM39pDGNjE9+lq3HSvqrr+7dlNx3OSCIIPJGpnWHW8aDoGkNohAt
         4Gyb+7QObVtyfO59vAur5vm0bOqq4d7kVwFXeNc2lXhdLbK1VbdYTUv08J/TmjbNSlB7
         5Im1EbGozWNvp7XfumageLcZg77lP+89jpnAT4JXeS9YgEuMFlTLbsPmM1DUZEIJ8wQW
         LgvZb916XnvKifdH2t3fWwFvW25KlVOE3lkpA+dTbI8uoymspFvQBFtsZ/ofC3MtcH/d
         8+TdAzY3/Hy2+rt94l+3MpJF0j2/Kg3PGbUu5SWlsZaThDYZaC0Len4/omnr8r85NlNF
         9Q7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdJpaN9QyI+/2eP+JjpzP9DvxYcNvNsmt3YRrdrCALrr9O0PgwYt6UBWTfRHjAdsRQgXGusFzVC4WSTwQzToiteDUsxOTmzUWtFhs=
X-Gm-Message-State: AOJu0YxM2A7/t/jA1CzpBJ/v5b5Vlk+aJe8XrlCngIRXaNuv77B7Pgjn
	uqZvUAWx2gV21brkqBamruSo5ONc1WGdAi1WsTaKFwZZl5b3OI50XArk1Q1CtcfTYtdL9ed60jN
	Rfxl30m6GZKe2H0Su7UzqnF9pe2jZR9lZSFbCtQ==
X-Google-Smtp-Source: 
 AGHT+IEAX5KtNwSxz024jCUDuTs+t2XcQ1Uu/1Qu8JcsorpEu10yK9me2YfmiTGJCyrzuk8/c2n+Pk4pb6M+8oQC+gs=
X-Received: by 2002:a0c:fbc2:0:b0:6b2:9c0d:4849 with SMTP id
 6a1803df08f44-6b2afb7bb5cmr87920016d6.0.1718616838197; Mon, 17 Jun 2024
 02:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
 <20240614163500.386747-2-piotr.wojtaszczyk@timesys.com>
 <83cbf43e-c927-449f-8b7e-5c8d3ee8cece@kernel.org>
In-Reply-To: <83cbf43e-c927-449f-8b7e-5c8d3ee8cece@kernel.org>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Mon, 17 Jun 2024 11:33:47 +0200
Message-ID: 
 <CAG+cZ06EeXUDiLsDXkz+6EHqJwpvv2MWwfpvB8AYw0=ZhUkTfQ@mail.gmail.com>
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
Message-ID-Hash: IYR4S7KMPEV2LTDPKBE5A6ZNMW2NPIFM
X-Message-ID-Hash: IYR4S7KMPEV2LTDPKBE5A6ZNMW2NPIFM
X-Mailman-Approved-At: Tue, 18 Jun 2024 11:25:24 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IYR4S7KMPEV2LTDPKBE5A6ZNMW2NPIFM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Jun 15, 2024 at 12:01=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets.

I'm sorry about that, it won't happen again.

> > +  dma-vc-names:
>
> Missing vendor prefix... but I don't really get what's the point of this
> property.

Is "nxp,lpc3xxx-dma-vc-names" acceptable?

>
> > +    $ref: /schemas/types.yaml#/definitions/string-array
> > +    description: |
> > +      names of virtual pl08x dma channels for tx and rx
> > +      directions in this order.
> > +    minItems: 2
> > +    maxItems: 2
>
> What part of hardware or board configuration this represents?
>
> It wasn't here and nothing in changelog explained it.

That's information which DMA signal and mux setting an I2S interface uses.
It's a name (bus_id field) of platform data entry from phy3250.c in
[PATCH v3 3/4].
It's used by snd_soc_dai_init_dma_data() in [PATCH v3 4/4] to give the
dmaengine a
hint which dma config to use. The LPC32xx doesn't have yet a dmamux driver =
like
lpc18xx-dmamux.c therefore it still uses platform data entries for
pl08x dma channels
and 'SND_DMAENGINE_PCM_FLAG_NO_DT | SND_DMAENGINE_PCM_FLAG_COMPAT'
flags in the devm_snd_dmaengine_pcm_register().
Typically instead of this platform data you would use regular 'dma'
and 'dma-names' if it had
proper dmamux driver like lpc18xx-dmamux.c

>
> Drop.
>
>
> > +
> > +  "#sound-dai-cells":
> > +    const: 0
> > +

The "dai-common.yam" doesn't declare a default value for this so
isn't it required? It's declared in others yaml files like:
Documentation/devicetree/bindings/sound/qcom,q6apm.yaml


--
Piotr Wojtaszczyk
Timesys
