Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7CC22829
	for <lists+alsa-devel@lfdr.de>; Sun, 19 May 2019 19:59:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17DBE1683;
	Sun, 19 May 2019 19:59:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17DBE1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558288793;
	bh=NJcexo0ao7z+xBUKHWn/9uEWoyo4xpa3oF+oYZvrHFc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l5O/x2m0TLOqnN0i/IjZNPd9VhHLEXzPpNOm4l4tQImG0z7m7XS7P9qEzyLfdEs/M
	 woQeVCrOwDEHbu2qNFsTPzAYToRsYNLTys9OK2J3iQgbkeC7k7GFw/kZqk61PvKqV2
	 WnrE7dq5B9m5160rlcIQD6Eh7nOQSUfSGISllagI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 050C5F89723;
	Sun, 19 May 2019 19:57:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A553F89630; Sun, 19 May 2019 19:57:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98FA3F8961D
 for <alsa-devel@alsa-project.org>; Sun, 19 May 2019 19:57:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98FA3F8961D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GAtLPg50"
Received: by mail-ed1-x543.google.com with SMTP id n17so20019284edb.0
 for <alsa-devel@alsa-project.org>; Sun, 19 May 2019 10:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YXXH5t9TTRLBW2BHaBe8u0lhH1b3Av66zK7Fxpl6yxw=;
 b=GAtLPg50hmCYoeXb6A/edx2LgTxQ/v0NLySw+fcbnq+PngK+PEo/XaGqJYs4qySqwO
 DkqVvZ4VXWp6RIt4YxpfT1rlxQkpfHr73Nl9cmLBOqYwNNkSupAoWeHqdhBJLboFwtRh
 bbaGetGNiFIgYyNZf03+hXl+rS7tAhj4a/XgwWwuUvBEeXDqNMVgRta7TCKqTeTrQhxI
 3X7PwVuHResA4PsbKM5I9K5e7DLEoWE/KwQ3k18ujyCVmbuBYUcgKH92RiiadDLDH8Wj
 +DRM8JFA3rkKxcdoBIQCbNNYSptSOnXyoAZNKTCdAAKtYZOU7BIeJsmUmygdICbbosp8
 YfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YXXH5t9TTRLBW2BHaBe8u0lhH1b3Av66zK7Fxpl6yxw=;
 b=tvTF0FIq9evEjeUOumu3ltIzF3ij6YrltuAHlWsGfofxXGDGRfYIhawBGQD54v0p7O
 Je2+wXITWFAgTtY2gF1wz+vjHlwVLlioUeT1fU55P60NoTVb6YuqG2Qsxyudnt/PXY/F
 qz0IkpVN9ODlQuy0Aw3cPWMB8uA8Xv7+LUSSxYcWEEguVUjpsq2Q0sOLE96QXaqghRr4
 1Eun2uyXRL1Go27Vf+UxUqa9+c0ltJ//Ga04pSD5wTkSrOiGKSSghHBpLpCJuj1Y2Ik9
 L596AyL3gheoYuKxrGE+l0eV4j7mchXsjJCL49xaQF/bpcN+tm566d9gUeOhTOZZH37P
 YSUQ==
X-Gm-Message-State: APjAAAU3aS0oKVZ68YQc7e7BSj7uZhkUNEiW4ME2Oz/hiwikDZge2A1l
 41v91+B9OD0wprjUCphSVY8=
X-Google-Smtp-Source: APXvYqxWrIwrCTIPqJP+H56HIVs5ZNIE4+Jcq5Aw1EY+qIZZroKHkaH3M4jxWm5IplbffUqLP9WElg==
X-Received: by 2002:a17:906:5d12:: with SMTP id
 g18mr42455993ejt.286.1558288644893; 
 Sun, 19 May 2019 10:57:24 -0700 (PDT)
Received: from elitebook-localhost (84-106-70-146.cable.dynamic.v4.ziggo.nl.
 [84.106.70.146])
 by smtp.gmail.com with ESMTPSA id o47sm4959975edc.37.2019.05.19.10.57.24
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 19 May 2019 10:57:24 -0700 (PDT)
From: nariman <narimantos@gmail.com>
To: broonie@kernel.org, hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Date: Sun, 19 May 2019 19:57:06 +0200
Message-Id: <20190519175706.3998-4-narimantos@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190519175706.3998-1-narimantos@gmail.com>
References: <20190519175706.3998-1-narimantos@gmail.com>
MIME-Version: 1.0
Cc: Jordy Ubink <jordyubink@hotmail.nl>, Nariman Etemadi <narimantos@gmail.com>
Subject: [alsa-devel] [PATCH] ASoC: Intel: bytcr_rt5651.c: remove string
	buffers 'byt_rt5651_cpu_dai_name' and 'byt_rt5651_cpu_dai_name'
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

From: Jordy Ubink <jordyubink@hotmail.nl>

The snprintf calls filling byt_rt5651_cpu_dai_name / byt_rt5651_cpu_dai_name always fill them with the same string (ssp0-port" resp "rt5651-aif2"). So instead of keeping these buffers around and making the cpu_dai_name / codec_dai_name point to this, simply update the foo_dai_name pointers to directly point to a string constant containing the desired string.

Signed-off-by: Jordy Ubink <jordyubink@hotmail.nl>
Signed-off-by: Nariman Etemadi <narimantos@gmail.com>
---
 sound/soc/intel/boards/bytcr_rt5651.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index e528995668b7..2e1bf43820d8 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -730,8 +730,6 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 
 /* SoC card */
 static char byt_rt5651_codec_name[SND_ACPI_I2C_ID_LEN];
-static char byt_rt5651_codec_aif_name[12]; /*  = "rt5651-aif[1|2]" */
-static char byt_rt5651_cpu_dai_name[10]; /*  = "ssp[0|2]-port" */
 static char byt_rt5651_long_name[50]; /* = "bytcr-rt5651-*-spk-*-mic[-swapped-hp]" */
 
 static int byt_rt5651_suspend(struct snd_soc_card *card)
@@ -1009,26 +1007,12 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 	log_quirks(&pdev->dev);
 
 	if ((byt_rt5651_quirk & BYT_RT5651_SSP2_AIF2) ||
-	    (byt_rt5651_quirk & BYT_RT5651_SSP0_AIF2)) {
-		/* fixup codec aif name */
-		snprintf(byt_rt5651_codec_aif_name,
-			sizeof(byt_rt5651_codec_aif_name),
-			"%s", "rt5651-aif2");
-
-		byt_rt5651_dais[dai_index].codec_dai_name =
-			byt_rt5651_codec_aif_name;
-	}
+	    (byt_rt5651_quirk & BYT_RT5651_SSP0_AIF2))
+		byt_rt5651_dais[dai_index].codec_dai_name = "rt5651-aif2";
 
 	if ((byt_rt5651_quirk & BYT_RT5651_SSP0_AIF1) ||
-	    (byt_rt5651_quirk & BYT_RT5651_SSP0_AIF2)) {
-		/* fixup cpu dai name name */
-		snprintf(byt_rt5651_cpu_dai_name,
-			sizeof(byt_rt5651_cpu_dai_name),
-			"%s", "ssp0-port");
-
-		byt_rt5651_dais[dai_index].cpu_dai_name =
-			byt_rt5651_cpu_dai_name;
-	}
+	    (byt_rt5651_quirk & BYT_RT5651_SSP0_AIF2))
+		byt_rt5651_dais[dai_index].cpu_dai_name = "ssp0-port";
 
 	if (byt_rt5651_quirk & BYT_RT5651_MCLK_EN) {
 		priv->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
