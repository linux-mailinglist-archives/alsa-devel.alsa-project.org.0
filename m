Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3CA67F64F
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Jan 2023 09:29:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C733C86F;
	Sat, 28 Jan 2023 09:28:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C733C86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674894559;
	bh=3lOmfp1wu4AxyOyDlBZA74hkP+DAkRXcoMWJ4UhUdsg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=t8kb5AjC0jX/MoPgsRyS7C94UZKKjXp9LasISTScpeJknCtf0Qhpal+xIGfvA1GEM
	 CxvnWeee/hScwbRg95agw3OEIdkA2tOdw3h4vXKZf4dhWWsFwWWxNvDEFXPqS7647b
	 Dj3dz3fwWzFTY778IoLOcKh1XcOs8mFFMOLbI6JI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8009CF8027D;
	Sat, 28 Jan 2023 09:28:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 554AFF803DC; Sat, 28 Jan 2023 09:28:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C14E3F8007C
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 09:28:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C14E3F8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=shruggie-ro.20210112.gappssmtp.com
 header.i=@shruggie-ro.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=treD55nf
Received: by mail-wr1-x42c.google.com with SMTP id d14so6896351wrr.9
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 00:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y9aJH9dWW+lXIo+m5JL54uJsS21RU2JZM9Wrw00k7No=;
 b=treD55nfTAfWZWSzKShy9mwzsnfnSBTUoVysbGKxOPj5WmP+dMtEdOv0erz5Ru8obZ
 ve8E3jwlRM2jPNxYcuWYfnEU/ZeLc4PQqiH4MPEC+9kh6L1Tiapbt4dY8ZvoUucXDCON
 yF25vNXgq+3/VLPTHAeITAKK8i6LuZlQiQiz3Q+uXdd4AJh9RRhzvX5hTghFcADRkBjn
 qE3BxHUPakz08NccmMgRaNr2UV1sxqti3MjXD8aFJXkTr/O1mvfADdFFdeEwo300Ero5
 de2mt++mgL40B7Pgw4qZKq8FDCN3JXzYITD509DLvTWPsqMShSg3Ayr30Hi+zDHh+Wgh
 7W3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y9aJH9dWW+lXIo+m5JL54uJsS21RU2JZM9Wrw00k7No=;
 b=RRt+/lXx5/zOxgfw6a9SmDd4ow085VbNxDYhk7MM7jC0TSrpMOD5sM6Vo2TC1Oxksy
 Jainb8S74Hneure+wExuTVwj7Wmo9MAsLrppiZvbFNIT8SvzmThHqWec+sFQleQ9FK7Q
 yjRAfrDbDI32vfWpPXQvci8SEEagF4vj3QDN+l0pNvc0gjdjdsSk3SNXLw4NmFCl6Ais
 BAejLG08l5Mxa1C2Wja/2y6Pon3iDsQqTE7wzTdM1VwytghuPjQ5u76b7yq4MDc+wqq6
 uy9RjqnfVcO57llEp546h7CSgAVxl/D1CciUOX4up3aWFaMDmrGzP/NNYskavmdBxiHq
 hSRQ==
X-Gm-Message-State: AFqh2koizKoJYnHAn3BKbJV611RhQKUc9DqBgjQ9kAhOi6/HBEHRHPQL
 uT3gIepgA4T9p7F8SzZGaqm4IQ==
X-Google-Smtp-Source: AMrXdXt9KSRH7+r9cYAHQYj+3AoNx2UKmGCATXuRWMG6WddSwu/BzX2/w+k5ao9JwROWKW6FCOnHYw==
X-Received: by 2002:a5d:61c5:0:b0:2bf:9608:57ee with SMTP id
 q5-20020a5d61c5000000b002bf960857eemr27136437wrv.21.1674894482631; 
 Sat, 28 Jan 2023 00:28:02 -0800 (PST)
Received: from neptune.. ([188.27.130.91]) by smtp.gmail.com with ESMTPSA id
 c17-20020a5d4cd1000000b002bfd52f31f6sm3815338wrt.9.2023.01.28.00.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 00:28:02 -0800 (PST)
From: Alexandru Ardelean <alex@shruggie.ro>
To: devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 1/4] ASoC: codecs: tas5720: split a
 tas5720_mute_soc_component() function
Date: Sat, 28 Jan 2023 10:27:41 +0200
Message-Id: <20230128082744.41849-1-alex@shruggie.ro>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Changelog v1 -> v2:
- https://lore.kernel.org/alsa-devel/20230115193347.24190-1-alex@shruggie.ro/
- No change

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

