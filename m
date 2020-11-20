Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8882BB086
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:29:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9A121712;
	Fri, 20 Nov 2020 17:28:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9A121712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605889741;
	bh=JZdCvslmdZjGvWjDcbc1iXckf5mLTjz/4L3axX6TOLs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=muyuPlf/qCz69xkVr93eyvecJ8SUG4Zp7bm8y3X2tGVUX+H7RRrBVeLAZ1YwagXUq
	 2Fh7vRWzlvFW1mmvzqqoZeXm7vCUFj6WRxybYrViTKlsveXqMDhyl/I3dCKLJ9x1jp
	 nbMQcnnTTtU/Uxpms+0CneQvJn3YQw/VmCjYenQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E593F805AB;
	Fri, 20 Nov 2020 17:19:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F27EDF805AB; Fri, 20 Nov 2020 17:19:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93448F8057C
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:19:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93448F8057C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZgCd1/fw"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 41B1322269;
 Fri, 20 Nov 2020 16:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889156;
 bh=JZdCvslmdZjGvWjDcbc1iXckf5mLTjz/4L3axX6TOLs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZgCd1/fwhghbockXSnxLa+zrQpyJCe0NL7XOPefjlSdZ3oiS4al7SJjDlnM2X/lQW
 78EMDCuzcvf07/em8HzUoSyC6AhU/0Apksvl3ER3ThqRbBkcTeWKVRxRHraRMK3gIl
 1tteWt04jG1wMT4LXZx9xDd1OnsUZE7PlOa7JL6k=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: [PATCH 26/38] ASoC: pcm1789: skip of_device_id table when !CONFIG_OF
Date: Fri, 20 Nov 2020 17:16:40 +0100
Message-Id: <20201120161653.445521-26-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120161653.445521-1-krzk@kernel.org>
References: <20201120161653.445521-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
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

The driver can match by multiple methods.  Its of_device_id table is
referenced via of_match_ptr() so it will be unused for !CONFIG_OF
builds:

  sound/soc/codecs/pcm1789-i2c.c:36:34: warning: ‘pcm1789_of_match’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/codecs/pcm1789-i2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/pcm1789-i2c.c b/sound/soc/codecs/pcm1789-i2c.c
index 327ec584f240..7a6be45f8149 100644
--- a/sound/soc/codecs/pcm1789-i2c.c
+++ b/sound/soc/codecs/pcm1789-i2c.c
@@ -33,11 +33,13 @@ static int pcm1789_i2c_remove(struct i2c_client *client)
 	return pcm1789_common_exit(&client->dev);
 }
 
+#ifdef CONFIG_OF
 static const struct of_device_id pcm1789_of_match[] = {
 	{ .compatible = "ti,pcm1789", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm1789_of_match);
+#endif
 
 static const struct i2c_device_id pcm1789_i2c_ids[] = {
 	{ "pcm1789", 0 },
-- 
2.25.1

