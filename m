Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE0F781F01
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Aug 2023 19:28:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF47F839;
	Sun, 20 Aug 2023 19:27:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF47F839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692552488;
	bh=jsD5uI4S3o2jUeGa6u2zZUzzFvvv2Nl1r8lUk1qLTnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LrbbBBWZZ6F2jD5D67+XGMlPUC7PiMir8w5aLC/XIHjgJOUFaKDwv3170qxIWaCgR
	 DE4t8cM0uuP3kGccvw/5uJKmiwTv7lEGTJImASknXj7nCsaNod9z/Os4hkuveB1pRS
	 D/EKTrG7OZ0xMxZ8ZQBgqO3gmFjs2ffoZYFhYwZI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 980BBF80549; Sun, 20 Aug 2023 19:26:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40337F80549;
	Sun, 20 Aug 2023 19:26:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51A87F80199; Sun, 20 Aug 2023 19:26:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0A2CF800D1
	for <alsa-devel@alsa-project.org>; Sun, 20 Aug 2023 19:26:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0A2CF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=uDpB2kYN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4ZztF9Vj
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6118421EAB;
	Sun, 20 Aug 2023 17:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692552400;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YPw/LWg5iwEjyRxxClz2i3m1RrPEm4Uj3Lk5CoF21r0=;
	b=uDpB2kYNJVU4eq4dePGOMXyeZIAHzfouhosTeB1ko39J+T4cp1WWiV4MB7mE+k7HX7C8Nn
	QHYHwMBqfUJhR9G0TFvNtH//QereHs4WXzONe2PWbDrA9KnOsXByXX1fbGkav1fxbn5p0t
	pCeVkIhnGVxQl4fG5a17hsICUYoh4Js=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692552400;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YPw/LWg5iwEjyRxxClz2i3m1RrPEm4Uj3Lk5CoF21r0=;
	b=4ZztF9VjTnOZm1umoElYu6xsWVX5Wvj06Gp8xVOM+wql7skkMRPTKlVIPgno1VfKGA7mvN
	3TnHxY8hOZ7F4sAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3ADAC133F7;
	Sun, 20 Aug 2023 17:26:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id MLl3DdBM4mTjZgAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 20 Aug 2023 17:26:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH 2/2] ALSA: hda/tas2781: Fix PM refcount unbalance at
 tas2781_hda_bind()
Date: Sun, 20 Aug 2023 19:26:35 +0200
Message-Id: <20230820172635.22236-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230820172635.22236-1-tiwai@suse.de>
References: <20230820172635.22236-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DKP4VBMW3N4A4LGYG5EBYUAJ2Y4M2TH2
X-Message-ID-Hash: DKP4VBMW3N4A4LGYG5EBYUAJ2Y4M2TH2
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DKP4VBMW3N4A4LGYG5EBYUAJ2Y4M2TH2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The error path of tas2781_hda_bind() needs to release PM refcount as
well.  Modify the code flow to handle properly.

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Closes: https://lore.kernel.org/r/9f910785-e856-1539-e3e4-c9817af5fe67@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/tas2781_hda_i2c.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 0968ae915fd0..aa9ce3837336 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -608,15 +608,13 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 	strscpy(comps->name, dev_name(dev), sizeof(comps->name));
 
 	ret = tascodec_init(tas_priv, codec, tasdev_fw_ready);
-	if (ret)
-		return ret;
-
-	comps->playback_hook = tas2781_hda_playback_hook;
+	if (!ret)
+		comps->playback_hook = tas2781_hda_playback_hook;
 
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
-	return 0;
+	return ret;
 }
 
 static void tas2781_hda_unbind(struct device *dev,
-- 
2.35.3

