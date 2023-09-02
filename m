Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 416E47909B8
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Sep 2023 23:09:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6090827;
	Sat,  2 Sep 2023 23:08:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6090827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693688960;
	bh=ZFbrDlGsG1v2EjUCV6bCyGa1RigZq4UWK6ZhGbIVmVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pOlq3V0iTB6NqVyoyWUYeTkNAKHUomFHSSx45Ry7QOqlXSyq6FhT7DX+0DA1n33rG
	 mSo5PxlkfMZl4rKeJnKXWwNsJHIVhRaXaT6eRug1tSoJF09nioenMtVbDVPpOngG/w
	 NcmJELXYjz1ivYAOaieGFIOsPvCneVirxLXkaJVM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDCF7F80564; Sat,  2 Sep 2023 23:08:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58F2CF8057A;
	Sat,  2 Sep 2023 23:08:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A9FAF80527; Sat,  2 Sep 2023 23:06:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D547F8025F
	for <alsa-devel@alsa-project.org>; Sat,  2 Sep 2023 23:06:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D547F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=VOU3U94m
Received: from localhost (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DF10866072B5;
	Sat,  2 Sep 2023 22:06:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693688801;
	bh=ZFbrDlGsG1v2EjUCV6bCyGa1RigZq4UWK6ZhGbIVmVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VOU3U94md0KKyLr5WS0958ZrkDv99MLMNEw9B/4NusRC+u6XlZoqvf09dEyMVKyiE
	 77lY+xH6013b5Hy0fgcscC8DnauGlw5D4yIgIuY/HHH3h4sCg8aqJjQlGPaaB0A8tK
	 7WVPWkQAipbRYOrVBzm8xrVkg8iJIqjrI7HevXUwEaYrzfWtysorJgCSvnsV9TnjfV
	 Tv9hif395vEJy9k3OsPHVA/WeTfj1m6ejgxu21PjInTPFPqcq38p4TDaZEo23ke2fO
	 VmA6hxKSEXmy012ZqepADt3dbECOC0s9AMD/T/jmOUD0EiLC/CtohvPcFJG9YkWzyn
	 dvhvGRrIoTgng==
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
Subject: [PATCH 5/9] ASoC: cs35l41: Rename pll_lock to pll_lock_done
Date: Sun,  3 Sep 2023 00:06:17 +0300
Message-ID: <20230902210621.1184693-6-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230902210621.1184693-1-cristian.ciocaltea@collabora.com>
References: <20230902210621.1184693-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IB3GNXI4CKFYVGVNHWBMZN4UHYEB5YWV
X-Message-ID-Hash: IB3GNXI4CKFYVGVNHWBMZN4UHYEB5YWV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IB3GNXI4CKFYVGVNHWBMZN4UHYEB5YWV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use a more intuitive name for 'pll_lock' completion, which helps
improving code readability a bit.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/codecs/cs35l41.c | 8 ++++----
 sound/soc/codecs/cs35l41.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 9bf70da03972..e143b0e306b1 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -459,7 +459,7 @@ static irqreturn_t cs35l41_irq(int irq, void *data)
 
 	if (status[2] & CS35L41_PLL_LOCK) {
 		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS3, CS35L41_PLL_LOCK);
-		complete(&cs35l41->pll_lock);
+		complete(&cs35l41->pll_lock_done);
 		ret = IRQ_HANDLED;
 	}
 
@@ -804,7 +804,7 @@ static int cs35l41_pcm_startup(struct snd_pcm_substream *substream,
 {
 	struct cs35l41_private *cs35l41 = snd_soc_component_get_drvdata(dai->component);
 
-	reinit_completion(&cs35l41->pll_lock);
+	reinit_completion(&cs35l41->pll_lock_done);
 
 	if (substream->runtime)
 		return snd_pcm_hw_constraint_list(substream->runtime, 0,
@@ -1160,7 +1160,7 @@ static void cs35l41_mdsync_up_work(struct work_struct *work)
 	struct cs35l41_private *cs35l41 = container_of(work,
 						       struct cs35l41_private,
 						       mdsync_up_work);
-	int ret = wait_for_completion_timeout(&cs35l41->pll_lock,
+	int ret = wait_for_completion_timeout(&cs35l41->pll_lock_done,
 					      msecs_to_jiffies(100));
 	if (ret == 0) {
 		dev_err(cs35l41->dev, "Timed out waiting for pll_lock signal\n");
@@ -1303,7 +1303,7 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
 		regmap_update_bits(cs35l41->regmap, CS35L41_IRQ1_MASK3, CS35L41_INT3_PLL_LOCK_MASK,
 				   0 << CS35L41_INT3_PLL_LOCK_SHIFT);
 
-	init_completion(&cs35l41->pll_lock);
+	init_completion(&cs35l41->pll_lock_done);
 
 	ret = devm_request_threaded_irq(cs35l41->dev, cs35l41->irq, NULL, cs35l41_irq,
 					IRQF_ONESHOT | IRQF_SHARED | irq_pol,
diff --git a/sound/soc/codecs/cs35l41.h b/sound/soc/codecs/cs35l41.h
index f9f85796a13a..fe61c11404e7 100644
--- a/sound/soc/codecs/cs35l41.h
+++ b/sound/soc/codecs/cs35l41.h
@@ -34,7 +34,7 @@ struct cs35l41_private {
 	int irq;
 	/* GPIO for /RST */
 	struct gpio_desc *reset_gpio;
-	struct completion pll_lock;
+	struct completion pll_lock_done;
 	struct work_struct mdsync_up_work;
 };
 
-- 
2.41.0

