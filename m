Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF464C4639
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:25:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A92501F25;
	Fri, 25 Feb 2022 14:25:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A92501F25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645795555;
	bh=9sj38r/7UA45IGeCojNi8Qm+h97XHRF7yre6PRUC4xE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mBrljJizGR8dxp8zrGYhlOWzo5laf35jBnBIE7aTbqDY+k3Mymy/qsQMR5EUek++1
	 WGOAnIDfV9BZu2lTNPOZO8xBiOkno1lQ1nlEfuV+x99vDc/p/5guSojT1GlYc0D3M6
	 yqeAl6BgjXNdrD0TiKCx0qCyszjgv2oTXfrBkjRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71D6EF8051F;
	Fri, 25 Feb 2022 14:17:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EACD2F80511; Fri, 25 Feb 2022 14:17:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C9D1F80515
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 14:17:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C9D1F80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TilwzgfH"
Received: by mail-wm1-x334.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so1661223wmp.5
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 05:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=XTcx6NA+RQ7MrRz6erOyIo9MPO/gFX50RVxH9xCKjl0=;
 b=TilwzgfHDxKOx/pX82iJYs6OJLFY4UDPTF+ZYP5IKGPFUaMDON+xOE0825j7T9YE8X
 a2R9Uxm1yhjJl5IG/6s0fvarQFcsIb4HW5dhmafsqg/OuXWuKy5X5xNiLWUIoe3kBHDx
 eVDb8sXoTuqdkn3fdcgNtHrvjBTXJq6+YNK8RHzhi8bRYJkNguNTDu6n7TO4pPQ0JyIL
 uMbw2Tijh0n2PvZqsZFkxG3Byg1nQpSdBkH5DlKN2sbGMyOgfjCU5v94XL5DDM9kgeJR
 y6H1M4dqSGcHjiIE4fSO9NiZakN559mhIgmE98QRnZtf6F77dQ/ubEYHDsWurek925wt
 FZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=XTcx6NA+RQ7MrRz6erOyIo9MPO/gFX50RVxH9xCKjl0=;
 b=M/CcTruiQNPxC6EgravEXb+W8mueXf/JFQfFX979RzqPVV919oKqVFO3rnD/AJldJO
 10Ur+qu96QWTml0CDJ6804IHMW4UlCRpNRhosHZ20akYJ4BAjgusiwsi1wsPdJtyHOko
 YN5IfWxCs3nCQZeDrHEQc2VU8KE7wC9xRhDlhWeh7A9GCKIucyhtgDugMl5q+iGl38Mf
 NrR6g8tPEiXBIKvNvqjU3CyIMjBKkfbS0tPDtzNyHVGBE+plr3JWDcWdeigq+vmoOBc+
 U2KMk7KTc7BWbMbuKfcqGZBGC77DW2LDMP/3ipQLhpeK/Pj+SQD+0OYPeGqD/9jt8pCz
 KWXQ==
X-Gm-Message-State: AOAM533Riat95PylNdBrU0eyOyAKltVzCvFvFNLXaEJ+uOZ+Q22DLssL
 eVyZSnnw87m6nlm1b5ePvsE=
X-Google-Smtp-Source: ABdhPJxAYkjJ40G8FdiQzxsRqYdXyS40BfhXptDhQECQEq3ENt/7NSjM/te1yvnNMfubRDVpAY9fPA==
X-Received: by 2002:a7b:cd96:0:b0:381:201e:ba06 with SMTP id
 y22-20020a7bcd96000000b00381201eba06mr2739917wmj.78.1645795027288; 
 Fri, 25 Feb 2022 05:17:07 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.58])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a1c7503000000b0038100e2a1adsm2399355wmc.47.2022.02.25.05.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 05:17:06 -0800 (PST)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 AjitKumar.Pandey@amd.com, vsujithkumar.reddy@amd.com
Subject: [PATCH] ALSA: acp: check the return value of devm_kzalloc() in
 acp_legacy_dai_links_create()
Date: Fri, 25 Feb 2022 05:16:45 -0800
Message-Id: <20220225131645.27556-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, Jia-Ju Bai <baijiaju1990@gmail.com>,
 linux-kernel@vger.kernel.org
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

The function devm_kzalloc() in acp_legacy_dai_links_create() can fail,
so its return value should be checked.

Fixes: d4c750f2c7d4 ("ASoC: amd: acp: Add generic machine driver support for ACP cards")
Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 sound/soc/amd/acp/acp-mach-common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index cd05ee2802c9..5247015e8b31 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -556,6 +556,8 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		num_links++;
 
 	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) * num_links, GFP_KERNEL);
+	if (!links)
+		return -ENOMEM;
 
 	if (drv_data->hs_cpu_id == I2S_SP) {
 		links[i].name = "acp-headset-codec";
-- 
2.17.1

