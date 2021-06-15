Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 397413A854D
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 17:52:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B36AD169D;
	Tue, 15 Jun 2021 17:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B36AD169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623772377;
	bh=pd9R6xgegGcJEdj1nhvStM5JUqlgIvuKqAtpektwa5g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kBSlUvp3gqEtvuAuPuDcshxtbLSfdOtOcz8I2uHbW+BIANFnJ/lrjvZpRlgcyo9yo
	 WNtNaUZPiPvPszUf0hLHDEfiSXrue25lef3gb4RFek0XMg54U5YtLiBT9ztovZdRVC
	 E1TGBsq9xzLQgiCwMe6I2OFfPgocFbVU7Elh7wx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25A7CF80510;
	Tue, 15 Jun 2021 17:49:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27C20F80511; Tue, 15 Jun 2021 17:49:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32C28F8016C
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 17:49:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32C28F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jDSpK8R3"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 574F46191E;
 Tue, 15 Jun 2021 15:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623772161;
 bh=pd9R6xgegGcJEdj1nhvStM5JUqlgIvuKqAtpektwa5g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jDSpK8R3AQQ3MVbaFRWx6Z/UQ74U/+cOQmhHkvRGEELArZHLlOx31+Gl3/VhfSYXc
 pNDMp907z/nmvlJ6PGyRGMEnHEmb8Yh4YmZRyljrtmEW60c+wO87vpdQDYVCAiURug
 ml17VD8UWNQNPvgXxPIrLwRp44qoUJVfLUmWuX2/McLO9OxNxTsRTsmw8kbBOXg5k4
 MC/dHa1Ht6GVkp9cdjMNTUBrAAcCVhs24kj5fYRz2TuJzGxa47GRbyF7pCRgAg7SGD
 3pcMHpJhIAfDKaOgHwBm4kkQZfFCxsThNKUeD+lcpHmbmZMbrcvH3xNVAvMftU5iKK
 foEjAfTxWFGRg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 10/30] ASoC: AMD Renoir - add DMI entry for
 Lenovo 2020 AMD platforms
Date: Tue, 15 Jun 2021 11:48:47 -0400
Message-Id: <20210615154908.62388-10-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615154908.62388-1-sashal@kernel.org>
References: <20210615154908.62388-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Mark Pearson <markpearson@lenovo.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Gabriel Craciunescu <nix.or.die@gmail.com>
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

[ Upstream commit 19a0aa9b04c5ab9a063b6ceaf7211ee7d9a9d24d ]

More laptops identified where the AMD ACP bridge needs to be blocked
or the microphone will not work when connected to HDMI.

Use DMI to block the microphone PCM device for these platforms.

Suggested-by: Gabriel Craciunescu <nix.or.die@gmail.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
Link: https://lore.kernel.org/r/20210531145502.6079-1-markpearson@lenovo.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 917536def5f2..6de536b02b57 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -192,6 +192,41 @@ static const struct dmi_system_id rn_acp_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "20NLCTO1WW"),
 		}
 	},
+	{
+		/* Lenovo ThinkPad P14s Gen 1 (20Y1) */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "20Y1"),
+		}
+	},
+	{
+		/* Lenovo ThinkPad T14s Gen1 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "20UH"),
+		}
+	},
+	{
+		/* Lenovo ThinkPad T14s Gen1 Campus */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "20UJ"),
+		}
+	},
+	{
+		/* Lenovo ThinkPad T14 Gen 1*/
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "20UD"),
+		}
+	},
+	{
+		/* Lenovo ThinkPad X13 Gen 1*/
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "20UF"),
+		}
+	},
 	{}
 };
 
-- 
2.30.2

