Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 867727739A3
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 12:37:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C99CF846;
	Tue,  8 Aug 2023 12:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C99CF846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691491037;
	bh=Q6eZMHDgpnQNehQaMvfuZ71S5hlVFmdFs5BVI6OVMsc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=u0EgXTVWQ43C1BpRFnnIaQRkbI3nO8FtTTcgsg3og2HidLqsvmPvczHHeAKcNHud7
	 l+cBysvk8F5GKMAUXVV8SKgo0oQBZwfscWOhCII0PTyQ91pxlF3nKclWIidLOWVUF1
	 vlfufHeZuhzU1MqOzNXcm5BajNararHslIZOuHeE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3381EF80567; Tue,  8 Aug 2023 12:35:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81D04F80568;
	Tue,  8 Aug 2023 12:35:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A53FF80425; Sat,  5 Aug 2023 20:05:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DE6EF80087
	for <alsa-devel@alsa-project.org>; Sat,  5 Aug 2023 20:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DE6EF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=n0fK/y30
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-314172bac25so2521080f8f.3
        for <alsa-devel@alsa-project.org>;
 Sat, 05 Aug 2023 11:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691258738; x=1691863538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sdRAieAfV+HXU2d8HHj56ySjii4cMQwtBoYAE7N8g5s=;
        b=n0fK/y30pRu67o6OdFtdPg9SBOZqPhrCfGUIUocdWZjGdUAnThcdzYcbzdDR5Cy7ZF
         Tb4BjhaShFAziu49DZm5WGefcbR8geefa8kJjdc8BO6EgWlYcMlFibBJiaEvgj9WlP6v
         qSkkm02uz2+hqpZi66JrB69ZA+yjSKuauQ3jGgYf1Nxlp2aFzSycIoAcf4bklWfTILZA
         v/fVLZmzWwh6YwsMLwsmDw2UMQXXP0k0iol0blojjuQXXalegi1jH91cCOwFeLvT8J2i
         qlEXnndY6XpbggsMj9nzzDdKUDtQpzljDFtYbAqLz+ivTVk0PtRzBfmWnCXbzLTpMeWY
         5N7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691258738; x=1691863538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sdRAieAfV+HXU2d8HHj56ySjii4cMQwtBoYAE7N8g5s=;
        b=MumSKEoihIatCcUaY+zrxRNUEnpL0tZva1hzjmRZBFZLUSqL3hJlzdPrkyxGWJuiL1
         x84LavzdvnEyKEKjaIBDAnqW+e70WXQbtq0ocyxoqCXd3pMqCxqYoNWwAhHSPhINe9Ah
         zKVVtrmgRn7fKurZ3+M9pSDOY7AFv+aOmvgG2mRL2sknYCol+REvkzIKWRTGOPzGooHX
         LnPXmHrZZ3YBHkmYgye+rNBXuH1EbpWf07rH9+NFGTyID2dt0JeEr7IGDUsZlwoERica
         RvPguCbXXdZL2LLjDt/D4V7TssA2sRXk5ccXBI1P8TYyabZsNaIbNdvLppggA4z7Y1HE
         K8xw==
X-Gm-Message-State: AOJu0YymZRtB8CO5VS+Kd5cXdjY329qdoEJYLXiygA97KAnoUHTbIRkL
	j3i7+IRZeVzNk13/Li9RoPs=
X-Google-Smtp-Source: 
 AGHT+IE+5m/SQ3eshBedJihbRDlO9MZ+wChC74UcCgeJKgphC3WBm37dlSMr1RZdbjAWZFPdnVj2lA==
X-Received: by 2002:a05:6000:10c6:b0:317:6fff:c32b with SMTP id
 b6-20020a05600010c600b003176fffc32bmr2915238wrx.53.1691258737930;
        Sat, 05 Aug 2023 11:05:37 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id
 v4-20020a5d6104000000b003176aa612b1sm5710402wrt.38.2023.08.05.11.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 11:05:37 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Ripard <mripard@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 0/5] ASoC: sunxi: Add support for D1/T113s internal audio
 codec
Date: Sat,  5 Aug 2023 21:05:00 +0300
Message-Id: <20230805180506.718364-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: bigunclemax@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XHFMEAS6GSXWEQ7F2GB3D3YFGD2LYPIY
X-Message-ID-Hash: XHFMEAS6GSXWEQ7F2GB3D3YFGD2LYPIY
X-Mailman-Approved-At: Tue, 08 Aug 2023 10:35:25 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XHFMEAS6GSXWEQ7F2GB3D3YFGD2LYPIY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

This is the series adding support for internal audio codec on
Allwinner D1/T113s SoCs family.

My work based on Icenowy Zheng's patches from sipeed repo that adds
support for the R329 audio codec. But, unfortunately, these patches
were not sent to upstream. So, I adapted them to fit the T113s.
In the future, support for R329 could easily be added on top of
this series. Because D1/T113s and R329 SoCs have almost the same audio
codec IP, with slight differences in the analog part, plus the R329
has two additional ADCs.

The series includes modifications for the existing sun4i-codec driver
that brings support for the digital part of the D1 codec. And adds the
new sun20i-d1-codec-analog driver for the analog part.

I would be glad if someone have a look :)

Cheers,
Maksim

Maksim Kiselev (5):
  ASoC: dt-bindings: sun4i-a10-codec: Add binding for Allwinner D1 SoC
  ASoC: dt-bindings: Add schema for "allwinner,sun20i-d1-codec-analog"
  ASoC: sunxi: sun4i-codec: add basic support for D1 audio codec
  ASoC: sunxi: Add new driver for Allwinner D1/T113s codec's analog path
    controls
  riscv: dts: allwinner: d1: Add device nodes for internal audio codec

 .../allwinner,sun20i-d1-codec-analog.yaml     |  33 ++
 .../sound/allwinner,sun4i-a10-codec.yaml      |  64 ++-
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  22 ++
 sound/soc/sunxi/Kconfig                       |  11 +
 sound/soc/sunxi/Makefile                      |   1 +
 sound/soc/sunxi/sun20i-d1-codec-analog.c      | 220 +++++++++++
 sound/soc/sunxi/sun4i-codec.c                 | 364 +++++++++++++++---
 7 files changed, 643 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun20i-d1-codec-analog.yaml
 create mode 100644 sound/soc/sunxi/sun20i-d1-codec-analog.c

-- 
2.39.2

