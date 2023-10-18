Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC03C7CDED3
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 16:14:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1D20852;
	Wed, 18 Oct 2023 16:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1D20852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697638472;
	bh=lOJ9IO0p1IqYS9u1GlHfb86JxNofqQmR9iLuoYPMvwQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OeCeXSOukK65pUuNyhXW/Z7dHZR/md7ur/lGZnQ6M3Gju6Jst4Jb5LNkKXbdioJa1
	 ONMnYYF8VDdWOylIX9Igh4BCu80/zGae7v4a5+QnOMJEbXN5Yz1nr3PoJRkhC5tNHw
	 MAvwXqa6/S7jCs6J/0Pv+HvRvNObAa6eHMDtVIJ0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FE9FF805B5; Wed, 18 Oct 2023 16:12:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CCA3F805A8;
	Wed, 18 Oct 2023 16:12:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32FDDF80588; Wed, 18 Oct 2023 16:12:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F24CF80558
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 16:12:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F24CF80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jF93VGus
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 07C21B82393;
	Wed, 18 Oct 2023 14:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5BBC433C9;
	Wed, 18 Oct 2023 14:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697638333;
	bh=lOJ9IO0p1IqYS9u1GlHfb86JxNofqQmR9iLuoYPMvwQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jF93VGus9M9etw/f0MT9FpbnbBaNZbvuK3HKLU/2E6lV7sLENKrbeXSSsBRhDxhgN
	 9s9wGoQxgP+sw206mbNok9fxDYuzJVUaQwem0OduvXAW2FBih7Rmm6XzkIekhfwhTP
	 3fTOTWD2oNHxiywIMAt0TdH/rDggMljIO1NSMV/5BgHqOf5JPxyVyp+nhM/TLJ9i/i
	 zhOWo40wa8OKxp4ynxyPn3JrtgrGnPEZyyEhQqMS6JWVP9jMYZi2W94ulsohZACiNK
	 GYyfpCQY1GFBeCOnceP95C87UCVTqbPQZzd5j6b4wDaH7hFRU2ehGYECzasB1uYzwJ
	 ES9zhRoB8iFzg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.5 08/31] ASoC: core: Do not call link_exit() on
 uninitialized rtd objects
Date: Wed, 18 Oct 2023 10:11:25 -0400
Message-Id: <20231018141151.1334501-8-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231018141151.1334501-1-sashal@kernel.org>
References: <20231018141151.1334501-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.7
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Y63JEL7SFDTDXLW62NCRYHXXW3JXEBX6
X-Message-ID-Hash: Y63JEL7SFDTDXLW62NCRYHXXW3JXEBX6
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y63JEL7SFDTDXLW62NCRYHXXW3JXEBX6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

[ Upstream commit dd9f9cc1e6b9391140afa5cf27bb47c9e2a08d02 ]

On init we have sequence:

	for_each_card_prelinks(card, i, dai_link) {
		ret = snd_soc_add_pcm_runtime(card, dai_link);

	ret = init_some_other_things(...);
	if (ret)
		goto probe_end:

	for_each_card_rtds(card, rtd) {
		ret = soc_init_pcm_runtime(card, rtd);

probe_end:

while on exit:
	for_each_card_rtds(card, rtd)
		snd_soc_link_exit(rtd);

If init_some_other_things() step fails due to error we end up with
not fully setup rtds and try to call snd_soc_link_exit on them, which
depending on contents on .link_exit handler, can end up dereferencing
NULL pointer.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Link: https://lore.kernel.org/r/20230929103243.705433-2-amadeuszx.slawinski@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/sound/soc.h  |  2 ++
 sound/soc/soc-core.c | 20 +++++++++++++++-----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index b27f84580c5b0..cf34810882347 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1125,6 +1125,8 @@ struct snd_soc_pcm_runtime {
 	unsigned int pop_wait:1;
 	unsigned int fe_compr:1; /* for Dynamic PCM */
 
+	bool initialized;
+
 	int num_components;
 	struct snd_soc_component *components[]; /* CPU/Codec/Platform */
 };
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 1a0bde23f5e6f..2d85164457f73 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1259,7 +1259,7 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 	snd_soc_runtime_get_dai_fmt(rtd);
 	ret = snd_soc_runtime_set_dai_fmt(rtd, dai_link->dai_fmt);
 	if (ret)
-		return ret;
+		goto err;
 
 	/* add DPCM sysfs entries */
 	soc_dpcm_debugfs_add(rtd);
@@ -1284,17 +1284,26 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 	/* create compress_device if possible */
 	ret = snd_soc_dai_compress_new(cpu_dai, rtd, num);
 	if (ret != -ENOTSUPP)
-		return ret;
+		goto err;
 
 	/* create the pcm */
 	ret = soc_new_pcm(rtd, num);
 	if (ret < 0) {
 		dev_err(card->dev, "ASoC: can't create pcm %s :%d\n",
 			dai_link->stream_name, ret);
-		return ret;
+		goto err;
 	}
 
-	return snd_soc_pcm_dai_new(rtd);
+	ret = snd_soc_pcm_dai_new(rtd);
+	if (ret < 0)
+		goto err;
+
+	rtd->initialized = true;
+
+	return 0;
+err:
+	snd_soc_link_exit(rtd);
+	return ret;
 }
 
 static void soc_set_name_prefix(struct snd_soc_card *card,
@@ -1892,7 +1901,8 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 
 	/* release machine specific resources */
 	for_each_card_rtds(card, rtd)
-		snd_soc_link_exit(rtd);
+		if (rtd->initialized)
+			snd_soc_link_exit(rtd);
 	/* remove and free each DAI */
 	soc_remove_link_dais(card);
 	soc_remove_link_components(card);
-- 
2.40.1

