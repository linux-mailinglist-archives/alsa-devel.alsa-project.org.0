Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C8B4C0572
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 00:43:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F40571843;
	Wed, 23 Feb 2022 00:42:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F40571843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645573388;
	bh=F15XP7CFp7dDl7I3vTiMJ5jCE5AW2UbeE6cgDLKz2Pw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sjiVEdDK+/i1GV4GT/DjQLTr38IjXYIS7ljGhxJc+5RRAql0PaO8Eir+l1NSoeh5O
	 RV7bBbkOsS8cpbdyn29Dlp1/av+tr94lq/muMnVtCR9CkI7+EwYpeBlmmYqrosD93i
	 Iq8BLY81IFJFxAJU1N9RWawtyYn3O6h2l5Z8mrt8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 672AEF80519;
	Wed, 23 Feb 2022 00:40:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1826F800F5; Wed, 23 Feb 2022 00:40:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E539F800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 00:40:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E539F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XYMF4aWo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 84701B81D63;
 Tue, 22 Feb 2022 23:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A68FC340F0;
 Tue, 22 Feb 2022 23:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645573238;
 bh=F15XP7CFp7dDl7I3vTiMJ5jCE5AW2UbeE6cgDLKz2Pw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XYMF4aWoRz0igRCDoQLOM9+zkQUFjulE9+leL88ys+TRYsCr5ezCasbYsIY/8zvxY
 eCqu21rfa4eMsWIWpUJM92LRqiu6ObFQOFpDtCDVY9Kewk44KjXlpmsEzVQWZ8QM6D
 4WICeUZkiKwFmShF/Z/3u+KNjPFc4Oe0lmGxCcVCL0rxFyMjTz5eW8c1M5jjVI+VXo
 lkjY1AZfoAnB4gOyFoLh4zE37skWXSdrmBJFvLf/mSyCkhlvA3Rxvyvn73R7nsN8Bt
 jOz0Nn+BCtR+fCIExpJE9ODGZ3A2UbgahXdknJXWLmCWMw1gZ080ib+bpv9NjyD1Zm
 Z2qPkAfmy8L5g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 05/10] ASoC: max9850: Use modern ASoC DAI format terminology
Date: Tue, 22 Feb 2022 23:40:21 +0000
Message-Id: <20220222234026.712070-5-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222234026.712070-1-broonie@kernel.org>
References: <20220222234026.712070-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1066; h=from:subject;
 bh=F15XP7CFp7dDl7I3vTiMJ5jCE5AW2UbeE6cgDLKz2Pw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFXQozkG49wUmPcw5jU6ouTgcomKzQkEbUUAP0P8B
 oNaU39mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhV0KAAKCRAk1otyXVSH0OFLB/
 4xJcYpRD5l+IZWnWBHdVocOG+MtKQ484pr1B439FMX2AGiuZ6EACvBdRj4idKXrpWMgw1wErzjP0Ef
 WlfpqicsM6Md8+PQPXFaaGSxgRJSBxKZ27qoZpLv9+JXU8ar0nAGBxek6TZtH4yXEcqOhE6pNYmsfb
 6EM9al1ABYbaS9KtHjUwGOe/IHLExroO3OcrqPYbi2dRJ4FzcBkeQlI6llO9q0ieSpTMnMk+1xdn6K
 ef/CotXVW20bu/g2AckAnofjvZAqeIApg8TABM7/zRuOrUZ4Go74M/kA2m4HBCsbjwaviOV74V6hSg
 JDeGaEA3AMcO/cKofGJKRmFzKbswP/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Peter Rosin <peda@axentia.se>
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

As part of moving to remove the old style defines for the bus clocks update
the max9850 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max9850.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max9850.c b/sound/soc/codecs/max9850.c
index dec51893af74..e073f0e029be 100644
--- a/sound/soc/codecs/max9850.c
+++ b/sound/soc/codecs/max9850.c
@@ -173,12 +173,12 @@ static int max9850_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	struct snd_soc_component *component = codec_dai->component;
 	u8 da = 0;
 
-	/* set master/slave audio interface */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	/* set clock provider for audio interface */
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		da |= MAX9850_MASTER;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.30.2

