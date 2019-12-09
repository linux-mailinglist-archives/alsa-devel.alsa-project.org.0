Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EFB117579
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 20:17:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D19516B4;
	Mon,  9 Dec 2019 20:16:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D19516B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575919051;
	bh=wAsuSWTxxO1vOjRQ/kBRsPlu0DgM19SOluL9XnvqMWI=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bYrsETWIhshdLedYXuhgggShLRXCUPp/MmQr0toIFGc3MEsCaKbq5EhnFI2nnL5PM
	 VgrWq0XvqEqXxRBH40CSonsBGEFIsHS0UukzKZg13+hqcDhhne/44fWXjqCFBZih4B
	 zvR3kQafdDZTxK+EhH0xjLIZqA14hK0T/NbFGlZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DEA8F8036A;
	Mon,  9 Dec 2019 19:59:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2F04F80349; Mon,  9 Dec 2019 19:59:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C7FBBF8033F
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 19:59:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7FBBF8033F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D63B911B3;
 Mon,  9 Dec 2019 10:59:38 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 56DED3F6CF;
 Mon,  9 Dec 2019 10:59:38 -0800 (PST)
Date: Mon, 09 Dec 2019 18:59:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20191126145304.24204-4-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191126145304.24204-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: hdac_hdmi: Drop support for Icelake" to
	the asoc tree
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

   ASoC: hdac_hdmi: Drop support for Icelake

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

From 573892b6e66114898a1e3838c74603dba6bf0fbc Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Tue, 26 Nov 2019 08:53:04 -0600
Subject: [PATCH] ASoC: hdac_hdmi: Drop support for Icelake

This reverts commit 019033c854a2 ("ASoC: Intel: hdac_hdmi:
add Icelake support").

Icelake HDMI audio is supported by the HDMI codec driver,
which can be used both in non-DSP (legacy HDA) and with
DSP (SOF) configurations.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191126145304.24204-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/hdac_hdmi.c | 63 ++++++------------------------------
 1 file changed, 9 insertions(+), 54 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 18c173e6a13b..e6558475e006 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -115,16 +115,8 @@ struct hdac_hdmi_dai_port_map {
 	struct hdac_hdmi_cvt *cvt;
 };
 
-/*
- * pin to port mapping table where the value indicate the pin number and
- * the index indicate the port number with 1 base.
- */
-static const int icl_pin2port_map[] = {0x4, 0x6, 0x8, 0xa, 0xb};
-
 struct hdac_hdmi_drv_data {
 	unsigned int vendor_nid;
-	const int *port_map; /* pin to port mapping table */
-	int port_num;
 };
 
 struct hdac_hdmi_priv {
@@ -1374,12 +1366,11 @@ static int hdac_hdmi_add_pin(struct hdac_device *hdev, hda_nid_t nid)
 	return 0;
 }
 
-#define INTEL_VENDOR_NID_0x2 0x02
-#define INTEL_VENDOR_NID_0x8 0x08
-#define INTEL_VENDOR_NID_0xb 0x0b
+#define INTEL_VENDOR_NID 0x08
+#define INTEL_GLK_VENDOR_NID 0x0b
 #define INTEL_GET_VENDOR_VERB 0xf81
 #define INTEL_SET_VENDOR_VERB 0x781
-#define INTEL_EN_DP12		0x02 /* enable DP 1.2 features */
+#define INTEL_EN_DP12			0x02 /* enable DP 1.2 features */
 #define INTEL_EN_ALL_PIN_CVTS	0x01 /* enable 2nd & 3rd pins and convertors */
 
 static void hdac_hdmi_skl_enable_all_pins(struct hdac_device *hdev)
@@ -1566,26 +1557,7 @@ static int hdac_hdmi_parse_and_map_nid(struct hdac_device *hdev,
 
 static int hdac_hdmi_pin2port(void *aptr, int pin)
 {
-	struct hdac_device *hdev = aptr;
-	struct hdac_hdmi_priv *hdmi = hdev_to_hdmi_priv(hdev);
-	const int *map = hdmi->drv_data->port_map;
-	int i;
-
-	if (!hdmi->drv_data->port_num)
-		return pin - 4; /* map NID 0x05 -> port #1 */
-
-	/*
-	 * looking for the pin number in the mapping table and return
-	 * the index which indicate the port number
-	 */
-	for (i = 0; i < hdmi->drv_data->port_num; i++) {
-		if (pin == map[i])
-			return i + 1;
-	}
-
-	/* return -1 if pin number exceeds our expectation */
-	dev_err(&hdev->dev, "Can't find the port for pin %d\n", pin);
-	return -1;
+	return pin - 4; /* map NID 0x05 -> port #1 */
 }
 
 static void hdac_hdmi_eld_notify_cb(void *aptr, int port, int pipe)
@@ -1596,18 +1568,9 @@ static void hdac_hdmi_eld_notify_cb(void *aptr, int port, int pipe)
 	struct hdac_hdmi_port *hport = NULL;
 	struct snd_soc_component *component = hdmi->component;
 	int i;
-	hda_nid_t pin_nid;
-
-	if (!hdmi->drv_data->port_num) {
-		/* for legacy platforms */
-		pin_nid = port + 0x04;
-	} else if (port < hdmi->drv_data->port_num) {
-		/* get pin number from the pin2port mapping table */
-		pin_nid = hdmi->drv_data->port_map[port - 1];
-	} else {
-		dev_err(&hdev->dev, "Can't find the pin for port %d\n", port);
-		return;
-	}
+
+	/* Don't know how this mapping is derived */
+	hda_nid_t pin_nid = port + 0x04;
 
 	dev_dbg(&hdev->dev, "%s: for pin:%d port=%d\n", __func__,
 							pin_nid, pipe);
@@ -2025,18 +1988,12 @@ static int hdac_hdmi_get_spk_alloc(struct hdac_device *hdev, int pcm_idx)
 	return port->eld.info.spk_alloc;
 }
 
-static struct hdac_hdmi_drv_data intel_icl_drv_data  = {
-	.vendor_nid = INTEL_VENDOR_NID_0x2,
-	.port_map = icl_pin2port_map,
-	.port_num = ARRAY_SIZE(icl_pin2port_map),
-};
-
 static struct hdac_hdmi_drv_data intel_glk_drv_data  = {
-	.vendor_nid = INTEL_VENDOR_NID_0xb,
+	.vendor_nid = INTEL_GLK_VENDOR_NID,
 };
 
 static struct hdac_hdmi_drv_data intel_drv_data  = {
-	.vendor_nid = INTEL_VENDOR_NID_0x8,
+	.vendor_nid = INTEL_VENDOR_NID,
 };
 
 static int hdac_hdmi_dev_probe(struct hdac_device *hdev)
@@ -2216,8 +2173,6 @@ static const struct hda_device_id hdmi_list[] = {
 						   &intel_glk_drv_data),
 	HDA_CODEC_EXT_ENTRY(0x8086280d, 0x100000, "Geminilake HDMI",
 						   &intel_glk_drv_data),
-	HDA_CODEC_EXT_ENTRY(0x8086280f, 0x100000, "Icelake HDMI",
-						   &intel_icl_drv_data),
 	{}
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
