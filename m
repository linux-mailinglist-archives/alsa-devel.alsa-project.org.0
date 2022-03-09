Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDC54D2502
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 01:51:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77A481856;
	Wed,  9 Mar 2022 01:50:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77A481856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646787084;
	bh=+JlfuEqCe685XOtatYIt67V44uikZA1IYUt0m/Z9NR0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l3NjAOl2J1V8/Ra5+gEzNhnk2e3aeksxj0vW5W3r3RSsqXkZOp95e9HiWDEbR5nI3
	 FDTK9oNpliZl7/WHMSPIgVp+OQ+s/DCbImKtytVLCfXVe3QU9iDo+ippRkT/7T4oux
	 hSG/pK7XizXxzTuC8zpshgqH9nsixG3VinG+u7qY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF8BDF80271;
	Wed,  9 Mar 2022 01:50:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28773F80272; Wed,  9 Mar 2022 01:50:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out199-14.us.a.mail.aliyun.com (out199-14.us.a.mail.aliyun.com
 [47.90.199.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4061F80279;
 Wed,  9 Mar 2022 01:49:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4061F80279
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0V6gZp-q_1646786985; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0V6gZp-q_1646786985) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 09 Mar 2022 08:49:47 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: pierre-louis.bossart@linux.intel.com
Subject: [PATCH 1/2] ASoC: SOF: amd: Remove unneeded semicolon
Date: Wed,  9 Mar 2022 08:49:29 +0800
Message-Id: <20220309004929.125558-2-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20220309004929.125558-1-jiapeng.chong@linux.alibaba.com>
References: <20220309004929.125558-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Abaci Robot <abaci@linux.alibaba.com>, lgirdwood@gmail.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 sound-open-firmware@alsa-project.org
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

Fix the following coccicheck warnings:

./sound/soc/sof/amd/acp.c:280:3-4: Unneeded semicolon.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 sound/soc/sof/amd/acp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 66ca05545be2..71d71c152342 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -277,7 +277,7 @@ static irqreturn_t acp_irq_thread(int irq, void *context)
 				dev_err(sdev->dev, "%s: Failed to acquire HW lock\n", __func__);
 				return IRQ_NONE;
 			}
-		};
+		}
 
 		sof_ops(sdev)->irq_thread(irq, sdev);
 		val |= ACP_DSP_TO_HOST_IRQ;
-- 
2.20.1.7.g153144c

