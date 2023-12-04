Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8574B803FF6
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 21:37:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03DD7832;
	Mon,  4 Dec 2023 21:36:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03DD7832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701722228;
	bh=C2U2qrCynZxI56Zkj6LUzA8sFR5k/ZUF1IMLPjunjXM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vSJ3aIenxBW5FDtYTlJy3Qs/20p0RQolO9gvPftDgCgjPzJLNNEHxGMT02SWAtsd1
	 7t43MyPJ1aensuQm48DKn6PRO7atSOiVfQsCBX0gmL8bZ9Gwdl3gRE/BeJYEcriP84
	 iPePUqRAarvoQ5zLXPt+JqUuKLnTCE90chxeDC/k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB225F80589; Mon,  4 Dec 2023 21:36:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58B66F80571;
	Mon,  4 Dec 2023 21:36:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF965F8024E; Mon,  4 Dec 2023 21:36:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88767F800E4
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 21:36:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88767F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PI6lzptj
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6A876CE12FB;
	Mon,  4 Dec 2023 20:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2187FC433C9;
	Mon,  4 Dec 2023 20:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701722180;
	bh=C2U2qrCynZxI56Zkj6LUzA8sFR5k/ZUF1IMLPjunjXM=;
	h=From:To:Cc:Subject:Date:From;
	b=PI6lzptjvMU1ws9NyonJRAuDY15E8rv/xZOD1fi+XsaH7xRAqZ5JtWzNKu1IzAyIy
	 3cKxn/yG0xHjPoJdtzVNKYzSG7L2kBoSsImRj/f980fx2wdZfv3J//CIc2tm7QzpU+
	 S61mFKfubhgq/Ew8ECbAf3qiByZLw3o+YQd9iOPXtA5ra6+0pIQBxA86/0g5z/OOvQ
	 8uLEjImaVKTNiV8S+cNQee9eLV1LMqjdjsmjDoyx5iVdobzF6kFwjB4kcfcNKYn1VG
	 1/ppj8jWWQAX3rY0kCab06mJk9s4KSy2FIf0NPQh96WLMvO2UJDHaPaPUhBDxZcqKg
	 rxjiH0FnUK4SA==
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
Subject: [PATCH AUTOSEL 5.15 01/10] pinctrl: lochnagar: Don't build on MIPS
Date: Mon,  4 Dec 2023 15:35:58 -0500
Message-ID: <20231204203616.2094529-1-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.141
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6HQJVZIZGEQZSOWC7IK3Q5SGFHSIQAGC
X-Message-ID-Hash: 6HQJVZIZGEQZSOWC7IK3Q5SGFHSIQAGC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6HQJVZIZGEQZSOWC7IK3Q5SGFHSIQAGC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
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

