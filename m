Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5A43D679C
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 21:43:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FFEF1AF8;
	Mon, 26 Jul 2021 21:42:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FFEF1AF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627328600;
	bh=VINjGzweadj7Pej23oHt7ClCQkkBGzsHvdty6NhwjWQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c9ht2lVZFBTbYsFgktH52FPf0E2khBYCAMzPmDpr6DUyPHD94B3ygafAdSIuuQAmc
	 +zU0dIZC+XZdKv8fPydtPCO/D9Fr3lRVe/Lb2/d5GnDFAUhimcryPnVv42vxYqO7Vk
	 esaEiRB3vPzMH0vls7gGmhgPRAoQoJFlgp6kb74I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDA9EF80130;
	Mon, 26 Jul 2021 21:41:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF3BEF8025A; Mon, 26 Jul 2021 21:41:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9591CF8020D
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 21:41:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9591CF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V+SmUi6q"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E630660F6E;
 Mon, 26 Jul 2021 19:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627328498;
 bh=VINjGzweadj7Pej23oHt7ClCQkkBGzsHvdty6NhwjWQ=;
 h=From:To:Cc:Subject:Date:From;
 b=V+SmUi6qNWN/fxx13864gDWrJU76TZSjoQ/nFvHOB9pqgEa3HK+X3x92soSSI7jSy
 KK5PJfDek0l4c7KuKTIR2ZaglAJLNnGXAb/YDV3qbpMWNrAKTQR0Lq3OlLIMdVEUds
 UQ4lnTWuumlxNWxqfbVIWeEHPAos0hHIqx6X7e3SjzncvXwUEBV6pA2dS4yKSFIVQ3
 we2ws5o3Vwy9oDkar/GEUvzRrE3lv0HUiC1SXaQCNOoXpV9yv+fpHdgMHQOvkkIIj9
 GETENAl1JjZUl7TY06NsPmroPAtvd8UH6dlgU7M4oiJyOUkuvYG5Q3YeM50GaprrTt
 L9dbg/S+SO3jg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: component: Remove misplaced prefix handling in pin
 control functions
Date: Mon, 26 Jul 2021 20:41:23 +0100
Message-Id: <20210726194123.54585-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5244; h=from:subject;
 bh=VINjGzweadj7Pej23oHt7ClCQkkBGzsHvdty6NhwjWQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBg/wg7/iA/a5aFZjKXyzVd095vOGGRv76lt5jCW4JU
 cDUNXeSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYP8IOwAKCRAk1otyXVSH0JE1B/
 4uO/X0D7PWihSxjc2ocLrsBQi5AoYpQs6oaPCCQbIARGPe1CcjjBYM/01/RTkQfqBCVRl4Eq2zfK66
 s7Hzlfa5xhKDfw7cgUQSUryjuYV/kzA/JBnAoxg/NFwBhQtNX7G/JF3Y/Y8hmYYWH3K/9xKYtjGyZa
 kRaWoVZhVoQ9VeT5IIcYSc4czcn+Qv8DLLlMvaFrIrKh2f0KWYeuF2hhYS5ssyTQzeiCc1/+0mya25
 PPS+2VeH+grG+ZfEvNDei3HsWeRDCAkywjETFfawoSoNaai7F82Vpg445O1tOTiQQtAM/ZZDylHqj8
 GS43DdPIW5VrZQ6bWdsI/6O3vx/Li/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
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

When the component level pin control functions were added they for some
no longer obvious reason handled adding prefixing of widget names. This
meant that when the lack of prefix handling in the DAPM level pin
operations was fixed by ae4fc532244b3bb4d (ASoC: dapm: use component
prefix when checking widget names) the one device using the component
level API ended up with the prefix being applied twice, causing all
lookups to fail.

Fix this by removing the redundant prefixing from the component code,
which has the nice side effect of also making that code much simpler.

Reported-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-component.c | 63 +++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 36 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 3a5e84e16a87..c8dfd0de30e4 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -148,86 +148,75 @@ int snd_soc_component_set_bias_level(struct snd_soc_component *component,
 	return soc_component_ret(component, ret);
 }
 
-static int soc_component_pin(struct snd_soc_component *component,
-			     const char *pin,
-			     int (*pin_func)(struct snd_soc_dapm_context *dapm,
-					     const char *pin))
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	char *full_name;
-	int ret;
-
-	if (!component->name_prefix) {
-		ret = pin_func(dapm, pin);
-		goto end;
-	}
-
-	full_name = kasprintf(GFP_KERNEL, "%s %s", component->name_prefix, pin);
-	if (!full_name) {
-		ret = -ENOMEM;
-		goto end;
-	}
-
-	ret = pin_func(dapm, full_name);
-	kfree(full_name);
-end:
-	return soc_component_ret(component, ret);
-}
-
 int snd_soc_component_enable_pin(struct snd_soc_component *component,
 				 const char *pin)
 {
-	return soc_component_pin(component, pin, snd_soc_dapm_enable_pin);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	return snd_soc_dapm_enable_pin(dapm, pin);
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_enable_pin);
 
 int snd_soc_component_enable_pin_unlocked(struct snd_soc_component *component,
 					  const char *pin)
 {
-	return soc_component_pin(component, pin, snd_soc_dapm_enable_pin_unlocked);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	return snd_soc_dapm_enable_pin_unlocked(dapm, pin);
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_enable_pin_unlocked);
 
 int snd_soc_component_disable_pin(struct snd_soc_component *component,
 				  const char *pin)
 {
-	return soc_component_pin(component, pin, snd_soc_dapm_disable_pin);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	return snd_soc_dapm_disable_pin(dapm, pin);
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_disable_pin);
 
 int snd_soc_component_disable_pin_unlocked(struct snd_soc_component *component,
 					   const char *pin)
 {
-	return soc_component_pin(component, pin, snd_soc_dapm_disable_pin_unlocked);
+	struct snd_soc_dapm_context *dapm = 
+		snd_soc_component_get_dapm(component);
+	return snd_soc_dapm_disable_pin_unlocked(dapm, pin);
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_disable_pin_unlocked);
 
 int snd_soc_component_nc_pin(struct snd_soc_component *component,
 			     const char *pin)
 {
-	return soc_component_pin(component, pin, snd_soc_dapm_nc_pin);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	return snd_soc_dapm_nc_pin(dapm, pin);
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_nc_pin);
 
 int snd_soc_component_nc_pin_unlocked(struct snd_soc_component *component,
 				      const char *pin)
 {
-	return soc_component_pin(component, pin, snd_soc_dapm_nc_pin_unlocked);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	return snd_soc_dapm_nc_pin_unlocked(dapm, pin);
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_nc_pin_unlocked);
 
 int snd_soc_component_get_pin_status(struct snd_soc_component *component,
 				     const char *pin)
 {
-	return soc_component_pin(component, pin, snd_soc_dapm_get_pin_status);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	return snd_soc_dapm_get_pin_status(dapm, pin);
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_get_pin_status);
 
 int snd_soc_component_force_enable_pin(struct snd_soc_component *component,
 				       const char *pin)
 {
-	return soc_component_pin(component, pin, snd_soc_dapm_force_enable_pin);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	return snd_soc_dapm_force_enable_pin(dapm, pin);
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_force_enable_pin);
 
@@ -235,7 +224,9 @@ int snd_soc_component_force_enable_pin_unlocked(
 	struct snd_soc_component *component,
 	const char *pin)
 {
-	return soc_component_pin(component, pin, snd_soc_dapm_force_enable_pin_unlocked);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	return snd_soc_dapm_force_enable_pin_unlocked(dapm, pin);
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_force_enable_pin_unlocked);
 
-- 
2.20.1

