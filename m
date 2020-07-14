Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DEB21EF43
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 13:29:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 491EA1662;
	Tue, 14 Jul 2020 13:29:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 491EA1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594726199;
	bh=uu1W4/K3AIxuCnNbKT1dBOJvZPwdch1kN8R1qIGnqGM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lOGMKsiwSaCPqhqeHUQVzkYEa0eTb6BTtn7uVntETGKiZItFKcgZnIfmJHLpUvxR9
	 yLdxDLMxtMBmHhMHiCg9a9Enx9JZmm3vzMVgNn9JXLMx3Hv8G9IZ2gBUBAuBDsqSPU
	 Ez0RJGC783nuo1Trq1XOOy2ZzNeT7xZBn/QIGQa4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46965F8016F;
	Tue, 14 Jul 2020 13:28:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86B6CF8019B; Tue, 14 Jul 2020 13:28:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cmccmta1.chinamobile.com (cmccmta1.chinamobile.com
 [221.176.66.79])
 by alsa1.perex.cz (Postfix) with ESMTP id 2E7B6F800E5
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 13:27:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E7B6F800E5
Received: from spf.mail.chinamobile.com (unknown[172.16.121.3]) by
 rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee15f0d96a6c1a-eba03;
 Tue, 14 Jul 2020 19:27:35 +0800 (CST)
X-RM-TRANSID: 2ee15f0d96a6c1a-eba03
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee25f0d96a30de-75649;
 Tue, 14 Jul 2020 19:27:34 +0800 (CST)
X-RM-TRANSID: 2ee25f0d96a30de-75649
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: broonie@kernel.org, tiwai@suse.com, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, lgirdwood@gmail.com
Subject: [PATCH] ASoC: qcom: qdsp6: Use IS_ERR() instead of IS_ERR_OR_NULL()
Date: Tue, 14 Jul 2020 19:27:44 +0800
Message-Id: <20200714112744.20560-1-tangbin@cmss.chinamobile.com>
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

In the function q6adm_open(), q6adm_alloc_copp() doesn't return 
NULL. Thus use IS_ERR() to validate the returned value instead 
of IS_ERR_OR_NULL(). And delete the extra line.

Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/qcom/qdsp6/q6adm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
index d8069864b..44ac0728f 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -403,7 +403,7 @@ struct q6copp *q6adm_open(struct device *dev, int port_id, int path, int rate,
 
 	spin_lock_irqsave(&adm->copps_list_lock, flags);
 	copp = q6adm_alloc_copp(adm, port_id);
-	if (IS_ERR_OR_NULL(copp)) {
+	if (IS_ERR(copp)) {
 		spin_unlock_irqrestore(&adm->copps_list_lock, flags);
 		return ERR_CAST(copp);
 	}
@@ -419,7 +419,6 @@ struct q6copp *q6adm_open(struct device *dev, int port_id, int path, int rate,
 	copp->bit_width = bit_width;
 	copp->app_type = app_type;
 
-
 	ret = q6adm_device_open(adm, copp, port_id, path, topology,
 				channel_mode, bit_width, rate);
 	if (ret < 0) {
-- 
2.20.1.windows.1



