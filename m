Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D11F257D75F
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 01:34:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE18D1843;
	Fri, 22 Jul 2022 01:33:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE18D1843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658446457;
	bh=oo2+O9BB8Qmzpv1tcToj+qItiPJ98pNfn+AXvTBYbfU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XPlH1FDYmLJZr+3Waw6WTd/XBlogns5cWg5Rma7myz4BL0+cF1+Y/meX8SLWzrXgZ
	 zcLgt7vxB0L92ov9ryXjQ8+HKiCZKcinXj5cME8SwXlr36/WeKYy/PbwaWjtcP3DQX
	 E6K1Bl/XDz5NO2kvY6kxySP5C6elxex/amJSCE78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED66AF80256;
	Fri, 22 Jul 2022 01:33:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFE3CF8016D; Fri, 22 Jul 2022 01:33:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00DB8F800BA
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 01:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00DB8F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="aEJOje+U"
Received: from localhost (unknown [188.24.146.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BE2FF6601AB4;
 Fri, 22 Jul 2022 00:33:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658446384;
 bh=oo2+O9BB8Qmzpv1tcToj+qItiPJ98pNfn+AXvTBYbfU=;
 h=From:To:Cc:Subject:Date:From;
 b=aEJOje+UkZlurTkF8NLKuv8m34YKwNmSxY38UiwaCKt0+vzcMQYvL0q6ujuKKrO0h
 pQq7u7y6bd6TQwkyIQClE2ys8fwWdd2q7jzeR/sPU1/0wf03bTCbKybmtu/DWQSv+i
 tuZFFxEWbo0iTa9Ed7hjF33iC1roqZy6BLN9Zm569eEQ/daf1MdX0bu77tYrkIx/tF
 EDMA5H2qQ04DmdMEPRzG32BD82XjvZdLtCQRjJylZLISC+diGcM35U3AyWv8EiLGLD
 9bucarg5pEOdqrkThvtH6Kb1ooTJ8qqy64rr4BKs+h3S7QC1VH7kKju9p/CUgiRlZf
 WUF+LlEq/mBZw==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH] ASoC: amd: vangogh: Use non-legacy DAI naming for cs35l41
Date: Fri, 22 Jul 2022 02:32:27 +0300
Message-Id: <20220721233227.1459374-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
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

Unlike most CODEC drivers, the CS35L41 driver did not have the
non_legacy_dai_naming set, meaning the corresponding DAI has been
traditionally registered using the legacy naming: spi-VLV1776:0x

The recent migration to the new legacy DAI naming style has implicitly
corrected that behavior and DAI gets now registered via the non-legacy
naming, i.e. cs35l41-pcm.

The problem is the acp5x platform driver is now broken as it continues
to refer to the above mentioned codec using the legacy DAI naming in
function acp5x_cs35l41_hw_params() and, therefore, the related setup
is not being executed anymore.

Let's fix that by replacing the obsolete DAI name with the correct one.

Fixes: bc949a3b4af3 ("ASoC: core: Switch core to new DAI naming flag")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 727de46860b1..af3737ef9707 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -178,8 +178,7 @@ static int acp5x_cs35l41_hw_params(struct snd_pcm_substream *substream,
 	ret = 0;
 	for (i = 0; i < num_codecs; i++) {
 		codec_dai = asoc_rtd_to_codec(rtd, i);
-		if ((strcmp(codec_dai->name, "spi-VLV1776:00") == 0) ||
-		    (strcmp(codec_dai->name, "spi-VLV1776:01") == 0)) {
+		if (strcmp(codec_dai->name, "cs35l41-pcm") == 0) {
 			switch (params_rate(params)) {
 			case 48000:
 				bclk_val = 1536000;
-- 
2.37.1

