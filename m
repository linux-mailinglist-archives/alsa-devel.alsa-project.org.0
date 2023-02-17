Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFB469B2A8
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 19:54:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43637FAB;
	Fri, 17 Feb 2023 19:53:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43637FAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676660042;
	bh=YzfaVgX9pzUlnGnScZQGhepsJ3KzveTDtTLGIfiZFIM=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QiIV1O3M7iJHdMOkono8crtDyove8EFufz+h4TmhCa5mQWv3v8sS43YUCVOxcq3iU
	 k9Uo86OaPKa3Ly/KhjzifJY8SCBqopJw5Gk5JegBjwgwnaqKwnrUX/H5YR7vW4X0ZG
	 Fp67XTUmBd9sIxMhgIJxrGIJYiSQjfcdxSmj/9dY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 920AFF800AA;
	Fri, 17 Feb 2023 19:53:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C0A2F80496; Fri, 17 Feb 2023 19:53:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5AD73F80083
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 19:52:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AD73F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZGTIKXW1
Received: by mail-wm1-x32e.google.com with SMTP id u16so1621784wml.5
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Feb 2023 10:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHDnEinTRmd4SoQ9dH9rKDosnOXl5ELjM68bNY773ck=;
        b=ZGTIKXW15RTh+6YdP9JSTUqLZXDje6luzloNlmWCiiNhBBlavbWtSIvnZMKHdaxo/B
         1A3VxyC1BuknxTlALkbhI6IQQbuQvy9BESbaR89ijyJVg+Hv2FIGcNZ9AsGYeJrCE4nD
         xnPA1boK5QEOWiiBm2cXZja4NgIuMRIaDlCeq//OlcroxQzGZ6i6q+ahbvVMqYPfEcKJ
         KRQrGfGKtXJRUWe1zzjKj2L0XlW5g+n0oSeuqSrNdVVFOnvZXpllG4wHf7THpEhJpSkR
         WBrO6BRyWUpiukCUfwDyggImfL0Cs2NksPc9QyLkNchs3IDQJXwFZKYJJkSwxNS17PSh
         csCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHDnEinTRmd4SoQ9dH9rKDosnOXl5ELjM68bNY773ck=;
        b=uhoZfxi88hqqCTyvDOlnXZvtSugJxdy6iYFP7fcCt1fr1iO3+LlcKmZ4aU+DhQmPDc
         oSpqu5gpRXppHojDhW+fDy+ax44MpMiTFyhIskU5P4WzgmZqvOt++DsG80d7wIEhnAFH
         tZKo7Jn9x1hRmAxGsLJCpJRGvN4y72IAkugevWHxmOQG8FsUEYA/cWMkGcPz2tqdfZEl
         yFQmKchXUxi1Ux/1kOPbgpNWBqkGVxbppb6gqia4ZprzCS1Ssm1znbmlSd890r3ZYVuE
         1k4l12cqICoWFQTyGrv1JGwo6NOdGz2mC+yYdAQHrEzv6utbGkOup+3YB8zkPhdNG70l
         +Nqw==
X-Gm-Message-State: AO0yUKXe7oysl266AYafEUjAT7iERgsNj2QM6s/ciWUtXTZ7VL/fEsRp
	RQtD9cmIWbMZfUUCI59ESgY=
X-Google-Smtp-Source: 
 AK7set9XnLnmKIlm6nCz1Hs+VH2mjKrxq3W6ZQ1AmK9c7R9ar4hKJKKl+c9m/V5wh9omNS+GlIEuCA==
X-Received: by 2002:a05:600c:4494:b0:3e1:f8af:8da4 with SMTP id
 e20-20020a05600c449400b003e1f8af8da4mr806854wmo.1.1676659976455;
        Fri, 17 Feb 2023 10:52:56 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:d8bd:e692:c27f:c09d])
        by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b003db0ad636d1sm2964514wms.28.2023.02.17.10.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 10:52:55 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/4] RZ/G2L SSI: Update interrupt numbers
Date: Fri, 17 Feb 2023 18:52:21 +0000
Message-Id: <20230217185225.43310-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TULADQBQBVC3QIBHLR2XZIVD7ACUSYIC
X-Message-ID-Hash: TULADQBQBVC3QIBHLR2XZIVD7ACUSYIC
X-MailFrom: prabhakar.csengg@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TULADQBQBVC3QIBHLR2XZIVD7ACUSYIC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to fix interrupt numbers for SSI channels and updates
the DT binding and the driver accordingly.

Note, this patch series applies on top of [0].

[0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20230131223529.11905-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  ASoC: dt-bindings: renesas,rz-ssi: Update interrupts and
    interrupt-names properties
  ASoC: sh: rz-ssi: Update interrupt handling for half duplex channels
  arm64: dts: renesas: r9a07g044: Update IRQ numbers for SSI channels
  arm64: dts: renesas: r9a07g043: Update IRQ numbers for SSI channels

 .../bindings/sound/renesas,rz-ssi.yaml        | 21 ++++---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    | 19 +++---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 19 +++---
 sound/soc/sh/rz-ssi.c                         | 63 +++++++++++++------
 4 files changed, 70 insertions(+), 52 deletions(-)

-- 
2.25.1

