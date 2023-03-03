Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B15A6A943C
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Mar 2023 10:36:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6317686F;
	Fri,  3 Mar 2023 10:35:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6317686F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677836159;
	bh=AQr/ikDouey2IdPhe7+J4WzxhgyJNLqvTg1LOCy8rTU=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bRchj2nm06de2L7xLMohQUrT8s2l87JrhUlbUdCb/OKAi5kkMh00GRl6RJ9/wRBHv
	 QggDSfLItnayuq/g0K84tHXiJmFEJJGlkd4ZFnddg59C7SIYOUz6ERAZOeREO0+D/D
	 tBWRDeBzGU3PkDUprbD+AjCsYh3sGHMf6BpZeZ8M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4A1DF8025A;
	Fri,  3 Mar 2023 10:35:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B017F80266; Fri,  3 Mar 2023 10:35:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C21FAF800BA
	for <alsa-devel@alsa-project.org>; Fri,  3 Mar 2023 10:34:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C21FAF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ajil5Dx2
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 44D71240002;
	Fri,  3 Mar 2023 09:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677836093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PPN/c3ipGWQR2bm5yNDVoKeti4qZhppCJONmVazuaCg=;
	b=Ajil5Dx2W9lyJXw8nlQ5udAC8XIZHc77lK2KbEGwbqJzeLdz+nnFA+hzJ9+zpOn2KKLkuR
	wVy9khYUqsWqyeDWJ+vmRRDqmoqBollU6q9HZaBFp+JXwFKyRy5fhBSM9LfUFsdIaspwDh
	ZcQT7QDVx+o/faXFKfcXcstlFVQJNGd1AeuCbVtBNd/MhGFWVK33z9j7zuyrYZdwvUnLNe
	KpprY5zxwRWJIOWWiTnJhauST0OJssoOk0huljVIO+OSRDG2vfDnDwuQEC7sxxLyvqKQfm
	FNZZT6UX6x/iOohN9+A9J5qKA40+vtPbXYHLRfCUsd5IoWg2nfcFMGR0zvJ0Yg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: clarify that SND_SOC_IMX_SGTL5000 is the old driver
Date: Fri,  3 Mar 2023 10:34:10 +0100
Message-Id: <20230303093410.357621-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AGFAXZAZW6C4PSCJIXMBVBOKYZMN6WZO
X-Message-ID-Hash: AGFAXZAZW6C4PSCJIXMBVBOKYZMN6WZO
X-MailFrom: luca.ceresoli@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Viorel Suman <viorel.suman@nxp.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AGFAXZAZW6C4PSCJIXMBVBOKYZMN6WZO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Both SND_SOC_IMX_SGTL5000 and SND_SOC_FSL_ASOC_CARD implement the
fsl,imx-audio-sgtl5000 compatible string, which is confusing. It took a
little research to find out that the latter is much newer and it is
supposed to be the preferred choice since several years.

Add a clarification note to avoid wasting time for future readers.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Viorel Suman <viorel.suman@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
---
 sound/soc/fsl/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 614eceda6b9e..33b67db8794e 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -294,6 +294,10 @@ config SND_SOC_IMX_SGTL5000
 	  Say Y if you want to add support for SoC audio on an i.MX board with
 	  a sgtl5000 codec.
 
+	  Note that this is an old driver. Consider enabling
+	  SND_SOC_FSL_ASOC_CARD and SND_SOC_SGTL5000 to use the newer
+	  driver.
+
 config SND_SOC_IMX_SPDIF
 	tristate "SoC Audio support for i.MX boards with S/PDIF"
 	select SND_SOC_IMX_PCM_DMA
-- 
2.34.1

