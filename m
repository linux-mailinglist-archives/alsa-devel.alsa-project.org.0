Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACE0190612
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Mar 2020 08:08:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ECAF1658;
	Tue, 24 Mar 2020 08:08:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ECAF1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585033732;
	bh=5SBVxXXLM4RyZYTsTdkTYVYkk10jKwiBJlM7cKTtBXc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TBbHS1QzByQpC8LpLSacEtG4WQB8kE11Tf60J6p6GyeEoigyCT+348Xv4vlX4IZIR
	 P89Fukq1SMODXAb65wub4DgO0+7YeGkTlbNWijTKJvYJO+yYzp4S9qCme91UdtBg8M
	 3rH54OfpXFI2aps9rkAJVHkplxuNynLUnyHS2QDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB2EFF800B9;
	Tue, 24 Mar 2020 08:07:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F4F9F801F9; Tue, 24 Mar 2020 08:07:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C36EF80095
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 08:07:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C36EF80095
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D92459E50D0323D487EF;
 Tue, 24 Mar 2020 15:06:29 +0800 (CST)
Received: from localhost (10.173.223.234) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Tue, 24 Mar 2020
 15:06:19 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH -next] ASoC: wm8974: remove unused variables
Date: Tue, 24 Mar 2020 15:06:15 +0800
Message-ID: <20200324070615.16248-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.223.234]
X-CFilter-Loop: Reflected
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org
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

sound/soc/codecs/wm8974.c:200:38: warning:
 wm8974_aux_boost_controls defined but not used [-Wunused-const-variable=]
sound/soc/codecs/wm8974.c:204:38: warning:
 wm8974_mic_boost_controls defined but not used [-Wunused-const-variable=]

commit 8a123ee2a46d ("ASoC: WM8974 DAPM cleanups")
left behind this, remove them.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/codecs/wm8974.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/codecs/wm8974.c b/sound/soc/codecs/wm8974.c
index dc4fe4f5239d..06ba36595ddd 100644
--- a/sound/soc/codecs/wm8974.c
+++ b/sound/soc/codecs/wm8974.c
@@ -196,14 +196,6 @@ SOC_DAPM_SINGLE("MicN Switch", WM8974_INPUT, 1, 1, 0),
 SOC_DAPM_SINGLE("MicP Switch", WM8974_INPUT, 0, 1, 0),
 };
 
-/* AUX Input boost vol */
-static const struct snd_kcontrol_new wm8974_aux_boost_controls =
-SOC_DAPM_SINGLE("Aux Volume", WM8974_ADCBOOST, 0, 7, 0);
-
-/* Mic Input boost vol */
-static const struct snd_kcontrol_new wm8974_mic_boost_controls =
-SOC_DAPM_SINGLE("Mic Volume", WM8974_ADCBOOST, 4, 7, 0);
-
 static const struct snd_soc_dapm_widget wm8974_dapm_widgets[] = {
 SND_SOC_DAPM_MIXER("Speaker Mixer", WM8974_POWER3, 2, 0,
 	&wm8974_speaker_mixer_controls[0],
-- 
2.17.1


