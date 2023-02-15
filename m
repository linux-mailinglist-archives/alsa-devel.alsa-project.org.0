Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D880E698631
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 21:48:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74A70DFA;
	Wed, 15 Feb 2023 21:47:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74A70DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676494101;
	bh=yopj1Ok402VLqO03d/DGnckaXgp6bdvXmnEXhDwCoZk=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A42SMgqBwHXp/cgGwEb29+ITa/OhjGz6IkyG0egYVvHENe3Kp9PfUA7az6n0jsQ2c
	 zy1VSP+TqVjFpjW/8WtS0UeCMQcl85txtUdD5vh7rN4bJoFLJ8kzQOD5Ih06cQvULr
	 bvbynohRw53s7Dj/i+GY9GowBbaZ0IPQuQWZbbSI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E143F8053B;
	Wed, 15 Feb 2023 21:46:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D0EBF8053D; Wed, 15 Feb 2023 21:46:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0254CF80527
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 21:46:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0254CF80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YTYIjoIr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id B79B9CE250D;
	Wed, 15 Feb 2023 20:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68F8C4339B;
	Wed, 15 Feb 2023 20:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676493989;
	bh=yopj1Ok402VLqO03d/DGnckaXgp6bdvXmnEXhDwCoZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YTYIjoIrgsRA7KMccYgbB0asWKaRTdSszOuNEUFEvriXlkHb+lVywPDMMn78PwEgd
	 WGXm8md8p6sLtNkAZ+miTojwtLnrdtlE5a35hc7S9/dTZWqh04MPcKOYETo75ncviH
	 ELvL2P4X9GXPctiO+1R85SOXUo/fuzTTTVt6w48JSg+Q7Ik4LJ0OAFVP2FFCLNAv2o
	 N3y2iphHAiqXKl1OjQY1DF1TgiuKk/OaB7ov5ao5Dlg0Ts50jO/gXSm80aIjsL1HpC
	 tYAWX6qSplzkleSpg1UGJeb1v5mbD3zt8XIQNyzcqt3tSFW55M/w7t7PFWi9QmhN26
	 VUez340LvpAJQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 20/24] ASoC: codecs: es8326: Fix DTS properties
 reading
Date: Wed, 15 Feb 2023 15:45:43 -0500
Message-Id: <20230215204547.2760761-20-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230215204547.2760761-1-sashal@kernel.org>
References: <20230215204547.2760761-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U7CBHOUB72VXOYA34ZNXC6DG7SXFF2XR
X-Message-ID-Hash: U7CBHOUB72VXOYA34ZNXC6DG7SXFF2XR
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Alexey Firago <a.firago@yadro.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lgirdwood@gmail.com, tiwai@suse.com,
 yangyingliang@huawei.com, yangxiaohua@everest-semi.com,
 zhuning0077@gmail.com, u.kleine-koenig@pengutronix.de,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U7CBHOUB72VXOYA34ZNXC6DG7SXFF2XR/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Alexey Firago <a.firago@yadro.com>

[ Upstream commit fe1e7e8ce2c47bd8fd9885eab63fca0a522e94c9 ]

Seems like properties parsing and reading was copy-pasted,
so "everest,interrupt-src" and "everest,interrupt-clk" are saved into
the es8326->jack_pol variable. This might lead to wrong settings
being saved into the reg 57 (ES8326_HP_DET).

Fix this by using proper variables while reading properties.

Signed-off-by: Alexey Firago <a.firago@yadro.com>
Reviewed-by: Yang Yingliang <yangyingliang@huawei.com
Link: https://lore.kernel.org/r/20230204195106.46539-1-a.firago@yadro.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/es8326.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 87c1cc16592bb..555125efd9ad3 100644
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
2.39.0

