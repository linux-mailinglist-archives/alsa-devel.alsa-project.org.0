Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1281A77B822
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 14:02:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CD33E8A;
	Mon, 14 Aug 2023 14:02:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CD33E8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692014578;
	bh=Ju01U6+EBF+64cvKxrgZj3Ok3lYHY0u9FUDEwkQZFog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m5MVFgDVRYg6npGKWymImlLPTSv8VZKJS4bwE3BtByeQEJAb1U7GddxTbsg993nCH
	 BwlqaakbLEW0DAHDdIqsKLqjC/DF2z2Cg5hgNpR0xRIguOSNPI7/gJKu8hH/d/mohF
	 TSP9gPIlhxkYIOpMocKdqvqUqX/wJkQrvEAc6zAs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5747F8063A; Mon, 14 Aug 2023 13:57:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D91CEF80638;
	Mon, 14 Aug 2023 13:57:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C11EBF80254; Mon, 14 Aug 2023 13:56:23 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C4CDF80564
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 13:55:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C4CDF80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=JrKrUm62;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=mmQp8XcD
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 324D91FD69;
	Mon, 14 Aug 2023 11:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692014154;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WUj/3WyE77yb4NSgf1rBQIMqoolTXoucU0zdVAFFSag=;
	b=JrKrUm62IcOcUXK2vmGvocJAYkxMbCJql5LlyHo9vCDsZ0DVB3gf/5ESKJUoKA/7QxoAHY
	mPKAoTPHhR2TuGBZLZIcynnKtw2TmrghWnxU4wC6ea7RGquMKfx+zAUAp/yQJ8YeGP3Yzw
	06Rq1LEjyTdLG13DknykV5I06p9OMuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692014154;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WUj/3WyE77yb4NSgf1rBQIMqoolTXoucU0zdVAFFSag=;
	b=mmQp8XcDB10Era8Ae31nmTGj6JbC5QD0/ul0JqKjyADpFXhKyBalNNYwBww1hnMJ1ue44q
	FzsSCwx3wdrFs8Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0BA77138EE;
	Mon, 14 Aug 2023 11:55:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id yBG7AUoW2mRnMAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 14 Aug 2023 11:55:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 19/25] ASoC: mediatek: Convert to generic PCM copy ops
Date: Mon, 14 Aug 2023 13:55:17 +0200
Message-Id: <20230814115523.15279-20-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814115523.15279-1-tiwai@suse.de>
References: <20230814115523.15279-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OVD244BEJGO2JTJKFQDEQ4W5N7PJE3H7
X-Message-ID-Hash: OVD244BEJGO2JTJKFQDEQ4W5N7PJE3H7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OVD244BEJGO2JTJKFQDEQ4W5N7PJE3H7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the mediatek BT SCO driver code to use the new
unified PCM copy callback.  It's a straightforward conversion from
*_user() to *_iter() variants.  As copy_form/to_iter() updates the
internal offset at each read/write, we can drop the cur_*_idx counter
in the loop, too.

Note that copy_from/to_iter() returns the copied bytes, hence the
error condition is inverted from copy_from/to_user().

Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/mediatek/common/mtk-btcvsd.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index 1ba0633e542f..64150f3cec0e 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -696,11 +696,10 @@ static int wait_for_bt_irq(struct mtk_btcvsd_snd *bt,
 }
 
 static ssize_t mtk_btcvsd_snd_read(struct mtk_btcvsd_snd *bt,
-				   char __user *buf,
+				   struct iov_iter *buf,
 				   size_t count)
 {
 	ssize_t read_size = 0, read_count = 0, cur_read_idx, cont;
-	unsigned int cur_buf_ofs = 0;
 	unsigned long avail;
 	unsigned long flags;
 	unsigned int packet_size = bt->rx->packet_size;
@@ -743,9 +742,8 @@ static ssize_t mtk_btcvsd_snd_read(struct mtk_btcvsd_snd *bt,
 		if (read_size > cont)
 			read_size = cont;
 
-		if (copy_to_user(buf + cur_buf_ofs,
-				 bt->rx_packet_buf + cur_read_idx,
-				 read_size)) {
+		if (!copy_to_iter(bt->rx_packet_buf + cur_read_idx,
+				  read_size, buf)) {
 			dev_warn(bt->dev, "%s(), copy_to_user fail\n",
 				 __func__);
 			return -EFAULT;
@@ -756,7 +754,6 @@ static ssize_t mtk_btcvsd_snd_read(struct mtk_btcvsd_snd *bt,
 		spin_unlock_irqrestore(&bt->rx_lock, flags);
 
 		read_count += read_size;
-		cur_buf_ofs += read_size;
 		count -= read_size;
 	}
 
@@ -777,11 +774,10 @@ static ssize_t mtk_btcvsd_snd_read(struct mtk_btcvsd_snd *bt,
 }
 
 static ssize_t mtk_btcvsd_snd_write(struct mtk_btcvsd_snd *bt,
-				    char __user *buf,
+				    struct iov_iter *buf,
 				    size_t count)
 {
 	int written_size = count, avail, cur_write_idx, write_size, cont;
-	unsigned int cur_buf_ofs = 0;
 	unsigned long flags;
 	unsigned int packet_size = bt->tx->packet_size;
 
@@ -835,10 +831,8 @@ static ssize_t mtk_btcvsd_snd_write(struct mtk_btcvsd_snd *bt,
 		if (write_size > cont)
 			write_size = cont;
 
-		if (copy_from_user(bt->tx_packet_buf +
-				   cur_write_idx,
-				   buf + cur_buf_ofs,
-				   write_size)) {
+		if (!copy_from_iter(bt->tx_packet_buf + cur_write_idx,
+				    write_size, buf)) {
 			dev_warn(bt->dev, "%s(), copy_from_user fail\n",
 				 __func__);
 			return -EFAULT;
@@ -847,7 +841,6 @@ static ssize_t mtk_btcvsd_snd_write(struct mtk_btcvsd_snd *bt,
 		spin_lock_irqsave(&bt->tx_lock, flags);
 		bt->tx->packet_w += write_size / packet_size;
 		spin_unlock_irqrestore(&bt->tx_lock, flags);
-		cur_buf_ofs += write_size;
 		count -= write_size;
 	}
 
@@ -1033,7 +1026,7 @@ static snd_pcm_uframes_t mtk_pcm_btcvsd_pointer(
 static int mtk_pcm_btcvsd_copy(struct snd_soc_component *component,
 			       struct snd_pcm_substream *substream,
 			       int channel, unsigned long pos,
-			       void __user *buf, unsigned long count)
+			       struct iov_iter *buf, unsigned long count)
 {
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(component);
 
@@ -1274,7 +1267,7 @@ static const struct snd_soc_component_driver mtk_btcvsd_snd_platform = {
 	.prepare	= mtk_pcm_btcvsd_prepare,
 	.trigger	= mtk_pcm_btcvsd_trigger,
 	.pointer	= mtk_pcm_btcvsd_pointer,
-	.copy_user	= mtk_pcm_btcvsd_copy,
+	.copy		= mtk_pcm_btcvsd_copy,
 };
 
 static int mtk_btcvsd_snd_probe(struct platform_device *pdev)
-- 
2.35.3

