Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2597D3BF74D
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 11:09:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A04B1654;
	Thu,  8 Jul 2021 11:08:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A04B1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625735361;
	bh=40eFma67ezC+pT3nZnXB00fmSvZGk8nQeAHdFICta34=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G9aGCkqkjdlT3NOD1+CdtewPNPfDO+Gnkf4saup4ItVEtWNjCMN32nJrWXwqUymBP
	 MrKmKhIZQISj7dQDzJTSacg2RLm+cFCQk+Zwlsy/bhzSrExfpW6FpBl73y65l7oNVD
	 cWodzIdDvPVk9Ce7+wO6K6nZ7AI3bhMv76fyjXXI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3768F80259;
	Thu,  8 Jul 2021 11:07:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49135F80249; Thu,  8 Jul 2021 11:07:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52408F8012A
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 11:07:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52408F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="cpD1FaIc"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="x4+n58xL"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 8C33420181;
 Thu,  8 Jul 2021 09:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625735260; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Eqr2EXoufiR6OT5kq/16DCyHWd3CfZla5aTNGEHEiPg=;
 b=cpD1FaIcEgxke3nZGEoNNEx7TTyuKp9QemieGCPechmUKfmqm4c89Wy7bRpwSz7O8WUtnG
 bNVs5UeWWZrRlQ/5lEC4kt2AnG7ibZVuPbhpdFmFMfEyEjQu2a4Z/6cmfiEd0pUlXg1cPh
 /JOn4/iG8Ec6z9KGAG8w6ln4NhY4b0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625735260;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Eqr2EXoufiR6OT5kq/16DCyHWd3CfZla5aTNGEHEiPg=;
 b=x4+n58xLA7kIgVLGIn764X+yvfOSyw8HwooyLyxnmH9fm+2wjbcOuYxz9CrVv2P128s12j
 8jWNETm9F5nIPYBw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 790FAA3BA1;
 Thu,  8 Jul 2021 09:07:40 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: intel8x0: Fix breakage at ac97 clock measurement
Date: Thu,  8 Jul 2021 11:07:38 +0200
Message-Id: <20210708090738.1569-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Max Filippov <jcmvbkbc@gmail.com>
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

The recent workaround for the wild interrupts in commit c1f0616124c4
("ALSA: intel8x0: Don't update period unless prepared") leaded to a
regression, causing the interrupt storm during ac97 clock measurement
at the driver probe.  We need to handle the interrupt while the clock
measurement as well as the proper PCM streams.

Fixes: c1f0616124c4 ("ALSA: intel8x0: Don't update period unless prepared")
Reported-and-tested-by: Max Filippov <jcmvbkbc@gmail.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/CAMo8BfKKMQkcsbOQaeEjq_FsJhdK=fn598dvh7YOcZshUSOH=g@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/intel8x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index 2d1bfbcba933..df3ba5c70de9 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -694,7 +694,7 @@ static inline void snd_intel8x0_update(struct intel8x0 *chip, struct ichdev *ich
 	int status, civ, i, step;
 	int ack = 0;
 
-	if (!ichdev->prepared || ichdev->suspended)
+	if (!(ichdev->prepared || chip->in_measurement) || ichdev->suspended)
 		return;
 
 	spin_lock_irqsave(&chip->reg_lock, flags);
-- 
2.26.2

