Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5324A2E42
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 12:34:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CA4F174F;
	Sat, 29 Jan 2022 12:33:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CA4F174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643456062;
	bh=Fdb6zHI7/feO1GFHbA2vb1A18IRdXY3QBaKZ+qQyHRU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mmXL3ruQak9d9f9drW72Vp9hfeHUBFKX6jDaX5dL1Vh7d5AjAnLCCilz4x4pkc8bo
	 TunjMn6KNw40lhw/QrOleFAgUuJSMduB1JUlXzSB1edIxyONbWQ9cckEU/278QqYPW
	 tWpcWU2aFS8G+7mydIMmA5jFzV8y1x4IX+F/s8Dg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9BB4F8023A;
	Sat, 29 Jan 2022 12:33:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C92D0F80212; Sat, 29 Jan 2022 12:33:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFF06F800E3
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 12:33:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFF06F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EnyQs4WG"
Received: by mail-ej1-x632.google.com with SMTP id ka4so25260368ejc.11
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 03:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J8cMBHSadmZr4dAO9qcJpmYsyYRstSSExIKtSE84QP8=;
 b=EnyQs4WGRqih35lUeR49tKcVZtbKi+1TmEz63Zob6D3Lvo2W66TaVKGPjrRYcCK+hh
 dJQzzD3682Z6ZVDFo9g00eTWaTsCD2IEBqfkk5NIsCCFzvAuJQq729sScFrFMTaJqkyj
 TpGCy6glOy1okwnYhh2/WCRM0IOV9GU1a+kav65aa0jxjPrRFLnh7bgt+hF+Z2TWXi1u
 tGl9sy1hBZ2jA5phMp5W4nmNO1/uHSXyyhO0baN2a7CLDotzdu4gvZGK1AvgBRv64gLb
 r12vMz0EAFLgSf1Sccp08aZuMevqM5V0jaw3qGIJGbW5P2et2FpD+mhmX5l6kdOCQjG5
 GU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J8cMBHSadmZr4dAO9qcJpmYsyYRstSSExIKtSE84QP8=;
 b=QwOc2uxhPbhPv9HcAwkX89gOj9sgtRl+C0TIT0XYZaZ/V2s7e+LmlSPTKwUPONTkst
 ZE8oUTP8lT4lPcE3I+NgInwMKwuuhoenCgXe8/rwrKUsM3rDlbfcu6TbEYjvg7SnKBRf
 rhYnXJqCJDThalV64GFbzpiskQHy4z2XOCWBT0FDgKX7g8lb/1k7UNruK7RtupAiW1xo
 BwTFf9mPHjQu8gJScBSexm1Mk/FMJvWK59el2z/KCiblhzo6jM71rwQfhe5d92Euir1s
 xhTHUTt5/hvfyxhAoQ5jKxfj9z/DNIBoliMrXMBtb9RhbSUBJpmk0cQzytph5UJEzZm+
 V8zg==
X-Gm-Message-State: AOAM530TwqXve2QNMuCmKQiCLGaIvrbkG9ZR5vr1wxEqfJpo6zMCtn4y
 naSkAtRrbK5PkDR72jvoL9I=
X-Google-Smtp-Source: ABdhPJx7Y+D1JzsMbkVc0vbHamUR42KtQ1jhHwAdhJ1EkQkzORMLGu59GtAmXP70NvnIvjkbWbQ+nQ==
X-Received: by 2002:a17:906:9491:: with SMTP id
 t17mr10015483ejx.339.1643455990740; 
 Sat, 29 Jan 2022 03:33:10 -0800 (PST)
Received: from cosmos.lan (178.113.77.92.wireless.dyn.drei.com.
 [178.113.77.92])
 by smtp.gmail.com with ESMTPSA id g6sm8885062ejz.170.2022.01.29.03.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 03:33:10 -0800 (PST)
From: Christian Lachner <gladiac@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com
Subject: [PATCH 0/3] hda/realtek: Add/Improve several Gigabyte X570(S) audio
 quirks
Date: Sat, 29 Jan 2022 12:32:40 +0100
Message-Id: <20220129113243.93068-1-gladiac@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christian Lachner <gladiac@gmail.com>, alsa-devel@alsa-project.org,
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

This patch series cleans up and improves my previous work for the Gigabyte
X570 audio quirks and adds more mainboards to make use of it.

Christian Lachner (3):
  hda/realtek: Add missing fixup-model for Gigabyte X570 ALC1220 quirks
  hda/realtek: Fix silent output on Gigabyte X570S Aorus Master (newer
    chipset)
  hda/realtek: Fix silent output on Gigabyte X570 Aorus Xtreme after
    reboot from Windows

 sound/pci/hda/patch_realtek.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.34.1

