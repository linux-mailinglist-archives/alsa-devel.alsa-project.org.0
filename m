Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5D366B89F
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 09:02:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29EBE3840;
	Mon, 16 Jan 2023 09:01:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29EBE3840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673856127;
	bh=6QfY+TRL8+x6j8Q/0nDuPn1QIRXWj0C/0LDus2RFHrc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Ed365mSR35K+zswy5Hthb+4ooa+RQCrHhJWhiOJ31PRjzxeukMthSUN3gpLzybLjB
	 Gj99ZH7SgSQKE85fzcnp7GtMVltiYi2982Urm1c/Lmt6YeKRjsz0uk06517VKQKrAu
	 cjoxUWUtG6Pg/Knzw5zQxIJNSlFACGNnl9XJjFzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77D16F8023A;
	Mon, 16 Jan 2023 09:01:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85E30F804F2; Sun, 15 Jan 2023 20:34:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05751F8026D
 for <alsa-devel@alsa-project.org>; Sun, 15 Jan 2023 20:33:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05751F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=shruggie-ro.20210112.gappssmtp.com
 header.i=@shruggie-ro.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=YOHlQPzB
Received: by mail-wm1-x32f.google.com with SMTP id
 j34-20020a05600c1c2200b003da1b054057so6537403wms.5
 for <alsa-devel@alsa-project.org>; Sun, 15 Jan 2023 11:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k+1aZzqQMLu9+0+ZmtqgeBm9XAT+pSqBj50qUTSIHJI=;
 b=YOHlQPzBfHeXMJDqCr54h4vZWRuBm1MV3qewiUlB2bB10Mr3OGeAKaWSFvbp8mvyzh
 e1o1KGYsA1t32mv/94RLN68Z7ZK9xRCTTx8QboNNsm3vXaFr7zIh9Y66b3sAdM93NdZZ
 TU01Pg7OVMvmoBwJ4Lozz1kYLAH0cc/8+TnwNMVuSYY8flJHaxW4yMN4TPiPlVwBxHrx
 DU/fUEUdXWlNbw+IVvBChwIX2J9ceYyIP6AXdFFYJTkseG9+PmMQIoptNxT49TKw1Pq4
 Mh+ly5z4TRmO/nevkKkDItCZ65aaEiT1OIID/h6x6I53NzTqoWwGjTEcfxj/DM8e4Dff
 nMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k+1aZzqQMLu9+0+ZmtqgeBm9XAT+pSqBj50qUTSIHJI=;
 b=kQBoPACO+zC/H6zN1zeRunIMruCxURqNgswVm+l2b0fzl6MhLG03AEbpOBYPthqp6g
 YRpUhN0XlmtCRxk24KmM87I8J+e2tAorbEd6mloSUi4lBw50r+KW1LCsLZzwlaPgyGzT
 7/brfSMpaYtKWTRGgUa6ycbNjaZfUyGu9VCJWs6nOiN3kgrHDH4YaCieumnuH27wuOhx
 rl7K9I0KHCRkgpimmOYUS6NaaZKQjnVimemXhIFO31XDXxUFM2vH7FxlBCipz5Zbuvuj
 YOcqoL+IVPkFjsS8pJ1+kXd+UjuPTMkLhZ7mDpmkOseK1ndqxZbykf5gQDxKDlVXqqED
 bG0g==
X-Gm-Message-State: AFqh2ko5pX5nHLr7WGMWMSHLq1wp/C000oWxVdoxj1h7u6CaLXLXgKdH
 p+UapqKSOtr7ONk+OdRzykDEk4ZSjTRevy9WBJE5IIAS
X-Google-Smtp-Source: AMrXdXsa0k53UzTcCZCxyTZHFw3RVc1uWDhWiM4YW9NZqzzIGrtnc35WQdZ0fv2u6dTzsfmG+7UT0g==
X-Received: by 2002:a1c:790c:0:b0:3da:22a6:7b6b with SMTP id
 l12-20020a1c790c000000b003da22a67b6bmr8083004wme.13.1673811233836; 
 Sun, 15 Jan 2023 11:33:53 -0800 (PST)
Received: from neptune.hotspot.internet-for-guests.com
 (ip-078-094-237-238.um19.pools.vodafone-ip.de. [78.94.237.238])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a7bcd0f000000b003d9a71ee54dsm30559281wmj.36.2023.01.15.11.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 11:33:53 -0800 (PST)
From: Alexandru Ardelean <alex@shruggie.ro>
To: devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ASoC: codecs: tas5720: split a
 tas5720_mute_soc_component() function
Date: Sun, 15 Jan 2023 21:33:44 +0200
Message-Id: <20230115193347.24190-1-alex@shruggie.ro>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 16 Jan 2023 09:01:06 +0100
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
Cc: steffen.aschbacher@stihl.de, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Alexandru Ardelean <alex@shruggie.ro>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is to be re-used in tas5720_mute() (which is part of the dai_ops) and
also in the tas5720_fault_check_work() hook.

The benefit here isn't too great (now).
It's only when we add support for a new device with a slightly different
regmap that this becomes more useful.

Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
---
 sound/soc/codecs/tas5720.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tas5720.c b/sound/soc/codecs/tas5720.c
index 3885c0bf0b01..0587c9bb3c4e 100644
--- a/sound/soc/codecs/tas5720.c
+++ b/sound/soc/codecs/tas5720.c
@@ -199,9 +199,8 @@ static int tas5720_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	return ret;
 }
 
-static int tas5720_mute(struct snd_soc_dai *dai, int mute, int direction)
+static int tas5720_mute_soc_component(struct snd_soc_component *component, int mute)
 {
-	struct snd_soc_component *component = dai->component;
 	int ret;
 
 	ret = snd_soc_component_update_bits(component, TAS5720_DIGITAL_CTRL2_REG,
@@ -214,6 +213,11 @@ static int tas5720_mute(struct snd_soc_dai *dai, int mute, int direction)
 	return 0;
 }
 
+static int tas5720_mute(struct snd_soc_dai *dai, int mute, int direction)
+{
+	return tas5720_mute_soc_component(dai->component, mute);
+}
+
 static void tas5720_fault_check_work(struct work_struct *work)
 {
 	struct tas5720_data *tas5720 = container_of(work, struct tas5720_data,
@@ -318,8 +322,7 @@ static int tas5720_codec_probe(struct snd_soc_component *component)
 			 expected_device_id, device_id);
 
 	/* Set device to mute */
-	ret = snd_soc_component_update_bits(component, TAS5720_DIGITAL_CTRL2_REG,
-				  TAS5720_MUTE, TAS5720_MUTE);
+	ret = tas5720_mute_soc_component(component, 1);
 	if (ret < 0)
 		goto error_snd_soc_component_update_bits;
 
-- 
2.34.1

