Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E67688ECFB
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 18:47:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8A8A2C62;
	Wed, 27 Mar 2024 18:46:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8A8A2C62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711561627;
	bh=SDz1QUCvzQDhphMNqvtB6qWeO0A9iIEXepkl8QtR86w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sbijhuZaUwQJqGBwpOaV4aGBSRds7Ca8U/oFywWHlqS0MXxKeEVoB/In3gBZODncG
	 0rX82hNJg6vB6WYnvIdVJzEyel5msWaBspP6i+85OQICXus/QF/oE3hMtg+mWrNnLN
	 +tYmMc0liu8dPadTcIHWsJa3hcxfYfPja6FaAktQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 190B8F80637; Wed, 27 Mar 2024 18:45:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2984F8065A;
	Wed, 27 Mar 2024 18:45:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 507C5F805ED; Wed, 27 Mar 2024 18:45:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 819F1F8055C
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 18:45:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 819F1F8055C
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2AE00CE2534;
	Wed, 27 Mar 2024 17:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54373C43390;
	Wed, 27 Mar 2024 17:45:21 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 18:44:40 +0100
Subject: [PATCH 05/18] ASoC: rt1017-sdca-sdw: drop driver owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-var-v1-5-86d5002ba6dc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=725;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=SDz1QUCvzQDhphMNqvtB6qWeO0A9iIEXepkl8QtR86w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBFsQfYEs1vR9uoJq0CMaFJxg7s5qjy12oo4po
 XdUvH2vTiiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgRbEAAKCRDBN2bmhouD
 18WID/4vnJcdKm7oQwgNGEr++EBQVhvl7Og5B3qheNc6G1mtmguda1g+5e89AazE7Bv3vRLCEhK
 7SVolcCejUUgJwmyrztmOx7mhOGIUpLwPKql17atv8cEu2aPOjbs679v4tK68fGBTKcGYjZ76JV
 e8h/zjxBO1wfpworohBg9aHouzUTy61gtosLRDuPu7kCTnNNSd4ZSlNNTyvPGhbCHCdEUIUF5Qw
 0akuQeMdrExHGH48OiAoqpGx2DsTm7iQnKzV0wS9TWiRGK7s36uGkL9b03H5Y9hUTEQ/bZoSOED
 F4dm2jWWcwEzm1Ae0d60wd2Qe4h8UT70TIZpxKZMT50dYNQ78cm3FnobUCQogn6KpZ+lQPESjqt
 GssIiH755kyWaId450ATPr7ILnboSMlKPQzQEZlmF76r8R4msr/S1mEIM+nBsEezlxYnB3A7UOa
 5dRhE5e0uOfkZbKKR6e8+2K3O3dtEHz29aCXnuIyGS62gs8SqYJj4sXte/52N1tz6l8lUqypAbl
 e3BXvC1OpCVIJusmr+/TZAVHZ09o8cBiyFFi2LB7GN3SGNbtb3DIqaaCdXCJVfnVa2nRQPVsrVj
 lsjYndDEKh5RyumCWCQS+GyO5cIVK0Q4FdNh4DF0Q8tHVqARL95HIvix3Ih9FKJG1E9Q4UPxAJs
 INuvH5sJ2kl7siw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: RJHR43E44PJCCFF367T2LMSJKUY2X4II
X-Message-ID-Hash: RJHR43E44PJCCFF367T2LMSJKUY2X4II
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RJHR43E44PJCCFF367T2LMSJKUY2X4II/>
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
 sound/soc/codecs/rt1017-sdca-sdw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt1017-sdca-sdw.c b/sound/soc/codecs/rt1017-sdca-sdw.c
index 4dbbd8bdaaac..7c8103a0d562 100644
--- a/sound/soc/codecs/rt1017-sdca-sdw.c
+++ b/sound/soc/codecs/rt1017-sdca-sdw.c
@@ -809,7 +809,6 @@ static const struct dev_pm_ops rt1017_sdca_pm = {
 static struct sdw_driver rt1017_sdca_sdw_driver = {
 	.driver = {
 		.name = "rt1017-sdca",
-		.owner = THIS_MODULE,
 		.pm = &rt1017_sdca_pm,
 	},
 	.probe = rt1017_sdca_sdw_probe,

-- 
2.34.1

