Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C634D433E
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 10:16:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 728CA182B;
	Thu, 10 Mar 2022 10:15:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 728CA182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646903763;
	bh=NDosigngH8CExy3wWkEoTd7t3GJDvvMjC+otns5QXgo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rhzyFVtZjQvULjhabTlaU4L3BIUVTDwLt5nJCtwZakO1PyagfVNdNphWDfpqNOVE7
	 gnfGV9j3lbF0EAHnHaK2MIFAeO3BEhZ/3tTzyCpe2otjB5twrB6zR7LD+H/HvkwJpe
	 PB+PcXRvCHn8NB5RPryCWIuqAzVIskJa/asuj9m4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECF00F80515;
	Thu, 10 Mar 2022 10:14:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0947F8013C; Thu, 10 Mar 2022 10:14:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF231F8012C
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 10:14:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF231F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="p8T+h0b2"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="7VaHxRlf"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 0DBB71F443
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 09:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646903661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8t0iQNIPy162m2SrP1PBxOSISuiTqFdtuLkgwscLzBU=;
 b=p8T+h0b2gKXseqgYEjc0yKyy2iNDsma698kG+brjh7weg9g7JQLwSM0jlowVnWE+ajgxzn
 ITVA6cQiQkUmiOqm6ssiycqw1z+xGihbwnmXR6hMzLmcJzrnZGZ49V+EPEFW96+u67+8vM
 Kee7VtydSb312qiGOzy+o3Lqtut0hnQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646903661;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8t0iQNIPy162m2SrP1PBxOSISuiTqFdtuLkgwscLzBU=;
 b=7VaHxRlfwaj6VkGDCRt8bCrPzvKyXXoybQkt6K/cGHqOCx/a0q5xSInV2SO7OSiO8cfgkU
 3yqubxHrCP8NKtAQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id F20C6A3B81;
 Thu, 10 Mar 2022 09:14:20 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 3/3] pcm: direct: Check xrun/suspend before the slave
 hwptr update
Date: Thu, 10 Mar 2022 10:14:18 +0100
Message-Id: <20220310091418.1150-3-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220310091418.1150-1-tiwai@suse.de>
References: <20220310091418.1150-1-tiwai@suse.de>
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

The xrun/suspend may happen at any time and we should check it right
before the slave hwptr update.  Otherwise the hwptr value may be
screwed and get unexpected large read/write.

Reported-by: S.J. Wang <shengjiu.wang@nxp.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 src/pcm/pcm_dmix.c   | 4 ++--
 src/pcm/pcm_dshare.c | 4 ++--
 src/pcm/pcm_dsnoop.c | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/src/pcm/pcm_dmix.c b/src/pcm/pcm_dmix.c
index d00d53bef604..111fea157228 100644
--- a/src/pcm/pcm_dmix.c
+++ b/src/pcm/pcm_dmix.c
@@ -426,11 +426,11 @@ static int snd_pcm_dmix_sync_ptr(snd_pcm_t *pcm)
 	snd_pcm_direct_t *dmix = pcm->private_data;
 	int err;
 
+	if (dmix->slowptr)
+		snd_pcm_hwsync(dmix->spcm);
 	err = snd_pcm_direct_check_xrun(dmix, pcm);
 	if (err < 0)
 		return err;
-	if (dmix->slowptr)
-		snd_pcm_hwsync(dmix->spcm);
 
 	return snd_pcm_dmix_sync_ptr0(pcm, *dmix->spcm->hw.ptr);
 }
diff --git a/src/pcm/pcm_dshare.c b/src/pcm/pcm_dshare.c
index 0ff43a90d270..c46e8d6a53da 100644
--- a/src/pcm/pcm_dshare.c
+++ b/src/pcm/pcm_dshare.c
@@ -201,11 +201,11 @@ static int snd_pcm_dshare_sync_ptr(snd_pcm_t *pcm)
 	snd_pcm_direct_t *dshare = pcm->private_data;
 	int err;
 
+	if (dshare->slowptr)
+		snd_pcm_hwsync(dshare->spcm);
 	err = snd_pcm_direct_check_xrun(dshare, pcm);
 	if (err < 0)
 		return err;
-	if (dshare->slowptr)
-		snd_pcm_hwsync(dshare->spcm);
 
 	return snd_pcm_dshare_sync_ptr0(pcm, *dshare->spcm->hw.ptr);
 }
diff --git a/src/pcm/pcm_dsnoop.c b/src/pcm/pcm_dsnoop.c
index 729ff447b41f..9abbbef2c1b6 100644
--- a/src/pcm/pcm_dsnoop.c
+++ b/src/pcm/pcm_dsnoop.c
@@ -134,14 +134,14 @@ static int snd_pcm_dsnoop_sync_ptr(snd_pcm_t *pcm)
 	snd_pcm_sframes_t diff;
 	int err;
 
-	err = snd_pcm_direct_check_xrun(dsnoop, pcm);
-	if (err < 0)
-		return err;
 	if (dsnoop->slowptr)
 		snd_pcm_hwsync(dsnoop->spcm);
 	old_slave_hw_ptr = dsnoop->slave_hw_ptr;
 	snoop_timestamp(pcm);
 	slave_hw_ptr = dsnoop->slave_hw_ptr;
+	err = snd_pcm_direct_check_xrun(dsnoop, pcm);
+	if (err < 0)
+		return err;
 	diff = pcm_frame_diff(slave_hw_ptr, old_slave_hw_ptr, dsnoop->slave_boundary);
 	if (diff == 0)		/* fast path */
 		return 0;
-- 
2.34.1

