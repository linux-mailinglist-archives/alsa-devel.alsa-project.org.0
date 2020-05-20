Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 297521DAB0B
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 08:49:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC51317A2;
	Wed, 20 May 2020 08:48:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC51317A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589957372;
	bh=40JeB6zr3ki+wXE2lTlNhowV/pqJbpy7G1TxjB9xMnE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YLsA0V5jlOV/SKge7fkk/6qTzUyWa4zSwV+3vT02Lh6X+9D6oGK3wcjhc0a/AU7LF
	 eew23pKoM2cfC1NfVS3DQcmwGKeeNgU8oYF9nPRFOqnhrVjyoGT27NFsFYmPZNvrvj
	 BtDHFeViW4S2YtIaI1tu/dmqjqJqkoQr/zfk+46o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDCF6F80213;
	Wed, 20 May 2020 08:47:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 698C3F80216; Wed, 20 May 2020 08:47:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C1C6F801F9
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 08:47:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C1C6F801F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="lbAvaMGU"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="mW2PZna9"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 47E40C36;
 Wed, 20 May 2020 02:47:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 20 May 2020 02:47:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=0x5Q9TMW/pcKY
 WBvmhtdapFpEqLWfDSRp7i7zc3uhac=; b=lbAvaMGUu03zDg6XsB+E7tS/ZgFDS
 B9IW9lYWm1mPP35CksdGb8t8x6QtnpgQsBsAZglzJ8ALb23UQSzZcgEqHFM450GD
 QxTd5Iyk7sVkAGVrdy4xDkNa6Lr99YXYkuZiR3tAJyoACsXPfFndcRQtLgA5PxTy
 hYOT6t0zXZaLYNNc80LdkMFFjW/c4FK6/tClhlKckNlYXB3tkHXZD27MisR+Omy0
 F8aIOiBn/WhKTfdAnQvMATTv0K4iPZNtFv4IDOmbnOL42ItbXWFyO0rrXqSPSKtO
 6tE4FYdQFkyIkUdDiLgSnesGo1v9mPsEDdTubeAnBtc53GkdLGZYKjRPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=0x5Q9TMW/pcKYWBvmhtdapFpEqLWfDSRp7i7zc3uhac=; b=mW2PZna9
 P52SNXpQ4GT1sVkxxFVXYND/OrmTBBQsAAAgIL9iGW1SnOqlj+iL7D9ZuCji+SCk
 VX06hnTqqk9xbmVaXVcWDLfU17TkG7boVHkqcEoM2irzCcknwqeJnirg7lOd7WMn
 TWtGGnk+ivqzH9VDVVNcUPIBxH5aaxZAAwVyqDJqv6tx9QZvUBBD+HescazjOFSZ
 paLwV3snjUqBgIetXUnO+0RocXKBCGvoBEpinWDpzyjUMXq7HDLqMaIsFXOq1DSn
 EvGxEOqcNg56oaWF45WQsw7q7u4DjpIGoEBUiAczGcyQguUIlXFc+Cl5/+BRASXQ
 ulx3SZeF+1HXxw==
X-ME-Sender: <xms:idLEXpgzOGWeZyZRSIivUMEEDbBal43yeAVVInaoqjg31e7JrFRKNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtkedguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeduuefffe
 eiteeludevieetgeeiueelfeeifffhheetveeiveelfeetheeuhfektdenucffohhmrghi
 nhepkhgvrhhnvghlrdhorhhgnecukfhppedukedtrddvfeehrdefrdehgeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:idLEXuCjXj_Lee-SQyRtkYRmn9Ac6gEZkXb-kFovtUnXqpuK60s8Sw>
 <xmx:idLEXpFeZ0z21DI0kinkZOuCVhN3ZePb4rS9TBApRO3D3b0YvbVi5A>
 <xmx:idLEXuT1iJf6XmzAhAmA8bggY1V0FQWQ-Im9qPPV0OMCOszpqIQqqg>
 <xmx:idLEXqdXF5To2ccakZPDISGatrzHmWIIEhrQ8CPoJGGxKfrkXB2JGHnh-qA>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0A9473280065;
 Wed, 20 May 2020 02:47:34 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: oscar.carter@gmx.com, keescook@chromium.org, mchehab@kernel.org,
 clemens@ladisch.de, tiwai@suse.de, perex@perex.cz
Subject: [PATCH 2/2] firewire-core: obsolete cast of function callback
Date: Wed, 20 May 2020 15:47:26 +0900
Message-Id: <20200520064726.31838-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200520064726.31838-1-o-takashi@sakamocchi.jp>
References: <20200520064726.31838-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel-hardening@lists.openwall.com,
 linux-kernel@vger.kernel.org, stefanr@s5r6.in-berlin.de, levonshe@gmail.com,
 linux1394-devel@lists.sourceforge.net, linux-media@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This commit obsoletes cast of function callback to assist attempt of
Control Flow Integrity builds.

Reported-by: Oscar Carter <oscar.carter@gmx.com>
Reference: https://lore.kernel.org/lkml/20200519173425.4724-1-oscar.carter@gmx.com/
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 44 +++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 6e291d8f3a27..f1e83396dd22 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -957,7 +957,6 @@ static int ioctl_create_iso_context(struct client *client, union ioctl_arg *arg)
 {
 	struct fw_cdev_create_iso_context *a = &arg->create_iso_context;
 	struct fw_iso_context *context;
-	fw_iso_callback_t cb;
 	int ret;
 
 	BUILD_BUG_ON(FW_CDEV_ISO_CONTEXT_TRANSMIT != FW_ISO_CONTEXT_TRANSMIT ||
@@ -965,32 +964,35 @@ static int ioctl_create_iso_context(struct client *client, union ioctl_arg *arg)
 		     FW_CDEV_ISO_CONTEXT_RECEIVE_MULTICHANNEL !=
 					FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL);
 
-	switch (a->type) {
-	case FW_ISO_CONTEXT_TRANSMIT:
-		if (a->speed > SCODE_3200 || a->channel > 63)
-			return -EINVAL;
-
-		cb = iso_callback;
-		break;
+	if (a->type != FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL) {
+		fw_iso_callback_t cb;
 
-	case FW_ISO_CONTEXT_RECEIVE:
-		if (a->header_size < 4 || (a->header_size & 3) ||
-		    a->channel > 63)
-			return -EINVAL;
+		switch (a->type) {
+		case FW_ISO_CONTEXT_TRANSMIT:
+			if (a->speed > SCODE_3200 || a->channel > 63)
+				return -EINVAL;
 
-		cb = iso_callback;
-		break;
+			cb = iso_callback;
+			break;
 
-	case FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL:
-		cb = (fw_iso_callback_t)iso_mc_callback;
-		break;
+		case FW_ISO_CONTEXT_RECEIVE:
+			if (a->header_size < 4 || (a->header_size & 3) ||
+			    a->channel > 63)
+				return -EINVAL;
 
-	default:
-		return -EINVAL;
-	}
+			cb = iso_callback;
+			break;
+		default:
+			return -EINVAL;
+		}
 
-	context = fw_iso_context_create(client->device->card, a->type,
+		context = fw_iso_context_create(client->device->card, a->type,
 			a->channel, a->speed, a->header_size, cb, client);
+	} else {
+		context = fw_iso_mc_context_create(client->device->card,
+				a->type, a->channel, a->speed, a->header_size,
+				iso_mc_callback, client);
+	}
 	if (IS_ERR(context))
 		return PTR_ERR(context);
 	if (client->version < FW_CDEV_VERSION_AUTO_FLUSH_ISO_OVERFLOW)
-- 
2.25.1

