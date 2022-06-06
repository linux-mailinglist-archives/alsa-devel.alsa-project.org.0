Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DBB53DF6A
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 03:40:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78B0F1A4C;
	Mon,  6 Jun 2022 03:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78B0F1A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654479629;
	bh=rPWN/1zeDZw7nodhlCogPC6LB0ZEjJ24azzAaVt8xRM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lu5AAPLpQK3PAtlDwJaLvqJ0MNwjDZQG/yn6k0779sUdSfpccXmD1CB/wiwh8pda1
	 a0v4XZE/AlY/dAehgfqDHlcisZzeGYfOEXlrz4qWixpQFLupg6joJEe4hOsYFCnW7l
	 zpUvvlkvC27ftPMsz/NPSTsIgP0S23jfTLcG+jPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA2ECF80089;
	Mon,  6 Jun 2022 03:39:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 893DAF801D8; Mon,  6 Jun 2022 03:39:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 168C8F80109
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 03:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 168C8F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lYQNpcOv"
Received: by mail-pf1-x42b.google.com with SMTP id c196so11592632pfb.1
 for <alsa-devel@alsa-project.org>; Sun, 05 Jun 2022 18:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=blp8QR6+pv4cfsiOBJIBVZUTesn4LU5MyrzFetgJvMo=;
 b=lYQNpcOvl7O7XFKGldBsZauzWbrF5gV7bO2tC9FJ6xk/kG3dp300eArolrqjPPjusH
 hzBnGl4HAGQyibt08ufLySgscjdx24YUBqnZbUalBf/LiZxyRglVezgkidXLobjMKZND
 Goub32GKdKsIddVGDlKY0AfS+RAHU18K6OUqyhUMAmJ0YS0rNqaXNKEmBICzRbe43b7n
 /6NvuvH6JiOI9j8LnJS5z7XVfwV+cfvLc+p6twFc1mD/I854E0JhCfTYWFDdsmXatzL3
 /E/SIwIJsqqS/sOsEpwom8d2QDgx4ZbwsdzfAPwL2EvMWOzroL93G7b3T18fTyNCZnLV
 STfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=blp8QR6+pv4cfsiOBJIBVZUTesn4LU5MyrzFetgJvMo=;
 b=C+ZbhX63pPkTksmXcRkpMU+dR0giJx7SI9REs0+i4rNW5UYvQ+oW/6DnFiLIbMOWMg
 gCFxOQGkRMWGv0R2Lo6hT8jbceXk3BC01xOCqYsFI/jsmds9KSZBNSCy5i83LUip3Md+
 SGi2Gj627TTCZiLDcyHdxW829tz/6hEVgusaxVuQ00RIV330HYXkQLvelXcOqWhfOKqx
 hgCh622Hy+ScpkZhjbVaj+s7P0TRx8kbucDxlTkqXdI6qll3lBUl1XK9ts5lZJDa+yRo
 RWOYC+n66ZoLMjISm0TiwCrR8afX6ipqMG5nsAsUGbFsbN26zeLu/4pEvP+I4hFYpBOF
 xnxA==
X-Gm-Message-State: AOAM530HXtnHlIjbHMxm7dSVNYonkFm5a389w7cYxd/8A0DKPah+tTmq
 SgrqCRPTJvYNtXtukLXutjM=
X-Google-Smtp-Source: ABdhPJwFYrP5esHgQvOJCyeQFcFYd0RAzW47p2o2yhWnlmpabfsh3MwNYIvlNAzykgi0MUfPMmfa0A==
X-Received: by 2002:a63:5a58:0:b0:3fb:b455:ed15 with SMTP id
 k24-20020a635a58000000b003fbb455ed15mr18899426pgm.228.1654479561010; 
 Sun, 05 Jun 2022 18:39:21 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 ku12-20020a17090b218c00b001e31feb7383sm8795793pjb.49.2022.06.05.18.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 18:39:20 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: lgirdwood@gmail.com
Subject: [PATCH] ASoC: wm_adsp: Remove redundant NULL check before
 release_firmware() call
Date: Mon,  6 Jun 2022 01:39:16 +0000
Message-Id: <20220606013916.290387-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, broonie@kernel.org
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

From: Minghao Chi <chi.minghao@zte.com.cn>

release_firmware() checks for NULL pointers internally so checking
before calling it is redundant.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 sound/soc/codecs/wm_adsp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 7973a75cac05..4c4344b21c2e 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -739,12 +739,10 @@ static void wm_adsp_release_firmware_files(struct wm_adsp *dsp,
 					   const struct firmware *coeff_firmware,
 					   char *coeff_filename)
 {
-	if (wmfw_firmware)
-		release_firmware(wmfw_firmware);
+	release_firmware(wmfw_firmware);
 	kfree(wmfw_filename);
 
-	if (coeff_firmware)
-		release_firmware(coeff_firmware);
+	release_firmware(coeff_firmware);
 	kfree(coeff_filename);
 }
 
-- 
2.25.1


