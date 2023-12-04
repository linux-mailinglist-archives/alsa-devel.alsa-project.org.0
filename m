Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17432803FC5
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 21:36:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E27E7F4;
	Mon,  4 Dec 2023 21:35:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E27E7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701722162;
	bh=C2U2qrCynZxI56Zkj6LUzA8sFR5k/ZUF1IMLPjunjXM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZUSiv9QodOCTPFmtD+NfAYOQs1mhK2daLnZGSABlD3H0SgDy4Clo1Tacmlo0M6+8x
	 PFxvf3TgK/nY/oF9qSCpZpj5le7t74uWJCEufMz7eugMVlhsh0UROhDz62jfuOwEaY
	 TbiFFoOgs3gJ8QYWwZIjVhV5OpO7Zkw6EWxzGVGQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE957F80563; Mon,  4 Dec 2023 21:35:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4051BF800E4;
	Mon,  4 Dec 2023 21:35:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB837F8024E; Mon,  4 Dec 2023 21:35:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 586FAF800D2
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 21:35:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 586FAF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kfpePyU1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 684C4CE12EB;
	Mon,  4 Dec 2023 20:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4044C433CA;
	Mon,  4 Dec 2023 20:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701722118;
	bh=C2U2qrCynZxI56Zkj6LUzA8sFR5k/ZUF1IMLPjunjXM=;
	h=From:To:Cc:Subject:Date:From;
	b=kfpePyU1kYjofn5AW34bsIYfYkR8+w4QT+ZdqrS09kaa5KHDUco4Zw7IAeI8kYsAS
	 WJ2FY+80dCTzhLhhutYMldZtDJfEijElp9KvIt6jE9/I1oQvWC6ZCl+q/4r0UXDtD4
	 0HNEleormdZzCI/ZGJIy5oao3sEbLk3pnaygypbABo/4YrQbQKCTiXa95RYgToa0U8
	 NZOFUehFsdYQupxW/SkI7zMrdPF2Fq4OWVx307G+0fcvYeATnsfPuSXqieAuYT9lp0
	 a9kCFTz5K4o8bdLMWrYsTOHgitSItmNVr1VIMUmp0vQebxrScvfOSc7q8Ni2uvNTdp
	 bLB9fSBdYafhg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	kernel test robot <lkp@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	rf@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 01/17] pinctrl: lochnagar: Don't build on MIPS
Date: Mon,  4 Dec 2023 15:34:46 -0500
Message-ID: <20231204203514.2093855-1-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.65
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RZV342VND6F45KK2Y2B6N2MQ4EE6ZFIU
X-Message-ID-Hash: RZV342VND6F45KK2Y2B6N2MQ4EE6ZFIU
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZV342VND6F45KK2Y2B6N2MQ4EE6ZFIU/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

[ Upstream commit 6588732445ff19f6183f0fa72ddedf67e5a5be32 ]

MIPS appears to define a RST symbol at a high level, which clashes
with some register naming in the driver. Since there is currently
no case for running this driver on MIPS devices simply cut off the
build of this driver on MIPS.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311071303.JJMAOjy4-lkp@intel.com/
Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20231115162853.1891940-1-ckeepax@opensource.cirrus.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/cirrus/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/cirrus/Kconfig b/drivers/pinctrl/cirrus/Kconfig
index 530426a74f751..b3cea8d56c4f6 100644
--- a/drivers/pinctrl/cirrus/Kconfig
+++ b/drivers/pinctrl/cirrus/Kconfig
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config PINCTRL_LOCHNAGAR
 	tristate "Cirrus Logic Lochnagar pinctrl driver"
-	depends on MFD_LOCHNAGAR
+	# Avoid clash caused by MIPS defining RST, which is used in the driver
+	depends on MFD_LOCHNAGAR && !MIPS
 	select GPIOLIB
 	select PINMUX
 	select PINCONF
-- 
2.42.0

