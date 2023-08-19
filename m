Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DA37827AF
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 13:15:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0334E846;
	Mon, 21 Aug 2023 13:14:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0334E846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692616525;
	bh=/vF/3YkGnuD53+vRgz3HYjkHsuQgGhStXpxy6aO86xs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dDjTd6Dd1a4EWZPepEarMI5lKz8fJi/kWo9OCpASqAIwrrLFfszQ8SA2MJriRExmM
	 JM1PC2wnZSFUlfDQfiUTwOUYVaKR7/KTgc+RZAW+6oIyS2BZMmgpIieiJYnx+5NZym
	 8/KyAtxYzmnEjf9YeLIv+yQ1hUMSPg78HlD3n0kA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B3F6F80605; Mon, 21 Aug 2023 13:12:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 204EAF805FF;
	Mon, 21 Aug 2023 13:12:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D9C5F801EB; Sat, 19 Aug 2023 15:34:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A2CFF8016A
	for <alsa-devel@alsa-project.org>; Sat, 19 Aug 2023 15:34:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A2CFF8016A
X-QQ-mid: bizesmtp85t1692452053tcp1i7aj
Received: from ubuntu.localdomain ( [58.251.166.13])
	by bizesmtp.qq.com (ESMTP) with
	id ; Sat, 19 Aug 2023 21:34:04 +0800 (CST)
X-QQ-SSF: 01400000000000106000000A0000000
X-QQ-FEAT: 2cOz1NCvlGOiGwoh0vNvreWhIxjT+LXdU+Tpljw+/B+vZQiHTx0NER5oG3359
	8AkIeJoy26siDTa2/1JwLQebgIpmxsFD02O8NSW+h4ghsDTWln3efwcatzoSIcV4NNM/eA8
	FmY0tesl56uZRLIIRLAaG1paph1Pci16/mXLMS3kKH7k7v5GLriSkDlClOHB+aW3ZZPXUDZ
	lqHkn3Y3y21+Gr6Vyjhaw97b1ZW51LQb91Qo7dZu6K3w1SfOGuWTTb+JJNQ/l4Eb01tIBKr
	dhOHQIk5LtyuKhq+UIUPRg0qrR5rKOHuJABY32d4vRCjszgdsEqRLToOlMmjCUJS1h2qvCT
	vEDXZ0iyXvghFCRxWRdUyx2a+46hFtZRzigist84+CAR7xKWQvjIcej352lpQ==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 15894462584696602267
From: Senhong Liu <liusenhong2022@email.szu.edu.cn>
To: oder_chiou@realtek.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Senhong Liu <liusenhong2022@email.szu.edu.cn>
Subject: [PATCH] sound/soc/codecs/rt5640.c: fix typos
Date: Sat, 19 Aug 2023 06:33:45 -0700
Message-Id: <20230819133345.39961-1-liusenhong2022@email.szu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:email.szu.edu.cn:qybglogicsvrsz:qybglogicsvrsz3a-1
X-MailFrom: liusenhong2022@email.szu.edu.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: T6VJ2WT7CY5T4VPL5M73KC6E4D5Y3Q7K
X-Message-ID-Hash: T6VJ2WT7CY5T4VPL5M73KC6E4D5Y3Q7K
X-Mailman-Approved-At: Mon, 21 Aug 2023 11:11:53 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T6VJ2WT7CY5T4VPL5M73KC6E4D5Y3Q7K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I noticed typos and i fixed them.

Signed-off-by: Senhong Liu <liusenhong2022@email.szu.edu.cn>
---
 sound/soc/codecs/rt5640.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 8920726c38e8..15e1a62b9e57 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2570,7 +2570,7 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 					IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
 					"rt5640", rt5640);
 	if (ret) {
-		dev_warn(component->dev, "Failed to reguest IRQ %d: %d\n", rt5640->irq, ret);
+		dev_warn(component->dev, "Failed to request IRQ %d: %d\n", rt5640->irq, ret);
 		rt5640_disable_jack_detect(component);
 		return;
 	}
@@ -2625,7 +2625,7 @@ static void rt5640_enable_hda_jack_detect(
 					NULL, rt5640_irq, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 					"rt5640", rt5640);
 	if (ret) {
-		dev_warn(component->dev, "Failed to reguest IRQ %d: %d\n", rt5640->irq, ret);
+		dev_warn(component->dev, "Failed to request IRQ %d: %d\n", rt5640->irq, ret);
 		rt5640->irq = -ENXIO;
 		return;
 	}
-- 
2.25.1

