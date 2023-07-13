Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E41EA75159C
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:55:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48AF7E7D;
	Thu, 13 Jul 2023 02:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48AF7E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689209759;
	bh=DcoEvYheopgrQDi8DNh3R3S9w3R74TioORNRzPvufsU=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=P3WjeadOxGVMVVVL0Yu4SB4vQggn8M1mLkwtD5JFITe/sqi1jjaNJdEyJtfM3X29h
	 G1cPGo9cVaqMlLKOcx4gPgMaiOmq+gxLyg65DY7ivEceINPBt2WvzKxQ60cDaw3CyC
	 K5GXhb+pkY5YlgJwvRnKJr/eo/RCLSWPOtTvGSUA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D0DFF8057A; Thu, 13 Jul 2023 02:54:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE9EAF8057A;
	Thu, 13 Jul 2023 02:54:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67B52F80557; Thu, 13 Jul 2023 02:53:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB111F80236
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:53:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB111F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qBedp93f
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AD30861804;
	Thu, 13 Jul 2023 00:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71608C433C7;
	Thu, 13 Jul 2023 00:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689209621;
	bh=DcoEvYheopgrQDi8DNh3R3S9w3R74TioORNRzPvufsU=;
	h=From:Subject:Date:To:Cc:From;
	b=qBedp93f9ec/meBoS/A3SOlbv/DZI+Jb+G5DVOui8AxANEsJ8dOLRfvrMBsoXUMYQ
	 TvRGgAggQ0dvLpwbBpnqLx2NhrdWOMPpjV5KfdugKJ77WoSwWvsYhAMHFIptUX4BoK
	 BDvFHCzRrHbRjGc/oAbOVTZoh+8gvxF29KNA8ZzorhIH3g+g1NLEufro8WgUWNCAnc
	 I+WvFr+qI8hVYNitLBTXNtwFk4zzRa0NX/5cwXTpZy2hPGnI3jQ/Kig+KqPm1WQ7hX
	 I2zFZwtU7qDulE/P6k4NKVFYTfNgzP94yUohDU2oYymbdNCa24r9Bs1vF1i7mqa7wk
	 PybPo06JOcqfA==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 00/11] mfd:: Update Cirrus Logic drivers to use maple tree
 register caches
Date: Thu, 13 Jul 2023 01:49:18 +0100
Message-Id: <20230713-mfd-cirrus-maple-v1-0-16dacae402a8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA5Kr2QC/x2NQQrCQAwAv1JyNlCztYhfEQ/ZbWoD7lqSKkLp3
 932OAzDrOBiKg63ZgWTr7q+S4XzqYE0cXkK6lAZqKXQ9hQwjwMmNfs4Zp5fgl0MdO3DhSIz1Cy
 yC0bjkqY9zOyL2C5mk1F/x+v+2LY/Vx0VmnsAAAA=
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1906; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DcoEvYheopgrQDi8DNh3R3S9w3R74TioORNRzPvufsU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0sJ6BvFNMfr6b/z11DVDFKXT92YsUbBF8hTV
 aZQReHc9gKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9LCQAKCRAk1otyXVSH
 0ImRB/0bh89vd7Y1kkagOtJ9hrsYWv/LfYtlll/I1kStvRUK6h97GJWOEqz9qByUVnPyxxUwoHm
 LYTkzS1lae7cCwcrGtiHPZI7hIv7m+5Q/o5H3wi6I636MpflRzub3ryMUJJKT3HQU2ploTNQvKT
 Xrj+XD/YQqFm+QpSj9s8OqBcnGqPZald5BQLu8qrKrwHs60+tjBqe75UK6ZF/n/LLBe4VTbKHZn
 YZ3KOTWVBsnyFDNf8CCyGMqlvNrktuvZ+X/u11z5rt+oVCq2+/a2preFjupzIdmbc6sicthnSgt
 IKldpz+b0kSOKTkZY9sz9pnqzWO03VPsxVobyRpgIVb/6aHM
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: Q6Q76V73CEB6TBWQCDJR74OX3Z2NR6GO
X-Message-ID-Hash: Q6Q76V73CEB6TBWQCDJR74OX3Z2NR6GO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q6Q76V73CEB6TBWQCDJR74OX3Z2NR6GO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

With the v6.5 merge window the maple tree register cache has acquired
the ability to generate multi-register writes during sync operations,
removing the last major limitation it had compared to the rbtree cache.
As part of a general modernisation effort update the Cirrus Logic
drivers to use the more modern data structure, realistically there is
likely to be very little user visible impact either way but generally
the implementation choices of the maple tree cache should be a bit
better on modern hardware.

Signed-off-by: Mark
---
Mark Brown (11):
      mfd: cs47l15: Update to use maple tree register cache
      mfd: cs47l24: Update to use maple tree register cache
      mfd: cs47l35: Update to use maple tree register cache
      mfd: cs47l85: Update to use maple tree register cache
      mfd: cs47l90: Update to use maple tree register cache
      mfd: cs47l92: Update to use maple tree register cache
      mfd: wm5102: Update to use maple tree register cache
      mfd: wm5110: Update to use maple tree register cache
      mfd: wm8994: Update to use maple tree register cache
      mfd: wm8997: Update to use maple tree register cache
      mfd: wm8998: Update to use maple tree register cache

 drivers/mfd/cs47l15-tables.c | 8 ++++----
 drivers/mfd/cs47l24-tables.c | 2 +-
 drivers/mfd/cs47l35-tables.c | 8 ++++----
 drivers/mfd/cs47l85-tables.c | 8 ++++----
 drivers/mfd/cs47l90-tables.c | 8 ++++----
 drivers/mfd/cs47l92-tables.c | 8 ++++----
 drivers/mfd/wm5102-tables.c  | 2 +-
 drivers/mfd/wm5110-tables.c  | 2 +-
 drivers/mfd/wm8994-regmap.c  | 6 +++---
 drivers/mfd/wm8997-tables.c  | 2 +-
 drivers/mfd/wm8998-tables.c  | 2 +-
 11 files changed, 28 insertions(+), 28 deletions(-)
---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230623-mfd-cirrus-maple-4b3286352baa

Best regards,
-- 
Mark Brown <broonie@kernel.org>

