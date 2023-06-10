Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9083572AC09
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:02:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF6A1836;
	Sat, 10 Jun 2023 16:01:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF6A1836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686405751;
	bh=3ef+87+yP4lycSwkYTARXRUFWygTQ/ITE4ODdtzYAXM=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jLEGvRRaXZI9Tckw6XrCRbTWsSRZNl+Tx97AltXb0yJzkdH68rDd/kUtH3TNjYMMb
	 L+JbOy9ohlE2v5O/4JTMiTZN6HCYmv0tHG5O24zAZMuM8rTdZI2b/bTPEZT/1qraFF
	 9Wnq3mDCGdhmTnR98g1iFnhrF9v0sgtyjLpsysAI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCC4EF805F4; Sat, 10 Jun 2023 15:59:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C802F805D8;
	Sat, 10 Jun 2023 15:59:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E26EF80494; Sat, 10 Jun 2023 15:58:12 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id ACD10F800C8
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 15:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACD10F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jlk+HdwG
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8327160A3B;
	Sat, 10 Jun 2023 13:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16736C433D2;
	Sat, 10 Jun 2023 13:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405486;
	bh=3ef+87+yP4lycSwkYTARXRUFWygTQ/ITE4ODdtzYAXM=;
	h=From:Subject:Date:To:Cc:From;
	b=jlk+HdwGmT/J1RT29Qb8r9O7QBn/rKlAJITgUCUpPS5jo5ErQofa++y0ZXXvhqjvy
	 sPslopVRoFKy39DNb7P5jygwIqegKY/9t/gJDdqjQuV0qUa+1PBVAyRfmDLQwkU2HR
	 QYObVylmPsnLm9sOaqPHT1JDUFqj+Hx6mYYIj88onaCqSksUccJFWYHEW9IySgP3Zd
	 WgVItFmnLRSl5NbR9IRr4U33wFaW05t0LTF8RSgoqGKM5Y05vQoBjrBpjrcfHoOzfB
	 jjKHhY4LH5pEx4QV44TU1cfAq010+/2SNDu2CQUyBpWG0ZU/ch+UG1QG+SNCI9UA/Y
	 Dwe1wWtzb9LwA==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 00/16] ASoC: Convert Realtek I2C drivers to use maple tree
 register cache
Date: Sat, 10 Jun 2023 14:57:46 +0100
Message-Id: <20230609-asoc-rt-maple-v1-0-729c6553cdcf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFuBhGQC/x2N0QqDMAwAf0XyvEDXUZ37lbGHWKOGba0kYwriv
 6/u8Q6O28BYhQ1u1QbKXzHJqcD5VEGcKI2M0hcG7/zF1a5FshxRP/im+cV4pSaw76kNIUBpOjL
 GTinF6aiWrM9Dz8qDrP/N/bHvP5z2R5d2AAAA
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1948; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3ef+87+yP4lycSwkYTARXRUFWygTQ/ITE4ODdtzYAXM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIFfngPBfP3cVO/PoYMQHeqaCf8bZRUVXzs/Nbeo
 Q4svaTyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBXwAKCRAk1otyXVSH0DC7B/
 9o6a/W5nRrnL7TepWJ/+uhsKTYpP8JCE+UnoAsPLM2uPONpzxQsjQJwUvpcdBVSZVkYcVjlHsLt8KA
 ngrZL/2/4Q2rA0qKgBd1TQTgXlpUz7Xcg6HwyjddOul5AKbbVuR6TzF3xquOH1S2Z+ydig23D+XvOg
 KVxFZ0qLlWzb2XpJopJbrjmt9bgz20BNagUi9ggkz7mQZpZmTHW103vYI+1BmFX73IK0K8LBiMfC2o
 OBHBuZoEQQQB51sH0BL3y1LTSglFfP6YQ1t2Ljlu2UKv1JlWj+OZCMWSvBHYhYFOC+t5+bQ1T2zzun
 ia1JvyV3FTchw83mX1cCNt102Pv/8p
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: G6UL4PWQPCPY2WIK6ERBSY3CA35BHEEX
X-Message-ID-Hash: G6UL4PWQPCPY2WIK6ERBSY3CA35BHEEX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G6UL4PWQPCPY2WIK6ERBSY3CA35BHEEX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Many of the Realtek I2C/SPI devices only support single register read
and write operations so don't benefit from using the rbtree cache
instead of the more modern maple tree cache, convert them to maple tree.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (16):
      ASoC: rt1011: Use maple tree register cache
      ASoC: rt1019: Use maple tree register cache
      ASoC: rt1305: Use maple tree register cache
      ASoC: rt1308: Use maple tree register cache
      ASoC: rt5514: Use maple tree register cache
      ASoC: rt5616: Use maple tree register cache
      ASoC: rt5631: Use maple tree register cache
      ASoC: rt5640: Use maple tree register cache
      ASoC: rt5645: Use maple tree register cache
      ASoC: rt5651: Use maple tree register cache
      ASoC: rt5660: Use maple tree register cache
      ASoC: rt5665: Use maple tree register cache
      ASoC: rt5665: Use maple tree register cache
      ASoC: rt5668: Use maple tree register cache
      ASoC: rt5670: Use maple tree register cache
      ASoC: rt5682: Use maple tree register cache

 sound/soc/codecs/rt1011.c     | 2 +-
 sound/soc/codecs/rt1019.c     | 2 +-
 sound/soc/codecs/rt1305.c     | 2 +-
 sound/soc/codecs/rt1308.c     | 2 +-
 sound/soc/codecs/rt5514.c     | 2 +-
 sound/soc/codecs/rt5616.c     | 2 +-
 sound/soc/codecs/rt5631.c     | 2 +-
 sound/soc/codecs/rt5640.c     | 2 +-
 sound/soc/codecs/rt5645.c     | 4 ++--
 sound/soc/codecs/rt5651.c     | 2 +-
 sound/soc/codecs/rt5660.c     | 2 +-
 sound/soc/codecs/rt5663.c     | 4 ++--
 sound/soc/codecs/rt5665.c     | 2 +-
 sound/soc/codecs/rt5668.c     | 2 +-
 sound/soc/codecs/rt5670.c     | 2 +-
 sound/soc/codecs/rt5682-i2c.c | 2 +-
 16 files changed, 18 insertions(+), 18 deletions(-)
---
base-commit: 9561de3a55bed6bdd44a12820ba81ec416e705a7
change-id: 20230609-asoc-rt-maple-8a75e2da9555

Best regards,
-- 
Mark Brown <broonie@kernel.org>

