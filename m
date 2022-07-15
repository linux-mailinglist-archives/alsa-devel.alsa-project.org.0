Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 485425766BF
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 20:30:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBEC01930;
	Fri, 15 Jul 2022 20:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBEC01930
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657909814;
	bh=M9TznGim7iC9n6RwBKVTG3PkJXNbCiPLXiCMUjiaBOY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YQUxzjicT7y+2pzPKOTrhWNgPloLb6xDwM3/DIPV0e5QYAs+ZYADYn4mjWnxU6dh8
	 KVx6UpRhXmjwXaABvSVtzp6bGTo7VpGvoMWp3Y1inNgVHHqUGo8dQX+WGAKk1xSjnv
	 osnGEFHCAZGORl5gx5fuSNc69MPGChqPBu7NO9SI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6852AF80212;
	Fri, 15 Jul 2022 20:29:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C43CF8015B; Fri, 15 Jul 2022 20:29:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F75DF800AA
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 20:29:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F75DF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="G3C97Auc"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="WTw70L/0"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DA64B1FB3B;
 Fri, 15 Jul 2022 18:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657909744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=jsQ+fkwjrO9HjlX4Z5mXLbqy5VJEjIGssATk5dgR2tM=;
 b=G3C97Auc6sWl5dU4WkaMtdXeaysri7h64aq1OMylCCSbnAGIgatab4DdPr6L1uDDZYtoQ6
 sc2wqy0KOyB+mMSFNStaBDOqo5aNe4SLUkKbmTira+Sf1xzeaUow7BEJlf4fxAFGaXPc9s
 ALzh/OhbkA95pv1K3QgWMrxTWwFm0OU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657909744;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=jsQ+fkwjrO9HjlX4Z5mXLbqy5VJEjIGssATk5dgR2tM=;
 b=WTw70L/0H16TB2OxCXcxGN9U5wtly37nSkL8dRLFjsUB5BK94wmlM2t8j4+KDGjpReiKmp
 5gmC31UhjPppKNBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B018D13754;
 Fri, 15 Jul 2022 18:29:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pek9KvCx0WKmGgAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 15 Jul 2022 18:29:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] Revert "ALSA: hda: Fix page fault in snd_hda_codec_shutdown()"
Date: Fri, 15 Jul 2022 20:29:03 +0200
Message-Id: <20220715182903.19594-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

This reverts commit 980b3a8790b402e959a6d773b38b771019682be1.

The commit didn't consider the fact that ASoC hdac-hda driver
initializes the HD-audio stuff without calling
snd_hda_codec_device_init().  Hence this caused a regression leading
to Oops.

Revert the commit to restore the behavior.

Fixes: 980b3a8790b4 ("ALSA: hda: Fix page fault in snd_hda_codec_shutdown()")
Link: https://lore.kernel.org/r/3c40df55-3aee-1e08-493b-7b30cd84dc00@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_codec.c | 41 ++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 7be74227bf19..7b2e62fa82d5 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -931,28 +931,8 @@ snd_hda_codec_device_init(struct hda_bus *bus, unsigned int codec_addr,
 	}
 
 	codec->bus = bus;
-	codec->depop_delay = -1;
-	codec->fixup_id = HDA_FIXUP_ID_NOT_SET;
-	codec->core.dev.release = snd_hda_codec_dev_release;
-	codec->core.exec_verb = codec_exec_verb;
 	codec->core.type = HDA_DEV_LEGACY;
 
-	mutex_init(&codec->spdif_mutex);
-	mutex_init(&codec->control_mutex);
-	snd_array_init(&codec->mixers, sizeof(struct hda_nid_item), 32);
-	snd_array_init(&codec->nids, sizeof(struct hda_nid_item), 32);
-	snd_array_init(&codec->init_pins, sizeof(struct hda_pincfg), 16);
-	snd_array_init(&codec->driver_pins, sizeof(struct hda_pincfg), 16);
-	snd_array_init(&codec->cvt_setups, sizeof(struct hda_cvt_setup), 8);
-	snd_array_init(&codec->spdif_out, sizeof(struct hda_spdif_out), 16);
-	snd_array_init(&codec->jacktbl, sizeof(struct hda_jack_tbl), 16);
-	snd_array_init(&codec->verbs, sizeof(struct hda_verb *), 8);
-	INIT_LIST_HEAD(&codec->conn_list);
-	INIT_LIST_HEAD(&codec->pcm_list_head);
-	INIT_DELAYED_WORK(&codec->jackpoll_work, hda_jackpoll_work);
-	refcount_set(&codec->pcm_ref, 1);
-	init_waitqueue_head(&codec->remove_sleep);
-
 	return codec;
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_device_init);
@@ -1005,8 +985,29 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
 	if (snd_BUG_ON(codec_addr > HDA_MAX_CODEC_ADDRESS))
 		return -EINVAL;
 
+	codec->core.dev.release = snd_hda_codec_dev_release;
+	codec->core.exec_verb = codec_exec_verb;
+
 	codec->card = card;
 	codec->addr = codec_addr;
+	mutex_init(&codec->spdif_mutex);
+	mutex_init(&codec->control_mutex);
+	snd_array_init(&codec->mixers, sizeof(struct hda_nid_item), 32);
+	snd_array_init(&codec->nids, sizeof(struct hda_nid_item), 32);
+	snd_array_init(&codec->init_pins, sizeof(struct hda_pincfg), 16);
+	snd_array_init(&codec->driver_pins, sizeof(struct hda_pincfg), 16);
+	snd_array_init(&codec->cvt_setups, sizeof(struct hda_cvt_setup), 8);
+	snd_array_init(&codec->spdif_out, sizeof(struct hda_spdif_out), 16);
+	snd_array_init(&codec->jacktbl, sizeof(struct hda_jack_tbl), 16);
+	snd_array_init(&codec->verbs, sizeof(struct hda_verb *), 8);
+	INIT_LIST_HEAD(&codec->conn_list);
+	INIT_LIST_HEAD(&codec->pcm_list_head);
+	refcount_set(&codec->pcm_ref, 1);
+	init_waitqueue_head(&codec->remove_sleep);
+
+	INIT_DELAYED_WORK(&codec->jackpoll_work, hda_jackpoll_work);
+	codec->depop_delay = -1;
+	codec->fixup_id = HDA_FIXUP_ID_NOT_SET;
 
 #ifdef CONFIG_PM
 	codec->power_jiffies = jiffies;
-- 
2.35.3

