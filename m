Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 732691B38BF
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 09:19:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BEAF16D4;
	Wed, 22 Apr 2020 09:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BEAF16D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587539973;
	bh=oFZXS8RjAHA/E07YoAsgCiHG9ZF3mkVPQuFK4EcJzeA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cREYyRJrbcYjeRGm1xoSOaZcK41ptX1mrDpdJ56pjhPwzKQffTZUaGF/0hp2ByPC9
	 MpmIYBHjck7Xm19ioiVHUhc39h7mg4X8ViWS62bBxmVGd2WcMtulWC8jW1zY3BjaMj
	 uMh7uC0PAHIv04UBbjD3Vn3Wah3/yilXrfguVZd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F9B6F8020C;
	Wed, 22 Apr 2020 09:17:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 864A2F801D9; Wed, 22 Apr 2020 09:17:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47851F80108
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 09:17:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47851F80108
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1755546874DFF5CDF436;
 Wed, 22 Apr 2020 15:17:26 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Wed, 22 Apr 2020
 15:17:17 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <clemens@ladisch.de>, <perex@perex.cz>, <tiwai@suse.com>,
 <tglx@linutronix.de>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] ALSA: oxygen: use true,false for bool variables
Date: Wed, 22 Apr 2020 15:16:46 +0800
Message-ID: <20200422071646.48436-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Cc: Jason Yan <yanaijie@huawei.com>
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

Fix the following coccicheck warning:

sound/pci/oxygen/xonar_pcm179x.c:463:1-17: WARNING: Assignment of 0/1 to
bool variable
sound/pci/oxygen/xonar_pcm179x.c:505:1-17: WARNING: Assignment of 0/1 to
bool variable

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 sound/pci/oxygen/xonar_pcm179x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/oxygen/xonar_pcm179x.c b/sound/pci/oxygen/xonar_pcm179x.c
index 6a0520c4fb5a..cf801a235df9 100644
--- a/sound/pci/oxygen/xonar_pcm179x.c
+++ b/sound/pci/oxygen/xonar_pcm179x.c
@@ -460,7 +460,7 @@ static void xonar_st_init(struct oxygen *chip)
 
 	data->generic.anti_pop_delay = 100;
 	data->h6 = chip->model.dac_channels_mixer > 2;
-	data->has_cs2000 = 1;
+	data->has_cs2000 = true;
 	data->cs2000_regs[CS2000_FUN_CFG_1] = CS2000_REF_CLK_DIV_1;
 	data->broken_i2c = true;
 
@@ -502,7 +502,7 @@ static void xonar_xense_init(struct oxygen *chip)
 	xonar_init_ext_power(chip);
 
 	data->generic.anti_pop_delay = 100;
-	data->has_cs2000 = 1;
+	data->has_cs2000 = true;
 	data->cs2000_regs[CS2000_FUN_CFG_1] = CS2000_REF_CLK_DIV_1;
 
 	oxygen_write16(chip, OXYGEN_I2S_A_FORMAT,
-- 
2.21.1

