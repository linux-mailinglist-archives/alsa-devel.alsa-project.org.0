Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D006A1E9C
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 16:34:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FD89209;
	Fri, 24 Feb 2023 16:33:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FD89209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677252865;
	bh=DLUKSJNrsPAcdL+PKIKLcV3QCS/6NCtsQ2QEW0pm2cM=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vUPep2coR3JxSA63Tp7auHrXvw/VLr5TKb9NmXi+CJ+asSxz6hKg+/UZiJwuPqc2w
	 i/TCGhzhzGf5coYI/NNzLcTaqPSQRuq/05FBMae3t5fMMn4FHRUniA/2MT45u0F3AJ
	 /PsJXlFGsdhsfuNYyompnc5kghs9kPtOmaZc/giY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5949CF80125;
	Fri, 24 Feb 2023 16:33:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C94DF80125; Fri, 24 Feb 2023 16:33:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DEAE7F800DF
	for <alsa-devel@alsa-project.org>; Fri, 24 Feb 2023 16:33:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEAE7F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256
 header.s=mail header.b=kH/TERxB
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1677252795; bh=FNC6kTd6Z6n+zN6leJIOos4elgBgrZXAAOuIqFvhYUs=;
	h=From:To:Cc:Subject:Date;
	b=kH/TERxBETkz5SQRy/I6aJG4HrBNKpNvVhyYy2/SApa1r7qVGO8CKPOi0NtrKdgdK
	 qVcyGffZTorEc3HsQWZnLIZDqdFj8fluDyIPvtHzD+pK8ZtIxw45SPqFmKyuJEM5pn
	 R/chzDUc7u81R+uFsei6GAZT4kAD214iYUwJ8eRU=
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/3] ASoC: apple: mca: Fix final status read on SERDES reset
Date: Fri, 24 Feb 2023 16:33:00 +0100
Message-Id: <20230224153302.45365-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3HRI7IGR6RXDF4EH53CROCZF6FHP7P2X
X-Message-ID-Hash: 3HRI7IGR6RXDF4EH53CROCZF6FHP7P2X
X-MailFrom: povik+lin@cutebit.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: asahi@lists.linux.dev, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3HRI7IGR6RXDF4EH53CROCZF6FHP7P2X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>From within the early trigger we are doing a reset of the SERDES unit,
but the final status read is on a bad address. Add the missing SERDES
unit offset in calculation of the address.

Fixes: 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/apple/mca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 24381c42eb54..9cceeb259952 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -210,7 +210,7 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
 			   SERDES_CONF_SOME_RST);
 		readl_relaxed(cl->base + serdes_conf);
 		mca_modify(cl, serdes_conf, SERDES_STATUS_RST, 0);
-		WARN_ON(readl_relaxed(cl->base + REG_SERDES_STATUS) &
+		WARN_ON(readl_relaxed(cl->base + serdes_unit + REG_SERDES_STATUS) &
 			SERDES_STATUS_RST);
 		break;
 	default:
-- 
2.33.0

