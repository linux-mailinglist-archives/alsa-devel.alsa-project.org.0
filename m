Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6554930060B
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 15:52:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF8FB1932;
	Fri, 22 Jan 2021 15:51:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF8FB1932
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611327122;
	bh=r+EXsmiYavgGPrkFFSYrJPoY5Cgb2T8ndhYJkDxGGPs=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JcAzvExKEwDLZQcJr0LUy1uYflJhNULLrCfCpRr7XzVnk3eBrbvI6SN+wWwvnewpt
	 Z1AJjWo0tg5SGicReNvcpDpWKSNDAY4IBG5Zewf+2GPvUQ0DxlnA8q1nINS8IeaBvh
	 SSrvraDQ91KSvn2alxiTuvU7l15wjac4Q5dSRrHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83070F804DF;
	Fri, 22 Jan 2021 15:49:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8D06F80227; Fri, 22 Jan 2021 15:48:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5C6EF80166
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 15:48:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5C6EF80166
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 81D72AD17;
 Fri, 22 Jan 2021 14:48:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 1/4] pcm: direct: Fix the missing appl_ptr update
Date: Fri, 22 Jan 2021 15:48:39 +0100
Message-Id: <20210122144842.8843-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122144842.8843-1-tiwai@suse.de>
References: <20210122144842.8843-1-tiwai@suse.de>
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

A snd_pcm_status() call for the direct plugins receives the status
from the slave PCM, but this doesn't contain a valid appl_ptr, since
the slave PCM for the direct plugins is in a free-wheel mode, hence
the appl_ptr is always zero.  This result in the inconsistent
status->appl_ptr and pcm->appl.ptr, hitting the recently introduced
assert() call.

Fix it by transferring the plugin's appl_ptr to the upper caller.

BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=1181194
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 src/pcm/pcm_dmix.c   | 1 +
 src/pcm/pcm_dshare.c | 1 +
 src/pcm/pcm_dsnoop.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/src/pcm/pcm_dmix.c b/src/pcm/pcm_dmix.c
index be2675aff0f3..d8495065d5d7 100644
--- a/src/pcm/pcm_dmix.c
+++ b/src/pcm/pcm_dmix.c
@@ -495,6 +495,7 @@ static int snd_pcm_dmix_status(snd_pcm_t *pcm, snd_pcm_status_t * status)
 	}
 
 	status->state = snd_pcm_dmix_state(pcm);
+	status->appl_ptr = *pcm->appl.ptr; /* slave PCM doesn't set appl_ptr */
 	status->trigger_tstamp = dmix->trigger_tstamp;
 	status->avail = snd_pcm_mmap_playback_avail(pcm);
 	status->avail_max = status->avail > dmix->avail_max ? status->avail : dmix->avail_max;
diff --git a/src/pcm/pcm_dshare.c b/src/pcm/pcm_dshare.c
index 10243013714d..dccb137be253 100644
--- a/src/pcm/pcm_dshare.c
+++ b/src/pcm/pcm_dshare.c
@@ -243,6 +243,7 @@ static int snd_pcm_dshare_status(snd_pcm_t *pcm, snd_pcm_status_t * status)
 		break;
 	}
 	status->state = snd_pcm_dshare_state(pcm);
+	status->appl_ptr = *pcm->appl.ptr; /* slave PCM doesn't set appl_ptr */
 	status->trigger_tstamp = dshare->trigger_tstamp;
 	status->avail = snd_pcm_mmap_playback_avail(pcm);
 	status->avail_max = status->avail > dshare->avail_max ? status->avail : dshare->avail_max;
diff --git a/src/pcm/pcm_dsnoop.c b/src/pcm/pcm_dsnoop.c
index c6e8cd279b53..695bf4aa340e 100644
--- a/src/pcm/pcm_dsnoop.c
+++ b/src/pcm/pcm_dsnoop.c
@@ -193,6 +193,7 @@ static int snd_pcm_dsnoop_status(snd_pcm_t *pcm, snd_pcm_status_t * status)
 	snd_pcm_status(dsnoop->spcm, status);
 	state = snd_pcm_state(dsnoop->spcm);
 	status->state = state == SND_PCM_STATE_RUNNING ? dsnoop->state : state;
+	status->appl_ptr = *pcm->appl.ptr; /* slave PCM doesn't set appl_ptr */
 	status->trigger_tstamp = dsnoop->trigger_tstamp;
 	status->avail = snd_pcm_mmap_capture_avail(pcm);
 	status->avail_max = status->avail > dsnoop->avail_max ? status->avail : dsnoop->avail_max;
-- 
2.26.2

