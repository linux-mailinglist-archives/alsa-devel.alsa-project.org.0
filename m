Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 534675BE4F7
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 13:51:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E775A868;
	Tue, 20 Sep 2022 13:51:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E775A868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663674719;
	bh=4BIqky3DIS0seU/plNkZ4YQpDM3idWOT3Q2YAslq4nY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cRG3nd8SjCwI5bh/4I8ebtqT21w97lQ1Vo7A0yXA3vGwJ0Gh4Gd+bS3MCmBnQE92b
	 KkRMcyO/INDIjTxgvOYzGGqwgQP76neRO4FA+/HJNxw5PtrZ/8p5eOL0nE4xsW8B1G
	 CBpuZ88Rt/s+kaKXBBCbjGONSDk5uvajMjOLLU0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6310BF800F2;
	Tue, 20 Sep 2022 13:51:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61839F80155; Tue, 20 Sep 2022 13:50:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.shift-gmbh.com (mail.shift-gmbh.com [85.10.195.145])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A5A4F8012B
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 13:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A5A4F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=shiftphones.com header.i=@shiftphones.com
 header.b="Oy25ZJFA"
From: Alexander Martinz <amartinz@shiftphones.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shiftphones.com;
 s=2018; t=1663674647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=JdCKIiMawSXSr/ZxXwJIlTkA59Lh2PFjI0W5CYJC9RA=;
 b=Oy25ZJFAPBlITWreVJNBxwVorcY09ry9IH4vuAk9eXuQmo7WvUkUljXdxXkKsiLzgrK1Oj
 mtj1iKxA77CpbD+di4xO2M3SBW1nMSYv7zLqp7oY5SqRrXC7LR77JNyOdERsuvlnot9bC6
 dwL1CorJcZ3XcATKLg6dVRc5niJQS+v+FI5WTo610UeNFz1+UM7lnh9x6sjhgXqTRnL774
 fOEn7VLneK9INT42/oux/Vb811cndcg6Q9uiPx1vbdLpoky73U6vGvaNERFkwfEgLRudmz
 q7Iagwe6+0WMflIEg2XtSaeDvA/fw7FdnfTnhbV1kjGxSk+m4tngUnSSQi5TCw==
To: Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH] ASoC: codecs: tfa989x: fix register access comments
Date: Tue, 20 Sep 2022 13:50:14 +0200
Message-Id: <20220920115014.952062-1-amartinz@shiftphones.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=amartinz@shiftphones.com
 smtp.mailfrom=amartinz@shiftphones.com
Cc: Alexander Martinz <amartinz@shiftphones.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

Fix comments regarding register access based on review feedback[1].

[1]: https://lore.kernel.org/all/YppQ7BiqlBDMNsuc@gerhold.net/

Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
---
 sound/soc/codecs/tfa989x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tfa989x.c b/sound/soc/codecs/tfa989x.c
index 1c27429b9af6..b853507e65a8 100644
--- a/sound/soc/codecs/tfa989x.c
+++ b/sound/soc/codecs/tfa989x.c
@@ -193,7 +193,7 @@ static int tfa9890_init(struct regmap *regmap)
 {
 	int ret;
 
-	/* unhide keys to allow updating them */
+	/* temporarily allow access to hidden registers */
 	ret = regmap_write(regmap, TFA989X_HIDE_UNHIDE_KEY, 0x5a6b);
 	if (ret)
 		return ret;
@@ -203,7 +203,7 @@ static int tfa9890_init(struct regmap *regmap)
 	if (ret)
 		return ret;
 
-	/* hide keys again */
+	/* hide registers again */
 	ret = regmap_write(regmap, TFA989X_HIDE_UNHIDE_KEY, 0x0000);
 	if (ret)
 		return ret;
-- 
2.37.3

