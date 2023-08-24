Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E33EF7868F0
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 09:53:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7850847;
	Thu, 24 Aug 2023 09:52:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7850847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692863585;
	bh=xPCT3NsNRbLOG+AW+xJoq7xOPilqnCoUb+vLICWfNnA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qI53Bs4p/bWDN+tRkip1jv6DAoSWied00htOpBqwPnDf0y6JrImdXo+SK0orOqYAV
	 mw8kQK8YSqORU1DyEu4ZakKAyN/EWTH/5mvG3nVDPefMML52R24JiCCUqvYin4+FTr
	 l9JMi9Lj270WXWBFyPicB9LiarrQh0Ne32pxiwgw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1F12F80571; Thu, 24 Aug 2023 09:51:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19CC4F80563;
	Thu, 24 Aug 2023 09:51:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A548AF8023B; Thu, 24 Aug 2023 09:51:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E813FF800AE
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 09:51:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E813FF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=SBAmdKt1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=BE0CRwJG
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0FC8720EC5;
	Thu, 24 Aug 2023 07:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692863471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/OLEz+UIgu3tdvoZt/9/0eiI2AmbXCKSCzElLZ71oE8=;
	b=SBAmdKt1IsUbbbEzw8ilBc9l4X6Cyn021T43xODU5oAJbnous3q8t5ZhBxFsyE478QBSgg
	71xaTMxW6aQL9ilEfU4PJ0qDpMeJg9CvfN7LYbBR54czJNvo5LLMwl96lpjEtnLBPcWdjI
	tH2zJXiBPxc4RTJIAKeq37r/2ur8WE0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692863471;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/OLEz+UIgu3tdvoZt/9/0eiI2AmbXCKSCzElLZ71oE8=;
	b=BE0CRwJGIZEQlq0Ri6HZKcm1XGbOjuN80F9W6PSQ98Yy9BvsBzvYPlKS/xTeuAQg2clFdr
	NRHpksAxpp0piJBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E6AA3139BC;
	Thu, 24 Aug 2023 07:51:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iCF+N+4L52TtLAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 24 Aug 2023 07:51:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ALSA: ump: Fill group names for legacy rawmidi substreams
Date: Thu, 24 Aug 2023 09:51:06 +0200
Message-Id: <20230824075108.29958-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230824075108.29958-1-tiwai@suse.de>
References: <20230824075108.29958-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PWEBJ56GSCMQ5YICNB4J2IRVP25PW33F
X-Message-ID-Hash: PWEBJ56GSCMQ5YICNB4J2IRVP25PW33F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PWEBJ56GSCMQ5YICNB4J2IRVP25PW33F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To make it clearer which legacy substream corresponds to which UMP
group, fill the subname field of each substream object with the group
number and the endpoint name, e.g. "Group 1 (My Device)".

Ideally speaking, we should have some better link information to the
derived UMP, but it's another feature extension.

Fixes: 0b5288f5fe63 ("ALSA: ump: Add legacy raw MIDI support")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index 2cffd3686339..beb439f25b09 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -1123,6 +1123,16 @@ static void process_legacy_input(struct snd_ump_endpoint *ump, const u32 *src,
 	spin_unlock_irqrestore(&ump->legacy_locks[dir], flags);
 }
 
+static void fill_substream_names(struct snd_ump_endpoint *ump,
+				 struct snd_rawmidi *rmidi, int dir)
+{
+	struct snd_rawmidi_substream *s;
+
+	list_for_each_entry(s, &rmidi->streams[dir].substreams, list)
+		snprintf(s->name, sizeof(s->name), "Group %d (%s)",
+			 s->number + 1, ump->info.name);
+}
+
 int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
 				  char *id, int device)
 {
@@ -1156,6 +1166,11 @@ int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
 	rmidi->ops = &snd_ump_legacy_ops;
 	rmidi->private_data = ump;
 	ump->legacy_rmidi = rmidi;
+	if (input)
+		fill_substream_names(ump, rmidi, SNDRV_RAWMIDI_STREAM_INPUT);
+	if (output)
+		fill_substream_names(ump, rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT);
+
 	ump_dbg(ump, "Created a legacy rawmidi #%d (%s)\n", device, id);
 	return 0;
 }
-- 
2.35.3

