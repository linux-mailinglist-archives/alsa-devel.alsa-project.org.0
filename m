Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D77769B35
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 17:50:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B12D82A;
	Mon, 31 Jul 2023 17:49:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B12D82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690818636;
	bh=X78XwEB7drgtJ6rBld0VUHLqH+bzsioFacEFObC4UAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wt92LNxeYsegYP6pNd7vBvSnwaxuIkE/2NYjcoGKh0PL5b3RQ0AotA2CX7E1jOIZf
	 86OezWmoQbr7QiPCeeJSXxgQ2Ix7NM1RaqKGhY00NNgDOCx1989emIk3X+JBssE4R7
	 RDOA7KCKtQ4Ms7YYZ2KmCAj/goZ+IyeXWsBEULj4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C798F805D6; Mon, 31 Jul 2023 17:48:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA900F805C8;
	Mon, 31 Jul 2023 17:47:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5CBFF805AB; Mon, 31 Jul 2023 17:47:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D3BAF80558
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 17:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D3BAF80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=aSQqcARF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=HwDV9MZC
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3675A1F8BF;
	Mon, 31 Jul 2023 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690818446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RudEpgqBpzUZEZ/efl/S8ueFFz+2NnOYxnTv0J7PwVw=;
	b=aSQqcARF6ZJU3S16SFMmu0dkCcwxMfG0haDW29+Qc//+GtZ84W5jwQR0DByS584Tv0CjcC
	h4aRQihoQZ7lbhD+NvdpKlSF6CsghaO6ZOYYkfFd03Z94j+y48RCma+j8rYA4Soh/ZiwVE
	7atHfdFo5AnfWBFNozofSyH0VJmblJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690818446;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RudEpgqBpzUZEZ/efl/S8ueFFz+2NnOYxnTv0J7PwVw=;
	b=HwDV9MZCndvRSMI7fd+QCOBVykhYk6w41PXyUSOG84EHonZYMSCoVx55lFic9qTyMfEHNx
	bvYwEB1RHTURtYDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 161FB138EE;
	Mon, 31 Jul 2023 15:47:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id eGRRBI7Xx2Q3fwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 15:47:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 17/24] ASoC: component: Add generic PCM copy ops
Date: Mon, 31 Jul 2023 17:47:11 +0200
Message-Id: <20230731154718.31048-18-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230731154718.31048-1-tiwai@suse.de>
References: <20230731154718.31048-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HW3PX6D66ELYMCWAU3X237VW2KDAAT43
X-Message-ID-Hash: HW3PX6D66ELYMCWAU3X237VW2KDAAT43
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For following the ALSA PCM core change, a new PCM copy ops is added
toe ASoC component framework: snd_soc_component_driver receives the
copy ops, and snd_soc_pcm_component_copy() helper is provided.

This also fixes a long-standing potential bug where the ASoC driver
covers only copy_user PCM callback and misses the copy from kernel
pointers (such as OSS PCM layer), too.

As of this patch, the old copy_user is still kept, but it'll be
dropped later after all drivers are converted.

Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/soc-component.h |  7 +++++++
 sound/soc/soc-component.c     | 20 ++++++++++++++++++++
 sound/soc/soc-pcm.c           |  4 +++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 87f248a06271..d9388eac82ee 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -141,6 +141,10 @@ struct snd_soc_component_driver {
 			 struct snd_pcm_substream *substream, int channel,
 			 unsigned long pos, void __user *buf,
 			 unsigned long bytes);
+	int (*copy)(struct snd_soc_component *component,
+		    struct snd_pcm_substream *substream, int channel,
+		    unsigned long pos, sockptr_t buf,
+		    unsigned long bytes);
 	struct page *(*page)(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream,
 			     unsigned long offset);
@@ -512,6 +516,9 @@ int snd_soc_pcm_component_sync_stop(struct snd_pcm_substream *substream);
 int snd_soc_pcm_component_copy_user(struct snd_pcm_substream *substream,
 				    int channel, unsigned long pos,
 				    void __user *buf, unsigned long bytes);
+int snd_soc_pcm_component_copy(struct snd_pcm_substream *substream,
+			       int channel, unsigned long pos,
+			       sockptr_t buf, unsigned long bytes);
 struct page *snd_soc_pcm_component_page(struct snd_pcm_substream *substream,
 					unsigned long offset);
 int snd_soc_pcm_component_mmap(struct snd_pcm_substream *substream,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 4356cc320fea..efae007f0f82 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1052,6 +1052,26 @@ int snd_soc_pcm_component_sync_stop(struct snd_pcm_substream *substream)
 	return 0;
 }
 
+int snd_soc_pcm_component_copy(struct snd_pcm_substream *substream,
+			       int channel, unsigned long pos,
+			       sockptr_t buf, unsigned long bytes)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_component *component;
+	int i;
+
+	/* FIXME. it returns 1st copy now */
+	for_each_rtd_components(rtd, i, component)
+		if (component->driver->copy)
+			return soc_component_ret(
+				component,
+				component->driver->copy(
+					component, substream, channel,
+					pos, buf, bytes));
+
+	return -EINVAL;
+}
+
 int snd_soc_pcm_component_copy_user(struct snd_pcm_substream *substream,
 				    int channel, unsigned long pos,
 				    void __user *buf, unsigned long bytes)
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 8896227e4fb7..71403da28d37 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2973,7 +2973,9 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 			rtd->ops.ioctl		= snd_soc_pcm_component_ioctl;
 		if (drv->sync_stop)
 			rtd->ops.sync_stop	= snd_soc_pcm_component_sync_stop;
-		if (drv->copy_user)
+		if (drv->copy)
+			rtd->ops.copy		= snd_soc_pcm_component_copy;
+		else if (drv->copy_user)
 			rtd->ops.copy_user	= snd_soc_pcm_component_copy_user;
 		if (drv->page)
 			rtd->ops.page		= snd_soc_pcm_component_page;
-- 
2.35.3

