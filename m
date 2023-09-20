Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAA57A94B3
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 15:23:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A33B2AEA;
	Thu, 21 Sep 2023 15:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A33B2AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695302635;
	bh=pjTYYcuxqR2SO+wbQBXfyPjcjYiJtd7Zw0fzL5SAalU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fBKNoASIEy6zZkZHZ7KEydhcrYHsJloBzHQCZG1Q8KhNdvW3CvGBk6hDZ4E++aoPW
	 PtqS7rM7O4KOmOjKfJuTV73uf42G1wTOoxdIRLG56B+QWVozP7/Z3h6UEm741XnBiL
	 Xc5b2YvD+XHD0kBaVTcHSWJ/jSan/vp82TTFr+U8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3709F80552; Thu, 21 Sep 2023 15:22:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27D46F80570;
	Thu, 21 Sep 2023 15:22:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD597F8025A; Wed, 20 Sep 2023 04:36:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L4,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.217])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AB24F800AA
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 04:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AB24F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=pO1ecoWp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Xn2eh
	TsuIkEZgo9LmLAl1j0/Kv7Gg6aMVTk7Dj5HatM=; b=pO1ecoWpYqwyk8L+R8PUl
	TuDuls0HDGYhAyNdr+GZv8hh3qXdY2M0CTn1HxpTcNcQhOtFoquF6aObnMb2ipcQ
	78VZbBQktQEn9Kf26cVmZqVx8mmPEm0yS5t42NKEFLS6TfSvGjwR3mYH9vLayBrz
	vBBqk9aCgKdwrZ/of/0qYo=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by zwqz-smtp-mta-g5-4 (Coremail) with SMTP id
 _____wAXRwV7Wgplju4nCg--.4366S4;
	Wed, 20 Sep 2023 10:35:49 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: perex@perex.cz,
	tiwai@suse.com,
	mhocko@suse.com,
	akpm@linux-foundation.org,
	make_ruc2021@163.com,
	mgorman@techsingularity.net,
	42.hyeyoo@gmail.com,
	surenb@google.com,
	alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: pcm: oss: Fix race at SNDCTL_DSP_SETTRIGGER There is a
 small race window at snd_pcm_oss_set_trigger() that is called from OSS PCM
 SNDCTL_DSP_SETTRIGGER ioctl;
 namely the function calls snd_pcm_oss_make_ready() at first,
 then takes the params_lock mutex for the rest.  When the stream is set up
 again by another thread between them, it leads to inconsistency,
 and may result in unexpected results such as NULL dereference of OSS buffer
 as a fuzzer spotted recently.
Date: Wed, 20 Sep 2023 10:35:36 +0800
Message-Id: <20230920023536.3535439-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXRwV7Wgplju4nCg--.4366S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw1rZw4kAF4DXFyxWry3Jwb_yoW8WF17pr
	s7W34rtrW7JFyvv3WkJw1aqrn8Xr95ta4Ykw48C34Fkw4Fgr4FvFykKF1FqFZYkFWDuan0
	qr4DA34UAr13AF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zifb15UUUUU=
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/1tbiVx3wC1etsZbuBgAAsE
X-MailFrom: make_ruc2021@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 67DF2BRAK4Y2GN477HABBKDAAKKPGLV4
X-Message-ID-Hash: 67DF2BRAK4Y2GN477HABBKDAAKKPGLV4
X-Mailman-Approved-At: Thu, 21 Sep 2023 13:22:11 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/67DF2BRAK4Y2GN477HABBKDAAKKPGLV4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The fix is simply to cover snd_pcm_oss_make_ready() call into the same
params_lock mutex with snd_pcm_oss_make_ready_locked() variant.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 sound/core/oss/pcm_oss.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 728c211142d1..9a830aeeba63 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2083,21 +2083,14 @@ static int snd_pcm_oss_set_trigger(struct snd_pcm_oss_file *pcm_oss_file, int tr
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
+		if (err < 0)
+			goto _skip1;
 		if (trigger & PCM_ENABLE_OUTPUT) {
 			if (runtime->oss.trigger)
 				goto _skip1;
@@ -2128,6 +2121,9 @@ static int snd_pcm_oss_set_trigger(struct snd_pcm_oss_file *pcm_oss_file, int tr
 		cmd = 0;
 		if (mutex_lock_interruptible(&runtime->oss.params_lock))
 			return -ERESTARTSYS;
+		err = snd_pcm_oss_make_ready_locked(csubstream);
+		if (err < 0)
+			goto _skip2;
 		if (trigger & PCM_ENABLE_INPUT) {
 			if (runtime->oss.trigger)
 				goto _skip2;
-- 
2.37.2

