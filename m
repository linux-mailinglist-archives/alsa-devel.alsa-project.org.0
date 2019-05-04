Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E1F140EF
	for <lists+alsa-devel@lfdr.de>; Sun,  5 May 2019 18:00:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6235718BE;
	Sun,  5 May 2019 18:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6235718BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557072059;
	bh=aIw45u3BHXYtLAh2i9/07Td8kBYUgsuBEdQ3Ui1iMsc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EhfBsTH0Zd3rtwad29XesI4gGhwj4M3+tzp9B283V+0mKk2sxPh365P2mLPZmjXo8
	 9dBraJLMeur2niHZtMIC4NUiFozjwwwo4X8DcYjutW+FQNvm41k6IN9rJEyrG5r5YW
	 5ekzK6mYfSMCtbR7ykPyqizaRxJhTOAe55QtOuMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14372F89744;
	Sun,  5 May 2019 17:54:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78496F896E3; Sat,  4 May 2019 17:17:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DED7DF80726
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 17:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DED7DF80726
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lust9394"
Received: by mail-ed1-x541.google.com with SMTP id w35so8040901edd.1
 for <alsa-devel@alsa-project.org>; Sat, 04 May 2019 08:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eVaNiZEHc2WcLQetcZoCKC6E7inFmZ0Pm/1lAy3U6IQ=;
 b=lust9394uk9VsG0Af6ixeNW7Ob8Y4vrJJbdXC0+Iz6YUJM2pFZz5fdUE3ZUf/dUZRS
 258q1s8zOau8xZFmjfqsexI66BrPIQnJhr3KMpu6KjXwhU260OS08iBj8RVzzM/UmkVL
 KHnF7+YdzH8mMcxykyLrVlI00WT0ZMIjocPqbkAL12+JMv1O1XLx/guD5xeWUDWFi1aC
 tLYAU+cx5cOt1L4gGVkLrgdC54ecQW83nn90RIFMI8CddXjJSsVrdWuPRYxU2J0I8ai1
 NLwtKehhdv2w4k9SqtGVpKIhu3vBAY2sp7w6mZnweCDEb3wNSXmDK0F/9fl/sKPYCBJS
 hayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eVaNiZEHc2WcLQetcZoCKC6E7inFmZ0Pm/1lAy3U6IQ=;
 b=gGrooQGkYg562l6iR0xqW7yiIZaq4Ekx7gBtSdRpS1emVtJYF6XljNO3IZC6jmcpeG
 OEjDPmMBmvhvNKdJfONI/PtZPwVk379U3KT1+bPaNwuMHqu8FC4E22FJq6hNGZzJWHoP
 xQ84XJrJLc9f7ghWHtQa7stv/1AZi2My4piXQ8/n2zjKgO7K/V6Tz3/+C1QfVbbfLYdb
 I57ReKJj1p/e9tlLeT+yh7e3fK764C9mAwbcuvn6ZG+qeOONAUAqLN57ZMZcQrXqNY+s
 lqCSOyCIR1pS4DjWPoF8bmKUclDdnn2RkO2LYkNfDXoRDHvdCHsdl0krg0CtKH0j5rhj
 VJNg==
X-Gm-Message-State: APjAAAVgITfaFQEg0YIMQiF9avsFPvGyj6K/6BTB1NZe0ELYJvok1osw
 RQ0VjlwL/+QSqUS8FEsV188=
X-Google-Smtp-Source: APXvYqyjUMC5lD1Ttz9DnqsIcJ7TsmGtzUtIugjLV+/qjipULhLu9wXCxDrKuT4+m1zJljEJdgNsyQ==
X-Received: by 2002:a17:906:c52:: with SMTP id
 t18mr11359001ejf.53.1556983023082; 
 Sat, 04 May 2019 08:17:03 -0700 (PDT)
Received: from elitebook-localhost (84-106-70-146.cable.dynamic.v4.ziggo.nl.
 [84.106.70.146])
 by smtp.gmail.com with ESMTPSA id x44sm1438747edb.51.2019.05.04.08.17.02
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 04 May 2019 08:17:02 -0700 (PDT)
From: Nariman <narimantos@gmail.com>
X-Google-Original-From: Nariman <root>
To: linux-kernel@vger.kernel.org
Date: Sat,  4 May 2019 17:16:49 +0200
Message-Id: <20190504151652.5213-1-user@elitebook-localhost>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 05 May 2019 17:54:02 +0200
Cc: Nariman Etemadi <narimantos@gmail.com>, alsa-devel@alsa-project.org,
 tiwai@suse.com, yang.jie@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org
Subject: [alsa-devel] [PATCH] ASoC: Intel: bytcr_5640.c:Refactored if
	statement and removed buffer
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

From: Nariman Etemadi <narimantos@gmail.com>

in function snd_byt_rt5640_mc_probe and removed buffer yt_rt5640_codec_aif_name & byt_rt5640_cpu_dai_name

Signed-off-by: Nariman Etemadi <narimantos@gmail.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 940eb27158da..0d91642ca287 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1075,8 +1075,6 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 
 /* SoC card */
 static char byt_rt5640_codec_name[SND_ACPI_I2C_ID_LEN];
-static char byt_rt5640_codec_aif_name[12]; /*  = "rt5640-aif[1|2]" */
-static char byt_rt5640_cpu_dai_name[10]; /*  = "ssp[0|2]-port" */
 static char byt_rt5640_long_name[40]; /* = "bytcr-rt5640-*-spk-*-mic" */
 
 static int byt_rt5640_suspend(struct snd_soc_card *card)
@@ -1268,28 +1266,12 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	log_quirks(&pdev->dev);
 
 	if ((byt_rt5640_quirk & BYT_RT5640_SSP2_AIF2) ||
-	    (byt_rt5640_quirk & BYT_RT5640_SSP0_AIF2)) {
-
-		/* fixup codec aif name */
-		snprintf(byt_rt5640_codec_aif_name,
-			sizeof(byt_rt5640_codec_aif_name),
-			"%s", "rt5640-aif2");
-
-		byt_rt5640_dais[dai_index].codec_dai_name =
-			byt_rt5640_codec_aif_name;
-	}
+	    (byt_rt5640_quirk & BYT_RT5640_SSP0_AIF2))
+		byt_rt5640_dais[dai_index].codec_dai_name = "rt5640-aif2";
 
 	if ((byt_rt5640_quirk & BYT_RT5640_SSP0_AIF1) ||
-	    (byt_rt5640_quirk & BYT_RT5640_SSP0_AIF2)) {
-
-		/* fixup cpu dai name name */
-		snprintf(byt_rt5640_cpu_dai_name,
-			sizeof(byt_rt5640_cpu_dai_name),
-			"%s", "ssp0-port");
-
-		byt_rt5640_dais[dai_index].cpu_dai_name =
-			byt_rt5640_cpu_dai_name;
-	}
+	    (byt_rt5640_quirk & BYT_RT5640_SSP0_AIF2))
+		byt_rt5640_dais[dai_index].cpu_dai_name = "ssp0-port";
 
 	if (byt_rt5640_quirk & BYT_RT5640_MCLK_EN) {
 		priv->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
