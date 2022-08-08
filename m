Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B704458CB69
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 17:40:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 135F183B;
	Mon,  8 Aug 2022 17:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 135F183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659973241;
	bh=mtzXCUg0RBE0xJR/xNnlGl/5y6IQki3u3OYvHmVjY14=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tfLHRxW16uNJmQbYXu2l1lrXTs088uOY/+6q6Rj/RsInnNRrBgE6+HwY5QJutpooi
	 nqS+jLBQeZQkiRfTmBRIwP8D4LQR0poHOleKXFmdZg+pUa7zsbbitdD7c5JPp5SqXo
	 PlAsJy2w8IcfDEtUgsK3lZLNzHXtaNhEewm08Dsw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8102EF804B1;
	Mon,  8 Aug 2022 17:39:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36959F8049C; Mon,  8 Aug 2022 17:39:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=NO_DNS_FOR_FROM,RDNS_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bg5.exmail.qq.com (unknown [43.155.67.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 019A1F8012B
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 17:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 019A1F8012B
X-QQ-mid: bizesmtp89t1659973164t11sh6ez
Received: from harry-jrlc.. ( [182.148.14.53]) by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 08 Aug 2022 23:39:11 +0800 (CST)
X-QQ-SSF: 0100000000200030C000B00A0000020
X-QQ-FEAT: lj50s4tNr7rRMoZO4mwcZ0ApOv2PYNPr7KBJyfSChxYy0fopckj29jg1ItjKz
 p/ZS8Lv3whhw1XAl0Da36VgUk3CifBbQRAGymrJmOSVdWBiIQdj0Xa4J+mYZDBG7/Fior31
 VWYvhfOHt9ATBTvqj5R9H1lnxpiVmQFSS/pUm+ic/okW40WYTO+RBiHvPJ7hjto+5qmlqbl
 iF7s12LmhkXsKm9mtt/tbleP5JllqFpkd/D+kPZzCqy6cX8mr+zrZ5/DvPZdkR8u1Oyxptl
 2TQegBp4Q1NAoiWMTe0/4tZr/Z9Khf/zeiwSX+SowjKmgQIGd0mQtS5ujXyPYKwNRAo5w2/
 RJo3PTN8gDIrpjHys5t1zNbxQsRXFy2FEA9CmfloYvXzeoiKYZRB+DfWePbOEzUWgyaBa7n
X-QQ-GoodBg: 0
From: Xin Gao <gaoxin@cdjrlc.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ASoC: Variable type completion
Date: Mon,  8 Aug 2022 23:39:10 +0800
Message-Id: <20220808153910.59545-1-gaoxin@cdjrlc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, lgirdwood@gmail.com,
 Xin Gao <gaoxin@cdjrlc.com>, linux-kernel@vger.kernel.org
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

'unsigned int' is better than 'unsigned'.

Signed-off-by: Xin Gao <gaoxin@cdjrlc.com>
---
 sound/soc/codecs/uda134x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/uda134x.c b/sound/soc/codecs/uda134x.c
index 037833c509f7..607897f1f357 100644
--- a/sound/soc/codecs/uda134x.c
+++ b/sound/soc/codecs/uda134x.c
@@ -450,7 +450,7 @@ static int uda134x_soc_probe(struct snd_soc_component *component)
 	struct uda134x_priv *uda134x = snd_soc_component_get_drvdata(component);
 	struct uda134x_platform_data *pd = uda134x->pd;
 	const struct snd_soc_dapm_widget *widgets;
-	unsigned num_widgets;
+	unsigned int num_widgets;
 	int ret;
 
 	printk(KERN_INFO "UDA134X SoC Audio Codec\n");
-- 
2.30.2

