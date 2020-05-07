Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AFF1C8354
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 09:18:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F3AE17E7;
	Thu,  7 May 2020 09:18:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F3AE17E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588835934;
	bh=IM5AcKzUkbYNDtXppmDlm8d0KNvXAOktt6tRKQd7Rro=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IsoNsQSiYP1OCS0mZPL5dKuxoXKS5WFNkSNM5vr+ULCT9j/LVNSxZLlm5aMVCR57X
	 ismdySsBrm/xN5ZiZXoMtWcL3c3vueItq6I5qUBXIEdI6upqvThjw/dKnAmf6maElk
	 YVH06/jnWFL5JwSyXzaEF8z0qM8dCX/XFrW6dIBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70629F800F6;
	Thu,  7 May 2020 09:16:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2E71F8015F; Thu,  7 May 2020 05:48:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C56E8F800F6
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 05:48:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C56E8F800F6
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E933DA39FC9FCBC8410B;
 Thu,  7 May 2020 11:48:06 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Thu, 7 May 2020 11:47:58 +0800
From: Samuel Zou <zou_wei@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <mpe@ellerman.id.au>,
 <benh@kernel.crashing.org>, <paulus@samba.org>
Subject: [PATCH -next] ALSA: sound/ppc: Use bitwise instead of arithmetic
 operator for flags
Date: Thu, 7 May 2020 11:54:07 +0800
Message-ID: <1588823647-12480-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 07 May 2020 09:16:08 +0200
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Samuel Zou <zou_wei@huawei.com>
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

Fix the following coccinelle warnings:

sound/ppc/pmac.c:729:57-58: WARNING: sum of probable bitmasks, consider |
sound/ppc/pmac.c:229:37-38: WARNING: sum of probable bitmasks, consider |

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Samuel Zou <zou_wei@huawei.com>
---
 sound/ppc/pmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/ppc/pmac.c b/sound/ppc/pmac.c
index 592532c..2e750b3 100644
--- a/sound/ppc/pmac.c
+++ b/sound/ppc/pmac.c
@@ -226,7 +226,7 @@ static int snd_pmac_pcm_prepare(struct snd_pmac *chip, struct pmac_stream *rec,
 		offset += rec->period_size;
 	}
 	/* make loop */
-	cp->command = cpu_to_le16(DBDMA_NOP + BR_ALWAYS);
+	cp->command = cpu_to_le16(DBDMA_NOP | BR_ALWAYS);
 	cp->cmd_dep = cpu_to_le32(rec->cmd.addr);
 
 	snd_pmac_dma_stop(rec);
@@ -726,7 +726,7 @@ void snd_pmac_beep_dma_start(struct snd_pmac *chip, int bytes, unsigned long add
 	chip->extra_dma.cmds->xfer_status = cpu_to_le16(0);
 	chip->extra_dma.cmds->cmd_dep = cpu_to_le32(chip->extra_dma.addr);
 	chip->extra_dma.cmds->phy_addr = cpu_to_le32(addr);
-	chip->extra_dma.cmds->command = cpu_to_le16(OUTPUT_MORE + BR_ALWAYS);
+	chip->extra_dma.cmds->command = cpu_to_le16(OUTPUT_MORE | BR_ALWAYS);
 	out_le32(&chip->awacs->control,
 		 (in_le32(&chip->awacs->control) & ~0x1f00)
 		 | (speed << 8));
-- 
2.6.2

