Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 966BF5BB6DF
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Sep 2022 09:10:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 239CB1ABB;
	Sat, 17 Sep 2022 09:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 239CB1ABB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663398607;
	bh=0qLuudgAOfsr+3eg7v2AqEjfbemVfK/AqOz/HCIenyQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ejKyElR6myDjQR+30z0aGxGBjj0jy/mndb95+0I7a/mCdENXJiPXXF6BJ9rMz2tkO
	 LEVONJWYMUWCQ9voUtsrDz7k05Z3y3uiBDUjM+S3CYxrTAEf1EJoFyOrQ/WvPKPKWS
	 Uhlo0LaWc3glb1v3pCejCEvA1zpxnNDuk1Zj1yo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75742F800E9;
	Sat, 17 Sep 2022 09:09:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 417A9F800E9; Sat, 17 Sep 2022 09:09:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88C3CF800E9
 for <alsa-devel@alsa-project.org>; Sat, 17 Sep 2022 09:09:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88C3CF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jl57GmpM"
Received: by mail-pg1-x529.google.com with SMTP id t65so22333803pgt.2
 for <alsa-devel@alsa-project.org>; Sat, 17 Sep 2022 00:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=KhFRhgM5kcJii5PkpIG1m9lYD4ttCdbZZRfGcZawQi0=;
 b=jl57GmpM3wt+pgRYXfGkE5h2IW4F3V7ns109ewy+zAviiVkhQQg8CEnaqJwCBSw3Nx
 2xMOsfyCXjioQP2AEjVRaC//bTuW2nD/Dsp4OBAnKLGUKARLLaTUktA0c3tmbYpkvU2x
 fyg88sJ+cHt1qMwX7IgNkiiVdfK6ggFquKmitEno+NXrw6Qu1jKWQNCDIg0TUBaO45Kw
 0sQa5K62yRSLRk8n6X4zhZwGZklRYX9KSLrSg12zABUKJhqPsCY0O9bnUQT5xu2+M7Ea
 E9Z8v+PCTubV8XNnOv/XAYaSr4YYB07T+EyAzDR/OhD0czGPH13xJ0p3cl9TYU44l7Up
 JfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=KhFRhgM5kcJii5PkpIG1m9lYD4ttCdbZZRfGcZawQi0=;
 b=6CcbP19/611AcoTuI1jF4RJQPus9qO2eyWaNQjNBvcPfOr3X/zIs7XlAKdIxPtuGSs
 UIFgmazR5CXDHoUUb7M2rPBGgWz2lYXKG/0vZF13d5UCovKQMMVTk2iHV5MHALLhSh8Z
 PRdA/iKz43Mmr80+mQs8NJlkMXfYtR+xUtMvQxWUOXfPSNsKubDfRgYuRRn+5I0DlPsI
 4bXlXK0XiC/ujB+ECbvkVanKCykf/cigTDo0cq5vKzACFBsOxigCJ8Styowd5AVTvkFS
 qMpU025yCBb0X3G7trQM0bnG8Ahd2bRFr1hHXAid2WdNcu8WAaYqcXe8yRS9c1q7/OJd
 3M0A==
X-Gm-Message-State: ACrzQf3WMbk6W/IOhxeNNaPKTHZDUba9uQI20T2TuVLV+26XYO7LAYvR
 KxWM6klh1/YfpckgHH3AsC0=
X-Google-Smtp-Source: AMsMyM6hR9HFU4VbuQiG+7fkKsfvxgEqXLckbx5FAJD3i1VUnC21/8JGzm8RoX5JbEa5lziPu1tAXw==
X-Received: by 2002:a05:6a00:1945:b0:541:bdab:17c4 with SMTP id
 s5-20020a056a00194500b00541bdab17c4mr9148873pfk.77.1663398538286; 
 Sat, 17 Sep 2022 00:08:58 -0700 (PDT)
Received: from localhost.localdomain ([104.251.239.243])
 by smtp.gmail.com with ESMTPSA id
 y12-20020aa78f2c000000b0053e78769470sm15736959pfr.88.2022.09.17.00.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Sep 2022 00:08:58 -0700 (PDT)
From: Xiaoyan Li <lxy.lixiaoyan@gmail.com>
To: mario.limonciello@amd.com,
	alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: amd: yc: Add ASUS UM5302TA into DMI table
Date: Sat, 17 Sep 2022 15:08:47 +0800
Message-Id: <20220917070847.14346-1-lxy.lixiaoyan@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Xiaoyan Li <lxy.lixiaoyan@gmail.com>
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

ASUS Zenbook S 13 OLED (UM5302TA) needs this quirk to get the built-in
microphone working properly.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216270
Signed-off-by: Xiaoyan Li <lxy.lixiaoyan@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index e0b24e1daef3..5eab3baf3573 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -171,6 +171,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21J6"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "UM5302TA"),
+		}
+	},
 	{}
 };
 
-- 
2.37.3

