Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE4F80956A
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 23:32:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A868B832;
	Thu,  7 Dec 2023 23:32:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A868B832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701988360;
	bh=DWbxtErpHmSlz+8TbZFIn4L1dvENGFmSs9nb8icb8Jo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ECikwtMg+JZOfkZdjR2zguqBVW+DusMUnWcs9SYM9oO2WXQmOH0f9TjcEYHE0Yf9V
	 9oMO6KiV7IzV3uM0kQggGSR7RJC+d2iHGA6ZCOPBJdNULxNcnUzce8Ne3qTQop5epf
	 LFYiLjARIAhuGODEgqkbFJredJs1i8UmC39Nj3pQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2396F805BE; Thu,  7 Dec 2023 23:31:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02F59F8067B;
	Thu,  7 Dec 2023 23:31:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 250F1F805BA; Thu,  7 Dec 2023 23:31:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92A7CF80494
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 23:30:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92A7CF80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=f+DQ7IrV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988221; x=1733524221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DWbxtErpHmSlz+8TbZFIn4L1dvENGFmSs9nb8icb8Jo=;
  b=f+DQ7IrV33wCG0CZdyhcEImKf0cYTh5+6Ez3mkNGc8JrclvtTDOUMOjo
   e5gslhcSE8E6bYGxODIFLXfEvS3WZ7Lpw4T+FI4L5KYLMKqCg1u5T0asX
   5P+YxZts1BGmAbHJtBvOT6lL9R7tSduFP0eT80lbYf2HmSIMrjTvyOmAb
   aTHfXSx6NUmPd7dEMh2gHITwwCf1U+3FGJg++rG3ZNy8PtMAudmlpv6zz
   HKRYVJEORfoYJOOWFI81FbcUT+UTPJquqPsqxZqz1w43X7iQy5Z3o1gF9
   Zf3gsPr/ZkAFCG/4AtvgOfjcyuNmKM/0FLkBJ/qs6m6yqSS41yFMHhbEM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516662"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="480516662"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307495"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="895307495"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:18 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 10/16] soundwire: cadence: add BTP/BRA helpers to format
 data
Date: Thu,  7 Dec 2023 16:29:38 -0600
Message-Id: <20231207222944.663893-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SFHITFI6GJYUGGP2O6QFWP6XJNNQ7RMG
X-Message-ID-Hash: SFHITFI6GJYUGGP2O6QFWP6XJNNQ7RMG
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SFHITFI6GJYUGGP2O6QFWP6XJNNQ7RMG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Cadence IP expects a specific format (detailed in the
Documentation). Add helpers to copy the data into the DMA buffer.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/Kconfig          |   1 +
 drivers/soundwire/cadence_master.c | 634 +++++++++++++++++++++++++++++
 drivers/soundwire/cadence_master.h |  30 ++
 3 files changed, 665 insertions(+)

diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
index 4d8f3b7024ae..18ca21edd552 100644
--- a/drivers/soundwire/Kconfig
+++ b/drivers/soundwire/Kconfig
@@ -30,6 +30,7 @@ config SOUNDWIRE_AMD
 
 config SOUNDWIRE_CADENCE
 	tristate
+	select CRC8
 
 config SOUNDWIRE_INTEL
 	tristate "Intel SoundWire Master driver"
diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index bb623f82826c..2da0c415c125 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -6,6 +6,7 @@
  * Used by Master driver
  */
 
+#include <linux/crc8.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/debugfs.h>
@@ -20,6 +21,7 @@
 #include <sound/soc.h>
 #include <linux/workqueue.h>
 #include "bus.h"
+#include "crc8.h"
 #include "cadence_master.h"
 
 static int interrupt_mask;
@@ -1890,5 +1892,637 @@ struct sdw_cdns_pdi *sdw_cdns_alloc_pdi(struct sdw_cdns *cdns,
 }
 EXPORT_SYMBOL(sdw_cdns_alloc_pdi);
 
+/* BPT/BRA helpers */
+
+#define SDW_CDNS_BRA_HDR			6 /* defined by MIPI */
+#define SDW_CDNS_BRA_HDR_CRC			1 /* defined by MIPI */
+#define SDW_CDNS_BRA_HDR_CRC_PAD		1 /* Cadence only */
+#define SDW_CDNS_BRA_HDR_RESP			1 /* defined by MIPI */
+#define SDW_CDNS_BRA_HDR_RESP_PAD		1 /* Cadence only */
+
+#define SDW_CDNS_BRA_DATA_PAD			1 /* Cadence only */
+#define SDW_CDNS_BRA_DATA_CRC			1 /* defined by MIPI */
+#define SDW_CDNS_BRA_DATA_CRC_PAD		1 /* Cadence only */
+
+#define SDW_CDNS_BRA_FOOTER_RESP		1 /* defined by MIPI */
+#define SDW_CDNS_BRA_FOOTER_RESP_PAD		1 /* Cadence only */
+
+static unsigned int sdw_cdns_bra_actual_data_size(unsigned int allocated_bytes_per_frame)
+{
+	unsigned int total;
+
+	total = allocated_bytes_per_frame -
+		SDW_CDNS_BRA_HDR -
+		SDW_CDNS_BRA_HDR_CRC -
+		SDW_CDNS_BRA_HDR_RESP;
+
+	total -= SDW_CDNS_BRA_DATA_CRC;
+
+	total -= SDW_CDNS_BRA_FOOTER_RESP;
+
+	return total;
+}
+
+static unsigned int sdw_cdns_write_pdi0_buffer_size(unsigned int actual_data_size)
+{
+	unsigned int total;
+
+	total = SDW_CDNS_BRA_HDR +
+		SDW_CDNS_BRA_HDR_CRC +
+		SDW_CDNS_BRA_HDR_CRC_PAD;
+
+	total += actual_data_size;
+	if (actual_data_size & 1)
+		total += SDW_CDNS_BRA_DATA_PAD;
+
+	total += SDW_CDNS_BRA_DATA_CRC +
+		SDW_CDNS_BRA_DATA_CRC_PAD;
+
+	return total * 2;
+}
+
+static unsigned int sdw_cdns_write_pdi1_buffer_size(unsigned int actual_data_size)
+{
+	unsigned int total;
+
+	total = SDW_CDNS_BRA_HDR_RESP +
+		SDW_CDNS_BRA_HDR_RESP_PAD;
+
+	total += SDW_CDNS_BRA_FOOTER_RESP +
+		SDW_CDNS_BRA_FOOTER_RESP_PAD;
+
+	return total * 2;
+}
+
+static unsigned int sdw_cdns_read_pdi0_buffer_size(unsigned int actual_data_size)
+{
+	unsigned int total;
+
+	total = SDW_CDNS_BRA_HDR +
+		SDW_CDNS_BRA_HDR_CRC +
+		SDW_CDNS_BRA_HDR_CRC_PAD;
+
+	return total * 2;
+}
+
+static unsigned int sdw_cdns_read_pdi1_buffer_size(unsigned int actual_data_size)
+{
+	unsigned int total;
+
+	total = SDW_CDNS_BRA_HDR_RESP +
+		SDW_CDNS_BRA_HDR_RESP_PAD;
+
+	total += actual_data_size;
+	if (actual_data_size & 1)
+		total += SDW_CDNS_BRA_DATA_PAD;
+
+	total += SDW_CDNS_BRA_HDR_CRC +
+		SDW_CDNS_BRA_HDR_CRC_PAD;
+
+	total += SDW_CDNS_BRA_FOOTER_RESP +
+		SDW_CDNS_BRA_FOOTER_RESP_PAD;
+
+	return total * 2;
+}
+
+int sdw_cdns_bpt_find_buffer_sizes(int command, /* 0: write, 1: read */
+				   int row, int col,
+				   unsigned int data_bytes,
+				   unsigned int requested_bytes_per_frame,
+				   unsigned int *data_per_frame,
+				   unsigned int *pdi0_buffer_size,
+				   unsigned int *pdi1_buffer_size,
+				   unsigned int *num_frames)
+{
+	unsigned int bpt_bits = row * (col - 1);
+	unsigned int bpt_bytes = bpt_bits >> 3;
+	unsigned int actual_bpt_bytes;
+	unsigned int pdi0_tx_size;
+	unsigned int pdi1_rx_size;
+	unsigned int remainder;
+
+	if (!data_bytes)
+		return -EINVAL;
+
+	actual_bpt_bytes = sdw_cdns_bra_actual_data_size(bpt_bytes);
+	if (data_bytes < actual_bpt_bytes)
+		actual_bpt_bytes = data_bytes;
+
+	/*
+	 * the caller may want to set the number of bytes per frame,
+	 * allow when possible
+	 */
+	if (requested_bytes_per_frame < actual_bpt_bytes)
+		actual_bpt_bytes = requested_bytes_per_frame;
+
+	*data_per_frame = actual_bpt_bytes;
+
+	if (command == 0) {
+		/*
+		 * for writes we need to send all the data_bytes per frame,
+		 * even for the last frame which may only transport fewer bytes
+		 */
+
+		*num_frames = DIV_ROUND_UP(data_bytes, actual_bpt_bytes);
+
+		pdi0_tx_size = sdw_cdns_write_pdi0_buffer_size(actual_bpt_bytes);
+		pdi1_rx_size = sdw_cdns_write_pdi1_buffer_size(actual_bpt_bytes);
+
+		*pdi0_buffer_size = pdi0_tx_size * *num_frames;
+		*pdi1_buffer_size = pdi1_rx_size * *num_frames;
+	} else {
+		/*
+		 * for reads we need to retrieve only what is requested in the BTP
+		 * header, so the last frame needs to be special-cased
+		 */
+		*num_frames = data_bytes / actual_bpt_bytes;
+
+		pdi0_tx_size = sdw_cdns_read_pdi0_buffer_size(actual_bpt_bytes);
+		pdi1_rx_size = sdw_cdns_read_pdi1_buffer_size(actual_bpt_bytes);
+
+		*pdi0_buffer_size = pdi0_tx_size * *num_frames;
+		*pdi1_buffer_size = pdi1_rx_size * *num_frames;
+
+		remainder = data_bytes % actual_bpt_bytes;
+		if (remainder) {
+			pdi0_tx_size = sdw_cdns_read_pdi0_buffer_size(remainder);
+			pdi1_rx_size = sdw_cdns_read_pdi1_buffer_size(remainder);
+
+			*num_frames = *num_frames + 1;
+			*pdi0_buffer_size += pdi0_tx_size;
+			*pdi1_buffer_size += pdi1_rx_size;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(sdw_cdns_bpt_find_buffer_sizes);
+
+static int sdw_cdns_copy_write_data(u8 *data, int data_size, u8 *dma_buffer, int dma_buffer_size)
+{
+	int i;
+	int j;
+
+	/* size check to prevent out of bounds access */
+	i = data_size - 1;
+	j = (2 * i) - (i & 1);
+	if (data_size & 1)
+		j++;
+	j += 2;
+	if (j >= dma_buffer_size)
+		return -EINVAL;
+
+	/* copy data */
+	for (i = 0; i < data_size; i++) {
+		j = (2 * i) - (i & 1);
+		dma_buffer[j] = data[i];
+	}
+	/* add required pad */
+	if (data_size & 1)
+		dma_buffer[++j] = 0;
+	/* skip last two bytes */
+	j += 2;
+
+	/* offset and data are off-by-one */
+	return j + 1;
+}
+
+static int sdw_cdns_prepare_write_pd0_buffer(u8 *header, unsigned int header_size,
+					     u8 *data, unsigned int data_size,
+					     u8 *dma_buffer, unsigned int dma_buffer_size,
+					     unsigned int *dma_data_written,
+					     unsigned int frame_counter)
+{
+	u8 crc;
+	int data_written;
+	u8 *last_byte;
+
+	/* clear buffer */
+	memset(dma_buffer, 0, dma_buffer_size);
+	*dma_data_written = 0;
+
+	dma_buffer[3] = BIT(7);
+	dma_buffer[3] |= frame_counter & GENMASK(3, 0);
+
+	data_written = sdw_cdns_copy_write_data(header, header_size, dma_buffer, dma_buffer_size);
+	if (data_written < 0)
+		return data_written;
+	dma_buffer += data_written;
+	dma_buffer_size -= data_written;
+	*dma_data_written += data_written;
+
+	crc = SDW_CRC8_SEED;
+	crc = crc8(sdw_crc8_lookup_msb, header, header_size, crc);
+
+	data_written = sdw_cdns_copy_write_data(&crc, 1, dma_buffer, dma_buffer_size);
+	if (data_written < 0)
+		return data_written;
+	dma_buffer += data_written;
+	dma_buffer_size -= data_written;
+	*dma_data_written += data_written;
+
+	data_written = sdw_cdns_copy_write_data(data, data_size, dma_buffer, dma_buffer_size);
+	if (data_written < 0)
+		return data_written;
+	dma_buffer += data_written;
+	dma_buffer_size -= data_written;
+	*dma_data_written += data_written;
+
+	crc = SDW_CRC8_SEED;
+	crc = crc8(sdw_crc8_lookup_msb, data, data_size, crc);
+	data_written = sdw_cdns_copy_write_data(&crc, 1, dma_buffer, dma_buffer_size);
+	if (data_written < 0)
+		return data_written;
+	dma_buffer += data_written;
+	dma_buffer_size -= data_written;
+	*dma_data_written += data_written;
+
+	/* tag last byte */
+	last_byte = dma_buffer - 1;
+	last_byte[0] = BIT(6);
+
+	return 0;
+}
+
+static int sdw_cdns_prepare_read_pd0_buffer(u8 *header, unsigned int header_size,
+					    u8 *dma_buffer, unsigned int dma_buffer_size,
+					    unsigned int *dma_data_written,
+					    unsigned int frame_counter)
+{
+	u8 crc;
+	int data_written;
+	u8 *last_byte;
+
+	/* clear buffer */
+	memset(dma_buffer, 0, dma_buffer_size);
+	*dma_data_written = 0;
+
+	dma_buffer[3] = BIT(7);
+	dma_buffer[3] |= frame_counter & GENMASK(3, 0);
+
+	data_written = sdw_cdns_copy_write_data(header, header_size, dma_buffer, dma_buffer_size);
+	if (data_written < 0)
+		return data_written;
+	dma_buffer += data_written;
+	dma_buffer_size -= data_written;
+	*dma_data_written += data_written;
+
+	crc = SDW_CRC8_SEED;
+	crc = crc8(sdw_crc8_lookup_msb, header, header_size, crc);
+
+	data_written = sdw_cdns_copy_write_data(&crc, 1, dma_buffer, dma_buffer_size);
+	if (data_written < 0)
+		return data_written;
+	dma_buffer += data_written;
+	dma_buffer_size -= data_written;
+	*dma_data_written += data_written;
+
+	/* tag last byte */
+	last_byte = dma_buffer - 1;
+	last_byte[0] = BIT(6);
+
+	return 0;
+}
+
+#define CDNS_BTP_ROLLING_COUNTER_START 1
+
+int sdw_cdns_prepare_write_dma_buffer(u8 dev_num, u32 start_register,
+				      u8 *data, int data_size,
+				      int data_per_frame,
+				      u8 *dma_buffer, int dma_buffer_size,
+				      int *dma_buffer_total_bytes)
+{
+	u8 header[SDW_CDNS_BRA_HDR];
+	u8 *p_dma_buffer;
+	u8 *p_data;
+	int dma_data_written;
+	int total_dma_data_written;
+	u8 counter;
+	int remainder;
+	int ret;
+
+	counter = CDNS_BTP_ROLLING_COUNTER_START;
+
+	header[0] = BIT(1);		/* write command: BIT(1) set */
+	header[0] |= GENMASK(7, 6);	/* header is active */
+	header[0] |= (dev_num << 2);
+
+	p_data = &data[0];
+	p_dma_buffer = &dma_buffer[0];
+	total_dma_data_written = 0;
+
+	while (data_size / data_per_frame) {
+		header[1] = data_per_frame;
+		header[2] = start_register >> 24 & 0xFF;
+		header[3] = start_register >> 16 & 0xFF;
+		header[4] = start_register >> 8 & 0xFF;
+		header[5] = start_register >> 0 & 0xFF;
+
+		ret = sdw_cdns_prepare_write_pd0_buffer(header, SDW_CDNS_BRA_HDR,
+							p_data, data_per_frame,
+							p_dma_buffer, dma_buffer_size,
+							&dma_data_written,
+							counter);
+		if (ret < 0)
+			return ret;
+
+		counter++;
+
+		p_data += data_per_frame;
+		data_size -= data_per_frame;
+
+		p_dma_buffer += dma_data_written;
+		dma_buffer_size -= dma_data_written;
+		total_dma_data_written += dma_data_written;
+
+		start_register += data_per_frame;
+	}
+
+	remainder = data_size % data_per_frame;
+	if (remainder) {
+		header[1] = remainder;
+		header[2] = start_register >> 24 & 0xFF;
+		header[3] = start_register >> 16 & 0xFF;
+		header[4] = start_register >> 8 & 0xFF;
+		header[5] = start_register >> 0 & 0xFF;
+
+		ret = sdw_cdns_prepare_write_pd0_buffer(header, SDW_CDNS_BRA_HDR,
+							p_data, remainder,
+							p_dma_buffer, dma_buffer_size,
+							&dma_data_written,
+							counter);
+		if (ret < 0)
+			return ret;
+
+		total_dma_data_written += dma_data_written;
+	}
+
+	*dma_buffer_total_bytes = total_dma_data_written;
+
+	return 0;
+}
+EXPORT_SYMBOL(sdw_cdns_prepare_write_dma_buffer);
+
+int sdw_cdns_prepare_read_dma_buffer(u8 dev_num, u32 start_register,
+				     int data_size,
+				     int data_per_frame,
+				     u8 *dma_buffer, int dma_buffer_size,
+				     int *dma_buffer_total_bytes)
+{
+	u8 header[SDW_CDNS_BRA_HDR];
+	u8 *p_dma_buffer;
+	int dma_data_written;
+	int total_dma_data_written;
+	u8 counter;
+	int remainder;
+	int ret;
+
+	counter = CDNS_BTP_ROLLING_COUNTER_START;
+
+	header[0] = 0;			/* read command: BIT(1) cleared */
+	header[0] |= GENMASK(7, 6);	/* header is active */
+	header[0] |= (dev_num << 2);
+
+	p_dma_buffer = &dma_buffer[0];
+	total_dma_data_written = 0;
+
+	while (data_size / data_per_frame) {
+		header[1] = data_per_frame;
+		header[2] = start_register >> 24 & 0xFF;
+		header[3] = start_register >> 16 & 0xFF;
+		header[4] = start_register >> 8 & 0xFF;
+		header[5] = start_register >> 0 & 0xFF;
+
+		ret = sdw_cdns_prepare_read_pd0_buffer(header, SDW_CDNS_BRA_HDR,
+						       p_dma_buffer, dma_buffer_size,
+						       &dma_data_written,
+						       counter);
+		if (ret < 0)
+			return ret;
+
+		counter++;
+
+		data_size -= data_per_frame;
+
+		p_dma_buffer += dma_data_written;
+		dma_buffer_size -= dma_data_written;
+		total_dma_data_written += dma_data_written;
+
+		start_register += data_per_frame;
+	}
+
+	remainder = data_size % data_per_frame;
+	if (remainder) {
+		header[1] = remainder;
+		header[2] = start_register >> 24 & 0xFF;
+		header[3] = start_register >> 16 & 0xFF;
+		header[4] = start_register >> 8 & 0xFF;
+		header[5] = start_register >> 0 & 0xFF;
+
+		ret = sdw_cdns_prepare_read_pd0_buffer(header, SDW_CDNS_BRA_HDR,
+						       p_dma_buffer, dma_buffer_size,
+						       &dma_data_written,
+						       counter);
+		if (ret < 0)
+			return ret;
+
+		total_dma_data_written += dma_data_written;
+	}
+
+	*dma_buffer_total_bytes = total_dma_data_written;
+
+	return 0;
+}
+EXPORT_SYMBOL(sdw_cdns_prepare_read_dma_buffer);
+
+static int check_counter(u32 val, u8 counter)
+{
+	u8 frame;
+
+	frame = (val >> 24) & GENMASK(3, 0);
+	if (counter != frame)
+		return -EIO;
+	return 0;
+}
+
+static int check_response(u32 val)
+{
+	u8 response;
+
+	response = (val >> 3) & GENMASK(1, 0);
+	if (response == 0) /* Ignored */
+		return -ENODATA;
+	if (response != 1) /* ACK */
+		return -EIO;
+
+	return 0;
+}
+
+static int check_frame_start(u32 header, u8 counter)
+{
+	int ret;
+
+	/* check frame_start marker */
+	if (!(header & BIT(31)))
+		return -EIO;
+
+	ret = check_counter(header, counter);
+	if (ret < 0)
+		return ret;
+
+	return check_response(header);
+}
+
+static int check_frame_end(u32 footer)
+{
+	/* check frame_end marker */
+	if (!(footer & BIT(30)))
+		return -EIO;
+
+	return check_response(footer);
+}
+
+int sdw_cdns_check_write_response(struct device *dev,
+				  u8 *dma_buffer, int dma_buffer_size,
+				  int num_frames)
+{
+	u32 *p_data;
+	int counter;
+	u32 header;
+	u32 footer;
+	int ret;
+	int i;
+
+	/* paranoia check on buffer size */
+	if (dma_buffer_size != num_frames * 8)
+		return -EINVAL;
+
+	counter = CDNS_BTP_ROLLING_COUNTER_START;
+	p_data = (u32 *)dma_buffer;
+
+	for (i = 0; i < num_frames; i++) {
+		header = *p_data++;
+		footer = *p_data++;
+
+		ret = check_frame_start(header, counter);
+		if (ret < 0) {
+			dev_err(dev, "%s: bad frame %d/%d start header %x\n",
+				__func__, i, num_frames, header);
+			return ret;
+		}
+
+		ret = check_frame_end(footer);
+		if (ret < 0) {
+			dev_err(dev, "%s: bad frame %d/%d end footer %x\n",
+				__func__, i, num_frames, footer);
+			return ret;
+		}
+
+		counter++;
+		counter &= GENMASK(3, 0);
+	}
+	return 0;
+}
+EXPORT_SYMBOL(sdw_cdns_check_write_response);
+
+static u8 extract_read_data(u32 *data, int num_bytes, u8 *buffer)
+{
+	u32 val;
+	int i;
+	u8 crc;
+	u8 b0;
+	u8 b1;
+
+	crc = SDW_CRC8_SEED;
+
+	/* process two bytes at a time */
+	for (i = 0; i < num_bytes / 2; i++) {
+		val = *data++;
+
+		b0 = val & 0xff;
+		b1 = (val >> 8) & 0xff;
+
+		*buffer++ = b0;
+		crc = crc8(sdw_crc8_lookup_msb, &b0, 1, crc);
+
+		*buffer++ = b1;
+		crc = crc8(sdw_crc8_lookup_msb, &b1, 1, crc);
+	}
+	/* handle remaining byte if it exists */
+	if (num_bytes & 1) {
+		val = *data;
+
+		b0 = val & 0xff;
+
+		*buffer++ = b0;
+		crc = crc8(sdw_crc8_lookup_msb, &b0, 1, crc);
+	}
+	return crc;
+}
+
+int sdw_cdns_check_read_response(struct device *dev,
+				 u8 *dma_buffer, int dma_buffer_size,
+				 u8 *buffer, int buffer_size,
+				 int num_frames, int data_per_frame)
+{
+	int total_num_bytes = 0;
+	u32 *p_data;
+	u8 *p_buf;
+	int counter;
+	u32 header;
+	u32 footer;
+	u8 expected_crc;
+	u8 crc;
+	int len;
+	int ret;
+	int i;
+
+	counter = CDNS_BTP_ROLLING_COUNTER_START;
+	p_data = (u32 *)dma_buffer;
+	p_buf = buffer;
+
+	for (i = 0; i < num_frames; i++) {
+		header = *p_data++;
+
+		ret = check_frame_start(header, counter);
+		if (ret < 0) {
+			dev_err(dev, "%s: bad frame %d/%d start header %x\n",
+				__func__, i, num_frames, header);
+			return ret;
+		}
+
+		len = data_per_frame;
+		if (total_num_bytes + data_per_frame > buffer_size)
+			len = buffer_size - total_num_bytes;
+
+		crc = extract_read_data(p_data, len, p_buf);
+
+		p_data += (len + 1) / 2;
+		expected_crc = *p_data++ & 0xff;
+
+		if (crc != expected_crc) {
+			dev_err(dev, "%s: bad frame %d/%d crc %#x expected %#x\n",
+				__func__, i, num_frames, crc, expected_crc);
+			return -EIO;
+		}
+
+		p_buf += len;
+		total_num_bytes += len;
+
+		footer = *p_data++;
+		ret = check_frame_end(footer);
+		if (ret < 0) {
+			dev_err(dev, "%s: bad frame %d/%d end footer %x\n",
+				__func__, i, num_frames, footer);
+			return ret;
+		}
+
+		counter++;
+		counter &= GENMASK(3, 0);
+	}
+	return 0;
+}
+EXPORT_SYMBOL(sdw_cdns_check_read_response);
+
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("Cadence Soundwire Library");
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index bc84435e420f..0463440d8486 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -202,4 +202,34 @@ void sdw_cdns_check_self_clearing_bits(struct sdw_cdns *cdns, const char *string
 void sdw_cdns_config_update(struct sdw_cdns *cdns);
 int sdw_cdns_config_update_set_wait(struct sdw_cdns *cdns);
 
+/* SoundWire BPT/BRA helpers to format data */
+int sdw_cdns_bpt_find_buffer_sizes(int command, /* 0: write, 1: read */
+				   int row, int col,
+				   unsigned int data_bytes,
+				   unsigned int requested_bytes_per_frame,
+				   unsigned int *data_per_frame,
+				   unsigned int *pdi0_buffer_size,
+				   unsigned int *pdi1_buffer_size,
+				   unsigned int *num_frames);
+
+int sdw_cdns_prepare_write_dma_buffer(u8 dev_num, u32 start_register,
+				      u8 *data, int data_size,
+				      int data_per_frame,
+				      u8 *dma_buffer, int dma_buffer_size,
+				      int *dma_buffer_total_bytes);
+
+int sdw_cdns_prepare_read_dma_buffer(u8 dev_num, u32 start_register,
+				     int data_size,
+				     int data_per_frame,
+				     u8 *dma_buffer, int dma_buffer_size,
+				     int *dma_buffer_total_bytes);
+
+int sdw_cdns_check_write_response(struct device *dev,
+				  u8 *dma_buffer, int dma_buffer_size,
+				  int num_frames);
+
+int sdw_cdns_check_read_response(struct device *dev,
+				 u8 *dma_buffer, int dma_buffer_size,
+				 u8 *buffer, int buffer_size,
+				 int num_frames, int data_per_frame);
 #endif /* __SDW_CADENCE_H */
-- 
2.39.2

