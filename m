Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FB669E7A0
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 19:37:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 332A6E76;
	Tue, 21 Feb 2023 19:36:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 332A6E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677004648;
	bh=y5f/7FD5XngEI+WAgdFrak7KGfSwx36w2Fb0H7QFUug=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MvERLNrnMDdgPpG5BU98AQDSL6oEUCgdGUnVZc0W1g3UnM796Rxq+zcGmxzuXwptN
	 YXkOzbDZmg1Z4T3RdM/5D5LxZlRQ9pZwuov+nTQ9FiUgXkaeJ9TN5cxuLB754kwRmP
	 s+K70OSI11caVN6CE7RI90edPnTfiTQ3PVsefDF4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 825D1F8025A;
	Tue, 21 Feb 2023 19:36:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA4BFF804FC; Tue, 21 Feb 2023 19:32:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1885F800BA
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 19:32:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1885F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=kWq4ecHF
Received: by mail-ed1-x529.google.com with SMTP id ee7so5923742edb.2
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Feb 2023 10:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0EeJlO8QUl1DZMAlcd+EODPEJDc+DBbZZnZ+JDzoEdg=;
        b=kWq4ecHFuWXMSQZOzGBaSB3TZctWJCNGUWIu8P3VK24KihWheD/Hkgnz3BhcjBm+Ov
         z8eahBqmrp2SwL0wBFOCTd+8Knk4Nx90ZwYEY03DeTfn6M/VqR6QPOqhy5+242r9yDzt
         Ebj1teN7A4oA8YgIQe8byK5O6YanmP4Rk4ZeqmJR7xKaFSbu8E7tfn3utJjUFoZ988os
         QEbB2xHc3wW1X2WPp4qC8P+OOaY4c9nDtBXBo3LdSxRv8OmHfXrfBf1SVw9icnA4wePn
         SA8PnAH5xFwF8CR18LYgwYpvbCp28OMh9f4PgaM5DxNZ/D9Fk68DmsvDr2FtOiXzVAsJ
         Jbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0EeJlO8QUl1DZMAlcd+EODPEJDc+DBbZZnZ+JDzoEdg=;
        b=oaNe71YcSpgLPS03tYGATJ0bpuUiw4Dxj8U4vRvX7Oq/XVvS/5zUx/jyCq2U42sQH5
         ZIK0xQO2rkg2PQG6b3Z9X/3eC/NzY5W7vlXQEuHaUhah4aarvhGgxy2b0SP8BpWqtedu
         AwNWpRgJQTYHwxGd17A3URuwxor6FbF9JCYBId3lriJCdqP8vGTrfeMrIpGfVo9YxW+B
         hZ1PNHfexbjhMfKUq2tIQqBx615BAhMvpKHaf9W3+4GUcuw+h6Sdbq3EvjC8Oq6eaR18
         IzMTVJYhbIvAfKITYUAOMABgkCJtfcoLW5hm8lyzOLohfw2iqo0klFenAtI+pYgQxaRX
         PnAg==
X-Gm-Message-State: AO0yUKXj1dfc+wHoVEO5aadIKvYl7fsMdVDsF3O5RgzNpwk82Cgfz0H0
	GGouAEDj64+RQbQlF7bkhrY=
X-Google-Smtp-Source: 
 AK7set86GBsI14U6VEaKmjm3BNimI8/ZzoK6Ek4xMuPyAJKltWK2m8xRKjLbpVGkaLUsc2k/7+79Yw==
X-Received: by 2002:a05:6402:215:b0:4af:515d:5658 with SMTP id
 t21-20020a056402021500b004af515d5658mr2968051edv.35.1677004342754;
        Tue, 21 Feb 2023 10:32:22 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a50c3c3000000b004af5aa16fcasm169102edf.66.2023.02.21.10.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:32:22 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 00/10] Fix sound on ASUS Transformers
Date: Tue, 21 Feb 2023 20:32:01 +0200
Message-Id: <20230221183211.21964-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IFCLOGWXTBXAN2XZWXV4KCCG2TQ2VKOR
X-Message-ID-Hash: IFCLOGWXTBXAN2XZWXV4KCCG2TQ2VKOR
X-Mailman-Approved-At: Tue, 21 Feb 2023 18:36:34 +0000
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IFCLOGWXTBXAN2XZWXV4KCCG2TQ2VKOR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

- add quirk for headset detection used by some T30 devices
  (ASUS Transformers, LG Optimus 4X HD and Vu);
- add RT5631 and MAX9808x machine drivers
- add Fortemedia FM34NE DSP driver used by ASUS Transformers
  and mandatory for correct sound work
- bind everything into working configuration

David Heidelberg (1):
  dt-bindings: sound: nvidia,tegra-audio: add RT5631 CODEC

Svyatoslav Ryhel (9):
  dt-bindings: sound: nvidia,tegra-audio-common: add new property
  sound: soc: jack: allow multiple interrupt per gpio
  ASoC: tegra: Support RT5631 by machine driver
  dt-bindings: sound: nvidia,tegra-audio: add MAX9808x CODEC
  ASoC: tegra: Support MAX9808x by machine driver
  ARM: tegra: transformers: update bindings of sound graph
  dt-bindings: dsp: add Fortemedia FM34 DSP
  staging: dsp: add support for Fortemedia FM34NE DSP
  ARM: tegra: transformers: bind FM34NE DSP on supported devices

 .../bindings/dsp/fortemedia,dsp.yaml          |  95 ++
 .../sound/nvidia,tegra-audio-common.yaml      |   4 +
 .../sound/nvidia,tegra-audio-max9808x.yaml    |  93 ++
 .../sound/nvidia,tegra-audio-rt5631.yaml      |  88 ++
 arch/arm/boot/dts/tegra20-asus-tf101.dts      |  22 +-
 arch/arm/boot/dts/tegra30-asus-tf201.dts      |  46 +
 arch/arm/boot/dts/tegra30-asus-tf300t.dts     |  34 +-
 arch/arm/boot/dts/tegra30-asus-tf300tg.dts    |  36 +
 arch/arm/boot/dts/tegra30-asus-tf700t.dts     |  36 +
 .../dts/tegra30-asus-transformer-common.dtsi  |   9 +-
 .../arm/boot/dts/tegra30-pegatron-chagall.dts |  29 +-
 drivers/staging/Kconfig                       |   2 +
 drivers/staging/Makefile                      |   1 +
 drivers/staging/dsp/Kconfig                   |   7 +
 drivers/staging/dsp/Makefile                  |   2 +
 drivers/staging/dsp/dsp-fm34ne.c              | 364 ++++++++
 drivers/staging/dsp/dsp-fm34ne.h              | 845 ++++++++++++++++++
 sound/soc/soc-jack.c                          |   1 +
 sound/soc/tegra/Kconfig                       |  18 +
 sound/soc/tegra/tegra_asoc_machine.c          | 120 ++-
 20 files changed, 1837 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dsp/fortemedia,dsp.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
 create mode 100644 drivers/staging/dsp/Kconfig
 create mode 100644 drivers/staging/dsp/Makefile
 create mode 100644 drivers/staging/dsp/dsp-fm34ne.c
 create mode 100644 drivers/staging/dsp/dsp-fm34ne.h

-- 
2.37.2

