Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E89A311757F
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 20:19:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77EC016A2;
	Mon,  9 Dec 2019 20:18:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77EC016A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575919185;
	bh=XIHcylBUkoWyP2+iTXEvFd0KchafJhj3YwG84d6EbF4=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=lydachQgzAiw3/wf+YLtC1ny4qoGt7YnQ7fjF1F9K+UtV8QcYOcjlr6MO7l24wPX4
	 mU1RBWqBorLTX3cixHLnUewzz47YZPUnt8Cf5uRrA0PzWJJaYDJvH0Bveckpw5Bfjc
	 G6wjC9ofTZ385VOG0HsiFAUSOKZogKoFsfwHRDA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A886F803DE;
	Mon,  9 Dec 2019 20:00:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39288F80367; Mon,  9 Dec 2019 19:59:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id EB9C8F8034C
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 19:59:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB9C8F8034C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37EBB13A1;
 Mon,  9 Dec 2019 10:59:46 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACA383F6CF;
 Mon,  9 Dec 2019 10:59:45 -0800 (PST)
Date: Mon, 09 Dec 2019 18:59:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
In-Reply-To: <20191126143205.21987-4-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191126143205.21987-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Jairaj Arava <jairaj.arava@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: common: Add mach table for
	tgl-max98357a-rt5682" to the asoc tree
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

   ASoC: Intel: common: Add mach table for tgl-max98357a-rt5682

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 903e9d372887ab046b7da2252ae8bb814c900de0 Mon Sep 17 00:00:00 2001
From: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Date: Tue, 26 Nov 2019 08:32:05 -0600
Subject: [PATCH] ASoC: Intel: common: Add mach table for tgl-max98357a-rt5682

Update tgl mach table to include machine with max98357a & ALC5682.

Signed-off-by: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Signed-off-by: Jairaj Arava <jairaj.arava@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191126143205.21987-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 57a6298d6dca..b4687a5d1962 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -9,6 +9,11 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 
+static struct snd_soc_acpi_codecs tgl_codecs = {
+	.num_codecs = 1,
+	.codecs = {"MX98357A"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
 	{
 		.id = "10EC1308",
@@ -16,6 +21,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
 		.sof_fw_filename = "sof-tgl.ri",
 		.sof_tplg_filename = "sof-tgl-rt1308.tplg",
 	},
+	{
+		.id = "10EC5682",
+		.drv_name = "tgl_max98357a_rt5682",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &tgl_codecs,
+		.sof_fw_filename = "sof-tgl.ri",
+		.sof_tplg_filename = "sof-tgl-max98357a-rt5682.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_tgl_machines);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
