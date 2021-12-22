Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4178A47F5C7
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Dec 2021 09:20:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 810CC17A4;
	Sun, 26 Dec 2021 09:19:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 810CC17A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640506814;
	bh=KfJQQMdDxr26ojHcr4AuYBjfMuA67Kd209WPPCVC5dk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OEMcDM/p3T40u+NR7JMmvN5ruDss7ZZhIsb1c5tHpqhv67JGu3DH1+bu4D3jEuzgF
	 ZTcJYybZiMwK9p2e1SjEPNHb2YL6V7Cxposq/Pk+Uy9b4tLtp00BKmRmXrvUkRopap
	 w5wbEBK62MmI8nWWBtAshw9PHs4S0CpBRv9wNXhM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E46A5F80227;
	Sun, 26 Dec 2021 09:19:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B354F80111; Wed, 22 Dec 2021 15:17:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A669F800B5
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 15:17:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A669F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="qhF9RKJX"
Received: from localhost.localdomain (unknown
 [IPv6:2804:14c:485:504a:4709:e1da:a7a:6d6e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: festevam@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8F3D880F90;
 Wed, 22 Dec 2021 15:17:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1640182622;
 bh=XBKLSD9OEW4fASgxr249dHYUGNl4nXR2HQ3gTPE4hKM=;
 h=From:To:Cc:Subject:Date:From;
 b=qhF9RKJX/DTKLo0WdX19cvRHZrbeNQ/MsfXVFACa6mNVJH1KO2yKglCsfRE81hdsx
 w1583Lue9ovIEHUWNBFcUNVnzQQR9sZ9MIdO7m30k9cXplFQL5Isvqn12n93L52Hfn
 raaxKKBQ4FUWgzD6kM7rz+XCZpueag3GMqiTKUOEk2qId28WV1sKqkVtmWZyYr8N0B
 SQ/JLvhSxXAXkDDJLzqHjwCfv3ifNhUEg55slf0vUYLvC25C1dpcj4n60MePeBMjMy
 Lv8/fZ4Sju8qYe/QyoXG+vn2sXtG4un/akpRda2Yn/5wPJ/5mVBvNHIUeDjMJk+y9V
 DJ8Hmx0ugyJrg==
From: Fabio Estevam <festevam@denx.de>
To: broonie@kernel.org
Subject: [PATCH 1/2] ASoC: cs4265: Fix part number ID error message
Date: Wed, 22 Dec 2021 11:16:44 -0300
Message-Id: <20211222141645.1482267-1-festevam@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
X-Mailman-Approved-At: Sun, 26 Dec 2021 09:19:06 +0100
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@denx.de>,
 ckeepax@opensource.cirrus.com, Paul.Handrigan@cirrus.com,
 james.schulman@cirrus.com
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

The Chip ID - Register 01h contains the following description
as per the CS4265 datasheet:

"Bits 7 through 4 are the part number ID, which is 1101b (0Dh)"

The current error message is incorrect as it prints CS4265_CHIP_ID,
which is the register number, instead of printing the expected
part number ID value.

To make it clearer, also do a shift by 4, so that the error message
would become:

[    4.218083] cs4265 1-004f: CS4265 Part Number ID: 0x0 Expected: 0xd

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 sound/soc/codecs/cs4265.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
index cffd6111afac..b89002189a2b 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -611,8 +611,8 @@ static int cs4265_i2c_probe(struct i2c_client *i2c_client,
 	if (devid != CS4265_CHIP_ID_VAL) {
 		ret = -ENODEV;
 		dev_err(&i2c_client->dev,
-			"CS4265 Device ID (%X). Expected %X\n",
-			devid, CS4265_CHIP_ID);
+			"CS4265 Part Number ID: 0x%x Expected: 0x%x\n",
+			devid >> 4, CS4265_CHIP_ID_VAL >> 4);
 		return ret;
 	}
 	dev_info(&i2c_client->dev,
-- 
2.25.1

