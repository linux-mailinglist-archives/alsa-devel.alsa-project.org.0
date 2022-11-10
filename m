Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9963D625453
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 08:13:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C10291669;
	Fri, 11 Nov 2022 08:12:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C10291669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668150796;
	bh=AWn2hMQjAaWJ1yIP6Ub6bVX80rgEocaexixG2fBvbEc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LfF0TSCUB3LgDpcyggL1uVb7ltft6lLrfN77HWPOjWFqC5vzC+veYq4X/iN2i4hSb
	 p6ZIbXW4y7QMO0b24bnhP5mmPma6ys6eU65hUf0Qkin+C7Vnffelq7SejAx5hNHsXV
	 A2v9RMlQvtJAsspIL7y6AQmoNOLnzFAsz991R0is=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50CF5F800F8;
	Fri, 11 Nov 2022 08:12:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCEC1F80570; Thu, 10 Nov 2022 20:06:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61969F8055A
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 20:06:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61969F8055A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="J7jstCeg"
Received: from Falcon9.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: detlev)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C6DDB6602A34;
 Thu, 10 Nov 2022 19:06:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668107181;
 bh=AWn2hMQjAaWJ1yIP6Ub6bVX80rgEocaexixG2fBvbEc=;
 h=From:To:Cc:Subject:Date:From;
 b=J7jstCegJdnMChsGzYEVIeUtXBat6bnIgQ1Be2G+DXquqZv3j1330qoVfyE485Y2p
 reDS3oHVjfsqMtFOPaynMp3hqvzGp8zVX2rgJFkW7xq5b+Cr+4vL1YSAYS3se1lCvj
 b3lUyhIpTDwAs6ujL4jz1P+pzWbUX1qlq792H3OnvrGLyi6SoSQGmoF5r1v5wVz3Yl
 5j08klmvrfq+adYP7HNXXeSrIUaB0i/eGsjB034BLvzgehdOO34/7plHOX2gkmWdAA
 Okk53+12zgevZI5L+y7wXFYPpI8hGWfUTtoGqxnT+fT2pSgWkr4rMa0vg0iIb7QgxU
 9F2Xt3KDN2/bw==
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: sgtl5000: Reset the CHIP_CLK_CTRL reg on remove
Date: Thu, 10 Nov 2022 14:06:12 -0500
Message-Id: <20221110190612.1341469-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 11 Nov 2022 08:12:19 +0100
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 "moderated list:NXP SGTL5000 DRIVER" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
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

Since commit bf2aebccddef ("ASoC: sgtl5000: Fix noise on shutdown/remove"),
the device power control registers are reset when the driver is
removed/shutdown.

This is an issue when the device is configured to use the PLL clock. The
device will stop responding if it is still configured to use the PLL
clock but the PLL clock is powered down.

When rebooting linux, the probe function will show:
sgtl5000 0-000a: Error reading chip id -11

Make sure that the CHIP_CLK_CTRL is reset to its default value before
powering down the device.

Fixes: bf2aebccddef ("ASoC: sgtl5000: Fix noise on shutdown/remove")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 sound/soc/codecs/sgtl5000.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index 4b2135eba74d..a916f4619ea3 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -1794,6 +1794,7 @@ static void sgtl5000_i2c_remove(struct i2c_client *client)
 {
 	struct sgtl5000_priv *sgtl5000 = i2c_get_clientdata(client);
 
+	regmap_write(sgtl5000->regmap, SGTL5000_CHIP_CLK_CTRL, SGTL5000_CHIP_CLK_CTRL_DEFAULT);
 	regmap_write(sgtl5000->regmap, SGTL5000_CHIP_DIG_POWER, SGTL5000_DIG_POWER_DEFAULT);
 	regmap_write(sgtl5000->regmap, SGTL5000_CHIP_ANA_POWER, SGTL5000_ANA_POWER_DEFAULT);
 
-- 
2.38.1

