Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1632C68BE6E
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 14:38:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80B8A3E8;
	Mon,  6 Feb 2023 14:37:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80B8A3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675690712;
	bh=58mgZmtoAnTmawqz1P3qoDA7D1eNQvh5hQDBzMb4umQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=pdOkDBu1O76JTYRitwiM7rB4QngAoFn/VdCb21klH06biky1Gl0qQMOnUV9LtMCxG
	 yyyx68ol/UmB2XO/+XdpPiQQJGpGF/Y8vB/2S+E3LV2wttQLNTDjBT7v6YNIZOHG7o
	 ssqgU+yawcSWGQ1lg2jWaJOhgU4SrAAJNpwmMIL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75211F8057C;
	Mon,  6 Feb 2023 14:35:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70F0CF804C2; Sat,  4 Feb 2023 20:51:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2006F8001D
 for <alsa-devel@alsa-project.org>; Sat,  4 Feb 2023 20:51:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2006F8001D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=PhHrspTR
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
 by mta-01.yadro.com (Proxmox) with ESMTP id 69028341C06;
 Sat,  4 Feb 2023 22:51:35 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :from:from:message-id:mime-version:reply-to:subject:subject:to
 :to; s=mta-01; bh=2+nG6RMfoQCfKHPRhE4D9HP+L4iRTiLBoadle+nMbyo=; b=
 PhHrspTRfdOaLp4uP4cRCSYvziyhdMMyPYBxhL1GdgJrg3d3PA5AHWmTxrGAB5LN
 2SfHcA1YTof0GHW5S/mNIIGlIf3hraNfiHrRqxL+nN8GR8Gkx3aDXN361sCbTE9o
 grQJeb87P9Nq+n//ABFmrPLjjGaUjYV0gJCGVxkhFXM=
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Proxmox) with ESMTPS id 5AAA03418EC;
 Sat,  4 Feb 2023 22:51:35 +0300 (MSK)
Received: from nb-1688.corp.yadro.com (10.199.23.92) by
 T-EXCH-08.corp.yadro.com (172.17.11.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.9; Sat, 4 Feb 2023 22:51:34 +0300
From: Alexey Firago <a.firago@yadro.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: codecs: es8326: Fix DTS properties reading
Date: Sat, 4 Feb 2023 22:51:06 +0300
Message-ID: <20230204195106.46539-1-a.firago@yadro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.23.92]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
X-Mailman-Approved-At: Mon, 06 Feb 2023 14:35:03 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, zhuning0077@gmail.com,
 Alexey Firago <a.firago@yadro.com>, tiwai@suse.com, broonie@kernel.org,
 yangyingliang@huawei.com, yangxiaohua@everest-semi.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Seems like properties parsing and reading was copy-pasted,
so "everest,interrupt-src" and "everest,interrupt-clk" are saved into
the es8326->jack_pol variable. This might lead to wrong settings
being saved into the reg 57 (ES8326_HP_DET).

Fix this by using proper variables while reading properties.

Signed-off-by: Alexey Firago <a.firago@yadro.com>
---
 sound/soc/codecs/es8326.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 9ddf6a35e91c..28a0565c2a95 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -729,14 +729,16 @@ static int es8326_probe(struct snd_soc_component *component)
 	}
 	dev_dbg(component->dev, "jack-pol %x", es8326->jack_pol);
 
-	ret = device_property_read_u8(component->dev, "everest,interrupt-src", &es8326->jack_pol);
+	ret = device_property_read_u8(component->dev, "everest,interrupt-src",
+				      &es8326->interrupt_src);
 	if (ret != 0) {
 		dev_dbg(component->dev, "interrupt-src return %d", ret);
 		es8326->interrupt_src = ES8326_HP_DET_SRC_PIN9;
 	}
 	dev_dbg(component->dev, "interrupt-src %x", es8326->interrupt_src);
 
-	ret = device_property_read_u8(component->dev, "everest,interrupt-clk", &es8326->jack_pol);
+	ret = device_property_read_u8(component->dev, "everest,interrupt-clk",
+				      &es8326->interrupt_clk);
 	if (ret != 0) {
 		dev_dbg(component->dev, "interrupt-clk return %d", ret);
 		es8326->interrupt_clk = 0x45;
-- 
2.34.1


