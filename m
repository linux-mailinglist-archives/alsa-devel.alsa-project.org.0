Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6715F1F1A
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Oct 2022 22:04:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E4242830;
	Sat,  1 Oct 2022 22:03:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E4242830
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664654640;
	bh=m5NEdxVXWn0Fg7JfEutVVi99m8+8++2uETjfzkMTkGE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kw0OSIFwxL5wG2q3+Say3KyxuVqnnmS2QW5ZGo19ruhcc/Q2KZWjr6LkPaVBwRRSi
	 LxPBJK1Xk9epztvwMGG40RnCwMzPZ5vdVUCd0OmS6S25NWQy3b9lGL7eLMHYZRrmIy
	 pohuntQWEkX56Yj9r0sQEynmsFvzVfElkEgo5yJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA067F80549;
	Sat,  1 Oct 2022 22:02:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8BF3F804CF; Sat,  1 Oct 2022 22:02:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87759F804C2
 for <alsa-devel@alsa-project.org>; Sat,  1 Oct 2022 22:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87759F804C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=schmorgal.com header.i=@schmorgal.com
 header.b="LcbIcbtc"
Received: by mail-pg1-x534.google.com with SMTP id q9so6740863pgq.8
 for <alsa-devel@alsa-project.org>; Sat, 01 Oct 2022 13:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=2kQFssZDN0HRb1/ORSf7rWm+rHmS3Pt1sIzHwE9NrHQ=;
 b=LcbIcbtc1nxnsfeqBhchgdsIiOxHmiUuGXPCoPwdjKZyeZNB74tNAWj9NQ8bSNF4nm
 cLBSlsRkgRnOwyUpSQsriG7jXA7kB6VkaI8MVZXshFAS7yYi41vlxQL6TM1Ezn1S66us
 ZUcZbaq/Q8s4HIkOvG5EP7aq5tH7p/qohPrPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=2kQFssZDN0HRb1/ORSf7rWm+rHmS3Pt1sIzHwE9NrHQ=;
 b=1+GDCynO8klCsWaLemmE6bkebuWB9jzoFPE54VQlJmXHW382aZroKNFxa88lgZYBVz
 sUerHf6T49PPlKAsllPvhali4GiSH5ctdfJ1oub+NVJp75MedsFBZ1uJbRDE30/0vbiX
 +jEhCMPUDr/Qin7SxFGUOF5vSzxv5ZkeEUZ8r0/YyjGyLvIbY/mEZVdEm08ox1BGdlbN
 k4fZ59E9dIaaFzAjxZlsCA7VbX33SFaZb8edfwy1pK+OKffNIq8EoVU2uTzihmBXXmlc
 84nIh5b2psG34L3w5rf+AtgvlqjwPc/aR3JZieXuwAPO6pT3qlLMOFj6df0hWnKVG1QL
 mN1w==
X-Gm-Message-State: ACrzQf0kOJ24a8HpovYFIlpyOOrnUwW2dNqH1pZTfY/K4sxa9ZUpTD4/
 DakzjuI6KxXVLuUF1mAZz1ovcA==
X-Google-Smtp-Source: AMsMyM42WnOIyg1fnqg/A2SJuFW1FMcCAW0FwedAGNlAlBLwpkV6Ee1dDb4FQ2dXWMbQpeZ81dXIRw==
X-Received: by 2002:a63:65c4:0:b0:440:5352:3812 with SMTP id
 z187-20020a6365c4000000b0044053523812mr11370123pgb.285.1664654534328; 
 Sat, 01 Oct 2022 13:02:14 -0700 (PDT)
Received: from doug-ryzen-5700G.. ([50.45.132.124])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a170903121200b0017a8aed0a5asm4313593plh.136.2022.10.01.13.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 13:02:13 -0700 (PDT)
From: Doug Brown <doug@schmorgal.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: wm8961: add support for devicetree
Date: Sat,  1 Oct 2022 13:00:39 -0700
Message-Id: <20221001200039.21049-3-doug@schmorgal.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001200039.21049-1-doug@schmorgal.com>
References: <20221001200039.21049-1-doug@schmorgal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Doug Brown <doug@schmorgal.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

This adds support for devicetree to the WM8961 driver so it can be used
with modern DT-based kernels.

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 sound/soc/codecs/Kconfig  | 2 +-
 sound/soc/codecs/wm8961.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index e3b90c425faf..2b5787ee8d31 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1929,7 +1929,7 @@ config SND_SOC_WM8960
 	depends on I2C
 
 config SND_SOC_WM8961
-	tristate
+	tristate "Wolfson Microelectronics WM8961 CODEC"
 	depends on I2C
 
 config SND_SOC_WM8962
diff --git a/sound/soc/codecs/wm8961.c b/sound/soc/codecs/wm8961.c
index 7dc6aaf65576..539096184eda 100644
--- a/sound/soc/codecs/wm8961.c
+++ b/sound/soc/codecs/wm8961.c
@@ -971,6 +971,12 @@ static const struct i2c_device_id wm8961_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, wm8961_i2c_id);
 
+static const struct of_device_id wm8961_of_match[] = {
+	{ .compatible = "wlf,wm8961", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, wm8961_of_match);
+
 static struct i2c_driver wm8961_i2c_driver = {
 	.driver = {
 		.name = "wm8961",
-- 
2.34.1

