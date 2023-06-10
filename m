Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA3A72AC08
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:02:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F02EA82B;
	Sat, 10 Jun 2023 16:01:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F02EA82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405740;
	bh=uovW9x7QeI5Vw8FamZ4fNGKWL57LoO3QGHMwuBR6qEY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bRiHfnmnPE9l2dt2fJANC3oF+xitRDllwVrjOyOc7CmNr+6AyzEjnPLDFGJ+wLhjJ
	 mLAt249TVD0gxA0xHhAvs/hZpMe5BdaBuXV0XIaiDbD57aoDA41Z8wTfr3xnjxP4HI
	 w9FSSQx9tavvWh5L9G85Hyt0cJ6PzpX6s1NxiHDs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0EE3F805E2; Sat, 10 Jun 2023 15:59:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D86BF8059F;
	Sat, 10 Jun 2023 15:59:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0D61F804DA; Sat, 10 Jun 2023 15:56:59 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3008CF80155
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:56:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3008CF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qCI0lVBf
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 06FC8612A4;
	Sat, 10 Jun 2023 13:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF37C4339B;
	Sat, 10 Jun 2023 13:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405414;
	bh=uovW9x7QeI5Vw8FamZ4fNGKWL57LoO3QGHMwuBR6qEY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qCI0lVBfpxlOWc/W723liZ3bA12EYep69q3eRfcT1U1w05FbsT/8HvNqpwwt2fUKo
	 4AAEtthPMeWuXcnSlp1HAlvYwaq3cpKqTEo8UzW6mrGmWlLZ7/TpVfnTxAt3l5OO9Q
	 U+KGexRLechivw7ueo9+hPEi90U94qbgm4+vg+uj+0I+yyIb9Z5uXReicPqiq+lwr4
	 FK8xX3ZvuxBhLznIh+bf5GvmH0jOsJ5N2li7KZArIRx6JHGuTGjeEnLfQ3vikerYKC
	 26+vWfLkGyZXZcrgTRlkzcz+vKBxe8LdJuYfli9K80QunD6z1oQLNDvQcQYmlrNclt
	 W++lPDSgLMGEw==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:56:29 +0100
Subject: [PATCH 09/10] ASoC: cs43130: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-cirrus-maple-v1-9-b806c4cbd1d4@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=989; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uovW9x7QeI5Vw8FamZ4fNGKWL57LoO3QGHMwuBR6qEY=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhpSWRr5olVNFYp1BJr7Xm8Of/Od9r8mW7uP+PPzcjTQ3xcd7
 pIQ6GY1ZGBi5GGTFFFnWPstYlR4usXX+o/mvYAaxMoFMYeDiFICJxM1g/6cp3ZMkM5Hp7xS/0P8z1q
 RfPqYza5IZy3Ph6u/JvbKutUeastz/vTy28Y99lcjKgolbH9/uOu/xWLv03DWeX+5SW26HTdjtGNRl
 3hUzgWPiRWffBj17japypciXu87XnLM0qPghzPtB2+v8aVV+x+a7a+wdrRh0Z86/v7Dj+OUA933hXm
 Iq8fyVgjw/J3a3XFoTncZ/lOEzt/oEnRobS2+O06saZ/1665YipHDrKMfXB3/b/wjy+HncE4lXf+OW
 tj+myOdcmpxhsI7ykci8n/VFV++1HtnucD47Ne+f0LcpmwUdM/t79DzeCETonDbTTN0X8mze32v8/N
 GuJ/7UsSnkxKkyc3G+D3HzDjsFAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: ZBEQ6CA2L6QQTHCFCLFP5WFIOU4KDUNP
X-Message-ID-Hash: ZBEQ6CA2L6QQTHCFCLFP5WFIOU4KDUNP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZBEQ6CA2L6QQTHCFCLFP5WFIOU4KDUNP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The cs43130 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs43130.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index db39abb2a31b..b81257f0ab34 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -2357,7 +2357,7 @@ static const struct regmap_config cs43130_regmap = {
 	.readable_reg		= cs43130_readable_register,
 	.precious_reg		= cs43130_precious_register,
 	.volatile_reg		= cs43130_volatile_register,
-	.cache_type		= REGCACHE_RBTREE,
+	.cache_type		= REGCACHE_MAPLE,
 	/* needed for regcache_sync */
 	.use_single_read	= true,
 	.use_single_write	= true,

-- 
2.30.2

