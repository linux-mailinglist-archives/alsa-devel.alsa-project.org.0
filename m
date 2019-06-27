Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AB5588F6
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 19:43:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E887C1676;
	Thu, 27 Jun 2019 19:42:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E887C1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561657418;
	bh=IRJKCq+JTKtSytP7Mo8AapPYgbb05eoa/DwTUu4uStg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SaJri3mhiK4iu2Ay39IVIFyR5jyy7bY9rI5cR878FHCBZf/RlarRjchiY/jaqeWKK
	 XOvcE9V50upiup4gM6aZm6ZmLZgqDdL2eWrnCsnWTYewcY/KOYNLRVeJRoKJm7UE4J
	 CbsnodU0jkuW6oo4kZdKk/Iy4/CDVfcHjryVYaQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35253F89733;
	Thu, 27 Jun 2019 19:40:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 173A2F89731; Thu, 27 Jun 2019 19:40:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9938BF89716
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 19:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9938BF89716
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YDI5YLs0"
Received: by mail-pf1-x444.google.com with SMTP id x15so1596895pfq.0
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 10:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=0rd+HHwEwaFufPm/nP19OVluyAAMUA/lKkxxOcMsviQ=;
 b=YDI5YLs0MDw+5WnC5dScCDqD8cdNwyhpn4OfEq4jtGKwL7cpMof53L78nNvefoIj0S
 q2O7J0OHEWEOXpmHnrSRibKOIpo2JKe+AYcMPehgNhoTXm/qyf5bIK2ondC7Pm8ncpYD
 JTi+veZe174b94PAFWYAKeMdqrwfivnbx4zOXaEPaMEpeEpKY89YDBV12ZWHp707C1Oo
 i+ApKtpEmNMnsFADA6zn6CKsPPKbDYpXXJwVQEdzvCsXo2asGO38jJat/71m7hXEcbi7
 mYiFEFJ4FEQ4g8Yja2Fgd1zpS9Vg6mTuujYUmN1Jb05ZQsRVwKOcKKfFFwDXttI0xd0n
 d1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0rd+HHwEwaFufPm/nP19OVluyAAMUA/lKkxxOcMsviQ=;
 b=bi2IQmX+TpzVQNkaRnwjnoonj48LwNcQCif6CwMPQR0zEf17PN1eBlPzbHgg08edhl
 AxOANiSjab18dlSXJ2JL0M0zv/rUWe3iX07MQ562NJkfwvHirGsBTj0Wl3pS0GWDbT0p
 /D2SRwpZsz/o6kINMecboLa4pRRSH3MYXbuFLzr92UCtGxkzXbB5YwHnqmyFWHRBc+B0
 ZxBooH28gDoOirWpmPAztMwEIRy93j4EfSMGl0ntVc1DF6ypzrqFly20MhmpatfGks7p
 SWJkWH5R2sncNCexD3HVn+zaKrbVdtgT2a1NG8DEOSMZIiyoMpSrH8rcjec2527T5bSx
 U8OQ==
X-Gm-Message-State: APjAAAXWBj0TQ8tEdzfGT70eFdipqogG5kJ3r8aSyAI2D6mORRuinBRi
 eGlrHoDZh0WL+rKNHWKUUsc=
X-Google-Smtp-Source: APXvYqx1B7pQmsqNqBPVklS2ZtuYp7+4DyC+DMSm/2VK7gB8UQ9GrRmoKNHr9sntE72Df0G0UDXtzA==
X-Received: by 2002:a63:e018:: with SMTP id e24mr4796653pgh.361.1561657246389; 
 Thu, 27 Jun 2019 10:40:46 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id t5sm2567412pgh.46.2019.06.27.10.40.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 10:40:45 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Date: Fri, 28 Jun 2019 01:40:28 +0800
Message-Id: <20190627174029.4125-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Richard Fontana <rfontana@redhat.com>, Fuqian Huang <huangfq.daxian@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Subject: [alsa-devel] [PATCH 42/87] sound: oss: replace kmalloc + memset
	with kzalloc
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

kmalloc + memset(0) -> kzalloc

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
