Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A472737FC8
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 13:05:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C34D883B;
	Wed, 21 Jun 2023 13:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C34D883B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687345522;
	bh=ed9fN0NNyIr3+JO+rkQNqfm3g9dsIp7/IpWQrq6ELTk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rVsI6CfwyPtzboevNwArJSFs1KdcOhA7VFOK5zbqsaf32WhkEgLkg4ZE0DAilMTyF
	 R81YLnQhBffoS8+SmrCTikDJRuhmVFhUzDRScgEqnZiIBsGu95VR+Q+hAYLkZMH9fX
	 R1itXqos900AXXugEhDgUh2swz8NqAQK06nY49Zg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88991F80163; Wed, 21 Jun 2023 13:04:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5CA1F80093;
	Wed, 21 Jun 2023 13:04:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B93E4F80022; Wed, 21 Jun 2023 13:04:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0A92F80141
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 13:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0A92F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=w5pN3oHa;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=kwXM8oRt
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 90C9521BA6;
	Wed, 21 Jun 2023 11:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1687345363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6BHUZ9fQTKfdFvWz70nExMQCtNPIrhf25ykUHDW/N9Y=;
	b=w5pN3oHaPBRIDWnMs9wT+Zt1MQz2jA1EYyLLAejahciUALWJZTUjhPicwjqbC2iYxu473b
	azC+1Z8sPHTH5zGNxWEipaPfnN6tDPTxEwTdHMQEZKf3OJ+RS0T45S+RWDA0rfTUShSuAE
	/T/iAb40RZKeAqtV5V+XPKTEGrjDWRs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687345363;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6BHUZ9fQTKfdFvWz70nExMQCtNPIrhf25ykUHDW/N9Y=;
	b=kwXM8oRtLOXdCh2NvfJ93aPzmyPF5ESpONowMbGEfDg4Z5CgBYoiIpwXwgyxZ0wIpaZCtE
	BY/IQiydbYHmwlDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 86A4113A66;
	Wed, 21 Jun 2023 11:02:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aMs4INPYkmTdHgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 21 Jun 2023 11:02:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ALSA: ump: Export snd_ump_receive_ump_val()
Date: Wed, 21 Jun 2023 13:02:41 +0200
Message-Id: <20230621110241.4751-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230621110241.4751-1-tiwai@suse.de>
References: <20230621110241.4751-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HUD4C4B3JVHNXTZVMXTOUPGS5AWEAMLB
X-Message-ID-Hash: HUD4C4B3JVHNXTZVMXTOUPGS5AWEAMLB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HUD4C4B3JVHNXTZVMXTOUPGS5AWEAMLB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is another preliminary patch for USB MIDI 2.0 gadget driver.
Export the currently local snd_ump_receive_ump_val().  It can be used
by the gadget driver for processing the UMP data.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/ump.h |  1 +
 sound/core/ump.c    | 11 ++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/sound/ump.h b/include/sound/ump.h
index 2f6a9944c6ef..44d2c2fd021d 100644
--- a/include/sound/ump.h
+++ b/include/sound/ump.h
@@ -109,6 +109,7 @@ static inline int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
 }
 #endif
 
+int snd_ump_receive_ump_val(struct snd_ump_endpoint *ump, u32 val);
 int snd_ump_switch_protocol(struct snd_ump_endpoint *ump, unsigned int protocol);
 
 /*
diff --git a/sound/core/ump.c b/sound/core/ump.c
index 5e73c9cf5919..5e17351ca984 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -263,12 +263,16 @@ static unsigned char ump_packet_words[0x10] = {
 	1, 1, 1, 2, 2, 4, 1, 1, 2, 2, 2, 3, 3, 4, 4, 4
 };
 
-/* parse the UMP packet data;
- * the data is copied onto ump->input_buf[].
+/**
+ * snd_ump_receive_ump_val - parse the UMP packet data
+ * @ump: UMP endpoint
+ * @val: UMP packet data
+ *
+ * The data is copied onto ump->input_buf[].
  * When a full packet is completed, returns the number of words (from 1 to 4).
  * OTOH, if the packet is incomplete, returns 0.
  */
-static int snd_ump_receive_ump_val(struct snd_ump_endpoint *ump, u32 val)
+int snd_ump_receive_ump_val(struct snd_ump_endpoint *ump, u32 val)
 {
 	int words;
 
@@ -284,6 +288,7 @@ static int snd_ump_receive_ump_val(struct snd_ump_endpoint *ump, u32 val)
 	}
 	return 0;
 }
+EXPORT_SYMBOL_GPL(snd_ump_receive_ump_val);
 
 /**
  * snd_ump_receive - transfer UMP packets from the device
-- 
2.35.3

