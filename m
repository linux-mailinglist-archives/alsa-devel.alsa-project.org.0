Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0E1751091
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 20:32:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 665F0857;
	Wed, 12 Jul 2023 20:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 665F0857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689186730;
	bh=WS8PaoZNPLFN03memDB7SybaCgv4N4UDqWVOcfkG0pw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jFAwMs9qAP1skVb0t2TfAVy81yXHdk0loo9GcRgncfMfuhrw2Olbmet5WNfZ8Oz2P
	 a9qBMg0B2I5+7m89fmq9Vvr8qqIN6T0KDbnsFIbH1VOb5MOHo52t9sidE901rJzbLH
	 SpRwFkImIQb7qaLfJkkwXxtTA0AiY0PXTN0Ay8C0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08308F8057F; Wed, 12 Jul 2023 20:30:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C89DF8057A;
	Wed, 12 Jul 2023 20:30:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CB0AF80564; Wed, 12 Jul 2023 20:30:08 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D426BF80236
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 20:29:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D426BF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mp1KGQry
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4B6A8618D1;
	Wed, 12 Jul 2023 18:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 680C0C433C8;
	Wed, 12 Jul 2023 18:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689186593;
	bh=WS8PaoZNPLFN03memDB7SybaCgv4N4UDqWVOcfkG0pw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mp1KGQryyfJ643/trDhX0i4T03LcuSWxvHlnZ6SiSl3CFwIzidPNMY5at/dIUbJi3
	 ISnSWP4TyYc319zKK/aAAd5oUTwm+LTHwisXUsn0kq4Pw7YsFauWyZ9uGD5tewVt4A
	 LbOGyxdc9KT+W6nzq0t9hYV08xUPT/VcInFFMNxRHRRA9MuRcsCZ1gp6grvgb/Zllt
	 V3ZogsOurXRYINdsFsXlx18FhtnuLYxPNTP0R+6pr8aEEgM1PAenmzc7G/rzHnYBDX
	 hP7LkbCfsNs9tynR7+j2TYG+Y/vbyQCLNHrnMivnhmYonIxl+pEGxf7g1Jurq71OVB
	 glIABoNgRuCAw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Jul 2023 19:29:33 +0100
Subject: [PATCH 2/4] ASoC: wcd938x: Update to use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230712-asoc-qcom-maple-v1-2-15f8089664b9@kernel.org>
References: <20230712-asoc-qcom-maple-v1-0-15f8089664b9@kernel.org>
In-Reply-To: <20230712-asoc-qcom-maple-v1-0-15f8089664b9@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WS8PaoZNPLFN03memDB7SybaCgv4N4UDqWVOcfkG0pw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkrvEY5B1iAnchhOKLen+ktMTjAFtAkfuAM2uJD
 qVG1hli8zeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK7xGAAKCRAk1otyXVSH
 0EJLB/9QB+7HqQR7MZOjgT8Jfe8oq+u3bkvP8YxO+7YAP3+k0tRAjb1kLOUcCqq2vAurl0FW2dP
 XEqqOw/9THxMvP8uuf77oi9UlzLeuLRzdSg2FC4FeZlRapctO4UYpM0m15JTeaUpv0CV0M2/SF9
 SvE5AermLcaBcmm0q94X9qkLzY5nrODlCyHFF3yO1cWhzjFdStFiB89x7Scv5fpASzQT2LZdlph
 3lxffl9o1oC83vGPTlhKpaFy3rxZC0mYRBjDRmASy+OmVXMi4RgYr6d2KcTsGo5+RBKnKYffDDD
 x9lDD9uhlHtJnGZ0tAU+HcLwTg8E00dOciYHM3u1470Q+wmO
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 2ZZPPKRUWQGFC2TVLSETTVNJSWXUBGUQ
X-Message-ID-Hash: 2ZZPPKRUWQGFC2TVLSETTVNJSWXUBGUQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ZZPPKRUWQGFC2TVLSETTVNJSWXUBGUQ/>
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

Update the wcd938x driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wcd938x-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index bd0e9fbc12eb..6951120057e5 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -1183,7 +1183,7 @@ static const struct regmap_config wcd938x_regmap_config = {
 	.name = "wcd938x_csr",
 	.reg_bits = 32,
 	.val_bits = 8,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wcd938x_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wcd938x_defaults),
 	.max_register = WCD938X_MAX_REGISTER,

-- 
2.39.2

