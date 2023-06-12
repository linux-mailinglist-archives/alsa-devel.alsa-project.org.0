Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F25F372B9F3
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 10:13:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DA2C826;
	Mon, 12 Jun 2023 10:12:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DA2C826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686557617;
	bh=tzuxtYI14ey8X6TsqeF5QLMQgSHLsDcAY+n603nJltA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J/17zMEgevEsP6wbcKb5k0xntYk+Kop05wosZJrW4ILRNR6zpQp8ArbmiQ3w7+QBc
	 cSByfC9UgnItJpzl/PbCGeDvFHxgdJaNmPHakvwf3HSqGSveVfPe8XOrmE52czSebS
	 85Q20U0sQB6G62XlpVsdlIy6SaEZWNPxpBeMJNB4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 017DBF805AB; Mon, 12 Jun 2023 10:11:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53781F805AB;
	Mon, 12 Jun 2023 10:11:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05C11F80155; Mon, 12 Jun 2023 10:11:29 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F4174F80155
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 10:11:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F4174F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Ju2u7fHw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jnCp3iTP
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 26A4D2285C;
	Mon, 12 Jun 2023 08:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686557467;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U7nIBVYrXmw9VtWIn1VS8RRci0PTHOpfvkr5XIEPKwQ=;
	b=Ju2u7fHwy+/0LLEPoTgo35449ag8naF5swqvaMkFWQdqf7n5BMBeaxeqNwg/OoGjaizqcs
	WhEPHq+jP02icdDFjl+wdyf4UePQXUT3x8pVrBbW8AvkNDx0MiUjn7fYVh63VIVn285OTx
	x/EIPPV6d+2NWTAzC3YPrEizjg04p8c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686557467;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U7nIBVYrXmw9VtWIn1VS8RRci0PTHOpfvkr5XIEPKwQ=;
	b=jnCp3iTP9WO8mM0CqVP+ad8idfMLMO2FFnp1cA4wjTZRdR3h9ZqFHpdRydpAklYCQpUyKH
	rsTjHvgUNbHPxKCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 04D10138EC;
	Mon, 12 Jun 2023 08:11:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KAMvABvThmSLcAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 12 Jun 2023 08:11:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] ALSA: seq: ump: Notify UMP protocol change to sequencer
Date: Mon, 12 Jun 2023 10:10:52 +0200
Message-Id: <20230612081054.17200-9-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230612081054.17200-1-tiwai@suse.de>
References: <20230612081054.17200-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WX2GN7N4XUDUU3SXOWJSEXB6GMU7J55H
X-Message-ID-Hash: WX2GN7N4XUDUU3SXOWJSEXB6GMU7J55H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WX2GN7N4XUDUU3SXOWJSEXB6GMU7J55H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

UMP v1.1 supports the protocol switch via a UMP Stream message.  When
it's received, we need to take care of the midi_version field in the
corresponding sequencer client, too.

This patch introduces a new ops to notify the protocol change to
snd_seq_ump_ops for handling it.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/ump.h             |  1 +
 sound/core/seq/seq_ump_client.c | 10 ++++++++++
 sound/core/ump.c                | 13 +++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/include/sound/ump.h b/include/sound/ump.h
index 0e9c048346fa..68478e7be3b4 100644
--- a/include/sound/ump.h
+++ b/include/sound/ump.h
@@ -72,6 +72,7 @@ struct snd_seq_ump_ops {
 			      const u32 *data, int words);
 	int (*notify_fb_change)(struct snd_ump_endpoint *ump,
 				struct snd_ump_block *fb);
+	int (*switch_protocol)(struct snd_ump_endpoint *ump);
 };
 
 struct snd_ump_block {
diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
index 901a670dcb36..fe21c801af74 100644
--- a/sound/core/seq/seq_ump_client.c
+++ b/sound/core/seq/seq_ump_client.c
@@ -439,9 +439,19 @@ static int seq_ump_notify_fb_change(struct snd_ump_endpoint *ump,
 	return 0;
 }
 
+/* UMP protocol change notification; just update the midi_version field */
+static int seq_ump_switch_protocol(struct snd_ump_endpoint *ump)
+{
+	if (!ump->seq_client)
+		return -ENODEV;
+	setup_client_midi_version(ump->seq_client);
+	return 0;
+}
+
 static const struct snd_seq_ump_ops seq_ump_ops = {
 	.input_receive = seq_ump_input_receive,
 	.notify_fb_change = seq_ump_notify_fb_change,
+	.switch_protocol = seq_ump_switch_protocol,
 };
 
 /* create a sequencer client and ports for the given UMP endpoint */
diff --git a/sound/core/ump.c b/sound/core/ump.c
index c0cda12bce10..f364bb290d3a 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -657,14 +657,27 @@ static int ump_handle_product_id_msg(struct snd_ump_endpoint *ump,
 				 buf->raw, 2);
 }
 
+/* notify the protocol change to sequencer */
+static void seq_notify_protocol(struct snd_ump_endpoint *ump)
+{
+#if IS_ENABLED(CONFIG_SND_SEQUENCER)
+	if (ump->seq_ops && ump->seq_ops->switch_protocol)
+		ump->seq_ops->switch_protocol(ump);
+#endif /* CONFIG_SND_SEQUENCER */
+}
+
 /* handle EP stream config message; update the UMP protocol */
 static int ump_handle_stream_cfg_msg(struct snd_ump_endpoint *ump,
 				     const union snd_ump_stream_msg *buf)
 {
+	unsigned int old_protocol = ump->info.protocol;
+
 	ump->info.protocol =
 		(buf->stream_cfg.protocol << 8) | buf->stream_cfg.jrts;
 	ump_dbg(ump, "Current protocol = %x (caps = %x)\n",
 		ump->info.protocol, ump->info.protocol_caps);
+	if (ump->parsed && ump->info.protocol != old_protocol)
+		seq_notify_protocol(ump);
 	return 1; /* finished */
 }
 
-- 
2.35.3

