Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 309177113D6
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 20:33:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70A20206;
	Thu, 25 May 2023 20:33:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70A20206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685039638;
	bh=TQ11Nxh2OcO48SMDrGUoUDr9OLdFd43bQOf6sBAJnKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G2k6gSFccYmvEwyf5YIAvyo96A/R4xUEBf5U5fex7UnCvLIxWmWptwHdMAVwZIP36
	 DkemafsdCq9GUt+rW1bmws6F8o6JYZLXs/2FTAnxTDUpkWuxYmzyrQbha6ST0dXAdD
	 YnNRIW6SFVZeQb5+Ib14ph3aDzYEd2kjFsiN4FWI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BE8CF8055A; Thu, 25 May 2023 20:32:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F021CF80551;
	Thu, 25 May 2023 20:32:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38659F80551; Thu, 25 May 2023 20:32:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3562F800DF
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 20:32:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3562F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=n8H6dpzV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1922A64890;
	Thu, 25 May 2023 18:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6354EC433EF;
	Thu, 25 May 2023 18:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685039524;
	bh=TQ11Nxh2OcO48SMDrGUoUDr9OLdFd43bQOf6sBAJnKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n8H6dpzVMEVDPK0CRsk0iLuHOuqY3Nt6dnKBWaZjOj+cAVBZk0IxUh2vkiagGsCDd
	 lQlou3e9FpJ0O4g3yo79OIqkseTyaJepLKjtHszUW4qr4p7yyPN+I06BSr0JZsvof+
	 3Fd486b2Om0sIU8wGwG3vOkIe1d15rbzD9EGqxEAdRTYzP7oBHd5aYcwOgRJo6YYvK
	 LzDE2gE1UKseULnodb36i+F5N9pk4+1gQzXdoR7u3homk5VKPralpHe6hl4otmAplN
	 QfJhE3JOjhl7fbSkj7h87VC2Vo29pxyyj3n2/qfMqu2eOq49lFSLUx6ZpmavXRENLR
	 vbkGCJBe8fkCQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	u.kleine-koenig@pengutronix.de,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.3 05/67] ASoC: dwc: limit the number of overrun
 messages
Date: Thu, 25 May 2023 14:30:42 -0400
Message-Id: <20230525183144.1717540-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525183144.1717540-1-sashal@kernel.org>
References: <20230525183144.1717540-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BJ4RJRLQPVO2T4LQ55IB2JDUZJ6OSXRW
X-Message-ID-Hash: BJ4RJRLQPVO2T4LQ55IB2JDUZJ6OSXRW
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BJ4RJRLQPVO2T4LQ55IB2JDUZJ6OSXRW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Maxim Kochetkov <fido_max@inbox.ru>

[ Upstream commit ab6ecfbf40fccf74b6ec2ba7ed6dd2fc024c3af2 ]

On slow CPU (FPGA/QEMU emulated) printing overrun messages from
interrupt handler to uart console may leads to more overrun errors.
So use dev_err_ratelimited to limit the number of error messages.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru
Link: https://lore.kernel.org/r/20230505062820.21840-1-fido_max@inbox.ru
Signed-off-by: Mark Brown <broonie@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/dwc/dwc-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 7f7dd07c63b2f..3496301582b22 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -132,13 +132,13 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
 
 		/* Error Handling: TX */
 		if (isr[i] & ISR_TXFO) {
-			dev_err(dev->dev, "TX overrun (ch_id=%d)\n", i);
+			dev_err_ratelimited(dev->dev, "TX overrun (ch_id=%d)\n", i);
 			irq_valid = true;
 		}
 
 		/* Error Handling: TX */
 		if (isr[i] & ISR_RXFO) {
-			dev_err(dev->dev, "RX overrun (ch_id=%d)\n", i);
+			dev_err_ratelimited(dev->dev, "RX overrun (ch_id=%d)\n", i);
 			irq_valid = true;
 		}
 	}
-- 
2.39.2

