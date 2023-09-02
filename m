Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 763937909BB
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Sep 2023 23:10:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FCE5DF0;
	Sat,  2 Sep 2023 23:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FCE5DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693689011;
	bh=G+WVbRYmwmOF6B5vQfe9gXWVIMHqOGdNIKeuQZ/LSsQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kceAgfOfmhdd1KaeGnjyN+GZu7tfazFFlujMqcojcnlRPkMr0uuDwFUzBgkrBea1C
	 Vva5KHCW5gpbIPpKGfiXVRMIWd6kHB+XsEKwlSZhwwNUiTOjWZ4bQGZu3ZNsYM7CxP
	 QCsg78xaNc0Ped7VE2BPZTkWTTt4nlb39ztyd+Aw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E500EF805B2; Sat,  2 Sep 2023 23:08:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ADBBF805B2;
	Sat,  2 Sep 2023 23:08:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83341F80527; Sat,  2 Sep 2023 23:06:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E311F8032D
	for <alsa-devel@alsa-project.org>; Sat,  2 Sep 2023 23:06:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E311F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=jQ/ossJI
Received: from localhost (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1BBAC66072B6;
	Sat,  2 Sep 2023 22:06:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693688813;
	bh=G+WVbRYmwmOF6B5vQfe9gXWVIMHqOGdNIKeuQZ/LSsQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jQ/ossJIPvU1/N8/hhVkj5SHf3GIFg3ann4S2qkCW5qI0OOBPItps/dGZ3GDWF27o
	 K/qWgTSNAXflOjOM4iyCoyjIQzJSxYEu7PD8X3qjcs9mwruwTXDMoNOYW7jmsUtdXd
	 OC7u8PlXxodjIV4NS2jQROy7CuS+Y87fXVOEJfYWuba06I/FpUhZGPRT2r1sECj3Z1
	 9dQw90HkJctdngMemAR49YWNq456EyXiMbI4Gcy0quEUENoOM3ASDBGTvtx/yPUXx8
	 FgXBaiE8owr5B6JwEI5TRHf1VyA3Y+rLyFE5G4XjaEJs6yGjksq4vW4j3JbJfns4D2
	 teeOW9W00VSTg==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 9/9] ASoC: cs35l41: Use devm_pm_runtime_enable()
Date: Sun,  3 Sep 2023 00:06:21 +0300
Message-ID: <20230902210621.1184693-10-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230902210621.1184693-1-cristian.ciocaltea@collabora.com>
References: <20230902210621.1184693-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZMDAFYBV5SGSKFENC6WCVKQMNIQSBDPF
X-Message-ID-Hash: ZMDAFYBV5SGSKFENC6WCVKQMNIQSBDPF
X-MailFrom: cristian.ciocaltea@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZMDAFYBV5SGSKFENC6WCVKQMNIQSBDPF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Simplify runtime PM during probe by converting pm_runtime_enable() to
the managed version.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/codecs/cs35l41.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 5655758063ae..2e5b4633e98d 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1340,7 +1340,12 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
 	pm_runtime_mark_last_busy(cs35l41->dev);
 	pm_runtime_set_active(cs35l41->dev);
 	pm_runtime_get_noresume(cs35l41->dev);
-	pm_runtime_enable(cs35l41->dev);
+
+	ret = devm_pm_runtime_enable(cs35l41->dev);
+	if (ret < 0) {
+		dev_err_probe(cs35l41->dev, ret, "Failed to enable PM runtime\n");
+		goto err_pm;
+	}
 
 	ret = devm_snd_soc_register_component(cs35l41->dev,
 					      &soc_component_dev_cs35l41,
@@ -1358,9 +1363,7 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
 	return 0;
 
 err_pm:
-	pm_runtime_disable(cs35l41->dev);
 	pm_runtime_put_noidle(cs35l41->dev);
-
 	wm_adsp2_remove(&cs35l41->dsp);
 err:
 	cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type);
@@ -1376,7 +1379,6 @@ void cs35l41_remove(struct cs35l41_private *cs35l41)
 	cancel_work_sync(&cs35l41->mdsync_up_work);
 
 	pm_runtime_get_sync(cs35l41->dev);
-	pm_runtime_disable(cs35l41->dev);
 
 	regmap_write(cs35l41->regmap, CS35L41_IRQ1_MASK1, 0xFFFFFFFF);
 	if (cs35l41->hw_cfg.bst_type == CS35L41_SHD_BOOST_PASS ||
-- 
2.41.0

