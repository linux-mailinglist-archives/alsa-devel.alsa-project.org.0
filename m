Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF6213AB1B
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:29:48 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06CB61F20;
	Mon, 13 Jan 2020 16:19:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06CB61F20
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2005F8028B;
	Mon, 13 Jan 2020 16:13:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B17BF802BC; Mon, 13 Jan 2020 16:13:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60286F8027C
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 16:13:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60286F8027C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="GpqzSfcn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=wJGBky9ZD5YbOt7v6t+V5IxqDLh08jYSXir470UXvIs=; b=GpqzSfcnrm9l
 QLrGUVZ1YAa2QFMvUdSmGvxbCt9KC/SWvS3n4eQdYNI3mji6givkfFY1NuN5WEXaWTqUO6nzSDZeY
 DAaQ+01SaOWGPRTehw7RGCvB8ZI/djHDuBwdc/EuZcShyy/EqzsKmxcChrOIpcZ2eqsDvX7RNVZ/y
 nW/UQ=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ir1P2-0003M1-3Q; Mon, 13 Jan 2020 15:13:16 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id CDF07D01965; Mon, 13 Jan 2020 15:13:15 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200110222530.30303-2-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200110222530.30303-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Date: Mon, 13 Jan 2020 15:13:15 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-acpi: add _ADR-based link
	descriptors" to the asoc tree
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

   ASoC: soc-acpi: add _ADR-based link descriptors

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

From efb6f3159e874f09992b7318cea12e8e27e8389b Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Fri, 10 Jan 2020 16:25:25 -0600
Subject: [PATCH] ASoC: soc-acpi: add _ADR-based link descriptors

For SoundWire support, we added a 'link_mask' to describe the PCB hardware
layout. This helped form a signature that can be used as a first-order way
of detecting the hardware and selecting the machine driver.

The concept of link_mask is however not enough. Some BIOS enable all links,
even when there are no devices physically connected. We can also see
variations with multiple devices attached on one link, or different types
of devices connected on the same link. To accurately represent the
hardware, we need to build static tables where each link exposes a list of
expected devices represented by the 64-bit _ADR field (which uniquely
identifies each device).

The new 'links' field is optional when the link_mask is sufficient to
represent a platform in a unique way.

The existing mechanism to support I2C devices is left as is, it'd be too
invasive to change the existing support for _HID and the notion of link is
not relevant either.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20200110222530.30303-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-acpi.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index c4c997bd0379..a217a87cae86 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -61,6 +61,8 @@ static inline struct snd_soc_acpi_mach *snd_soc_acpi_codec_list(void *arg)
  * @platform: string used for HDaudio codec support
  * @codec_mask: used for HDAudio support
  * @common_hdmi_codec_drv: use commom HDAudio HDMI codec driver
+ * @link_mask: links enabled on the board
+ * @links: array of link _ADR descriptors, null terminated
  */
 struct snd_soc_acpi_mach_params {
 	u32 acpi_ipc_irq_index;
@@ -68,6 +70,23 @@ struct snd_soc_acpi_mach_params {
 	u32 codec_mask;
 	u32 dmic_num;
 	bool common_hdmi_codec_drv;
+	u32 link_mask;
+	const struct snd_soc_acpi_link_adr *links;
+};
+
+/**
+ * snd_soc_acpi_link_adr: ACPI-based list of _ADR, with a variable
+ * number of devices per link
+ *
+ * @mask: one bit set indicates the link this list applies to
+ * @num_adr: ARRAY_SIZE of adr
+ * @adr: array of _ADR (represented as u64).
+ */
+
+struct snd_soc_acpi_link_adr {
+	const u32 mask;
+	const u32 num_adr;
+	const u64 *adr;
 };
 
 /**
@@ -78,6 +97,7 @@ struct snd_soc_acpi_mach_params {
  *
  * @id: ACPI ID (usually the codec's) used to find a matching machine driver.
  * @link_mask: describes required board layout, e.g. for SoundWire.
+ * @links: array of link _ADR descriptors, null terminated.
  * @drv_name: machine driver name
  * @fw_filename: firmware file name. Used when SOF is not enabled.
  * @board: board name
@@ -94,6 +114,7 @@ struct snd_soc_acpi_mach_params {
 struct snd_soc_acpi_mach {
 	const u8 id[ACPI_ID_LEN];
 	const u32 link_mask;
+	const struct snd_soc_acpi_link_adr *links;
 	const char *drv_name;
 	const char *fw_filename;
 	const char *board;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
