Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0725D669664
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 13:09:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64E20A864;
	Fri, 13 Jan 2023 13:08:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64E20A864
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673611743;
	bh=3FceGDF4uobJo8tbzaRqHmThDNS/MO25+SdvbTLZp+k=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=G3OOgenSdNvs0OaYfqkYAMnEBCPbFYrvq1WYMIJolIYALV2d090IVpqh2OpNO6WRG
	 BDQp1k9nz0ZkAT1IeEVqrgj8o9oGcSD8X28G2SwkaAkOZQgXtqVaoVZgfuANnu4CeQ
	 bvDvGb4LlID865sSAe7S9HsU6dfzcdBqJ3lGRQ+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D225FF8016D;
	Fri, 13 Jan 2023 13:08:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1111F802E8; Fri, 13 Jan 2023 13:08:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AADC7F8016D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 13:07:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AADC7F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=GCna90ZR; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=yrzNNSZ/
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D14825FF75;
 Fri, 13 Jan 2023 12:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673611675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=xD16Js7PjyhlXXLl/CZgEDiokWkf0dZnCNfUVKSJtLY=;
 b=GCna90ZRCnwhxdBNWxy2C15XFOnifoMZ9zma2AOkoEQc1+a69Kyt18LltATNTTDA4aNy1X
 YUXugM4oGbtYR06Bu6EdAO1hKWNKi40byFT4LEe/bRI+vgczJvHTdiu+wVmzeNJzbh8GO7
 pXAFgsckrpmgAWUPbtMWTb5OlynthqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673611675;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=xD16Js7PjyhlXXLl/CZgEDiokWkf0dZnCNfUVKSJtLY=;
 b=yrzNNSZ/e976JOXfqS+shbPUtVh3IerCzWT5QJupYnKYO+OjVkYM9gVa5N9lAovAB8L3s7
 PsLyggucz77Zg3Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AE2CE1358A;
 Fri, 13 Jan 2023 12:07:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qJ2nKZtJwWOBSgAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 13 Jan 2023 12:07:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pcm: Move rwsem lock inside snd_ctl_elem_read to
 prevent UAF
Date: Fri, 13 Jan 2023 13:07:45 +0100
Message-Id: <20230113120745.25464-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-kernel@vger.kernel.org, Clement Lecigne <clecigne@google.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Clement Lecigne <clecigne@google.com>

Takes rwsem lock inside snd_ctl_elem_read instead of snd_ctl_elem_read_user
like it was done for write in commit 1fa4445f9adf1 ("ALSA: control - introduce
snd_ctl_notify_one() helper"). Doing this way we are also fixing the following
locking issue happening in the compat path which can be easily triggered and
turned into an use-after-free.

64-bits:
snd_ctl_ioctl
  snd_ctl_elem_read_user
    [takes controls_rwsem]
    snd_ctl_elem_read [lock properly held, all good]
    [drops controls_rwsem]

32-bits:
snd_ctl_ioctl_compat
  snd_ctl_elem_write_read_compat
    ctl_elem_write_read
      snd_ctl_elem_read [missing lock, not good]

CVE-2023-0266 was assigned for this issue.

Cc: stable@kernel.org # 5.13+
Signed-off-by: Clement Lecigne <clecigne@google.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

Note: the fixes for older stable trees will be submitted in another patch

 sound/core/control.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 50e7ba66f187..82aa1af1d1d8 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1203,14 +1203,19 @@ static int snd_ctl_elem_read(struct snd_card *card,
 	const u32 pattern = 0xdeadbeef;
 	int ret;
 
+	down_read(&card->controls_rwsem);
 	kctl = snd_ctl_find_id(card, &control->id);
-	if (kctl == NULL)
-		return -ENOENT;
+	if (kctl == NULL) {
+		ret = -ENOENT;
+		goto unlock;
+	}
 
 	index_offset = snd_ctl_get_ioff(kctl, &control->id);
 	vd = &kctl->vd[index_offset];
-	if (!(vd->access & SNDRV_CTL_ELEM_ACCESS_READ) || kctl->get == NULL)
-		return -EPERM;
+	if (!(vd->access & SNDRV_CTL_ELEM_ACCESS_READ) || kctl->get == NULL) {
+		ret = -EPERM;
+		goto unlock;
+	}
 
 	snd_ctl_build_ioff(&control->id, kctl, index_offset);
 
@@ -1220,7 +1225,7 @@ static int snd_ctl_elem_read(struct snd_card *card,
 	info.id = control->id;
 	ret = __snd_ctl_elem_info(card, kctl, &info, NULL);
 	if (ret < 0)
-		return ret;
+		goto unlock;
 #endif
 
 	if (!snd_ctl_skip_validation(&info))
@@ -1230,7 +1235,7 @@ static int snd_ctl_elem_read(struct snd_card *card,
 		ret = kctl->get(kctl, control);
 	snd_power_unref(card);
 	if (ret < 0)
-		return ret;
+		goto unlock;
 	if (!snd_ctl_skip_validation(&info) &&
 	    sanity_check_elem_value(card, control, &info, pattern) < 0) {
 		dev_err(card->dev,
@@ -1238,8 +1243,11 @@ static int snd_ctl_elem_read(struct snd_card *card,
 			control->id.iface, control->id.device,
 			control->id.subdevice, control->id.name,
 			control->id.index);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto unlock;
 	}
+unlock:
+	up_read(&card->controls_rwsem);
 	return ret;
 }
 
@@ -1253,9 +1261,7 @@ static int snd_ctl_elem_read_user(struct snd_card *card,
 	if (IS_ERR(control))
 		return PTR_ERR(control);
 
-	down_read(&card->controls_rwsem);
 	result = snd_ctl_elem_read(card, control);
-	up_read(&card->controls_rwsem);
 	if (result < 0)
 		goto error;
 
-- 
2.35.3

