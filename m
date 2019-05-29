Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CD52E560
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2019 21:33:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 436791607;
	Wed, 29 May 2019 21:32:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 436791607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559158391;
	bh=VdNWug4lHF2HbX9IgaEDsuI9jGafFcLclURiJpdMKuE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ctMZxwIY9KcQQkKtBpzGX6ZOSdvR5XFdHFrHhKo0JQ6D/sRotjpkh4FozEGdOngEW
	 3NXloMf+oeUQgXsNawE/vMo1yd/WvC0O32UFN6CwNPlLCLS9uyD6DYfgSId503sdk1
	 Pfi7fqbwvoXscCoYUQjZSuuYTAQ9MrEN8lMslSK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D876F896E4;
	Wed, 29 May 2019 21:31:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C575DF896E4; Wed, 29 May 2019 21:31:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE6EEF806E5
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 21:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE6EEF806E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="nmC3zfIc"
Received: by mail-io1-xd44.google.com with SMTP id e3so2867635ioc.12
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 12:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w2rWF7AWMptAlAlax6mIMr/NVnaDLMxR+lRNtTZJaf4=;
 b=nmC3zfIc1kmd9Y9ourVgQP49DgG/larcVcH0zCmf41iYunMji154rBkzZ3ynAfa4eV
 jj0AI8QxCXeeoL07idhzzosBcpzpF+DD6lGIhwyKoWKWy6lUzvEJj5FY131TI8Z7T5S8
 Hic7BYEqjmBB3FiLQu0o6cAlG6BmzsewDxBCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w2rWF7AWMptAlAlax6mIMr/NVnaDLMxR+lRNtTZJaf4=;
 b=GcVVopPh1n4E6Y0BXW+IkchsAD/6nplXXjBILv2h/g/ZlenLLTYSdW/ptfEfb5qv8D
 3hRJoarNv+Ie9YqDhe9yYMWfjHtR80kZHZ44OWafUeU2YSdELuiG3pY70nIjAP9NmvKM
 rlTRZk+vA6/WikktFTeD46rMrlpX8R5o7bnJKwDXNhvxjzkoNoCN9SFyMr1LlWwpcxMc
 IT6QCF0JPtnphHeNuvI6dOSsF8b6op2QdHEEtaiOI9kUyQg9+WqiWFnPmhnckixOnCuz
 PJA2//oOymom+BED8R7QBF/PBtP4bNFd7WbliZUdqgihkCuVgKCtHjGP64UDC0TyBmM+
 4J7A==
X-Gm-Message-State: APjAAAWP3VmI0FGtPGD2rT21hp654RpDH+TnFEeJNzOP+nJrlIZKJktw
 o7INBnTdw/e1/qfdHH4UqqzzwUrSwQ==
X-Google-Smtp-Source: APXvYqzzhD2dClnIXQM/Sdj2a4sE4EkIitKzUqTiU5XUrd5P18ewZe40QQ1y0wa2f6/Wf7EZLw0kkw==
X-Received: by 2002:a5e:c24b:: with SMTP id w11mr3747070iop.111.1559158278585; 
 Wed, 29 May 2019 12:31:18 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id 194sm92989itm.40.2019.05.29.12.31.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 12:31:17 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Wed, 29 May 2019 12:30:48 -0700
Message-Id: <20190529193048.14145-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH] ASoC: rt5677: Add missing voice activation
	register definitions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Most of the voice activation definitions were missing, they will be
needed for when hotwording is added. Also the source bits are only 2
wide not 3 and needed to be corrected.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677.h | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
index 11a2ffceec3b..076e5161d8da 100644
--- a/sound/soc/codecs/rt5677.h
+++ b/sound/soc/codecs/rt5677.h
@@ -1456,9 +1456,37 @@
 #define RT5677_I2S4_CLK_SEL_MASK		(0xf)
 #define RT5677_I2S4_CLK_SEL_SFT			0
 
+/* VAD Function Control 1 (0x9c) */
+#define RT5677_VAD_MIN_DUR_MASK			(0x3 << 13)
+#define RT5677_VAD_MIN_DUR_SFT			13
+#define RT5677_VAD_ADPCM_BYPASS			(1 << 10)
+#define RT5677_VAD_ADPCM_BYPASS_BIT		10
+#define RT5677_VAD_FG2ENC			(1 << 9)
+#define RT5677_VAD_FG2ENC_BIT			9
+#define RT5677_VAD_BUF_OW			(1 << 8)
+#define RT5677_VAD_BUF_OW_BIT			8
+#define RT5677_VAD_CLR_FLAG			(1 << 7)
+#define RT5677_VAD_CLR_FLAG_BIT			7
+#define RT5677_VAD_BUF_POP			(1 << 6)
+#define RT5677_VAD_BUF_POP_BIT			6
+#define RT5677_VAD_BUF_PUSH			(1 << 5)
+#define RT5677_VAD_BUF_PUSH_BIT			5
+#define RT5677_VAD_DET_ENABLE			(1 << 4)
+#define RT5677_VAD_DET_ENABLE_BIT		4
+#define RT5677_VAD_FUNC_ENABLE			(1 << 3)
+#define RT5677_VAD_FUNC_ENABLE_BIT		3
+#define RT5677_VAD_FUNC_RESET			(1 << 2)
+#define RT5677_VAD_FUNC_RESET_BIT		2
+
 /* VAD Function Control 4 (0x9f) */
-#define RT5677_VAD_SRC_MASK			(0x7 << 8)
+#define RT5677_VAD_OUT_SRC_RATE_MASK		(0x1 << 11)
+#define RT5677_VAD_OUT_SRC_RATE_SFT		11
+#define RT5677_VAD_OUT_SRC_MASK			(0x1 << 10)
+#define RT5677_VAD_OUT_SRC_SFT			10
+#define RT5677_VAD_SRC_MASK			(0x3 << 8)
 #define RT5677_VAD_SRC_SFT			8
+#define RT5677_VAD_LV_DIFF_MASK			(0xff << 0)
+#define RT5677_VAD_LV_DIFF_SFT			0
 
 /* DSP InBound Control (0xa3) */
 #define RT5677_IB01_SRC_MASK			(0x7 << 12)
-- 
2.22.0.rc1.257.g3120a18244-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
