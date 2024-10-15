Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CA89A5E49
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2024 10:13:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B7ECE76;
	Mon, 21 Oct 2024 10:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B7ECE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729498405;
	bh=ERi7IPOprRx59JXhjMC3xTcDaqfRPPR8xmHcnPlE138=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=l0PujweA2va2iYnhCko69uAcb+nBs9pgKLwW12ZgGoYWK2HSEug9mDfUc33VG5FGu
	 LsPKK/sdBxflmWsC9VxOfRE7BS0RYNlrW5CxZ9QCWtHyh+WPUNuf+uVfSmDw1LLfSO
	 snXxLbsiTWFlz9YMZzVZaiYm1Bj3036qFBY2Apxs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 906D8F805D4; Mon, 21 Oct 2024 10:12:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DDCBF805CA;
	Mon, 21 Oct 2024 10:12:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29325F80448; Tue, 15 Oct 2024 09:49:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from cmccmta1.chinamobile.com (cmccmta8.chinamobile.com
 [111.22.67.151])
	by alsa1.perex.cz (Postfix) with ESMTP id E429DF8016B
	for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2024 09:49:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E429DF8016B
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee2670e1e93845-5785a;
	Tue, 15 Oct 2024 15:49:40 +0800 (CST)
X-RM-TRANSID: 2ee2670e1e93845-5785a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.103])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee7670e1e93b5a-f518e;
	Tue, 15 Oct 2024 15:49:40 +0800 (CST)
X-RM-TRANSID: 2ee7670e1e93b5a-f518e
From: Liu Jing <liujing@cmss.chinamobile.com>
To: peter.ujfalusi@gmail.com
Cc: jarkko.nikula@bitmer.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Jing <liujing@cmss.chinamobile.com>
Subject: [PATCH] Use card->dev in replace of the &pdev->dev argument in the
 dev_err function
Date: Tue, 15 Oct 2024 15:49:38 +0800
Message-Id: <20241015074938.6247-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: liujing@cmss.chinamobile.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XX33B5OZWLLDWI2Y4UBCVKVJEUI7CXHQ
X-Message-ID-Hash: XX33B5OZWLLDWI2Y4UBCVKVJEUI7CXHQ
X-Mailman-Approved-At: Mon, 21 Oct 2024 08:12:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XX33B5OZWLLDWI2Y4UBCVKVJEUI7CXHQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Because card->dev = &pdev->dev is already defined in the rx51_soc_probe function,
and then &pdev->dev is still used.

Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
---
 sound/soc/ti/rx51.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/ti/rx51.c b/sound/soc/ti/rx51.c
index 77296237575a..d9900c69e536 100644
--- a/sound/soc/ti/rx51.c
+++ b/sound/soc/ti/rx51.c
@@ -371,7 +371,7 @@ static int rx51_soc_probe(struct platform_device *pdev)
 
 		dai_node = of_parse_phandle(np, "nokia,cpu-dai", 0);
 		if (!dai_node) {
-			dev_err(&pdev->dev, "McBSP node is not provided\n");
+			dev_err(card->dev, "McBSP node is not provided\n");
 			return -EINVAL;
 		}
 		rx51_dai[0].cpus->dai_name = NULL;
@@ -381,7 +381,7 @@ static int rx51_soc_probe(struct platform_device *pdev)
 
 		dai_node = of_parse_phandle(np, "nokia,audio-codec", 0);
 		if (!dai_node) {
-			dev_err(&pdev->dev, "Codec node is not provided\n");
+			dev_err(card->dev, "Codec node is not provided\n");
 			return -EINVAL;
 		}
 		rx51_dai[0].codecs->name = NULL;
@@ -389,7 +389,7 @@ static int rx51_soc_probe(struct platform_device *pdev)
 
 		dai_node = of_parse_phandle(np, "nokia,audio-codec", 1);
 		if (!dai_node) {
-			dev_err(&pdev->dev, "Auxiliary Codec node is not provided\n");
+			dev_err(card->dev, "Auxiliary Codec node is not provided\n");
 			return -EINVAL;
 		}
 		rx51_aux_dev[0].dlc.name = NULL;
@@ -399,7 +399,7 @@ static int rx51_soc_probe(struct platform_device *pdev)
 
 		dai_node = of_parse_phandle(np, "nokia,headphone-amplifier", 0);
 		if (!dai_node) {
-			dev_err(&pdev->dev, "Headphone amplifier node is not provided\n");
+			dev_err(card->dev, "Headphone amplifier node is not provided\n");
 			return -EINVAL;
 		}
 		rx51_aux_dev[1].dlc.name = NULL;
@@ -408,7 +408,7 @@ static int rx51_soc_probe(struct platform_device *pdev)
 		rx51_codec_conf[1].dlc.of_node = dai_node;
 	}
 
-	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	pdata = devm_kzalloc(card->dev, sizeof(*pdata), GFP_KERNEL);
 	if (pdata == NULL)
 		return -ENOMEM;
 
@@ -439,7 +439,7 @@ static int rx51_soc_probe(struct platform_device *pdev)
 
 	err = devm_snd_soc_register_card(card->dev, card);
 	if (err) {
-		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", err);
+		dev_err(card->dev, "snd_soc_register_card failed (%d)\n", err);
 		return err;
 	}
 
-- 
2.27.0



