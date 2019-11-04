Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCB5EE169
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 14:38:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04F4F1765;
	Mon,  4 Nov 2019 14:37:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04F4F1765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572874711;
	bh=gYOu36yULP6aQXUHb+BPAJI/J2dQtw8JJZ46G2EAEqE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=noBZTgkMmZUxnwmHUBHKDWlBzW4JapW/m7IqkVrRYd5dwAHjZo5IeNAZeSD9kbO4I
	 HpeFDZt148qSjmZG1uYGHt8TR8X51mzr0VWK/klfKqyK8+dJRvhTNIBHnUfXPo28AK
	 mkBOkIekA2C8tASJaOe93cKx+ftNgmzCDfhhGm5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F47BF8073C;
	Mon,  4 Nov 2019 14:27:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E84EF80672; Mon,  4 Nov 2019 14:27:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31F62F8060E
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 14:27:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31F62F8060E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="HShHk8Ir"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=4O4TGbRjwxJpk8o//hzsfvP126vkkd/ZvWILRpphLTY=; b=HShHk8IrNB2r
 ji7NWn7iZZTgf0MfS6DXUp0eic8xwhFXgbPRSWYnMO9vksHakB5OMIRG7GRZiDlEtKn3zHCjLQqbD
 i/ATZfEKoXcoTikf5wxDLhk2WBabjpZOZwKDBVbMb4jQ/6ed9eds+HFXMXyZoc98cPs1WIxF0ykQb
 2DjbQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iRcO2-0002ev-Pt; Mon, 04 Nov 2019 13:27:14 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2D91C2743044; Mon,  4 Nov 2019 13:27:14 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Naveen Manohar <naveen.m@intel.com>
In-Reply-To: <20191101171847.26767-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191104132714.2D91C2743044@ypsilon.sirena.org.uk>
Date: Mon,  4 Nov 2019 13:27:14 +0000 (GMT)
Cc: Sathya Prakash M R <sathya.prakash.m.r@intel.com>, tiwai@suse.de,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: Add acpi match for rt1011 based
	m/c driver" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: Intel: Add acpi match for rt1011 based m/c driver

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From f95ce1355944189c26e4182c813d7f018b434dbd Mon Sep 17 00:00:00 2001
From: Naveen Manohar <naveen.m@intel.com>
Date: Fri, 1 Nov 2019 12:18:46 -0500
Subject: [PATCH] ASoC: Intel: Add acpi match for rt1011 based m/c driver

Add match for CML m/c with RT1011 and RT5682

Signed-off-by: Naveen Manohar <naveen.m@intel.com>
Signed-off-by: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191101171847.26767-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
index 985aa366c9e8..16d0bae8b316 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
@@ -47,6 +47,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
 		.sof_fw_filename = "sof-cnl.ri",
 		.sof_tplg_filename = "sof-cml-rt5682-max98357a.tplg",
 	},
+	{
+		.id = "10EC1011",
+		.drv_name = "cml_rt1011_rt5682",
+		.quirk_data = &cml_codecs,
+		.sof_fw_filename = "sof-cnl.ri",
+		.sof_tplg_filename = "sof-cml-rt1011-rt5682.tplg",
+	},
 	{
 		.id = "10EC5682",
 		.drv_name = "sof_rt5682",
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
