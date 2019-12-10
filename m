Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2B711805E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:24:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3114E1694;
	Tue, 10 Dec 2019 07:23:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3114E1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575959070;
	bh=GUAps4e7Hmkoft5/IUybF7iLWXk45VmrWOafIHXI73M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=It5OARfCKu8MhUhpG/o56mRZzrioUa23eM3L3/PpyLGHC9tPYJxbEEOY9FgxW4dnu
	 qDN2lnkcdeYZaf+6kZKY9WU8e7n9nOiCgdxB/NzFk761QpMrB2AHPssEpbt2RP8+pP
	 /DlcovQwuy+tSSOY/6wxLgHHo7WvcBmK1z4TK4tE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76B31F80323;
	Tue, 10 Dec 2019 07:13:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB74AF802C2; Tue, 10 Dec 2019 07:12:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AA29F80260
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:11:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AA29F80260
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 45EC0B1E9
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:11:52 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:11:39 +0100
Message-Id: <20191210061145.24641-18-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210061145.24641-1-tiwai@suse.de>
References: <20191210061145.24641-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 17/23] ALSA: ppc: Drop superfluous ioctl PCM ops
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

PCM core deals the empty ioctl field now as default.
Let's kill the redundant lines.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/ppc/pmac.c    | 2 --
 sound/ppc/snd_ps3.c | 1 -
 2 files changed, 3 deletions(-)

diff --git a/sound/ppc/pmac.c b/sound/ppc/pmac.c
index 1629f91d7ae2..026410c7dd71 100644
--- a/sound/ppc/pmac.c
+++ b/sound/ppc/pmac.c
@@ -653,7 +653,6 @@ static int snd_pmac_capture_close(struct snd_pcm_substream *subs)
 static const struct snd_pcm_ops snd_pmac_playback_ops = {
 	.open =		snd_pmac_playback_open,
 	.close =	snd_pmac_playback_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_pmac_playback_prepare,
 	.trigger =	snd_pmac_playback_trigger,
 	.pointer =	snd_pmac_playback_pointer,
@@ -662,7 +661,6 @@ static const struct snd_pcm_ops snd_pmac_playback_ops = {
 static const struct snd_pcm_ops snd_pmac_capture_ops = {
 	.open =		snd_pmac_capture_open,
 	.close =	snd_pmac_capture_close,
-	.ioctl =	snd_pcm_lib_ioctl,
 	.prepare =	snd_pmac_capture_prepare,
 	.trigger =	snd_pmac_capture_trigger,
 	.pointer =	snd_pmac_capture_pointer,
diff --git a/sound/ppc/snd_ps3.c b/sound/ppc/snd_ps3.c
index c6c004958e6f..2b4c0268a86b 100644
--- a/sound/ppc/snd_ps3.c
+++ b/sound/ppc/snd_ps3.c
@@ -742,7 +742,6 @@ static struct snd_kcontrol_new spdif_ctls[] = {
 static const struct snd_pcm_ops snd_ps3_pcm_spdif_ops = {
 	.open = snd_ps3_pcm_open,
 	.close = snd_ps3_pcm_close,
-	.ioctl = snd_pcm_lib_ioctl,
 	.prepare = snd_ps3_pcm_prepare,
 	.trigger = snd_ps3_pcm_trigger,
 	.pointer = snd_ps3_pcm_pointer,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
