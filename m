Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7416A1BD879
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 11:40:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3AA0169E;
	Wed, 29 Apr 2020 11:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3AA0169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588153235;
	bh=hbwrboC6Rasvk5JFkBQOQ28k+0CTrMSKgFdIB1jOa5c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fHSeaw94S4Qrpwg0vFhfxvxdo8PyfkYhTLVwgYoZNSt0vbK+Tw1gpngB4yiCGRWVf
	 lsea7IqSL+x/QlORBzToQbXsXWooKlebalnt1jUA1ISp/6u3/Xth5BJFucb4oi58fM
	 QVflKAG98Ll+WIPiRqJ3f2NsAogB0N28muCO8VzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E661F800B6;
	Wed, 29 Apr 2020 11:38:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B1D0F8022B; Wed, 29 Apr 2020 11:38:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cmccmta3.chinamobile.com (cmccmta3.chinamobile.com
 [221.176.66.81])
 by alsa1.perex.cz (Postfix) with ESMTP id EC73FF80109
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 11:38:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC73FF80109
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by
 rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee95ea94af6598-ad742;
 Wed, 29 Apr 2020 17:37:58 +0800 (CST)
X-RM-TRANSID: 2ee95ea94af6598-ad742
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.104.146.39])
 by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee65ea94af2f5a-e8bde;
 Wed, 29 Apr 2020 17:37:58 +0800 (CST)
X-RM-TRANSID: 2ee65ea94af2f5a-e8bde
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de
Subject: [PATCH] ASoC: mxs-saif: Fix unused assignment
Date: Wed, 29 Apr 2020 17:38:23 +0800
Message-Id: <20200429093823.1372-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Tang Bin <tangbin@cmss.chinamobile.com>
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

Delete unused initialized value, because 'ret' will be assigined
by the function of_alias_get_id().

Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/mxs/mxs-saif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index 1e38ce858..dc197883e 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -733,7 +733,7 @@ static int mxs_saif_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct mxs_saif *saif;
-	int irq, ret = 0;
+	int irq, ret;
 	struct device_node *master;
 
 	if (!np)
-- 
2.20.1.windows.1



