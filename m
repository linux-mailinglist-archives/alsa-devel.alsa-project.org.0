Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB723D8E24
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jul 2021 14:45:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76A0717ED;
	Wed, 28 Jul 2021 14:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76A0717ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627476343;
	bh=Od7x43PRDE523BuYnPr+RcBXW0vl/1+nr+bt3Xftas8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=je5yvG4h2UDFcrEmI3mHhWJfWsJH2Mt7yufutRZWViXNqg5aX8FSD0exVN+Pt0KWz
	 ROgQZ5l/iF/wFezSdgkQj87jm08Iu3pBtH4SS/UKEuugQtG8iamDVpXV41Ge3GdxdF
	 ww2R3bXXqndLuG8MqYwPla7CNpSi2m2ldzNhuJ60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E31D8F8025E;
	Wed, 28 Jul 2021 14:44:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92DC1F8025A; Wed, 28 Jul 2021 14:44:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cmccmta3.chinamobile.com (cmccmta3.chinamobile.com
 [221.176.66.81])
 by alsa1.perex.cz (Postfix) with ESMTP id CFE67F80127
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 14:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFE67F80127
Received: from spf.mail.chinamobile.com (unknown[172.16.121.9]) by
 rmmx-syy-dmz-app10-12010 (RichMail) with SMTP id 2eea610150e41ed-a7a23;
 Wed, 28 Jul 2021 20:43:19 +0800 (CST)
X-RM-TRANSID: 2eea610150e41ed-a7a23
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.112.105.130])
 by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee5610150e4de6-d3396;
 Wed, 28 Jul 2021 20:43:19 +0800 (CST)
X-RM-TRANSID: 2ee5610150e4de6-d3396
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 rjui@broadcom.com, sbranden@broadcom.com
Subject: [PATCH] ASoC: bcm: cygnus-pcm: Fix unused assignment about 'rc'
Date: Wed, 28 Jul 2021 20:44:11 +0800
Message-Id: <20210728124411.3168-1-tangbin@cmss.chinamobile.com>
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

Delete unused initialized value of 'rc', because it will
be assigned by the function devm_request_irq().

Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/bcm/cygnus-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/bcm/cygnus-pcm.c b/sound/soc/bcm/cygnus-pcm.c
index 7ad07239f..039365f76 100644
--- a/sound/soc/bcm/cygnus-pcm.c
+++ b/sound/soc/bcm/cygnus-pcm.c
@@ -830,7 +830,7 @@ static struct snd_soc_component_driver cygnus_soc_platform = {
 int cygnus_soc_platform_register(struct device *dev,
 				 struct cygnus_audio *cygaud)
 {
-	int rc = 0;
+	int rc;
 
 	dev_dbg(dev, "%s Enter\n", __func__);
 
-- 
2.20.1.windows.1



