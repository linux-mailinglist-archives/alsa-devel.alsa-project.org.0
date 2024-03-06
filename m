Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9760877042
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 11:15:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0993EDEE;
	Sat,  9 Mar 2024 11:15:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0993EDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709979347;
	bh=o7h8D68XuKpUbWhzQ5giwG7GjdYbrQMBGY5wZ3X+bbk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uA+Kkpjh+6T2D0g8ViPZIAnzPnAr+LysRuyrSVjjKMmVdVv4k0qyIZ476ISB3zMRK
	 Ie6ebI/5entxZqmoAXAENWqvMvJfvsJ+4JevufLYtCxWhbnprezRayg7sM9SLM4rT2
	 tMlt0WvoXwZV91I5GQS98SPbZBnGZBh0IhVSgNe4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFDEEF806D0; Sat,  9 Mar 2024 11:13:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 080F4F806D5;
	Sat,  9 Mar 2024 11:13:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A4DDF8024E; Wed,  6 Mar 2024 02:35:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail78-37.sinamail.sina.com.cn (mail78-37.sinamail.sina.com.cn
 [219.142.78.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5635DF8014B
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 02:34:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5635DF8014B
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.232.53.71])
	by sina.net (10.75.30.235) with ESMTP
	id 65E7C81800003DE4; Wed, 6 Mar 2024 09:34:19 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 304AC0D7CD594CE48FF1DD5CB581F46B
X-SMAIL-UIID: 304AC0D7CD594CE48FF1DD5CB581F46B-20240306-093419
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH v1 1/2] ASoC: codecs: ES8326: Changing members of private
 structure
Date: Wed,  6 Mar 2024 09:34:13 +0800
Message-Id: <20240306013414.18708-2-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240306013414.18708-1-zhangyi@everest-semi.com>
References: <20240306013414.18708-1-zhangyi@everest-semi.com>
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PEPWUO5VH5K3ABWVBR5WHBD7WQ4AOGKY
X-Message-ID-Hash: PEPWUO5VH5K3ABWVBR5WHBD7WQ4AOGKY
X-Mailman-Approved-At: Sat, 09 Mar 2024 10:10:52 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PEPWUO5VH5K3ABWVBR5WHBD7WQ4AOGKY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We don't use mic1_src and mic2_src.so we delete these two members.
We changed the default value of interrupt-clk for headphone detection

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 608862aebd71..15289dadafea 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -31,8 +31,6 @@ struct es8326_priv {
 	 * while enabling or disabling or during an irq.
 	 */
 	struct mutex lock;
-	u8 mic1_src;
-	u8 mic2_src;
 	u8 jack_pol;
 	u8 interrupt_src;
 	u8 interrupt_clk;
@@ -1092,20 +1090,6 @@ static int es8326_probe(struct snd_soc_component *component)
 	es8326->jd_inverted = device_property_read_bool(component->dev,
 							"everest,jack-detect-inverted");
 
-	ret = device_property_read_u8(component->dev, "everest,mic1-src", &es8326->mic1_src);
-	if (ret != 0) {
-		dev_dbg(component->dev, "mic1-src return %d", ret);
-		es8326->mic1_src = ES8326_ADC_AMIC;
-	}
-	dev_dbg(component->dev, "mic1-src %x", es8326->mic1_src);
-
-	ret = device_property_read_u8(component->dev, "everest,mic2-src", &es8326->mic2_src);
-	if (ret != 0) {
-		dev_dbg(component->dev, "mic2-src return %d", ret);
-		es8326->mic2_src = ES8326_ADC_DMIC;
-	}
-	dev_dbg(component->dev, "mic2-src %x", es8326->mic2_src);
-
 	ret = device_property_read_u8(component->dev, "everest,jack-pol", &es8326->jack_pol);
 	if (ret != 0) {
 		dev_dbg(component->dev, "jack-pol return %d", ret);
@@ -1125,7 +1109,7 @@ static int es8326_probe(struct snd_soc_component *component)
 				      &es8326->interrupt_clk);
 	if (ret != 0) {
 		dev_dbg(component->dev, "interrupt-clk return %d", ret);
-		es8326->interrupt_clk = 0x45;
+		es8326->interrupt_clk = 0x00;
 	}
 	dev_dbg(component->dev, "interrupt-clk %x", es8326->interrupt_clk);
 
-- 
2.17.1

