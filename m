Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 410A78B3B9F
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:33:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2D2021B4;
	Fri, 26 Apr 2024 17:33:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2D2021B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145612;
	bh=IkqBB2wtliEK5GnGejTqTQe4Yfs6TKvgKFbT0UeTxrk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hPBw07Um63jPbh6bSE4CINeX7+PZfqFiWQInrEenFKyCBuXib6s/UWoVKGrLj02So
	 +aMfx+QhBVguqF2gCCUMQlG3GDJeqKbJPA1VBep05xR0YjzfSEEX2AhLgIsC3ngEJm
	 gcIKEBxgBRrn+n9/3vSA6vXWdSBFTwpxPrlxkFdA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9597BF80603; Fri, 26 Apr 2024 17:30:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9E95F80600;
	Fri, 26 Apr 2024 17:30:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26FD1F805D6; Fri, 26 Apr 2024 17:30:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80559F80579
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80559F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=hcpMW8mi
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-51ae315bb20so2804955e87.1
        for <alsa-devel@alsa-project.org>;
 Fri, 26 Apr 2024 08:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714145395;
 x=1714750195; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xUkLsSc4WA93wLtzN5OQsZNRMCNr0FDmpfgqlBr15OA=;
        b=hcpMW8miEaPpXKVKKBgRnvroxZUCzl/iGog+GZxc2mbFs2OFaK62XcQDL3b8mWhi0y
         gm/YWs9r0iwsGXJ6em/Gz3SD513hgYWxImCg/ptgg0snjjJaR+SlWGbId5yaxJJc9WrH
         vthV7odl+6ZGB8FeGpDOJoUM20KrAs0iVYWx98P7U35ISHCCcbInu6lh1+/eG2YuwZQl
         r0BZgvpGJZ5jHS3kGLitQ0PZKE/1ghkd2oAeCb3gGJYBdlMm4ClUb9p6d503tTe4inZe
         7OgbZqc7KDFAfbhcDfRyfiRVcfzRrCofuYCCpVzMF5EmnUTkdgseLCxxtuzrImX86lnZ
         hgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714145395; x=1714750195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUkLsSc4WA93wLtzN5OQsZNRMCNr0FDmpfgqlBr15OA=;
        b=bbELjBmqbia24QLt3OhKXLJj0rZ+jvsl92Mr0owOm3Wb5+tgo90lnn8qEmhR3W7c0v
         t9+pVi3/MgeoQ5d9w+cj0wPoJvSesZzPZ3boF97hg9VIlgEgIgPfoPUzEDEqbLy7d7Rf
         HCdksqQgAjtdctzJHUKhNB25c26u4qx0r3ltqqpGwRgQL0PGTkKfqmVJFRd1omEXViXd
         JN74YrSw1vMz6RzK4wk27OImcaYAKFeokL2FxuAL6X/uyYTC7bHMN2UdrM2TsXQZJXV1
         /Q22lIalVn1Kf+sUoiyMl/+c3lcDHu3fl2Es4OYGkBZ6ppyMuC86Tzr9UjjTfjxkFg31
         zKgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGHkR5018moA9E6xrUEDunnt0PR5nXcK/l1YozW6WU3EI+LirZSNHBVEXk0gZrQ3yu9VgGYrM6cUPnjTGwCXRRNSAFud6P8+2rhPk=
X-Gm-Message-State: AOJu0YzI9peqBEhtoCcFEppypNuLhLNMPgmJtvgGmHj/abGzfscOoNGw
	5yF/u4HFL6fUVCMf6bmhlmxiVUzSDBF/8C3DtY2+tg2SeGj33It1yzrzU5cNnmY=
X-Google-Smtp-Source: 
 AGHT+IFMxlBhWe1Oje3VzHCy05U8U/CCJEV92z6GmGIYTbHCedgsiCSp+J0MWzhqi0Ldz9xuDlW6Sw==
X-Received: by 2002:a19:ac0b:0:b0:51a:f255:ade3 with SMTP id
 g11-20020a19ac0b000000b0051af255ade3mr1761882lfc.20.1714145395077;
        Fri, 26 Apr 2024 08:29:55 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1926:f73e:8b99:1c0a])
        by smtp.googlemail.com with ESMTPSA id
 i13-20020a05600c354d00b00419fba938d8sm22628687wmq.27.2024.04.26.08.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 08:29:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 0/4] ASoC: meson: tdm fixes
Date: Fri, 26 Apr 2024 17:29:37 +0200
Message-ID: <20240426152946.3078805-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I33N4W5PKIPAUYRL54IF4WS4QVIOB22F
X-Message-ID-Hash: I33N4W5PKIPAUYRL54IF4WS4QVIOB22F
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I33N4W5PKIPAUYRL54IF4WS4QVIOB22F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset fixes 2 problems on TDM which both find a solution
by properly implementing the .trigger() callback for the TDM backend.

ATM, enabling the TDM formatters is done by the .prepare() callback
because handling the formatter is slow due to necessary calls to CCF.

The first problem affects the TDMIN. Because .prepare() is called on DPCM
backend first, the formatter are started before the FIFOs and this may
cause a random channel shifts if the TDMIN use multiple lanes with more
than 2 slots per lanes. Using trigger() allows to set the FE/BE order,
solving the problem.

There has already been an attempt to fix this 3y ago [1] and reverted [2]
It triggered a 'sleep in irq' error on the period IRQ. The solution is
to just use the bottom half of threaded IRQ. This is patch #1. Patch #2
and #3 remain mostly the same as 3y ago.

For TDMOUT, the problem is on pause. ATM pause only stops the FIFO and
the TDMOUT just starves. When it does, it will actually repeat the last
sample continuously. Depending on the platform, if there is no high-pass
filter on the analog path, this may translate to a constant position of
the speaker membrane. There is no audible glitch but it may damage the
speaker coil.

Properly stopping the TDMOUT in pause solves the problem. There is
behaviour change associated with that fix. Clocks used to be continuous
on pause because of the problem above. They will now be gated on pause by
default, as they should. The last change introduce the proper support for
continuous clocks, if needed.

[1]: https://lore.kernel.org/linux-amlogic/20211020114217.133153-1-jbrunet@baylibre.com
[2]: https://lore.kernel.org/linux-amlogic/20220421155725.2589089-1-narmstrong@baylibre.com

Jerome Brunet (4):
  ASoC: meson: axg-fifo: use threaded irq to check periods
  ASoC: meson: axg-card: make links nonatomic
  ASoC: meson: axg-tdm-interface: manage formatters in trigger
  ASoC: meson: axg-tdm: add continuous clock support

 sound/soc/meson/axg-card.c          |  1 +
 sound/soc/meson/axg-fifo.c          | 29 +++++++++++++--------
 sound/soc/meson/axg-tdm-formatter.c | 40 +++++++++++++++++++++++++++++
 sound/soc/meson/axg-tdm-interface.c | 38 +++++++++++++++++++--------
 sound/soc/meson/axg-tdm.h           |  5 ++++
 5 files changed, 93 insertions(+), 20 deletions(-)

-- 
2.43.0

