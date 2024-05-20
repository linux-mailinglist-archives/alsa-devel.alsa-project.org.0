Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 977F58C9EB1
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 16:22:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64FBC1F8;
	Mon, 20 May 2024 16:22:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64FBC1F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716214931;
	bh=qxTEu3ici03kyFNg7YUAaRSNbhz1E9XO7pvSyVueYdQ=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WqCZ2w6F2w7R9+V6U8aNCNsP8mdpjyHx/0TwcMC4I/Z9VrbsHO0Bxv0Vca8lvZZd0
	 h3ikSyvDegOvFWz4WDZTbRzir0URtK/BYEgHbLG2bqlRdtjczKQoRGMqtkWbVuK7Ty
	 /UJAlIg2JqQlGObWyQQMT9KQanGV6P3Y9kDxEPoo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDABBF804B2; Mon, 20 May 2024 16:21:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8845F8051D;
	Mon, 20 May 2024 16:21:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78AB6F804FF; Mon, 20 May 2024 16:20:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C987F800BA
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 16:20:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C987F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FC0/2uQq
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-420180b5898so20049245e9.2
        for <alsa-devel@alsa-project.org>;
 Mon, 20 May 2024 07:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716214808; x=1716819608;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9CW1lljdTQoniGbKlu71vNrE0DIfBG/7Rx4WjUbuCk=;
        b=FC0/2uQqevwFg0PwVRg4sG4/AIyDyGyyd9cAyZiCqTP+oYe5Gg2Me/s2Uh25Dl6Fg+
         DQZIK2ILYyJtFpp2RrJ/d4LtqDw5iRwUO+WxslyM1vqPm/pY/muCoL6aVg1CBpF7M9bx
         MmYnJwku9Q+Y3ytXw/MtgvqolDJ9Ndr3kGH4hYqqOSNqrNhGwsmdKy6P9pMcfw1sc7KU
         1Xt9mbgwGaqm3W32yMA7FCRh0nMSUViapMnpppf2CXIof+uz7m6CRwut7GjykmMx++g+
         PXpWgeAQdmV5Zq6B2pKBg1MGTTCS23qgKnAd4LRvnwIVCJq/bp1/VY9vVPqn8NHS8ZGw
         RmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716214808; x=1716819608;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9CW1lljdTQoniGbKlu71vNrE0DIfBG/7Rx4WjUbuCk=;
        b=RdtvglAgpqXzRYHmjnp3vaLI4zkJ5/0p8xzFJpfAlBm/wcDNxJ3LmbDXSkBrI4DNZI
         Hz4BUfRkX9f1quWWICvbugBku9f660SSYfBjRjQbjcmgGlAYVBe/0uvfe7KiyalYDn32
         PVzMuoLJwGGq7T16ucwRsoJyeBNq4RinvjXfKYVjK0ClkTei/8EGouqxVYyJ8yJg0p8P
         nUsSeh44rf4zUFJQSv0rE3G3RDBVM1UlAr6rkU6li+5TwVmDoQeyOlWZbaTvZ2LvaqBE
         wkaSyIrFFX5HgN5cb7Hq+maW0ze3m9MTy8TTLxbGQTOk/KgWZlVTHHIcvWYE5hjcmstr
         9qKg==
X-Gm-Message-State: AOJu0YxqSEWDsKDzncS8z5oi3sfwgRKbkiBw/sPmu443JyynsCs29pqM
	ERAdXQLkmqLZRYaLex0kxo51LczYJy0vzr6E/CneGoQT5KwEcmmYOE4neOhj/Ek=
X-Google-Smtp-Source: 
 AGHT+IFMFV4mhRBn+UqvYUrYuChKPXu49L17Sxp3FBhQHYS2zeOYK9ww7CxKfAzYZrtdnWG/4vNAQg==
X-Received: by 2002:a05:600c:3582:b0:418:29d4:1964 with SMTP id
 5b1f17b1804b1-41fea539b5amr228948405e9.0.1716214807754;
        Mon, 20 May 2024 07:20:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccee962esm421612625e9.31.2024.05.20.07.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 07:20:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 0/4] ASoC: qcom: x1e80100: Correct channel mapping
Date: Mon, 20 May 2024 16:19:55 +0200
Message-Id: 
 <20240520-asoc-x1e80100-4-channel-mapping-v4-0-f657159b4aad@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAtcS2YC/43NQQ6CMBCF4auYrh0zLZSCK+9hXJQyQBNsSWsaj
 OHuFlcaF7r8J5PvPVikYCmy4+7BAiUbrXc5yv2OmVG7gcB2uZlAUaJEBTp6AwunGjkilLB9OZr
 gqufZugFIyx5F21ClapaVOVBvl9fC+ZJ7tPHmw/01mPh2/d9OHBBaLgwvCLWU3WmyTgd/8GFgG
 57EO1j/BkUGjaG+0VWlpRJfYPEONr/BIoNVX6tSStGp9hNc1/UJN2XtNXEBAAA=
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2762;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qxTEu3ici03kyFNg7YUAaRSNbhz1E9XO7pvSyVueYdQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmS1wPkwfDv8/JKSXm0dNPMTxIXDRVFebiRd5tG
 Rfi7oFbYlyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZktcDwAKCRDBN2bmhouD
 17tuD/9YTQNIoaXe5gRU4/huML2k4qpGKAfAKpOtfIdcefcxlJaUreBhNbG3NgVx5vk9DyxcytT
 4lR8EJixZ+qOAz3oqgbZeb+hKf57nDzaYuHsHDp+RCpurlS4ee3d/RSrpgXwsQX8mqwEUkNi/7V
 fHYqzT1bIu7Qk4GxNOT4g7O7+uDTQD1uZjg86MqsCcIVlV4QlrR0iHYU9iEN8KQcluMYFQzFY3V
 QDxWUL0HFJVcnnMdcYoflXenzePdya1YT5NV8zKQRxyUM3amY9NowIgsDPR08tMPg26XJ8HfZ+y
 C5haLVcxWJ3cy+vCKfULweI2/Hrs66Ul8a9A0jwnxrJeR/d9o5qS2262kbS4M1G3MUUl97nPJYA
 57WLG6ExPdG6Sl2JF702lsHaRQ/b2PlK9dMddVVY36DRVEg70Su5nwJepl96oElFuOzKGlBh7xq
 0JG/ekmw51xfbs9xqQwTs7gDv3GlHd/vfgWnTkbwPiQGNruI1gC1SA0pSK1rZR6P/L6eYjYz0GX
 1idoZ2Sc71hQ3YtahfALkRBPhQ/whdQ70roa+R56b8KmX2xciuJMphIA8VFAfRh9l7ib43TzW8m
 E/XcViADtJ3VhU3iE6yh/D92Jk5RQ405hwgZEOrf59lLc3GMP35wH9R1lgqNu5OAKRlWk3jiVkv
 YtTPd/n76ZyOkow==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: FFSKKVTFJDWX7MIF4CZY36QNOEUJACIB
X-Message-ID-Hash: FFSKKVTFJDWX7MIF4CZY36QNOEUJACIB
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FFSKKVTFJDWX7MIF4CZY36QNOEUJACIB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

First patch is a build dependency.

Changes in v4:
- Rename audioreach_set_channel_mapping -> audioreach_set_default_channel_mapping
- Link to v3: https://lore.kernel.org/r/20240509-asoc-x1e80100-4-channel-mapping-v3-0-6f874552d7b2@linaro.org

Changes in v3:
- Add missing Charles' Ack
- Link to v2: https://lore.kernel.org/r/20240508-asoc-x1e80100-4-channel-mapping-v2-0-ccef9a66a572@linaro.org

Changes in v2:
- Re-work most of the idea according to Srini comments: set channel
  mapping for backend DAIs, not frontend.
- Patch #1: no changes
- Patch #2 is entirely replaced - now channel mapping is implemented in
  q6apm-lpass-dais.
- Patch #3: rework to new approach, but most of the code stays.
- Patch #4: rework significantly, because only backend DAIs is now
  affected.
- Link to v1: https://lore.kernel.org/r/20240507-asoc-x1e80100-4-channel-mapping-v1-0-b12c13e0a55d@linaro.org

Description
===========
X1E80100 CRD is the first board, which comes with four speakers, so we
still keep fixing and adding missing pieces.

The board has speaker arranged as left front+back and then right
front+back.  Using default channel mapping causes front right speaker to
play left back stream.

Adjust the channel maps for frontend DAIs to fix stereo and four-channel
playback.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      ASoC: Constify channel mapping array arguments in set_channel_map()
      ASoC: qcom: q6apm-lpass-dais: Implement proper channel mapping
      ASoC: qcom: qdsp6: Set channel mapping instead of fixed defaults
      ASoC: qcom: x1e80100: Correct channel mapping

 include/sound/cs35l41.h                 |  4 ++--
 include/sound/soc-dai.h                 |  8 ++++----
 sound/soc/codecs/adau7118.c             |  6 ++++--
 sound/soc/codecs/cs35l41-lib.c          |  4 ++--
 sound/soc/codecs/cs35l41.c              |  3 ++-
 sound/soc/codecs/max98504.c             |  6 ++++--
 sound/soc/codecs/wcd9335.c              |  6 ++++--
 sound/soc/codecs/wcd934x.c              |  6 ++++--
 sound/soc/qcom/qdsp6/audioreach.c       | 30 +++++++-----------------------
 sound/soc/qcom/qdsp6/audioreach.h       |  2 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c        | 16 ++++++++++------
 sound/soc/qcom/qdsp6/q6apm-dai.c        |  3 +++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 21 +++++++++++++--------
 sound/soc/qcom/x1e80100.c               | 18 ++++++++++++++++++
 sound/soc/soc-dai.c                     |  4 ++--
 15 files changed, 80 insertions(+), 57 deletions(-)
---
base-commit: 2b84edefcad14934796fad37b16512b6a2ca467e
change-id: 20240507-asoc-x1e80100-4-channel-mapping-ea5f02b9e678

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

