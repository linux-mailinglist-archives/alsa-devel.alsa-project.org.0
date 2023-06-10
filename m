Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F4972AC45
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:27:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 241A6829;
	Sat, 10 Jun 2023 16:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 241A6829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686407261;
	bh=jaJzpJyj+5E2A//gUROcGxEPk881SMtYkFToNDsbtAM=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XyikM0BQF02KhWpTKWjLA8HCSGQxoNKnTM1xMIiA+AEtz+TaANT+6NMcOzuVow1Yu
	 ddWM+3EM+h5JiOtJWIT4pY7YJvXelHW6n8xnmiwCoXGat0yEny/dfM+inNc6CU6kss
	 5ap4BBwRB6xL6B1cYSvqtVrI/ZhQC344DkHpooGI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D950F80290; Sat, 10 Jun 2023 16:26:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0FDFF8016C;
	Sat, 10 Jun 2023 16:26:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95A78F800ED; Sat, 10 Jun 2023 16:26:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EBEA8F800ED
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 16:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBEA8F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Vp+4iCH8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B1BCD60A3B;
	Sat, 10 Jun 2023 14:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12705C433EF;
	Sat, 10 Jun 2023 14:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686407202;
	bh=jaJzpJyj+5E2A//gUROcGxEPk881SMtYkFToNDsbtAM=;
	h=From:Date:Subject:To:Cc:From;
	b=Vp+4iCH89fmnVLPXUIJ9NkzYPo2Rcx88sQBzH03pUwpZujed/cNh2DDSunN9zcWcP
	 yUB0Z8ikq7Xkmycqm+oDECWgi1HsOZAa4sim7ffz7w8WbLG5hOZgPLCDVfpxE8MUXX
	 A/53+qgowMM7IAtmvq+/boRyslujb5lS7sOMx3sYXf/4JgnjlIC8JO5L5heSh8Z7bS
	 5VGLZdJHsbVVP0OrHcUAPk4Ym3xGICFqfvNwyOi2JLhkW0d7HqvG2ciNdvUekqL9VG
	 U41KoFSCEoixXJdCmJGSD1YeYGojByuTlbQsPa4J677vgzETtAxGppzljvpqnD1gLg
	 EELLfJ4fUaYCg==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 15:26:37 +0100
Subject: [PATCH] ALSA: hda: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-alsa-hda-maple-v1-1-a2b725c8b8f5@kernel.org>
X-B4-Tracking: v=1; b=H4sIAByIhGQC/x2NQQqDQAwAvyI5NxC3VKlfkR6yGruhukoCbUH8e
 9ceZ2CYHVxMxaGrdjB5q+uaC9SXCobE+SmoY2EIFK7U0B15dsY0Mi68zYIUpvYmMVLTCpQosgt
 G4zykM/us9jr1ZjLp9//pH8fxA5q+90p3AAAA
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1082; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jaJzpJyj+5E2A//gUROcGxEPk881SMtYkFToNDsbtAM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIgfdHrblT9jwwcTTb8u7IUpTl5wXqj820MyIg71
 lYQUT5+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISIHwAKCRAk1otyXVSH0NznB/
 91sSHt6gyZfeq5HaKZVlOfypm8FPsMiE5ScY12lFPB5hGhX5M7JRYsyWc/ywdN4+PxWiRRNtMtmgpr
 rRVnKCrYWBQuhuo4zj6WUlTr6k0zT4193uio9FqHPGCds/6jlnvZNl4ceW9ViIUNI4Is9jS4YdfM+e
 CfqyxVeqbq55m/AcVFHPpLBqnoPeVdgVWDYCKLG7ZF+BNeLBDUItxH+iFW1sslX5aK5n4/Ewl4WHLN
 RXe93oRz2aDYq78MptC8AuwEMiTwtN1wIybG6+Q42afsHQJXdjXsuLG44fCADBhdiiijgjDsOFZ54S
 /O0nQJSoHOXeQXE+fagxjUNYoDv+a6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 4EYPXKL6ZJCSEVW6OSQXT4UEKSJIHXQ5
X-Message-ID-Hash: 4EYPXKL6ZJCSEVW6OSQXT4UEKSJIHXQ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4EYPXKL6ZJCSEVW6OSQXT4UEKSJIHXQ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

HDA can only support single register read and write operations so does not
benefit from block writes. This means it gets no benefit from using the
rbtree register cache over the maple tree register cache so convert it to
use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/hda/hdac_regmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/hdac_regmap.c b/sound/hda/hdac_regmap.c
index fe3587547cfe..2caa1f9b858e 100644
--- a/sound/hda/hdac_regmap.c
+++ b/sound/hda/hdac_regmap.c
@@ -358,7 +358,7 @@ static const struct regmap_config hda_regmap_cfg = {
 	.writeable_reg = hda_writeable_reg,
 	.readable_reg = hda_readable_reg,
 	.volatile_reg = hda_volatile_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_read = hda_reg_read,
 	.reg_write = hda_reg_write,
 	.use_single_read = true,

---
base-commit: 9561de3a55bed6bdd44a12820ba81ec416e705a7
change-id: 20230609-alsa-hda-maple-02f75ebb067e

Best regards,
-- 
Mark Brown <broonie@kernel.org>

