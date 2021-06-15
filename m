Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FF93A84DA
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 17:50:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EE01168D;
	Tue, 15 Jun 2021 17:49:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EE01168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623772241;
	bh=r6aVGaHXr6OT7yCuvc3B2Gy4u2zDuO7MZmKBYuzwQg4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cymgFr/BiYhPmSDwm65jG33YQ6vAkoZmn8SmYndRUSW4uUdhGXEn0wUBO1Du4rsYz
	 ft/b/rM4j3u/nqKhgHuW1Yb9rMKLIZ1o/F1akK3ZYe4KBw/cCngEVEoQBxoSQ0pYZ4
	 A1yMqCbiFcFl8fYX30XtZzcnHq+TX92jw7khrFwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C6FBF804E7;
	Tue, 15 Jun 2021 17:48:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5336F804E6; Tue, 15 Jun 2021 17:48:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B325F804DA
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 17:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B325F804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="I6GKW8Zf"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CCD86142E;
 Tue, 15 Jun 2021 15:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623772122;
 bh=r6aVGaHXr6OT7yCuvc3B2Gy4u2zDuO7MZmKBYuzwQg4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I6GKW8ZfBOQHkE8QMtQLsW+4mSZ3rFoJfjNUexXN2AZ3V5RyXU3mWscA+ZbOKuMvE
 0p5WxWZ/nwHWOyCca+oSupr5K3H9GUqEFFZZhdczj1qE6UNMhfy++hXSOWPxwGng9y
 mN735w7yGQ0JHebNm1kvZVAO+VOsLvRZQkAeTpDn7vkusvras5bGEbGhc47ZgQgQ8E
 d5H9td7A/d9yZgC8nf8/TxHqq03APzzrjvlhQyobqbaM8jmN1SjqznqY+sQE+A9V8k
 4EvpT4o+sge0BZe/n+ZuO2RCNxQos9n7rgCoG+w7kAhq2PVQ+3DZMIh0xTSpxcSRaa
 yrdpQLDTsI7MQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 14/33] ASoC: AMD Renoir: Remove fix for DMI entry
 on Lenovo 2020 platforms
Date: Tue, 15 Jun 2021 11:48:05 -0400
Message-Id: <20210615154824.62044-14-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615154824.62044-1-sashal@kernel.org>
References: <20210615154824.62044-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Mark Pearson <markpearson@lenovo.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Gabriel Craciunescu <unix.or.die@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Mark Pearson <markpearson@lenovo.com>

[ Upstream commit 320232caf1d8febea17312dab4b2dfe02e033520 ]

Unfortunately the previous patch to fix issues using the AMD ACP bridge
has the side effect of breaking the dmic in other cases and needs to be
reverted.

Removing the changes while we revisit the fix and find something better.
Apologies for the churn.

Suggested-by: Gabriel Craciunescu <unix.or.die@gmail.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
Link: https://lore.kernel.org/r/20210602171251.3243-1-markpearson@lenovo.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 35 -----------------------------
 1 file changed, 35 deletions(-)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 47a4dfd81a46..050a61fe9693 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -199,41 +199,6 @@ static const struct dmi_system_id rn_acp_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "20NLCTO1WW"),
 		}
 	},
-	{
-		/* Lenovo ThinkPad P14s Gen 1 (20Y1) */
-		.matches = {
-			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_BOARD_NAME, "20Y1"),
-		}
-	},
-	{
-		/* Lenovo ThinkPad T14s Gen1 */
-		.matches = {
-			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_BOARD_NAME, "20UH"),
-		}
-	},
-	{
-		/* Lenovo ThinkPad T14s Gen1 Campus */
-		.matches = {
-			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_BOARD_NAME, "20UJ"),
-		}
-	},
-	{
-		/* Lenovo ThinkPad T14 Gen 1*/
-		.matches = {
-			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_BOARD_NAME, "20UD"),
-		}
-	},
-	{
-		/* Lenovo ThinkPad X13 Gen 1*/
-		.matches = {
-			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_BOARD_NAME, "20UF"),
-		}
-	},
 	{}
 };
 
-- 
2.30.2

