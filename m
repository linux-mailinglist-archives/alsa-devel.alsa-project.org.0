Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3B86069CD
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 22:47:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 959D2BC31;
	Thu, 20 Oct 2022 22:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 959D2BC31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666298872;
	bh=2WcZwIvja4cT4WEfnoiVI3AdpjBazp3XcEX59W+/I9E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YRR98Z6c+2bK8NAFmeS/UKm+zlJiA7fYEG/Z361TLcPr7aPJSMYS4EphSOK91zS5s
	 k+wcIwor7OL3FMLZYdtq3h3VIlybjcY5tRSZUNyOApy1T04dYaMlfVgLj53zuu0Vms
	 Yiv0iiL2OhueuFtx6f52OYbfiQEFzRo1tiTnhaDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45982F80519;
	Thu, 20 Oct 2022 22:46:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A96AF80515; Thu, 20 Oct 2022 22:46:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_ZEN_BLOCKED_OPENDNS, 
 SPF_HELO_NONE, SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from vps-vb.mhejs.net (vps-vb.mhejs.net [37.28.154.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80BBBF804FA
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 22:46:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80BBBF804FA
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1olcR3-0007Ue-TS; Thu, 20 Oct 2022 22:46:37 +0200
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/6] ALSA: control: add snd_ctl_rename()
Date: Thu, 20 Oct 2022 22:46:21 +0200
Message-Id: <4170b71117ea81357a4f7eb8410f7cde20836c70.1666296963.git.maciej.szmigiero@oracle.com>
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

Add a snd_ctl_rename() function that takes care of updating the control
hash entries for callers that already have the relevant struct snd_kcontrol
at hand and hold the control write lock (or simply haven't registered the
card yet).

Fixes: c27e1efb61c5 ("ALSA: control: Use xarray for faster lookups")
Cc: stable@vger.kernel.org
Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
---
 include/sound/control.h |  1 +
 sound/core/control.c    | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/sound/control.h b/include/sound/control.h
index eae443ba79ba5..cc3dcc6cfb0f2 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -138,6 +138,7 @@ int snd_ctl_remove(struct snd_card * card, struct snd_kcontrol * kcontrol);
 int snd_ctl_replace(struct snd_card *card, struct snd_kcontrol *kcontrol, bool add_on_replace);
 int snd_ctl_remove_id(struct snd_card * card, struct snd_ctl_elem_id *id);
 int snd_ctl_rename_id(struct snd_card * card, struct snd_ctl_elem_id *src_id, struct snd_ctl_elem_id *dst_id);
+void snd_ctl_rename(struct snd_card *card, struct snd_kcontrol *kctl, const char *name);
 int snd_ctl_activate_id(struct snd_card *card, struct snd_ctl_elem_id *id, int active);
 struct snd_kcontrol *snd_ctl_find_numid(struct snd_card * card, unsigned int numid);
 struct snd_kcontrol *snd_ctl_find_id(struct snd_card * card, struct snd_ctl_elem_id *id);
diff --git a/sound/core/control.c b/sound/core/control.c
index a7271927d875f..50e7ba66f1876 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -753,6 +753,29 @@ int snd_ctl_rename_id(struct snd_card *card, struct snd_ctl_elem_id *src_id,
 }
 EXPORT_SYMBOL(snd_ctl_rename_id);
 
+/**
+ * snd_ctl_rename - rename the control on the card
+ * @card: the card instance
+ * @kctl: the control to rename
+ * @name: the new name
+ *
+ * Renames the specified control on the card to the new name.
+ *
+ * Make sure to take the control write lock - down_write(&card->controls_rwsem).
+ */
+void snd_ctl_rename(struct snd_card *card, struct snd_kcontrol *kctl,
+		    const char *name)
+{
+	remove_hash_entries(card, kctl);
+
+	if (strscpy(kctl->id.name, name, sizeof(kctl->id.name)) < 0)
+		pr_warn("ALSA: Renamed control new name '%s' truncated to '%s'\n",
+			name, kctl->id.name);
+
+	add_hash_entries(card, kctl);
+}
+EXPORT_SYMBOL(snd_ctl_rename);
+
 #ifndef CONFIG_SND_CTL_FAST_LOOKUP
 static struct snd_kcontrol *
 snd_ctl_find_numid_slow(struct snd_card *card, unsigned int numid)
