Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 670E8369428
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 15:56:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E088C16AB;
	Fri, 23 Apr 2021 15:55:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E088C16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619186166;
	bh=6KDvAxd4D10FhMdgHXFWlpAkuxJYhwdlnT4kPClmbl4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fp2TBzqMKtBqoHsz7eBCeWZ7oSGf6Sxepc8fHB2UuRGRVNWcPqlzkI6GNK0UuEkNK
	 eO/K0FJajljrXetRCUxQy95h5uimdCcMotpe2HJkZlgk7hD9sXD3DjP1d7oRRF9bF2
	 9MHA2REzSQniZaOP+UlPMkgTw7NPtcnwKCdr3bhk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37A72F80256;
	Fri, 23 Apr 2021 15:54:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36660F80227; Fri, 23 Apr 2021 15:54:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56DAAF80117
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 15:54:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56DAAF80117
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1lZwG4-0004Yy-1C; Fri, 23 Apr 2021 15:54:12 +0200
Received: from mfe by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1lZwG2-0001tp-G0; Fri, 23 Apr 2021 15:54:10 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 kuninori.morimoto.gx@renesas.com
Subject: [PATCH] ASoC: max98088: fix ni clock divider calculation
Date: Fri, 23 Apr 2021 15:54:02 +0200
Message-Id: <20210423135402.32105-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, kernel@pengutronix.de
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

The ni1/ni2 ratio formula [1] uses the pclk which is the prescaled mclk.
The max98088 datasheet [2] has no such formula but table-12 equals so
we can assume that it is the same for both devices.

While on it make use of DIV_ROUND_CLOSEST_ULL().

[1] https://datasheets.maximintegrated.com/en/ds/MAX98089.pdf; page 86
[2] https://datasheets.maximintegrated.com/en/ds/MAX98088.pdf; page 82

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Hi,

please be noted that I used the old formatting style which uses spaces
instead of tabs. Therefore checkpatch.pl complains. The whole driver
needs a style adaption but I wanted to keep it for now.

Regards,
  Marco

 sound/soc/codecs/max98088.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index 4be24e7f51c8..f8e49e45ce33 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -41,6 +41,7 @@ struct max98088_priv {
 	enum max98088_type devtype;
 	struct max98088_pdata *pdata;
 	struct clk *mclk;
+	unsigned char mclk_prescaler;
 	unsigned int sysclk;
 	struct max98088_cdata dai[2];
 	int eq_textcnt;
@@ -998,13 +999,16 @@ static int max98088_dai1_hw_params(struct snd_pcm_substream *substream,
        /* Configure NI when operating as master */
        if (snd_soc_component_read(component, M98088_REG_14_DAI1_FORMAT)
                & M98088_DAI_MAS) {
+               unsigned long pclk;
+
                if (max98088->sysclk == 0) {
                        dev_err(component->dev, "Invalid system clock frequency\n");
                        return -EINVAL;
                }
                ni = 65536ULL * (rate < 50000 ? 96ULL : 48ULL)
                                * (unsigned long long int)rate;
-               do_div(ni, (unsigned long long int)max98088->sysclk);
+               pclk = DIV_ROUND_CLOSEST(max98088->sysclk, max98088->mclk_prescaler);
+               ni = DIV_ROUND_CLOSEST_ULL(ni, pclk);
                snd_soc_component_write(component, M98088_REG_12_DAI1_CLKCFG_HI,
                        (ni >> 8) & 0x7F);
                snd_soc_component_write(component, M98088_REG_13_DAI1_CLKCFG_LO,
@@ -1065,13 +1069,16 @@ static int max98088_dai2_hw_params(struct snd_pcm_substream *substream,
        /* Configure NI when operating as master */
        if (snd_soc_component_read(component, M98088_REG_1C_DAI2_FORMAT)
                & M98088_DAI_MAS) {
+               unsigned long pclk;
+
                if (max98088->sysclk == 0) {
                        dev_err(component->dev, "Invalid system clock frequency\n");
                        return -EINVAL;
                }
                ni = 65536ULL * (rate < 50000 ? 96ULL : 48ULL)
                                * (unsigned long long int)rate;
-               do_div(ni, (unsigned long long int)max98088->sysclk);
+               pclk = DIV_ROUND_CLOSEST(max98088->sysclk, max98088->mclk_prescaler);
+               ni = DIV_ROUND_CLOSEST_ULL(ni, pclk);
                snd_soc_component_write(component, M98088_REG_1A_DAI2_CLKCFG_HI,
                        (ni >> 8) & 0x7F);
                snd_soc_component_write(component, M98088_REG_1B_DAI2_CLKCFG_LO,
@@ -1113,8 +1120,10 @@ static int max98088_dai_set_sysclk(struct snd_soc_dai *dai,
         */
        if ((freq >= 10000000) && (freq < 20000000)) {
                snd_soc_component_write(component, M98088_REG_10_SYS_CLK, 0x10);
+               max98088->mclk_prescaler = 1;
        } else if ((freq >= 20000000) && (freq < 30000000)) {
                snd_soc_component_write(component, M98088_REG_10_SYS_CLK, 0x20);
+               max98088->mclk_prescaler = 2;
        } else {
                dev_err(component->dev, "Invalid master clock frequency\n");
                return -EINVAL;
-- 
2.29.2

