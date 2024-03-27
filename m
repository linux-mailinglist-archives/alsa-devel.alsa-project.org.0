Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CC288ED00
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 18:47:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D4372C16;
	Wed, 27 Mar 2024 18:47:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D4372C16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711561663;
	bh=j+ijhU8mAneZ/JkPOO+eFUwH/BeIq4liy8ltCrh9mjA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f8VAhrrMLtUfktL98xeI2NIUwSQPS0ojdl3YG6SGQKdDCQ9crfINRbBsBD3b3Ylf7
	 GsrDQMK4kpeVfKXsaMPneo4Up4/Vu9tOfkSqXY1mDnr+NjyzhJSTGzyE8BXO4taRLx
	 L6f73vOrDLmA7Whm1eFTI+rB+5wfP5FjeGKoTDv4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72330F806BF; Wed, 27 Mar 2024 18:45:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99301F806BD;
	Wed, 27 Mar 2024 18:45:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65655F80631; Wed, 27 Mar 2024 18:45:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B156DF80631
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 18:45:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B156DF80631
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92E1C615E0;
	Wed, 27 Mar 2024 17:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D47C433F1;
	Wed, 27 Mar 2024 17:45:28 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 18:44:42 +0100
Subject: [PATCH 07/18] ASoC: rt1316-sdw: drop driver owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-var-v1-7-86d5002ba6dc@linaro.org>
References: <20240327-module-owner-var-v1-0-86d5002ba6dc@linaro.org>
In-Reply-To: <20240327-module-owner-var-v1-0-86d5002ba6dc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Oder Chiou <oder_chiou@realtek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=680;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=j+ijhU8mAneZ/JkPOO+eFUwH/BeIq4liy8ltCrh9mjA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBFsRMorQIOM3VuwOd4PSabUGLAoXhTw/Hzyap
 n/PNNnJ/PeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgRbEQAKCRDBN2bmhouD
 1zvcD/0UeblMnBxCl19QpNIuLK7h3Hux8vdKgc81hXo3ms6iW6DX1122BQegkV2r9biGGJuJtp6
 cFx3LwZQM+nCpvEFubRUzoPyRS3jvMkkPaDwx1mJdNVt/5Yo0RnVifVRPnPb4g6qVUUtd4FY9FM
 a2+r5jmxHsUi0+ZShA9bCXsnXCXK8YX2XKGOPmkruNKwUhg/Mb+t6bp/2/U5hs1BDkVjZTLu+ZE
 I8b/7m/cwqazYCox2y8WoG7Rk6N5LCKo+AA7KT0hyJ4KCTfF8zI3k7mJet1UYeVFlkRTJuqoPm5
 fM+PguAtvVAxCa02n6k8tY9iXbrcI45H8e2ER7R3yaVKnP6SKqJ+Qvn9lm2Vbrqos3qQ1X34mto
 SNbV/w9gYWCxy3EnXyw/zoAPUIG3feIgA9zbmeq9C0f81332tDz6S0uVrp74envwPZH2OvOjzuM
 AU87cxk2akwLUA1yOjjNThfHrDq4dI+c7rcu1J5LGRXyfztmEo1vtujlU0UBrt/pokAYI6I/rZW
 UGDbFAE/d4btL/8BuuAQEK5HjUBifSmc0P/51HOKk1BUTRgKfcJNA3PKNKzrcdIsfM6RFmGbMFE
 xEz68MDdsLMVG1dIRILZ2zpuxadqvw2jinSm3mXPPvt7u2iqEBXNGmGeN9JQJeoI2ixjPhXb7dp
 1GJcV2YFOTgT1pg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: TATDLCOROCD6FMXCUDCRPBN5BWMDPICY
X-Message-ID-Hash: TATDLCOROCD6FMXCUDCRPBN5BWMDPICY
X-MailFrom: SRS0=G+Mr=LB=linaro.org=krzysztof.kozlowski@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TATDLCOROCD6FMXCUDCRPBN5BWMDPICY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Core in sdw_register_driver() already sets the .owner, so driver does
not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/rt1316-sdw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 47511f70119a..aa7c0ca66877 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -781,7 +781,6 @@ static const struct dev_pm_ops rt1316_pm = {
 static struct sdw_driver rt1316_sdw_driver = {
 	.driver = {
 		.name = "rt1316-sdca",
-		.owner = THIS_MODULE,
 		.pm = &rt1316_pm,
 	},
 	.probe = rt1316_sdw_probe,

-- 
2.34.1

