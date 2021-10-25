Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F08A439458
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 12:57:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2F2616C2;
	Mon, 25 Oct 2021 12:56:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2F2616C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635159445;
	bh=+GibxD65kxqeak7XGap8yaes3EbV0W9X4mV2l9Pf+lA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vECrUz8KEhDyyF1zss2CO/H42A2inep9rf2dlEXlmXb7g8uG2Kc//Wqcu4AQSLIi5
	 UC1eKJ7uPCgIo/VRUgPbLaLt/MFlqH49VhlQ36pjxHIoQpNi42jvxSJNx/P3ERrDEO
	 92hsYy2xlfeP5QZzD1L/eiGnSzCQk9fuvhooYqDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C8F3F8025A;
	Mon, 25 Oct 2021 12:56:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E6FFF8025E; Mon, 25 Oct 2021 12:56:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3159DF8025A
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 12:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3159DF8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="jC6PXIMs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1635159385;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=M+4c2L2vAIpcdfthEx/N20cjRr9gk8jEqqXSEKtngAo=;
 b=jC6PXIMsN4Cud0C+QUmx7H7k5Tgp87blcN4N9hDCUdSvF/iP36sXjBRZE+jkQZWbYg
 pJ81BZ430Z5rO+f6WYBrFTSRhEq3Dqh4otjSI2zvvhCwMRvkgHPAHbOcjoEWoUL+n1FM
 YwkkxwC53F5Xeaj8JXlZV1AdWjapV/PUHiFEy+gQn/aobBAWLLp/MWd7o0oFYOC3nFS3
 +r+aHuQ3Iv29yBZtGR2uTDFVRD8pKciQfND+HxFgrVwQDbosSY3QDV8orFeJyVmpXTHq
 4l69OeWANdp0jRplBCHYcwon1sfkMEQV5X3sPKK0l7TDZbMTYo6V4eV2caVCe2KGUTcQ
 JjdQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL2YPaQ"
X-RZG-CLASS-ID: mo00
Received: from droid.. by smtp.strato.de (RZmta 47.33.8 AUTH)
 with ESMTPSA id 301038x9PAuP8Zp
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 25 Oct 2021 12:56:25 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: qcom: common: Respect status = "disabled" on DAI link
 nodes
Date: Mon, 25 Oct 2021 12:55:03 +0200
Message-Id: <20211025105503.49444-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Stephan Gerhold <stephan@gerhold.net>
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

At the moment, the DAI link nodes in the device tree always have to be
specified completely in each device tree. However, the available
interfaces (e.g. Primary/Secondary/Tertiary/Quaternary MI2S) are common
for all devices of a SoC, so the majority of the definitions can be
placed in a common device tree include to reduce boilerplate.

Make it possible to define such stubs in device tree includes by
respecting the "status" property for the DAI link nodes. This is
a trivial change that just requires switching to the _available_
OF functions that check the "status" property additionally.

This allows defining a stub like:

	sound_dai_quaternary: dai-link-quaternary {
		link-name = "Quaternary MI2S";
		status = "disabled"; /* Needs extra codec configuration */
		cpu {
			sound-dai = <&q6afedai QUATERNARY_MI2S_RX>;
		};
		platform {
			sound-dai = <&q6routing>;
		};
	};

where the codec would be filled in by the device-specific device tree.

For existing device trees this change does not make any difference.
A missing "status" property is treated like status = "okay".

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/qcom/common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 09af00700700..2e1c618f7529 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -44,7 +44,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 		return ret;
 
 	/* Populate links */
-	num_links = of_get_child_count(dev->of_node);
+	num_links = of_get_available_child_count(dev->of_node);
 
 	/* Allocate the DAI link array */
 	card->dai_link = devm_kcalloc(dev, num_links, sizeof(*link), GFP_KERNEL);
@@ -54,7 +54,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 	card->num_links = num_links;
 	link = card->dai_link;
 
-	for_each_child_of_node(dev->of_node, np) {
+	for_each_available_child_of_node(dev->of_node, np) {
 		dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
 		if (!dlc) {
 			ret = -ENOMEM;
-- 
2.33.1

