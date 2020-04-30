Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C94AB1BFBAB
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 16:01:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 755ED16AC;
	Thu, 30 Apr 2020 16:01:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 755ED16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588255317;
	bh=Kl08CSxK9cTZLizw5W56/tm53VbSYubwztTv1wcNJCs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bSfebCOgmjuRiLSxCLVx3725pS7vomHaHt23JGjZOzmJjjJ77hOSGPcsDoYwjj8No
	 LRSW16pI365JshNuGHTCpCUFK2K9DpzfINb5agbiwjgD6636dyRoFppwd5TFRmvm2y
	 oeLmi4EE39MD9FE0gUswF9nCJrI3IBJLC+K1jHBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC15DF80341;
	Thu, 30 Apr 2020 15:51:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DC0DF80336; Thu, 30 Apr 2020 15:51:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F13D0F80331
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 15:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F13D0F80331
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Zfs/Q4SH"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DCB65208DB;
 Thu, 30 Apr 2020 13:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588254697;
 bh=Kl08CSxK9cTZLizw5W56/tm53VbSYubwztTv1wcNJCs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zfs/Q4SHL+yis3xtETWcScupKLwyZ4L6MBvbOdV1nGn3g76QOPgT4BGHUzHuJ55FF
 9tVyZ1QSfXl60ZXrOpkns3KuujbAGKJc1aDFmL/ZxZEXJx2icKRK0xhARV4+UfjAGR
 g9a1AR50EkqyoVy9+b+gPXwmJFfmuAFkVtoccEHs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 47/79] ASoC: rsnd: Fix "status check failed" spam
 for multi-SSI
Date: Thu, 30 Apr 2020 09:50:11 -0400
Message-Id: <20200430135043.19851-47-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430135043.19851-1-sashal@kernel.org>
References: <20200430135043.19851-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Matthias Blankertz <matthias.blankertz@cetitec.com>,
 Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

From: Matthias Blankertz <matthias.blankertz@cetitec.com>

[ Upstream commit 54cb6221688660670a2e430892d7f4e6370263b8 ]

Fix the rsnd_ssi_stop function to skip disabling the individual SSIs of
a multi-SSI setup, as the actual stop is performed by rsnd_ssiu_stop_gen2
- the same logic as in rsnd_ssi_start. The attempt to disable these SSIs
was harmless, but caused a "status check failed" message to be printed
for every SSI in the multi-SSI setup.
The disabling of interrupts is still performed, as they are enabled for
all SSIs in rsnd_ssi_init, but care is taken to not accidentally set the
EN bit for an SSI where it was not set by rsnd_ssi_start.

Signed-off-by: Matthias Blankertz <matthias.blankertz@cetitec.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/20200417153017.1744454-3-matthias.blankertz@cetitec.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sh/rcar/ssi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
index 9900a4f6f4e53..4a7d3413917fc 100644
--- a/sound/soc/sh/rcar/ssi.c
+++ b/sound/soc/sh/rcar/ssi.c
@@ -594,10 +594,16 @@ static int rsnd_ssi_stop(struct rsnd_mod *mod,
 	 * Capture:  It might not receave data. Do nothing
 	 */
 	if (rsnd_io_is_play(io)) {
-		rsnd_mod_write(mod, SSICR, cr | EN);
+		rsnd_mod_write(mod, SSICR, cr | ssi->cr_en);
 		rsnd_ssi_status_check(mod, DIRQ);
 	}
 
+	/* In multi-SSI mode, stop is performed by setting ssi0129 in
+	 * SSI_CONTROL to 0 (in rsnd_ssio_stop_gen2). Do nothing here.
+	 */
+	if (rsnd_ssi_multi_slaves_runtime(io))
+		return 0;
+
 	/*
 	 * disable SSI,
 	 * and, wait idle state
-- 
2.20.1

