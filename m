Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7B74CF042
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 04:32:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15E3216F7;
	Mon,  7 Mar 2022 04:31:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15E3216F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646623949;
	bh=s76giinrqn1tNrD975B3PDuGP0RFbZSB1WmZ3ycLFAc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p2iLX0DKkyKVYRBOf/4HBuuYNdbPpZOdBwkABRQvOf3Y6ZZ2WezVue0n4sCKXNdf6
	 CMh4zJBZWn31xi/lOhO8BYvHrFUG46V/tefcLMDYwX5Qsril/wcgAwmzSSexFExSpN
	 do8AwlVnlLV3L8YXlAfj02Qm4F4zGtDCulzs8toc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80EF9F80159;
	Mon,  7 Mar 2022 04:31:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83502F8013F; Mon,  7 Mar 2022 04:31:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BE5FF800E9
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 04:31:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BE5FF800E9
X-UUID: d561c3467bb345e6a4ac22575224e62b-20220307
X-UUID: d561c3467bb345e6a4ac22575224e62b-20220307
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 178550271; Mon, 07 Mar 2022 11:31:00 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 7 Mar 2022 11:30:58 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Mar 2022 11:30:58 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>
Subject: [v2] ASoC: mediatek: mt8183: support wb bt audio
Date: Mon, 7 Mar 2022 11:30:56 +0800
Message-ID: <20220307033056.11463-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 Tzung-Bi Shih <tzungbi@kernel.org>, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

Use "bt-sco-pcm-wb" codec dai driver for wb bt audio.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
---

changed from v1: 
  - describe changes in imperative mood
  - remove description of unnecessary dependenceies

 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index b0ec5ebd4f2d..889f9e4a96aa 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -260,7 +260,7 @@ SND_SOC_DAILINK_DEFS(pcm2,
 
 SND_SOC_DAILINK_DEFS(i2s0,
 	DAILINK_COMP_ARRAY(COMP_CPU("I2S0")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("bt-sco", "bt-sco-pcm")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("bt-sco", "bt-sco-pcm-wb")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(i2s1,
@@ -291,7 +291,7 @@ SND_SOC_DAILINK_DEFS(i2s3_rt1015p,
 
 SND_SOC_DAILINK_DEFS(i2s5,
 	DAILINK_COMP_ARRAY(COMP_CPU("I2S5")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("bt-sco", "bt-sco-pcm")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("bt-sco", "bt-sco-pcm-wb")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(tdm,
@@ -508,7 +508,6 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 		.no_pcm = 1,
 		.dpcm_capture = 1,
 		.ignore_suspend = 1,
-		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_i2s_ops,
 		SND_SOC_DAILINK_REG(i2s0),
 	},
@@ -541,7 +540,6 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 		.no_pcm = 1,
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
-		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_i2s_ops,
 		SND_SOC_DAILINK_REG(i2s5),
 	},
-- 
2.25.1

