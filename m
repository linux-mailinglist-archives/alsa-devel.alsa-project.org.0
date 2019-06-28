Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B8C591BB
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 04:52:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4C4A16B6;
	Fri, 28 Jun 2019 04:51:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4C4A16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561690366;
	bh=bDzZ4MWjGwypNua85VmDUpCAw8e7fuu7pph8e83CAWc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uQRQiZG7aFS8EYotA0U5lunJgCSJJTXZ5QKnWc7fA4hJBvSdXxBBK1Eg2Wyh5Ock3
	 C7luvrwRL58Sz9rMbczpuh8bI0QOcVxE2aZjIVmlIGKMJWCPNUjdVSjCFu6oqgu2uN
	 nqb+FHPnKkRS9CmO/dYGPWL1xgbR8DkTYyuD6nAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87E00F896CC;
	Fri, 28 Jun 2019 04:51:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 355D1F896B9; Fri, 28 Jun 2019 04:50:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11541F80058
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 04:50:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11541F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OMOoigyS"
Received: by mail-pf1-x442.google.com with SMTP id x15so2203288pfq.0
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 19:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=F0GZtLBtco0OGsuekl6L6Sm8t8dj7LSLjNvFPb4po3A=;
 b=OMOoigySa27Ebqls8JGEjkQYipYUPgnN24ja9hC3JvuTlSLBCj2VmHwcPLIfIlyMNW
 i+FPVcvo62rXh1Rt7hZB0wkhv9qZvAy401spXeCyXD5VxMLlSAxweBLHcW/tWlh2lC5G
 rMcZJfaQJu/ss3l80QiYdC8Nu7Iv534Lf6RP0D8lghj3QcjyIjwFtx3l2u+Y3PIPeNfu
 mWdbY0NQ24O2Vvx/HaTzAEesjRH0SHGGQ+dpSjIVsLPiX18fUCYpZ/NLmuEAbXRht5NT
 Tu5AC2UYvqzvAGqy6LoICuGiSu+CPFDli96AcaYLkkfowx6Jk5GTqLEIhHwmLbgTGk/v
 9Agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=F0GZtLBtco0OGsuekl6L6Sm8t8dj7LSLjNvFPb4po3A=;
 b=LKRGJyXPoaKFfGu6Das08+PMOMTmtIJkybez3K9kWj2ZfP3W28yNgvG6BauY1IXQfC
 rBlV5DDUTJENfxMBJRXA2AW8ZHLLg+HimXbLMDDHB1qrfWy+TaksRl/sffdH9n1qsZRM
 tLttz3HyJ8373wCBI+1vRRzTkGZsK6Bx4vwzP7OBHyqwAqRobCavoBCGd4xny865NxvM
 cpEX5XyyUarjtaxe0qywZRkQ4rEiSEf/SB5CwYkt0KnRX5zq2og77a64hnKEzVfbK7m6
 25MQ8OLT/f+rCeAtchYJJOWtwXervVzy2y0kVx5QAKA4SelRS3dk8MnG5r2Z1cO7etNs
 Kr5w==
X-Gm-Message-State: APjAAAWqAHJQ+/+3QFU6vCtqI36t2NOwkSI1QUoBr584tNbMWD+g1h7y
 G0A9LCqmH70GGnQE+PdYbBU=
X-Google-Smtp-Source: APXvYqznY1Wol2rASo8YS+K58U5LNR/loQAj+GVGr9S3nFp22CPoBautxWfldQrpAGZkreJ8HHSjzw==
X-Received: by 2002:a63:4d4a:: with SMTP id n10mr6804907pgl.396.1561690253101; 
 Thu, 27 Jun 2019 19:50:53 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id bo20sm513338pjb.23.2019.06.27.19.50.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 19:50:52 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Date: Fri, 28 Jun 2019 10:50:43 +0800
Message-Id: <20190628025044.16187-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Richard Fontana <rfontana@redhat.com>, Fuqian Huang <huangfq.daxian@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Subject: [alsa-devel] [PATCH v2 26/27] sound: oss: use kzalloc rather than
	kmalloc with memset
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Use zeroing allocator instead of using allocator followed
with memset with 0.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 sound/core/seq/oss/seq_oss_init.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss_init.c b/sound/core/seq/oss/seq_oss_init.c
index 6dc94efc19c9..6e8020d4368a 100644
--- a/sound/core/seq/oss/seq_oss_init.c
+++ b/sound/core/seq/oss/seq_oss_init.c
@@ -66,7 +66,7 @@ snd_seq_oss_create_client(void)
 	struct snd_seq_port_info *port;
 	struct snd_seq_port_callback port_callback;
 
-	port = kmalloc(sizeof(*port), GFP_KERNEL);
+	port = kzalloc(sizeof(*port), GFP_KERNEL);
 	if (!port) {
 		rc = -ENOMEM;
 		goto __error;
@@ -81,7 +81,6 @@ snd_seq_oss_create_client(void)
 	system_client = rc;
 
 	/* create annoucement receiver port */
-	memset(port, 0, sizeof(*port));
 	strcpy(port->name, "Receiver");
 	port->addr.client = system_client;
 	port->capability = SNDRV_SEQ_PORT_CAP_WRITE; /* receive only */
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
