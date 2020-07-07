Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90455216A31
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:26:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C37515F2;
	Tue,  7 Jul 2020 12:25:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C37515F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594117572;
	bh=oIhMeaRyWHuQrrO9ZjTQyEP5zb4OPwgZdAZpU6Brrf8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pahc3jvsoLJD0DiVhEB2yjSUwHVJ3GH7aoWaeixLFC7ZNr93EkvIMJCzmVix4Lfrl
	 aKdFbGjcjMu3oJTzvyldOYYl/JDF88WZmt9EbcKaiSHdPW+3PEV1QIMQmJ3lBvITfJ
	 0FHdaWLOAYnOv6pZbZsSHV2Cehl+bh6d5cDFXpYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF919F80346;
	Tue,  7 Jul 2020 12:17:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 880EDF802E8; Tue,  7 Jul 2020 12:17:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 374A0F802E8
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:17:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 374A0F802E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SG9DVu7f"
Received: by mail-wr1-x441.google.com with SMTP id k6so44564034wrn.3
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MeJNmc8Tyj+Q0twt9zY+vng7Jbsk0DhIYimyC4Uuyj0=;
 b=SG9DVu7fXCmkADEx1FB+YT3/QUV77NTc0vAi8Aq/OU5JY/5r0nXXfnJqgkyWhfpyGx
 D/UhIe9t7HU7t8lZcbEWpiDr++OlOpU+kL/tqL3Eh1wNadJzD0au75fv1TBcsNZSNkKA
 nOjCXy180Pi8mtF0+NoAX54Kixg2UaD63ENJKA1+YP8Ld65pqMeva44ZXpor7DWQd1ju
 LqVE4zWDY7HKent37Y3VvP8l/uIBW/84nidbsrUq+OOIyYGQIAWbpqZUxcM+8jPgDwz+
 kb+JOM5fpsZC42M0+bwu5CJuC0R7MS7KlmUfHMsPCjS5HD8CfYN6wAditT74bUOm4bkf
 t3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MeJNmc8Tyj+Q0twt9zY+vng7Jbsk0DhIYimyC4Uuyj0=;
 b=gQc18i6spt6mWEgjtoHwHvVm2rC9i6KC4WI32SUqHFvyzWd87h/g8LUrGwmYwEjSx1
 oN3kBg7OXUx3cyNC7PxkrvfGqeilY+aUKVB5MVW1zf8v7on8IRuatTzDinSk9vE6Osdg
 QMIUGoBSdxkpsxNBp3SWKlXlAn5sDb6KWWPbDUZUNENwsIIYDCzyGONs09R9e+NXdzYm
 4QvGc8/u3VXRCHsJTgGaoR+PuN86v1Ru8SEMKTOKFFlZ4C4inamp5s9wHuKIR0W9Fm1e
 PixxF23CnAK68s0K0e7juEwi5ZkuFCrTuJzzGf/KEmi/KmZETSdfrgTaNUNLlviPLnxN
 0c8Q==
X-Gm-Message-State: AOAM5334md6L6OnAHW69Kc4zTQpz2tEml8NK6wx8PkSAdK+2FOQPLUz4
 CtPsHxSjQf48Lg/jVVuuR1wkdw==
X-Google-Smtp-Source: ABdhPJxy1qhKfpuwCxgH8O9/dsEgy203Bk85YKuQEh58briez0Nc3pkRWpshwrxQBdavC6rVpap1eg==
X-Received: by 2002:adf:ec42:: with SMTP id w2mr53690649wrn.269.1594117026710; 
 Tue, 07 Jul 2020 03:17:06 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:17:06 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 15/28] ASoC: samsung: spdif: Fix 3 misspelled struct properties
Date: Tue,  7 Jul 2020 11:16:29 +0100
Message-Id: <20200707101642.1747944-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Sangbeom Kim <sbkim73@samsung.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Seungwhan Youn <sw.youn@samsung.com>
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

When documenting structure properties, they must match the names exactly.

Fixes the following W=1 kernel build warning(s):

 sound/soc/samsung/spdif.c:89: warning: Function parameter or member 'saved_clkcon' not described in 'samsung_spdif_info'
 sound/soc/samsung/spdif.c:89: warning: Function parameter or member 'saved_con' not described in 'samsung_spdif_info'
 sound/soc/samsung/spdif.c:89: warning: Function parameter or member 'saved_cstas' not described in 'samsung_spdif_info'

Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Seungwhan Youn <sw.youn@samsung.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/samsung/spdif.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index 759fc66443298..4ae7ff623b826 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -70,9 +70,9 @@
  * @clk_rate: Current clock rate for calcurate ratio.
  * @pclk: The peri-clock pointer for spdif master operation.
  * @sclk: The source clock pointer for making sync signals.
- * @save_clkcon: Backup clkcon reg. in suspend.
- * @save_con: Backup con reg. in suspend.
- * @save_cstas: Backup cstas reg. in suspend.
+ * @saved_clkcon: Backup clkcon reg. in suspend.
+ * @saved_con: Backup con reg. in suspend.
+ * @saved_cstas: Backup cstas reg. in suspend.
  * @dma_playback: DMA information for playback channel.
  */
 struct samsung_spdif_info {
-- 
2.25.1

