Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B1B355148
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 12:53:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E31E61661;
	Tue,  6 Apr 2021 12:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E31E61661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617706406;
	bh=m85azlWiXGinaJ6O0SGWgQ7Oie/8uGMuCNd+D4P0zIY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cnHQlFDQ3yHXoThpzWv5WwcLz5V1DAhZ4hbsA2dreZ1Bl5hyuvy+FQR/M0Lf/wHNS
	 ePGLh16ojhENd40PCvvxxJWxuP1u7Q45NF3KzQQLWZZIyFfcUQK46/o0k9CDa15aXT
	 YIDQU2C3yMSyEEQwEyQMLvaQGy1TvWWvFa32b+5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FBE9F80430;
	Tue,  6 Apr 2021 12:50:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A501CF8032D; Tue,  6 Apr 2021 12:50:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from router.aksignal.cz (router.aksignal.cz [62.44.4.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA7D3F8020B
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 12:50:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA7D3F8020B
Received: from localhost (localhost [127.0.0.1])
 by router.aksignal.cz (Postfix) with ESMTP id 3D9D53FA29;
 Tue,  6 Apr 2021 12:50:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at router.aksignal.cz
Received: from router.aksignal.cz ([127.0.0.1])
 by localhost (router.aksignal.cz [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id YKknzPuDFIZJ; Tue,  6 Apr 2021 12:50:22 +0200 (CEST)
Received: from pc-gameroom.prchals.tk (unknown [83.240.30.185])
 (Authenticated sender: jiri.prchal@aksignal.cz)
 by router.aksignal.cz (Postfix) with ESMTPSA id B1CE43FA2B;
 Tue,  6 Apr 2021 12:50:22 +0200 (CEST)
From: Jiri Prchal <jiri.prchal@aksignal.cz>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] SOC Codecs: TLV320AIC3X add SPI: move thinks to header
 file
Date: Tue,  6 Apr 2021 12:50:14 +0200
Message-Id: <20210406105018.59463-2-jiri.prchal@aksignal.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406105018.59463-1-jiri.prchal@aksignal.cz>
References: <20210406105018.59463-1-jiri.prchal@aksignal.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Jiri Prchal <jiri.prchal@aksignal.cz>, Liam Girdwood <lgirdwood@gmail.com>
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

Move shered definitions and defines to header file.

Signed-off-by: Jiri Prchal <jiri.prchal@aksignal.cz>
---
 sound/soc/codecs/tlv320aic3x.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic3x.h b/sound/soc/codecs/tlv320aic3x.h
index 66d3580cf2b1..5d2195f009a9 100644
--- a/sound/soc/codecs/tlv320aic3x.h
+++ b/sound/soc/codecs/tlv320aic3x.h
@@ -9,6 +9,19 @@
 #ifndef _AIC3X_H
 #define _AIC3X_H
 
+struct device;
+struct regmap_config;
+
+extern const struct regmap_config aic3x_regmap_config;
+int aic3x_probe(struct device *dev, struct regmap *regmap, kernel_ulong_t driver_data);
+int aic3x_remove(struct device *dev);
+
+#define AIC3X_MODEL_3X 0
+#define AIC3X_MODEL_33 1
+#define AIC3X_MODEL_3007 2
+#define AIC3X_MODEL_3104 3
+#define AIC3X_MODEL_3106 4
+
 /* AIC3X register space */
 #define AIC3X_CACHEREGNUM		110
 
-- 
2.25.1

