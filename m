Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC5832268
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jun 2019 09:20:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16C4D1694;
	Sun,  2 Jun 2019 09:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16C4D1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559460017;
	bh=iA9r+sGyluJIp98/DyErHPOqMIP4nENaO8HTputZtjU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EfSmC6bRZmjq/5UvHvuDSB5vRHvcE64IhlXWOiCUtkPzlg4cGE0BuzDi5qZrdQXKK
	 mwIEqE4cPiwqWdRavdziazLndLpUu9WZq25rS3Q1kNtVHfw9m6Vjdt8vd8Qr424PUL
	 94JlWZC+MvSKS5PyBh6QyDHKbP0ERvg4p6Podyz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DF12F89758;
	Sun,  2 Jun 2019 09:13:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DD26F8973C; Sun,  2 Jun 2019 09:13:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B9DFF89735
 for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2019 09:13:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B9DFF89735
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="cmpEVGvb"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="pirblrEy"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 519BC20D56;
 Sun,  2 Jun 2019 03:13:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 02 Jun 2019 03:13:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=vpTMg26qRCKSA
 SpEMfFFxe/bbvp9lzG4qbDcxjzzzOs=; b=cmpEVGvb+HSREMv2/tjitSIkoa1AG
 ZBECEoQHm5SEGMZRH09mMhYL5935UvViDx6QFO8cTWvAWYl1JvFWExTQcUBHsAJ+
 8GllV+x9iLAMQPZUSenqw6ZEzq1wiOzr+L91BHDvaQVU60U3nN9lMiNBF6iHcZdF
 qC2ru3HDt+lQKfEP/2wHRw/76o17w1o53MXiO30Do/Pp8dvWYIVs2N/KDzLGGea+
 hwznnFLlfxJMcrqyXzKXspvrNRJhBPshhhPyiDBkJC6JxirrRcVTYlfhqF9mcPhT
 /lwKpjM4rfdHgxxvwDr74mdi5RAuBcN1RFpy3/xW1aZOxxc+MOsUV0pRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=vpTMg26qRCKSASpEMfFFxe/bbvp9lzG4qbDcxjzzzOs=; b=pirblrEy
 LBap2snddotFcIbsDQmgdhcKVMEzrUDEGWkb2ytfZe9Ltjoy0fA9QtwlOpyUl8l1
 p8EZN3CdhKzGOQmjyiBZzVBNejArpDtegA47kjXHq19zCF7yAgUivaXHzfztUTst
 ny+XE7yBnK2QPiu84rqiX++MeTM1tNw55NayicbbJUhNqEcdyVI+Cai8lp1zcNif
 lohUCB2IRE04B65O6QbbKizBMpCatt6Qq6EnEjRLkgveu+jMqrjQccfnIWD0vOye
 Uctt5oECnO/4upLmjWjLUudKzzCo8EylGMrUcm0sd1hirskXxtscLjYb+Yg+DnST
 bv2YZaP/adNVcg==
X-ME-Sender: <xms:DXfzXNFMbCeY1f9gTVuGrtzlbpOeHtnJq3x33UzLWxk4UQBxK7EFBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefgedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:DXfzXOq0TGzH3bqFErQoBouZFIc1i5tVO6l8zZhs0Oj_2WCVukkzDQ>
 <xmx:DXfzXD2Jxn1tT4YwCVKyljd7PWsi_FHg9ZiBTEBhwplt3jPS24_xXA>
 <xmx:DXfzXHkzcP9dNjHxuJf7amy0VsVoQfa70b5z0P1wbGGCTxtXv265nQ>
 <xmx:DXfzXIPyBTlDUauE7pKvFYpXPk-0puVe7KQWiuJ8XK2FwBXfGHnyIA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id DD38880059;
 Sun,  2 Jun 2019 03:13:15 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  2 Jun 2019 16:12:52 +0900
Message-Id: <20190602071259.21622-9-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
References: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 08/15] ALSA: fireface: add protocol-specific
	operation to allocate isochronous resources
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

In ALSA fireface driver, the allocation of isochronous resources is
programmed in each implementation of protocol. This commit adds
protocol-specific operation for the allocation separated from
the operation to begin session.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireface/ff-stream.c | 4 ++++
 sound/firewire/fireface/ff.h        | 1 +
 2 files changed, 5 insertions(+)

diff --git a/sound/firewire/fireface/ff-stream.c b/sound/firewire/fireface/ff-stream.c
index a8a90f1ae09e..740963e4e1c9 100644
--- a/sound/firewire/fireface/ff-stream.c
+++ b/sound/firewire/fireface/ff-stream.c
@@ -156,6 +156,10 @@ int snd_ff_stream_start_duplex(struct snd_ff *ff, unsigned int rate)
 		if (err < 0)
 			return err;
 
+		err = ff->spec->protocol->allocate_resources(ff, rate);
+		if (err < 0)
+			goto error;
+
 		err = ff->spec->protocol->begin_session(ff, rate);
 		if (err < 0)
 			goto error;
diff --git a/sound/firewire/fireface/ff.h b/sound/firewire/fireface/ff.h
index ed8fea0ff5e1..c478103388a2 100644
--- a/sound/firewire/fireface/ff.h
+++ b/sound/firewire/fireface/ff.h
@@ -113,6 +113,7 @@ struct snd_ff_protocol {
 	int (*get_clock)(struct snd_ff *ff, unsigned int *rate,
 			 enum snd_ff_clock_src *src);
 	int (*switch_fetching_mode)(struct snd_ff *ff, bool enable);
+	int (*allocate_resources)(struct snd_ff *ff, unsigned int rate);
 	int (*begin_session)(struct snd_ff *ff, unsigned int rate);
 	void (*finish_session)(struct snd_ff *ff);
 	void (*dump_status)(struct snd_ff *ff, struct snd_info_buffer *buffer);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
