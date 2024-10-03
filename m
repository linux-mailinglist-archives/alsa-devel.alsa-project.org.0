Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0891798EF1D
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Oct 2024 14:21:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4D9286E;
	Thu,  3 Oct 2024 14:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4D9286E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727958091;
	bh=mXo/Y+0M6ZvpsQyuy5w66zUhARgNZ+kp7VwSuWRG4tE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UBCHhSTTRyStQQoaCKg5qrkIZcaqryK8sq4qTGjOBLHpt2QWWm7hFN+P6euWJN2Xu
	 CRofXrXRS3kwc0XRQVMJrh6TVgErVy/kqsI/2zhSaxrysb0llBJ9jTFiqhXXiadrrv
	 pNAiXG7sGNzK8d6hfPI/C2jr0aiHaqLd8LICMzys=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E69FF805B3; Thu,  3 Oct 2024 14:20:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63A8FF805A1;
	Thu,  3 Oct 2024 14:20:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B42DF80517; Thu,  3 Oct 2024 14:20:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 268A7F8001E
	for <alsa-devel@alsa-project.org>; Thu,  3 Oct 2024 14:20:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 268A7F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PPUl49i+
Received: by mail.gandi.net (Postfix) with ESMTPA id BAF6CFF806;
	Thu,  3 Oct 2024 12:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727958026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=raONT/HDAF820rUPmdb9npjFE1C+hNrjJMaVhiZEuHE=;
	b=PPUl49i+7NL/QVvzTkv5oQjcPgshOGCSDxQagvw3DTLFvBv82BV+k54uuDBe9nbRcNXo2d
	hisqysF1sOJjfB89Oc06laVvprUi+zQ79MssBxBh5mQ95tYjNmTXtSRI2LSGiwE2oDhkW/
	kdxFYqYpzmsONGgzRKnNrlR5ybMbODq+1SpX1BcnXyG3QXee8h7Gy39CnJei4w4rKCveu7
	B2ND3URuDcfprMIGXuInRg80a4qcyDX+lCy9a08x5h9ZpiMe4+s5xk6QFAE50luGV2nr91
	jIkuY4AWaqvKiAjfZjvQKYJY83t53WvcWSXZqpyzERxATdI67lRGvzX9s5IIcQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH] ASoC: fsl: fsl_qmc_audio: Remove the logging when parsing
 channels
Date: Thu,  3 Oct 2024 14:20:15 +0200
Message-ID: <20241003122015.677681-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: 63TUM5ZSXO25DZEQNQ5AMHQASKFWTYYD
X-Message-ID-Hash: 63TUM5ZSXO25DZEQNQ5AMHQASKFWTYYD
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/63TUM5ZSXO25DZEQNQ5AMHQASKFWTYYD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On each channel parsing, a log message is issued. This log message is
not needed and become annoying when many channels are used (up to 64
channel supported).

Simply remove this unneeded log message.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/fsl/fsl_qmc_audio.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 8668abd35208..e257b8adafe0 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -838,8 +838,6 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
 				qmc_dai->id, i, ret);
 			return ret;
 		}
-		dev_info(qmc_audio->dev, "dai %d QMC channel %d mode %d, nb_tx_ts %u, nb_rx_ts %u\n",
-			 qmc_dai->id, i, info.mode, info.nb_tx_ts, info.nb_rx_ts);
 
 		if (info.mode != QMC_TRANSPARENT) {
 			dev_err(qmc_audio->dev, "dai %d QMC chan %d mode %d is not QMC_TRANSPARENT\n",
-- 
2.46.1

