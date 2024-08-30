Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FCF966CCC
	for <lists+alsa-devel@lfdr.de>; Sat, 31 Aug 2024 01:11:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49164846;
	Sat, 31 Aug 2024 01:10:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49164846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725059466;
	bh=IS5ewNmWP0sqjKAW32hJUNo4c46NPCTFNIrigQTsXAU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rHW2Q9uL/CfHNbpK7ZdcexT3+BVmf0UtMKa2p9iV88s5yGDgX62DVLG+B/p4MWHtc
	 N0hL8522jlzHcHGhwK4WZls5tZX8u4zvlMRAtMwpEk+YM8pdov4Tm8gtVbvUUQEE9m
	 Rk9ZxOwBgNAvN6YAaS8K5vDvqIPTFmiRPDZIh35k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72908F805B3; Sat, 31 Aug 2024 01:10:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F41A6F805B1;
	Sat, 31 Aug 2024 01:10:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C937F800AC; Sat, 31 Aug 2024 01:10:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B9B1F800AC
	for <alsa-devel@alsa-project.org>; Sat, 31 Aug 2024 01:10:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B9B1F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=tItuCeQI
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8B4EC88CFB;
	Sat, 31 Aug 2024 01:10:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1725059422;
	bh=YuZt2cUdSKSrJC5cPCqXIoY8XTYU7QDMoGj7HTnwsfE=;
	h=From:To:Cc:Subject:Date:From;
	b=tItuCeQIdRGJYFL8SeQqX4SnLLoxVXheDueGzssfNChujsBDKlxTh1NRIeRaUa3b3
	 wnktnXLQRbdoOq4L3ht44+DU+k//GPEah0fKPBjVMqnxzYPDgY3vHGgySQRmVVoprT
	 zJ0AfPuHlK0uwkINy/JFUFn5CN/OjLnl+q2cnpnP7HsEoJpflkpNngAgu1DFf9K1oT
	 i8cHPJs6+AuVW2UlrLsxINcoGSrIGEf/qmdjjx5gQg7VwftpFgkMNOYDsye5NX2+uJ
	 1UAy3UgLRdX1rN7Szvt6I7czSNznpuvFQzQFxb877pWlaQNAajonauo37h9ivLirlz
	 rHa1OapN8/z8A==
From: Marek Vasut <marex@denx.de>
To: alsa-devel@alsa-project.org
Cc: Marek Vasut <marex@denx.de>,
	Baojun Xu <baojun.xu@ti.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kevin Lu <kevin-lu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Takashi Iwai <tiwai@suse.com>,
	kernel@dh-electronics.com,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: tlv320aic32x4: Add multi endpoint support
Date: Sat, 31 Aug 2024 01:09:43 +0200
Message-ID: <20240830231007.205707-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Message-ID-Hash: N4PNHPXSPCBYTF2YK4Q7RCA72KUISHKE
X-Message-ID-Hash: N4PNHPXSPCBYTF2YK4Q7RCA72KUISHKE
X-MailFrom: marex@denx.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N4PNHPXSPCBYTF2YK4Q7RCA72KUISHKE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Support multiple endpoints on TLV320AIC32x4 codec port when
used in of_graph context.

This patch allows to share the codec port between two CPU DAIs.

Example:

Custom STM32MP157C board uses TLV320AIC32x4 audio codec. This codec
is connected to two serial audio interfaces, which are configured
either as rx or tx.

>From AsoC point of view the topolgy is the following:
// 2 CPU DAIs (SAI2A/B), 1 Codec (TLV320AIC32x4)
Playback: CPU-A-DAI(slave) -> (master)CODEC-DAI/port0
Record:   CPU-B-DAI(slave) <- (master)CODEC-DAI/port0

In the DT two endpoints have to be associated to the codec port:
tlv320aic32x4_port: port {
    tlv320aic32x4_tx_endpoint: endpoint@0 {
            remote-endpoint = <&sai2a_endpoint>;
    };
    tlv320aic32x4_rx_endpoint: endpoint@1 {
            remote-endpoint = <&sai2b_endpoint>;
    };
};

However, when the audio graph card parses the codec nodes, it expects
to find DAI interface indexes matching the endpoints indexes.

The current patch forces the use of DAI id 0 for both endpoints,
which allows to share the codec DAI between the two CPU DAIs
for playback and capture streams respectively.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Baojun Xu <baojun.xu@ti.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Kevin Lu <kevin-lu@ti.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Shenghao Ding <shenghao-ding@ti.com>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Cc: kernel@dh-electronics.com
Cc: linux-sound@vger.kernel.org
---
 sound/soc/codecs/tlv320aic32x4.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 5c0c81da06dba..54ea4bc58c276 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -1073,6 +1073,13 @@ static int aic32x4_component_probe(struct snd_soc_component *component)
 	return 0;
 }
 
+static int aic32x4_of_xlate_dai_id(struct snd_soc_component *component,
+				   struct device_node *endpoint)
+{
+	/* return dai id 0, whatever the endpoint index */
+	return 0;
+}
+
 static const struct snd_soc_component_driver soc_component_dev_aic32x4 = {
 	.probe			= aic32x4_component_probe,
 	.set_bias_level		= aic32x4_set_bias_level,
@@ -1082,6 +1089,7 @@ static const struct snd_soc_component_driver soc_component_dev_aic32x4 = {
 	.num_dapm_widgets	= ARRAY_SIZE(aic32x4_dapm_widgets),
 	.dapm_routes		= aic32x4_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(aic32x4_dapm_routes),
+	.of_xlate_dai_id	= aic32x4_of_xlate_dai_id,
 	.suspend_bias_off	= 1,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
@@ -1203,6 +1211,7 @@ static const struct snd_soc_component_driver soc_component_dev_aic32x4_tas2505 =
 	.num_dapm_widgets	= ARRAY_SIZE(aic32x4_tas2505_dapm_widgets),
 	.dapm_routes		= aic32x4_tas2505_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(aic32x4_tas2505_dapm_routes),
+	.of_xlate_dai_id	= aic32x4_of_xlate_dai_id,
 	.suspend_bias_off	= 1,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
-- 
2.45.2

