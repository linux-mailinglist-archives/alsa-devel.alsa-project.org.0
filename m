Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C84AB140484
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 08:41:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AA3317E8;
	Fri, 17 Jan 2020 08:40:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AA3317E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579246863;
	bh=kH3S1hNPX2WgqRu2bOfyUG2U7ESZl+XV7WKERLt2VeA=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BMqlM0MCNjUKq5agZQR3l2vG/AjXJfrJJOd/JDhAB0HYBHKud4dFymeNw32asCc9A
	 RIH9svb3F1HrTAOVYaDQjLN4iKIHMRjdjxnk4eYa6Tjd+fS6BdPBx9wISzyVDsOtXo
	 gr7Qq8V8ruEQPbgSdiSE/Or1hw4P8zFHW7R7Suxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E4B8F80086;
	Fri, 17 Jan 2020 08:38:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7242F80086; Fri, 17 Jan 2020 08:38:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4BCBF80086
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 08:38:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4BCBF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="iDA3dCdl"
Received: by mail-pl1-x64a.google.com with SMTP id t17so10249374plr.13
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 23:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Q6VMvQXl3ntEaugQBZeGMXtuJ5ruPKbwuALh9/4JADM=;
 b=iDA3dCdlSyFPdZFsuNMuDZh8czHH1fWDli7hph5DCeEHOIDYudjUxJOn+s8FwUfhZe
 cCvHeRIgHac7skhRrKqlAWtiVfJFCHVMqQKgTRJ1atwrW/WCVH/Cky763akD0Aw6/Z9h
 ecXXneEc4hrJZ7Guj7/Vcxi8xiyhkOkQkFosM06ggAt+CiDZ7pLJHaOacVSUjL5OJUPi
 oQcJH1XSLOQl1EpTDxkPlrRzpS7UtMM63jWogj/oTlbrkxkjC8fhQFhhvKtq9+GBXzHo
 ZG8G+C5KkPuPKTR72xjiaXtadKCptLnfEuIHmQCW0R+HATSZtnYBsaWh8TUt3RMTSN7w
 hT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Q6VMvQXl3ntEaugQBZeGMXtuJ5ruPKbwuALh9/4JADM=;
 b=DXn1KotJnt2Dstmy4CrPm8H7nM8i9GbGX9AmjOgsq+qCEDtxgc3+K9YQRLxY+aCOyq
 4uMUhpXPbPcw16huTgcehYtWMEoyGsXgWwCL64LVKKPAje9v5zSSp9IAvRJG6RzCXBrU
 nCL49VUJjcKadvfxYo+tAQbyze2mndR6y9HqWV0Y+uma3kp2/LpCBPSP7c1/tn7Ls1tZ
 G9egEyAwoCYSxu958eVMGdF8nr69xH/AHWi4KECNcrSwTsgg8CQURdsgF3AHbLSQtwzV
 yEI09oG52p3QGi6hgQpYBbkoTRA8GOwMHIBzx4svHNNCErSB/M7fXbm2/4ZGY9sEh/Zq
 RCeQ==
X-Gm-Message-State: APjAAAXrXg4J5YERFFcmPm98QSJ7e8ODDGf9xfVZtfyN810M2oTZrFzO
 rIXG3f1EKkvsafRMxuXbxjbSjeCA7ALZ
X-Google-Smtp-Source: APXvYqzsdehS35UwpPgad6zoj2fEa0aTRvJWAWeNLGg+mzEu80k6GGHfIqec9dT8W7FFnvk87hHnyS3XEspm
X-Received: by 2002:a65:488f:: with SMTP id n15mr46107210pgs.61.1579246705490; 
 Thu, 16 Jan 2020 23:38:25 -0800 (PST)
Date: Fri, 17 Jan 2020 15:38:12 +0800
In-Reply-To: <20200117073814.82441-1-tzungbi@google.com>
Message-Id: <20200117073814.82441-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20200117073814.82441-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 1/3] ASoC: max98090: revert "ASoC: max98090:
	fix lockdep warning"
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

Commit 2dc98af62c32 ("ASoC: max98090: fix lockdep warning") introduced
a helpful-less small lock: shdn_lock.  Reverts the commit.

Reasons:

1. Lockdep should not be happy by either the original or current code.
From lockdep's point of view, there is a lock inversion anyway.

Let d = dapm_mutex, c = controls_rwsem, s = shdn_lock,

From the reported calling stack: lock acquisition order of
snd_soc_register_card() is: d -> c.
> snd_ctl_add_replace+0x3c/0x84
> dapm_create_or_share_kcontrol+0x24c/0x2e0
> snd_soc_dapm_new_widgets+0x308/0x594
> snd_soc_bind_card+0x80c/0xad4
> devm_snd_soc_register_card+0x34/0x6c

If calling snd_soc_dapm_put_enum_double() in kcontrol's put (e.g.
SOC_DAPM_ENUM_EXT), lock acquisition order is: c -> d.  Note that,
snd_soc_dapm_put_enum_double() acquires d.

The possible lock inversion is always there if registering sound card
and putting mixer control happen at the same time.  In fact, it never
happens because the control device don't show up to the userspace until
the sound card build success.

Commit 2dc98af62c32 ("ASoC: max98090: fix lockdep warning") changes the
order to: c -> s -> d.  The lock inversion is still there.

2. Commit 62d5ae4cafb7 ("ASoC: max98090: save and restore SHDN when
changing sensitive registers SHDN bit") designed to use dapm_mutex to
protect SHDN bit.  Use a separate lock breaks the protection.

DAPM changes SHDN bit automatically when it finds the path.  Thus, any
code wants to change the SHDN bit, need to acquire the dapm_mutex first.

> SND_SOC_DAPM_SUPPLY("SHDN", M98090_REG_DEVICE_SHUTDOWN,
>        M98090_SHDNN_SHIFT, 0, NULL, 0),

Fixes: 2dc98af62c32 ("ASoC: max98090: fix lockdep warning")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/max98090.c | 10 ++++------
 sound/soc/codecs/max98090.h |  1 -
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 454cb8e5b0a1..c01ce4a3f86d 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -52,14 +52,14 @@ static void max98090_shdn_restore_locked(struct max98090_priv *max98090)
 
 static void max98090_shdn_save(struct max98090_priv *max98090)
 {
-	mutex_lock(&max98090->shdn_lock);
+	mutex_lock(&max98090->component->card->dapm_mutex);
 	max98090_shdn_save_locked(max98090);
 }
 
 static void max98090_shdn_restore(struct max98090_priv *max98090)
 {
 	max98090_shdn_restore_locked(max98090);
-	mutex_unlock(&max98090->shdn_lock);
+	mutex_unlock(&max98090->component->card->dapm_mutex);
 }
 
 static int max98090_put_volsw(struct snd_kcontrol *kcontrol,
@@ -2313,12 +2313,12 @@ static void max98090_pll_work(struct max98090_priv *max98090)
 	 */
 
 	/* Toggle shutdown OFF then ON */
-	mutex_lock(&max98090->shdn_lock);
+	mutex_lock(&component->card->dapm_mutex);
 	snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
 			    M98090_SHDNN_MASK, 0);
 	snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
 			    M98090_SHDNN_MASK, M98090_SHDNN_MASK);
-	mutex_unlock(&max98090->shdn_lock);
+	mutex_unlock(&component->card->dapm_mutex);
 
 	for (i = 0; i < 10; ++i) {
 		/* Give PLL time to lock */
@@ -2731,8 +2731,6 @@ static int max98090_i2c_probe(struct i2c_client *i2c,
 	if (max98090 == NULL)
 		return -ENOMEM;
 
-	mutex_init(&max98090->shdn_lock);
-
 	if (ACPI_HANDLE(&i2c->dev)) {
 		acpi_id = acpi_match_device(i2c->dev.driver->acpi_match_table,
 					    &i2c->dev);
diff --git a/sound/soc/codecs/max98090.h b/sound/soc/codecs/max98090.h
index dabd8be34a01..0a31708b7df7 100644
--- a/sound/soc/codecs/max98090.h
+++ b/sound/soc/codecs/max98090.h
@@ -1539,7 +1539,6 @@ struct max98090_priv {
 	unsigned int pa2en;
 	unsigned int sidetone;
 	bool master;
-	struct mutex shdn_lock;
 	int saved_count;
 	int saved_shdn;
 };
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
