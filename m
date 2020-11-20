Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E7E2BB032
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:24:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1420D171B;
	Fri, 20 Nov 2020 17:23:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1420D171B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605889482;
	bh=iiT953SPfN8VyA44unfiNSwE/7K2fqWVO8986O34OFE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rxG6PMQjBwe+qT3srxRo5OI9ILaaK6OfLIgmdwu2yadj1+V43CR91Wch9SrgzyeFS
	 dG7tV341jK8sowWERoO5iK489mGZgV6CNSynS3MZ+1B/4KWHQq63oX/OU9Zy9rjLLF
	 5fpzCegVzlRbwOCoYzgTeR3oJU38I1epaZnCsTDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFC8EF80533;
	Fri, 20 Nov 2020 17:18:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9685DF80536; Fri, 20 Nov 2020 17:18:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 007EEF80525
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:18:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 007EEF80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K9FIVYG9"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C58262240B;
 Fri, 20 Nov 2020 16:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889119;
 bh=iiT953SPfN8VyA44unfiNSwE/7K2fqWVO8986O34OFE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K9FIVYG95MUxggUa8XxW0HhorpQe7pDunWk90auWEo/lslkQZKXGoa/rR+Izm11og
 M62CZ6yHK7IClWOvTZZB3hBB6xfU/WOZKxVoLGB25wDPc1RI1dR1BhdfUBNtkELpCY
 KkTXJV43y2y7EaQE1kqTndDJl2MAur7uBxnKrQGU=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: [PATCH 15/38] ASoC: alc5632: skip of_device_id table when !CONFIG_OF
Date: Fri, 20 Nov 2020 17:16:29 +0100
Message-Id: <20201120161653.445521-15-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120161653.445521-1-krzk@kernel.org>
References: <20201120161653.445521-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
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

  sound/soc/codecs/alc5632.c:1170:34: warning: ‘alc5632_of_match’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/codecs/alc5632.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/alc5632.c b/sound/soc/codecs/alc5632.c
index 9d6dcd3ffa57..bde5ded67754 100644
--- a/sound/soc/codecs/alc5632.c
+++ b/sound/soc/codecs/alc5632.c
@@ -1167,11 +1167,13 @@ static const struct i2c_device_id alc5632_i2c_table[] = {
 };
 MODULE_DEVICE_TABLE(i2c, alc5632_i2c_table);
 
+#ifdef CONFIG_OF
 static const struct of_device_id alc5632_of_match[] = {
 	{ .compatible = "realtek,alc5632", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, alc5632_of_match);
+#endif
 
 /* i2c codec control layer */
 static struct i2c_driver alc5632_i2c_driver = {
-- 
2.25.1

