Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 638D070E784
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 23:40:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A3C0209;
	Tue, 23 May 2023 23:39:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A3C0209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684878007;
	bh=EsrAPhxo3puyaSj7ajd+Tc6o7LeA04zB5AYHMx4iR0M=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uD/67+xf4nF+3xqFUjIx0ogyBIdF7j6hRIMl63eK+koc/q3FS0ZFUzNi0Z8umhYkz
	 6x0Pta/t0CscolrxCBL5g+QrInNJLWaKL4tqak+96zTH30EhkC+gEB79HHRZo6Nd+D
	 actgGrPWcvmCvktYb8DATt/twe7NE0TYc7BQAAwQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44DF1F80553; Tue, 23 May 2023 23:38:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 885D8F8055B;
	Tue, 23 May 2023 23:38:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72FD4F80544; Tue, 23 May 2023 23:38:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6345AF8016A
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 23:38:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6345AF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Opz4IE1p
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3909756b8b1so134190b6e.1
        for <alsa-devel@alsa-project.org>;
 Tue, 23 May 2023 14:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684877912; x=1687469912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=arqptb0OK5jJvfCDv3LmhvqgIyzYXs27jb/mT9pkapg=;
        b=Opz4IE1pgS3b+YNtQXnRxbTZ9Xc9wk5U+dXsSL5bASel6njkJGJD1McpafVnUDHNTX
         gAM4ZPUaaJCttEi/15Ylm6U6nsOFg4s8BYTdHzPAFYp4uuIrXYXUKZU70TgAy1/4OB07
         SvEvCUEUqfEyGxcdtHbzXOUPPhkXt9soUGYhOpJyWbrhhrl70Blyek6cf+IWtLZHMhld
         TRoKc6pH4+b3eMrHDHH30ZCzpOHEcv4oc7nBKHnR5TEvYRNIvGV+/Cdibx61eLZlKtSt
         dyn8dE4RbO6sxAfKUBsUrhkF6LUmIQdGuoI04kAsnDoZK/y1p5DtIzw6hZD4bagNJSs5
         BZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684877912; x=1687469912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arqptb0OK5jJvfCDv3LmhvqgIyzYXs27jb/mT9pkapg=;
        b=hWCVxBv3UtYEOnjPVzIdelR+Kl8ozg5ieYPIVCwNa7Ab5loj1zTskcDiUNChamAQ1c
         Nlotzv4O46wvs3QwGBbOmREoSba4UVLXKm7osSAeCjAglUoIRmca7RRA4SGLeMIH0vBS
         2OetAYmEyzIDgRFYHeLwCabIvixz7yMCDSKFEEjcW1cSuQu15eYLmX/9fvYdWCuky7xV
         ieR+6iGGIMV/mr6QlvM0Fhx5SvVZ2cBnHcymGIXPQMBBN6Yzp3uql9XNwYcwgxXaU9sQ
         Gkwmq1c0grROT1FaWWcT+x4ixxOBjzj4lZM1HPTJJ8gkX93k/egbebcznEAMJP5SVV8L
         +b5Q==
X-Gm-Message-State: AC+VfDzdqQQ7/LKQRdxV9IwM4kjTjLlWvBsc83b+Dlvw/uOhY7+TsHhg
	875brhaGXe2VQxcwl9bvTyo=
X-Google-Smtp-Source: 
 ACHHUZ4NZdtIsaO5n44Zn7IKr1DzCMLgEaBZw8ilmvOfkDar/T7XjSOMt5GKhFnsBoinBC59QI98xQ==
X-Received: by 2002:a05:6808:216:b0:396:42a9:9877 with SMTP id
 l22-20020a056808021600b0039642a99877mr7898056oie.37.1684877911885;
        Tue, 23 May 2023 14:38:31 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id
 y83-20020acae156000000b0037832f60518sm4442359oig.14.2023.05.23.14.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 14:38:31 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	zyw@rock-chips.com,
	sebastian.reichel@collabora.com,
	andyshrk@163.com,
	jagan@amarulasolutions.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/6] Add Support for RK3588s Indiedroid Nova
Date: Tue, 23 May 2023 16:38:19 -0500
Message-Id: <20230523213825.120077-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NDDMCRG3WYZ44AQVHPO6UA2BA35TWA6I
X-Message-ID-Hash: NDDMCRG3WYZ44AQVHPO6UA2BA35TWA6I
X-MailFrom: macroalpha82@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NDDMCRG3WYZ44AQVHPO6UA2BA35TWA6I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the RK3588s based Indiedroid Nova. Note that this
series is dependent on regulator support for the RK806 being
upstreamed.

https://lore.kernel.org/linux-rockchip/20230515152044.GT10825@google.com/

Chris Morgan (6):
  ASoC: es8328: Enabling support for 12Mhz sysclk
  arm64: dts: rockchip: add default pinctrl for rk3588 emmc
  arm64: dts: rockchip: Add sdio node to rk3588
  dt-bindings: vendor-prefixes: add Indiedroid
  dt-bindings: arm: rockchip: Add Indiedroid Nova
  arm64: dts: rockchip: Add Indiedroid Nova board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588s-indiedroid-nova.dts  | 761 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi     |  18 +
 sound/soc/codecs/es8328.c                     |  17 +
 6 files changed, 804 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts

-- 
2.34.1

