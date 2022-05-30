Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 754A9537E22
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:51:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6DEE1F6A;
	Mon, 30 May 2022 15:50:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6DEE1F6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653918681;
	bh=QeQg3hA5x9OrSaQpUJVXP7E9MxhSc4xird1zk6F7M0k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EKXOnWykms3jEmwjtLQdmIuu5aYNMJvV9Ch6b0ZGo81DCB3He6AeVhSlMytnS7AAL
	 MssBtWicOX8zUWdxBZKW2x4U4Bd3zipflptJY+j6Hv239rJK/vd6tOvMGukaVU7ikA
	 b5teV+qNenSZq2iy2NJmQobRrG0shcTeh6h7999M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5ABCF804BD;
	Mon, 30 May 2022 15:50:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C955F800E5; Mon, 30 May 2022 15:50:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43B3DF800E5
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 15:50:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43B3DF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BpI/862Z"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D453660FA9;
 Mon, 30 May 2022 13:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 327B5C36AE9;
 Mon, 30 May 2022 13:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653918620;
 bh=QeQg3hA5x9OrSaQpUJVXP7E9MxhSc4xird1zk6F7M0k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BpI/862ZwQOLrjKUCdYWOU5X9XKFtZrI5Ik/9/E5v+e3isiVGFtMQxcq3K21+L/hj
 4g+OWiQZB+adQBc0ekdBF71sKetI07vXcJXd5CfgOHuuN6ExKdC94J5zN4stxvEvq7
 LeoFsxn8WZhOqXX3gCYukylyKlfi/kC6vwDoRcF3k8IhsKUK3P3XyX3KhuFV0QNluL
 +hYwb+aJwXOPkr9ka3dHqBxymFnhv6PBVwpSOM57hY5Jrv0EMNL8HfonxASuyAcWCZ
 pqbSFO7R16DNHq9MYqrjzWsXPMMFBulMlo8VZQSdUGvQGcp7MwwYEOwzqUOKhXzVv/
 yqeVz6tvVaVKA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 23/38] ASoC: tscs454: Add endianness flag in
 snd_soc_component_driver
Date: Mon, 30 May 2022 09:49:09 -0400
Message-Id: <20220530134924.1936816-23-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530134924.1936816-1-sashal@kernel.org>
References: <20220530134924.1936816-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, steven.eckhoff.opensource@gmail.com,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 tiwai@suse.com, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

[ Upstream commit ff69ec96b87dccb3a29edef8cec5d4fefbbc2055 ]

The endianness flag is used on the CODEC side to specify an
ambivalence to endian, typically because it is lost over the hardware
link. This device receives audio over an I2S DAI and as such should
have endianness applied.

A fixup is also required to use the width directly rather than relying
on the format in hw_params, now both little and big endian would be
supported. It is worth noting this changes the behaviour of S24_LE to
use a word length of 24 rather than 32. This would appear to be a
correction since the fact S24_LE is stored as 32 bits should not be
presented over the bus.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220504170905.332415-26-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/tscs454.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tscs454.c b/sound/soc/codecs/tscs454.c
index ff85a0bf6170..00a90ccd6566 100644
--- a/sound/soc/codecs/tscs454.c
+++ b/sound/soc/codecs/tscs454.c
@@ -3129,18 +3129,17 @@ static int set_aif_sample_format(struct snd_soc_component *component,
 	unsigned int width;
 	int ret;
 
-	switch (format) {
-	case SNDRV_PCM_FORMAT_S16_LE:
+	switch (snd_pcm_format_width(format)) {
+	case 16:
 		width = FV_WL_16;
 		break;
-	case SNDRV_PCM_FORMAT_S20_3LE:
+	case 20:
 		width = FV_WL_20;
 		break;
-	case SNDRV_PCM_FORMAT_S24_3LE:
+	case 24:
 		width = FV_WL_24;
 		break;
-	case SNDRV_PCM_FORMAT_S24_LE:
-	case SNDRV_PCM_FORMAT_S32_LE:
+	case 32:
 		width = FV_WL_32;
 		break;
 	default:
@@ -3338,6 +3337,7 @@ static const struct snd_soc_component_driver soc_component_dev_tscs454 = {
 	.num_dapm_routes = ARRAY_SIZE(tscs454_intercon),
 	.controls =	tscs454_snd_controls,
 	.num_controls = ARRAY_SIZE(tscs454_snd_controls),
+	.endianness = 1,
 };
 
 #define TSCS454_RATES SNDRV_PCM_RATE_8000_96000
-- 
2.35.1

