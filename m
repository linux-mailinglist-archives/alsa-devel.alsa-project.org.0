Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FBC90C332
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 07:50:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B008D832;
	Tue, 18 Jun 2024 07:50:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B008D832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718689817;
	bh=QCq79d13E0tz2njJOcLY9mxviKHMKKd7mCV9RIVP2Sg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BYNfLyek24wqPDH95AvQACegvzUfF1XzWf6mh+RCkCbdm0Bgq8v4bL4fGS05V5No2
	 /fPbNboRZ9ERdA4FErgC48RH9fDIAH0Ec65dpmDCH0Yu+fhWuQeeZuRv2URD/B5mCw
	 B15BPCLqnBhic4Kuvy0icdQ5F5r4CRuWERM6WZWg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56CC8F805C2; Tue, 18 Jun 2024 07:49:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9C2CF805C1;
	Tue, 18 Jun 2024 07:49:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3089F80496; Fri, 14 Jun 2024 18:25:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DACC2F800ED
	for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2024 18:25:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DACC2F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=mzhRxEzC
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-6afbf9c9bc0so14197916d6.3
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Jun 2024 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718382302;
 x=1718987102; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ9BKcjtQxEX9HY4AyHldVS/pYAF0bNjL6ygRqtnenQ=;
        b=mzhRxEzC4Gc017O2LajEhBHgDKaR0ATs2PD10L9MO2zYHdbQyLBHB1XoPTfSI4mx5n
         aci+nbPnOGTY/K4Jl35a5gwYxKyHzHtuhGvnj8nqzxoftD5JB0tyW46UHshRlaXGYBDe
         7/9yZuEBbdmegdceowwZ66+aFZDhxOY3Sme8TW4GrbbLNriVFxSBA2nr592lxf3oy2Ls
         REeM8ISJ9Xe4CozCXehySLf6kakAqSBzy0SMIk6whn9J6hXIVqPrYY+Z7KN+K0v8RDhb
         BnNvCOPI95B86S2oAagcHMquVuR6XZeXfBssyubrF3ig4HiOpLYqpGRi3g0DUIp1Y55s
         z+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382302; x=1718987102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ9BKcjtQxEX9HY4AyHldVS/pYAF0bNjL6ygRqtnenQ=;
        b=Beqxl1KPwuV+xCTWHpMtBVUwAWd38A3vi14gmPM4Qsrfteg7ZKodlrPN8G9pq7mD1b
         NoTUov62n3EGMlWkbGUEBDJadnGPfHeUrZTW6PxeLxILw5WwJswPQ+BVa8vd35rCtI6L
         dCjcxXQ3KLx8GXy/fKF9glwb3NMEniRDfuZUbVgrQzy+XlhZzKfCkYvfVtcbSFugeEl1
         2YzgRwB3bFdojIX12F79pD9mFXoPzXbM+YdwsF1PbTawvtKLmNcGj5Po0mUs4UhDCrg5
         1bdkqY777oS/hiui6bUA0K5tXbFm9lRmjrp+jCJ3mwoJ5ERLwgfQRC91sLNA1qHvzXsF
         PlLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1AcxJpKr+ZwicJqLeZ9GxEPUS12KGNY4v3sBg6GRSLBUuJQXP8ia5wN3UhsYGg5LSNRylRH3lcx50AESflTcMPiQ8S/6XL5rrit8=
X-Gm-Message-State: AOJu0Yy58yImaBD0LWMeEN00XlAOoGdszlMvWQPZK6JCXNsc2i9cIQ2t
	WkRTXOQPHrGYeEG9xBeoTxmO/lB0LlVizJnTGlfiGlpY6dMJsoMZX/6mgXEYdnLr7TnWeTKxZmU
	XJbR1+tBiAVKWjSBuKpmyjq6l8Hsmw4oibSxFJDt9/yi3zFTYdp4=
X-Google-Smtp-Source: 
 AGHT+IFxjsSmHmfjxcdx9LWJjlcnDzbmg6MTEjpCpU1mp7pLjF7m25ZdRpimxrXWgRWc3HiQ8GE0JCG3qf8CO/aq5Sg=
X-Received: by 2002:ad4:448e:0:b0:6b0:820c:2d50 with SMTP id
 6a1803df08f44-6b2afc722c8mr36483566d6.1.1718382302054; Fri, 14 Jun 2024
 09:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <Zmgor8accyAiUkUO@finisterre.sirena.org.uk>
In-Reply-To: <Zmgor8accyAiUkUO@finisterre.sirena.org.uk>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Fri, 14 Jun 2024 18:24:50 +0200
Message-ID: 
 <CAG+cZ06B+AexqvwZtNP5FX50AmghAFLa=1ebxmKLvMoyVJ529w@mail.gmail.com>
Subject: Re: [Patch v2 1/2] ASoC: fsl: Add i2s and pcm drivers for LPC32xx
 CPUs
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>, Russell King <linux@armlinux.org.uk>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Chancel Liu <chancel.liu@nxp.com>,
 Arnd Bergmann <arnd@arndb.de>,
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
Message-ID-Hash: A6BMITY2H46LY357D33YQWXC26LCAEWI
X-Message-ID-Hash: A6BMITY2H46LY357D33YQWXC26LCAEWI
X-Mailman-Approved-At: Tue, 18 Jun 2024 05:28:22 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A6BMITY2H46LY357D33YQWXC26LCAEWI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 11, 2024 at 12:36=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> > +config SND_SOC_FSL_LPC3XXX
> > +     tristate "SoC Audio for NXP LPC32XX CPUs"
> > +     depends on ARCH_LPC32XX && SND_SOC
>
> On a quick scan I can't see any architecture dependency for build,
> please add an || COMPILE_TEST for improved coverage.  As for all the
> other things enabled in this Kconfig file there is no need to explicitly
> depend on SND_SOC.
Ok. Later I will add a sound card driver to phytec3250 board which uses
arch/arm/configs/lpc32xx_defconfig config file so that the COMPILE_TEST
won't be needed.

--
Piotr Wojtaszczyk
Timesys
