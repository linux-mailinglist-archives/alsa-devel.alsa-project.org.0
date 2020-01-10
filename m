Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A541379A8
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 23:28:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EA751698;
	Fri, 10 Jan 2020 23:28:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EA751698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578695339;
	bh=pAo3IsuIDdghIDuQkHsDjO9A1vaFg3zKEoPoXlGLnBk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sNWypT7ms09LFHI0/RYp5m+jjyT0WF4u58UqM3HG7SE3Jk2ozwMz2qgcaHlTSnjvo
	 SulHQUECfmB8/9U2tZksLhpS7gN1lowLNlx1Lmw490x9gBRB+jLR5SdzmE/EgdRhRr
	 L8fmDxthF2S25enyQFfFF34vI+UuaqFsvdhwdSCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FCCCF80273;
	Fri, 10 Jan 2020 23:25:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5E91F80130; Fri, 10 Jan 2020 23:25:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66B60F8010B
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 23:25:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66B60F8010B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2020 14:25:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,418,1571727600"; d="scan'208";a="216813229"
Received: from ewronsha-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.66.226])
 by orsmga008.jf.intel.com with ESMTP; 10 Jan 2020 14:25:33 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 10 Jan 2020 16:25:25 -0600
Message-Id: <20200110222530.30303-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200110222530.30303-1-pierre-louis.bossart@linux.intel.com>
References: <20200110222530.30303-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/6] ASoC: soc-acpi: add _ADR-based link
	descriptors
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

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
