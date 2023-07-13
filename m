Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC9B751546
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:28:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4964DEA1;
	Thu, 13 Jul 2023 02:27:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4964DEA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689208098;
	bh=ebII69k6DQ4r2X0HdiYVZcbSXjtVMF24HW2OLsV2rA8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ta2gl1+54Dv5lqCUjIIYtdVMFW9PEDAhWh0vd7RyeRvx9TfVmMynKqQtmw9ckl8dR
	 HHA+mEO1azGPJ+5mE/Aun6K5HwtPUpXllRMJa+Bhh8B6kAFi+aN2U0RQ6vTes4nMD0
	 iSlyu52CvMZWA2QFhFAo0z95nw9nF23vCXS6+/Wk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED7BEF80803; Thu, 13 Jul 2023 02:17:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05022F807FC;
	Thu, 13 Jul 2023 02:17:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDDF7F8075C; Thu, 13 Jul 2023 02:16:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 379A4F806FC
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:16:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 379A4F806FC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Jz8b296j
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 266D961983;
	Thu, 13 Jul 2023 00:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF60C433C7;
	Thu, 13 Jul 2023 00:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207388;
	bh=ebII69k6DQ4r2X0HdiYVZcbSXjtVMF24HW2OLsV2rA8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Jz8b296j1Jn2pJf6+uq5aMRTUMYnHw7p+nNR3ZbE+SizNvGimfUE3BAd63UAuZuqk
	 mT8n0+R0dVTo5AwfJGrZ2hxh2u/m7/EVs+lwmtZP4VyIlclpcPkLQCSx7P6RIBGqD+
	 FfsaPqiVcArp/C9R2Xqg57l4OX/XXjq9760GTyWu5OqvROD1ZkIz/9ENesf7Ah2Fse
	 02T2pfE+2nJBjGQSEF8mSnAH9At1tkQfLCncUAfTni/wKzSerX8Un/QvrmWfrbB2AE
	 YXuJO67IX7Oy5IpCeKbrMIXIfuxrwVZtTJjd8zr5olw94ZMUEeEgZEeDQP3w1b3e1x
	 A+0EOEZhaGtjw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:14:00 +0100
Subject: [PATCH 47/48] ASoC: wm9712: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-47-a62651831735@kernel.org>
References: <20230713-asoc-cirrus-maple-v1-0-a62651831735@kernel.org>
In-Reply-To: <20230713-asoc-cirrus-maple-v1-0-a62651831735@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 asahi@lists.linux.dev, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ebII69k6DQ4r2X0HdiYVZcbSXjtVMF24HW2OLsV2rA8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HQT49IsB9FPGQ6zrtACJtgSSzF+YLTQlp/X
 eEY99qC+aOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9B0AAKCRAk1otyXVSH
 0DLFB/4pm9+L4qT8lCVX5/JWpnYArK4uE9Vi/qrH2zoX00ZC4a+uOutTMoYxuqWYI1Gtvdrk5rQ
 ZxWjiLgMaHMRbvFxjexvaUn1ZjdkqN63ryiH4oVoGMGfMzhcoWVPogY69Xvp5nAuV+S/iXgn+bX
 DSE81LW4+H7rysmXiw/bIV9zj38lRAn35vdnniYEQUquZfc/2zAydlvzk3gstX6+jggjj15gBNG
 fC5P5H94oyxcWejqiBfOfcK7aNaeUfCKrNbc1biEBqNkhZ14ZGXRoutPBaaJN6d/bqerhDu+veR
 VNbsQqRPJWn4pNVZ7Lk+Liotb6EhG/oKkmJQe5LCCCUKQYSl
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: FZPN2SEYA5SUXIMLNKRNRJPJQEYG7BS7
X-Message-ID-Hash: FZPN2SEYA5SUXIMLNKRNRJPJQEYG7BS7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FZPN2SEYA5SUXIMLNKRNRJPJQEYG7BS7/>
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

Update the wm9712 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm9712.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm9712.c b/sound/soc/codecs/wm9712.c
index df9b7980706b..e63921de0c37 100644
--- a/sound/soc/codecs/wm9712.c
+++ b/sound/soc/codecs/wm9712.c
@@ -86,7 +86,7 @@ static const struct regmap_config wm9712_regmap_config = {
 	.reg_stride = 2,
 	.val_bits = 16,
 	.max_register = 0x7e,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = wm9712_volatile_reg,
 

-- 
2.39.2

