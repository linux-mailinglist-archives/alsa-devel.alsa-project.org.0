Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A497DCD95
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 20:10:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9E2085D;
	Fri, 18 Oct 2019 20:09:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9E2085D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571422226;
	bh=zlm5kMrXlNhTNHGLQzaBB0JYglmFTosZv0+zXiJhhRs=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=NJglawGw0vcXXabPYDlMS3vSkjLI8eVW/iHJZZ5LiOe+X5DJocedh249ddpUVL+zk
	 4U03ffBrjROgSpxPBn7qTz17SJm7JYkI419Ok3ljhucif2UFowImEmk1Ew6hYsptyG
	 YW531GWsG4N3K1opH/6lonsfoTpAtOp7mFj3fNE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A94BAF80634;
	Fri, 18 Oct 2019 20:07:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E319FF80634; Fri, 18 Oct 2019 20:07:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 612BCF80362
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 20:06:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 612BCF80362
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="a+LJenjD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=8Jt+TbiinheXcTe1WTC0Ra4cJpH5Mt5CGg3Akl1OuBc=; b=a+LJenjDe2eH
 aoLdOVf/7uXxiiu8AbrvWTGzT7OOGvQWCP9W/NigQD4DIrgO0j+/d+bntl+AKJAl9D9GjA6vrauYa
 dfunUVrSRsAXbLgx0tfpViQXw6ra1OgIcyBEUsv9Mbmgo3iR4Bxq7/hKaShVj5WIXTZlToPGyx4AE
 BFZXk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iLWeQ-0004Eh-MG; Fri, 18 Oct 2019 18:06:58 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id CC3812743273; Fri, 18 Oct 2019 19:06:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20191017213539.04.Idc3c6e1cd94b70bf010249928d4a93c6c90495b7@changeid>
X-Patchwork-Hint: ignore
Message-Id: <20191018180657.CC3812743273@ypsilon.sirena.org.uk>
Date: Fri, 18 Oct 2019 19:06:57 +0100 (BST)
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, dgreid@google.com,
 robh+dt@kernel.org, tzungbi@google.com, Mark Brown <broonie@kernel.org>,
 enric.balletbo@collabora.com, bleung@google.com,
 Benson Leung <bleung@chromium.org>
Subject: [alsa-devel] Applied "platform/chrome: cros_ec: add common commands
	for EC codec" to the asoc tree
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

   platform/chrome: cros_ec: add common commands for EC codec

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

From 104c6f8f7ff859ddd53b69c4af11e83f2971f0c4 Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 17 Oct 2019 22:00:09 +0800
Subject: [PATCH] platform/chrome: cros_ec: add common commands for EC codec

Add the following common commands:
- GET_CAPABILITIES
- GET_SHM_ADDR
- SET_SHM_ADDR

Acked-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20191017213539.04.Idc3c6e1cd94b70bf010249928d4a93c6c90495b7@changeid
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/platform/chrome/cros_ec_trace.c       |  1 +
 .../linux/platform_data/cros_ec_commands.h    | 64 ++++++++++++++++++-
 2 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_trace.c b/drivers/platform/chrome/cros_ec_trace.c
index e73bb6a8b00e..2ea0d4e0d54d 100644
--- a/drivers/platform/chrome/cros_ec_trace.c
+++ b/drivers/platform/chrome/cros_ec_trace.c
@@ -98,6 +98,7 @@
 	TRACE_SYMBOL(EC_CMD_SB_READ_BLOCK), \
 	TRACE_SYMBOL(EC_CMD_SB_WRITE_BLOCK), \
 	TRACE_SYMBOL(EC_CMD_BATTERY_VENDOR_PARAM), \
+	TRACE_SYMBOL(EC_CMD_EC_CODEC), \
 	TRACE_SYMBOL(EC_CMD_EC_CODEC_DMIC), \
 	TRACE_SYMBOL(EC_CMD_EC_CODEC_I2S_RX), \
 	TRACE_SYMBOL(EC_CMD_REBOOT_EC), \
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 58e460c015ef..3ca0fa9e92a7 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -4466,8 +4466,68 @@ enum mkbp_cec_event {
 
 /*****************************************************************************/
 
+/* Commands for audio codec. */
+#define EC_CMD_EC_CODEC 0x00BC
+
+enum ec_codec_subcmd {
+	EC_CODEC_GET_CAPABILITIES = 0x0,
+	EC_CODEC_GET_SHM_ADDR = 0x1,
+	EC_CODEC_SET_SHM_ADDR = 0x2,
+	EC_CODEC_SUBCMD_COUNT,
+};
+
+enum ec_codec_cap {
+	EC_CODEC_CAP_LAST = 32,
+};
+
+enum ec_codec_shm_id {
+	EC_CODEC_SHM_ID_LAST,
+};
+
+enum ec_codec_shm_type {
+	EC_CODEC_SHM_TYPE_EC_RAM = 0x0,
+	EC_CODEC_SHM_TYPE_SYSTEM_RAM = 0x1,
+};
+
+struct __ec_align1 ec_param_ec_codec_get_shm_addr {
+	uint8_t shm_id;
+	uint8_t reserved[3];
+};
+
+struct __ec_align4 ec_param_ec_codec_set_shm_addr {
+	uint64_t phys_addr;
+	uint32_t len;
+	uint8_t shm_id;
+	uint8_t reserved[3];
+};
+
+struct __ec_align4 ec_param_ec_codec {
+	uint8_t cmd; /* enum ec_codec_subcmd */
+	uint8_t reserved[3];
+
+	union {
+		struct ec_param_ec_codec_get_shm_addr
+				get_shm_addr_param;
+		struct ec_param_ec_codec_set_shm_addr
+				set_shm_addr_param;
+	};
+};
+
+struct __ec_align4 ec_response_ec_codec_get_capabilities {
+	uint32_t capabilities;
+};
+
+struct __ec_align4 ec_response_ec_codec_get_shm_addr {
+	uint64_t phys_addr;
+	uint32_t len;
+	uint8_t type;
+	uint8_t reserved[3];
+};
+
+/*****************************************************************************/
+
 /* Commands for DMIC on audio codec. */
-#define EC_CMD_EC_CODEC_DMIC 0x00BC
+#define EC_CMD_EC_CODEC_DMIC 0x00BD
 
 enum ec_codec_dmic_subcmd {
 	EC_CODEC_DMIC_SET_GAIN = 0x0,
@@ -4500,7 +4560,7 @@ struct __ec_align1 ec_response_ec_codec_dmic_get_gain {
 
 /* Commands for I2S RX on audio codec. */
 
-#define EC_CMD_EC_CODEC_I2S_RX 0x00BD
+#define EC_CMD_EC_CODEC_I2S_RX 0x00BE
 
 enum ec_codec_i2s_rx_subcmd {
 	EC_CODEC_I2S_RX_ENABLE = 0x0,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
