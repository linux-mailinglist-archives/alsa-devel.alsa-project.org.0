Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D664164C92F
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 13:40:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 708662421;
	Wed, 14 Dec 2022 13:39:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 708662421
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671021621;
	bh=iIloGlatMDmAuaPNVuQmwCH9/jqZP4MlSm3Z9y2hlaQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IRrPIMIhbVuQ1IKKXHrjFDCRxGeNO5Orr6bAH4wPsCY1DxE+dWVY924QmPOXPIdQv
	 4wEAdfVWZNj+KPpYR0vbn88IQkj2sUICd6HOKsYorYRbc1w83kAmSEwPnd/qJFE/G1
	 PXYiDsgw1anHP4FPbtcZR70VXf0m1nZlY0OIpHtQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DF5FF8053A;
	Wed, 14 Dec 2022 13:38:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E7DCF80310; Wed, 14 Dec 2022 13:38:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59CF1F804D0
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 13:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59CF1F804D0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=o5UgHlc7
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl
 [85.222.111.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: lukma@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 28B5E85165;
 Wed, 14 Dec 2022 13:38:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1671021486;
 bh=6Jupxi3YTw8zb2A9Zvbmvr72UlqBukNaZRCAsj7GqjU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o5UgHlc7BdfCg9o2XR7gT44W6Ksgs3OtjVtv8ynu0m10B2QzPRU+PC/kEWRkvFPfP
 acl5roqWq/GsUSGan5B3XwKx/OYt2Pt7chpee0qctOneZIh2EKdT+8t3H0H3cIIbfj
 25DbmW865Sa3PAJ0S+ZrifUDk0UBtKfpQpMuY6+Dw277FYYfsYVpyqohBIR2f9CNsY
 MGUkEtxm5m/RVsyl4t9dyespT3Zmwpcur3weMXvUgq9H6DbcZs0hwVb/zKcYtK+WdD
 JEob0lISivpColvXh/iz+g3tB/r/AOcxp82bZgDE+fL9AJQsqO0bQe6xNT3fMlgCd1
 p0QRaC44qiFAA==
From: Lukasz Majewski <lukma@denx.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Stephen Kitt <steve@sk2.org>
Subject: [PATCH 3/4] ASoC: wm8940: Mute also the speaker output
Date: Wed, 14 Dec 2022 13:37:42 +0100
Message-Id: <20221214123743.3713843-4-lukma@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221214123743.3713843-1-lukma@denx.de>
References: <20221214123743.3713843-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lukasz Majewski <lukma@denx.de>
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
index 094e74905df9..13cb57210b4b 100644
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

