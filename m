Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DBF88ED08
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 18:48:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 914E92C5D;
	Wed, 27 Mar 2024 18:48:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 914E92C5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711561714;
	bh=KL4jt68dyLoz5Jj2lJbz+/X5KvIPUwwpNhz1K0iZi1I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L1HDCYUgztjz+hwiHbweJF8hD6xBxd1o4g2/bUtq7fqPuG62x+OmrfQX2e+CG6HgV
	 aFcMfszIfOo6N+M6ppSK52Na3Q9af0UA5K4M5CRK11NbJpwcdb9s3YSvQv8RmjJXic
	 Jde9DbBtKxwbY03S8fWC+k3adkxQW0dii0v7rBak=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 941FCF80718; Wed, 27 Mar 2024 18:45:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 241AFF80713;
	Wed, 27 Mar 2024 18:45:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA20AF806FA; Wed, 27 Mar 2024 18:45:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFAAEF806A6
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 18:45:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFAAEF806A6
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 43378CE2534;
	Wed, 27 Mar 2024 17:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57AB4C433F1;
	Wed, 27 Mar 2024 17:45:40 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 18:44:45 +0100
Subject: [PATCH 10/18] ASoC: rt700-sdw: drop driver owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-var-v1-10-86d5002ba6dc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=665;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=KL4jt68dyLoz5Jj2lJbz+/X5KvIPUwwpNhz1K0iZi1I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBFsUNjYC5MuUVHhQ/+ANue0jk3x+i4CaxVwsI
 pOJhe1W3Z6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgRbFAAKCRDBN2bmhouD
 1ygyD/9nngr87hzxXL+Ps9b2ZzJR+TXj/YoGldLxc+zzI40VIXOq/CMkZQSkOy+sGlvlDaMbC6G
 OUxOZSgGVyJSYrQPPoOkZvdRZQlA2pGVRlmZmen85mvsnNXa02J3ia3Klj4R9st1aTP0MGDW1lx
 9CcEEW3TSqnV/k8+3049Q1QTi7j8w7NRzcz5ZWPNQALST/uIREYVg58HLPorDZB4NpdTvr3PNGu
 AxjgkLhqFKTEwtZwEkeyoAU2gulMVPDtYmhFcAj/XvdVV8AlOcDK/JiU2dNgtTmtDQeAH/E4O/E
 RunnOltI2NeNhYQuUQowcskuBrM3nFna57XN6QldWpiZ9U8NNyO1LWHLplrjvWdzr7r5qJO0Xwv
 lZz4s/FAAQ0XP7oSi2CSN+C400Xrx/9worZYiop6HEnoAFSMmmQXYq2L891hVliC/Hdr9abq/O7
 x+9wDTaaNl4MSFiYRF8RcDM66RzKwPHrrq8NVpRQxUy6KVxvxJygvMsYmKjABRSfp2oWxs/msQp
 Qj6wC5ftBnUeDUWc2EhFOF0FQ4N0LYLgkHlYfy16j/rWBBXtSGb/RpPh2v26gK2+ivlct89+f+Z
 mZ2XIRFghFGsojn1n7ThUxn7/DMTnaWIfk4VeteE5JMk3COSDqpRmSFB1j6xrlwU+je7T6TZgnB
 B2q9qvtV2XZQVuQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: V3CIEJVHSKXVURZJ6FAQDZNLFRPHZTJW
X-Message-ID-Hash: V3CIEJVHSKXVURZJ6FAQDZNLFRPHZTJW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V3CIEJVHSKXVURZJ6FAQDZNLFRPHZTJW/>
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
 sound/soc/codecs/rt700-sdw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 52c33d56b143..24cb895b759f 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -558,7 +558,6 @@ static const struct dev_pm_ops rt700_pm = {
 static struct sdw_driver rt700_sdw_driver = {
 	.driver = {
 		.name = "rt700",
-		.owner = THIS_MODULE,
 		.pm = &rt700_pm,
 	},
 	.probe = rt700_sdw_probe,

-- 
2.34.1

