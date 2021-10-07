Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4604A424F5D
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 10:36:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDF8A1687;
	Thu,  7 Oct 2021 10:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDF8A1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633595817;
	bh=mvh1k5AgkA3HKCm3i73ljRVhKNwdNa6eYcdvlp+OdVU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CdVhS8PTpLWluqB/l4ZuoyBQe9nwDFQl7MIeMvpEmdFQPLUa0KfBeOv5DgnGhRY79
	 8JOyzLrxtnt8T63+eRip6MyOo/Mmr/lWrpddHMrgagYRTJT2qDwHSOlTlQdU8D1cFb
	 94pA5H/it1ce4HfjaSvx3g4WHQ+aQkaF3bwanhM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48E1DF8028B;
	Thu,  7 Oct 2021 10:35:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61A69F8027D; Thu,  7 Oct 2021 10:35:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3350CF800FE
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 10:35:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3350CF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="LvBWHypR"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="jUz7j0F0"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id B02D020078
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 08:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633595730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=a9zHsZ8EQI0lGr3nKN8Gpr1ibvuvNaj/qJI0rVLijpw=;
 b=LvBWHypRYNMOY0CKyYoRnyHMGOoZj/JF3lbAesCK+fgcvxr2qQ5G6ZUyPP4EBDrudhlV2N
 sO3zfQGmMoQ+JYFfAlmjY5DmAUXoKlC7kns0X/bt09R3dq6x/MtziSnU2+WIyCc57PqNq+
 2CZuSJ8P7To/5puXbtIvkiKj/5QpCs0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633595730;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=a9zHsZ8EQI0lGr3nKN8Gpr1ibvuvNaj/qJI0rVLijpw=;
 b=jUz7j0F0Y5LaoAoArdQiMUCVCFaIgMyZis2Se7GVdpjFTnRTByHAMYdLl9dI2YZLXpklgK
 YB9jTGfwUhRkqLBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id A0732A3B83;
 Thu,  7 Oct 2021 08:35:30 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Pass JOINT_DUPLEX info flag for implicit fb
 streams
Date: Thu,  7 Oct 2021 10:35:28 +0200
Message-Id: <20211007083528.4184-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

When a stream is in the implicit feedback mode, it's more or less tied
with a capture stream.  Passing SNDRV_PCM_INFO_JOINT_DUPLEX may help
for user-space to understand the situation.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index f09c7380a923..3bb095a3c9b6 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1080,6 +1080,13 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 	if (err < 0)
 		return err;
 
+	list_for_each_entry(fp, &subs->fmt_list, list) {
+		if (fp->implicit_fb) {
+			runtime->hw.info |= SNDRV_PCM_INFO_JOINT_DUPLEX;
+			break;
+		}
+	}
+
 	return 0;
 }
 
-- 
2.31.1

