Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAEA3BE3CD
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 09:43:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CB8D1662;
	Wed,  7 Jul 2021 09:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CB8D1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625643803;
	bh=RHqTMeHHDyv6lhLV15yljZogGvR5TEyf/kwVYt7T7h8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d+VQih0C4yMuvgoKtZkCIsfSg7QLaFXy89PKeUwAmF00RvkhOiqV/AcuxY8r9lAN+
	 vQwdSgdvMNAlF6EfMUCmseoI/ZYgp4tdGS1S6wRaV5GimTY7KTB5jUKHC+zOC9zI9n
	 W0tXPxFpbfM/M4O01sTyYHc93BvshlETQC1HQtM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 757F5F8025C;
	Wed,  7 Jul 2021 09:41:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE477F80224; Wed,  7 Jul 2021 09:41:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1645CF8012A
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 09:41:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1645CF8012A
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GKWVt4VL4z78hc;
 Wed,  7 Jul 2021 15:38:14 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 7 Jul 2021 15:41:38 +0800
Received: from thunder-town.china.huawei.com (10.174.179.0) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 7 Jul 2021 15:41:38 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel <alsa-devel@alsa-project.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] ALSA: isa: Fix error return code in snd_cmi8330_probe()
Date: Wed, 7 Jul 2021 15:40:51 +0800
Message-ID: <20210707074051.2663-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.179.0]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
Cc: Zhen Lei <thunder.leizhen@huawei.com>
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

When 'SB_HW_16' check fails, the error code -ENODEV instead of 0 should be
returned, which is the same as that returned when 'WSS_HW_CMI8330' check
fails.

Fixes: 43bcd973d6d0 ("[ALSA] Add snd_card_set_generic_dev() call to ISA drivers")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 sound/isa/cmi8330.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/isa/cmi8330.c b/sound/isa/cmi8330.c
index 6c59a3eec59b..ef6d0a20efd8 100644
--- a/sound/isa/cmi8330.c
+++ b/sound/isa/cmi8330.c
@@ -551,7 +551,7 @@ static int snd_cmi8330_probe(struct snd_card *card, int dev)
 	}
 	if (acard->sb->hardware != SB_HW_16) {
 		snd_printk(KERN_ERR PFX "SB16 not found during probe\n");
-		return err;
+		return -ENODEV;
 	}
 
 	snd_wss_out(acard->wss, CS4231_MISC_INFO, 0x40); /* switch on MODE2 */
-- 
2.25.1


