Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F757140F0
	for <lists+alsa-devel@lfdr.de>; Sun,  5 May 2019 18:01:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C93918C3;
	Sun,  5 May 2019 18:00:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C93918C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557072099;
	bh=NtnZOFVXOUzDgub5wMR+NauFoKkAPE3SyyPswIeC3EE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DmpsZSbt+cBmE8af6u4PlO3E7b5+MvHjCmUJrGpQBRdd0+1RYJSRmEOm3kC5/6vTB
	 cxACfyBRCk/bqS249pxtpVmFp/pXd5syk3vv8xscL9iuF/NdD5OPuqpGBFWFjnM6Xw
	 moC6TsphL9qdfwtx5jfHEsPNGpPOe8GlOR/oZ0Ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21866F89746;
	Sun,  5 May 2019 17:54:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB2EFF896E3; Sat,  4 May 2019 17:17:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B142F896AA
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 17:17:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B142F896AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LwJyMbzz"
Received: by mail-ed1-x541.google.com with SMTP id w37so9711352edw.4
 for <alsa-devel@alsa-project.org>; Sat, 04 May 2019 08:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZC78VHdO6R2zEO3o/rcoTftfUPrHjiCeWK1pVxkdMMg=;
 b=LwJyMbzzX1u8RDXAZ524BLTNc2ijQDCaiBiHO9lxonLu9KJMzeO8e5uJNcDBd1uhBb
 cnqkcPxHcTekqi0hIkPb/6xNLcOFI1ujyyRlAT8lGbi3jFx0jUgM0PcxWLqMi5XH6pYJ
 S2OFX4X1QpuhzaXEhIA9ECINxxkRf/zvC5Naxsk1LubgOqSOgBl5AWdHxTmiigRsWH+/
 BpZM/HO+KBUK0fKFWyiuW+MCXPnqkLpiqTb/YicH7FiKBi3mcMnAt93bmQT/S/5hB/sa
 ryY4qWsGsQqFW3rLAPxdvrlrpMZtceTFYYxuP/I6AfGRnWO9k+Ritd/vqj+NNL+3rPYg
 qG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZC78VHdO6R2zEO3o/rcoTftfUPrHjiCeWK1pVxkdMMg=;
 b=H2yx8ihUC7PqzO5BLjyOC9qtnmXj8ritns+A5bvrxaVJIx4gP45t93RGpRfgtC5ITm
 wqh9lKm+JEPtAmdQq/JVbBH0Qwa965bbcdqyZD/RbwrUoV6BHblJnrWukk1gygbjXihK
 RekY7etAaeUk/0xIVqTG3/GeyY2R281A/hY4pDMfEKl+eIpKPEXzuUgz/z0ruFUT1gNJ
 p/AIpwQhMIx6VMZ/LsfEQCm71AwHUbbd7jC32XuQDqgfCT76ddBjZ6/FWdACR/p11LWz
 pvnp5noajekAtRu/OW61B8z4wdYlBG0JYZSr2R7Lr2IuHYB8oBU/MJ8mSvl9yww5ECJ2
 XjNQ==
X-Gm-Message-State: APjAAAU5gQnJvQDngX3jcKkJnwRE8r4sMM+Ip6b1ss2wE9Ie8O1Fp0i0
 OGCcVhMLqEX4Cyr6ajugNMI=
X-Google-Smtp-Source: APXvYqxMtvwrVp1GD0rjfQE/veMHoC13fIU9jop9kWaleO4RZrH0aPYM0rSdYFFRZLdj73vHAbrGyw==
X-Received: by 2002:a50:b6cf:: with SMTP id f15mr15390529ede.192.1556983024555; 
 Sat, 04 May 2019 08:17:04 -0700 (PDT)
Received: from elitebook-localhost (84-106-70-146.cable.dynamic.v4.ziggo.nl.
 [84.106.70.146])
 by smtp.gmail.com with ESMTPSA id j55sm1468433ede.27.2019.05.04.08.17.03
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 04 May 2019 08:17:03 -0700 (PDT)
From: Nariman <narimantos@gmail.com>
X-Google-Original-From: Nariman <root>
To: linux-kernel@vger.kernel.org
Date: Sat,  4 May 2019 17:16:52 +0200
Message-Id: <20190504151652.5213-4-user@elitebook-localhost>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190504151652.5213-1-user@elitebook-localhost>
References: <20190504151652.5213-1-user@elitebook-localhost>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 05 May 2019 17:54:02 +0200
Cc: alsa-devel@alsa-project.org, Jordy Ubink <jordyubink@hotmail.nl>,
 tiwai@suse.com, yang.jie@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org
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
