Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F2C722C0D
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 18:00:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA77C820;
	Mon,  5 Jun 2023 17:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA77C820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685980847;
	bh=Ys4G7efCl5ftcSfvykLM9U7hkneQAUwi2fkIi20ePq8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uuNf7YnPx4/8ydL9orWpUprMFGTk4WrTCyHja+m+70F8hxOITYtd7MQspweifjxs1
	 pIS/P49vkp9qfuQn/ObCzwuZan+UkvkZrvmhWorPDHhYT8p5Ddf75DNytDOAlxROjN
	 JOKuiXHNdPkkE3LRUQhjx18qUNbAg+xntWoMktDI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19BC3F80130; Mon,  5 Jun 2023 17:59:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A94FDF8016C;
	Mon,  5 Jun 2023 17:59:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15793F80199; Mon,  5 Jun 2023 17:59:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8F6AF80130
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 17:59:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8F6AF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=bZd+M9W8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=UlwtviBf
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5096821B6A;
	Mon,  5 Jun 2023 15:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1685980787;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eu1I2VxNxYLelYuXRTRPQCjYwD1s0kHSvFJ6uQbX/Qo=;
	b=bZd+M9W82Iwoclc4xCkuwxs6UCznZcie2+5UT5mR8QG9kfX4y6EU7UML9GuB6u5qPOANKo
	+F/EgDdSKcjt4XAavJTvRwYWQi9DKf8RwX5QuhCHo5prf28+uJQ5TJRUs7zY4W9xQD68gJ
	zjVH0w0elFSL+N8An5UIFJS7yZVDua4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1685980787;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eu1I2VxNxYLelYuXRTRPQCjYwD1s0kHSvFJ6uQbX/Qo=;
	b=UlwtviBfR9fQUT7zL0anBTXbCBU12CAkeTq1a3UQx9aE0pf1a/On5yr8PzpUZP9U+/8hb2
	Uf+X2TtFRiFmffBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2F8F3139C7;
	Mon,  5 Jun 2023 15:59:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id NCVjCnMGfmRhBwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 05 Jun 2023 15:59:47 +0000
Date: Mon, 05 Jun 2023 17:59:46 +0200
Message-ID: <87sfb5hpcd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Gong, Sishuai" <sishuai@purdue.edu>
Cc: "tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: A data race between snd_seq_oss_midi_open and
 snd_seq_oss_midi_filemode
In-Reply-To: <7DC9AF71-F481-4ABA-955F-76C535661E33@purdue.edu>
References: <7DC9AF71-F481-4ABA-955F-76C535661E33@purdue.edu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: NS6PA52C5I62CRUR3WKERLPE7H3D6PI3
X-Message-ID-Hash: NS6PA52C5I62CRUR3WKERLPE7H3D6PI3
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NS6PA52C5I62CRUR3WKERLPE7H3D6PI3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 29 May 2023 22:11:24 +0200,
Gong, Sishuai wrote:
> 
> Hi there,
> 
> We found a data race could happen between snd_seq_oss_midi_open() and
> snd_seq_oss_midi_filemode() over the variable mdev->opened.
> 
> When running concurrently, snd_seq_oss_midi_open() makes the return
> value of snd_seq_oss_midi_filemode() non-deterministic:
> Thread-1							Thread-2
> //snd_seq_oss_midi_filemode()		//snd_seq_oss_midi_open()
> if (mdev->opened & PERM_WRITE)
> 	mode |= SNDRV_SEQ_OSS_FILE_WRITE;
> 								mdev->opened |= PERM_READ;
> if (mdev->opened & PERM_READ)
> 	mode |= SNDRV_SEQ_OSS_FILE_READ;
> 
> It is not clear to us that whether this is a serious problem but we would like
> to report this just in case.

Thanks for the report.  Yes, the value may be overridden with the
race, as the code there has no protection.  But this shouldn't bring
too serious problems like data corruption.  At most, it'll lead to
some errors by doubly opens or such.

In anyway, below is the attempt to address the issue.


Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: seq: oss: Fix racy open/close of MIDI devices

Although snd_seq_oss_midi_open() and snd_seq_oss_midi_close() can be
called concurrently from different code paths, we have no proper data
protection against races.  Introduce open_mutex to each seq_oss_midi
object for avoiding the races.

Reported-by: "Gong, Sishuai" <sishuai@purdue.edu>
Closes: https://lore.kernel.org/r/7DC9AF71-F481-4ABA-955F-76C535661E33@purdue.edu
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/oss/seq_oss_midi.c | 35 +++++++++++++++++++------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss_midi.c b/sound/core/seq/oss/seq_oss_midi.c
index 07efb38f58ac..f2940b29595f 100644
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
2.35.3

