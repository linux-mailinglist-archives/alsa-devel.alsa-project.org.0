Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 396C97B6DB4
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 18:00:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 576C19F6;
	Tue,  3 Oct 2023 17:59:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 576C19F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696348800;
	bh=arWViVOFJ+xLCsEMqdnO3mqzkm5NiZn0WEmyp7nWPzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ACPeI0zxAcdd0HkmbgMuxMa6HtItPf6laLSnBzrZOsHJ2njI9fjVxqcjUL1JPJULz
	 hnNS2FSHDW/B+HiELi960seRs7osyfiDfcYVoap21wBk2Lp9phDOgigV2rNg5OmmCP
	 S/GqNBxhpbgUVWhIgemU+nCUp/Ym6+KSxTLtsq2Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E459F805A8; Tue,  3 Oct 2023 17:58:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5871F80588;
	Tue,  3 Oct 2023 17:58:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FC14F8055C; Tue,  3 Oct 2023 17:58:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 870E0F80557
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 17:58:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 870E0F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fdZAqcOy
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 30196612CE;
	Tue,  3 Oct 2023 15:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8803C433CD;
	Tue,  3 Oct 2023 15:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696348711;
	bh=arWViVOFJ+xLCsEMqdnO3mqzkm5NiZn0WEmyp7nWPzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fdZAqcOy0KP/1cr8Dv8F6l+6h8ksFQsBPP12k3onVO1ieCNudGaxOedU6ik3VEBBx
	 4Ckn4Wbd2Wdeq5/W9/Xp9Tmqaoqa5VJWlE4w8wWGO6fyvAuVl2u+xJsfIqT12CEILu
	 Ps94+ShHf2JoB1r3E5EiHJ2sOWZjLYt3VuWg1YX59PWJUnB7P1binntFq+AAyd49Fb
	 kXaqj2NFC1a+2/vrKRuJYYrn0cNz1OONGr8WiPnm8SXn5VtBg7WjlpAKUoPl3pfXSS
	 PUkFepwIa/Mtv9jdJql495Fp6Geab+hH4YkrxCSg4htN5oxw7wesRjeuOgoBfryR/s
	 wuewWIIxkdDGg==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qnhnG-00074t-0c;
	Tue, 03 Oct 2023 17:58:42 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 4/7] ASoC: codecs: wcd938x: fix regulator leaks on probe
 errors
Date: Tue,  3 Oct 2023 17:55:55 +0200
Message-ID: <20231003155558.27079-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231003155558.27079-1-johan+linaro@kernel.org>
References: <20231003155558.27079-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B2EAOAEEBME6XUR2Q5KULAZ26LDJUJKZ
X-Message-ID-Hash: B2EAOAEEBME6XUR2Q5KULAZ26LDJUJKZ
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Make sure to disable and free the regulators on probe errors and on
driver unbind.

Fixes: 16572522aece ("ASoC: codecs: wcd938x-sdw: add SoundWire driver")
Cc: stable@vger.kernel.org      # 5.14
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/codecs/wcd938x.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 7e0b07eeed77..679c627f7eaa 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3325,8 +3325,10 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 		return dev_err_probe(dev, ret, "Failed to get supplies\n");
 
 	ret = regulator_bulk_enable(WCD938X_MAX_SUPPLY, wcd938x->supplies);
-	if (ret)
+	if (ret) {
+		regulator_bulk_free(WCD938X_MAX_SUPPLY, wcd938x->supplies);
 		return dev_err_probe(dev, ret, "Failed to enable supplies\n");
+	}
 
 	wcd938x_dt_parse_micbias_info(dev, wcd938x);
 
@@ -3592,13 +3594,13 @@ static int wcd938x_probe(struct platform_device *pdev)
 
 	ret = wcd938x_add_slave_components(wcd938x, dev, &match);
 	if (ret)
-		return ret;
+		goto err_disable_regulators;
 
 	wcd938x_reset(wcd938x);
 
 	ret = component_master_add_with_match(dev, &wcd938x_comp_ops, match);
 	if (ret)
-		return ret;
+		goto err_disable_regulators;
 
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
@@ -3608,11 +3610,21 @@ static int wcd938x_probe(struct platform_device *pdev)
 	pm_runtime_idle(dev);
 
 	return 0;
+
+err_disable_regulators:
+	regulator_bulk_disable(WCD938X_MAX_SUPPLY, wcd938x->supplies);
+	regulator_bulk_free(WCD938X_MAX_SUPPLY, wcd938x->supplies);
+
+	return ret;
 }
 
 static void wcd938x_remove(struct platform_device *pdev)
 {
+	struct wcd938x_priv *wcd938x = dev_get_drvdata(&pdev->dev);
+
 	component_master_del(&pdev->dev, &wcd938x_comp_ops);
+	regulator_bulk_disable(WCD938X_MAX_SUPPLY, wcd938x->supplies);
+	regulator_bulk_free(WCD938X_MAX_SUPPLY, wcd938x->supplies);
 }
 
 #if defined(CONFIG_OF)
-- 
2.41.0

