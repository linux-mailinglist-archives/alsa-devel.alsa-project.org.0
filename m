Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A85CE498AF
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 07:29:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE57616FA;
	Tue, 18 Jun 2019 07:28:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE57616FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560835766;
	bh=o7OIJn0kzrFvgdJNsrkpD3N+Zcc1TiZyUiuSTemeEAM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Mytiroz42pj2mpzLh8te6T5dok5cWhVMcnhPJH5uc5jbIpPhMZ3FscE2w8D+fu+JI
	 3EYh+iWBM5CIFfM5X4e+LS5w8NdCEmy1QP2cMNPVcvdqrEAlv7uvEPCSsoV5oFexl4
	 fHJYg0oXBzBPIwVgJeEGWak/5SypqPyaUfrrnbO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64D1AF8971C;
	Tue, 18 Jun 2019 07:28:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54BAFF8971C; Tue, 18 Jun 2019 07:28:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37BE8F8075C
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 07:28:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37BE8F8075C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VuEodqM3"
Received: by mail-pg1-x543.google.com with SMTP id w10so2372747pgj.7
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 22:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=SqAd1fx2aqjUroAge2OaNB4tSLlvMkP+JhWERXOSN8Y=;
 b=VuEodqM3GEhgspN5BcSZBejRWyu1yfMzsvbt/tZcCt5AtPf01DDmMcr/YxPt5la51Y
 eAazo1sgyFm7hHAzmylz7IJwsHgTOpM5k1si7TJ3FbDsRl6PPeJHejJL0OEIt4gS1GKH
 jR0XlMVF4O6H8x0vXenyxoUWmPaZQPyQb/Q46CfiDuoDd4AejRu2OH2TcvcoLt1KVvXz
 hUTwDSqW+gWtikzfUEbdnp2rkDshNdXzeKLjxt1jXI6h6gfIJ88g9KwpGLNLUDwgO1Hu
 R3Dd1X0fhutxGN+CDAGj/KHsrlAQKUqMMf725VQBhO+S4DbDoMz4CoqO6L9Amo24rp2K
 RHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=SqAd1fx2aqjUroAge2OaNB4tSLlvMkP+JhWERXOSN8Y=;
 b=qDb/DEgIHOobVQMEiVrkOC985IHZzVDAu4I74zJWSWNW1GLUyqZY/0y9A5hM0r79wB
 ThgkoStnj09kRdO1at+a1jo87p0mJ7MWVWLVIfUObdPKW3GnHdhPubMSLqRI9u0yhk2T
 NcL23a2JupdQAHFZOyCcWO5/lXX4j7Rl/sQQBASEoYqpDckaJHmjF8jc1nKMUCQnqAnx
 TQ7vdpUTe5ZhUCDXFDfsaHqmxZbFJ5cp/wQiWknp/+JbJlFtVAnApiZhboQuBfvZ95zv
 Ri3ZIBd8gr+m/RX7x7czy/LdB6SjmQbzy3oBeZN0tbplX75yPDLv6qWEvBRdYUYD96mT
 pdeg==
X-Gm-Message-State: APjAAAXJMFTWv4MBky8X9BlBLpvKaCeH7t8mAQzvxhlEG2bA+W+NEQxT
 SSybo9Xfv/GjL/GGEQXbT83WQw==
X-Google-Smtp-Source: APXvYqz4ODTWIjG3AqGUUeq6vsPQMClqM7BcnsAUOQ3cPzIUXZ5ipOaid/o/JhY/P+BpjDaxGb6eZQ==
X-Received: by 2002:a63:4a1f:: with SMTP id x31mr972877pga.150.1560835696219; 
 Mon, 17 Jun 2019 22:28:16 -0700 (PDT)
Received: from localhost.localdomain
 (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id 188sm13934085pfg.11.2019.06.17.22.28.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 22:28:15 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Patrick Lai <plai@codeaurora.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Jun 2019 22:28:13 -0700
Message-Id: <20190618052813.32523-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: qcom: common: Fix NULL pointer in of
	parser
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

A snd_soc_dai_link_component is allocated and associated with the first
link, so when the code tries to assign the of_node of the second link's
"cpu" member it dereferences a NULL pointer.

Fix this by moving the allocation and assignement of
snd_soc_dai_link_components into the loop, giving us one pair per link.

Fixes: 1e36ea360ab9 ("ASoC: qcom: common: use modern dai_link style")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 sound/soc/qcom/common.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index c7a878507220..97488b5cc515 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -42,17 +42,17 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 	card->num_links = num_links;
 	link = card->dai_link;
 
-	dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
-	if (!dlc)
-		return -ENOMEM;
+	for_each_child_of_node(dev->of_node, np) {
+		dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
+		if (!dlc)
+			return -ENOMEM;
 
-	link->cpus	= &dlc[0];
-	link->platforms	= &dlc[1];
+		link->cpus	= &dlc[0];
+		link->platforms	= &dlc[1];
 
-	link->num_cpus		= 1;
-	link->num_platforms	= 1;
+		link->num_cpus		= 1;
+		link->num_platforms	= 1;
 
-	for_each_child_of_node(dev->of_node, np) {
 		cpu = of_get_child_by_name(np, "cpu");
 		platform = of_get_child_by_name(np, "platform");
 		codec = of_get_child_by_name(np, "codec");
-- 
2.18.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
