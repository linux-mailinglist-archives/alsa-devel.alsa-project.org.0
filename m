Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C2C984724
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 15:59:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A449EB65;
	Tue, 24 Sep 2024 15:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A449EB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727186376;
	bh=mjhiOE9V8C0wheS1juQW7ZKGUKe/JAeKebRmNOKIqcw=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YpPRh92pAY58INjT2WBX/BaKgR/1LyDm/mjWIeUKDtIJC2zKjHjm+NvwJ+YtZpqxw
	 KshP2xtU64GD6a57F+fZxIZOK8OPZ5NFV/PAqP7XhRl3sDyQj5mHiNo92SyygI11TX
	 IBeDhy6mn9XPr0YMUytvcXdSwVp0oLf5hB/yI0aU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 658CAF805A9; Tue, 24 Sep 2024 15:59:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA8FDF805B1;
	Tue, 24 Sep 2024 15:59:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D84FF802DB; Tue, 24 Sep 2024 15:59:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E59EF80007
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 15:58:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E59EF80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=All2FbVc
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A55A1A4262C;
	Tue, 24 Sep 2024 13:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559DFC4CEC4;
	Tue, 24 Sep 2024 13:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727186336;
	bh=mjhiOE9V8C0wheS1juQW7ZKGUKe/JAeKebRmNOKIqcw=;
	h=From:Date:Subject:To:Cc:From;
	b=All2FbVcWFNLYtOWd6MNxS8+ns5KImufaT1QWO2L4rVHlbDFZTmSSIWWRPdsXdKYg
	 sBF566Q7uEP3XsHBRQ/UxX7dQFIiRwaEfD0kAdY3BovKUc+BU6jcdeQBg3Hd1ArWqY
	 th9YOVQLK2fxetYSs0PbL04TLmgbZeietNRr581BtizZ2CuV5GMiLhku6ohIK1ixmo
	 s0OtDPXWvKz5gPMKQNtOzczCCr7g91mn8WxSV+tE8sZHomZqa+CVi8IVOlqt8QbQ66
	 vguVMh37+APeuCyNYYOtOUQp4lgUlBxQw6cN+CvFN86tA97v+a1iIOvF8b4EQp71WU
	 U9WHab0Hm5tlA==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 24 Sep 2024 15:58:42 +0200
Subject: [PATCH] ASoC: fsl: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-asoc-imx-maple-v1-1-8b993901f71e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJHF8mYC/x3MQQqAIBBA0avErBswtaCuEi2sxhrIFIUQwrsnL
 d/i/xcSRaYEU/NCpIcT+7uiaxvYTnMfhLxXgxRSi1FqNMlvyC6jM+EiNOs6SCs61SsFNQqRLOd
 /OC+lfFn+chxgAAAA
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=2195; i=broonie@kernel.org;
 h=from:subject:message-id; bh=mjhiOE9V8C0wheS1juQW7ZKGUKe/JAeKebRmNOKIqcw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm8sWbwQST/kxv3i8Ph3uEZVQrfduRFkYXJARJE
 KW6TgYDGS2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvLFmwAKCRAk1otyXVSH
 0CjdB/4rV/vNLoIQlMxXHFZ4x4LcvAMLcjwL+UyIwkYLlta2CtJ13XQ7X970VpWE6B52CvaiCOn
 IggNAH8UGfac37XRrwHWX+UC3eqTDA3uPuZH+czaw7gfp7JAKrW+7g8qByTREF1KYhuu1xW46gx
 klfDKmUsYceDDkgdCCxb2wpLuZSAfkMfeqXeGdtLO9ahdLSjk7mlT9lTnGyqMnvS0tX2TaTlNmj
 6s5+f29U1sU8dZDLHv7OVwUtRIgY9gIaL5l1xeokNiZi9V5zA78bwEwD8ESpXauWrDBudyflyEC
 h0by4V+2DeSgErLCjUlyflJ6nt7Mg+JmRdRr0Rx7Mv8340Wj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: WSANAYMGCARAVFP5OHYC75JVAXKXSSD4
X-Message-ID-Hash: WSANAYMGCARAVFP5OHYC75JVAXKXSSD4
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WSANAYMGCARAVFP5OHYC75JVAXKXSSD4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Several of the NXP drivers use regmaps with a rbtree register cache. Since
the maple tree cache is uisng a generally more modern data structure which
makes implementation choices more suitable for modern systems let's convert
these drivers to it. This should have no practical impact.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_aud2htx.c | 2 +-
 sound/soc/fsl/fsl_easrc.c   | 2 +-
 sound/soc/fsl/fsl_micfil.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_aud2htx.c b/sound/soc/fsl/fsl_aud2htx.c
index a6cbaa6364c7..910b4ce7671c 100644
--- a/sound/soc/fsl/fsl_aud2htx.c
+++ b/sound/soc/fsl/fsl_aud2htx.c
@@ -169,7 +169,7 @@ static const struct regmap_config fsl_aud2htx_regmap_config = {
 	.readable_reg = fsl_aud2htx_readable_reg,
 	.volatile_reg = fsl_aud2htx_volatile_reg,
 	.writeable_reg = fsl_aud2htx_writeable_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static const struct of_device_id fsl_aud2htx_dt_ids[] = {
diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 962f30912091..5149e732f763 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1748,7 +1748,7 @@ static const struct regmap_config fsl_easrc_regmap_config = {
 	.rd_table = &fsl_easrc_readable_table,
 	.wr_table = &fsl_easrc_writeable_table,
 	.volatile_table = &fsl_easrc_volatileable_table,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 #ifdef DEBUG
diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 22b240a70ad4..c0dc9bebb77b 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -955,7 +955,7 @@ static const struct regmap_config fsl_micfil_regmap_config = {
 	.readable_reg = fsl_micfil_readable_reg,
 	.volatile_reg = fsl_micfil_volatile_reg,
 	.writeable_reg = fsl_micfil_writeable_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 /* END OF REGMAP */

---
base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
change-id: 20240924-asoc-imx-maple-abb62f013533

Best regards,
-- 
Mark Brown <broonie@kernel.org>

