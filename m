Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4D820A226
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 17:38:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 485AF18FD;
	Thu, 25 Jun 2020 17:37:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 485AF18FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593099507;
	bh=l1GLlwn24ElrzRgS2/l9FKxYLhWc07dos496Wz8Arho=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OmjgfEaKfuAgmXgIdJzqvTJoz8rzd63atcjS3PIppzSQkK7zPDjCBMzW4++eYkYJ1
	 wfDilFWs7MEwVGH2DqOl40meRgeAOMHM26rNf82tr62hS/cBT9ImQdqYOKbi1/XvDd
	 R/8vtkG0hT7LEbZlNl3LBuLyJ0yNW4YevTBAyy5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74D9FF80158;
	Thu, 25 Jun 2020 17:36:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E89FF80259; Thu, 25 Jun 2020 17:36:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63EB0F80234
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 17:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63EB0F80234
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="T9dcF8M+"
Received: by mail-yb1-xb49.google.com with SMTP id s7so6305703ybg.10
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 08:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=dbGI7v9rzg/Ac7uwlTJsLHWm06iT1PR6qePnkUIC9XA=;
 b=T9dcF8M+YccA4Bnlvh4rBbTe+LGEddNeoc9rJUWs6GLzXbxBZ5NbGBRJTcBMtbNegH
 E2i5ojBn4GMnaSAQHzc6gpOsdJVuisBORihCnQ9jF5/LpPkLEhEbXPrCTdGIPhlJRMEC
 TBJi6iLAqxY6vwtKLa8/cXCu9IFcyFyGIAzO2EzQ3Bk1yPtM7LGVoXjWFZErH03T596L
 g4pnQh4HdWDAWRqf75f1TyNIvN9qs2rjRm1ects6Ex32Ny0oNqLtq57Eex22RiVLwmrb
 Js+A2dcxPGAfPBXXFkf3KgwzG3W/gyWMcyLcAf0qpe8Cn2+R5EwvQdoaoGrfqQVYwbpM
 AULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=dbGI7v9rzg/Ac7uwlTJsLHWm06iT1PR6qePnkUIC9XA=;
 b=XZr/eu8kIacQQ6+7KcWMf48Kk5fhI7CJrDWZeOr35CNSEFKLPujnn1bN0QJU334ztm
 ifmGlLcf2pBfe/C745nIJ8VMSDGWGmKObSDaYlb0UF0tzHgf6Gh7XfIObqoewPLmQ8Ds
 glm0ScnJO8MNwMsfQ22FrSryHuc6F4FPxHQ4aV3RrIYU5YB/vv1yUXo0KubVO9pxM6ld
 ynsy8NeJa2SGaNN56zk/LjQAWOAVRaVBwvKP7fIbJK/jQy3elGldrx1HzvAjm0878LD8
 P9mdYtp+h0paRBCtS3RzSsrG/9+QKDu9uN4BlYuY5T6TQoWd13FksSINlL0Hud0oo4Zv
 HfYg==
X-Gm-Message-State: AOAM530vpbtJotOlazlGDftQEFhuYgDu9yZGWZajRpBvq4+1XgXOE9oo
 +QzUXYT+gweniGYvw2BDr05i8VoYsqqd
X-Google-Smtp-Source: ABdhPJzgR0jm3M2pJ8FWv89j3WkCT1Y2LQKWLnM5V+nQ3jpXXF8+NUr8PvJs6AJ5Wyew+OsnB3plQQsMs+Of
X-Received: by 2002:a05:6902:4e9:: with SMTP id
 w9mr52565520ybs.311.1593099357573; 
 Thu, 25 Jun 2020 08:35:57 -0700 (PDT)
Date: Thu, 25 Jun 2020 23:35:41 +0800
In-Reply-To: <20200625153543.85039-1-tzungbi@google.com>
Message-Id: <20200625153543.85039-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20200625153543.85039-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v2 1/3] ASoC: core: move definition of enum snd_soc_bias_level
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

To fix compilation error:

- error: field 'XXX' has incomplete type

Moves definition of enum snd_soc_bias_level from soc.h to soc-dapm.h.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 include/sound/soc-dapm.h | 18 ++++++++++++++++++
 include/sound/soc.h      | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index cc3dcb815282..75467f2ed405 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -376,6 +376,24 @@ struct snd_soc_dapm_widget_list;
 struct snd_soc_dapm_update;
 enum snd_soc_dapm_direction;
 
+/*
+ * Bias levels
+ *
+ * @ON:      Bias is fully on for audio playback and capture operations.
+ * @PREPARE: Prepare for audio operations. Called before DAPM switching for
+ *           stream start and stop operations.
+ * @STANDBY: Low power standby state when no playback/capture operations are
+ *           in progress. NOTE: The transition time between STANDBY and ON
+ *           should be as fast as possible and no longer than 10ms.
+ * @OFF:     Power Off. No restrictions on transition times.
+ */
+enum snd_soc_bias_level {
+	SND_SOC_BIAS_OFF = 0,
+	SND_SOC_BIAS_STANDBY = 1,
+	SND_SOC_BIAS_PREPARE = 2,
+	SND_SOC_BIAS_ON = 3,
+};
+
 int dapm_regulator_event(struct snd_soc_dapm_widget *w,
 			 struct snd_kcontrol *kcontrol, int event);
 int dapm_clock_event(struct snd_soc_dapm_widget *w,
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 33aceadebd03..6791b7570a67 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -368,24 +368,6 @@
 #define SOC_ENUM_SINGLE_VIRT_DECL(name, xtexts) \
 	const struct soc_enum name = SOC_ENUM_SINGLE_VIRT(ARRAY_SIZE(xtexts), xtexts)
 
-/*
- * Bias levels
- *
- * @ON:      Bias is fully on for audio playback and capture operations.
- * @PREPARE: Prepare for audio operations. Called before DAPM switching for
- *           stream start and stop operations.
- * @STANDBY: Low power standby state when no playback/capture operations are
- *           in progress. NOTE: The transition time between STANDBY and ON
- *           should be as fast as possible and no longer than 10ms.
- * @OFF:     Power Off. No restrictions on transition times.
- */
-enum snd_soc_bias_level {
-	SND_SOC_BIAS_OFF = 0,
-	SND_SOC_BIAS_STANDBY = 1,
-	SND_SOC_BIAS_PREPARE = 2,
-	SND_SOC_BIAS_ON = 3,
-};
-
 struct device_node;
 struct snd_jack;
 struct snd_soc_card;
-- 
2.27.0.212.ge8ba1cc988-goog

