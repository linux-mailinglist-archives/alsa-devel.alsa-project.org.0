Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5403CD1F4
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jul 2021 12:32:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DE161658;
	Mon, 19 Jul 2021 12:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DE161658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626690746;
	bh=Dn4JRemfgLHYg6P2PuPq3Al7j7o0iRqOc0U7NC9wfEE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bcm5sEib1iv8+q205aG7NG0ARSEb8FFxjRb6zICVxOkFdxrHBdej56ZJDlZx2A+WW
	 bpKqXZUJdFmZtupgcd/D/ToMBxFBUb04c9v8HeFzF4OQB7g2WGIIUNJGbLJjnaerZM
	 G9jor1jCQ+zY9YGe7pgHirZ5bHr/4j6w3D2oQo8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77211F800DA;
	Mon, 19 Jul 2021 12:30:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0848DF80227; Mon, 19 Jul 2021 12:30:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E4FBF800DA
 for <alsa-devel@alsa-project.org>; Mon, 19 Jul 2021 12:30:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E4FBF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="r9RMg/uw"
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 649FB40207; 
 Mon, 19 Jul 2021 10:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626690644;
 bh=hya7L108CUJRjE5JN1TFdEqd6eaNpO4wxcvgoKtlo4E=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=r9RMg/uw6Hh0RhemOxOA48/WC6wWMhhZaTazsd8bzf7WwLE8AB4J75mBB7uW50AF7
 VdpuGf9RK92KMGZ+cUWE1DlZKQx7mUALg/5RPu0gfIGo214asrEAg60n7OO/Zt0JkV
 13eoczS+BP/jC+vSG4Sytsmyce6xonS/4dHd1/75ufQjiywSeVYJnSMsoOlYlUlYml
 O8/p26IDhLgfhPNA/FGMOJkEiD3AXws/Nmf37a0IflXM8YC3cRlzC2cUC+hspIUsOa
 D1RCIgtzQMVdoGlyfACT63DD4jlzv7p4w+J1vchiLIiJRz3l07/EjK5xJUTHhiUkd5
 wLxe7hE61o0KA==
From: Colin King <colin.king@canonical.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH] sound: Fix spelling mistake "synchronization" ->
 "synchronization"
Date: Mon, 19 Jul 2021 11:30:44 +0100
Message-Id: <20210719103044.15315-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/drivers/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/drivers/Kconfig b/sound/drivers/Kconfig
index 7141f73cddd3..ca4cdf666f82 100644
--- a/sound/drivers/Kconfig
+++ b/sound/drivers/Kconfig
@@ -102,7 +102,7 @@ config SND_ALOOP
 	  configured number of substreams (see the pcm_substreams module
 	  parameter).
 
-	  The loopback device allows time sychronization with an external
+	  The loopback device allows time synchronization with an external
 	  timing source using the time shift universal control (+-20%
 	  of system time).
 
-- 
2.31.1

