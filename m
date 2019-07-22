Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 563DE70B55
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 23:28:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D27EB1850;
	Mon, 22 Jul 2019 23:28:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D27EB1850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563830935;
	bh=+fJRJ1h8im++4iWUOvE0LkjaTEabjlpi/ISbdNjbMeY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Jei9qPnGP+qwsojldJLuPwBPOFghH/av88qJX5OsYm/GxbK2j+tXiyNdgPpjEyQhr
	 zhwHaHiwgJqZFVQ+o6VqE7M5lKe7uG17B/5Q6l0vxgNK58XtpCvYhDWo9IqWF4NYok
	 tRcZQG4BZxW5CtPxlw/UjIFtr8pz5sGZOZxao0LI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11053F803D6;
	Mon, 22 Jul 2019 23:27:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15866F803D5; Mon, 22 Jul 2019 23:27:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp02.smtpout.orange.fr
 [80.12.242.124])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF0FCF800F5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 23:27:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF0FCF800F5
Received: from localhost.localdomain ([92.140.204.221]) by mwinf5d78 with ME
 id fxT32000D4n7eLC03xT3dn; Mon, 22 Jul 2019 23:27:04 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 22 Jul 2019 23:27:04 +0200
X-ME-IP: 92.140.204.221
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: bardliao@realtek.com, chiou@realtek.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Date: Mon, 22 Jul 2019 23:26:39 +0200
Message-Id: <20190722212639.26954-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: rt5665: Fix a typo in the name of a
	function
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

All function names start with rt5665_, except 'rt5655_set_verf()'.
It is likely a typo.

Fix it to be consistent.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/codecs/rt5665.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index f2ad3a4c3b7f..897e53d4c40a 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -2569,7 +2569,7 @@ static int set_dmic_power(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static int rt5655_set_verf(struct snd_soc_dapm_widget *w,
+static int rt5665_set_verf(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
@@ -2689,11 +2689,11 @@ static const struct snd_soc_dapm_widget rt5665_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("Mic Det Power", RT5665_PWR_VOL,
 		RT5665_PWR_MIC_DET_BIT, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("Vref1", RT5665_PWR_ANLG_1, RT5665_PWR_VREF1_BIT, 0,
-		rt5655_set_verf, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU),
+		rt5665_set_verf, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU),
 	SND_SOC_DAPM_SUPPLY("Vref2", RT5665_PWR_ANLG_1, RT5665_PWR_VREF2_BIT, 0,
-		rt5655_set_verf, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU),
+		rt5665_set_verf, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU),
 	SND_SOC_DAPM_SUPPLY("Vref3", RT5665_PWR_ANLG_1, RT5665_PWR_VREF3_BIT, 0,
-		rt5655_set_verf, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU),
+		rt5665_set_verf, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU),
 
 	/* ASRC */
 	SND_SOC_DAPM_SUPPLY_S("I2S1 ASRC", 1, RT5665_ASRC_1,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
