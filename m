Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D78942996
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:50:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ADF92BD6;
	Wed, 31 Jul 2024 10:50:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ADF92BD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722415817;
	bh=3Lh1BwhVeqRnEATXFageAXiylnoLj5EisM5J8nNNO+w=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=moomdavB8+9geaniO+EErXX/DuEaRYdspwR2pFqW6Ha75Em4yHB/FxbjKqkAFAmQI
	 dv7omU9iK6B0JpXSHEHamLvOTG4e/IbQQOz2gal5MpOE3eNjhPmp2j58eKvuzuH02/
	 ckojN9+onc0N4/MWfqEGvT+5R1nGydsFlf3HgDeE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF200F805C8; Wed, 31 Jul 2024 10:49:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5261BF805AB;
	Wed, 31 Jul 2024 10:49:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F4FBF8013D; Sat, 27 Jul 2024 20:25:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	TIME_LIMIT_EXCEEDED shortcircuit=no autolearn=unavailable version=3.4.6
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96123F8013D
	for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2024 20:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96123F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JPew/SXn
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ef2fccca2cso27361121fa.1
        for <alsa-devel@alsa-project.org>;
 Sat, 27 Jul 2024 11:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722104442; x=1722709242;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WxFUyWe0lcthVY5bBYHT4KxjaYpQ0TGg/fnnCJonf3U=;
        b=JPew/SXn34tgZLePYg/jR0pXgyVZ70Nj4ePzXNZcnubhNl0ucB0h+QqOlTlLhQ5+hJ
         YrwHWj9saXxK3+qx5cA5JyK3THusr3pfiGa3hZRVrXXV/Ef4g0R2bCXQ5araAro1APfM
         1o5pyiJojTkCuVTaq7laL5d5eTBeF5sbNXWRCZ8k3jnCXdG1+KhHxos/UZzUQtKG3xul
         tSQ/qY+CWlIGNjEypeZ/m0D2cF3RXPIh53QKszE7XQVyucwDlSAE+GJ5cEN7M6HcyYnQ
         J1jCWDfjz0t2eUFyXpktDiuz03w4c+oGkOClBLmjQ6/xyJoRoJ2iyAY/T9VZwlHgN5BF
         ZkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722104442; x=1722709242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WxFUyWe0lcthVY5bBYHT4KxjaYpQ0TGg/fnnCJonf3U=;
        b=uYE1BWL9BheHiXfSUY8ul7+3tIIftoGmvilsWEEewwHWmy3AK0YhWUUxgX/a10Mbem
         7lg8kfhbXIeAy07ws14jpguWuQLW7sm7FZ/TzII0Po2A95auweQ9vimpI3W2vuQd2R02
         C+xK8gpOU5BgUTpzcmQtPMVdWi3+o6oHFk9qg9Zz3ie0dXLC8MbGdyFJHPfoNKJIevCg
         dcy3W3hFJCzS1opOj2T7sSWROWJJDOFihArJ5V7Ubm5vQLv/dHVIYr7l/EaazX6FnhI9
         GI+XxqlaceKJIYF4wcpBfwc9mV9cPbE80SnNOmtZtuQLt2J+C3hOWrXECSiM4bJr0tD/
         IwAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfstjfXrs4t2EzpekLZxDBIwiNewfHlOdL4uBedj/tWO54TT7glGBC5HpkX1moV7S+diXPyW5kT90teA5EqLygqOM55HmvhCHrRCM=
X-Gm-Message-State: AOJu0YyJoKyt49D8jCbUiycAvAkclTs+COylqVGTDhYsHn/LaB0ZIjIC
	uhLX666Sn9P9e9YQa3mcozXA8h8h/3DJ0ZnedHp9LCCf9GRwG7va
X-Google-Smtp-Source: 
 AGHT+IEu0dt6qpt6W9qSkNlLYQ68T+/D93Gf2dnEZ2mPYWT0uQCbffw2RtHL1SdmIIuqusSF1cnhUQ==
X-Received: by 2002:a2e:9795:0:b0:2ef:2fcc:c9fb with SMTP id
 38308e7fff4ca-2f12ee47152mr21852671fa.36.1722104441734;
        Sat, 27 Jul 2024 11:20:41 -0700 (PDT)
Received: from localhost.localdomain (byw127.neoplus.adsl.tpnet.pl.
 [83.30.42.127])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03d077226sm7504891fa.126.2024.07.27.11.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 11:20:41 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Adam Skladowski <a39.skl@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 0/4] MSM8953/MSM8976 ASoC support
Date: Sat, 27 Jul 2024 20:20:23 +0200
Message-ID: <20240727182031.35069-1-a39.skl@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: a39.skl@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GDTJNGMXLY4XYBN3ONVGEH2FFLZHXTTO
X-Message-ID-Hash: GDTJNGMXLY4XYBN3ONVGEH2FFLZHXTTO
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:48:46 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GDTJNGMXLY4XYBN3ONVGEH2FFLZHXTTO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Introduce support for basic sound card setup on MSM8953/MSM8976
platforms, document new compatibles and introduce support for more dais.
Most of code is sourced from msm8953-mainline fork over github
with some changes implemented by me,some basic changes are 
mentioned in each patch.

[1] - https://lore.kernel.org/lkml/20240723083300.35605-1-krzysztof.kozlowski@linaro.org/T/

Changes since v1
================
1. Rebased dt-bindings documentation based on Krzysztof's split patch[1]
2. Resolved clang errors by guarding ret verification inside if
3. Switched quin-iomux to devm_ioremap_resource to not fail on msm8916

Adam Skladowski (1):
  ASoC: dt-bindings: apq8016-sbc: Add msm8953/msm8976-qdsp6-sndcard

Vladimir Lypak (3):
  ASoC: qcom: apq8016_sbc.c: Add Quinary support
  ASoC: msm8916-wcd-analog: add cajon and cajon v2 support
  ASoC: qcom: apq8016_sbc: Add support for msm8953/msm8976 SoC

 .../sound/qcom,apq8016-sbc-sndcard.yaml       | 51 +++++++++--
 sound/soc/codecs/msm8916-wcd-analog.c         | 63 +++++++++++++-
 sound/soc/qcom/apq8016_sbc.c                  | 84 ++++++++++++++++++-
 3 files changed, 186 insertions(+), 12 deletions(-)

-- 
2.45.2

