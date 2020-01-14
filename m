Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E49F013AF74
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 17:33:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86EC618AD;
	Tue, 14 Jan 2020 17:32:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86EC618AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579019602;
	bh=uRn/wEsrxL+wcTIiOGWEZxDEvod1ytqWvgFfdyVQokE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=EZdVTrX9Ntwtk9SQxvI/mN+Z6zl89LUGIDjhy9C65WesGTT0qTyhIvxFoVSrzrbyI
	 tvc0Apkd4ofEwCB+PHMxniU5dRMKYFfkvNi/8FmlIUw28PJ4mJUnNnficqiCKk7ur3
	 SQpUZpcvSz0ULpZmI9JVEit3pjRTGH2MWRK8yfcs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE616F8028C;
	Tue, 14 Jan 2020 17:21:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA3B0F8028A; Tue, 14 Jan 2020 17:21:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E257F8026F
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 17:20:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E257F8026F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Ti/evjkN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Rh/hE5btprtiOJxsync+pH7RTa+QxA8z6BgV+MX1Xxs=; b=Ti/evjkNGDzj
 s84OrGnCsXGux0/ukFq1JFIWprKDpK84nEcSwbF5dfupaWl17Hg2BoMeGQ50fEOJAOsarDWTVjPrL
 VnIMy7XoqIiDM3aTfE1CveNKY0dTdFvlELHfbnRSG6O39uffFXovZvYQeBgeLzmrZ19C0K4eQT4Va
 5ITPE=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1irOw2-0001ac-EX; Tue, 14 Jan 2020 16:20:54 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 25B2CD02061; Tue, 14 Jan 2020 16:20:54 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marex@denx.de>
In-Reply-To: <20191219213219.366073-1-marex@denx.de>
Message-Id: <applied-20191219213219.366073-1-marex@denx.de>
X-Patchwork-Hint: ignore
Date: Tue, 14 Jan 2020 16:20:54 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 festevam@gmail.com
Subject: [alsa-devel] Applied "ASoC: sgtl5000: add multi endpoint support"
	to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: sgtl5000: add multi endpoint support

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 06bf8ea4f8ae34f91e60d27c8065f55d7a88c682 Mon Sep 17 00:00:00 2001
From: Marek Vasut <marex@denx.de>
Date: Thu, 19 Dec 2019 22:32:19 +0100
Subject: [PATCH] ASoC: sgtl5000: add multi endpoint support

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
Link: https://lore.kernel.org/r/20191219213219.366073-1-marex@denx.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/sgtl5000.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index e949b372cead..d5130193b4a2 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -1514,6 +1514,13 @@ static int sgtl5000_probe(struct snd_soc_component *component)
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
@@ -1523,6 +1530,7 @@ static const struct snd_soc_component_driver sgtl5000_driver = {
 	.num_dapm_widgets	= ARRAY_SIZE(sgtl5000_dapm_widgets),
 	.dapm_routes		= sgtl5000_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(sgtl5000_dapm_routes),
+	.of_xlate_dai_id	= sgtl5000_of_xlate_dai_id,
 	.suspend_bias_off	= 1,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
