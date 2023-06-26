Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FC373ED89
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 23:54:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1194847;
	Mon, 26 Jun 2023 23:53:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1194847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687816463;
	bh=j2tbzpc0213yDbbWqc+HVu3RUbkNUYAwh6oWZhvuF2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ECAQsSUiRrdkPcsR2wZjrAsDOjNitFPuFEdSdsG8gQVZoPWdqEU4Ua65PXq0hPraD
	 jhGiMtvDLnCOr+Vh92O3wmx7Re2CoiZzpYm7cGTbSxZxtDGb97fuCvsWtw+Zve40Ed
	 4nTGPz/vOMLW0MSZAjndlj462UFDDu6w2IJLI5DY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CAA0F80580; Mon, 26 Jun 2023 23:52:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A170AF805AB;
	Mon, 26 Jun 2023 23:52:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5790F80431; Mon, 26 Jun 2023 23:51:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C11EEF80169
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 23:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C11EEF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BRpafYH5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A9B1460F95;
	Mon, 26 Jun 2023 21:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B277C433AB;
	Mon, 26 Jun 2023 21:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687816297;
	bh=j2tbzpc0213yDbbWqc+HVu3RUbkNUYAwh6oWZhvuF2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BRpafYH5Kox6iSyo+UQjKf0gevIlJ7ghETKI70Sf35y0W03G8ETAPmj9+DvZcnOkC
	 XWvwJRmsy2RfYxPV7pDFQ5GloqK/UU4wNVXVxyAlVOGMMGA1uYmjmBuRTAIm7YJpRG
	 p/2ogzu/GQcSLsL5qzGYy/hHvbbsxmwYDL+DSxHDImF9nnv89HUIRChR/msQuDsWVa
	 QIgaIDJlRkkX8syDoMSJdFf5WJiypbN/Z+QT/n9fK0q7GtKO2pmexAlDQwwf7ctZaT
	 qIyrHc3G9O/9f0WaTlVPAjoPct02w4O9UE2WU8GnJpuzMt8mNciwyM0PnUSOx/wj7r
	 5aBjzatZsBwwA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	"Gong, Sishuai" <sishuai@purdue.edu>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 4.14 5/5] ALSA: seq: oss: Fix racy open/close of MIDI
 devices
Date: Mon, 26 Jun 2023 17:51:30 -0400
Message-Id: <20230626215130.179740-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230626215130.179740-1-sashal@kernel.org>
References: <20230626215130.179740-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.14.319
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7GYV2WLM2HJNAW4CZSOBD7LSV2C74Q5G
X-Message-ID-Hash: 7GYV2WLM2HJNAW4CZSOBD7LSV2C74Q5G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7GYV2WLM2HJNAW4CZSOBD7LSV2C74Q5G/>
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
index cc8f06638edca..7226c03f15934 100644
--- a/sound/core/seq/oss/seq_oss_midi.c
+++ b/sound/core/seq/oss/seq_oss_midi.c
@@ -50,6 +50,7 @@ struct seq_oss_midi {
 	struct snd_midi_event *coder;	/* MIDI event coder */
 	struct seq_oss_devinfo *devinfo;	/* assigned OSSseq device */
 	snd_use_lock_t use_lock;
+	struct mutex open_mutex;
 };
 
 
@@ -184,6 +185,7 @@ snd_seq_oss_midi_check_new_port(struct snd_seq_port_info *pinfo)
 	mdev->flags = pinfo->capability;
 	mdev->opened = 0;
 	snd_use_lock_init(&mdev->use_lock);
+	mutex_init(&mdev->open_mutex);
 
 	/* copy and truncate the name of synth device */
 	strlcpy(mdev->name, pinfo->name, sizeof(mdev->name));
@@ -332,14 +334,16 @@ snd_seq_oss_midi_open(struct seq_oss_devinfo *dp, int dev, int fmode)
 	int perm;
 	struct seq_oss_midi *mdev;
 	struct snd_seq_port_subscribe subs;
+	int err;
 
 	if ((mdev = get_mididev(dp, dev)) == NULL)
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
@@ -349,14 +353,14 @@ snd_seq_oss_midi_open(struct seq_oss_devinfo *dp, int dev, int fmode)
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
@@ -381,13 +385,17 @@ snd_seq_oss_midi_open(struct seq_oss_devinfo *dp, int dev, int fmode)
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
@@ -401,10 +409,9 @@ snd_seq_oss_midi_close(struct seq_oss_devinfo *dp, int dev)
 
 	if ((mdev = get_mididev(dp, dev)) == NULL)
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
@@ -423,6 +430,8 @@ snd_seq_oss_midi_close(struct seq_oss_devinfo *dp, int dev)
 	mdev->opened = 0;
 	mdev->devinfo = NULL;
 
+ unlock:
+	mutex_unlock(&mdev->open_mutex);
 	snd_use_lock_free(&mdev->use_lock);
 	return 0;
 }
-- 
2.39.2

