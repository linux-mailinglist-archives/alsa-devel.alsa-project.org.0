Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BD9776648
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 19:20:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89C8B826;
	Wed,  9 Aug 2023 19:19:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89C8B826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691601649;
	bh=WetW06+/EyseFrIcqnNCol2r45sebqx9UZ6mI7uaaQM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HlN4JyLcDUGvtEZKt0VataUdVKyPiyL0OjtqEF+BFCoSfEsKvYSl3KdxQfloczjSv
	 eW9GzYpN2de625kdax0hwOnkZwagdbrORK05BgaUR3apyO5Fqr2zcaw1LdoT5eoDm0
	 3DDJG+XNVQn6RVaKHqf2cMPNt3Ef59ivAnZl0idg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA9E4F801EB; Wed,  9 Aug 2023 19:19:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AD92F80116;
	Wed,  9 Aug 2023 19:19:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41345F80134; Wed,  9 Aug 2023 19:19:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	FROM_FMBLA_NEWDOM,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DAF13F800F4
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 19:19:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAF13F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20221208.gappssmtp.com
 header.i=@baylibre-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=a5YViMUv
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-317b31203c7so82572f8f.2
        for <alsa-devel@alsa-project.org>;
 Wed, 09 Aug 2023 10:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691601584;
 x=1692206384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3XaG/agcdHHHXeqbueYhHg4bGC+O2TjD70CPDhGyhxg=;
        b=a5YViMUv3Kw4CcuwIt8Jg8uYH/DYqnPG3zt92oERud3qs7c2+bC0vDWvCZf6ZhN1q5
         Ody4StkupWi7qwHwpBi+dpYzPRwdFbWp2nM1V/wyghaS2sXMQnK0nVrI0ehjx3ehx8YG
         z4L0tw72OmXAPRyw4p0BNVolWl3gxakiswA4ujUwZWwpStU3c2All8lflbx3sxqipBZJ
         5OiSedoYnvvYNVnJSIKhgKndI0Vpchf0UzFGRb0oLSRkMaUZr86fHwPnuvsm60Q8ViU1
         2NlJnBGdZI0mrS7/LGaa/SgMpg4iBXOSNub2PkLk900WmSXLWsEv7XkAboKWpoOBVHNg
         a1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691601584; x=1692206384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XaG/agcdHHHXeqbueYhHg4bGC+O2TjD70CPDhGyhxg=;
        b=ayqK+6rJBR/eWbnhQx/TcZWNmVo5J81VUy19OmaGThfTfts1IqPJ0hJarTNtZoYl33
         TJcYWO+T6iznqLlmSCGIj+KSO0j4J9weVPQ6Sp+egHz5oRyAid7RmWurNVfaguqjgFK7
         SdimUqS1vyE07aRZkWN1Tussnh1SjvgggR6XhdfYoVEc4e9Oau45M3BHwwVSvHis6oN2
         feK3Z9fQ1I7UdMzJ+Oxuq1+TcD68sA2nmyam+FwfY76Ux/MorP1iWtP2A0iHkzqzBY8Z
         spFbi1lS/oruBQVSOXfwvUHQeRP7YpQcKBdjDt+L8xJ/CNt2/28bNhgJPxDqdkr5Okjt
         HmFg==
X-Gm-Message-State: AOJu0Ywdnqh+qz5xbq6cNpe+KvZoo0u8lH5C7NU/ClgJdwdyJ/YmRCJi
	p+YaR0ralAfSvzG1o4K7NZncRw==
X-Google-Smtp-Source: 
 AGHT+IHKPGuXsPtyMe8JcF+q+kRG34gkrJFHOMtrzEff0nqGJEy7u7cLr+k+1gzH3mf8N1/atHsa1w==
X-Received: by 2002:a5d:6903:0:b0:315:9676:c360 with SMTP id
 t3-20020a5d6903000000b003159676c360mr14061wru.25.1691601583375;
        Wed, 09 Aug 2023 10:19:43 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:2a0f:2daa:ffb5:cc02])
        by smtp.googlemail.com with ESMTPSA id
 a18-20020adfeed2000000b00313f61889ecsm17335313wrp.66.2023.08.09.10.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 10:19:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: meson: axg-tdm-formatter: fix channel slot allocation
Date: Wed,  9 Aug 2023 19:19:31 +0200
Message-Id: <20230809171931.1244502-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DMIX7UYPCXNV3ZZ4W73DJJL4QVSIINND
X-Message-ID-Hash: DMIX7UYPCXNV3ZZ4W73DJJL4QVSIINND
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DMIX7UYPCXNV3ZZ4W73DJJL4QVSIINND/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When the tdm lane mask is computed, the driver currently fills the 1st lane
before moving on to the next. If the stream has less channels than the
lanes can accommodate, slots will be disabled on the last lanes.

Unfortunately, the HW distribute channels in a different way. It distribute
channels in pair on each lanes before moving on the next slots.

This difference leads to problems if a device has an interface with more
than 1 lane and with more than 2 slots per lane.

For example: a playback interface with 2 lanes and 4 slots each (total 8
slots - zero based numbering)
- Playing a 8ch stream:
  - All slots activated by the driver
  - channel #2 will be played on lane #1 - slot #0 following HW placement
- Playing a 4ch stream:
  - Lane #1 disabled by the driver
  - channel #2 will be played on lane #0 - slot #2

This behaviour is obviously not desirable.

Change the way slots are activated on the TDM lanes to follow what the HW
does and make sure each channel always get mapped to the same slot/lane.

Fixes: 1a11d88f499c ("ASoC: meson: add tdm formatter base driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-formatter.c | 42 ++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
index 9883dc777f63..63333a2b0a9c 100644
--- a/sound/soc/meson/axg-tdm-formatter.c
+++ b/sound/soc/meson/axg-tdm-formatter.c
@@ -30,27 +30,32 @@ int axg_tdm_formatter_set_channel_masks(struct regmap *map,
 					struct axg_tdm_stream *ts,
 					unsigned int offset)
 {
-	unsigned int val, ch = ts->channels;
-	unsigned long mask;
-	int i, j;
+	unsigned int ch = ts->channels;
+	u32 val[AXG_TDM_NUM_LANES];
+	int i, j, k;
+
+	/*
+	 * We need to mimick the slot distribution used by the HW to keep the
+	 * channel placement consistent regardless of the number of channel
+	 * in the stream. This is why the odd algorithm below is used.
+	 */
+	memset(val, 0, sizeof(*val) * AXG_TDM_NUM_LANES);
 
 	/*
 	 * Distribute the channels of the stream over the available slots
-	 * of each TDM lane
+	 * of each TDM lane. We need to go over the 32 slots ...
 	 */
-	for (i = 0; i < AXG_TDM_NUM_LANES; i++) {
-		val = 0;
-		mask = ts->mask[i];
-
-		for (j = find_first_bit(&mask, 32);
-		     (j < 32) && ch;
-		     j = find_next_bit(&mask, 32, j + 1)) {
-			val |= 1 << j;
-			ch -= 1;
+	for (i = 0; (i < 32) && ch; i += 2) {
+		/* ... of all the lanes ... */
+		for (j = 0; j < AXG_TDM_NUM_LANES; j++) {
+			/* ... then distribute the channels in pairs */
+			for (k = 0; k < 2; k++) {
+				if ((BIT(i + k) & ts->mask[j]) && ch) {
+					val[j] |= BIT(i + k);
+					ch -= 1;
+				}
+			}
 		}
-
-		regmap_write(map, offset, val);
-		offset += regmap_get_reg_stride(map);
 	}
 
 	/*
@@ -63,6 +68,11 @@ int axg_tdm_formatter_set_channel_masks(struct regmap *map,
 		return -EINVAL;
 	}
 
+	for (i = 0; i < AXG_TDM_NUM_LANES; i++) {
+		regmap_write(map, offset, val[i]);
+		offset += regmap_get_reg_stride(map);
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(axg_tdm_formatter_set_channel_masks);
-- 
2.40.1

