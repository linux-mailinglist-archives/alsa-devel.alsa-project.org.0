Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A65156B36
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Feb 2020 16:50:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EE36167B;
	Sun,  9 Feb 2020 16:49:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EE36167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581263407;
	bh=4R3vvGbmpx8/Ye5Zzz+QK3fBI6XJgaKQNlweOi/Jt+4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IZjeUsk8+ZJehyO+wXtH7H6h7mtJus4MgIjwrxBZuaBQvJlbtTQu0dfI6g2IFKbLA
	 BfFsXfV1F3hb9qVCJsD/t14fqGViexgqUz1fW07+PxtZ7vmS3PDOsDDpUbddTDCF87
	 x6vdUK8kSrn2gvAfzNSOJcMmGJB1LhYc2I2hQZLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 774DDF80147;
	Sun,  9 Feb 2020 16:48:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEC17F80146; Sun,  9 Feb 2020 16:48:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.serbinski.com (mail.serbinski.com [162.218.126.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 026A8F800ED
 for <alsa-devel@alsa-project.org>; Sun,  9 Feb 2020 16:48:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 026A8F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=serbinski.com header.i=@serbinski.com
 header.b="jKbwn2xW"
Received: from localhost (unknown [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id C2536D00721;
 Sun,  9 Feb 2020 15:48:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
 by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fK_TCpBGIyr1; Sun,  9 Feb 2020 10:48:08 -0500 (EST)
Received: from anet (23-233-80-73.cpe.pppoe.ca [23.233.80.73])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.serbinski.com (Postfix) with ESMTPSA id E5ED8D006FC;
 Sun,  9 Feb 2020 10:48:07 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com E5ED8D006FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
 s=default; t=1581263288;
 bh=eajbKqGkxZ7eyaNOIY0gFw9T3e78d/CAluEu3zjDsX8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jKbwn2xWq2g+5yFX3dvPgYwsQ/mvKhtGSmB0mPUDOQly9wKZFs+QYjVWB/XzS6IFa
 NYHUBWDZBoiUmMyLfM9+StZBFy0L1bAfreDDL7Le31eSxqb7LMF74/jfbCTYp6Uh5N
 UnRSByqKQunKOEYJhTfWYjxeB8NH6ki9XJuAzFUo=
From: Adam Serbinski <adam@serbinski.com>
To: Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Sun,  9 Feb 2020 10:47:44 -0500
Message-Id: <20200209154748.3015-5-adam@serbinski.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200209154748.3015-1-adam@serbinski.com>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Gross <agross@kernel.org>, Adam Serbinski <adam@serbinski.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v2 4/8] ASoC: qdsp6: q6routing: add pcm port
	routing
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

This patch adds support to PCM_PORT mixers required to
select path between ASM stream and AFE ports.

Signed-off-by: Adam Serbinski <adam@serbinski.com>
CC: Andy Gross <agross@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Patrick Lai <plai@codeaurora.org>
CC: Banajit Goswami <bgoswami@codeaurora.org>
CC: Jaroslav Kysela <perex@perex.cz>
CC: Takashi Iwai <tiwai@suse.com>
CC: alsa-devel@alsa-project.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 sound/soc/qcom/qdsp6/q6routing.c | 44 ++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index 20724102e85a..3a81d2161707 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -67,6 +67,10 @@
 	{ mix_name, "SEC_MI2S_TX", "SEC_MI2S_TX" },	\
 	{ mix_name, "QUAT_MI2S_TX", "QUAT_MI2S_TX" },	\
 	{ mix_name, "TERT_MI2S_TX", "TERT_MI2S_TX" },		\
+	{ mix_name, "PRI_PCM_TX", "PRI_PCM_TX" },		\
+	{ mix_name, "SEC_PCM_TX", "SEC_PCM_TX" },		\
+	{ mix_name, "TERT_PCM_TX", "TERT_PCM_TX" },		\
+	{ mix_name, "QUAT_PCM_TX", "QUAT_PCM_TX" },		\
 	{ mix_name, "SLIMBUS_0_TX", "SLIMBUS_0_TX" },		\
 	{ mix_name, "SLIMBUS_1_TX", "SLIMBUS_1_TX" },		\
 	{ mix_name, "SLIMBUS_2_TX", "SLIMBUS_2_TX" },		\
@@ -128,6 +132,18 @@
 	SOC_SINGLE_EXT("QUAT_MI2S_TX", QUATERNARY_MI2S_TX,		\
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("PRI_PCM_TX", PRIMARY_PCM_TX,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("SEC_PCM_TX", SECONDARY_PCM_TX,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("TERT_PCM_TX", TERTIARY_PCM_TX,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("QUAT_PCM_TX", QUATERNARY_PCM_TX,		\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
 	SOC_SINGLE_EXT("SLIMBUS_0_TX", SLIMBUS_0_TX,			\
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),				\
@@ -468,6 +484,18 @@ static const struct snd_kcontrol_new quaternary_mi2s_rx_mixer_controls[] = {
 static const struct snd_kcontrol_new tertiary_mi2s_rx_mixer_controls[] = {
 	Q6ROUTING_RX_MIXERS(TERTIARY_MI2S_RX) };
 
+static const struct snd_kcontrol_new primary_pcm_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(PRIMARY_PCM_RX) };
+
+static const struct snd_kcontrol_new secondary_pcm_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(SECONDARY_PCM_RX) };
+
+static const struct snd_kcontrol_new tertiary_pcm_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(TERTIARY_PCM_RX) };
+
+static const struct snd_kcontrol_new quaternary_pcm_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(QUATERNARY_PCM_RX) };
+
 static const struct snd_kcontrol_new slimbus_rx_mixer_controls[] = {
 	Q6ROUTING_RX_MIXERS(SLIMBUS_0_RX) };
 
@@ -695,6 +723,18 @@ static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
 	SND_SOC_DAPM_MIXER("TERT_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
 			   tertiary_mi2s_rx_mixer_controls,
 			   ARRAY_SIZE(tertiary_mi2s_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("PRI_PCM_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+			   primary_pcm_rx_mixer_controls,
+			   ARRAY_SIZE(primary_pcm_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("SEC_PCM_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+			   secondary_pcm_rx_mixer_controls,
+			   ARRAY_SIZE(secondary_pcm_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("TERT_PCM_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+			   tertiary_pcm_rx_mixer_controls,
+			   ARRAY_SIZE(tertiary_pcm_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("QUAT_PCM_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+			   quaternary_pcm_rx_mixer_controls,
+			   ARRAY_SIZE(quaternary_pcm_rx_mixer_controls)),
 	SND_SOC_DAPM_MIXER("PRIMARY_TDM_RX_0 Audio Mixer", SND_SOC_NOPM, 0, 0,
 				pri_tdm_rx_0_mixer_controls,
 				ARRAY_SIZE(pri_tdm_rx_0_mixer_controls)),
@@ -853,6 +893,10 @@ static const struct snd_soc_dapm_route intercon[] = {
 	Q6ROUTING_RX_DAPM_ROUTE("TERT_MI2S_RX Audio Mixer", "TERT_MI2S_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("SEC_MI2S_RX Audio Mixer", "SEC_MI2S_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("PRI_MI2S_RX Audio Mixer", "PRI_MI2S_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("PRI_PCM_RX Audio Mixer", "PRI_PCM_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("SEC_PCM_RX Audio Mixer", "SEC_PCM_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("TERT_PCM_RX Audio Mixer", "TERT_PCM_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("QUAT_PCM_RX Audio Mixer", "QUAT_PCM_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("PRIMARY_TDM_RX_0 Audio Mixer",
 				"PRIMARY_TDM_RX_0"),
 	Q6ROUTING_RX_DAPM_ROUTE("PRIMARY_TDM_RX_1 Audio Mixer",
-- 
2.21.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
