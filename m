Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 489EE769B30
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 17:50:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AD8E83B;
	Mon, 31 Jul 2023 17:49:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AD8E83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690818608;
	bh=XfD9dXY/39Ls1ypyx0jj6tuMmx2kK3lItXvLT9Jf+Ts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kzzr8a1IiIyKLCuZfd6N2e7SrET9cG4PuJEfoeqIAPTiPCiV818dKbYvvGgyAHj0i
	 L5UXU3xzKZvHL6tz9bN2zd0kW7Zd7spsXDk7EISVtq6oZn0IUdausFypI+on30A/my
	 +qtSqu7DlAztTUFk4+QUWfeDo8qmJzI2gnGzE408=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE525F80557; Mon, 31 Jul 2023 17:47:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9B1AF80557;
	Mon, 31 Jul 2023 17:47:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B977CF8059F; Mon, 31 Jul 2023 17:47:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1500DF80551
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 17:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1500DF80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=o/xIuV1t;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=TbBnTllb
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6BE311F86B;
	Mon, 31 Jul 2023 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690818446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nBaB9M1lAodBcOr45NWA3IYJ87srM+yEXj/aUriVZwQ=;
	b=o/xIuV1tavmMt5EBH1O8HmAplsVpUmdpHz987gGAK948hAfc4xXxuaTjB8a61QqXMj0qY9
	CgcEgperz1rASLUZ13Pbl7S7OHbJ+ApADQGZbQDbgdRbzXwY8NGdFfWyZjj4oRNM99WK7D
	USF68UQsS+jdlTdYAMl3vOdqZbu1Tmg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690818446;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nBaB9M1lAodBcOr45NWA3IYJ87srM+yEXj/aUriVZwQ=;
	b=TbBnTllbMcinFEaPDkH292v72M7so/SW0gRGxM0WnNTlNqTCkrXg4Zbpm07ZVnesHKE/hK
	yLjqGBs2VpVyIwDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3C1291322C;
	Mon, 31 Jul 2023 15:47:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wDxzDY7Xx2Q3fwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 15:47:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 18/24] ASoC: mediatek: Convert to generic PCM copy ops
Date: Mon, 31 Jul 2023 17:47:12 +0200
Message-Id: <20230731154718.31048-19-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230731154718.31048-1-tiwai@suse.de>
References: <20230731154718.31048-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RZJCCILEQWBUN2JUZXJR3GLMZZGUDEAB
X-Message-ID-Hash: RZJCCILEQWBUN2JUZXJR3GLMZZGUDEAB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZJCCILEQWBUN2JUZXJR3GLMZZGUDEAB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the mediatek BT SCO driver code to use the new
unified PCM copy callback.  It's a straightforward conversion from
*_user() to *_sockptr() variants.

Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/mediatek/common/mtk-btcvsd.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index 1ba0633e542f..d54752baf338 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -696,7 +696,7 @@ static int wait_for_bt_irq(struct mtk_btcvsd_snd *bt,
 }
 
 static ssize_t mtk_btcvsd_snd_read(struct mtk_btcvsd_snd *bt,
-				   char __user *buf,
+				   sockptr_t buf,
 				   size_t count)
 {
 	ssize_t read_size = 0, read_count = 0, cur_read_idx, cont;
@@ -743,9 +743,9 @@ static ssize_t mtk_btcvsd_snd_read(struct mtk_btcvsd_snd *bt,
 		if (read_size > cont)
 			read_size = cont;
 
-		if (copy_to_user(buf + cur_buf_ofs,
-				 bt->rx_packet_buf + cur_read_idx,
-				 read_size)) {
+		if (copy_to_sockptr_offset(buf, cur_buf_ofs,
+					   bt->rx_packet_buf + cur_read_idx,
+					   read_size)) {
 			dev_warn(bt->dev, "%s(), copy_to_user fail\n",
 				 __func__);
 			return -EFAULT;
@@ -777,7 +777,7 @@ static ssize_t mtk_btcvsd_snd_read(struct mtk_btcvsd_snd *bt,
 }
 
 static ssize_t mtk_btcvsd_snd_write(struct mtk_btcvsd_snd *bt,
-				    char __user *buf,
+				    sockptr_t buf,
 				    size_t count)
 {
 	int written_size = count, avail, cur_write_idx, write_size, cont;
@@ -835,10 +835,10 @@ static ssize_t mtk_btcvsd_snd_write(struct mtk_btcvsd_snd *bt,
 		if (write_size > cont)
 			write_size = cont;
 
-		if (copy_from_user(bt->tx_packet_buf +
-				   cur_write_idx,
-				   buf + cur_buf_ofs,
-				   write_size)) {
+		if (copy_from_sockptr_offset(bt->tx_packet_buf +
+					     cur_write_idx,
+					     buf, cur_buf_ofs,
+					     write_size)) {
 			dev_warn(bt->dev, "%s(), copy_from_user fail\n",
 				 __func__);
 			return -EFAULT;
@@ -1033,7 +1033,7 @@ static snd_pcm_uframes_t mtk_pcm_btcvsd_pointer(
 static int mtk_pcm_btcvsd_copy(struct snd_soc_component *component,
 			       struct snd_pcm_substream *substream,
 			       int channel, unsigned long pos,
-			       void __user *buf, unsigned long count)
+			       sockptr_t buf, unsigned long count)
 {
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(component);
 
@@ -1274,7 +1274,7 @@ static const struct snd_soc_component_driver mtk_btcvsd_snd_platform = {
 	.prepare	= mtk_pcm_btcvsd_prepare,
 	.trigger	= mtk_pcm_btcvsd_trigger,
 	.pointer	= mtk_pcm_btcvsd_pointer,
-	.copy_user	= mtk_pcm_btcvsd_copy,
+	.copy		= mtk_pcm_btcvsd_copy,
 };
 
 static int mtk_btcvsd_snd_probe(struct platform_device *pdev)
-- 
2.35.3

