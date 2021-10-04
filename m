Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3BE4216E1
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 20:57:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1FA01694;
	Mon,  4 Oct 2021 20:56:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1FA01694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633373867;
	bh=Dfd51rnjOHZ5DbLNP7hzwqIpvd2oBNsSmXhNVa5l1oI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MkLZqWobSr86ZFMuv7RwnfeIrUvc8DBBZ2Ug5Ag4l2K9uCFhlUAqon6awfN4SVbch
	 Ze/AMNgZmIecH4idE6uEwf/uTg9xnHGTTL0Cg40Ydue/2eFUQ7PnFYpEg/72NMtAb6
	 ol5tEOHe0gh+91L6HMrZ7BUW32kP3XieKBDyMHRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59E05F804FA;
	Mon,  4 Oct 2021 20:55:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AAF6F804EC; Mon,  4 Oct 2021 20:55:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80DD3F802D2
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 20:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80DD3F802D2
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="206360921"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="206360921"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 10:14:41 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="523435355"
Received: from mbrescia-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.77.4])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 10:14:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] ASoC: SOF: dai: include new flags for DAI_CONFIG
Date: Mon,  4 Oct 2021 12:14:27 -0500
Message-Id: <20211004171430.103674-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004171430.103674-1-pierre-louis.bossart@linux.intel.com>
References: <20211004171430.103674-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Brent Lu <brent.lu@intel.com>,
 Bard Liao <bard.liao@intel.com>
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

Mirror changes done in SOF tree. The changes do not rely on
BIT/GENMASK on purpose to keep the structure and flags common with the
firmware tree.

The DAI_CONFIG IPC is currently used in multiple ways. It is sent to
the DSP firmware when enabling static or dynamic pipelines, in
hw_params or prepare callbacks for Intel SSP, HDaudio and ALH, on
trigger_stop and hw_free.

This IPC has been abused a bit in the past, i.e. the values used for
some of the DAI-specific fields are used to either allocate or free
resources. Two typical examples are Intel HDaudio and SoundWire/ALH
DAIs, where using a zero DMA channel number or stream tag signals to
the firmware the DMA channels or tags allocated earlier can be freed.

Rather than add a new IPC for 'hw_params' and 'hw_free', this patch
suggests supporting a 2-bit value conveying the 'stage' information in
an existing IPC structure. Only 3 possible values are used.

The mapping between HW_PARAMS and HW_FREE flags and ALSA definitions
is not strictly 1:1, e.g. in some cases the HW_PARAM flag might be set
during the .prepare callback, while the HW_FREE might be sent during the
ALSA .trigger for stop/suspend.

The semantics of the flags is to reserve and start/stop all needed
resources, typically hardware related such as DMAs or clocks, when the
HW_PARAMS is set, while the HW_FREE flag allows the firmware to
release the resources allocated. The data transfers are still
controlled within the firmware through the propagation of the trigger
command.

The driver can then pass information that the DAI_CONFIG was invoked
in e.g. a pipeline/DAI setup, hw_params or hw_free stage without
having to use a special DAI-specific encoding. Unfortunately we can't
remove old encodings due to backwards-compatibility requirements but
for new cases, such as the SSP in follow-up patches, we can make the
IPC less cryptic.

This change is tagged as ABI 3.19 and is completely backwards compatible.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Brent Lu <brent.lu@intel.com>
---
 include/sound/sof/dai.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index ea6dc970c18f..9625f47557b8 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -50,6 +50,13 @@
 #define SOF_DAI_FMT_INV_MASK		0x0f00
 #define SOF_DAI_FMT_CLOCK_PROVIDER_MASK	0xf000
 
+/* DAI_CONFIG flags */
+#define SOF_DAI_CONFIG_FLAGS_MASK	0x3
+#define SOF_DAI_CONFIG_FLAGS_NONE	(0 << 0) /**< DAI_CONFIG sent without stage information */
+#define SOF_DAI_CONFIG_FLAGS_HW_PARAMS	(1 << 0) /**< DAI_CONFIG sent during hw_params stage */
+#define SOF_DAI_CONFIG_FLAGS_HW_FREE	(2 << 0) /**< DAI_CONFIG sent during hw_free stage */
+#define SOF_DAI_CONFIG_FLAGS_RFU	(3 << 0) /**< not used, reserved for future use */
+
 /** \brief Types of DAI */
 enum sof_ipc_dai_type {
 	SOF_DAI_INTEL_NONE = 0,		/**< None */
@@ -70,7 +77,7 @@ struct sof_ipc_dai_config {
 	/* physical protocol and clocking */
 	uint16_t format;	/**< SOF_DAI_FMT_ */
 	uint8_t group_id;	/**< group ID, 0 means no group (ABI 3.17) */
-	uint8_t reserved8;	/**< alignment */
+	uint8_t flags;		/**< SOF_DAI_CONFIG_FLAGS_ (ABI 3.19) */
 
 	/* reserved for future use */
 	uint32_t reserved[8];
-- 
2.25.1

