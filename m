Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B5A4DD72D
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Mar 2022 10:37:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 537D81890;
	Fri, 18 Mar 2022 10:36:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 537D81890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647596234;
	bh=Vxg42jV+DhvN32QZwjEQ+bxPVdRqp9kfCpcuyuWIbAo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n6nAm2NQviNVq3g616J40iZi1U6oC/43XY8bSG5xgEXGN3+iUk4XSbsog+jamZclH
	 bSmvKJ5CZA0XmpYgauwUH9388WumHbJgAL8pXwyrf23sJ4cF1dCY2R529jNxkQfPhu
	 QJ9s2ffcOQlnjnXc6gUBFPuZBHN2RGwXKI0IRpQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C27ADF80118;
	Fri, 18 Mar 2022 10:36:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34E8EF8026A; Fri, 18 Mar 2022 10:36:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EF93F80121
 for <alsa-devel@alsa-project.org>; Fri, 18 Mar 2022 10:35:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EF93F80121
X-QQ-mid: bizesmtp86t1647596144tkbrhvl5
Received: from localhost.localdomain ( [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 18 Mar 2022 17:35:38 +0800 (CST)
X-QQ-SSF: 01400000002000D0I000000A0000000
X-QQ-FEAT: 1vYwxPNStGlVdhmjjLS+53k4INM9GjyQdIqJJMrCR+pb1LYHnR4/aqzBpqnWV
 ueiDrL0E4KPMqka9Lw7vwy/XCn///iYN9ih43KoU1HwOdjHxGQIEN6LgBHLEH0JECrFK3RL
 dGoMa4fMbFbetSbqw9V3WYJ9vtrhXmaYvIT6xqaTpLjUrsNCQhdzovFEa9Am1JbwsavFN3I
 833ohGKSAeYcDIcL0P5znSvBEEv2dCuaM2FoXncuRXVRlhkz3VGYI4LgjDsC9HsX3BmImBq
 YmeEnOeyGTxMf8Tpa7w+ainnytBx8VUOd0FhSPjKdSY4LLosOXXR89lldHfzWvtuCgakdck
 KYQKGSYEzaMKyeG99h+MoSuQOYqVPN6f04H7YKy7alSwSm1HKk=
X-QQ-GoodBg: 1
From: Meng Tang <tangmeng@uniontech.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: fsl-asoc-card: Fix jack_event() always return 0
Date: Fri, 18 Mar 2022 17:35:36 +0800
Message-Id: <20220318093536.15385-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign4
X-QQ-Bgrelay: 1
Cc: Meng Tang <tangmeng@uniontech.com>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

Today, hp_jack_event and mic_jack_event always return 0. However,
snd_soc_dapm_disable_pin and snd_soc_dapm_enable_pin may return a
non-zero value, this will cause the user who calling hp_jack_event
and mic_jack_event don't know whether the operation was really
successfully.

This patch corrects the behavior by properly returning 1 when the
value gets updated.

Signed-off-by: Meng Tang <tangmeng@uniontech.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 370bc790c6ba..f2641c2cb047 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -457,16 +457,18 @@ static int fsl_asoc_card_audmux_init(struct device_node *np,
 static int hp_jack_event(struct notifier_block *nb, unsigned long event,
 			 void *data)
 {
+	int ret;
+
 	struct snd_soc_jack *jack = (struct snd_soc_jack *)data;
 	struct snd_soc_dapm_context *dapm = &jack->card->dapm;
 
 	if (event & SND_JACK_HEADPHONE)
 		/* Disable speaker if headphone is plugged in */
-		snd_soc_dapm_disable_pin(dapm, "Ext Spk");
+		ret = snd_soc_dapm_disable_pin(dapm, "Ext Spk");
 	else
-		snd_soc_dapm_enable_pin(dapm, "Ext Spk");
+		ret = snd_soc_dapm_enable_pin(dapm, "Ext Spk");
 
-	return 0;
+	return ret;
 }
 
 static struct notifier_block hp_jack_nb = {
@@ -476,16 +478,18 @@ static struct notifier_block hp_jack_nb = {
 static int mic_jack_event(struct notifier_block *nb, unsigned long event,
 			  void *data)
 {
+	int ret;
+
 	struct snd_soc_jack *jack = (struct snd_soc_jack *)data;
 	struct snd_soc_dapm_context *dapm = &jack->card->dapm;
 
 	if (event & SND_JACK_MICROPHONE)
 		/* Disable dmic if microphone is plugged in */
-		snd_soc_dapm_disable_pin(dapm, "DMIC");
+		ret = snd_soc_dapm_disable_pin(dapm, "DMIC");
 	else
-		snd_soc_dapm_enable_pin(dapm, "DMIC");
+		ret = snd_soc_dapm_enable_pin(dapm, "DMIC");
 
-	return 0;
+	return ret;
 }
 
 static struct notifier_block mic_jack_nb = {
-- 
2.20.1



