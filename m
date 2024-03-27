Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C2988ED05
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 18:48:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E0602C54;
	Wed, 27 Mar 2024 18:48:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E0602C54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711561696;
	bh=G3qDvzvaAriAFdEKuhbrwzjm1GWzjjiU/QZPkOJtje0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d3AgvCOO5MrDP1D4t3BQ++PKyI0l73QP4mmv6MeamiOy1Ta8QmvRQVOj6CLEw/oR9
	 2DhY8RkA4wGBSoknagcAkAhZfG8C+vhbG7i7YYMkEZg9uvev80HEr+8N29+8zULH6y
	 Uy+gEP/ZtqwAA6osQli8NCCviIugrHkYd02qSMiE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67C96F805A1; Wed, 27 Mar 2024 18:45:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AEE6BF806F9;
	Wed, 27 Mar 2024 18:45:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 656BCF806C0; Wed, 27 Mar 2024 18:45:46 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CB6BF806A3
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 18:45:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CB6BF806A3
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 545B5615EB;
	Wed, 27 Mar 2024 17:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2935C433C7;
	Wed, 27 Mar 2024 17:45:36 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 18:44:44 +0100
Subject: [PATCH 09/18] ASoC: rt5682-sdw: drop driver owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-var-v1-9-86d5002ba6dc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=675;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=G3qDvzvaAriAFdEKuhbrwzjm1GWzjjiU/QZPkOJtje0=;
 b=owEBbAKT/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBFsT/UreYIHR1g9/K4OLagqMOr0rsnz6zzy/j
 xGR7m8FyiOJAjIEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgRbEwAKCRDBN2bmhouD
 17laD/j3N0YEadzDYviV1gKA4bj0vkzHi1obmdadp4x1MKrX1QwwJZKLalouffTb5DsGROoHqFP
 oBzUQwbfgIOdG9TxBHQ0Aw5JXPLjp9DieNXpKrqJmyfqYfsmpZ+1KR7zxgujxZrLudkHp40nHke
 h1+6H0ThaEkRUFtFyRhUNbOIjf/74+q6kq0RhRjRdeEt8trD89Bc7z3ZzT7zrCpk+ZQAPkt/N1B
 K6JrEdZRmFsQR4P/GiMAxccHJ7WnEwqX1nQvH9MTVN6qNZ82Z8DI9VBT97QmwWy+OW4teirtR9V
 LhCTirdLs0ELOb0HbufmDv6R5X92bldElp6lr8+k945pohB/1Pg0eHTqXXsImQ15jusNZenHeAZ
 TpoEYS1ZF/sCErEDD0afLkYFaMj/+NRq/2JTV0dCq2Hu9dKhZnI2JqfSHCOIo0dyEKxqhGUTQzN
 w6Qbbu7HMA2pX2lGWpgKxE1w285rpbF+8xxWibfIskMyHPz8V7tL5kv0rbJwMHqnYVDPG+BG9Vc
 3b051XdUWdvV1p4KBej4jTzgJOZXw7OJfCDC6lRvxY2GGJ3TrYLYCO2mgzqcAaCHN37jnfK/UTe
 j9Xr8yZstzeY0Q2Y9NCVP8YZFvxOEHLYUqRFjhILYsFFDkv+fDra7I/Vecfa70h4kBYScPe2nPD
 mzoBqGHwxvwn1
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: Z5XNWPNBK7G5S5TM5MZTL3CFGZFEQHUJ
X-Message-ID-Hash: Z5XNWPNBK7G5S5TM5MZTL3CFGZFEQHUJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z5XNWPNBK7G5S5TM5MZTL3CFGZFEQHUJ/>
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
 sound/soc/codecs/rt5682-sdw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index e67c2e19cb1a..43737d5cedd0 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -798,7 +798,6 @@ static const struct dev_pm_ops rt5682_pm = {
 static struct sdw_driver rt5682_sdw_driver = {
 	.driver = {
 		.name = "rt5682",
-		.owner = THIS_MODULE,
 		.pm = &rt5682_pm,
 	},
 	.probe = rt5682_sdw_probe,

-- 
2.34.1

