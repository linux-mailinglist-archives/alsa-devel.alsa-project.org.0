Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFBC751092
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 20:32:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FF416C1;
	Wed, 12 Jul 2023 20:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FF416C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689186736;
	bh=BLhoiooK+SPyBcxQaJ/+z4l8Cf26OHRdpNHT72wlcs0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=matWVgQWo5amssCk39zUCkvLqJoScr8Xy9PJgqVEVqd5UAa+8d28IH+klatAx2vDe
	 Yk1gW9O2aF3i4aoqUWDV69sM98//dTyR2ya/nG6wVFLGUtQ3UhTu41vxK20/kr1pip
	 C9DtMvnjH3ytQrN0glV84kEj7997Rbn6t4b7fgSM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A8AAF8024E; Wed, 12 Jul 2023 20:31:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED7EEF80249;
	Wed, 12 Jul 2023 20:31:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B69E8F8024E; Wed, 12 Jul 2023 20:31:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F40C4F80153
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 20:29:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F40C4F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kgdUcUPI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1ADE6618CF;
	Wed, 12 Jul 2023 18:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35179C433CA;
	Wed, 12 Jul 2023 18:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689186597;
	bh=BLhoiooK+SPyBcxQaJ/+z4l8Cf26OHRdpNHT72wlcs0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kgdUcUPIVv9YynUsB1kng6rQKyeFEpb60PJIhKpj0aQcW49LNZ96A6M+0cgEQg0Z0
	 6i/sRgoshb7bSa+etncVOhj+Bw+jtXFJOgdT/AqzPoAi4TeXpmvIWxl+ne4cba+PfL
	 e3CF3+tT3vcJB3M84XHhvvd8KIGi3Jp2z2ujcaepZQP+seuGjtL8xnN2IUBewPlQ7/
	 TKY8qVg9y4zs+6ntbKuynV9sZIiPc0ipZWoI7jTm/pob5090XAQM8AYLmmpUR3/r8Y
	 of5wi/z1gt1BDj9fuxpurnufY/I7LVCIPdwTgovs8zc4O8pQLn/9BX3R+E8jsNqyyz
	 tCIaueMTBDLgA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Jul 2023 19:29:35 +0100
Subject: [PATCH 4/4] ASoC: wsa883x: Update to use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230712-asoc-qcom-maple-v1-4-15f8089664b9@kernel.org>
References: <20230712-asoc-qcom-maple-v1-0-15f8089664b9@kernel.org>
In-Reply-To: <20230712-asoc-qcom-maple-v1-0-15f8089664b9@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BLhoiooK+SPyBcxQaJ/+z4l8Cf26OHRdpNHT72wlcs0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkrvEZfjFyv7JLbFzKwPggiFByT6A17IOr8eOlI
 nO6WCO/sMeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK7xGQAKCRAk1otyXVSH
 0AzsB/0WW37e0NOO5V+xJ01eFaPW+J39Gu+5QBQBx7Idwfvf/IIilFl08gF+gy2FPvAjEe2X4FQ
 ihHvNuoWis+SmWx7nz9OpsGG6OD283SiNKT37Q/b72nuGwucHtoOMMjMg7CZHQL0aalv/vVj6N/
 nNbiK+V2EnYsM5fApCO1jEjA3eryXyGhTviwzLW/nnmGtJcyKun2ZNbW0rj6nE1OIuSpDLg+xcT
 c2+MlpWY+bhhYtnlzcknm90mHMnTX3twVqPbRBUGuPP9u5U1bNz7MvpbxK6JJtsTBl7wcH3HP8Q
 /q/RCEjHE3wmPfmK9ld1RdCW50Ddp2xzvYN3AZwjQVQ7s0cT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: GML2MNFJSKRRKSVZTV5T7V7D3RAFYYJD
X-Message-ID-Hash: GML2MNFJSKRRKSVZTV5T7V7D3RAFYYJD
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GML2MNFJSKRRKSVZTV5T7V7D3RAFYYJD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wsa883x driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wsa883x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index e40d583a1ce6..197fae23762f 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -938,7 +938,7 @@ static bool wsa883x_volatile_register(struct device *dev, unsigned int reg)
 static struct regmap_config wsa883x_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 8,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wsa883x_defaults,
 	.max_register = WSA883X_MAX_REGISTER,
 	.num_reg_defaults = ARRAY_SIZE(wsa883x_defaults),

-- 
2.39.2

