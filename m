Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F837A9569
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 17:03:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEBEA886;
	Thu, 21 Sep 2023 17:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEBEA886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695308589;
	bh=4WzetQSPw2te3zV/K/MvlY4E9/UX0Ob0c5B0PiDJ3dI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HP1OWInG0x4D98hKGsWeFwT7/22FJJpMd29KLDcgPLJ54PdO1DTlpgA66fmsSjhcW
	 q/nwMa/j87mh9NE9axn/rfPmbd9BnvM7JFsLhqnpGEWh987i5y8z+JT+nldw2QhjPc
	 yLZguqo95eBS4CwiJE0DLu7wQIk9JaJZd7P0Uo0w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A5BAF8055A; Thu, 21 Sep 2023 17:01:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6411BF801F5;
	Thu, 21 Sep 2023 17:01:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87E74F8025A; Thu, 21 Sep 2023 15:59:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by alsa1.perex.cz (Postfix) with ESMTP id 29838F80125
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 15:59:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29838F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=jEld0S9T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=dYA8P
	Cj99iLRdyoyYBjJLxLOVqaLYfVJNL2JuxPnWLg=; b=jEld0S9TjuEazwVnVmPH6
	BYeeN9nuBTm6DoLnP+ic8bnyobtINSJDWcnEQQU9nLvn8IRjpJVbntkpxzGiMtUw
	YsPez8XH+AA84/RgdSPadW/HOQL5SqZg7z0AetxW76WNCwqD1MAYYPOuAI1dLNpW
	nFyJqO+SXohmJyl9U+ovcs=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by zwqz-smtp-mta-g1-1 (Coremail) with SMTP id
 _____wAnzS0PTAxlwZW1Cg--.8902S4;
	Thu, 21 Sep 2023 21:58:53 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: perex@perex.cz,
	tiwai@suse.com,
	mhocko@suse.com,
	mgorman@techsingularity.net,
	42.hyeyoo@gmail.com,
	make_ruc2021@163.com,
	surenb@google.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] ALSA: pcm: oss: Fix race at SNDCTL_DSP_SETTRIGGER
Date: Thu, 21 Sep 2023 21:58:37 +0800
Message-Id: <20230921135837.3590897-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAnzS0PTAxlwZW1Cg--.8902S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7CrW7trWUKF1UAw47ZF4Utwb_yoW8uw48pr
	s3Wa4Fqr9rJFZ2vw1kJwnFvr15XF95ta45Kw48G34Fyws5Wr4F9F93KF9Y9FZYkFWDWan0
	vr4DAryUCr13AF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEQ6pDUUUUU=
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/1tbiVwTxC1etsahzQQACs6
X-MailFrom: make_ruc2021@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: E3INFG6NSZEP654N7AWNM2Y4X3DXM7JW
X-Message-ID-Hash: E3INFG6NSZEP654N7AWNM2Y4X3DXM7JW
X-Mailman-Approved-At: Thu, 21 Sep 2023 15:01:55 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E3INFG6NSZEP654N7AWNM2Y4X3DXM7JW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a small race window at snd_pcm_oss_set_trigger() that is
called from OSS PCM SNDCTL_DSP_SETTRIGGER ioctl; namely the function
calls snd_pcm_oss_make_ready() at first, then takes the params_lock
mutex for the rest. When the stream is set up again by another thread
between them, it leads to inconsistency, and may result in unexpected
results such as NULL dereference of OSS buffer as a fuzzer spotted
recently.
The fix is simply to cover snd_pcm_oss_make_ready() call into the same
params_lock mutex with snd_pcm_oss_make_ready_locked() variant.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 sound/core/oss/pcm_oss.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 728c211142d1..fd9d23c3684b 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2083,21 +2083,16 @@ static int snd_pcm_oss_set_trigger(struct snd_pcm_oss_file *pcm_oss_file, int tr
 	psubstream = pcm_oss_file->streams[SNDRV_PCM_STREAM_PLAYBACK];
 	csubstream = pcm_oss_file->streams[SNDRV_PCM_STREAM_CAPTURE];
 
-	if (psubstream) {
-		err = snd_pcm_oss_make_ready(psubstream);
-		if (err < 0)
-			return err;
-	}
-	if (csubstream) {
-		err = snd_pcm_oss_make_ready(csubstream);
-		if (err < 0)
-			return err;
-	}
       	if (psubstream) {
       		runtime = psubstream->runtime;
 		cmd = 0;
 		if (mutex_lock_interruptible(&runtime->oss.params_lock))
 			return -ERESTARTSYS;
+		err = snd_pcm_oss_make_ready_locked(psubstream);
+		if (err < 0) {
+			mutex_unlock(&runtime->oss.params_lock);
+			return err;
+		}
 		if (trigger & PCM_ENABLE_OUTPUT) {
 			if (runtime->oss.trigger)
 				goto _skip1;
@@ -2128,6 +2123,11 @@ static int snd_pcm_oss_set_trigger(struct snd_pcm_oss_file *pcm_oss_file, int tr
 		cmd = 0;
 		if (mutex_lock_interruptible(&runtime->oss.params_lock))
 			return -ERESTARTSYS;
+		err = snd_pcm_oss_make_ready_locked(csubstream);
+		if (err < 0) {
+			mutex_unlock(&runtime->oss.params_lock);
+			return err;
+		}
 		if (trigger & PCM_ENABLE_INPUT) {
 			if (runtime->oss.trigger)
 				goto _skip2;
-- 
2.37.2

