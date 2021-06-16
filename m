Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D95433A8F0C
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Jun 2021 04:52:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5932B168D;
	Wed, 16 Jun 2021 04:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5932B168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623811977;
	bh=XSsJ5fw6nl7hGUihgwPAmGhHyhUdv5YYIoSmKuCWb6U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UZAUcpEaMphzGi1ejRDp2/JaMnpzsJWHUWfNf60h8A1WLU/3YJZeETBI3LcXeKNC3
	 +7zwxgvx0hcYxd4AsTm56LT5+/aTzqX4U6PixZgUvABE71N3IiJxCsL5otzKMj8nQW
	 hJFF+3ChhzClsLcucWFyGERTxiX9Kp5mBwI9ll8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B30EFF802E8;
	Wed, 16 Jun 2021 04:51:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88647F80423; Wed, 16 Jun 2021 04:51:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6F4FF80165
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 04:51:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6F4FF80165
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G4V424bJDzZfBy;
 Wed, 16 Jun 2021 10:48:18 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 16 Jun 2021 10:51:13 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 16 Jun
 2021 10:51:13 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH -next] ALSA: fm801: Fix missing pci_release_regions() on error
 in snd_fm801_create()
Date: Wed, 16 Jun 2021 10:55:07 +0800
Message-ID: <20210616025507.2120103-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Cc: broonie@kernel.org, tiwai@suse.com
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

Fix the missing pci_release_regions() before return
from snd_fm801_create() in the error handling case.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 sound/pci/fm801.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index ed9dae87145b..adac9c6a67f0 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -1254,6 +1254,7 @@ static int snd_fm801_create(struct snd_card *card,
 				IRQF_SHARED, KBUILD_MODNAME, chip)) {
 			dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
 			snd_fm801_free(chip);
+			pci_release_regions(pci);
 			return -EBUSY;
 		}
 		chip->irq = pci->irq;
@@ -1266,6 +1267,7 @@ static int snd_fm801_create(struct snd_card *card,
 	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
 	if (err < 0) {
 		snd_fm801_free(chip);
+		pci_release_regions(pci);
 		return err;
 	}
 
@@ -1273,6 +1275,7 @@ static int snd_fm801_create(struct snd_card *card,
 	err = v4l2_device_register(&pci->dev, &chip->v4l2_dev);
 	if (err < 0) {
 		snd_fm801_free(chip);
+		pci_release_regions(pci);
 		return err;
 	}
 	chip->tea.v4l2_dev = &chip->v4l2_dev;
@@ -1285,6 +1288,7 @@ static int snd_fm801_create(struct snd_card *card,
 		if (snd_tea575x_init(&chip->tea, THIS_MODULE)) {
 			dev_err(card->dev, "TEA575x radio not found\n");
 			snd_fm801_free(chip);
+			pci_release_regions(pci);
 			return -ENODEV;
 		}
 	} else if ((chip->tea575x_tuner & TUNER_TYPE_MASK) == 0) {
-- 
2.25.1

