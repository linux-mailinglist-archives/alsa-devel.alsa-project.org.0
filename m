Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B80C6069DD
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 22:49:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D284CA306;
	Thu, 20 Oct 2022 22:48:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D284CA306
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666298950;
	bh=vBxmsO5sEn+khyzAErGQ8M7NK5BAEEaxyIejiOYtqqo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nxGFqsdTRM6/8ZY1AUQD1e9b8905SLKUleFnjiYpbYsRpe543OQjVBhO1BYQij9Y6
	 D/NwjD7abdC2MgCT5QAVuaL40CE53y5Wc1ZbiZqrtTiUxlY6ez91BWNPvQTObhyRsB
	 NiQ0PpvacaE+re7VAiptOMIbUfKTk/p3xCTQWKrM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5B24F80564;
	Thu, 20 Oct 2022 22:47:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76094F80564; Thu, 20 Oct 2022 22:47:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from vps-vb.mhejs.net (vps-vb.mhejs.net [37.28.154.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3041BF8055C
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 22:47:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3041BF8055C
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1olcRU-0007Vc-JN; Thu, 20 Oct 2022 22:47:04 +0200
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 6/6] ALSA: ac97: Use snd_ctl_rename() to rename a control
Date: Thu, 20 Oct 2022 22:46:26 +0200
Message-Id: <adb68bfa0885ba4a2583794b828f8e20d23f67c7.1666296963.git.maciej.szmigiero@oracle.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1666296963.git.maciej.szmigiero@oracle.com>
References: <cover.1666296963.git.maciej.szmigiero@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>

With the recent addition of hashed controls lookup it's not enough to just
update the control name field, the hash entries for the modified control
have to be updated too.

snd_ctl_rename() takes care of that, so use it instead of directly
modifying the control name.

While we are at it, check also that the new control name doesn't
accidentally overwrite the available buffer space.

Fixes: c27e1efb61c5 ("ALSA: control: Use xarray for faster lookups")
Cc: stable@vger.kernel.org
Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
---
 sound/pci/ac97/ac97_codec.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/sound/pci/ac97/ac97_codec.c b/sound/pci/ac97/ac97_codec.c
index ceead55f13ab1..ff685321f1a11 100644
--- a/sound/pci/ac97/ac97_codec.c
+++ b/sound/pci/ac97/ac97_codec.c
@@ -2656,11 +2656,18 @@ EXPORT_SYMBOL(snd_ac97_resume);
  */
 static void set_ctl_name(char *dst, const char *src, const char *suffix)
 {
-	if (suffix)
-		sprintf(dst, "%s %s", src, suffix);
-	else
-		strcpy(dst, src);
-}	
+	const size_t msize = SNDRV_CTL_ELEM_ID_NAME_MAXLEN;
+
+	if (suffix) {
+		if (snprintf(dst, msize, "%s %s", src, suffix) >= msize)
+			pr_warn("ALSA: AC97 control name '%s %s' truncated to '%s'\n",
+				src, suffix, dst);
+	} else {
+		if (strscpy(dst, src, msize) < 0)
+			pr_warn("ALSA: AC97 control name '%s' truncated to '%s'\n",
+				src, dst);
+	}
+}
 
 /* remove the control with the given name and optional suffix */
 static int snd_ac97_remove_ctl(struct snd_ac97 *ac97, const char *name,
@@ -2687,8 +2694,11 @@ static int snd_ac97_rename_ctl(struct snd_ac97 *ac97, const char *src,
 			       const char *dst, const char *suffix)
 {
 	struct snd_kcontrol *kctl = ctl_find(ac97, src, suffix);
+	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+
 	if (kctl) {
-		set_ctl_name(kctl->id.name, dst, suffix);
+		set_ctl_name(name, dst, suffix);
+		snd_ctl_rename(ac97->bus->card, kctl, name);
 		return 0;
 	}
 	return -ENOENT;
@@ -2707,11 +2717,17 @@ static int snd_ac97_swap_ctl(struct snd_ac97 *ac97, const char *s1,
 			     const char *s2, const char *suffix)
 {
 	struct snd_kcontrol *kctl1, *kctl2;
+	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+
 	kctl1 = ctl_find(ac97, s1, suffix);
 	kctl2 = ctl_find(ac97, s2, suffix);
 	if (kctl1 && kctl2) {
-		set_ctl_name(kctl1->id.name, s2, suffix);
-		set_ctl_name(kctl2->id.name, s1, suffix);
+		set_ctl_name(name, s2, suffix);
+		snd_ctl_rename(ac97->bus->card, kctl1, name);
+
+		set_ctl_name(name, s1, suffix);
+		snd_ctl_rename(ac97->bus->card, kctl2, name);
+
 		return 0;
 	}
 	return -ENOENT;
