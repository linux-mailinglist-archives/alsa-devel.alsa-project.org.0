Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D875542FD
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 08:50:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 047C21F85;
	Wed, 22 Jun 2022 08:49:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 047C21F85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655880607;
	bh=OLDDQMcvApw3hT2LPAmgUVlZE9nf1uUKfS4zYn/T9Lk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tuyz3gZmvM35Gw/u58HDzerlcXfaP4hjmGwbXGCOtx+nzEBbAZGzog1GpjgG9K3sN
	 +Rou8AOmEQ3YcllYI8Bi0JWqJyeOUEauQqbU7JAO+9kQ3Kg9KS6ZzEFgC/dcPX8YWG
	 b46ZjE2sAfMarTcHsTT4OS9WiM/bmNsEEBEYcVis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7545F80537;
	Wed, 22 Jun 2022 08:48:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC52DF80535; Wed, 22 Jun 2022 08:48:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C721DF800CB
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 08:48:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C721DF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VkjSZU+Z"
Received: by mail-ej1-x634.google.com with SMTP id sb34so3041516ejc.11
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 23:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u1eiPXpTeoJ4YK94xfC/4guXF7vZMwFhVUYu4kxiL+k=;
 b=VkjSZU+ZIalRBcg/aY9otvwjSGkG2louwosC9Z+WhTggAKAhLVvFnMb0KoB2qHcTjY
 B8flVc+KaVrqbbt153meF3pQFHuk6BnzUnvMPdFDzVnO97+3OcLPM5ird6+oXmE2SF4B
 MfIDi1MJj6n5DUGRPMiQGJGyU7QW15JmEI5jhld3HM/sRkORe/9MHUok7oxoePxGP5Y2
 KkihqCGzT/yc2rhIQaaCT5IxizmniMdASV7EZSOXM6VeY+nhkrK5X+A7L13kmX+O/jVx
 caAxD8GeETvoeM26zApSyBXcrMAAyWDzn8vvnJYJwyM999MPX5m4/CP5p0BNsi6lP5Fl
 okDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u1eiPXpTeoJ4YK94xfC/4guXF7vZMwFhVUYu4kxiL+k=;
 b=CwogODx5bykvzgOpmBmn1EW90AxyqPK31ZFfTS30BDC/UXiT1GrPoRBLnOQJH1NSu8
 AP8koL1yMChk8dG7rM1zLBP5AOL+4O0li5iVJSSgQpNk9H8VIcmTkDbVgbaoPX+aXUr5
 V4au8b6hwecwIjYQzb1NqBIxzonOlnzAjfMD9cZ3W0kax01yX/5gBn2TkzxgqC6YLZEj
 vIgYwk6RV7uB5t0sHIj+Iz8vPwo9fRov81BZbPM7+oeSAUJVZ79RKFxa50IbPMFwyHLt
 xG1NgJTcITsVFKhEABD6Zfqm4QW2c+mPaMrkDQNLCjlyxMGLEcuo84arQ7UqNneeHD83
 PkIg==
X-Gm-Message-State: AJIora87vB87b/9v/Vlc3f5dZZgjtVZeid+PVR237awdE73mtO5h0Qp0
 IY4KDMdQoV6Kgq7EIpwpJGs=
X-Google-Smtp-Source: AGRyM1vA2jfPhbVXwp0p2yLq5X8upNLnqULE7yWgNJaNCX+6/OXo9Ji5EpptSNXb6UAFCZV2uzeHzg==
X-Received: by 2002:a17:907:1c1a:b0:705:3158:ab07 with SMTP id
 nc26-20020a1709071c1a00b007053158ab07mr1660279ejc.767.1655880515522; 
 Tue, 21 Jun 2022 23:48:35 -0700 (PDT)
Received: from localhost.localdomain ([185.107.95.225])
 by smtp.gmail.com with ESMTPSA id
 sd12-20020a1709076e0c00b00722e8c47cc9sm1197148ejc.181.2022.06.21.23.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 23:48:33 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/3] ASoC: dt-bindings: Add bindings for WCD9335 DAIs
Date: Wed, 22 Jun 2022 10:47:56 +0400
Message-Id: <20220622064758.40543-2-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622064758.40543-1-y.oudjana@protonmail.com>
References: <20220622064758.40543-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Yassine Oudjana <y.oudjana@protonmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <yassine.oudjana@gmail.com>,
 phone-devel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add bindings for the DAIs available in WCD9335 to avoid
having to use unclear number indices in device trees.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 MAINTAINERS                              |  1 +
 include/dt-bindings/sound/qcom,wcd9335.h | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 include/dt-bindings/sound/qcom,wcd9335.h

diff --git a/MAINTAINERS b/MAINTAINERS
index b774f21828f7..2bcc3cc129c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16366,6 +16366,7 @@ M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 M:	Banajit Goswami <bgoswami@quicinc.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
+F:	include/dt-bindings/sound/qcom,wcd9335.h
 F:	sound/soc/codecs/lpass-va-macro.c
 F:	sound/soc/codecs/lpass-wsa-macro.*
 F:	sound/soc/codecs/msm8916-wcd-analog.c
diff --git a/include/dt-bindings/sound/qcom,wcd9335.h b/include/dt-bindings/sound/qcom,wcd9335.h
new file mode 100644
index 000000000000..709d33ca748d
--- /dev/null
+++ b/include/dt-bindings/sound/qcom,wcd9335.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_QCOM_WCD9335_H
+#define __DT_QCOM_WCD9335_H
+
+#define AIF1_PB                 0
+#define AIF1_CAP                1
+#define AIF2_PB                 2
+#define AIF2_CAP                3
+#define AIF3_PB                 4
+#define AIF3_CAP                5
+#define AIF4_PB                 6
+#define NUM_CODEC_DAIS          7
+
+#endif
-- 
2.36.1

