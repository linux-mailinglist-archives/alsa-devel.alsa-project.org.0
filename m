Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CAE72AB19
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 13:18:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12A60823;
	Sat, 10 Jun 2023 13:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12A60823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686395923;
	bh=yK6lIFQnsOHkYk0j4hc4MzpfJwrKNMJAP6ybZhmo3Qg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dMSxJ+XAj9AjjDqMhRarh0DhWqufS9y0NvhvYmAU2XXKKfP26w7xd2M9cKcQqwmL4
	 2UFyM0fE7/p1p8YzB6Tj3E363WYQPpwRbV2QfFH1byU/wqMIaRmuRWpyYSuh/dNl2W
	 XcWlHraz49YmsHyyQUFLrGf8cl4fZuU39hDiCrMM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84023F80558; Sat, 10 Jun 2023 13:17:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA60BF80544;
	Sat, 10 Jun 2023 13:17:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1619F80254; Sat, 10 Jun 2023 13:16:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACE8BF8016C
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 13:16:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACE8BF8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NKgswCH3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EC65B61465;
	Sat, 10 Jun 2023 11:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAC2C433EF;
	Sat, 10 Jun 2023 11:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686395807;
	bh=yK6lIFQnsOHkYk0j4hc4MzpfJwrKNMJAP6ybZhmo3Qg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NKgswCH3706UXmlUYTTa72Uqy1wEjJEzMTlpVRrknojXAarcan3+ethK9I1nYK5o0
	 Ldy2tolVSc9q1jSvnTTZ4o7lHuxWTFxNGtL3J+rPba+z9DtHEyEEyVzPEvMyvOJfhy
	 y5T16VE7188UCu4fskZMJhHXwOxjFXzlK/cCe28Hl8tFTueFK9csEpolqxzwnDVWM8
	 Fpt/ZZ34kMQe62DsxON9IvY68LUqcvWapXtQggzCrx06JhxcIKuh4OOfQQfukgbv90
	 0gcOkc+FUpEwQtKjBTocztI52orqX3Fo2u8YbUPUgqMMafgeRgj6xXU3FqVj7dPYdq
	 Ynfpab4EsJ/MA==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 12:16:37 +0100
Subject: [PATCH 1/2] ASoC: es8316: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-es-maple-v1-1-45ada77f5643@kernel.org>
References: <20230609-asoc-es-maple-v1-0-45ada77f5643@kernel.org>
In-Reply-To: <20230609-asoc-es-maple-v1-0-45ada77f5643@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=909; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yK6lIFQnsOHkYk0j4hc4MzpfJwrKNMJAP6ybZhmo3Qg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhFubehGIfRDdIl4mcAs3G4cq2av2UlZrYuoU+jUq
 3ed58DyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZIRbmwAKCRAk1otyXVSH0CchB/
 9u3nXCHa66JIe4/81f8MCGHfrv3tr7rfTA4dyjUIllTu9rLDxJF9atwB3OjGsbOEDtIx6QLkSQejGk
 Ndz4ocXcAG2RQF+VFvNjTygc7giFGyLYdt9cymUx+R5SwqoGwlB5m1M9KpcLJaYmXrLKu14BpapRz2
 7aALACRlps048oZ9tckBgdonztPkdEqqaT8m19vA/yTfIpR374xy2bmpEPgH8Y0PfhcRv9BPmXS29O
 0tFN4Z8eEcODh20a/+X9JmJoXOVw21nqz/CYSqTErwwGU5KuK7GGqaeUxAlo238duFrWDlLy5siQMG
 73OgTfqMsJDnT4MlZC7ZhCbSLK+Ydt
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: EIMJ3SNHRCJO4XJRZXOKQQOXVDPG6WFK
X-Message-ID-Hash: EIMJ3SNHRCJO4XJRZXOKQQOXVDPG6WFK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EIMJ3SNHRCJO4XJRZXOKQQOXVDPG6WFK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The es8316 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/es8316.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index a27d80956459..1ee95e89c3a7 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -820,7 +820,7 @@ static const struct regmap_config es8316_regmap = {
 	.use_single_write = true,
 	.max_register = 0x53,
 	.volatile_reg = es8316_volatile_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static int es8316_i2c_probe(struct i2c_client *i2c_client)

-- 
2.30.2

