Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C69C8BF848
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 10:17:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28509DEC;
	Wed,  8 May 2024 10:17:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28509DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715156244;
	bh=0AhxjfBUNhlENSAxe92nY9VoC8qprxHxldB8aoP2AC0=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=COEAMivb0AJ4MPQapjKU/fJYL4+BgNlEl3kf90vGQV13HeQNd1pCv0YFYUpCiMhXa
	 SyK2x4rzi9K823fNJrr/hDjhoPrld0WL3I5UUsDxOKi35ktBPoYx995yVhIpftntnD
	 tz35f2oDyCRxXUplE9st7iUPljuJYf+o7uWzXjng=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41443F805AB; Wed,  8 May 2024 10:16:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2B8AF805A0;
	Wed,  8 May 2024 10:16:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94A32F80563; Wed,  8 May 2024 10:16:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3D0FF8024C
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 10:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3D0FF8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Y5RU2U9n
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a59a934ad50so938073266b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 08 May 2024 01:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715156198; x=1715760998;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+LyURlQNWFkOdQ16KIflmxTG/F13lDDlyX2+IEOje/E=;
        b=Y5RU2U9ng1jbBB7nLsmMVqLhfG8cb0Dr3nEXKoeXBknPW4Ts9CES3xJ8xUBF6/MCLi
         IBFsSus1NE8jCwDND/TbQLiUPudyAoCGbd3wprvKQJRMERN0nNZnANOYfAs4DSRqb+8f
         w8ZaVECZNFeqPMfipcZ6hOBDtPgX6CmgL4vu1MVIkWfHGlG3aUU4G8HrmIkmHs7GpK4I
         kWMmSm7pSo0rn0DAbG1GRyc8ozS/lpHLBlf5kVxDF16lT/+hybyMY5p2j5u7vSLozoS1
         CGBbfSYGU22stMgy2Vy0GrubciidFsXpNOPi+YCCp3rXTrxhJhTmGVvQHdn0MtAPakIm
         1r+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715156198; x=1715760998;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LyURlQNWFkOdQ16KIflmxTG/F13lDDlyX2+IEOje/E=;
        b=B2thcnvAk0fZ+tFlKV3AMB/+4fddygT218u/aheUJKKCcytn4ZrwTOA7V3L1AYWK7B
         jHlC7BqqUZYtLjOBxMXLsLG2cAjDBlcYn16WJ/Y//gGzqws1Bx0UBpETquWkavV7APV6
         EH1ilD/hv/wRIyNlWb70+L9iykS1DvrA2b9txzTyLDUysL6ecBcU9NQb2mtkyhubEJBl
         wb2Q8ibwKHuf11q6/CDj4bZn05P4aa3ieBClR8oVccFW8bAdWTx8vn3lS4DviKAPNdsw
         8H5glzADRrarJ03eLWMqp9Wo1ObxM/EIloHs5/jJBcdvnQWnnEZdLywTAgNkEVC4lwaw
         e9dw==
X-Gm-Message-State: AOJu0YyU9PrtvptZRS3gVpw3uw9dkiXGxgaZz5Z1I0hZtkyOmOMGf8US
	aTrcRHWB5vJz5aviz45nPnEaeVnRD+rDMhReV8SyDeg0Q1dzJhnDQUd2Sx8y15s=
X-Google-Smtp-Source: 
 AGHT+IHs+JurhXwWmPQdrBI2wdkuaapr5rWhfWE2s5lYO2xvo5avmMjueKZhOqtVq5beJTeZWebaNA==
X-Received: by 2002:a17:906:5947:b0:a59:c577:c5c4 with SMTP id
 a640c23a62f3a-a59fb94d7ebmr101421966b.24.1715156198300;
        Wed, 08 May 2024 01:16:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 va28-20020a17090711dc00b00a59b87dd0d7sm4564734ejb.147.2024.05.08.01.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 01:16:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/4] ASoC: qcom: x1e80100: Correct channel mapping
Date: Wed, 08 May 2024 10:16:26 +0200
Message-Id: 
 <20240508-asoc-x1e80100-4-channel-mapping-v2-0-ccef9a66a572@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANo0O2YC/42NQQ6CMBBFr0Jm7ZhppYKsvIdhUWCASbAlrSEYw
 t0tnMDl+/l5b4PIQThClW0QeJEo3iXQlwza0bqBUbrEoEnnZKhAG32Lq+KSFBHmeLwcT/i28yx
 uQLamJ908+F6UkCxz4F7Ws/CqE48SPz58z+CijvV/96KQsFG6VTcma0z3nMTZ4K8+DFDv+/4D5
 XThsc8AAAA=
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2392;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=0AhxjfBUNhlENSAxe92nY9VoC8qprxHxldB8aoP2AC0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmOzTdgaDk/OCXSJX1MATpDLnCVpCQKb0X2aD+a
 1MbGr1FewKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjs03QAKCRDBN2bmhouD
 12BcD/9RJ4TY6c9upA/1dg4aTcTlGdWos5X1GufItF1YJZcQV62JVJp1MXIHBeAGRDIJFuGA9S/
 WCg63QChWfpXDr+reNSBkhGPxPqMPlWMwPWg2+daUTy55OX/Q0VA7KB5OWHtRE4JLwE/gSUrG9C
 vdjU3Hig4gQrzAuWt+xSLd/wfP9uw3OzSAYQUSI+hJlEQ2aXPmfNMgLAdN05uTrbAzC20GX/xsY
 pFd6aT84sPzMmFYFuT4naZ3P1GAWdbWPbwrFcQRec8AVG2uj6y+coNrv+QMWYXrLG53qLJRDWO4
 8wyLjF+o3VCtyEeLnVvXRCvPqR54b4nqVH+fjAC0dhEDIzYHmr1BwxVwpWpkpQkPDpsT765DPpf
 nzGBkngvP4YazG7Ae6TCwnhybOQ73tuLQAfQpaEPsSNXZq1NvCr9qXbqPjJ1S6PdyudxhtWO+tF
 BCcCYHpteY0xGi+2jCKK27iHNX8pxgzmnXvCyv2aLFm+1EBCcnGIl3YPTCdxjq4dO+5kxqKFftA
 ZLik7IhrYonACWKbJzW+J29L2Gg0RisWmpSAPJVaJZxWIbQwVFovgBWFfzC3jGcOOD7S0GhTN4u
 79MeIDiLcASW9r1BowHw2Ku7RBuQZ49Tnb2FAdXN1kKm7eifCnGPVKhfKJ5uqNRf4+LiC270mxg
 1wJnKsvIF2J3/MQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: R3AZQXVMGIBAUDLJZPRQ7J2LUQ4RMRBB
X-Message-ID-Hash: R3AZQXVMGIBAUDLJZPRQ7J2LUQ4RMRBB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R3AZQXVMGIBAUDLJZPRQ7J2LUQ4RMRBB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

First patch is a build dependency.

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
 sound/soc/qcom/qdsp6/q6apm-dai.c        |  2 ++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 21 +++++++++++++--------
 sound/soc/qcom/x1e80100.c               | 18 ++++++++++++++++++
 sound/soc/soc-dai.c                     |  4 ++--
 15 files changed, 79 insertions(+), 57 deletions(-)
---
base-commit: 2b84edefcad14934796fad37b16512b6a2ca467e
change-id: 20240507-asoc-x1e80100-4-channel-mapping-ea5f02b9e678

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

