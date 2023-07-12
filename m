Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 410F5751088
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 20:31:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C814C4E;
	Wed, 12 Jul 2023 20:30:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C814C4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689186707;
	bh=zqU6ZAcQQBHsvS/rJLsgJS0viL/KP5Cepdvd2B5dJcQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JXkWVnA7vmXdRxkaWzzhV3lUm1IIXG1xlDhOzUtoI9G3yqrhL7h8VR+dMsr4BBWyn
	 YZAqjYWG6hB/MSihe/qi1h5u7BvppK9UdeccVjgwmBt9CwKYsZIn0YPWtqGHaHvQ3+
	 CRgavZjPAOQgCTT32wtBnCSVdH3WVMl1E7ppR/tQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B27A9F80551; Wed, 12 Jul 2023 20:30:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 552A6F8027B;
	Wed, 12 Jul 2023 20:30:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39F6DF80290; Wed, 12 Jul 2023 20:30:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FA18F80093
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 20:29:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FA18F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=W4Cloz0U
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 712F2618CD;
	Wed, 12 Jul 2023 18:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF7BC433C9;
	Wed, 12 Jul 2023 18:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689186591;
	bh=zqU6ZAcQQBHsvS/rJLsgJS0viL/KP5Cepdvd2B5dJcQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W4Cloz0UK9E0Dd5dBpHYqymNWw5vlr5q4enTRnbMh1lTLB8ffiE0tjKs5rD/6g/iy
	 vxzHr2h3g4dKjErrBRGIfzj+D4/lf5ZZAc3dDnQ6a80L9elntVq2EzTHzmr7Fzu79B
	 5LWbH8HS9QRmiKcw1DtI/2o2MPPSE0TujAaZ2n3Mm2zy/wXPjOBo3+gxkvfaXuu8k7
	 MkZE2zNyMuwWvmn+tIcK7o/tJlSxt3lw+0g887bloE6w9KMde0oRo/+Vh2dlBoEF6h
	 BUmMZgSuV5IBV9yJm1Nfvp64iIXUQKmzCAtgO+l3Bmq7dQheVZSlY4tLfWVVHiePCN
	 vXqXksFkq64lw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Jul 2023 19:29:32 +0100
Subject: [PATCH 1/4] ASoC: wcd9335: Update to use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230712-asoc-qcom-maple-v1-1-15f8089664b9@kernel.org>
References: <20230712-asoc-qcom-maple-v1-0-15f8089664b9@kernel.org>
In-Reply-To: <20230712-asoc-qcom-maple-v1-0-15f8089664b9@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zqU6ZAcQQBHsvS/rJLsgJS0viL/KP5Cepdvd2B5dJcQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkrvEXV8JwsoM63+tHO/NLv97Czee2dPP9LCzK7
 lZSg4ycsi6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK7xFwAKCRAk1otyXVSH
 0DvQB/9pCUTYPFhfMCDWL1lXoLGRshtzejNjUiy2T/8v+fcEVa3PbW96lln7mlujNocP+P+217W
 iR6lcCzAkl71Ztd+sfaux/miROKLrvMIdcj3Eg3PJOaFibjbq221bVnh5Gw4GOT1EPyuabB2gfG
 QVdnOUx0FIzt0sAK5rY1pGnQA52UbTCoKQsCNyA/crLRQIZTOdPj+lE2JR4Z/eZ/kr03UpRgEB1
 lywRDjzeauWzMhfwFpSVF2QXvqrtXfDlJJM9gA5K5QR5xx/TK5QjcmY8Kxp8cTygkkK4MmiJypj
 cbuKOKYCq8cbeQQ9HMAo7/1cpiBgLoIoEfYIh51IOBjESPRJ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: HWMB4RCKSYRHE6IZDB562NY7P3DKTCFM
X-Message-ID-Hash: HWMB4RCKSYRHE6IZDB562NY7P3DKTCFM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HWMB4RCKSYRHE6IZDB562NY7P3DKTCFM/>
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

Update the wcd9335 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wcd9335.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 8bf3510a3ea3..a05b553e6472 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -4968,7 +4968,7 @@ static bool wcd9335_is_volatile_register(struct device *dev, unsigned int reg)
 static struct regmap_config wcd9335_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 8,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.max_register = WCD9335_MAX_REGISTER,
 	.can_multi_write = true,
 	.ranges = wcd9335_ranges,

-- 
2.39.2

