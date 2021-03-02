Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2CE32A1AE
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 14:59:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51F371718;
	Tue,  2 Mar 2021 14:58:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51F371718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614693540;
	bh=ORjRVjjbRPvSWZCaZei4PIEwL3mXOWjMHgUuSj3j4mw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FMupU4Qx4qHlFhQLa0FQFF7daKqepgNAtCbObg8qlUII+zKXd+uReyCDXoEE6DGqS
	 Ey/ntEZQ8AJKMbNgs7yLKSpKbmulJrKgyLq6L8tEqIhwJ4tR91U2WtT0ubXFxKI3Zo
	 86j+BWhx60d969LTcL6znbWBTykOimBgaTl0O4ko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9680F80271;
	Tue,  2 Mar 2021 14:57:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50431F80269; Tue,  2 Mar 2021 14:57:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com
 [221.176.66.80])
 by alsa1.perex.cz (Postfix) with ESMTP id B70E7F8012D
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 14:57:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B70E7F8012D
Received: from spf.mail.chinamobile.com (unknown[172.16.121.13]) by
 rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee5603e441a692-92a17;
 Tue, 02 Mar 2021 21:56:44 +0800 (CST)
X-RM-TRANSID: 2ee5603e441a692-92a17
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.0.144.162])
 by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee7603e4418325-20d03;
 Tue, 02 Mar 2021 21:56:44 +0800 (CST)
X-RM-TRANSID: 2ee7603e4418325-20d03
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: broonie@kernel.org, paul@crapouillou.net, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2] ASoC: codec: Omit superfluous error message in
 jz4760_codec_probe()
Date: Tue,  2 Mar 2021 21:56:30 +0800
Message-Id: <20210302135630.11456-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
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

The function devm_platform_ioremap_resource has already contained
error message, so remove the redundant dev_err here.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
Changes from v1
 - to streamline the code.
---
 sound/soc/codecs/jz4760.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/jz4760.c b/sound/soc/codecs/jz4760.c
index e8f28ccc145a..5ae0e312bcfc 100644
--- a/sound/soc/codecs/jz4760.c
+++ b/sound/soc/codecs/jz4760.c
@@ -841,11 +841,8 @@ static int jz4760_codec_probe(struct platform_device *pdev)
 	codec->dev = dev;
 
 	codec->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(codec->base)) {
-		ret = PTR_ERR(codec->base);
-		dev_err(dev, "Failed to ioremap mmio memory: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(codec->base))
+		return PTR_ERR(codec->base);
 
 	codec->regmap = devm_regmap_init(dev, NULL, codec,
 					&jz4760_codec_regmap_config);
-- 
2.18.2



