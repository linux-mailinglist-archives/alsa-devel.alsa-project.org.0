Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F32E73225E
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jun 2019 09:16:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A81F1686;
	Sun,  2 Jun 2019 09:15:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A81F1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559459784;
	bh=ZpLiUwnvYpzyjf+GAixkClPTo6f+lu0ThZiNUBTGPDc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Erg4MbwxmMR3MrxJXJ27dMt9wJf9FJZhZq7gz13P7QQNHqousl1S12MgxoEl0B/ld
	 LaSLIVqOAvJcmw/lthcmwYm5nVutdoc/qJCwpduYQT7D9+Gc4RdG58h/B5bq/6aQtH
	 NztHmJ7DqS3ffDgUuYiO3a1ZnJ8MkqAd8P8+CHS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43B06F89736;
	Sun,  2 Jun 2019 09:13:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6975F896F8; Sun,  2 Jun 2019 09:13:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EFE5F896EF
 for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2019 09:13:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EFE5F896EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="MTy4ZKaC"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="F1h8PpLF"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0425821E44;
 Sun,  2 Jun 2019 03:13:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 02 Jun 2019 03:13:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=3epFjjAZnmLPq
 X6U+KdoIXAdq6b6OiPy6P2nFbLkZ+8=; b=MTy4ZKaCzF2agfhF4Fv8ZsR2uAumY
 EP06EKXSEh5fYQJlpgi8FRpqVnC63pgw8aoqWuAoT9EPXTF7OmqxKdAgbRzWaoun
 KYhuSZvZaUdoOJCr4eVcUjUk7vIm047FDYqO4nvd/NaEUS1CHVmqIXq/8yZ3uKgq
 TgD4qrHNSPIQbbjO4isA0zfVli01H/ksMYuE+Im7x0SbMSefTsGDkNDG0oEIAS/T
 Vf5B6C4TBAr274wLveF4dDVhMgDSYAQNXMFR/8lV4YDwMy7PWILdt4lhLKQY6B9T
 1qW4+a5mYeB4UseVGVqEF8pouw9Pf3zQIaI0EUFSjqtXTuGbTcH+AG3Sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=3epFjjAZnmLPqX6U+KdoIXAdq6b6OiPy6P2nFbLkZ+8=; b=F1h8PpLF
 4cxzKPNN6zg9nAGVCFQC9/t5L0X/Pr4X6ZU65qcgLql1z2YC69laMl1Hy/+5dQkN
 XxVLozoJiEg135z+vgVTFjfz64bEt2l27UFt1HzPTlw4Y0cVdTryFUynMRysdpwa
 WDOHYqElEOU96vva3JYuyhxIXHQfFHxyGgRCa0P2lFC+1D6cbJDm/81YfXRRJ0s/
 s6stvsPw0bjBR5MxOYbuTdCQ2m3sp/Rp9FrSEF7/rKaK8GOlOL5EPYEzVw1+9zYM
 AVjvo8vCbayxu/wviYSawWirNZje2BdT7z2c8gkvcd79j0FEYZ+Jz8xKjSPBetKL
 QJi+4rrgpsZcBQ==
X-ME-Sender: <xms:A3fzXN2HdtfJREz7CodIPLIhzpqTWQATHtrtSMBgnZkf55qO7uUvjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefgedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:A3fzXPf9zDkhHJineJ0_SHmMMbFAD6l2Gg71lswWxXY-gPW8OegKdg>
 <xmx:A3fzXLyQPXKe_6o62tFvO3LZbsn98kF6MY39khps4tn4LN8yu_Pp1A>
 <xmx:A3fzXF8RrBA-qY1mwtZCw6cRUTAbhVf8wqFXyy5A7SAKqLGGWe_v9w>
 <xmx:A3fzXGzr5UvEWJuN9zffYsSwlwHN2g7xcYMF_a4oU4gpbekAwIiHNA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 98D8E80060;
 Sun,  2 Jun 2019 03:13:06 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  2 Jun 2019 16:12:46 +0900
Message-Id: <20190602071259.21622-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
References: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 02/15] ALSA: firewire-tascam: code refactoring
	for reservation of isochronous resources
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This commit is a part of preparation to perform allocation/release
of isochronous channels in pcm.hw_params/hw_free callbacks.

This commit applies minor code refactoring for a helper function to
allocate isochronous resources.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/tascam/tascam-stream.c | 38 +++++++++++----------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/sound/firewire/tascam/tascam-stream.c b/sound/firewire/tascam/tascam-stream.c
index 7cddd9ece4ee..fc963469f6b0 100644
--- a/sound/firewire/tascam/tascam-stream.c
+++ b/sound/firewire/tascam/tascam-stream.c
@@ -276,34 +276,24 @@ static void release_resources(struct snd_tscm *tscm)
 	fw_iso_resources_free(&tscm->rx_resources);
 }
 
-static int keep_resources(struct snd_tscm *tscm, unsigned int rate)
+static int keep_resources(struct snd_tscm *tscm, unsigned int rate,
+			  struct amdtp_stream *stream)
 {
+	struct fw_iso_resources *resources;
 	int err;
 
-	/* Keep resources for in-stream. */
-	err = amdtp_tscm_set_parameters(&tscm->tx_stream, rate);
-	if (err < 0)
-		return err;
-	err = fw_iso_resources_allocate(&tscm->tx_resources,
-			amdtp_stream_get_max_payload(&tscm->tx_stream),
-			fw_parent_device(tscm->unit)->max_speed);
-	if (err < 0)
-		goto error;
+	if (stream == &tscm->tx_stream)
+		resources = &tscm->tx_resources;
+	else
+		resources = &tscm->rx_resources;
 
-	/* Keep resources for out-stream. */
-	err = amdtp_tscm_set_parameters(&tscm->rx_stream, rate);
-	if (err < 0)
-		return err;
-	err = fw_iso_resources_allocate(&tscm->rx_resources,
-			amdtp_stream_get_max_payload(&tscm->rx_stream),
-			fw_parent_device(tscm->unit)->max_speed);
+	err = amdtp_tscm_set_parameters(stream, rate);
 	if (err < 0)
 		return err;
 
-	return 0;
-error:
-	release_resources(tscm);
-	return err;
+	return fw_iso_resources_allocate(resources,
+				amdtp_stream_get_max_payload(stream),
+				fw_parent_device(tscm->unit)->max_speed);
 }
 
 int snd_tscm_stream_init_duplex(struct snd_tscm *tscm)
@@ -388,7 +378,11 @@ int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 	}
 
 	if (!amdtp_stream_running(&tscm->rx_stream)) {
-		err = keep_resources(tscm, rate);
+		err = keep_resources(tscm, rate, &tscm->tx_stream);
+		if (err < 0)
+			goto error;
+
+		err = keep_resources(tscm, rate, &tscm->rx_stream);
 		if (err < 0)
 			goto error;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
