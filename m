Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9068D186E5A
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 16:13:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EEE718B7;
	Mon, 16 Mar 2020 16:12:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EEE718B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584371607;
	bh=hZp5evE6CsvIneSZYSIXeYC4x156FjThRGveuQY1tYk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OfL8JTcnVTIoXUdGTfwe2awooHr3lqs70Z1DniABCkgyjSAh6so3T01Minoeo+TyP
	 0yB0lR3ETnwQ848gWR/+/uxlA3mGaZyTVCdxXtfGW4TTzBHRj2iVtY1IiNnKjz6q9n
	 S/2iFUjIxK6wkwAObfmJkVVfuPmsMsyAajeXBujM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03BF3F8028B;
	Mon, 16 Mar 2020 16:11:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A7CFF80248; Mon, 16 Mar 2020 16:11:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EA27F800D2
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 16:11:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EA27F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="l1jWliND"
Received: by mail-wr1-x442.google.com with SMTP id s5so21741669wrg.3
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 08:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uMLkobIeM9DCkYCP5Y/MHr6L2BuJYzjWCEI6GI6xP84=;
 b=l1jWliNDgPxq9N9s7HgwP/YBv3zwSYsNS2CAOnN8TAfAGqm/CbNWBl828eQoD9dQp3
 DL27nsTNd0QBLJp+3wBm9uTsH593tulDiGCmrN4sWt+voD3enxJLMUsC0aDvk9rMR2rB
 U5PVx3oXWJTNPVNawqWuDSG8yeqEFpOrxP1pKSepO/KA8TNkjnAWVGUBte0E7JX6ldH9
 3qO2Xxa+n8H8Yn1ui+6se0WSHVL4EW0//PvtpmpLZBYzVf9zRtHCurouZCxdZ98tBkDy
 8IRpgXO6yak0zwFnXVNwXpRrNJak5+mSb18bW5W0aQcwCL/JfwpaF14mm7A5BUk6CLL3
 oyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uMLkobIeM9DCkYCP5Y/MHr6L2BuJYzjWCEI6GI6xP84=;
 b=Bzjg+dNTxE4U8AZwe3/Pnxp/86PjWXeu5j/YNt9p22BIeYpsLozwqrf0IaXr9gDPQB
 CjS7bn58PBSJe9egWOasVuETTJBpK02JtMu6dVkFYQBHRcPdtYRh0V579F/iRq9xpDAF
 ObHNE/QSNkviALMLOAszwP2nRDXCur4oasToapk9Ts+FlLen/C93eVbGrkLrZrHcUejN
 Urd0USnNKHn/ARU78GjKYNyekbPTOhnperUMNV5y4OsLPh8rL3MLnb0hOS7BUbMYj5Tn
 ZLfyW9ZhzIY9JxWUZbzyFMAH9NnRzqZxUKNi2wohXn+droNKb+1bwcOsgFKYzdZYXkPu
 Vr8g==
X-Gm-Message-State: ANhLgQ0AVBZ1Ifj6TKn63qnHUSwpqyF+D2szwjXkcPHDVbYbznmaCjeh
 KgOQGKRaNgV50NCKUx1UT+GFFqzed4E=
X-Google-Smtp-Source: ADFU+vvnSbRNrjh7UKOltQra2NXVuqL+ACmrLbkOHpSHUtXiWR8Zc936fH6eF5TIBGv8gmyyfa/0Og==
X-Received: by 2002:adf:e550:: with SMTP id z16mr11337435wrm.394.1584371480434; 
 Mon, 16 Mar 2020 08:11:20 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id y69sm31530923wmd.46.2020.03.16.08.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:11:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: soc-dai: return proper error for get_sdw_stream()
Date: Mon, 16 Mar 2020 15:11:10 +0000
Message-Id: <20200316151110.2580-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 vkoul@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

snd_soc_dai_get_sdw_stream() returns null if dai does not support
this callback, this is no very useful for the caller to
differentiate if this is an error or unsupported call for the dai.

return -ENOTSUPP in cases where this callback is not supported.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 include/sound/soc-dai.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 7f70db149b81..78bac995db15 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -433,7 +433,7 @@ static inline int snd_soc_dai_set_sdw_stream(struct snd_soc_dai *dai,
  * This routine only retrieves that was previously configured
  * with snd_soc_dai_get_sdw_stream()
  *
- * Returns pointer to stream or NULL;
+ * Returns pointer to stream or -ENOTSUPP if callback is not supported;
  */
 static inline void *snd_soc_dai_get_sdw_stream(struct snd_soc_dai *dai,
 					       int direction)
@@ -441,7 +441,7 @@ static inline void *snd_soc_dai_get_sdw_stream(struct snd_soc_dai *dai,
 	if (dai->driver->ops->get_sdw_stream)
 		return dai->driver->ops->get_sdw_stream(dai, direction);
 	else
-		return NULL;
+		return ERR_PTR(-ENOTSUPP);
 }
 
 #endif
-- 
2.21.0

