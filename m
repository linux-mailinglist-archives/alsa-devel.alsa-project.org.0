Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7F614433F
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 18:31:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F5E9167A;
	Tue, 21 Jan 2020 18:30:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F5E9167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579627875;
	bh=msyoCT7SiLRRTjYp0+ST4l5yJcF8TbVrCzPsBp3SSFo=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=n/+K28ntD/9bJqE1dA7k71zCG44+Si9AKddSb/YUUCiOL9FF6XEYWclSTP0HCk9wA
	 oVJ/S2eiv0ASMlhhLOiLE50RUHbs9qvi265wR6BLeuxQ0YrxOniNIdznkBNLt6r3Vx
	 FnUZWdhgmHMmiz81o2rOKzSLkjk6R6/vElW2uuDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6686FF8028C;
	Tue, 21 Jan 2020 18:28:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D959CF800E7; Tue, 21 Jan 2020 18:28:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id A195EF800E7
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 18:28:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A195EF800E7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 975EE1007;
 Tue, 21 Jan 2020 09:28:11 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16ADC3F6C4;
 Tue, 21 Jan 2020 09:28:10 -0800 (PST)
Date: Tue, 21 Jan 2020 17:28:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20200117073814.82441-3-tzungbi@google.com>
Message-Id: <applied-20200117073814.82441-3-tzungbi@google.com>
X-Patchwork-Hint: ignore
Cc: tzungbi@google.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, dgreid@google.com, cychiang@google.com
Subject: [alsa-devel] Applied "ASoC: dapm: add
	snd_soc_dapm_put_enum_double_locked" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: dapm: add snd_soc_dapm_put_enum_double_locked

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 839284e794822ebc8b66f32006a5d4cad863e1fb Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 17 Jan 2020 15:38:13 +0800
Subject: [PATCH] ASoC: dapm: add snd_soc_dapm_put_enum_double_locked

Adds snd_soc_dapm_put_enum_double_locked() for those use cases if
dapm_mutex has already locked.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20200117073814.82441-3-tzungbi@google.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dapm.h |  2 ++
 sound/soc/soc-dapm.c     | 54 ++++++++++++++++++++++++++++++----------
 2 files changed, 43 insertions(+), 13 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 1b6afbc1a4ed..2a306c6f3fbc 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -392,6 +392,8 @@ int snd_soc_dapm_get_enum_double(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
+int snd_soc_dapm_put_enum_double_locked(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_dapm_info_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_info *uinfo);
 int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 442846f12cd4..bc20ad9abf8b 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3441,17 +3441,8 @@ int snd_soc_dapm_get_enum_double(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_get_enum_double);
 
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
+static int __snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol, int locked)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
 	struct snd_soc_card *card = dapm->card;
@@ -3474,7 +3465,9 @@ int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 		mask |= e->mask << e->shift_r;
 	}
 
-	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	if (!locked)
+		mutex_lock_nested(&card->dapm_mutex,
+				  SND_SOC_DAPM_CLASS_RUNTIME);
 
 	change = dapm_kcontrol_set_value(kcontrol, val);
 
@@ -3496,15 +3489,50 @@ int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 		card->update = NULL;
 	}
 
-	mutex_unlock(&card->dapm_mutex);
+	if (!locked)
+		mutex_unlock(&card->dapm_mutex);
 
 	if (ret > 0)
 		soc_dpcm_runtime_update(card);
 
 	return change;
 }
+
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
+{
+	return __snd_soc_dapm_put_enum_double(kcontrol, ucontrol, 0);
+}
 EXPORT_SYMBOL_GPL(snd_soc_dapm_put_enum_double);
 
+/**
+ * snd_soc_dapm_put_enum_double_locked - dapm enumerated double mixer set
+ * callback
+ * @kcontrol: mixer control
+ * @ucontrol: control element information
+ *
+ * Callback to set the value of a dapm enumerated double mixer control.
+ * Must acquire dapm_mutex before calling the function.
+ *
+ * Returns 0 for success.
+ */
+int snd_soc_dapm_put_enum_double_locked(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	dapm_assert_locked(snd_soc_dapm_kcontrol_dapm(kcontrol));
+	return __snd_soc_dapm_put_enum_double(kcontrol, ucontrol, 1);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_put_enum_double_locked);
+
 /**
  * snd_soc_dapm_info_pin_switch - Info for a pin switch
  *
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
