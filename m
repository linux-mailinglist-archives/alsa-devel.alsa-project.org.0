Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFBC375492
	for <lists+alsa-devel@lfdr.de>; Thu,  6 May 2021 15:19:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36B0515F9;
	Thu,  6 May 2021 15:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36B0515F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620307184;
	bh=tMZUMoXaPXPwKyjGjK34+rgfikHZygZR2dDLLskzLc8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kOZaYkCiBX/qQojIvawB1Qxd4R6cZnbl4XQoBhStSfv3ujKzC/be+yQdN2CZ27SD1
	 Qm0KIoxZPJmyfNvLINydUbeRwUvVDh6N6pJP3U+5qce8zQL7wl/qvcUxZzErXLWRVm
	 Um0F3YY1RJxfTSXbEJ+muoOhHyToYA9UgA3xHULY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A834EF80234;
	Thu,  6 May 2021 15:18:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1540AF8021C; Thu,  6 May 2021 15:18:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cmccmta3.chinamobile.com (cmccmta3.chinamobile.com
 [221.176.66.81])
 by alsa1.perex.cz (Postfix) with ESMTP id A365CF8007E
 for <alsa-devel@alsa-project.org>; Thu,  6 May 2021 15:18:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A365CF8007E
Received: from spf.mail.chinamobile.com (unknown[172.16.121.19]) by
 rmmx-syy-dmz-app12-12012 (RichMail) with SMTP id 2eec6093ec76e44-a218c;
 Thu, 06 May 2021 21:17:43 +0800 (CST)
X-RM-TRANSID: 2eec6093ec76e44-a218c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.22.251.0])
 by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6093ec73c9f-b0b67;
 Thu, 06 May 2021 21:17:42 +0800 (CST)
X-RM-TRANSID: 2eea6093ec73c9f-b0b67
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoc: Fix unused define in jz4740-i2s.h
Date: Thu,  6 May 2021 21:18:33 +0800
Message-Id: <20210506131833.27420-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 linux-kernel@vger.kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>
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

Delete unused define of JZ4740_I2S_BIT_CLK, because it is unused
in any files.

Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/jz4740/jz4740-i2s.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.h b/sound/soc/jz4740/jz4740-i2s.h
index 44f120160..4da14eac1 100644
--- a/sound/soc/jz4740/jz4740-i2s.h
+++ b/sound/soc/jz4740/jz4740-i2s.h
@@ -7,6 +7,4 @@
 #define JZ4740_I2S_CLKSRC_EXT 0
 #define JZ4740_I2S_CLKSRC_PLL 1
 
-#define JZ4740_I2S_BIT_CLK		0
-
 #endif
-- 
2.20.1.windows.1



