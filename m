Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F8472AC4D
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:29:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27CDF829;
	Sat, 10 Jun 2023 16:28:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27CDF829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686407386;
	bh=lLTwQrldiZyaAtNbV67vCJb0+moYOOUyL+RqcwQp46c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nZRZdBFNn1Ccav62UwJk7YFnoqU6Y+e+B8ofU020DpHPWSwLsvvSV8sQ0Z3PLISJm
	 qXvoB6zWeKeiVKRnIoF70zdGPmgyKKjDIBCQqQhhUqgNvMyV1nqguPmDr/zZYS1m0t
	 +BPceInKrxFmVG0dyCEoH/Iwvv9IC/LC4nGAVEak=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0882BF805B1; Sat, 10 Jun 2023 16:27:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65271F805AC;
	Sat, 10 Jun 2023 16:27:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EE65F80579; Sat, 10 Jun 2023 16:27:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF3B1F80254
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 16:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF3B1F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ghUdLNq3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 782FD60DE8;
	Sat, 10 Jun 2023 14:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B174C4339B;
	Sat, 10 Jun 2023 14:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686407255;
	bh=lLTwQrldiZyaAtNbV67vCJb0+moYOOUyL+RqcwQp46c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ghUdLNq3JxVYpXhfk4OLvB0ju9gP77QEKRqnbHmyf9p9zFwwVT3blQp+0fiTb+Ss5
	 wCCaVV4hrH6DKSf/gYtuZhSdNMYEw3QbZZzuSWopD+3tX6vR/PmRLpXvbyZ8WkMZ0z
	 yPns1ItgY42U3sJXYczV/0WvDV3PS3qhOUmlO43wKCrrMwtfYJOSuSo+jNiyxvz0mZ
	 T33f9BBtb/8wXPvoZ/S5ixW72U0dejsJCSrYMoFe2/K6Q457V4DP+zibN22+Jht/Fd
	 cShD/rmKRmk5uou0KZWoHjw9pGdPUdGyUZZLhidJntvzibaXwfP0U3eZQcODRKzu9g
	 ZWm7KMKQTgD/w==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 15:27:16 +0100
Subject: [PATCH 5/8] ASoC: rt722: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-sdw-maple-v1-5-85ee50c93905@kernel.org>
References: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
In-Reply-To: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1335; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lLTwQrldiZyaAtNbV67vCJb0+moYOOUyL+RqcwQp46c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIhN+JA48XEyLfuSsEYpmfZNvZ895eBmOmliEoJS
 /r819CiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISITQAKCRAk1otyXVSH0JvUB/
 0aLmuZtKjVDbBzOC047a+hFCpeGDYPmm0zfpb3qi8v+cDrRkC2Ju3fawdXunR9K4uXZGek5NzlujrQ
 ANWXziWk/exqpdF9LTh21TyhWty9ycorBlv554Q6deKU86yV/TWq+qaPz5+yL8QuBuI9NEx3/TwL7y
 DjQU1RVpISXUar/Mgywh6nMxaP1EmNm3xdry1dnw5lCgW0pl00Sy+YFSWtGeM1m7BZp8Yg4j7Ns6U7
 IPicKtoFYdnRRlvz1MSrnvAGnCEjr26B7b9XflJJ4wCNNB9OpHs9CoVWCmLybBTB5ecbzfwq6oTdl6
 SdHKfB32KdgBhkbqV7g7hd+U0qvqEZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: LFY6YZY7JHGCWNH5MXB6BSAXGQJCORY3
X-Message-ID-Hash: LFY6YZY7JHGCWNH5MXB6BSAXGQJCORY3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LFY6YZY7JHGCWNH5MXB6BSAXGQJCORY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt722 can only support single register read and write operations so
does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt722-sdca-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index bfb2dac6bfee..cc57e4e27805 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -139,7 +139,7 @@ static const struct regmap_config rt722_sdca_regmap = {
 	.max_register = 0x44ffffff,
 	.reg_defaults = rt722_sdca_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(rt722_sdca_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 };
@@ -153,7 +153,7 @@ static const struct regmap_config rt722_sdca_mbq_regmap = {
 	.max_register = 0x41000312,
 	.reg_defaults = rt722_sdca_mbq_defaults,
 	.num_reg_defaults = ARRAY_SIZE(rt722_sdca_mbq_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 };

-- 
2.30.2

