Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B725E682731
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 09:45:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F4DBF3;
	Tue, 31 Jan 2023 09:44:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F4DBF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675154729;
	bh=Om6Maw7qfsjglyXYRw2Hy4yfWEIxfLdogp8lsRwOusk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=fjJGAiuPxCjn8X+LCcC8fO501xWU2K5yE/MxZpKJ2qEYtRMQDlzhDVqs+BLVSePcF
	 /j/H1KE/uenp+sP8sNfiAmN6zzRTM/n5pVDRCiqhJz/bW32qpsdnHIKmjht0czLz1R
	 ITspei7xyMGWnNh4AA93uN1hv3mT1KsLYK1g3vTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 720DBF800A7;
	Tue, 31 Jan 2023 09:44:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54078F804C2; Tue, 31 Jan 2023 09:44:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=5.0 tests=ENV_AND_HDR_SPF_MATCH,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from out199-2.us.a.mail.aliyun.com (out199-2.us.a.mail.aliyun.com
 [47.90.199.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C139F800A7
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 09:44:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C139F800A7
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VaW9tU._1675154649; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VaW9tU._1675154649) by smtp.aliyun-inc.com;
 Tue, 31 Jan 2023 16:44:17 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: perex@perex.cz
Subject: [PATCH] ALSA: emu10k1: clean up some inconsistent indenting
Date: Tue, 31 Jan 2023 16:43:04 +0800
Message-Id: <20230131084304.12920-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org, Abaci Robot <abaci@linux.alibaba.com>,
 tiwai@suse.com, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

No functional modification involved.

sound/pci/emu10k1/memory.c:446 snd_emu10k1_synth_free() warn: inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3903
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 sound/pci/emu10k1/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/emu10k1/memory.c b/sound/pci/emu10k1/memory.c
index edb3f1763719..6a7406014f81 100644
--- a/sound/pci/emu10k1/memory.c
+++ b/sound/pci/emu10k1/memory.c
@@ -443,7 +443,7 @@ snd_emu10k1_synth_free(struct snd_emu10k1 *emu, struct snd_util_memblk *memblk)
 		unmap_memblk(emu, blk);
 	spin_unlock_irqrestore(&emu->memblk_lock, flags);
 	synth_free_pages(emu, blk);
-	 __snd_util_mem_free(hdr, memblk);
+	__snd_util_mem_free(hdr, memblk);
 	mutex_unlock(&hdr->block_mutex);
 	return 0;
 }
-- 
2.20.1.7.g153144c

