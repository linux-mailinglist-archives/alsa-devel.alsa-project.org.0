Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 859FD656EBA
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 21:34:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFEF47CC6;
	Tue, 27 Dec 2022 21:33:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFEF47CC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672173259;
	bh=/BbpzhDYMphEHBAQuZT/NpHTPQH7dEvj3hXsXcq8IaE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eK/b+9sYvemUU8HuG7d5nqMyk0MFOp9XeDxxPCWp12sHs4CzNvUSO5DHObln/XWck
	 JxQCO/aM1aEJSRROoUuSBlY9j0TwqdpDHF8/UyUsomLnWgLetG/dLL/ZgH+ANlEIpr
	 +F8AJOREw65co1P1rtwTpFHYVdGrp3JFQZa9exbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE5C4F8023B;
	Tue, 27 Dec 2022 21:33:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1028F804E4; Tue, 27 Dec 2022 21:33:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D7D8F8023B
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 21:33:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D7D8F8023B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jt4vwiuF
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AB8DC61035;
 Tue, 27 Dec 2022 20:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5DAC433EF;
 Tue, 27 Dec 2022 20:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672173184;
 bh=/BbpzhDYMphEHBAQuZT/NpHTPQH7dEvj3hXsXcq8IaE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jt4vwiuFISED2mXeeRkSOo477EhdHUg+x2GH0FrOJQPVw34a07bTIhycv5w4IbBHV
 mDk5/4ueAt1y2D7PjKK/0dAgsHMMfxbfGhkILZZXEBiiES/TwdnLw3q86ehTPxvkLe
 tsODM+7+MruOnNbKOSHvD5bhnkNlawTXpOVc05Hegn84RQuCViUz6ADgioo0B718ed
 bUKxUb1EFDBhg4jdk9anI9cQ2MR9M+IoPZOlxZW3SzNsARmIk8RdmdgARcaNbBidhU
 ZS7m3buDXxqJQaftGKaC86mqpevKhJYL1zYsSLDAAYBhm0t/zYlTAHyWAm4jDbaOml
 81D0pdgml3I6g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 11/28] soundwire: dmi-quirks: add quirk variant
 for LAPBC710 NUC15
Date: Tue, 27 Dec 2022 15:32:32 -0500
Message-Id: <20221227203249.1213526-11-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221227203249.1213526-1-sashal@kernel.org>
References: <20221227203249.1213526-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit f74495761df10c25a98256d16ea7465191b6e2cd ]

Some NUC15 LAPBC710 devices don't expose the same DMI information as
the Intel reference, add additional entry in the match table.

BugLink: https://github.com/thesofproject/linux/issues/3885
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20221018012500.1592994-1-yung-chuan.liao@linux.intel.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soundwire/dmi-quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index f81cdd83ec26..7969881f126d 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -90,6 +90,14 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 		},
 		.driver_data = (void *)intel_tgl_bios,
 	},
+	{
+		/* quirk used for NUC15 LAPBC710 skew */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPBC710"),
+		},
+		.driver_data = (void *)intel_tgl_bios,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
-- 
2.35.1

