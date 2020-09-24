Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BDF276930
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Sep 2020 08:46:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9083A17AD;
	Thu, 24 Sep 2020 08:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9083A17AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600929995;
	bh=LJLWVld4Q7N/60dvb3ox0/TaLLpD5t6T4NkSro9v7FE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y58af1Xc2R+P455xII6xupfesdGpkekSAyn6fS2DtXSjrJOk8oaBqq+eF00AjnXtc
	 riS+OU0ThKz3ubTWXQyhdGfXjvJduLUJ4BZAn6sL5X7zwRcGovgz0PNRbepLOHbbIR
	 lp6DPco9aGnKLH7eTbCSPvRDt6WQBHnLNBpTGB00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE4FEF800DA;
	Thu, 24 Sep 2020 08:44:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 798EEF80232; Thu, 24 Sep 2020 08:44:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from m17618.mail.qiye.163.com (m17618.mail.qiye.163.com
 [59.111.176.18])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38A07F800DA
 for <alsa-devel@alsa-project.org>; Thu, 24 Sep 2020 08:44:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38A07F800DA
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.231])
 by m17618.mail.qiye.163.com (Hmail) with ESMTPA id 9E06D4E17A5;
 Thu, 24 Sep 2020 14:44:28 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Wang Qing <wangqing@vivo.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] sound/soc/codecs: fix spelling typo in comments
Date: Thu, 24 Sep 2020 14:43:59 +0800
Message-Id: <1600929860-28862-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGUhOTxpJT0lNTUMeVkpNS0tCSUJDTUNCQ0xVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MxA6Vio5ND8oEgMSKhMQLk9C
 CDNPFDBVSlVKTUtLQklCQ01CSEJMVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISllXWQgBWUFKT0JINwY+
X-HM-Tid: 0a74bedb2c4b9376kuws9e06d4e17a5
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

Modify the comment typo: "compliment" -> "complement".

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 sound/soc/codecs/ak4458.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ak4458.h b/sound/soc/codecs/ak4458.h
index f906215..e43144c
--- a/sound/soc/codecs/ak4458.h
+++ b/sound/soc/codecs/ak4458.h
@@ -49,7 +49,7 @@
 
 /* DIF2	1 0
  *  x	1 0 MSB justified  Figure 3 (default)
- *  x	1 1 I2S Compliment  Figure 4
+ *  x	1 1 I2S Complement  Figure 4
  */
 #define AK4458_DIF_SHIFT	1
 #define AK4458_DIF_MASK		GENMASK(3, 1)
-- 
2.7.4

