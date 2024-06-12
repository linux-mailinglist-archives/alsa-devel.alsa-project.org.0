Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8200F90780F
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:16:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1611B1912;
	Thu, 13 Jun 2024 18:16:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1611B1912
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295417;
	bh=jU0s9gEKbGXmqfGEflzcwnbnMDxLuaH6EgnphUim8yM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=snkmoD57MzMaDZlpMqjA4UsNTzyVUSWPIb3M+pSvyF4JW++eqCW/oS3dTtQujnl9G
	 jpDHyJrIgZKgAieP9BFpyi1g69jyCYtLnJ4/Y1Q0SwseP52rLJK802lKXz5/EGYJ/I
	 T/p8Aaq2uzQZThg6wZw60SHRWUXRQaei4s7ugHgQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0DDBF80C43; Thu, 13 Jun 2024 18:05:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75D73F899FA;
	Thu, 13 Jun 2024 18:05:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48FBFF8057A; Wed, 12 Jun 2024 10:06:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8022F80448
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 10:06:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8022F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=OitgKLtS
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-6ae259b1c87so5933286d6.1
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718179583;
 x=1718784383; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jU0s9gEKbGXmqfGEflzcwnbnMDxLuaH6EgnphUim8yM=;
        b=OitgKLtSIJLB4ulZXUnu5rZGWBu9g5V1fU9e25udlBmF/UwPto01aQIgJnzor5vMEI
         GiQn6+JYuM8w4YWZAyXRSzeGnJxXvpVfR3xk8+85JJhRThHXe6ZpOxKBerO4/jr/cQyP
         z2N+WyV5SnijyjcCvAIBfs9lwqQVBvTEholwBQDj6728R+sjmAWBqmjf074Bzxi458y4
         jJAIKsWXucTXHbhxEmS75e3UzXN4hn24XnIXyfg/OyXvnp0LVHi0XBaZ5Ec97/iV1YjE
         DKDAh3iR2GA6SSsBVn+yg2Lz7YXdcuLN97MYV3YfvYbrrKAhb7/8Hv9BQv8cB5XD/+PJ
         awIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718179583; x=1718784383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jU0s9gEKbGXmqfGEflzcwnbnMDxLuaH6EgnphUim8yM=;
        b=XcAg516eBINbG8kECcLNNpd3xgjuZrkfaNWYF+G/O1o3rFNhMyG/IQcQab3uP2xyml
         RXcGlnJHFCVfrw9Bg6rI0yW24IMHJw1DrP/XnyjXn25cuVurXlICPxgOGgJPkJCSxjnL
         yDR5i/b5Iqh0nFPuzG4nSWESBPAWvlra8WdVbmc6louReEP4Gzjlqui54RYYXvun1U/3
         61gSYurOA2A36THYRmzkZU3KdeHaV8FkRLXxuseF0P+TANuznlparT04WHwvuJkpXHar
         EXugqxojkjbVcro932M24RgOsqRXxWqJJRDQIog3ZHP0fhCCTWW2bfhTka3FZOf5zNAI
         O/eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSNibtejM/ni49NFggJ/lCDIbxok2wpa+T1Si1bFKgbAEAFlW+hFZNWqpzxkgwq++LNGQWZCB3vxTlAN7j+eB05IKj9q0Q/DdqaUk=
X-Gm-Message-State: AOJu0YzI2s9e5Pfo9bnXO/H+tNG4OYwsSV6GEAGwMdlugKWr+GULo8tu
	Dn5sv3hhFJQty2pyeLAOuTDlFMErF5lj7hJnxCtZvA2TnWK+hWAuJFgXnKdj+no5TyL17Bu60+G
	IplqxyLx0t10+N8aJRczHNCY2Lv4rQ9Px90FjXw==
X-Google-Smtp-Source: 
 AGHT+IG1/F1xQpU9EkBs57YWAqg59A4uhPeAz2DU+7fqEukJUGW0HybNnc7pOII0nGwuizPlb618ysTlXm0ZvIeJ3Yo=
X-Received: by 2002:ad4:5d4d:0:b0:6ad:752d:1530 with SMTP id
 6a1803df08f44-6b08a0780damr78312956d6.27.1718179582619; Wed, 12 Jun 2024
 01:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240611094810.27475-2-piotr.wojtaszczyk@timesys.com>
 <51eeec03-47da-44b5-a21e-f280d0c4b47c@kernel.org>
In-Reply-To: <51eeec03-47da-44b5-a21e-f280d0c4b47c@kernel.org>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Wed, 12 Jun 2024 10:06:11 +0200
Message-ID: 
 <CAG+cZ06EN4Uw7Cy+kwsiPzu16Kp7tsF19Oit6oN6GUcSe464JQ@mail.gmail.com>
Subject: Re: [Patch v2 2/2] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>, Russell King <linux@armlinux.org.uk>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Chancel Liu <chancel.liu@nxp.com>,
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
Message-ID-Hash: ZINWVKN4JENMNDLNC5OY43GE7W7YMD2Z
X-Message-ID-Hash: ZINWVKN4JENMNDLNC5OY43GE7W7YMD2Z
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:05:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZINWVKN4JENMNDLNC5OY43GE7W7YMD2Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 11, 2024 at 12:45=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> > Changes for v2:
> > - Added maintainers field
> > - Dropped clock-names
> > - Dropped unused unneded interrupts field
>
> Does the device has interrupts or not? This should justify decision, not
> current usage by drivers.
Yes the device has interrupts but feeding data FIFOs is handled by DMA
(amba-pl08x.c).
Should I declare interrupts despite they are not used in the compatible dri=
ver?

--=20
Piotr Wojtaszczyk
Timesys
