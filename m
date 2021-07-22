Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9AC3D2301
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 13:53:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4D1116DF;
	Thu, 22 Jul 2021 13:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4D1116DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626954815;
	bh=CrEso4hYjxnZV4uaE+p2At/Uy1ZzqQpLqzIx+4V+lQA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LtrsKZp61D8690IYPbSi92PXnLLvmRjkFE0R6KLXqp+5cXXTJXrTatlj5T5Fa6Sfp
	 6tMY7LAkPHi2z5NBzMZIh3qgZ5PVLFz09pGdrG7g+x8o6nkzDm6RNZrw2bS6QE3NtN
	 QgLvqs9JH8xDX6mRLbmv3+aGErVOTAmTSkww04Ok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94CD9F8049C;
	Thu, 22 Jul 2021 13:51:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64C2DF80227; Thu, 22 Jul 2021 13:51:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38B85F80114
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 13:51:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38B85F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz
 header.b="EaEXcudo"; 
 dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz
 header.b="o+nMEeEz"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 2B1522262C;
 Thu, 22 Jul 2021 11:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626954702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=S6NcoCyW4nlsHKyDFur3SlXg0Nq3VcKQz1V531PspZA=;
 b=EaEXcudo4M+tANeuWzjPOAQz3jMllCidAjxP7i01GGKjTV8lLzbHpjsFu2Wzy+qdRa528f
 lA8QKlMHFGBQ6CjfdjXdQuyBzInNRuy3jfUhxFX2zQfzMeG83TB1FET62HJsGCNzeTwaH0
 5rHwrfAzuLJkoa15DPMYGFnTYo3l0Ww=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626954702;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=S6NcoCyW4nlsHKyDFur3SlXg0Nq3VcKQz1V531PspZA=;
 b=o+nMEeEz8ihrjXb64apZWkY2gDSIZTMYCkYC1MAyPabWuSD8QGJTG9WS117xlIgrqBXRnm
 lHV05SGzALAe6gBg==
Received: from localhost.localdomain (unknown [10.100.208.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id D7AC7A3B84;
 Thu, 22 Jul 2021 11:51:41 +0000 (UTC)
From: Jiri Slaby <jslaby@suse.cz>
To: gregkh@linuxfoundation.org
Subject: [PATCH 1/2] cx20442: tty_ldisc_ops::write_wakeup is optional
Date: Thu, 22 Jul 2021 13:51:40 +0200
Message-Id: <20210722115141.516-1-jslaby@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.cz>
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

TTY layer does nothing if tty_ldisc_ops::write_wakeup is NULL, so there
is no need to implement an empty one in cx20442. Drop it.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
---
 sound/soc/codecs/cx20442.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/cx20442.c b/sound/soc/codecs/cx20442.c
index ec8d6e74b467..65c6b92d7b5f 100644
--- a/sound/soc/codecs/cx20442.c
+++ b/sound/soc/codecs/cx20442.c
@@ -279,11 +279,6 @@ static void v253_receive(struct tty_struct *tty, const unsigned char *cp,
 	}
 }
 
-/* Line discipline .write_wakeup() */
-static void v253_wakeup(struct tty_struct *tty)
-{
-}
-
 struct tty_ldisc_ops v253_ops = {
 	.name = "cx20442",
 	.owner = THIS_MODULE,
@@ -291,7 +286,6 @@ struct tty_ldisc_ops v253_ops = {
 	.close = v253_close,
 	.hangup = v253_hangup,
 	.receive_buf = v253_receive,
-	.write_wakeup = v253_wakeup,
 };
 EXPORT_SYMBOL_GPL(v253_ops);
 
-- 
2.32.0

