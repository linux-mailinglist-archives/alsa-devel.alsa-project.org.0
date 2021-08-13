Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E51023EB267
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 10:15:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89FD618C6;
	Fri, 13 Aug 2021 10:14:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89FD618C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628842502;
	bh=O2WDgH+c9Pv3ANP55FW7qfrJC4O9ap0ZmbdKA4qc5hw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RbgBM1uKKE6Z/HyyU7NlL2GcJt/EZyBH9JeyUL5xo2Um0nQmALT0WcYoUthtbp93g
	 nDEHngWtyaMJESYVxuD7VaR0cejmyDMOefYqNuD8jKRO8bRFQGQedTm0E5xRv0O4EX
	 ElBnKCtuDV2sF9Ddpf+1rbPIsKmx8BHo1HvCxYgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D76CDF804E1;
	Fri, 13 Aug 2021 10:12:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 309D2F800E5; Fri, 13 Aug 2021 10:12:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21DB9F8020D
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 10:12:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21DB9F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="QGv7J7Xs"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="rgK4CzFt"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C7DF41FF92;
 Fri, 13 Aug 2021 08:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628842353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m4+UxHz4KctRKPRH8eFHP0qmf4PAjEeGlaTx/nOdT9Q=;
 b=QGv7J7Xsy2O9EfwqX0WgLzYmOkHK57daPCcw9uYRupq3Q81M8ZRWcjQsbZDWv7uc9EsBCL
 XSj2hSgHaMTCJj9pg8sFlaqTccqtpzZrf0u5JHjfECECUubLpp4vdiGLJzPJ9rbyIITeqt
 D2plGTI8gqUHnjaym02ASKr3fbWjkhk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628842353;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m4+UxHz4KctRKPRH8eFHP0qmf4PAjEeGlaTx/nOdT9Q=;
 b=rgK4CzFtKbzhb6iLbkbkh9YtagR6aCHLxTAq/IFDO/G5/OffkzzG6NMuT2CqIDpQyExnoL
 yBSG84emgxfn9NCQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id B5C6CA3B8B;
 Fri, 13 Aug 2021 08:12:33 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ALSA: hda: Suspend codec at shutdown
Date: Fri, 13 Aug 2021 10:12:29 +0200
Message-Id: <20210813081230.4268-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210813081230.4268-1-tiwai@suse.de>
References: <20210813081230.4268-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: youling257@gmail.com, Imre Deak <imre.deak@intel.com>
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

So far we have a few workarounds at shutdown for each codec,
e.g. turning off the display power and setting the codec to D3.
But all those are basically a part of the suspend procedure.
Moreover, the streams are still active after that call, hence it might
hit the update on the codec that has been already put to D3.

In this patch, instead of calling each reboot_notify callback, simply
put the codec into the runtime-suspended state after the manual
suspend of all PCM streams.  It makes the code and the behavior more
consistent.

The reboot_notify callback is no longer used after this patch, and
will be cleaned up later.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=214045
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_bind.c  |  8 +-------
 sound/pci/hda/hda_codec.c | 14 ++++++++++++++
 sound/pci/hda/hda_local.h |  2 ++
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/sound/pci/hda/hda_bind.c b/sound/pci/hda/hda_bind.c
index e8dee24c309d..2523b23389e9 100644
--- a/sound/pci/hda/hda_bind.c
+++ b/sound/pci/hda/hda_bind.c
@@ -165,13 +165,7 @@ static int hda_codec_driver_remove(struct device *dev)
 
 static void hda_codec_driver_shutdown(struct device *dev)
 {
-	struct hda_codec *codec = dev_to_hda_codec(dev);
-
-	if (!pm_runtime_suspended(dev)) {
-		if (codec->patch_ops.reboot_notify)
-			codec->patch_ops.reboot_notify(codec);
-		snd_hda_codec_display_power(codec, false);
-	}
+	snd_hda_codec_shutdown(dev_to_hda_codec(dev));
 }
 
 int __hda_codec_driver_register(struct hda_codec_driver *drv, const char *name,
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 7a717e151156..2c91c92c9ab2 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -2981,6 +2981,20 @@ const struct dev_pm_ops hda_codec_driver_pm = {
 			   NULL)
 };
 
+/* suspend the codec at shutdown; called from driver's shutdown callback */
+void snd_hda_codec_shutdown(struct hda_codec *codec)
+{
+	struct hda_pcm *cpcm;
+
+	if (pm_runtime_suspended(hda_codec_dev(codec)))
+		return;
+
+	list_for_each_entry(cpcm, &codec->pcm_list_head, list)
+		snd_pcm_suspend_all(cpcm->pcm);
+
+	pm_runtime_suspend(hda_codec_dev(codec));
+}
+
 /*
  * add standard channel maps if not specified
  */
diff --git a/sound/pci/hda/hda_local.h b/sound/pci/hda/hda_local.h
index 8d2503e8dad8..ea8ab8b43337 100644
--- a/sound/pci/hda/hda_local.h
+++ b/sound/pci/hda/hda_local.h
@@ -615,6 +615,8 @@ unsigned int snd_hda_codec_eapd_power_filter(struct hda_codec *codec,
 					     hda_nid_t nid,
 					     unsigned int power_state);
 
+void snd_hda_codec_shutdown(struct hda_codec *codec);
+
 /*
  * AMP control callbacks
  */
-- 
2.26.2

