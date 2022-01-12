Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0358748CC7F
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 20:53:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D6311ED8;
	Wed, 12 Jan 2022 20:53:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D6311ED8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642017231;
	bh=TxuvZi6RfXHBb4/PyWqWdHPlRlcCKt+lsNuJ1bXWUH8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O4sYSpH6M8JQTlIGYSARJolTC6olwKPFzlH+h2+CZQQ+tyGIj8tahl7e2GszN2pZR
	 7HNp8ZwgslpR+zU9RxpRka3k3h5XPxmj9yR5ngPpHRygVyBnjecFiv+bXl5WtTCkaB
	 sVgfSuwNDuQMnsRBhdCmyTD6N8vwfJ+tybeEw+ys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4C26F8026D;
	Wed, 12 Jan 2022 20:52:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83ED4F8026A; Wed, 12 Jan 2022 20:52:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED186F80236
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 20:52:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED186F80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NCgDByj6"
Received: by mail-lf1-x135.google.com with SMTP id p27so260427lfa.1
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 11:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=He7BjM6dCMMuZ+d1PaptWEfTiiaWHjufRifL/qaqDNQ=;
 b=NCgDByj6hejwY7MuOGvvvTVFdE0SIutf2M2dNIqTnLWvTYZrGZcHThTDRYKIyu0+1a
 v9LpidK7TVBhU34aEpmdnnkJ0neebUciWxItaGoons6aj1nBdDkqm59faz57DZlHdAWi
 LPIyKtOTp3ok2nd2Jmr9r68FSIQcIybhJZBVkeoeiwoVX52xpNi8jiWudtU4Rn0v5Vy4
 8DFPJi+9FV/6Y9fmLfT/OaaS+p9/y3rZQ9nG8x/au6mEU9hDtKvNeSt4FVZD88FDnGGC
 lKUrV7JjzA4vV7c4xyOMrkgZtcCrKwwSFUyDXpWRqtpDfS1CU0A0cS5aJZY/mLd5/imR
 1kYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=He7BjM6dCMMuZ+d1PaptWEfTiiaWHjufRifL/qaqDNQ=;
 b=wvtkHXQ3NUjfkCqwtzEXdYLLI8KMXAkTPQw3PLv1XTHWtVBiFbKHWIfkwve84sbXUD
 DsfAFS4T/UGiWknWDKp9eeU7NEZTyJMnf2LjamhsFj7PdO38rZKe90/AtzbnCJTRjW+j
 L2gKVJVVaaHd1PpjfxlSxUpFL2UJZCjBcfFQKqsX3681BidaGf0g6lW3yI11g4zQ71xi
 Ww1EeW9w2SOZi1Fsp2lCS1iWZli3h7fjZ6TGGOdaEyxBe2aTdhsIL9D087A2x+V2FMax
 3Xm8zDv9zsGQ/ijkLx8/5668WCRf0mTZjA4Nudo3gcvR0HR18PEEno91cqBiH57ii7jz
 xg8Q==
X-Gm-Message-State: AOAM531lYEj/aCm73DfL2qd7AEVf8JPKVyVlw3TYMU5TKPx56DpNXLM6
 LoSwWWB4EiSTiwAoKqVy9Mr+HhLqvqg=
X-Google-Smtp-Source: ABdhPJzk+NRGmXVUet+lyHm2CN5FnEA2iJ4erteSkUXSDA2UFv+FYnd+7IGa8JwGGNOUHUesuS051w==
X-Received: by 2002:ac2:4c56:: with SMTP id o22mr945861lfk.558.1642017153504; 
 Wed, 12 Jan 2022 11:52:33 -0800 (PST)
Received: from localhost.localdomain (94-29-62-108.dynamic.spd-mgts.ru.
 [94.29.62.108])
 by smtp.gmail.com with ESMTPSA id k7sm75860lfu.141.2022.01.12.11.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 11:52:33 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1] ASoC: hdmi-codec: Fix OOB memory accesses
Date: Wed, 12 Jan 2022 22:50:39 +0300
Message-Id: <20220112195039.1329-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Correct size of iec_status array by changing it to the size of status
array of the struct snd_aes_iec958. This fixes out-of-bounds slab
read accesses made by memcpy() of the hdmi-codec driver. This problem
is reported by KASAN.

Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/uapi/sound/asound.h   | 4 +++-
 sound/soc/codecs/hdmi-codec.c | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index ef0cafe295b2..2d3e5df39a59 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -56,8 +56,10 @@
  *                                                                          *
  ****************************************************************************/
 
+#define AES_IEC958_STATUS_SIZE		24
+
 struct snd_aes_iec958 {
-	unsigned char status[24];	/* AES/IEC958 channel status bits */
+	unsigned char status[AES_IEC958_STATUS_SIZE]; /* AES/IEC958 channel status bits */
 	unsigned char subcode[147];	/* AES/IEC958 subcode bits */
 	unsigned char pad;		/* nothing */
 	unsigned char dig_subframe[4];	/* AES/IEC958 subframe bits */
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index b61f980cabdc..b07607a9ecea 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -277,7 +277,7 @@ struct hdmi_codec_priv {
 	bool busy;
 	struct snd_soc_jack *jack;
 	unsigned int jack_status;
-	u8 iec_status[5];
+	u8 iec_status[AES_IEC958_STATUS_SIZE];
 };
 
 static const struct snd_soc_dapm_widget hdmi_widgets[] = {
-- 
2.33.1

