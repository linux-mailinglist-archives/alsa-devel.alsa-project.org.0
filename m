Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0BA88ED02
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 18:48:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 711602C6D;
	Wed, 27 Mar 2024 18:47:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 711602C6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711561681;
	bh=xqM9vP1VJHR2BFUAj6MK07/WTjMfbro87cfmmhnNNBk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dgXKTdimgU94dgpWPoBotNZQw5n4JFdyDu2Ja1ko9qD21sDtKDzSZne0Wdsx4wmjm
	 zOA5jhLik7cFSfTz+XhdzlS3J61Pk0/mNwsCvG0StwTJwzVfplO5ACnnjEjmXKCa5k
	 QtO4ZnmNAVEnvtrNYgh6CA4LhZqMDCcGZrHAweLQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 478FCF806DE; Wed, 27 Mar 2024 18:45:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4773EF806D5;
	Wed, 27 Mar 2024 18:45:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5912F806BC; Wed, 27 Mar 2024 18:45:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0CE21F80580
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 18:45:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CE21F80580
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EE8F6CE2381;
	Wed, 27 Mar 2024 17:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBDDAC433F1;
	Wed, 27 Mar 2024 17:45:32 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 18:44:43 +0100
Subject: [PATCH 08/18] ASoC: rt1318-sdw: drop driver owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-var-v1-8-86d5002ba6dc@linaro.org>
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
 bh=xqM9vP1VJHR2BFUAj6MK07/WTjMfbro87cfmmhnNNBk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBFsSYkrTHKw2fBYlI0MInx0eJovTwEM7qBMMi
 hOXKl30YaSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgRbEgAKCRDBN2bmhouD
 12WhD/4hmAR7bXtQiW7Hybn+lzjpebsx+efT5znGNAWlpYHdAYDV8laHm5xpB0XwQcRTlWcD16+
 gHWk8oBTivl/W1ABNvAc0pFeId/CKmywAm5hoUAyrkQLTcAoaSU9zm0e/N2hQxhshsrgv3RELWJ
 BeuftVagQ+8gKeAI6YRlbvhVGgwwgoZuSK8Kdfo6cthwBRc/Tq8G8gyj6coVnOQOW8Q+w9pyPw7
 zhB4c4nzbymPKwgMb6o95VyLZEvUIayS6gcZfSCZcEGqXbqXq+pYwo/fJ7pWjb1vHNsbAUUjaY8
 +2bqZqf/khMlhIXgJ8VAm0kLHzCNp9Jc9HWnCngbH0lS/NfaJFWceLV+GXZ4OQTUQhvguVt8aEo
 U0xkkKXBdAqNvDUDWEuK+DJcZhzWhShkcdjVBEJEeYNMoOgUI/pGmy765+naSCTSaDwPJwyccIg
 V0nQLbr0LvGjrysaRQEJHMBXMqFcjgcAUrS7vgNtgRlV1L8K34Qq1VCu52+emzp29rJbr17jgYw
 Su+9Cv3/bUawNKA5etpjoWFoC98KEtba3Ay7zg1tTm3Cu+QR6u95NX3FpXNofPAaBz9znXF6eZV
 p+DuQpFA8EcVyoxHXDSo4sCqWfdhTuasKsMj8QDFN9u6szxSjm0+540oZieVqCNPxVC6EPvIMXd
 cDpOtWhNq8Ooncw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: QIIYVODNAMIRTDRGFGOLOA3WVCYLMJKN
X-Message-ID-Hash: QIIYVODNAMIRTDRGFGOLOA3WVCYLMJKN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QIIYVODNAMIRTDRGFGOLOA3WVCYLMJKN/>
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
 sound/soc/codecs/rt1318-sdw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt1318-sdw.c b/sound/soc/codecs/rt1318-sdw.c
index ff364bde4a08..3f6c7c25967f 100644
--- a/sound/soc/codecs/rt1318-sdw.c
+++ b/sound/soc/codecs/rt1318-sdw.c
@@ -855,7 +855,6 @@ static const struct dev_pm_ops rt1318_pm = {
 static struct sdw_driver rt1318_sdw_driver = {
 	.driver = {
 		.name = "rt1318-sdca",
-		.owner = THIS_MODULE,
 		.pm = &rt1318_pm,
 	},
 	.probe = rt1318_sdw_probe,

-- 
2.34.1

