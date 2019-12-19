Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F67126FC2
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 22:34:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81A81826;
	Thu, 19 Dec 2019 22:33:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81A81826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576791270;
	bh=y7V6OnESTRnRgv3+9x2rbZwvp0Kfj+M9bFuGxrMkIZ8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D9TEWqcK9IqfLzPSAuQK3o4Aj3VDPuCQYR0+fd00W1cajkzpK0jjCvB7JtTMMBDf1
	 Xi6B6yrCO8SARPMFnMbWr8N7roPJSPRsn/yWByvhLyeCiFhz111Z+Rfyef7QphduGN
	 u7MARBzsVWmki2T1foQGWh9sKH8jZZX/twLnboZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5671F8014F;
	Thu, 19 Dec 2019 22:32:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0CE1F80218; Thu, 19 Dec 2019 22:32:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F113BF80059
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 22:32:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F113BF80059
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 47f4ps5Nllz1rgD3;
 Thu, 19 Dec 2019 22:32:37 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 47f4ps4CWnz1qr2R;
 Thu, 19 Dec 2019 22:32:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 08luIRFc_8XE; Thu, 19 Dec 2019 22:32:36 +0100 (CET)
X-Auth-Info: C++WcgFi5WZ4blpdA1Bu58NEDD8VGuCLmH8dmWNp9S0=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 19 Dec 2019 22:32:36 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: alsa-devel@alsa-project.org
Date: Thu, 19 Dec 2019 22:32:19 +0100
Message-Id: <20191219213219.366073-1-marex@denx.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Mark Brown <broonie@kernel.org>,
 festevam@gmail.com
Subject: [alsa-devel] [PATCH] ASoC: sgtl5000: add multi endpoint support
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

Support multiple endpoints on SGTL5000 codec port when used in
of_graph context.

This patch allows to share the codec port between two CPU DAIs.

Example:

Custom STM32MP157C board uses SGTL5000 audio codec. This codec is
connected to two serial audio interfaces, which are configured
either as rx or tx.

From AsoC point of view the topolgy is the following:
// 2 CPU DAIs (SAI2A/B), 1 Codec (SGTL5000)
Playback: CPU-A-DAI(slave) -> (master)CODEC-DAI/port0
Record:   CPU-B-DAI(slave) <- (master)CODEC-DAI/port0

In the DT two endpoints have to be associated to the codec port:
sgtl5000_port: port {
    sgtl5000_tx_endpoint: endpoint@0 {
	    remote-endpoint = <&sai2a_endpoint>;
    };
    sgtl5000_rx_endpoint: endpoint@1 {
	    remote-endpoint = <&sai2b_endpoint>;
    };
};

However, when the audio graph card parses the codec nodes, it expects
to find DAI interface indexes matching the endpoints indexes.

The current patch forces the use of DAI id 0 for both endpoints,
which allows to share the codec DAI between the two CPU DAIs
for playback and capture streams respectively.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Mark Brown <broonie@kernel.org>
---
NOTE: This is the same as commit ad6bb3067c4d
      ("ASoC: cs42l51: add multi endpoint support")
---
 sound/soc/codecs/sgtl5000.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index aa1f9637d8950..93da6b58c97df 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -1513,6 +1513,13 @@ static int sgtl5000_probe(struct snd_soc_component *component)
 	return ret;
 }
 
+static int sgtl5000_of_xlate_dai_id(struct snd_soc_component *component,
+				    struct device_node *endpoint)
+{
+	/* return dai id 0, whatever the endpoint index */
+	return 0;
+}
+
 static const struct snd_soc_component_driver sgtl5000_driver = {
 	.probe			= sgtl5000_probe,
 	.set_bias_level		= sgtl5000_set_bias_level,
@@ -1522,6 +1529,7 @@ static const struct snd_soc_component_driver sgtl5000_driver = {
 	.num_dapm_widgets	= ARRAY_SIZE(sgtl5000_dapm_widgets),
 	.dapm_routes		= sgtl5000_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(sgtl5000_dapm_routes),
+	.of_xlate_dai_id	= sgtl5000_of_xlate_dai_id,
 	.suspend_bias_off	= 1,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
