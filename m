Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4115134D2DE
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 16:52:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7502167F;
	Mon, 29 Mar 2021 16:51:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7502167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617029561;
	bh=8zkC2ydMW7+gKn6/PFqlwtZa/dy9EfCo4ZFTHUyV9Z4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bOqXJ7lWi8BNMT4M7oCCK+48kVFqTfwpvYMA/7EtqMj18bfvkMDVuyx38+Kj+RUjT
	 OcLZxy8HW6jONtQz5d23ENI8b7ZBbaLL/0KI3z9920Zn0Vll8vvZKicazA+tboVnkg
	 SRfb1ZJaEHcP6/dLuywpJLefRt1Df0Bg/04bD5X4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CE85F8016E;
	Mon, 29 Mar 2021 16:51:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AA0DF8015A; Mon, 29 Mar 2021 16:51:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38EADF800B9
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 16:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38EADF800B9
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F8Fnn6wQqz9sMm;
 Mon, 29 Mar 2021 22:48:45 +0800 (CST)
Received: from localhost (10.174.179.96) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.498.0; Mon, 29 Mar 2021
 22:50:41 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <Vijendar.Mukunda@amd.com>
Subject: [PATCH -next] ASoC: amd: acp-da7219-max98357a: Fix -Wunused-variable
 warning
Date: Mon, 29 Mar 2021 22:50:37 +0800
Message-ID: <20210329145037.23756-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.96]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
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

While ACPI is not set, make W=1 warns:

sound/soc/amd/acp-da7219-max98357a.c:684:28: warning: ‘cz_rt5682_card’ defined but not used [-Wunused-variable]
 static struct snd_soc_card cz_rt5682_card = {
                            ^~~~~~~~~~~~~~
sound/soc/amd/acp-da7219-max98357a.c:671:28: warning: ‘cz_card’ defined but not used [-Wunused-variable]
 static struct snd_soc_card cz_card = {

Use #ifdef block to guard this.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/amd/acp-da7219-max98357a.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index e65e007fc604..1bf0458e22a8 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -47,13 +47,15 @@
 #define DUAL_CHANNEL		2
 #define RT5682_PLL_FREQ (48000 * 512)
 
+extern bool bt_uart_enable;
+void *acp_soc_is_rltk_max(struct device *dev);
+
+#ifdef CONFIG_ACPI
 static struct snd_soc_jack cz_jack;
 static struct clk *da7219_dai_wclk;
 static struct clk *da7219_dai_bclk;
 static struct clk *rt5682_dai_wclk;
 static struct clk *rt5682_dai_bclk;
-extern bool bt_uart_enable;
-void *acp_soc_is_rltk_max(struct device *dev);
 
 static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)
 {
@@ -692,6 +694,7 @@ static struct snd_soc_card cz_rt5682_card = {
 	.controls = cz_mc_controls,
 	.num_controls = ARRAY_SIZE(cz_mc_controls),
 };
+#endif
 
 void *acp_soc_is_rltk_max(struct device *dev)
 {
-- 
2.17.1

