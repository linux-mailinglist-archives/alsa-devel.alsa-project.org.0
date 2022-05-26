Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF9A53534D
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 20:22:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47179169A;
	Thu, 26 May 2022 20:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47179169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653589373;
	bh=C4Gr5XQIWHNuxXK7asBxR86f7UJp9pljfpdTJsZ86C4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r1E7/+csIv07saJs08/ohCK/4vumslXmXbRBLPIaZzjNpaTQQxCEcOeq9mefNUxZ2
	 ucnqxFefohtiVIPZviGWH9HBoLvglR3H+0qqg+x6B+l0tHaFSuEJ4PXri8sF9vN4jh
	 b363ZeeniM5mTh6/mkXBXgw7xK4we3PVCZubuGk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A54D8F80171;
	Thu, 26 May 2022 20:21:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EC34F80100; Thu, 26 May 2022 20:21:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1828CF80100
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 20:21:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1828CF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZZUJiu/r"
Received: by mail-qt1-x835.google.com with SMTP id p8so2599828qtx.9
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 11:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/wvru1v94Z3LpfaUeEixaS62JjWjiVp1HvAWwWWK5xg=;
 b=ZZUJiu/rOG/YOu2+5oV05xYD3LBrN4nPp3juCeQHXDJ+SCSC77GJj5kNHEbuK2/KFU
 MXfIOq87Rg8b7sNLtnqSwlOBDvMJjxQnoMQ9arUiZlI3KmGxno7GEaaHNKmlJKRXBWXD
 IuDnx6aL7dPX1/5kwyQyfqYF27IwKmMUdOkKlJG7FBXivK+ymwCDuyA71nXK859rImrq
 Cy9jJGwAOpeKSWLklDkUjACh5gLxgv1jclMgXZVZ/Ia2Esn8WeeNN2GV9pN+K9+3NgCz
 SM1TvNeTc5H4Ki+9Ukd4pgj9Zwb1EoB8ZLsfyaoYnE0/S5YEBB11TMF3bPgbs07tSMBQ
 AS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/wvru1v94Z3LpfaUeEixaS62JjWjiVp1HvAWwWWK5xg=;
 b=HoPmPtuYWPh3reilz+R9kaUcHDQoNL9UkefER4IY30JzCvmhYJrB30fLqgskHuPh4J
 2WqQnSSIxTvjkVkg520SonrZiw2j8FRuMUuT+Nv9MDR69rNEICXP8/NbJmT/10vOlJMS
 ry6qZdxtmD7MpJey+JbrAQo18VJ1cIukIzWILZGTcBz2RPCK6axcEbIAYIK/9XpUyUjm
 ZxTUEd4vZyVAbWNRjj5C6nYURaJJe/YlJgRzR4P1G3qFPfVeC0xwdclU12CNIX8Pyfgs
 IYq4bTJ1HPA/98TNcyC+FG3wELHmt+fH//TqthR/sgnjKVKtLlH0ZaG6y7c048y1z+oD
 VmJg==
X-Gm-Message-State: AOAM533Rr35fMYct5Y+k4ljNd7rDuC9j+QnXlJFefw9+oxBte2Ip3OGs
 uZKkoIHHFuEdE/m3Vjg9JCvU6I8tQB8=
X-Google-Smtp-Source: ABdhPJz6KfaUIhhaiWIH+q2OcHNSg6YVhoH0ms+eBOB/eGyVnd1i5HBvYIonid4BZbj0kpvhB+QHbg==
X-Received: by 2002:ac8:5750:0:b0:2f9:410b:7101 with SMTP id
 16-20020ac85750000000b002f9410b7101mr12262760qtx.291.1653589307429; 
 Thu, 26 May 2022 11:21:47 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a05622a1a9600b002f39b99f69fsm1395859qtc.57.2022.05.26.11.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 11:21:46 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: wm8962: Fix suspend while playing music
Date: Thu, 26 May 2022 13:21:28 -0500
Message-Id: <20220526182129.538472-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: aford@beaconembedded.com, Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 Mark Brown <broonie@kernel.org>, Stephen Kitt <steve@sk2.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Adam Ford <aford173@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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

If the audio CODEC is playing sound when the system is suspended,
it can be left in a state which throws the following error:

wm8962 3-001a: ASoC: error at soc_component_read_no_lock on wm8962.3-001a: -16

Once this error has occurred, the audio will not work again until rebooted.

Fix this by configuring SET_SYSTEM_SLEEP_PM_OPS.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 34cd5a2a997c..5cca89364280 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3868,6 +3868,7 @@ static int wm8962_runtime_suspend(struct device *dev)
 #endif
 
 static const struct dev_pm_ops wm8962_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 	SET_RUNTIME_PM_OPS(wm8962_runtime_suspend, wm8962_runtime_resume, NULL)
 };
 
-- 
2.25.1

