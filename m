Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 806DF76936C
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 12:49:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C4DA84A;
	Mon, 31 Jul 2023 12:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C4DA84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690800544;
	bh=YnJy0NhEnRLR/JM2gYOkdO9V3g9/7Ef01+MnHCUiCJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o5cHeNY0iLGo2kIRwN9cenXgkFRYt6JHMX3YylP++zCmQlpNLCaPNC0lJqTZXSjTG
	 VtPZ2+CJ9MZpHnAL0fktwGciC8eJgNQXm9G8zAByL9Q4T9swXyWri5FZAJ9XnwobUd
	 cBkE/NZ1ey50D6q+d9Z7TZ0eU2tT1nNOO9snSF1A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 038B1F80553; Mon, 31 Jul 2023 12:47:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 921D0F8016D;
	Mon, 31 Jul 2023 12:47:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 088B6F801D5; Mon, 31 Jul 2023 12:47:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0767DF80149
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 12:47:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0767DF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PZ72nFU0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8AC4E61011;
	Mon, 31 Jul 2023 10:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B15C433C8;
	Mon, 31 Jul 2023 10:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690800435;
	bh=YnJy0NhEnRLR/JM2gYOkdO9V3g9/7Ef01+MnHCUiCJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PZ72nFU06LGBPFHONQqduy+pDgblluRx0gmqJElkRxU4F5jnkuGHP6pFYg+bfsc+v
	 Llk6VUy9xTSFbbhkVmuGN32BF5/8Zfy5pxTxHRhpkyOqaz7whw6GKEOZGiEFlHq7se
	 LZ10qPnfh7F5T0s0f4fKfhRQ+LqQdQyth1Ep1xqGE30BCqPDBgv/X6e12yuQIOp/W6
	 9ZhehqQhUQ08LkTtjmRDbwRG7mCm0sqMWhZIRMcHUvwrFLBaM3M+hVMYxfxWzr5Nz0
	 HULV5ZqCRC7lUo8NcqQ2YzWSEm6QmuA692njYi/I7UI4NYLjRdHPnAS9Kj9Khz/J8j
	 9bpScaWCYpUew==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 31 Jul 2023 11:47:03 +0100
Subject: [PATCH 2/2] ASoC: wm8960: Make automatic the default clocking mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230731-asoc-wm8960-clk-v1-2-69f9ffa2b10a@kernel.org>
References: <20230731-asoc-wm8960-clk-v1-0-69f9ffa2b10a@kernel.org>
In-Reply-To: <20230731-asoc-wm8960-clk-v1-0-69f9ffa2b10a@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YnJy0NhEnRLR/JM2gYOkdO9V3g9/7Ef01+MnHCUiCJc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkx5EqFH1dsHVKHxX6uua2BB9XrmeAauNdz/12X
 mfWEJ2svueJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZMeRKgAKCRAk1otyXVSH
 0CduB/9pfk3JXuSilsdifv0cne2PP4RxftvPIggCM8Hz31wV8ERhQ9IwF20omZL13splslrTxxn
 4wBpSaXnjmge5L2HXnlVucQSGRQHqm5hZoZQHt2B6FACrEhYE9ap8z9rTDCpdIae95JJItOLdoH
 bYmH09RrTAGcZQO9bFPibg2cDA8KG4iQk4LrhUws+UPN75EWKsakLpqioBwB403J1L0X9vPwI++
 HlojDz3LEBRMX3CvCLhw90dGQidMcGTBaImSSYNempGBssDBEcJVC0uc2p/vMc57NDRXG09s0Px
 BC4MmJzN3z4ky7IdslNpwsaaopMUvQqLBuNU6pxssxg/9c0n
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: YJ5XYEGECKFJBPY7DLRL4VEMMGL2WAZQ
X-Message-ID-Hash: YJ5XYEGECKFJBPY7DLRL4VEMMGL2WAZQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YJ5XYEGECKFJBPY7DLRL4VEMMGL2WAZQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The wm8960 driver supports an automatic clocking mode which will use the
MCLK directly where possible and fall back to the PLL if there is no
suitable configuration directly using the MCLK.  Clock 0 will be used by
the generic cards when configuring things, currently this is a MCLK only
mode but using AUTO mode would be more functional.  Since the driver
still prefers to use MCLK directly where possible there should be no
negative impact on systems which are able to use MCLK directly.

As far as I can see nothing is using the system clock as part of the
ABI, the only reference I can see to a mode in a machine driver is the
Freescale i.MX card which uses the automatic mode with an explicit in
kernel call using the constant so will be unaffected.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8960.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8960.h b/sound/soc/codecs/wm8960.h
index 63ba6c03c488..e8ff33b188e9 100644
--- a/sound/soc/codecs/wm8960.h
+++ b/sound/soc/codecs/wm8960.h
@@ -77,9 +77,9 @@
 #define WM8960_SYSCLK_DIV_1		(0 << 1)
 #define WM8960_SYSCLK_DIV_2		(2 << 1)
 
-#define WM8960_SYSCLK_MCLK		(0 << 0)
+#define WM8960_SYSCLK_AUTO		(0 << 0)
 #define WM8960_SYSCLK_PLL		(1 << 0)
-#define WM8960_SYSCLK_AUTO		(2 << 0)
+#define WM8960_SYSCLK_MCLK		(2 << 0)
 
 #define WM8960_DAC_DIV_1		(0 << 3)
 #define WM8960_DAC_DIV_1_5		(1 << 3)

-- 
2.39.2

