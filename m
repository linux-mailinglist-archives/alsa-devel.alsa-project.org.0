Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FA8324FD2
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 13:22:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2C7E167E;
	Thu, 25 Feb 2021 13:21:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2C7E167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614255749;
	bh=arxq2M/NFIhShvN2HCvVjYMYjSdImztX7Dwu+k1EjH0=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oY/b1fUAOTSkwvGIRSM34GUem1XsFt70fuAhB/rBJqLroDtCo/vQ6479/pY3glUx+
	 J6hHZQv0JmaTfNB12PC5U995/JXU8sDo6c+JbmVM4ViX5mPZ5GKzmsfZnoXloTpyAe
	 EwEm5jqWdU+MJdko4/hp3uPrZlqDbbK4k/I8jt5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4258FF8016D;
	Thu, 25 Feb 2021 13:20:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFF84F8016A; Thu, 25 Feb 2021 13:20:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD820F800E4
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 13:20:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD820F800E4
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 96293200C0F;
 Thu, 25 Feb 2021 13:20:48 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 51FFD200C38;
 Thu, 25 Feb 2021 13:20:43 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 97A4340291;
 Thu, 25 Feb 2021 13:20:36 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, stephan@gerhold.net,
 guennadi.liakhovetski@linux.intel.com, kai.vehmanen@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: simple-card: Add dummy dai support simple sound card
Date: Thu, 25 Feb 2021 20:08:32 +0800
Message-Id: <1614254912-15746-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

If sound card doesn't need specific codec device, just
dummy codec is enough, then we can link the dummy component
directly.

In this case, user needs to specify below setting in
devicetree. Previously the sound-dai is a node of codec,
now we check if it is zero before parsing the node, zero
means dummy component is specified.

	simple-audio-card,codec {
		sound-dai = <0>;
	};

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/generic/simple-card.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index c262281bc64d..8b0cabd1bad1 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -34,10 +34,19 @@ static int asoc_simple_parse_dai(struct device_node *node,
 {
 	struct of_phandle_args args;
 	int ret;
+	u32 val;
 
 	if (!node)
 		return 0;
 
+	ret = of_property_read_u32(node, DAI, &val);
+	if (val == 0) {
+		dlc->of_node       = NULL;
+		dlc->dai_name      = "snd-soc-dummy-dai";
+		dlc->name          = "snd-soc-dummy";
+		return 0;
+	}
+
 	/*
 	 * Get node via "sound-dai = <&phandle port>"
 	 * it will be used as xxx_of_node on soc_bind_dai_link()
-- 
2.27.0

