Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E88D258EA0
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 14:53:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 168A71796;
	Tue,  1 Sep 2020 14:52:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 168A71796
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598964803;
	bh=48Ub5qPil6gZr1C/SLrc9fTujaGq8V4DdOcl9rGCBFc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nsNpK0kT7OGx/iIxu58h9e40Jo1YLsJMaEVf8JNiQ0MjlOY6vT+ZabCwGRGExQFCO
	 OM6VLJ8nJ6kRpMwqWxc/AJPwJcHcmMhuiUGo4x3Mr9qTdK0Vuh1tQYWuN1LtUd0UzY
	 5nDdd1jdM4x42ZNjWRinMmGdC/kMrH7ds1LErc8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DB2EF8020D;
	Tue,  1 Sep 2020 14:51:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D6AEF80217; Tue,  1 Sep 2020 14:51:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E736F801EB
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 14:51:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E736F801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="fjFhV/eA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=995; q=dns/txt; s=axis-central1;
 t=1598964695; x=1630500695;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bZ/H5Fs/QMbb9e+PlCCs4RRk8UF5csgy4VmwPELJui4=;
 b=fjFhV/eANRPw62eZ7sxb34UXc7rIBbuDuxeMDk/1OcTyFeMTTyy9JEe8
 pndWjVnQQVYgl79j9mBk98KJUHe+3LEY4LV+MSO0HQ/uVEDG5aYiLz9IL
 w9JbWLJIawv/vFG/23igrsExb82R4L7cq1OpjZiKoVmsVCx5EG9jvT5mT
 YDY7stmKUe5ddbCB8orFLo+KY51TrfzJD+F6IOFHg4SkTodxXyIslz6JM
 LZ5p549EFSJSZ5ZImdGkdt1UUWGx4dNImocBd3lGS76yRNfSWdzbA1ccx
 DYewGMwAk7FTibwSDRzR/SUKCDBoaaHv+ibVcp5FOzCwfl5jHt0lGj3iG Q==;
IronPort-SDR: gzHzlcmCoOgPoBKEljhCVaeIS9elkzWwIBKSsDR/9WI5kwrKUMgd6HhCVlab82xpz/0rYuKNbt
 XpylXJpQ0UDBcx2N2o8ygWoWviWgQzyYD5NvaN7qgWri1aWcDPHNf9Gx0W1VtUoRRtNR7F7QUw
 YGgbkjXETCHMybezzxJ13U8h3l5j8cr5HfaQTNapkBL9E1DDR9o9cmB6B/otRSellwxM4ijL3b
 R3MNdr8kYCBAvyzqsg7hVLf3FBFge2rULdnuSpzxYNDeDi/aQwHCxRHbee1NriFWVqTOy4rldP
 K7A=
X-IronPort-AV: E=Sophos;i="5.76,379,1592863200"; d="scan'208";a="12434794"
From: Camel Guo <camel.guo@axis.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <dmurphy@ti.com>
Subject: [PATCH v2] ASoC: tlv320adcx140: Fix accessing uninitialized
 adcx140->dev
Date: Tue, 1 Sep 2020 14:51:22 +0200
Message-ID: <20200901125123.25886-1-camel.guo@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: Camel Guo <camel.guo@axis.com>, alsa-devel@alsa-project.org,
 kernel@axis.com, linux-kernel@vger.kernel.org, Camel Guo <camelg@axis.com>
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

From: Camel Guo <camelg@axis.com>

In adcx140_i2c_probe, adcx140->dev is accessed before its
initialization. This commit fixes this bug.

Signed-off-by: Camel Guo <camel.guo@axis.com>
---
 sound/soc/codecs/tlv320adcx140.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 5cd50d841177..7ae6ec374be3 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -980,6 +980,8 @@ static int adcx140_i2c_probe(struct i2c_client *i2c,
 	if (!adcx140)
 		return -ENOMEM;
 
+	adcx140->dev = &i2c->dev;
+
 	adcx140->gpio_reset = devm_gpiod_get_optional(adcx140->dev,
 						      "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(adcx140->gpio_reset))
@@ -1007,7 +1009,7 @@ static int adcx140_i2c_probe(struct i2c_client *i2c,
 			ret);
 		return ret;
 	}
-	adcx140->dev = &i2c->dev;
+
 	i2c_set_clientdata(i2c, adcx140);
 
 	return devm_snd_soc_register_component(&i2c->dev,
-- 
2.20.1

