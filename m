Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8258C7D2F05
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 11:55:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DFA1828;
	Mon, 23 Oct 2023 11:54:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DFA1828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698054936;
	bh=SPSkhuEBjJCQ0GVSUOcvvmYfq9RWsMoO7k7DIaLyAGI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lnxsgG5lz2WOJvEOAIxuUa7hkgoEiT80aRRWQqKUbr2ZSww0GGAafKIV1aker+/gH
	 zuoHnrzQNU+z1nzqwUN/naNYE82NhtTXwrFbzoA2EYOekEPhP/KQhNpXYEtEuMr7KV
	 WfoX/4CT5H0SS0hSwwNVhUXgeLJNNLuZPtxP6dxA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06B33F80537; Mon, 23 Oct 2023 11:54:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8742F804F3;
	Mon, 23 Oct 2023 11:54:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91718F80536; Mon, 23 Oct 2023 11:54:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4749BF80134
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 11:54:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4749BF80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EvgxY+Wr
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32daeed7771so2082319f8f.3
        for <alsa-devel@alsa-project.org>;
 Mon, 23 Oct 2023 02:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054873; x=1698659673;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rTcKZO6NcS9zLgdR8p3dSmC3zXIR6VRO4KTY9FbrWgE=;
        b=EvgxY+WrryUHlLqnEVgdYMvkLQL5r/tn2ScmVfRJwrz58isiC5Z95uM62LIJsWOt+p
         5qR8uzIizH984tJsj6dLf4k+FomhrQpZqEjCHMEKpkseSXpp6DdpZkUbdfWCvBIphZMB
         NEuljISxd3YnDBbLl5P49EGlKSl2AU1IxVI+gnmJhfIscCrBIK3/kNJ8g4AMYipNMOch
         KB1Aob1ykJrBLtFTonCLFrwQZ8myaobwdetok5BD09B0j0/grYV3OjvilBYrZxTFPlxy
         BN5E41TC0/4s4lhhUcryBl9Z7bhFATCHyP19EaULAKCKwohVhx3wcwDBbQ/iMXe0/Qxs
         0Byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054873; x=1698659673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTcKZO6NcS9zLgdR8p3dSmC3zXIR6VRO4KTY9FbrWgE=;
        b=OJXQrWccgOFnuog8CcrpjdYiB6zm21DLX98mQBpNvxhTTy/RKIEqZhnzauWXsnpFeq
         5ZfRiU03qDwEgx153tdSwhQg0Qc1GZvidsBhdZhVcJw8vFONJMLQkn4XZh5hV9asU9qX
         NHVbYiHAxSHuHJhCjZjRnYq8lXNjuTmqBbPHslHJPL367Q6uJ7SUMZW1jwQzjPbA/hZe
         ALtInta72x+9y6snlUJbVSchOBzYdUqJEbeI4OwJpMo4tGCtfhKbwrQhVjAElYYb1fFn
         gfWaOXCzu3F5faapug8VrEHrpVQefnRmFjrsmigN3yvdsTL7vZkQfhk6HGfKJ5FmCNQ4
         zRYg==
X-Gm-Message-State: AOJu0YwuIsVaLzHRc+tudyUBv0KOPw4RTgqZLsWzLvC7iQrG4Lk9UxYI
	+A6hzjC14Zz897SCP3zJD0mwiQ==
X-Google-Smtp-Source: 
 AGHT+IH4YMgo74ZZgvJQJgKdwM3SfC8BbUD6h8XrLpB46b2XDtd+ZKDWDharijaoUjIIgua9r87kug==
X-Received: by 2002:a5d:4ccf:0:b0:32d:8cd1:52e4 with SMTP id
 c15-20020a5d4ccf000000b0032d8cd152e4mr6670616wrt.6.1698054873279;
        Mon, 23 Oct 2023 02:54:33 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 00/17] ASoC: fix widget name comparisons (consider DAI
 name prefix)
Date: Mon, 23 Oct 2023 11:54:11 +0200
Message-Id: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IBNTWI7KRMKPKIZHHDCPRVFCYW4P4JJP
X-Message-ID-Hash: IBNTWI7KRMKPKIZHHDCPRVFCYW4P4JJP
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IBNTWI7KRMKPKIZHHDCPRVFCYW4P4JJP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Some codec drivers compare widget names with strcmp, ignoring
the component name prefix.  If prefix is used, the comparisons start failing.

Except Qualcomm lpass-rx-macro, none of the patches were tested
on hardware.

Best regards,
Krzysztof

Krzysztof Kozlowski (17):
  ASoC: codecs: 88pm860x: Handle component name prefix
  ASoC: codecs: adau1373: Handle component name prefix
  ASoC: codecs: adav80x: Handle component name prefix
  ASoC: codecs: lpass-rx-macro: Handle component name prefix
  ASoC: codecs: max9867: Handle component name prefix
  ASoC: codecs: rt5682s: Handle component name prefix
  ASoC: codecs: rtq9128: Handle component name prefix
  ASoC: codecs: wcd9335: Handle component name prefix
  ASoC: codecs: wm8962: Handle component name prefix
  ASoC: codecs: wm8994: Handle component name prefix
  ASoC: codecs: wm8995: Handle component name prefix
  ASoC: mediatek: mt8183: Handle component name prefix
  ASoC: mediatek: mt8186: Handle component name prefix
  ASoC: mediatek: mt8188: Handle component name prefix
  ASoC: mediatek: mt8192: Handle component name prefix
  ASoC: samsung: speyside: Handle component name prefix
  ASoC: tegra: machine: Handle component name prefix

 sound/soc/codecs/88pm860x-codec.c              |  4 ++--
 sound/soc/codecs/adau1373.c                    |  2 +-
 sound/soc/codecs/adav80x.c                     |  2 +-
 sound/soc/codecs/lpass-rx-macro.c              |  6 +++---
 sound/soc/codecs/max9867.c                     |  8 ++++----
 sound/soc/codecs/rt5682s.c                     |  4 ++--
 sound/soc/codecs/rtq9128.c                     |  6 +++---
 sound/soc/codecs/wcd9335.c                     | 18 +++++++++---------
 sound/soc/codecs/wm8962.c                      |  4 ++--
 sound/soc/codecs/wm8994.c                      |  2 +-
 sound/soc/codecs/wm8995.c                      |  2 +-
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c     |  4 ++--
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c    |  2 +-
 sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c |  2 +-
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c     |  4 ++--
 sound/soc/mediatek/mt8186/mt8186-dai-src.c     |  4 ++--
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c    |  4 ++--
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c    |  4 ++--
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c     |  4 ++--
 sound/soc/samsung/speyside.c                   |  4 ++--
 sound/soc/tegra/tegra_asoc_machine.c           | 12 ++++++++----
 21 files changed, 53 insertions(+), 49 deletions(-)

-- 
2.34.1

