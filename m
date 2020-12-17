Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E6A2DCF83
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 11:31:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC8271851;
	Thu, 17 Dec 2020 11:30:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC8271851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608201071;
	bh=iZRB/NuIbb/yyvShRoQMnlRI+A1kVSkt9qo8lUa7kyk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EzkRuzJgIbedVaEstGBrIkboNzPGe2VJgUmBnRk92dhHZ5fneBJL+xsLKljwbUNo2
	 FRM+FXmrO8v1fhvyMQscXzJrGxHs565tU4k7X4XtB2XZ5ntJq/IlT2hV9vDVOp0GL0
	 IOefC/uL+ILZ1HuIIIsEMjr66uamwmR6ubRLqnME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C86B1F80278;
	Thu, 17 Dec 2020 11:29:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A23DF80259; Thu, 17 Dec 2020 11:29:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61383F80259
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 11:29:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61383F80259
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7F7FFAC90;
 Thu, 17 Dec 2020 10:29:24 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 1/2] pcm: Add snd_pcm_audio_tstamp_type_t constants
Date: Thu, 17 Dec 2020 11:29:20 +0100
Message-Id: <20201217102921.8616-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alex Moon <alex.r.moon@gmail.com>, David Henningsson <diwic@ubuntu.com>
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

From: David Henningsson <diwic@ubuntu.com>

These are mostly a copy-paste from the kernel headers. But since functions
snd_pcm_audio_tstamp_config make use of these they should be added to the
public API as well.

Reported-by: Alex Moon <alex.r.moon@gmail.com>
Signed-off-by: David Henningsson <diwic@ubuntu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/pcm.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/pcm.h b/include/pcm.h
index 5b0782315585..cf1eea8bbc9b 100644
--- a/include/pcm.h
+++ b/include/pcm.h
@@ -350,6 +350,20 @@ typedef enum _snd_pcm_tstamp_type {
 	SND_PCM_TSTAMP_TYPE_LAST = SND_PCM_TSTAMP_TYPE_MONOTONIC_RAW,
 } snd_pcm_tstamp_type_t;
 
+typedef enum _snd_pcm_audio_tstamp_type {
+	/**
+	 * first definition for backwards compatibility only,
+	 * maps to wallclock/link time for HDAudio playback and DEFAULT/DMA time for everything else
+	 */
+	SND_PCM_AUDIO_TSTAMP_TYPE_COMPAT = 0,
+	SND_PCM_AUDIO_TSTAMP_TYPE_DEFAULT = 1,           /**< DMA time, reported as per hw_ptr */
+	SND_PCM_AUDIO_TSTAMP_TYPE_LINK = 2,	           /**< link time reported by sample or wallclock counter, reset on startup */
+	SND_PCM_AUDIO_TSTAMP_TYPE_LINK_ABSOLUTE = 3,	   /**< link time reported by sample or wallclock counter, not reset on startup */
+	SND_PCM_AUDIO_TSTAMP_TYPE_LINK_ESTIMATED = 4,    /**< link time estimated indirectly */
+	SND_PCM_AUDIO_TSTAMP_TYPE_LINK_SYNCHRONIZED = 5, /**< link time synchronized with system time */
+	SND_PCM_AUDIO_TSTAMP_TYPE_LAST = SNDRV_PCM_AUDIO_TSTAMP_TYPE_LINK_SYNCHRONIZED
+} snd_pcm_audio_tstamp_type_t;
+
 typedef struct _snd_pcm_audio_tstamp_config {
 	/* 5 of max 16 bits used */
 	unsigned int type_requested:4;
-- 
2.26.2

