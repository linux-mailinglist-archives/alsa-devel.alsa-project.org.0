Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 103F873ED5F
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 23:53:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8540A83A;
	Mon, 26 Jun 2023 23:52:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8540A83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687816381;
	bh=HB5ik3gv4Co5XN3kmgZPaP1UTspqkoXwyNIw4+YFVPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ls2kHpROz0opWlQ2MqebnS1UKHGcqkKS0f455lmlbB4QGbbjuw6vubg8Ih5B890ZO
	 s7F/mjig0V7EC3lwm45WHk3K8ho+70FhtAXc1s/i5eqWRR16LZa1sl3mKqAKRKYuCl
	 PcYrGxPLsdxAQsZSAsjVB8mFffkPFrRk0huhmcO8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0987F80169; Mon, 26 Jun 2023 23:51:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C560F80169;
	Mon, 26 Jun 2023 23:51:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C38CF80535; Mon, 26 Jun 2023 23:51:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CB1AF80093
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 23:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CB1AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=M4unscMC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8932760F8F;
	Mon, 26 Jun 2023 21:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F6AC433C9;
	Mon, 26 Jun 2023 21:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687816257;
	bh=HB5ik3gv4Co5XN3kmgZPaP1UTspqkoXwyNIw4+YFVPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M4unscMCEB9mWzGVGQmjPLTJB59J4YIkcW4cgcBhwDmpPy7BOzaxoQntW4tPsJACl
	 fIneVwpFJsM8U+Pv2huClevabHx8e7oUZ1vkO2uyCQ6EzZMPtn+CixgX8cKGcs6waO
	 c+BvKR+Y9bBpkdRzmSp2aHY88M3nPCoq2HTsB/RCe4WNhLJ/Ap+1LSHCP+KNrpRT92
	 iXrJ8itefetNi+fLeLA/zNI+bNJjZxdgVNMhZUqZYsfjDZ1kpiituMpGPHmGEobYJC
	 lLUebIlbMDeJ8CDYN4Aaa3ONJI/+K0biLSB7xhWKtrapcZdJn1DVYwEX//zBw6Z1+z
	 XnuPmXY8uddgg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	"Gong, Sishuai" <sishuai@purdue.edu>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.1 15/15] ALSA: seq: oss: Fix racy open/close of MIDI
 devices
Date: Mon, 26 Jun 2023 17:50:31 -0400
Message-Id: <20230626215031.179159-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230626215031.179159-1-sashal@kernel.org>
References: <20230626215031.179159-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.35
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GN4RZHEYQ7QTLNTDUU37IF3X5XWPKSHP
X-Message-ID-Hash: GN4RZHEYQ7QTLNTDUU37IF3X5XWPKSHP
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GN4RZHEYQ7QTLNTDUU37IF3X5XWPKSHP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 297224fc0922e7385573a30c29ffdabb67f27b7d ]

Although snd_seq_oss_midi_open() and snd_seq_oss_midi_close() can be
called concurrently from different code paths, we have no proper data
protection against races.  Introduce open_mutex to each seq_oss_midi
object for avoiding the races.

Reported-by: "Gong, Sishuai" <sishuai@purdue.edu>
Closes: https://lore.kernel.org/r/7DC9AF71-F481-4ABA-955F-76C535661E33@purdue.edu
Link: https://lore.kernel.org/r/20230612125533.27461-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/core/seq/oss/seq_oss_midi.c | 35 +++++++++++++++++++------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss_midi.c b/sound/core/seq/oss/seq_oss_midi.c
index 07efb38f58ac1..f2940b29595f0 100644
--- a/sound/core/seq/oss/seq_oss_midi.c
+++ b/sound/core/seq/oss/seq_oss_midi.c
@@ -37,6 +37,7 @@ struct seq_oss_midi {
 	struct snd_midi_event *coder;	/* MIDI event coder */
 	struct seq_oss_devinfo *devinfo;	/* assigned OSSseq device */
 	snd_use_lock_t use_lock;
+	struct mutex open_mutex;
 };
 
 
@@ -172,6 +173,7 @@ snd_seq_oss_midi_check_new_port(struct snd_seq_port_info *pinfo)
 	mdev->flags = pinfo->capability;
 	mdev->opened = 0;
 	snd_use_lock_init(&mdev->use_lock);
+	mutex_init(&mdev->open_mutex);
 
 	/* copy and truncate the name of synth device */
 	strscpy(mdev->name, pinfo->name, sizeof(mdev->name));
@@ -322,15 +324,17 @@ snd_seq_oss_midi_open(struct seq_oss_devinfo *dp, int dev, int fmode)
 	int perm;
 	struct seq_oss_midi *mdev;
 	struct snd_seq_port_subscribe subs;
+	int err;
 
 	mdev = get_mididev(dp, dev);
 	if (!mdev)
 		return -ENODEV;
 
+	mutex_lock(&mdev->open_mutex);
 	/* already used? */
 	if (mdev->opened && mdev->devinfo != dp) {
-		snd_use_lock_free(&mdev->use_lock);
-		return -EBUSY;
+		err = -EBUSY;
+		goto unlock;
 	}
 
 	perm = 0;
@@ -340,14 +344,14 @@ snd_seq_oss_midi_open(struct seq_oss_devinfo *dp, int dev, int fmode)
 		perm |= PERM_READ;
 	perm &= mdev->flags;
 	if (perm == 0) {
-		snd_use_lock_free(&mdev->use_lock);
-		return -ENXIO;
+		err = -ENXIO;
+		goto unlock;
 	}
 
 	/* already opened? */
 	if ((mdev->opened & perm) == perm) {
-		snd_use_lock_free(&mdev->use_lock);
-		return 0;
+		err = 0;
+		goto unlock;
 	}
 
 	perm &= ~mdev->opened;
@@ -372,13 +376,17 @@ snd_seq_oss_midi_open(struct seq_oss_devinfo *dp, int dev, int fmode)
 	}
 
 	if (! mdev->opened) {
-		snd_use_lock_free(&mdev->use_lock);
-		return -ENXIO;
+		err = -ENXIO;
+		goto unlock;
 	}
 
 	mdev->devinfo = dp;
+	err = 0;
+
+ unlock:
+	mutex_unlock(&mdev->open_mutex);
 	snd_use_lock_free(&mdev->use_lock);
-	return 0;
+	return err;
 }
 
 /*
@@ -393,10 +401,9 @@ snd_seq_oss_midi_close(struct seq_oss_devinfo *dp, int dev)
 	mdev = get_mididev(dp, dev);
 	if (!mdev)
 		return -ENODEV;
-	if (! mdev->opened || mdev->devinfo != dp) {
-		snd_use_lock_free(&mdev->use_lock);
-		return 0;
-	}
+	mutex_lock(&mdev->open_mutex);
+	if (!mdev->opened || mdev->devinfo != dp)
+		goto unlock;
 
 	memset(&subs, 0, sizeof(subs));
 	if (mdev->opened & PERM_WRITE) {
@@ -415,6 +422,8 @@ snd_seq_oss_midi_close(struct seq_oss_devinfo *dp, int dev)
 	mdev->opened = 0;
 	mdev->devinfo = NULL;
 
+ unlock:
+	mutex_unlock(&mdev->open_mutex);
 	snd_use_lock_free(&mdev->use_lock);
 	return 0;
 }
-- 
2.39.2

