Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F92B15D62B
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 12:01:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18578166D;
	Fri, 14 Feb 2020 12:00:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18578166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581678071;
	bh=uW9TwTn1d/zZIQnjjklHCu/pqW6VeZt3OvuEvbcPfKU=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A1hHfByLv4Mri4Exy6T7L6X8qaICKMAOfgaai0K/TG3B4zlgdw4xXFVzVElmZdn8K
	 TwKser4FASROklAymQzT0G3/IbtY2tnKZyWAUE7iZGUybXkLS0Babcm8HxRXFgg/gZ
	 Y3PRaZuTuH1PUTHo53iTpcyeYeMT494XEzepZWwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A176EF8028A;
	Fri, 14 Feb 2020 11:58:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95FE9F80264; Fri, 14 Feb 2020 11:58:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB120F80228
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 11:58:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB120F80228
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="q8Xf9qYf"
Received: by mail-vk1-xa4a.google.com with SMTP id m25so3113706vko.19
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 02:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=qRbhZrsAZm5k7FD90nNF8p49Ej2mrtuvNIQ+TfD2vY0=;
 b=q8Xf9qYfXPo97Tzx5dSM3/i3OkzqjXF489y4VcDyluNeqZBDILtYzuYsz9kuBAKe+Z
 oqEWMJGoaAIRZ6qrxu/qKj6LvE65Qck2ZL/Nq5zFoN7oBpxbg/bmn6ll3j9C1tjY9VoU
 aktATvjdAJoAB5cW42Ve5gEAXQLlCY9MtayU8SO0th/rZ4Pe+zRDteiO2Wj5rVNSJpe2
 1zTI4APhj76XehVSEDBnQiqVN3r8+RWEgGa9MKZ1An8DbcvgJiDm2dL1ZY/N0cyo07oR
 q0kAOaPAcO2Xj5A6non9RbhUFOC9/AvxDJXb6GH97JZLjhoeAYREijU+M3DJhrYeCybc
 2nGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=qRbhZrsAZm5k7FD90nNF8p49Ej2mrtuvNIQ+TfD2vY0=;
 b=AszYiSzUp5Cr0cpTxSOsQ/bzkjCmBY9Pm41BauesPqTCrHR8GrCOeucVGSv2dMmdvb
 W2rpqFPp7VfZRaQxtAGlXbEaecVij+HEdagxUZlKqtYOk+cdtryYjD7OjFrgLdgfFq1h
 qHx2ny7QBGmGnVSyn06RTukPaPDcEpWhp7VWftFlR5axOAG2BzZqMwuhjaJITkfGe/tv
 z689PQCMIQp66flL6DLCAftTPvcixRe8FXXHA2kqc88RuAAWEUbRR38iQJzBzK48HLyI
 /so0p+AphtrlGrUr31kpg9DQbDgZt+CmerV6a12Xmu9EtsciRIt63fbz/A+NRwK0GUwO
 e66g==
X-Gm-Message-State: APjAAAU81J/FZOS8LTMRvOnH1UhbwnC71S/Hmv0Nal2pw9w5pG57k4vj
 Kc3QunCTUELYpBAOtqU26kSPqgQfYzqL
X-Google-Smtp-Source: APXvYqw5oQS4tQYHoJdrM9ZmIReivHgBVQbOooZq+pGcKbh9f6iP2qWJ/9NXNh9HlXhtFc3l/A7RjmB5o7Q+
X-Received: by 2002:ac5:c1c7:: with SMTP id g7mr1296672vkk.97.1581677881824;
 Fri, 14 Feb 2020 02:58:01 -0800 (PST)
Date: Fri, 14 Feb 2020 18:57:43 +0800
In-Reply-To: <20200214105744.82258-1-tzungbi@google.com>
Message-Id: <20200214105744.82258-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20200214105744.82258-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 2/3] ASoC: dapm: remove
	snd_soc_dapm_put_enum_double_locked
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

Reverts commit 839284e79482 ("ASoC: dapm: add
snd_soc_dapm_put_enum_double_locked").

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 include/sound/soc-dapm.h |  2 --
 sound/soc/soc-dapm.c     | 54 ++++++++++------------------------------
 2 files changed, 13 insertions(+), 43 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 9439e75945f6..1a9c5dd40228 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -392,8 +392,6 @@ int snd_soc_dapm_get_enum_double(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
-int snd_soc_dapm_put_enum_double_locked(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_dapm_info_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_info *uinfo);
 int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 3c8af7b26fc2..34c832686637 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3437,8 +3437,17 @@ int snd_soc_dapm_get_enum_double(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_get_enum_double);
 
-static int __snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol, int locked)
+/**
+ * snd_soc_dapm_put_enum_double - dapm enumerated double mixer set callback
+ * @kcontrol: mixer control
+ * @ucontrol: control element information
+ *
+ * Callback to set the value of a dapm enumerated double mixer control.
+ *
+ * Returns 0 for success.
+ */
+int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
 	struct snd_soc_card *card = dapm->card;
@@ -3461,9 +3470,7 @@ static int __snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 		mask |= e->mask << e->shift_r;
 	}
 
-	if (!locked)
-		mutex_lock_nested(&card->dapm_mutex,
-				  SND_SOC_DAPM_CLASS_RUNTIME);
+	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
 
 	change = dapm_kcontrol_set_value(kcontrol, val);
 
@@ -3485,50 +3492,15 @@ static int __snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 		card->update = NULL;
 	}
 
-	if (!locked)
-		mutex_unlock(&card->dapm_mutex);
+	mutex_unlock(&card->dapm_mutex);
 
 	if (ret > 0)
 		soc_dpcm_runtime_update(card);
 
 	return change;
 }
-
-/**
- * snd_soc_dapm_put_enum_double - dapm enumerated double mixer set callback
- * @kcontrol: mixer control
- * @ucontrol: control element information
- *
- * Callback to set the value of a dapm enumerated double mixer control.
- *
- * Returns 0 for success.
- */
-int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	return __snd_soc_dapm_put_enum_double(kcontrol, ucontrol, 0);
-}
 EXPORT_SYMBOL_GPL(snd_soc_dapm_put_enum_double);
 
-/**
- * snd_soc_dapm_put_enum_double_locked - dapm enumerated double mixer set
- * callback
- * @kcontrol: mixer control
- * @ucontrol: control element information
- *
- * Callback to set the value of a dapm enumerated double mixer control.
- * Must acquire dapm_mutex before calling the function.
- *
- * Returns 0 for success.
- */
-int snd_soc_dapm_put_enum_double_locked(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	dapm_assert_locked(snd_soc_dapm_kcontrol_dapm(kcontrol));
-	return __snd_soc_dapm_put_enum_double(kcontrol, ucontrol, 1);
-}
-EXPORT_SYMBOL_GPL(snd_soc_dapm_put_enum_double_locked);
-
 /**
  * snd_soc_dapm_info_pin_switch - Info for a pin switch
  *
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
