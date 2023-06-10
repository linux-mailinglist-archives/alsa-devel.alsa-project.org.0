Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE83972AC0A
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:02:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E8DD6C1;
	Sat, 10 Jun 2023 16:01:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E8DD6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405761;
	bh=jbVm6nAjnuw8YGp4V7xX/Oa0mHUKBPd6W/uMcpSc5O8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kxy+Tv4olVd1caue0fD4a7pNds4xh7KgGnWMmI22WkZYswO+DMoX/MKSBm2tRANzE
	 mPFNs9lEMKlC6jIrHzfkFoyz1u4f3wgzDtzFTn6Q/1TaVUrmoR2609S6P7oJrGpovg
	 N2FqRniC75bz87F6VYrK40JtgVmhWa/BN3nj0SK0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AAD8F805C9; Sat, 10 Jun 2023 15:59:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E892AF805D6;
	Sat, 10 Jun 2023 15:59:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2876AF80199; Sat, 10 Jun 2023 15:57:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 947B0F8016C
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:56:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 947B0F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OYdBPTEG
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3E40B612A1;
	Sat, 10 Jun 2023 13:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA528C433EF;
	Sat, 10 Jun 2023 13:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405416;
	bh=jbVm6nAjnuw8YGp4V7xX/Oa0mHUKBPd6W/uMcpSc5O8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OYdBPTEG/tG8K6PKWGJ8k9JW2oeiuIE1IW7X2RMmeqqpiRnKjTpPKN0ugIStGJRDj
	 huy9+wOfD3pLPSzwcce9zFF5X0UhgWK/2AU2Ty5lLyJ96lxT6qcbqPMT+JHf03ZhyL
	 PZxnHcabfW02rcyiAGT2hjLjOR78q/0cKE3I1Xsp0qhs+T6QXGFSy/mkIcW591oW67
	 nEPJMcc3wDCJwfDKyzmJX8NX8I+zzriovToVcm9zKRo5u/TJb5kiEPLXYExOhA8XJD
	 dZuNP0XKsNcnty4v44h0ezhdAJtOPnn1d+WzPnrFPn0+8HED6OVG9KJT8EYh3vi1I+
	 61KBjD2CSZEKA==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:56:30 +0100
Subject: [PATCH 10/10] ASoC: cs35l30: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-cirrus-maple-v1-10-b806c4cbd1d4@kernel.org>
References: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
In-Reply-To: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 asahi@lists.linux.dev, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=947; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jbVm6nAjnuw8YGp4V7xX/Oa0mHUKBPd6W/uMcpSc5O8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIEPe+NDsQGbm9Kl+LnAdeZ+QLO7SOZWH4Wd8VQ/
 JaVmbMCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBDwAKCRAk1otyXVSH0A2PB/
 sF/I5gPRZYy3opFuD0FlW9f5auBDIsiDoIgeuT/+lMOAUQipzFVktUgfzV+6IazWz21DAuRkHqhDi/
 kDTPGUsryqbTf6ChXVZRV6ujUPZcKqaucrvtUvG6/As+KgK84l+Xzu86uG1RwcjeRjPywN2VYt1r8+
 r+bzSDtDOjZaSwwcgTFUbDON5vd5ZSsblftoElJp6I+mhsS4PqGx47Paf6E5wp/BWE4gNXP0uDTEqx
 phUreTg+6+jyW3VL0CqTjhLl/qGEabBmROQCYPmfjLWY4dMy4xtw4vGAwF/vyCLax1rTzLluzF3PxO
 BtCndBHq0Coz5lGyjSTW2edr3wAoRD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: E3CUJUDOR6VQCVTIRGHROYHRJADXY2D6
X-Message-ID-Hash: E3CUJUDOR6VQCVTIRGHROYHRJADXY2D6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E3CUJUDOR6VQCVTIRGHROYHRJADXY2D6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The cs35l30 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs53l30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index 69db0013d243..dfbd5b2b2bd9 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -911,7 +911,7 @@ static struct regmap_config cs53l30_regmap = {
 	.volatile_reg = cs53l30_volatile_register,
 	.writeable_reg = cs53l30_writeable_register,
 	.readable_reg = cs53l30_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.use_single_read = true,
 	.use_single_write = true,

-- 
2.30.2

