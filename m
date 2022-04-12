Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC9D4FD355
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 11:33:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0B4E1745;
	Tue, 12 Apr 2022 11:32:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0B4E1745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649756000;
	bh=Eb9IpVZ8tKM4WYRunhURfzM/JGUR9mbx2nyNggY0qTs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mIpibQC6+Wep227gPiIXC6lAZP3PCl6bSgMjSbDnqtN5YjjR/c7hl50YMxYOKd6on
	 QqZ14Fq/9IiYuQQqUGgVlvUnTOW81Mob3KFtDMdKaq2HB/dK0IfwURy8rqOfr1kNrj
	 Mt2eMKSacFykozZJ4N0bm/cgxvgOBVRtj35/dU/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8851EF804F3;
	Tue, 12 Apr 2022 11:31:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C17CF8032B; Tue, 12 Apr 2022 11:31:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B508F80095
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 11:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B508F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="MkwHELRj"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="z6/ekjmR"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id BB7F91F868;
 Tue, 12 Apr 2022 09:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649755902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cpiCQALReUik85tDUk76IGMs1+8jyVuIYj9oZ3ysvoU=;
 b=MkwHELRjTRJzvlI+CQa3yB7OvWv+1NQbm1SLSf/1tj5H96SQrlseChktEL/rQctoFufIfv
 of5NJDFeiUASxjXdQT2asJAFRsd0SlZhrVAax1IE5+8QGGKsyOXSUNRN/4u7fssES/pOxM
 scAydBPokny5d7qZGzaB/MarX5JZXbg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649755902;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cpiCQALReUik85tDUk76IGMs1+8jyVuIYj9oZ3ysvoU=;
 b=z6/ekjmRh+4KFzXDnfs1ccIC+o3kU+TyOxNSDAoz8BZCuWCH6vx4B6loMihj/MrDHm/TPa
 EhYTI8y0/adL5SAg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id A994CA3B99;
 Tue, 12 Apr 2022 09:31:42 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: core: Add snd_card_free_on_error() helper
Date: Tue, 12 Apr 2022 11:31:40 +0200
Message-Id: <20220412093141.8008-2-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220412093141.8008-1-tiwai@suse.de>
References: <20220412093141.8008-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Zheyu Ma <zheyuma97@gmail.com>
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

This is a small helper function to handle the error path more easily
when an error happens during the probe for the device with the
device-managed card.  Since devres releases in the reverser order of
the creations, usually snd_card_free() gets called at the last in the
probe error path unless it already reached snd_card_register() calls.
Due to this nature, when a driver expects the resource releases in
card->private_free, this might be called too lately.

As a workaround, one should call the probe like:

 static int __some_probe(...) { // do real probe.... }

 static int some_probe(...)
 {
	return snd_card_free_on_error(dev, __some_probe(dev, ...));
 }

so that the snd_card_free() is called explicitly at the beginning of
the error path from the probe.

This function will be used in the upcoming fixes to address the
regressions by devres usages.

Fixes: e8ad415b7a55 ("ALSA: core: Add managed card creation")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h |  1 +
 sound/core/init.c    | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/sound/core.h b/include/sound/core.h
index b7e9b58d3c78..6d4cc49584c6 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -284,6 +284,7 @@ int snd_card_disconnect(struct snd_card *card);
 void snd_card_disconnect_sync(struct snd_card *card);
 int snd_card_free(struct snd_card *card);
 int snd_card_free_when_closed(struct snd_card *card);
+int snd_card_free_on_error(struct device *dev, int ret);
 void snd_card_set_id(struct snd_card *card, const char *id);
 int snd_card_register(struct snd_card *card);
 int snd_card_info_init(void);
diff --git a/sound/core/init.c b/sound/core/init.c
index 31ba7024e3ad..726a8353201f 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -209,6 +209,12 @@ static void __snd_card_release(struct device *dev, void *data)
  * snd_card_register(), the very first devres action to call snd_card_free()
  * is added automatically.  In that way, the resource disconnection is assured
  * at first, then released in the expected order.
+ *
+ * If an error happens at the probe before snd_card_register() is called and
+ * there have been other devres resources, you'd need to free the card manually
+ * via snd_card_free() call in the error; otherwise it may lead to UAF due to
+ * devres call orders.  You can use snd_card_free_on_error() helper for
+ * handling it more easily.
  */
 int snd_devm_card_new(struct device *parent, int idx, const char *xid,
 		      struct module *module, size_t extra_size,
@@ -235,6 +241,28 @@ int snd_devm_card_new(struct device *parent, int idx, const char *xid,
 }
 EXPORT_SYMBOL_GPL(snd_devm_card_new);
 
+/**
+ * snd_card_free_on_error - a small helper for handling devm probe errors
+ * @dev: the managed device object
+ * @ret: the return code from the probe callback
+ *
+ * This function handles the explicit snd_card_free() call at the error from
+ * the probe callback.  It's just a small helper for simplifying the error
+ * handling with the managed devices.
+ */
+int snd_card_free_on_error(struct device *dev, int ret)
+{
+	struct snd_card *card;
+
+	if (!ret)
+		return 0;
+	card = devres_find(dev, __snd_card_release, NULL, NULL);
+	if (card)
+		snd_card_free(card);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_card_free_on_error);
+
 static int snd_card_init(struct snd_card *card, struct device *parent,
 			 int idx, const char *xid, struct module *module,
 			 size_t extra_size)
-- 
2.31.1

