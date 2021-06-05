Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 374523A7B4B
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 11:57:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B79FA16C0;
	Tue, 15 Jun 2021 11:56:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B79FA16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623751040;
	bh=LBHVgHV16xdn5dS+HdjVq9Aa0kuDa38kvcFxf0VhxB4=;
	h=Resent-From:Resent-Date:Resent-To:From:To:Date:In-Reply-To:
	 References:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nrD8ZsSM0gc57Y9A0LVBsDPudNVeEtQihs8xhEAmnJZbX/5BQGwxCaRLKkeFfF+jX
	 /1CkIGdqaPcdjF6CNJDoEprDkQ4q7Hv4r7sLe0PH7rprrWBfqZeYKt7Twb4i3ynl8T
	 3MbAWhBA22K1EBO8sX6Rfg2GS8W+lWL6HAB3ClPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDA06F80519;
	Tue, 15 Jun 2021 11:52:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BA4AF80424; Mon, 14 Jun 2021 22:13:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 040E9F800F7
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 22:13:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 040E9F800F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org
 header.b="FZJqoZ85"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D8676128A
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 20:13:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org
 header.b="FZJqoZ85"
Resent-From: Mark Brown <broonie@sirena.org.uk>
Resent-Date: Mon, 14 Jun 2021 21:13:00 +0100
Resent-Message-ID: <20210614201300.GI5646@sirena.org.uk>
Resent-To: alsa-devel@alsa-project.org
Envelope-to: broonie@sirena.co.uk
Delivery-date: Sat, 05 Jun 2021 03:29:43 +0100
Received: from mail.kernel.org ([198.145.29.99])
 by cassiel.sirena.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <SRS0=4y+g=K7=disroot.org=ultracoolguy@kernel.org>)
 id 1lpM4D-004JhZ-3y
 for broonie@sirena.co.uk; Sat, 05 Jun 2021 03:29:43 +0100
Received: by mail.kernel.org (Postfix)
 id 78E4561403; Sat,  5 Jun 2021 02:29:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AE0DA61402
 for <broonie@kernel.org>; Sat,  5 Jun 2021 02:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE0DA61402
Authentication-Results: mail.kernel.org; dmarc=pass (p=quarantine dis=none)
 header.from=disroot.org
Authentication-Results: mail.kernel.org;
 spf=pass smtp.mailfrom=ultracoolguy@disroot.org
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 6C8325BDCE;
 Sat,  5 Jun 2021 04:23:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ouMJYQ7fYQLD; Sat,  5 Jun 2021 04:23:26 +0200 (CEST)
From: Gabriel David <ultracoolguy@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1622859806; bh=LBHVgHV16xdn5dS+HdjVq9Aa0kuDa38kvcFxf0VhxB4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=FZJqoZ85gspLG/8og8hc7989CdaB35pxOqmYf05gzxEJ9ZKesA4fdIDycb97/ijUk
 7nAWiOE+3WUjC8v26AoDC6kdj2ooIIEVqH6aFGXWk9hZu9UFofnbh3HCkaTMLeBOBu
 /u3CNgiwlZug5QLyttWYG43t7MododlH4Y75+t3w4HZsqOkJv9NEo8cE4op8qJ3I+u
 4vZi2iYmnsoYKiSqFKZkXa0mBjvh4oVRyEC1KxyAoH6aWuIAJ1NVIj2m+8pVuW7vEr
 Q0O+izbN/qBFgHNk6LuemlEG6b21Z6vsJlTu607ocmkU/L3ZJel/pMGOVeX5x+5FKF
 n1KldgnmPSIpg==
To: broonie@kernel.org,
	srinivas.kandagatla@linaro.org
Date: Fri,  4 Jun 2021 22:22:06 -0400
Message-Id: <20210605022206.13226-5-ultracoolguy@disroot.org>
In-Reply-To: <20210605022206.13226-1-ultracoolguy@disroot.org>
References: <20210605022206.13226-1-ultracoolguy@disroot.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 198.145.29.99
X-SA-Exim-Mail-From: SRS0=4y+g=K7=disroot.org=ultracoolguy@kernel.org
Subject: [PATCH 4/4] ASoC: qdsp6: q6routing: Add Quinary MI2S ports
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: No (on cassiel.sirena.org.uk); Unknown failure
X-TUID: NNdr+ZNBVc/R
X-Mailman-Approved-At: Tue, 15 Jun 2021 11:51:53 +0200
Cc: alsa-devel@alsa-project.org, Gabriel David <ultracoolguy@disroot.org>
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

This patch adds MI2S mixers to Quinary ports

Signed-off-by: Gabriel David <ultracoolguy@disroot.org>
---
 sound/soc/qcom/qdsp6/q6routing.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index 0a6b9433f6ac..3390ebef9549 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -66,6 +66,7 @@
 	{ mix_name, "PRI_MI2S_TX", "PRI_MI2S_TX" },	\
 	{ mix_name, "SEC_MI2S_TX", "SEC_MI2S_TX" },	\
 	{ mix_name, "QUAT_MI2S_TX", "QUAT_MI2S_TX" },	\
+	{ mix_name, "QUIN_MI2S_TX", "QUIN_MI2S_TX" },	\
 	{ mix_name, "TERT_MI2S_TX", "TERT_MI2S_TX" },		\
 	{ mix_name, "SLIMBUS_0_TX", "SLIMBUS_0_TX" },		\
 	{ mix_name, "SLIMBUS_1_TX", "SLIMBUS_1_TX" },		\
@@ -140,6 +141,9 @@
 	SOC_SINGLE_EXT("QUAT_MI2S_TX", QUATERNARY_MI2S_TX,		\
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),				\
+	SOC_SINGLE_EXT("QUIN_MI2S_TX", QUINARY_MI2S_TX,			\
+		id, 1, 0, msm_routing_get_audio_mixer,			\
+		msm_routing_put_audio_mixer),				\
 	SOC_SINGLE_EXT("SLIMBUS_0_TX", SLIMBUS_0_TX,			\
 		id, 1, 0, msm_routing_get_audio_mixer,			\
 		msm_routing_put_audio_mixer),				\
@@ -513,6 +517,9 @@ static const struct snd_kcontrol_new secondary_mi2s_rx_mixer_controls[] = {
 static const struct snd_kcontrol_new quaternary_mi2s_rx_mixer_controls[] = {
 	Q6ROUTING_RX_MIXERS(QUATERNARY_MI2S_RX) };
 
+static const struct snd_kcontrol_new quinary_mi2s_rx_mixer_controls[] = {
+	Q6ROUTING_RX_MIXERS(QUINARY_MI2S_RX) };
+
 static const struct snd_kcontrol_new tertiary_mi2s_rx_mixer_controls[] = {
 	Q6ROUTING_RX_MIXERS(TERTIARY_MI2S_RX) };
 
@@ -752,6 +759,9 @@ static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
 	SND_SOC_DAPM_MIXER("QUAT_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
 			   quaternary_mi2s_rx_mixer_controls,
 			   ARRAY_SIZE(quaternary_mi2s_rx_mixer_controls)),
+	SND_SOC_DAPM_MIXER("QUIN_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
+			   quinary_mi2s_rx_mixer_controls,
+			   ARRAY_SIZE(quinary_mi2s_rx_mixer_controls)),
 	SND_SOC_DAPM_MIXER("TERT_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
 			   tertiary_mi2s_rx_mixer_controls,
 			   ARRAY_SIZE(tertiary_mi2s_rx_mixer_controls)),
@@ -941,6 +951,7 @@ static const struct snd_soc_dapm_route intercon[] = {
 	Q6ROUTING_RX_DAPM_ROUTE("SLIMBUS_5_RX Audio Mixer", "SLIMBUS_5_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("SLIMBUS_6_RX Audio Mixer", "SLIMBUS_6_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("QUAT_MI2S_RX Audio Mixer", "QUAT_MI2S_RX"),
+	Q6ROUTING_RX_DAPM_ROUTE("QUIN_MI2S_RX Audio Mixer", "QUIN_MI2S_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("TERT_MI2S_RX Audio Mixer", "TERT_MI2S_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("SEC_MI2S_RX Audio Mixer", "SEC_MI2S_RX"),
 	Q6ROUTING_RX_DAPM_ROUTE("PRI_MI2S_RX Audio Mixer", "PRI_MI2S_RX"),
-- 
2.31.1

