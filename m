Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 511511C36C7
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 12:24:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E3E416FB;
	Mon,  4 May 2020 12:23:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E3E416FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588587845;
	bh=gfo0+53nZKqY2J8lkt8Dedhyctwf66+BUftOGRVc4vA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cFMpcO3f15glwPjePB0x6fM7CsDmF6kbw/5sd5G3JD6uKKa8k4/pJCuH1HjwgXhyA
	 azA6uBOQ7N8oVLmSDHDMTmUO3NtLcYQXYARIwqglLW62wg/BtHpGFgDhXg9a3Rg92R
	 uLDWl+fBvv5jKsZEO5aVJnPW+vRpZON/jNTMfnmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA838F80278;
	Mon,  4 May 2020 12:21:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27FF5F801F7; Sat,  2 May 2020 16:26:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D5A8F80087
 for <alsa-devel@alsa-project.org>; Sat,  2 May 2020 16:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D5A8F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Wcdl4Zu8"
Received: from localhost (p5486C608.dip0.t-ipconnect.de [84.134.198.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A6E2621835;
 Sat,  2 May 2020 14:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588429609;
 bh=gfo0+53nZKqY2J8lkt8Dedhyctwf66+BUftOGRVc4vA=;
 h=From:To:Cc:Subject:Date:From;
 b=Wcdl4Zu8Xe1B1O2RTQI8v0aI66PyZSi1nmiDTcuJ8nWK7NgaEsR3LsirhAxLWoSQy
 maAx7jvV8ExDAXp+ckA1cBePnheG+U3raL0F4bRmSdLVgF9a0tAW5Vjl/VRl/On+P2
 mw00w/HGZDarPGlQ+lL1smIuYY6IceH06RZOH9G0=
From: Wolfram Sang <wsa@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: max9768: update contact email
Date: Sat,  2 May 2020 16:26:46 +0200
Message-Id: <20200502142646.19033-1-wsa@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 04 May 2020 12:21:36 +0200
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Mark Brown <broonie@kernel.org>, kernel@pengutronix.de
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

The 'pengutronix' address is defunct for years. Use the proper contact
address.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 sound/soc/codecs/max9768.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max9768.c b/sound/soc/codecs/max9768.c
index d0737db5868a..39dda1b03b3d 100644
--- a/sound/soc/codecs/max9768.c
+++ b/sound/soc/codecs/max9768.c
@@ -220,6 +220,6 @@ static struct i2c_driver max9768_i2c_driver = {
 };
 module_i2c_driver(max9768_i2c_driver);
 
-MODULE_AUTHOR("Wolfram Sang <w.sang@pengutronix.de>");
+MODULE_AUTHOR("Wolfram Sang <kernel@pengutronix.de>");
 MODULE_DESCRIPTION("ASoC MAX9768 amplifier driver");
 MODULE_LICENSE("GPL v2");
-- 
2.20.1

