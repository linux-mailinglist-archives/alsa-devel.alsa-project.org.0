Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 132CE31067E
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 09:19:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F6651679;
	Fri,  5 Feb 2021 09:18:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F6651679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612513186;
	bh=m0OZYOduaEmBdHe0LmWAcztN3YZ3pMlvzckyMMp+bDw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bmYJRQbFILY+PKjBdA7atxL/3m/qiexBgM4g0mGIL7Q0hp8/Wa/q/eDrvPCGZhHWN
	 QrPmQouFsP3EABI4A6u42axXYrCJg1LF2bojZi8gqM4PY5Hc2Z1bJcsinjW41BWhGv
	 /Xis7YcqlP2fY+RW8YyqJmRxJuBQnZXuWbfmXZ1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9E1FF8015A;
	Fri,  5 Feb 2021 09:18:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79500F8015A; Fri,  5 Feb 2021 09:18:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by alsa1.perex.cz (Postfix) with ESMTP id 2D195F800C0
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 09:18:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D195F800C0
X-UUID: 03e149f156a747148be635d5d2b45a5c-20210205
X-UUID: 03e149f156a747148be635d5d2b45a5c-20210205
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1860454707; Fri, 05 Feb 2021 16:17:49 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Feb 2021 16:16:55 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Feb 2021 16:16:55 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: mediatek: mt8183-mt6358: set playback and capture
 constraints
Date: Fri, 5 Feb 2021 16:16:52 +0800
Message-ID: <1612513012-27688-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: ABDA0BD1C6EEB5A07F7B91F8D61EE9147B36F064D4DF7B33ACAC22C941DBE8892000:8
X-MTK: N
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 tiwai@suse.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-kernel@vger.kernel.org, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 cychiang@chromium.org
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

Sets playback and capture constraints to S16_LE, stereo, 48kHz.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 3cf8aea..271413e 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -118,6 +118,45 @@ static int mt8183_rt1015_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 }
 
 static int
+mt8183_mt6358_startup(struct snd_pcm_substream *substream)
+{
+	static const unsigned int rates[] = {
+		48000,
+	};
+	static const struct snd_pcm_hw_constraint_list constraints_rates = {
+		.count = ARRAY_SIZE(rates),
+		.list  = rates,
+		.mask = 0,
+	};
+	static const unsigned int channels[] = {
+		2,
+	};
+	static const struct snd_pcm_hw_constraint_list constraints_channels = {
+		.count = ARRAY_SIZE(channels),
+		.list = channels,
+		.mask = 0,
+	};
+
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	snd_pcm_hw_constraint_list(runtime, 0,
+				   SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
+	runtime->hw.channels_max = 2;
+	snd_pcm_hw_constraint_list(runtime, 0,
+				   SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &constraints_channels);
+
+	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
+	snd_pcm_hw_constraint_msbits(runtime, 0, 16, 16);
+
+	return 0;
+}
+
+static const struct snd_soc_ops mt8183_mt6358_ops = {
+	.startup = mt8183_mt6358_startup,
+};
+
+static int
 mt8183_mt6358_ts3a227_max98357_bt_sco_startup(
 	struct snd_pcm_substream *substream)
 {
@@ -356,6 +395,7 @@ static void mt8183_mt6358_tdm_shutdown(struct snd_pcm_substream *substream)
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		.ops = &mt8183_mt6358_ops,
 		SND_SOC_DAILINK_REG(playback1),
 	},
 	{
@@ -403,6 +443,7 @@ static void mt8183_mt6358_tdm_shutdown(struct snd_pcm_substream *substream)
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		.ops = &mt8183_mt6358_ops,
 		SND_SOC_DAILINK_REG(capture3),
 	},
 	{
-- 
1.8.1.1.dirty

