Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 724B370D69E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 10:05:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A98A9F6;
	Tue, 23 May 2023 10:04:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A98A9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684829113;
	bh=PU2p/pCj76SMlZcRoMs8YQGaLl6OBGHN7hkAOWp5tq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OaBfwcIR2EoSArfc3Hw7neO/zaAU8rut1lu++8OqyZcXfPJofkbvs9/iPrmVf3/da
	 cIQXxBsvUq4q8EpD0/PtfATXwsLuDthDkhLvu6a3nZ0WVPgpnMX0UoNsH1UmIPGrhm
	 wAgJKxRUXr+a3afIXXJwxDo73RGg6JQPCrS7SznM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53FB8F80548; Tue, 23 May 2023 09:56:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73821F805E3;
	Tue, 23 May 2023 09:56:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 987A5F805C8; Tue, 23 May 2023 09:56:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E037EF80542
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 09:54:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E037EF80542
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=wG/pLiU0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=DjW414mY
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 54D5E21899;
	Tue, 23 May 2023 07:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684828444;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ktXHEJwRtSCCBPJ4QDB5v/NoMHF3eNfNjpM8JZRdSA=;
	b=wG/pLiU0OcYlgFzM6QRLr+INpJvf0m4Hz2GMDUZ23jkPN2DGYViq3c7pfiuDiTTWf4C5jp
	PKIuq/GvgVXqPKSbsXtMXMtz0k6eo/NtpNm3m+cMMRm6ewLEZbP6Hep6WL3Tw0dBN8y6kc
	pWQMefdPxRLLA6Gf0Skw9fiHSxNqiRQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684828444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ktXHEJwRtSCCBPJ4QDB5v/NoMHF3eNfNjpM8JZRdSA=;
	b=DjW414mYwn4rBb2KkFpafnCmgs9VHPabazpjcceVa0rlAjGheDlavBsNoHm6ApXEUo6OB7
	uS0v3nxo3u116cAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F159613588;
	Tue, 23 May 2023 07:54:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 6P4GOhtxbGT4KgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 07:54:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/37] ALSA: ump: Additional proc output
Date: Tue, 23 May 2023 09:53:27 +0200
Message-Id: <20230523075358.9672-7-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523075358.9672-1-tiwai@suse.de>
References: <20230523075358.9672-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CUSN63D3T72CS3AL6TCUJXG2V2TLI7PA
X-Message-ID-Hash: CUSN63D3T72CS3AL6TCUJXG2V2TLI7PA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CUSN63D3T72CS3AL6TCUJXG2V2TLI7PA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

UMP devices may have more interesting information than the traditional
rawmidi.  Extend the rawmidi_global_ops to allow the optional proc
info output and show some more bits in the proc file for UMP.

Note that the "Groups" field shows the first and the last UMP Groups,
and both numbers are 1-based (i.e. the first group is 1).

Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/rawmidi.h |  3 +++
 sound/core/rawmidi.c    |  2 ++
 sound/core/ump.c        | 49 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
index b8a230a7583b..b0197b1d1fe4 100644
--- a/include/sound/rawmidi.h
+++ b/include/sound/rawmidi.h
@@ -18,6 +18,7 @@
 #if IS_ENABLED(CONFIG_SND_SEQUENCER)
 #include <sound/seq_device.h>
 #endif
+#include <sound/info.h>
 
 /*
  *  Raw MIDI interface
@@ -49,6 +50,8 @@ struct snd_rawmidi_global_ops {
 			      struct snd_seq_port_info *info);
 	long (*ioctl)(struct snd_rawmidi *rmidi, unsigned int cmd,
 		      void __user *argp);
+	void (*proc_read)(struct snd_info_entry *entry,
+			  struct snd_info_buffer *buf);
 };
 
 struct snd_rawmidi_runtime {
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index ffb5b58105f4..2d3cec908154 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -1770,6 +1770,8 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
 	if (IS_ENABLED(CONFIG_SND_UMP))
 		snd_iprintf(buffer, "Type: %s\n",
 			    rawmidi_is_ump(rmidi) ? "UMP" : "Legacy");
+	if (rmidi->ops->proc_read)
+		rmidi->ops->proc_read(entry, buffer);
 	mutex_lock(&rmidi->open_mutex);
 	if (rmidi->info_flags & SNDRV_RAWMIDI_INFO_OUTPUT) {
 		list_for_each_entry(substream,
diff --git a/sound/core/ump.c b/sound/core/ump.c
index ee57ba1ee989..651cd3752719 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -21,11 +21,14 @@ static int snd_ump_dev_register(struct snd_rawmidi *rmidi);
 static int snd_ump_dev_unregister(struct snd_rawmidi *rmidi);
 static long snd_ump_ioctl(struct snd_rawmidi *rmidi, unsigned int cmd,
 			  void __user *argp);
+static void snd_ump_proc_read(struct snd_info_entry *entry,
+			      struct snd_info_buffer *buffer);
 
 static const struct snd_rawmidi_global_ops snd_ump_rawmidi_ops = {
 	.dev_register = snd_ump_dev_register,
 	.dev_unregister = snd_ump_dev_unregister,
 	.ioctl = snd_ump_ioctl,
+	.proc_read = snd_ump_proc_read,
 };
 
 static void snd_ump_endpoint_free(struct snd_rawmidi *rmidi)
@@ -226,5 +229,51 @@ static long snd_ump_ioctl(struct snd_rawmidi *rmidi, unsigned int cmd,
 	}
 }
 
+static const char *ump_direction_string(int dir)
+{
+	switch (dir) {
+	case SNDRV_UMP_DIR_INPUT:
+		return "input";
+	case SNDRV_UMP_DIR_OUTPUT:
+		return "output";
+	case SNDRV_UMP_DIR_BIDIRECTION:
+		return "bidirection";
+	default:
+		return "unknown";
+	}
+}
+
+/* Additional proc file output */
+static void snd_ump_proc_read(struct snd_info_entry *entry,
+			      struct snd_info_buffer *buffer)
+{
+	struct snd_rawmidi *rmidi = entry->private_data;
+	struct snd_ump_endpoint *ump = rawmidi_to_ump(rmidi);
+	struct snd_ump_block *fb;
+
+	snd_iprintf(buffer, "EP Name: %s\n", ump->info.name);
+	snd_iprintf(buffer, "EP Product ID: %s\n", ump->info.product_id);
+	snd_iprintf(buffer, "UMP Version: 0x%04x\n", ump->info.version);
+	snd_iprintf(buffer, "Protocol Caps: 0x%08x\n", ump->info.protocol_caps);
+	snd_iprintf(buffer, "Protocol: 0x%08x\n", ump->info.protocol);
+	snd_iprintf(buffer, "Num Blocks: %d\n\n", ump->info.num_blocks);
+
+	list_for_each_entry(fb, &ump->block_list, list) {
+		snd_iprintf(buffer, "Block %d (%s)\n", fb->info.block_id,
+			    fb->info.name);
+		snd_iprintf(buffer, "  Direction: %s\n",
+			    ump_direction_string(fb->info.direction));
+		snd_iprintf(buffer, "  Active: %s\n",
+			    fb->info.active ? "Yes" : "No");
+		snd_iprintf(buffer, "  Groups: %d-%d\n",
+			    fb->info.first_group + 1,
+			    fb->info.first_group + fb->info.num_groups);
+		snd_iprintf(buffer, "  Is MIDI1: %s%s\n",
+			    (fb->info.flags & SNDRV_UMP_BLOCK_IS_MIDI1) ? "Yes" : "No",
+			    (fb->info.flags & SNDRV_UMP_BLOCK_IS_LOWSPEED) ? " (Low Speed)" : "");
+		snd_iprintf(buffer, "\n");
+	}
+}
+
 MODULE_DESCRIPTION("Universal MIDI Packet (UMP) Core Driver");
 MODULE_LICENSE("GPL");
-- 
2.35.3

