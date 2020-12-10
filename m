Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2DB2D63BA
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 18:38:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 083E51683;
	Thu, 10 Dec 2020 18:37:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 083E51683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607621883;
	bh=aaaJJpoSIlNSBJ9c7ryHxSBWXFTJbdhXaH2+bxbVIa4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SUsNhcLXc9x8fYUN4kCfmSR2CCCXeXK0cZG+/btm2vsxjn+gItZDCnte5sRa+jqp5
	 UZhYgwTKv61aPu4xyY07B1E7IF11cSYCAZRSwgC0Zu/irQIssuNKFF1x16rqQq2rm3
	 2b5IRl+FQXeuSuQcYCZTUOnI/Wm7sZC1a85OhwjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 643FFF8025A;
	Thu, 10 Dec 2020 18:36:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48370F8016E; Thu, 10 Dec 2020 18:36:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10896F800EF
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 18:36:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10896F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vAgVp1+o"
Received: by mail-qt1-x841.google.com with SMTP id 7so4282796qtp.1
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 09:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a32EDPT0HiSshwPUiInSLeo1VMTztMu1/h3zf9c4rCk=;
 b=vAgVp1+oGbgVti+8JZI818tBmYOr3pN2SjzOdz5eVqGJ9o01YtOg7qhTuozB9/AEhi
 NdhSEFfUtd1fLKGD+ciOmc9O0ucb2JjZSCSKUZ2j626atG313Mp70LXpfFLi5wqSj7Dr
 5YeqVTaW6mnQuBGqL7Fa6PjbSJlOimtoa1wrbVh9+JfC6AMl0daifmY8S8SaHDBX4/72
 ARraR4V9zmvGyA2IP9SKnwzg1rnv914IUaRtqwVmm7I3a6pjeu2FzTQBm1pQET+pOwcF
 zmLsgAch9fiA2l8yIVMkyiDzC7ikqufnmKXLQTy2gEKniJQAS6hwni5m+A1LXFMQ7slv
 Ak+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a32EDPT0HiSshwPUiInSLeo1VMTztMu1/h3zf9c4rCk=;
 b=LIAHid8Z8pObwejqLDO8aNexGP7tO5nUNNzfQmoo7lqSF7KYLhQWyZPz1sewpg0KBv
 /fi7Ab3arOMmOEdk1YRVuU+v1XMbETaeY5wEpqGN2XeX8u1q0QA9lmNqblCnYFkh40UL
 xz72bT8WsUxO7FhY9S2tMVjvC+ViTNVrb3Wh2pvLLiLlWPMFIouvxS8RLGOjJJjwcEvk
 5u2bJShzQ4ElOCt5NMAztdjZBpPvp0zX+MNUfyG1IWq+BmOiOdyjb4cGPGNDAAXzjecM
 xhJSjMMMkSYOTgichuCmEZE8F9tDng9yofuG3kUuyQRfz3M4MNfaga45VSBGw1GTH8DU
 qaOw==
X-Gm-Message-State: AOAM530Hdm8Cl0vng8QA7w7/escen1UL5dv4NZwwi5q3Lrt6tcCQk4FL
 3kJpB8VIs3FrXCDZNnsMKF4=
X-Google-Smtp-Source: ABdhPJzzbRklBMVNX3N8A5CZObPBV4DmOcB/faCnReSklfjwUlY7uGchAoZBlqC9OsIy76DOGhJ3fw==
X-Received: by 2002:aed:30d1:: with SMTP id 75mr10610494qtf.61.1607621767103; 
 Thu, 10 Dec 2020 09:36:07 -0800 (PST)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id y22sm3886786qkj.129.2020.12.10.09.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 09:36:06 -0800 (PST)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH v3 2/2] ALSA: hda/ca0132 - Change Input Source enum strings.
Date: Thu, 10 Dec 2020 12:35:49 -0500
Message-Id: <20201210173550.2968-2-conmanx360@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201210173550.2968-1-conmanx360@gmail.com>
References: <20201210173550.2968-1-conmanx360@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 conmanx360@gmail.com, stable@kernel.org
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

Change the Input Source enumerated control's strings to make it play
nice with pulseaudio.

Fixes: 7cb9d94c05de9 ("ALSA: hda/ca0132: add alt_select_in/out for R3Di + SBZ")
Cc: <stable@kernel.org>
Signed-off-by: Connor McAdams <conmanx360@gmail.com>
Link: https://lore.kernel.org/r/20201208195223.424753-2-conmanx360@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_ca0132.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index e96db73c32f5..793dc5d501a5 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -95,7 +95,7 @@ enum {
 };
 
 /* Strings for Input Source Enum Control */
-static const char *const in_src_str[3] = {"Rear Mic", "Line", "Front Mic" };
+static const char *const in_src_str[3] = { "Microphone", "Line In", "Front Microphone" };
 #define IN_SRC_NUM_OF_INPUTS 3
 enum {
 	REAR_MIC,
-- 
2.25.1

