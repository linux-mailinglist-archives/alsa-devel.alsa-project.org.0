Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB8E88ED1D
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 18:50:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65F5F2C56;
	Wed, 27 Mar 2024 18:50:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65F5F2C56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711561840;
	bh=TPIwJyHJ+747cO/ACTo9CUsEqoc7Fc18IjkZxXaUALs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nPDNOrzdzQQKnZ/G7vWhvZupnraBmvu4B+/kwpxSILlVB/aNzjo3iNgYl7pMsjMaN
	 QHI/UYURfE/oIJFtuHsnjcuxvtaAHYA9GF/e2Waz4k/HiicyXlg095VNraHLCwyYPD
	 gfTmynCuEs5yTaJ56jMrU7UHvds2iF13IZuds/nQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C499AF80CB4; Wed, 27 Mar 2024 18:46:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4517AF80608;
	Wed, 27 Mar 2024 18:46:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9151F80C78; Wed, 27 Mar 2024 18:46:22 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A21A5F80C73
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 18:46:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A21A5F80C73
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3771FCE2534;
	Wed, 27 Mar 2024 17:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D6BC43390;
	Wed, 27 Mar 2024 17:46:11 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 18:44:53 +0100
Subject: [PATCH 18/18] ASoC: sdw-mockup: drop driver owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-var-v1-18-86d5002ba6dc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=697;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TPIwJyHJ+747cO/ACTo9CUsEqoc7Fc18IjkZxXaUALs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBFsbPRhLLRW6aIenPvFaDhNNkrhsJU/87RgSq
 1indSOHKTWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgRbGwAKCRDBN2bmhouD
 1+urD/9nYozdlVyHTbH1gmrxRj+UdO9xzVICmYBU4OUt5C86nmFnA8tt2lh37b3gLRcms/eK5zY
 uDclO/E0Vm6fMwDz+bL7WcV1TNPvgHXVkym+8ilScw84szrTux9xNOF7ko0PTq4nZrgKov9831P
 9awI7+Ug5/mT7LlSt7QUZfK6SnIa/8LKULNpfUb/p0dldEVzMFHQWU5MwuYIZTTa1/WNu0huJCS
 /Tfzd68AhMie5D9u9+WdYkFbkhTuAgWQY8mNoaDxwwCwQAYxGzcosz1VP3SCXzYrzV4REMwGZfa
 VrsYaLKv8VNRco7WOpKhkzGjGLMztrKa/E3sAJ4AszhXajxQ5YobwCQdsfCDDsleJffP8aWS4Nj
 dSqzB46rnSA1Da+m8DVbQMltM2ihMS5uB/Ot2AQAFPvUeH5tAK4BXksHs8HWY00cAN0U6TfUgdC
 l1cfqq+bMFVqtZRqUuw8U9jjkiffcH/ztorX/CDXl4N4uSCCkudP7+0G+ZRdz9kvqxQCRxuoYLg
 ZDJX1oZxEqMe68+gHx6VKESYNUQOUpwvp4vAigBpUoa98U35Uujrx0LTi27tfoa24QQEyugx70c
 exIZOdxjULDaAzPN2O+Xh6btXgJAMjtzIboUdQaUsOFkAz8Fic2htJfMNxis9mmvc77dPvnzd80
 C+xIPhW09WpOvJQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: KFUCBXZ6ZR2ARXHIYRJCDHFCWLC7CAQW
X-Message-ID-Hash: KFUCBXZ6ZR2ARXHIYRJCDHFCWLC7CAQW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KFUCBXZ6ZR2ARXHIYRJCDHFCWLC7CAQW/>
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
 sound/soc/codecs/sdw-mockup.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/sdw-mockup.c b/sound/soc/codecs/sdw-mockup.c
index 5498ff027c58..574c08b14f0c 100644
--- a/sound/soc/codecs/sdw-mockup.c
+++ b/sound/soc/codecs/sdw-mockup.c
@@ -262,7 +262,6 @@ MODULE_DEVICE_TABLE(sdw, sdw_mockup_id);
 static struct sdw_driver sdw_mockup_sdw_driver = {
 	.driver = {
 		.name = "sdw-mockup",
-		.owner = THIS_MODULE,
 	},
 	.probe = sdw_mockup_sdw_probe,
 	.remove = sdw_mockup_sdw_remove,

-- 
2.34.1

