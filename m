Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EE4123E15
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 04:44:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9DD685D;
	Wed, 18 Dec 2019 04:44:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9DD685D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576640690;
	bh=k4pkpjWomB59Hqay2x2X7IhrqyyhCvjcZmYG8zJjKZ0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MwZF+ErZt0Yfa7lutsMhvWyYxKTTSnm/2eUrQ+qJoVeP9+oAr9587BFzMisbCOLyR
	 1plwu0m1uRLL0+beZcygrcze6spFiHq44VbzPsbS+88oU/z1RKPEYPfCDq7Promfmw
	 joVCL73Ddr69w4ma2fcXiP7cIw6ZfcmdMG0AWF5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4AEBF80255;
	Wed, 18 Dec 2019 04:43:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C846F8022C; Wed, 18 Dec 2019 04:43:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFB8BF80059
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 04:43:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFB8BF80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZAJg/Vsf"
Received: by mail-ot1-x344.google.com with SMTP id k14so628687otn.4
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 19:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DTLHJB/iUcLDfSNgBM/rRd3/H05ShntwvWDkcVOuP88=;
 b=ZAJg/VsfqHfAuA79L5vD2Ey6OpHmmoZSS1dDrf4XEoZWod53aC9rF4y45Noqua0A50
 LtZYqDB1iJt43WO4BjCyodOhPdraBw3odtu8MA7i/A9qpySPvR3hHf5uOvjBRLlHGYIV
 FQ4Jt6o80x4l2JzqJRF/DluvbyOVLjOqSMwTbhtmEnCEeMRMrr6YoPZerrCrISuzJiBS
 dcBhss7gTBIZyUz5WFFN3XvcSf/LhG9NKm9SQDFM/mLlGld5HAVcTpZZU9ZF241lawy0
 MNoTo6uE1F26dNLh7GEKt+gPQOdXQPY459Im7iTHCyXLhlo/V+zSN7Fhl1o60v/n1Jm+
 swrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DTLHJB/iUcLDfSNgBM/rRd3/H05ShntwvWDkcVOuP88=;
 b=JY1pbVEqdpYEpWFdoN17Q2VPfPp99qZBZTkzo+UCMpZDncBLVl8+IcnPP9G7dCk4iJ
 y1CJKQSgrI0ZxwfL2Xdm013B4oivxkVdGVNbqJEszuTBAi/gm7Z/ocPoJnzOFU+06UIz
 r24O9OcNrsuCw5TGuX/OkfU1UogCXgY7H58RXunFnLLlLJ4hayFKfcemHPtGhpPZyofx
 V2rt3ot6s45NDMxGR0a3EHH1h9c8adXS34yJUOuBGthkpFnkZboLrzzE5o0CUswfU5LH
 7mi73khN+16MRrEYzvUVrNYcmLPBYIN3MWa5ucb6mJrwa50L+VWoFFk+TLzcc93MZ96H
 b7RQ==
X-Gm-Message-State: APjAAAVz6WXmIZ1Eo6XCFweodroU2bCZZLTfyQ8OQpNkb4Nu7TV7WFNg
 CKPqIBNwJFwBdMTrDhqAd9w=
X-Google-Smtp-Source: APXvYqyWkKYiPX0Oalp+GwJKtbJm7N+/LKAcXm06U7mnzZIJAM/DsOUTb+h0bjkHM9vDH2c+qw6uiA==
X-Received: by 2002:a9d:2264:: with SMTP id o91mr236481ota.328.1576640580929; 
 Tue, 17 Dec 2019 19:43:00 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id q1sm358262otr.40.2019.12.17.19.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 19:43:00 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Date: Tue, 17 Dec 2019 20:42:57 -0700
Message-Id: <20191218034257.54535-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 clang-built-linux@googlegroups.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: usx2y: Adjust indentation in
	snd_usX2Y_hwdep_dsp_status
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

Clang warns:

../sound/usb/usx2y/usX2Yhwdep.c:122:3: warning: misleading indentation;
statement is not part of the previous 'if' [-Wmisleading-indentation]
        info->version = USX2Y_DRIVER_VERSION;
        ^
../sound/usb/usx2y/usX2Yhwdep.c:120:2: note: previous statement is here
        if (us428->chip_status & USX2Y_STAT_CHIP_INIT)
        ^
1 warning generated.

This warning occurs because there is a space before the tab on this
line. Remove it so that the indentation is consistent with the Linux
kernel coding style and clang no longer warns.

This was introduced before the beginning of git history so no fixes tag.

Link: https://github.com/ClangBuiltLinux/linux/issues/831
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 sound/usb/usx2y/usX2Yhwdep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/usx2y/usX2Yhwdep.c b/sound/usb/usx2y/usX2Yhwdep.c
index d1caa8ed9e68..9985fc139487 100644
--- a/sound/usb/usx2y/usX2Yhwdep.c
+++ b/sound/usb/usx2y/usX2Yhwdep.c
@@ -119,7 +119,7 @@ static int snd_usX2Y_hwdep_dsp_status(struct snd_hwdep *hw,
 	info->num_dsps = 2;		// 0: Prepad Data, 1: FPGA Code
 	if (us428->chip_status & USX2Y_STAT_CHIP_INIT)
 		info->chip_ready = 1;
- 	info->version = USX2Y_DRIVER_VERSION; 
+	info->version = USX2Y_DRIVER_VERSION;
 	return 0;
 }
 
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
