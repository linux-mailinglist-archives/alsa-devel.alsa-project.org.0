Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA687486A2
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 16:43:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1197E84B;
	Wed,  5 Jul 2023 16:42:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1197E84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688568206;
	bh=f6yTboHdDxAlYnmIQ62ZL53MjCiOLY54svw8nFvYa9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AM1b3bcXYdBzqvPDL49nKgjlixYzoclK2kXISSNIxmUStc8hDnJm45yUW3vAf/wU1
	 JYX6R75fFUf8FgdNRu6+XqPeKG5e0EIY+nAJxk4HiWkYWjALnIgfmQgeI3b5nnxYuJ
	 m8AAJwKGqwHh2NwbSOS9yGumfyHe5e+98gqZaSsk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B385F80544; Wed,  5 Jul 2023 16:41:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88F08F80549;
	Wed,  5 Jul 2023 16:41:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB181F80552; Wed,  5 Jul 2023 14:33:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9365EF80535
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 14:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9365EF80535
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hftrEYWe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DCED661584;
	Wed,  5 Jul 2023 12:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6BCBC61180;
	Wed,  5 Jul 2023 12:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688560389;
	bh=f6yTboHdDxAlYnmIQ62ZL53MjCiOLY54svw8nFvYa9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hftrEYWeSMZIfjIEg07Y6+0dHdPyzdBS2xzN7RS9Wr85NheRLLfBNEceT3aMvGVC7
	 7VsXgQaoUle+/v3YCEBGdUlVAHb1nDUrxnWSIFIHT+WckFCaTA3mpAxEWWyoFHXtHS
	 wYStwMUAypCluPlvQ32frttjV0TOja268wd5fu3gQ+TaOxcx1GcM1V2ZhUhftvZGg6
	 YWtyZTjk1WzZcGbi1T7j5oI4XFvEpD46APG79mSiGT0jS+32s8Fda4Wn2F0sWRN+PT
	 n2ZNotMGM+AOKg29dMtZmMAGl995QUpxi5HTIo3PF6aqOunw3Il7yMPKcLhDPa5BMF
	 F00koUNwRkvEA==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qH1hK-00084Q-2K;
	Wed, 05 Jul 2023 14:33:30 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 8/8] ASoC: core: suppress probe deferral errors
Date: Wed,  5 Jul 2023 14:30:18 +0200
Message-Id: <20230705123018.30903-9-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230705123018.30903-1-johan+linaro@kernel.org>
References: <20230705123018.30903-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 32PYKRAYL5IOM3T4CYQALSPFUPKAMGO4
X-Message-ID-Hash: 32PYKRAYL5IOM3T4CYQALSPFUPKAMGO4
X-Mailman-Approved-At: Wed, 05 Jul 2023 14:41:37 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/32PYKRAYL5IOM3T4CYQALSPFUPKAMGO4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Suppress probe deferral error messages when probing link components to
avoid spamming the logs, for example, if a required component has not
yet been registered:

	snd-sc8280xp sound: ASoC: failed to instantiate card -517

Note that dev_err_probe() is not used as the card can be unbound and
rebound while the underlying platform device remains bound to its
driver.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/soc-core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b48efc3a08d2..b9cb5c4e3685 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1988,8 +1988,10 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	/* probe all components used by DAI links on this card */
 	ret = soc_probe_link_components(card);
 	if (ret < 0) {
-		dev_err(card->dev,
-			"ASoC: failed to instantiate card %d\n", ret);
+		if (ret != -EPROBE_DEFER) {
+			dev_err(card->dev,
+				"ASoC: failed to instantiate card %d\n", ret);
+		}
 		goto probe_end;
 	}
 
-- 
2.39.3

