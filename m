Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2143A309B49
	for <lists+alsa-devel@lfdr.de>; Sun, 31 Jan 2021 11:11:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A1E21766;
	Sun, 31 Jan 2021 11:10:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A1E21766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612087882;
	bh=Rf/NERkYh/AdjPIJ5VWRtVNw4iz8uBFPxncUzgBs+U4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GTbuVG3gkIcM2/jBbAhAndWzKV4jDNjPBBPeJkN0esyahS3kxpSk/xXRiahZxCulg
	 3BKCN+71slC4xJD63N7aLdWLjq1zW+quWVnYGhdW0LLVCCORTbu+8S+nBjJpHtP483
	 785o7eAnwCD5ad3GIzWFIieI9K7vcKb45RBv8CYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94719F801F7;
	Sun, 31 Jan 2021 11:09:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A60D8F80171; Sun, 31 Jan 2021 11:09:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from zju.edu.cn (spam.zju.edu.cn [61.164.42.155])
 by alsa1.perex.cz (Postfix) with ESMTP id 24CB3F80134
 for <alsa-devel@alsa-project.org>; Sun, 31 Jan 2021 11:09:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24CB3F80134
Received: from localhost.localdomain (unknown [10.192.85.18])
 by mail-app4 (Coremail) with SMTP id cS_KCgCH2R3MgRZgwD0MAQ--.7283S4;
 Sun, 31 Jan 2021 18:09:21 +0800 (CST)
From: Dinghao Liu <dinghao.liu@zju.edu.cn>
To: dinghao.liu@zju.edu.cn,
	kjlu@umn.edu
Subject: [PATCH] ALSA: intel8x0: Fix missing check in snd_intel8x0m_create
Date: Sun, 31 Jan 2021 18:09:14 +0800
Message-Id: <20210131100916.7915-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cS_KCgCH2R3MgRZgwD0MAQ--.7283S4
X-Coremail-Antispam: 1UD129KBjvdXoWrKFyfuw1rWFyDZF4rZr43ZFb_yoWfGrb_Ca
 4fXw17uayjqr15KrnFya18JFn7Gan2kFy8Gry7ta1UAay3WrnIgrykur93Wrykur4xWr95
 GFW7ZrsYyrWUGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb2AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
 87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
 Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
 xGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VW8uw4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
 4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
 rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
 CI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
 6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgMQBlZdtSIY3AAHsI
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>
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

When device_type == DEVICE_ALI, we should also check the return
value of pci_iomap() to avoid potential null pointer dereference.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 sound/pci/intel8x0m.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
index 1b7df0c4e57c..19872cecc9d2 100644
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -1129,13 +1129,14 @@ static int snd_intel8x0m_create(struct snd_card *card,
 		chip->bmaddr = pci_iomap(pci, 3, 0);
 	else
 		chip->bmaddr = pci_iomap(pci, 1, 0);
+
+port_inited:
 	if (!chip->bmaddr) {
 		dev_err(card->dev, "Controller space ioremap problem\n");
 		snd_intel8x0m_free(chip);
 		return -EIO;
 	}
 
- port_inited:
 	/* initialize offsets */
 	chip->bdbars_count = 2;
 	tbl = intel_regs;
-- 
2.17.1

