Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4386E2D32D1
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 20:54:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5F3A16F2;
	Tue,  8 Dec 2020 20:53:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5F3A16F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607457259;
	bh=VVH6ml/t5xLhH8NBsyBnyAwIepioHzcCiJu3X+kkoSM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d9UlIGF69E2/8FWnlK7mLwFVVqpyItxU1L7P5hKiSBCDE7XJt6TUYT1keMWlnydRs
	 5MSu/5rcNqzcPVZI7Fmr3pDGDYIl2WwkFmYizMRM5qJR6ExEac3dQ/9gReyTyv7ft6
	 7cqCHfYlh8K2DCSj8ocgeF0tiORhK78YqQ40yeVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E744F80269;
	Tue,  8 Dec 2020 20:52:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC18FF8025A; Tue,  8 Dec 2020 20:52:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EECFF80164
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 20:52:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EECFF80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="G9oBrHcR"
Received: by mail-qk1-x741.google.com with SMTP id b144so17073625qkc.13
 for <alsa-devel@alsa-project.org>; Tue, 08 Dec 2020 11:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=152BxGF2Vf3o7ouLnSNnkB/czUx41j3NRQWNvs5OtJk=;
 b=G9oBrHcRh1mT7t67YPd6k3JYk+wl+OPm/+E7tUn8hwTmHD3ntCavAw1162Lb3a0fiO
 GckqZGHeaCtTlAbwF0Vkjr7d7lLKwTCFKIXXkIOaq2YZuFdsEA26c4geckClVC++36yH
 YE647Vv7Yyn0z0EAnOh8Ag3kpK85OJphMXbu6Q6ZTZqLSurVEIGZHuTXc5nMVMewE0Of
 7UArXNhpTnUCt0UPhCuyGb86uuD2kNo8jLVIeLJqvj+frtIyaaqMlQxDYPs5AHoswhgW
 M3ZjfwYOM1xuEcSXJzZoDyJqeldfb7Pxq1m6zKQBwiRYpCTJ8PMQprrfk5NH7R9IpMTy
 TYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=152BxGF2Vf3o7ouLnSNnkB/czUx41j3NRQWNvs5OtJk=;
 b=mQQgcAGcP70NarmbkvEhzchle4WoLq4VGptAlOPdVJt8SSKWqdLvcmXu3JKsJj0uTz
 R673v2IbLSa1R5SZrnsl62thvjyQ2RiotF+X/SkYuqoEMdjQSbHAvA9CwKnrM7FL9WBk
 OO4IFEaxDBUZUdBSwwbYI4WohJiFaPPvcPpLTsJjiK9D/n2bhc8Y+EIJuccSjFKyKPb+
 2qKHaa+uo6e4cq+RdBvKC46sBqYJ+p5EJOv8aASB5OiP9OFLYX4AqlXMwT9wx83OZNmI
 LdVO3V79qjx2gi3B9SL9c5vNBdWBhpHqiZdDe2sZHqtnjgNGLj/yLiFx1Zi7kMLVPhuC
 FN2Q==
X-Gm-Message-State: AOAM532RuGy5Db2n80Xg2mtZsIv9wK6lBb698ua6R7CqG6VTRA2IfXYX
 Me/ZW1XO8hJin8tYLjl9byoZ+r8kCjk=
X-Google-Smtp-Source: ABdhPJzuabtNUb4lJMygzpgxUHWosGtj/6u3mCMQlUsirxMgKnElMjVa+50EoV2oxQml9YDRALeiKA==
X-Received: by 2002:ae9:c01a:: with SMTP id u26mr10232124qkk.372.1607457152391; 
 Tue, 08 Dec 2020 11:52:32 -0800 (PST)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id x24sm14169458qkx.23.2020.12.08.11.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:52:31 -0800 (PST)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH v2 2/3] ALSA: hda/ca0132 - Change Input Source enum strings.
Date: Tue,  8 Dec 2020 14:52:21 -0500
Message-Id: <20201208195223.424753-2-conmanx360@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208195223.424753-1-conmanx360@gmail.com>
References: <20201208195223.424753-1-conmanx360@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, conmanx360@gmail.com, stable@kernel.org
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

