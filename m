Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF87A53E58B
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 17:46:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E31F11945;
	Mon,  6 Jun 2022 17:46:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E31F11945
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654530418;
	bh=sKiycYafCwzwC+ZAsMjg8r2MgfWUm6i27frJzx9wJjM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=McTIAPb0TPgwTFlg3xSuCIUZ4UglHh6XGQY0ScNAh1jOoI4e7xegyVCZgL+WuskK9
	 5DeAWzfFGFVaankmcdhKxL01lCJuO3rgBzeeVVrvGxBP70hyFG4IaB3PmdWibk/swY
	 sd1INeV/BQdGc3fYLieE1GO6gFKs79A6pHm4zZOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED908F80527;
	Mon,  6 Jun 2022 17:45:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 430C9F80526; Mon,  6 Jun 2022 17:45:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21AF7F80109
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 17:45:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21AF7F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="jpndVbWR"
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl
 [85.222.111.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: lukma@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4789D83E63;
 Mon,  6 Jun 2022 17:45:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1654530307;
 bh=KHCCpJWpvoD0Y/WD41sZEKMPbIOi11fqmo/ZGOG53OU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jpndVbWRhRsEaeapXjcuWY7rbEo8LJdxnGbFRFrBB8x3+IO0K2f/V8Y8kq3HtXO0K
 O8BCQSFbOcUrAChV0FKNoQKCHRhwYBVokwpT2Z0i2pgy305iIDb6szG2XkpO9EzR6B
 dI9MzJp3HQ0BDTVi1IZUdDbcm9qQOnVUAr5yJ++GcwBz9LU9/OMpJPxUgBoO5HpdQ/
 fXnC6gj683X3Qd8VHonzVmqqgExOVUukvxv29H48fdhdyFgweYNjIVe5y6iHrofVQZ
 ser+7OOq2kJh8l6xEWe1P1Hc/m5GWY05yzA9rUdUAqyysCfbsAXV4Sdv5Zz444EYeo
 wrer/YmJNihig==
From: Lukasz Majewski <lukma@denx.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/3] ASoC: wm8940: Mute also the speaker output
Date: Mon,  6 Jun 2022 17:44:41 +0200
Message-Id: <20220606154441.20848-3-lukma@denx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220606154441.20848-1-lukma@denx.de>
References: <20220606154441.20848-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Lukasz Majewski <lukma@denx.de>
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

Without this change the BTL speaker produces some
"distortion" noise when test program
(speaker-test -t waw) is ended with ctrl+c.

As our design uses speaker outputs to drive BTL speaker,
it was necessary to also mute the speaker via the codec
internal WM8940_SPKVOL register with setting
WM8940_SPKMUTE bit.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 sound/soc/codecs/wm8940.c | 11 ++++++++++-
 sound/soc/codecs/wm8940.h |  3 +++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8940.c b/sound/soc/codecs/wm8940.c
index 6fb1c3780439..a8596f4089dd 100644
--- a/sound/soc/codecs/wm8940.c
+++ b/sound/soc/codecs/wm8940.c
@@ -465,9 +465,18 @@ static int wm8940_mute(struct snd_soc_dai *dai, int mute, int direction)
 {
 	struct snd_soc_component *component = dai->component;
 	u16 mute_reg = snd_soc_component_read(component, WM8940_DAC) & 0xffbf;
+	u16 spkvol_reg = snd_soc_component_read(component, WM8940_SPKVOL);
+	int ret;
 
-	if (mute)
+	spkvol_reg &= ~WM8940_SPKMUTE;
+	if (mute) {
 		mute_reg |= 0x40;
+		spkvol_reg |= WM8940_SPKMUTE;
+	}
+
+	ret = snd_soc_component_write(component, WM8940_SPKVOL, spkvol_reg);
+	if (ret)
+		return ret;
 
 	return snd_soc_component_write(component, WM8940_DAC, mute_reg);
 }
diff --git a/sound/soc/codecs/wm8940.h b/sound/soc/codecs/wm8940.h
index 0d4f53ada2e6..eb051ed29bb8 100644
--- a/sound/soc/codecs/wm8940.h
+++ b/sound/soc/codecs/wm8940.h
@@ -95,5 +95,8 @@ struct wm8940_setup_data {
 #define WM8940_OPCLKDIV_3 2
 #define WM8940_OPCLKDIV_4 3
 
+/* Bit definitions */
+#define WM8940_SPKMUTE BIT(6)
+
 #endif /* _WM8940_H */
 
-- 
2.20.1

