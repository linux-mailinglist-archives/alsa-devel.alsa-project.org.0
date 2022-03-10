Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F1C4D4424
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 11:01:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61A5B1867;
	Thu, 10 Mar 2022 11:00:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61A5B1867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646906475;
	bh=TvwRXoakGQQI3EHYMoW0++Fnjj6tsuzgkYwE7cVUDks=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tbvIxwqSYQM4walULvrrBXkqlnua7l3hbKLC0G+Nis9PgnjfHQTyf+Eyw5VMrT7aN
	 s3SXExQmcn9OSdhSsfuVTtB14OlIRCFhd8LKXP/UVtd7rNntYLroXoJ0qOmYfEbYyN
	 +jGzSnuw6cPFwqCZTbXaqEV+UYKxPqnSOtc7kr+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8F2EF80425;
	Thu, 10 Mar 2022 11:00:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83753F800D2; Thu, 10 Mar 2022 11:00:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1169BF800D2
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 11:00:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1169BF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="ciZbvCPh"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="K6BZE/K8"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 5A98F1F443
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 10:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646906420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P5N8Aa73JtYypFbUeV12FHusZ6v7tU6PoPPalTT+fyg=;
 b=ciZbvCPhPThrF/jpgSVSRqUaFGaJfzy5wVxp3U4NRv9MXjgYvM7HrSAUjrAaUaHQndgihj
 pirMc1ekkdHymFcuNBOj/u08YrkXRbQ6QxIO3yN3l3M9I9CwFRrxJ7JZn+8U/eoQakNPuh
 Btf8E/Lj1kG5fZeGk6+HC/LRfeK87uE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646906420;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P5N8Aa73JtYypFbUeV12FHusZ6v7tU6PoPPalTT+fyg=;
 b=K6BZE/K8cIojaUKzAanjhcx2TKDS4C+w7rawq349n05pedC+5IJS8f1vGq4oCJcByc/A1O
 M/jHXsA8JicO1GBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 4BBA3A3B9B;
 Thu, 10 Mar 2022 10:00:20 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib v2 3/3] pcm: direct: Check xrun/suspend before the
 slave hwptr update
Date: Thu, 10 Mar 2022 11:00:18 +0100
Message-Id: <20220310100018.10038-3-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220310100018.10038-1-tiwai@suse.de>
References: <20220310100018.10038-1-tiwai@suse.de>
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
after the slave hwptr update (but before the actual sync_ptr update in
direct pcm side).  Otherwise the hwptr value may be screwed and get
unexpected large read/write.

Reported-by: S.J. Wang <shengjiu.wang@nxp.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 src/pcm/pcm_dmix.c   | 8 +++++---
 src/pcm/pcm_dshare.c | 8 +++++---
 src/pcm/pcm_dsnoop.c | 6 +++---
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/src/pcm/pcm_dmix.c b/src/pcm/pcm_dmix.c
index d00d53bef604..c6cb47f0f840 100644
--- a/src/pcm/pcm_dmix.c
+++ b/src/pcm/pcm_dmix.c
@@ -424,15 +424,17 @@ static int snd_pcm_dmix_sync_ptr0(snd_pcm_t *pcm, snd_pcm_uframes_t slave_hw_ptr
 static int snd_pcm_dmix_sync_ptr(snd_pcm_t *pcm)
 {
 	snd_pcm_direct_t *dmix = pcm->private_data;
+	snd_pcm_uframes_t slave_hw_ptr;
 	int err;
 
+	if (dmix->slowptr)
+		snd_pcm_hwsync(dmix->spcm);
+	slave_hw_ptr = *dmix->spcm->hw.ptr;
 	err = snd_pcm_direct_check_xrun(dmix, pcm);
 	if (err < 0)
 		return err;
-	if (dmix->slowptr)
-		snd_pcm_hwsync(dmix->spcm);
 
-	return snd_pcm_dmix_sync_ptr0(pcm, *dmix->spcm->hw.ptr);
+	return snd_pcm_dmix_sync_ptr0(pcm, slave_hw_ptr);
 }
 
 /*
diff --git a/src/pcm/pcm_dshare.c b/src/pcm/pcm_dshare.c
index 0ff43a90d270..461adafc77f8 100644
--- a/src/pcm/pcm_dshare.c
+++ b/src/pcm/pcm_dshare.c
@@ -199,15 +199,17 @@ static int snd_pcm_dshare_sync_ptr0(snd_pcm_t *pcm, snd_pcm_uframes_t slave_hw_p
 static int snd_pcm_dshare_sync_ptr(snd_pcm_t *pcm)
 {
 	snd_pcm_direct_t *dshare = pcm->private_data;
+	snd_pcm_uframes_t slave_hw_ptr;
 	int err;
 
+	if (dshare->slowptr)
+		snd_pcm_hwsync(dshare->spcm);
+	slave_hw_ptr = *dshare->spcm->hw.ptr;
 	err = snd_pcm_direct_check_xrun(dshare, pcm);
 	if (err < 0)
 		return err;
-	if (dshare->slowptr)
-		snd_pcm_hwsync(dshare->spcm);
 
-	return snd_pcm_dshare_sync_ptr0(pcm, *dshare->spcm->hw.ptr);
+	return snd_pcm_dshare_sync_ptr0(pcm, slave_hw_ptr);
 }
 
 /*
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

