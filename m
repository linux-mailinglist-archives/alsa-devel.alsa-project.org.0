Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7C1326729
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 19:58:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC087168A;
	Fri, 26 Feb 2021 19:57:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC087168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614365928;
	bh=cfsk/Abj16Y8q/ZiAM1bvVZnWKLUSBXro8r5SkdZjOk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fsI6SWQzUnT5OVNvbm9YcDVW3UjB+a+ffpch2eirtMgKrqZ+AkvX3V/j4f8Wjr2O5
	 0frAW50tjUuWm40GG9WnG4LeWY3FdFxHfWlcr5v4vhy6Cdea627rgn+K7OrnAZCtwd
	 r2XJdyezoziYYgswnR355bvlUM1ItZ3ONCB33htk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31BB9F80154;
	Fri, 26 Feb 2021 19:57:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A42F0F8016C; Fri, 26 Feb 2021 19:57:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AACEEF80154
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 19:57:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AACEEF80154
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1lFiII-0000Mk-4s; Fri, 26 Feb 2021 18:56:54 +0000
From: Colin King <colin.king@canonical.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: boards: sof-wm8804: add check for PLL setting
Date: Fri, 26 Feb 2021 18:56:53 +0000
Message-Id: <20210226185653.1071321-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

Currently the return from snd_soc_dai_set_pll is not checking for
failure, this is the only driver in the kernel that ignores this,
so it probably should be added for sake of completeness.  Fix this
by adding an error return check.

Addresses-Coverity: ("Unchecked return value")
Fixes: f139546fb7d4 ("ASoC: Intel: boards: sof-wm8804: support for Hifiberry Digiplus boards")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/intel/boards/sof_wm8804.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_wm8804.c b/sound/soc/intel/boards/sof_wm8804.c
index a46ba13e8eb0..6a181e45143d 100644
--- a/sound/soc/intel/boards/sof_wm8804.c
+++ b/sound/soc/intel/boards/sof_wm8804.c
@@ -124,7 +124,11 @@ static int sof_wm8804_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	snd_soc_dai_set_clkdiv(codec_dai, WM8804_MCLK_DIV, mclk_div);
-	snd_soc_dai_set_pll(codec_dai, 0, 0, sysclk, mclk_freq);
+	ret = snd_soc_dai_set_pll(codec_dai, 0, 0, sysclk, mclk_freq);
+	if (ret < 0) {
+		dev_err(rtd->card->dev, "Failed to set WM8804 PLL\n");
+		return ret;
+	}
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, WM8804_TX_CLKSRC_PLL,
 				     sysclk, SND_SOC_CLOCK_OUT);
-- 
2.30.0

