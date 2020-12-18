Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5B62DE758
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 17:19:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4427117B9;
	Fri, 18 Dec 2020 17:18:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4427117B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608308355;
	bh=2X4Q/S+1nBekFmDrpUdL1j43bd5tFTvgUs2qpMTWDAw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IMQtsDcpYFQZjmhCwTH9YUNeHoQy/UqiPKR7EBU7M/kSMZSIZ+6E2KeUkG46FPuJy
	 tz8ervH9fgnXqz+nz58KMK/554decBTnsgz2DFyjRnQjJJgVTV8iOHRwNwt5+UO/rz
	 tWzEwxe0wlxM2jUJ8Vq2IfBkqu3dEiNahuz9DMXw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99F5FF801F7;
	Fri, 18 Dec 2020 17:17:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C3E2F80171; Fri, 18 Dec 2020 17:17:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D7BBF80103
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 17:17:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D7BBF80103
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BDCDCACF1
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 16:17:30 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pcm: oss: Fix a few more UBSAN fixes
Date: Fri, 18 Dec 2020 17:17:30 +0100
Message-Id: <20201218161730.26596-1-tiwai@suse.de>
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

There are a few places that call round{up|down}_pow_of_two() with the
value zero, and this causes undefined behavior warnings.  Avoid
calling those macros if such a nonsense value is passed; it's a minor
optimization as well, as we handle it as either an error or a value to
be skipped, instead.

Reported-by: syzbot+33ef0b6639a8d2d42b4c@syzkaller.appspotmail.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/pcm_oss.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index de1917484647..142fc751a847 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -693,6 +693,8 @@ static int snd_pcm_oss_period_size(struct snd_pcm_substream *substream,
 
 	oss_buffer_size = snd_pcm_plug_client_size(substream,
 						   snd_pcm_hw_param_value_max(slave_params, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, NULL)) * oss_frame_size;
+	if (!oss_buffer_size)
+		return -EINVAL;
 	oss_buffer_size = rounddown_pow_of_two(oss_buffer_size);
 	if (atomic_read(&substream->mmap_count)) {
 		if (oss_buffer_size > runtime->oss.mmap_bytes)
@@ -728,17 +730,21 @@ static int snd_pcm_oss_period_size(struct snd_pcm_substream *substream,
 
 	min_period_size = snd_pcm_plug_client_size(substream,
 						   snd_pcm_hw_param_value_min(slave_params, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, NULL));
-	min_period_size *= oss_frame_size;
-	min_period_size = roundup_pow_of_two(min_period_size);
-	if (oss_period_size < min_period_size)
-		oss_period_size = min_period_size;
+	if (min_period_size) {
+		min_period_size *= oss_frame_size;
+		min_period_size = roundup_pow_of_two(min_period_size);
+		if (oss_period_size < min_period_size)
+			oss_period_size = min_period_size;
+	}
 
 	max_period_size = snd_pcm_plug_client_size(substream,
 						   snd_pcm_hw_param_value_max(slave_params, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, NULL));
-	max_period_size *= oss_frame_size;
-	max_period_size = rounddown_pow_of_two(max_period_size);
-	if (oss_period_size > max_period_size)
-		oss_period_size = max_period_size;
+	if (max_period_size) {
+		max_period_size *= oss_frame_size;
+		max_period_size = rounddown_pow_of_two(max_period_size);
+		if (oss_period_size > max_period_size)
+			oss_period_size = max_period_size;
+	}
 
 	oss_periods = oss_buffer_size / oss_period_size;
 
-- 
2.26.2

