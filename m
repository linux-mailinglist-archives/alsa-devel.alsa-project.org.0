Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ECE88ED1B
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 18:50:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DC832C50;
	Wed, 27 Mar 2024 18:50:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DC832C50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711561829;
	bh=uncORd5JNkMto1wvYsp5uFKclG6jNyHzUan8WYXHy4I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DGxy+kD2al+UXFWvTanj9/YztgC97+z3QjGR5x61YlU6iJPpQteinAjKW3K+Lehvo
	 QGjHIK1Zr+fTQTxt5vawVLvC9V/lporKCdyJYBygyIjczEWKTGwgUqm11+E9/Q5sNJ
	 KB+u7186CNkB2KNVnwxsUd+aQGWfSa5McaipoX9Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E782F80C81; Wed, 27 Mar 2024 18:46:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56133F80C7C;
	Wed, 27 Mar 2024 18:46:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF51BF808CA; Wed, 27 Mar 2024 18:46:16 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 08E31F805DA
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 18:46:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08E31F805DA
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E8260615C5;
	Wed, 27 Mar 2024 17:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9653C433C7;
	Wed, 27 Mar 2024 17:46:08 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 18:44:52 +0100
Subject: [PATCH 17/18] ASoC: rt722-sdca-sdw: drop driver owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-var-v1-17-86d5002ba6dc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=715;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=uncORd5JNkMto1wvYsp5uFKclG6jNyHzUan8WYXHy4I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBFsadS3wi1WrHbkhJXG2AV3h9JRePr5dAxdsy
 DpzFSNfs7CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgRbGgAKCRDBN2bmhouD
 1+LzD/9qPTq1yvC9/lin/tofr7th9r+mHk83nsDng8HZFgb4Y4fMddURyNZZDOUUCXuWEVvkxAh
 zuXThKzVXfN1V/JTgJhDRL5MV23YJD0kfgZB8kzw00nQFTVufI3G1XsCYeGxLgktv1Lon7D+iSa
 YAhg76vxGiP2cA49T5RCdZ1vdxgdZlbs6nwO1sPOcWA6Hw7ZrWHw+zU2l66DIqqBCnCJJvxulzl
 S5RIGpFvB/IXmogQRPE/drbvyTYTxmv9qC+kn7G0nJTonNjUkKZwpCNq7jxkbZplONwR70eG+uU
 MXZsRceRzxV7Cujsj74+xgrGylgHupPGheN363NMtoIWjfM33IwOhugmkUD6TNU0YkU7zJW8l2H
 LmDzkjOH5ccRQCzGMlHt7AgRpKpYmKvTvt61nolV2drrBWBxl9IGenljCDrS+XhD2VplfECCjc9
 3GrN3HppMRp6n9a0pshxwgpitiXFfQWPO5b8Y8XnpTsWzS2hRg+4m92qCIyaG8j3jYpnOnWi0eA
 SQfKnrRslaD8wb0TMWz93NGW4FnMjNRd6vtoPKjGKuSOG2CUiEfYvZSRiDQJdMuMsbMUsV3B8h4
 qtOJcCJhFB+AOv9bHlA3chMXRL3PgLohrqheUIPnxQp8hY/Xd9uHMn3n3sKIYXYQd8WhRX8ZR7A
 Wt7bzkgX8Am6hww==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: ZWEJTYBPANKEMAZC7CBVUENLWOG2Y4RL
X-Message-ID-Hash: ZWEJTYBPANKEMAZC7CBVUENLWOG2Y4RL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZWEJTYBPANKEMAZC7CBVUENLWOG2Y4RL/>
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
 sound/soc/codecs/rt722-sdca-sdw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index eb76f4c675b6..27af5f883c08 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -503,7 +503,6 @@ static const struct dev_pm_ops rt722_sdca_pm = {
 static struct sdw_driver rt722_sdca_sdw_driver = {
 	.driver = {
 		.name = "rt722-sdca",
-		.owner = THIS_MODULE,
 		.pm = &rt722_sdca_pm,
 	},
 	.probe = rt722_sdca_sdw_probe,

-- 
2.34.1

