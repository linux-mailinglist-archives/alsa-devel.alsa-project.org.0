Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1E02BB030
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:24:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E9C416E9;
	Fri, 20 Nov 2020 17:23:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E9C416E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605889440;
	bh=0HugLJZa8zS4Le6aM6WdEG5ldLVgwL6aMNqW9XESAyY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TzdDoL1rngJbZFQUgFoIiRolR6AFbqKmZoDIAwzHkUC10McS/qEoJ9IdU4HL1O/yu
	 HRS13Ta4kBWYS5dSpg10ERryxuZCVLjBRUn/0RlLivlTXaLCTNSeXvxj1GqWnmgT3y
	 Zh2LACIqr3wNXhpYYNTGj6fNt+gHmpXVujwQCBRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A748F80527;
	Fri, 20 Nov 2020 17:18:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F12C2F80526; Fri, 20 Nov 2020 17:18:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 619B6F80520
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:18:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 619B6F80520
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V4WsHIiq"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 66315223FD;
 Fri, 20 Nov 2020 16:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889111;
 bh=0HugLJZa8zS4Le6aM6WdEG5ldLVgwL6aMNqW9XESAyY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V4WsHIiqUTGnjcpfkaCLf2SIVQPqJCkTuJcVG9dBcikacJujLkakkWoWFU8LKB0YJ
 kCiZFWoSSlT34pjSDM2iENswJzkt+hZuegWwUHREkcbqYKpBd7E6OY3qNhRoK7LXmL
 WiSxJklRnv+aTiMxJnmMtnVFonJDqm6G2dIF+NwI=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: [PATCH 13/38] ASoC: ak4118: skip of_device_id table when !CONFIG_OF
Date: Fri, 20 Nov 2020 17:16:27 +0100
Message-Id: <20201120161653.445521-13-krzk@kernel.org>
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

  sound/soc/codecs/ak4118.c:407:34: warning: ‘ak4118_of_match’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/codecs/ak4118.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/ak4118.c b/sound/soc/codecs/ak4118.c
index f44d9a4a8507..5d46ae85566c 100644
--- a/sound/soc/codecs/ak4118.c
+++ b/sound/soc/codecs/ak4118.c
@@ -404,11 +404,13 @@ static int ak4118_i2c_probe(struct i2c_client *i2c,
 				&soc_component_drv_ak4118, &ak4118_dai, 1);
 }
 
+#ifdef CONFIG_OF
 static const struct of_device_id ak4118_of_match[] = {
 	{ .compatible = "asahi-kasei,ak4118", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, ak4118_of_match);
+#endif
 
 static const struct i2c_device_id ak4118_id_table[] = {
 	{ "ak4118", 0 },
-- 
2.25.1

