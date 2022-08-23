Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 920E459D2B3
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 09:54:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9E1C839;
	Tue, 23 Aug 2022 09:54:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9E1C839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661241290;
	bh=uTHzAOlflnncB0AVIs1NaFWU5IGCA+eykL/274P7Irs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PSYcDdnxdnA2MLJNiE6wpUXDg/5mYQgJ0voicZQVaHn6SXO77UAAqOU+3j7AqqQTm
	 iTuRymW2iCJbjE0rVh+ctBH7D1TyITRb2/lFeGRZvsCDKtPz4gqqxnY1s2kpz1bKMG
	 A6tR1s4ShddqWb66EOeUB6+FyjxCYUThamowaUkw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F384F8027B;
	Tue, 23 Aug 2022 09:53:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FCC8F8020D; Tue, 23 Aug 2022 09:53:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76FEBF800C9
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 09:53:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76FEBF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="H6eHdQC9"
Received: by mail-pj1-x1030.google.com with SMTP id
 r14-20020a17090a4dce00b001faa76931beso16424558pjl.1
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 00:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=nEf9h9B8XFcsw7F7FHaP4rxVimh4AhqGZN0e/h8tVmE=;
 b=H6eHdQC9nfpqxyFvScDKeIUMxPQixxwngCfLH06PzVsCieuC0wFtRfbviaHQJOZ2no
 KCFxhv8QDvdg2lmpGanCvawqQssmfLAG/0dof0Milu2TexViPWyQPk7YGFVyCzEYdlt6
 mmjUQqBLQRHNtzu0ceLLg4CKTcLb4WV/i7RWRuJ89FQHYSg1I3Tp8wP/alrEx2Vu3lzG
 MuOiBfI2cgWGEeDFOQg/DxB0fMAMDQpn7qndnPxjbPRKmEawHG+E/cf1iq4ONtmvZZBt
 SbM+vuVZbcUIpHNYo+NvsSPo/mCThabsQNYNurxvrvdB+wNJRtPH2tBuP4K/KXk4VDw3
 hyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=nEf9h9B8XFcsw7F7FHaP4rxVimh4AhqGZN0e/h8tVmE=;
 b=jeJdIMGvmlPwVtJ6tDooQzr03nN3XeMEqamoP2MEzXxRKhUPLshptA+NKFwA4ISC18
 4efuk5b0a9arqW4aci7LACtUaWBNELta3AFGd12VKvb7lACd26hJNB7xCW+TNQmoGcS4
 DDCX/Pxjp/8VJ9keLRzpiAawRf/dzvWhV/qBBzYBRZKgvV9h2PBSIc8PGOZ9hqE9oOxJ
 jiURUNq7sye3SFUjHLmvomcWNS6ysJqKZqr3j47wk8VYUG9+74SyKpcoqtF47ySL8SYe
 Cdy6FccxyMzQa4lneJGD6lAoUi6qJ4EQtusdJYaneD08y5wnTuLFVaaGGBn9oP1haL4O
 /klg==
X-Gm-Message-State: ACgBeo3GFi8jTOKcQDTaeQMt9SB4NACGSd++1WsdbbWNRoONHqp8m7wP
 rqVymeXmuMVL2tx61nqXsl4=
X-Google-Smtp-Source: AA6agR5PV7F4Fv1F70NJL2LVcXFE9N4pQkIOk+6vloijP9gA6TFUajv72QAWRFmdHKbokWoX6ssYYg==
X-Received: by 2002:a17:90b:4c08:b0:1fb:66d3:79c with SMTP id
 na8-20020a17090b4c0800b001fb66d3079cmr1269718pjb.121.1661241220134; 
 Tue, 23 Aug 2022 00:53:40 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a170902dacc00b0017269cc60d7sm9737931plx.214.2022.08.23.00.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 00:53:39 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: broonie@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH linux-next] ASoC: atmel_ssc_dai: Remove the unneeded result
 variable
Date: Tue, 23 Aug 2022 07:53:35 +0000
Message-Id: <20220823075335.209072-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alexandre.belloni@bootlin.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, ye xingchen <ye.xingchen@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>, nicolas.ferre@microchip.com, tiwai@suse.com,
 codrin.ciubotariu@microchip.com, claudiu.beznea@microchip.com,
 linux-arm-kernel@lists.infradead.org
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

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value from asoc_ssc_init() directly instead of storing it
in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 sound/soc/atmel/atmel_ssc_dai.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
index e868b7e028d6..3763454436c1 100644
--- a/sound/soc/atmel/atmel_ssc_dai.c
+++ b/sound/soc/atmel/atmel_ssc_dai.c
@@ -891,7 +891,6 @@ static int asoc_ssc_init(struct device *dev)
 int atmel_ssc_set_audio(int ssc_id)
 {
 	struct ssc_device *ssc;
-	int ret;
 
 	/* If we can grab the SSC briefly to parent the DAI device off it */
 	ssc = ssc_request(ssc_id);
@@ -903,9 +902,7 @@ int atmel_ssc_set_audio(int ssc_id)
 		ssc_info[ssc_id].ssc = ssc;
 	}
 
-	ret = asoc_ssc_init(&ssc->pdev->dev);
-
-	return ret;
+	return asoc_ssc_init(&ssc->pdev->dev);
 }
 EXPORT_SYMBOL_GPL(atmel_ssc_set_audio);
 
-- 
2.25.1
