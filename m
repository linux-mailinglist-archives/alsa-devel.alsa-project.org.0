Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0462282B
	for <lists+alsa-devel@lfdr.de>; Sun, 19 May 2019 20:00:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AB4E1685;
	Sun, 19 May 2019 19:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AB4E1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558288838;
	bh=aIw45u3BHXYtLAh2i9/07Td8kBYUgsuBEdQ3Ui1iMsc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QkfK2Efi1ntaul0KjEmfl25vt2q1WoWw2JsuhtaVwMBZNh+TErYhlw3Pg6J9zW8xu
	 j9uogtvbT9/qJLJD2TFDB41ElK7+pR5f3ng5UClrvmXgLr46DXXQqVu0atsPV8zaYr
	 ylguW6A1ZMZ9Q7ooGnolbOfkQrvA4RiCkMIvFAgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72118F89733;
	Sun, 19 May 2019 19:57:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83851F8970E; Sun, 19 May 2019 19:57:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0389FF89630
 for <alsa-devel@alsa-project.org>; Sun, 19 May 2019 19:57:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0389FF89630
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="K6wB/8d7"
Received: by mail-ed1-x542.google.com with SMTP id l25so19910429eda.9
 for <alsa-devel@alsa-project.org>; Sun, 19 May 2019 10:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eVaNiZEHc2WcLQetcZoCKC6E7inFmZ0Pm/1lAy3U6IQ=;
 b=K6wB/8d7dqCDlc21CCTdhmAzeRVyTKQRgt2+flXlaWoLItJMy8VTsJt++RLKl77n40
 ftEt8NJZPoqzl75TaNzxFJ1MI1I3rTMb2TYt6C7/5lejLoTDOcg4ieqKJsSu19kT1weS
 MMUAymGTkJKScCfuiSacIteezNzOzxWneXQXU8aU95rzYdCah4CyLbDcepmt9lypqY5B
 v21JKS1WZ08knDGuN9L9vr2CgfmleW7Dx9JRAcPnD6uAMwwKD4nafvuvFOWlZ06eT9B/
 vkWokLfdZRCrxp6OjqbDN2HyUOUMB//Yue0uHTCc5CJQV3I0WcFiQE3cqOsJ5ONGLnVZ
 Hw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eVaNiZEHc2WcLQetcZoCKC6E7inFmZ0Pm/1lAy3U6IQ=;
 b=JqK4DUDQj93kIDtIVXGb+yorWFb3znYVDorbEY3tVhKZG1bJDe58rCLWro/xjkAXCi
 ZkjJ3RRStAYrAlv7ai4imz/mGpsNuuy4uiaCikw6A/e8ieBmV7TYKuq9qDJYdoS9TxJH
 kosKAonbKXiNAu/XIPCNUfhZEBICNJuhO3e4ocYwT3wsoQiVs2rLybbOIFIcQbxVYuY5
 oxSL6/qyEp+tM/ew8L/QydUsaxJAp1ki0nLfEI4Pe8x3ojY8UDuKuFEHfuwH4Om/t0We
 EkvkFvRdr2u65QMS40N8c5dI+sj9wdFUWV+hkfBkoFH8jn3i6T/hNXZfhpvtBfS5+nx4
 f8xg==
X-Gm-Message-State: APjAAAWNZv+o7UrmCxMGtUYzg8KiVqnyS85OYcxBrNBQV4Odn2VszUp7
 3pls+25aSrArENJf9I1YTHo=
X-Google-Smtp-Source: APXvYqzwILb9iU6xVGV23PJPw0nr3EUtl8te6kELaj8HZ7i6oFAwJbtvJrjvKY8xCkIvNFiumh4uSQ==
X-Received: by 2002:a17:906:3e8a:: with SMTP id
 a10mr52197862ejj.179.1558288647205; 
 Sun, 19 May 2019 10:57:27 -0700 (PDT)
Received: from elitebook-localhost (84-106-70-146.cable.dynamic.v4.ziggo.nl.
 [84.106.70.146])
 by smtp.gmail.com with ESMTPSA id f25sm4936965ede.44.2019.05.19.10.57.26
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 19 May 2019 10:57:26 -0700 (PDT)
From: nariman <narimantos@gmail.com>
To: broonie@kernel.org, hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Date: Sun, 19 May 2019 19:57:03 +0200
Message-Id: <20190519175706.3998-1-narimantos@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Nariman Etemadi <narimantos@gmail.com>
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
