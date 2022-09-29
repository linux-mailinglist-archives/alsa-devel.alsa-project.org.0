Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 562925EFEEC
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 22:56:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A59015E0;
	Thu, 29 Sep 2022 22:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A59015E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664484966;
	bh=u8vd513Z6iUQllRWnPPQC4Zl83VQH1gtqG8/V8QUGJY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Usuis8xMer1RbS/HhfCygoLZUusY5lEFtHp1hxWPzO+dKidKjo99tRmFNtg6qZAOa
	 nDhSzS4sNQoi15lYjMWnplu+zDNPate+IQPn8ZyJRwROQPH4Ci8i5GPsL5o426Qgeu
	 HqLqtXZIfZKgy7/k+L2vUvBg+V9eQefd5W8uzOyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABF4BF803DD;
	Thu, 29 Sep 2022 22:55:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E10DF8023A; Thu, 29 Sep 2022 22:55:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D93F7F800AA
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 22:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D93F7F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="I/90rkr6"
Received: from notapiano.myfiosgateway.com (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 022D566022C0;
 Thu, 29 Sep 2022 21:54:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664484899;
 bh=u8vd513Z6iUQllRWnPPQC4Zl83VQH1gtqG8/V8QUGJY=;
 h=From:To:Cc:Subject:Date:From;
 b=I/90rkr6oP3p4/r66yBm0/dLpFtqmvwZowTrJZa7HwvaxaDCOTd7hVQ6WN5moCpuG
 kSnOh59WkOk3oAzHztGOC7GkcU0OTbhRcLlor3GABI+J7TpimDAtBr13pqXkDgE3xe
 QRcnkGpWhOpbHYZjSPohsLAKI3I7VWkWYmpduoNX6z2FKlbYM8kLL/Ffr8jU39XnLl
 uoVmuvbBDymYkNUgDLMfrm3AbgLbiFSWl46yCPajy7LDNRMMzC1MJRlIWCPX1z9KlI
 A0DNr8d+0l9LIHQ2HDuJJlFvwh0oAmjdfeGqwSs3nZeH8BcemKMHQ5w6siipsFbF8R
 fNXFXrYqZFYrg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: mediatek: mt8192-mt6359: Set the driver name for the
 card
Date: Thu, 29 Sep 2022 16:54:53 -0400
Message-Id: <20220929205453.1144142-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Miaoqian Lin <linmq006@gmail.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>,
 linux-mediatek@lists.infradead.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The ASoC core automatically populates the driver name field in the card
from the card name if left unset. However, since the driver name can be
at most 16 characters long, wrapping will happen if the card name is
longer, which is the case for the mt8192-mt6359 driver.

Explicitly set the driver name for the card in order to avoid said
wrapping and have a readable driver name exposed to userspace.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---
Issue noticed while upstreaming the UCM file for this driver [1].

[1] https://github.com/alsa-project/alsa-ucm-conf/pull/217

 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index ff40ccd36f7e..b93c3237ef2d 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -24,6 +24,8 @@
 #include "mt8192-afe-clk.h"
 #include "mt8192-afe-gpio.h"
 
+#define DRIVER_NAME "mt8192_mt6359"
+
 #define RT1015_CODEC_DAI	"rt1015-aif"
 #define RT1015_DEV0_NAME	"rt1015.1-0028"
 #define RT1015_DEV1_NAME	"rt1015.1-0029"
@@ -1070,6 +1072,7 @@ static struct snd_soc_codec_conf rt1015_amp_conf[] = {
 
 static struct snd_soc_card mt8192_mt6359_rt1015_rt5682_card = {
 	.name = RT1015_RT5682_CARD_NAME,
+	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = mt8192_mt6359_dai_links,
 	.num_links = ARRAY_SIZE(mt8192_mt6359_dai_links),
@@ -1105,6 +1108,7 @@ static const struct snd_kcontrol_new mt8192_mt6359_rt1015p_rt5682x_controls[] =
 };
 
 static struct snd_soc_card mt8192_mt6359_rt1015p_rt5682x_card = {
+	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = mt8192_mt6359_dai_links,
 	.num_links = ARRAY_SIZE(mt8192_mt6359_dai_links),
@@ -1266,7 +1270,7 @@ static const struct dev_pm_ops mt8192_mt6359_pm_ops = {
 
 static struct platform_driver mt8192_mt6359_driver = {
 	.driver = {
-		.name = "mt8192_mt6359",
+		.name = DRIVER_NAME,
 #ifdef CONFIG_OF
 		.of_match_table = mt8192_mt6359_dt_match,
 #endif
-- 
2.37.3

