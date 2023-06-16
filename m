Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D75732CB1
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 12:03:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1ECD857;
	Fri, 16 Jun 2023 12:02:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1ECD857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686909804;
	bh=ydRsfYTPJOjT9KIaSZNQlDhEuEelN1lLPEXhvr0ySeU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S4luFgv90jlT+nAf3YbCWrHUM0u5VtLQ1sRAkipopyOirVCf3MKO4VmWgfGDGMZ9e
	 9e6ONCsY97i02/XMfm8XobYj0GkHs2x3WIiUBv+2EQjonJ3NN7fl5c/Ja/nBEAAram
	 +IGq6Tgiw+mfAZHx19d5HaVISDVpVqwFcn7YSjT0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0968AF805AB; Fri, 16 Jun 2023 12:01:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A207F8058C;
	Fri, 16 Jun 2023 12:01:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBDD3F8057B; Fri, 16 Jun 2023 12:01:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53054F80246
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 12:01:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53054F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IlX8PHx2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686909672; x=1718445672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ydRsfYTPJOjT9KIaSZNQlDhEuEelN1lLPEXhvr0ySeU=;
  b=IlX8PHx2T/B1kAEu9KtWq5snobZQLpq1ad0yHSEkI37YjN4WoepcOI8Z
   UAbOgn6uyPkJDMkQeYl8ce4enfEOB8F3fD3L6NoaiD8TvtSgzZBrU2TjH
   uChNdnsatzplTXuO1UK/WoosJe+S7m/l3rLLy4vcIuweTDUWpxE+UG+Wl
   XNfbYodq8sYnlUHF0ooE9EGxFewLycxcS6nipX3C5k6EZhpYaWO7CfXhz
   KXwbW/c7tB+S5xLnAK7uaS1qPG3nMfAmQdU4M1sH5PIQwcx/qI/oh3MBM
   y77H3/0stetyU21nVDCSZL2dIhIRwLO05aACPZjDDLmvHuJKIdrO3SupF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="362591650"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400";
   d="scan'208";a="362591650"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:01:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="825689413"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400";
   d="scan'208";a="825689413"
Received: from kjaffe-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.114.132])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:01:05 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 5/8] ASoC: SOF: ipc3: Dump IPC message payload
Date: Fri, 16 Jun 2023 12:00:36 +0200
Message-Id: <20230616100039.378150-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230616100039.378150-1-pierre-louis.bossart@linux.intel.com>
References: <20230616100039.378150-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WPOJAL2M7AAIPT3HORY4HS2VQHVBYO65
X-Message-ID-Hash: WPOJAL2M7AAIPT3HORY4HS2VQHVBYO65
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WPOJAL2M7AAIPT3HORY4HS2VQHVBYO65/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Dump the IPC message payload if BIT(11) of sof_debug is set and the message
contains more data than just a header.

The header size differs between TX and RX and in case of set_get_data, the
header is always the reply header for the message regardless if it is TX
or RX.

The use of printk(KERN_DEBUG "..."); is on purpose to keep the dmesg output
tidy.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index ec1ac0fb2d9f..2c5aac31e8b0 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -223,6 +223,14 @@ static inline void ipc3_log_header(struct device *dev, u8 *text, u32 cmd)
 }
 #endif
 
+static void sof_ipc3_dump_payload(struct snd_sof_dev *sdev,
+				  void *ipc_data, size_t size)
+{
+	printk(KERN_DEBUG "Size of payload following the header: %zu\n", size);
+	print_hex_dump_debug("Message payload: ", DUMP_PREFIX_OFFSET,
+			     16, 4, ipc_data, size, false);
+}
+
 static int sof_ipc3_get_reply(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_ipc_msg *msg = sdev->msg;
@@ -374,6 +382,29 @@ static int sof_ipc3_tx_msg(struct snd_sof_dev *sdev, void *msg_data, size_t msg_
 
 	ret = ipc3_tx_msg_unlocked(ipc, msg_data, msg_bytes, reply_data, reply_bytes);
 
+	if (sof_debug_check_flag(SOF_DBG_DUMP_IPC_MESSAGE_PAYLOAD)) {
+		size_t payload_bytes, header_bytes;
+		char *payload = NULL;
+
+		/* payload is indicated by non zero msg/reply_bytes */
+		if (msg_bytes > sizeof(struct sof_ipc_cmd_hdr)) {
+			payload = msg_data;
+
+			header_bytes = sizeof(struct sof_ipc_cmd_hdr);
+			payload_bytes = msg_bytes - header_bytes;
+		} else if (reply_bytes > sizeof(struct sof_ipc_reply)) {
+			payload = reply_data;
+
+			header_bytes = sizeof(struct sof_ipc_reply);
+			payload_bytes = reply_bytes - header_bytes;
+		}
+
+		if (payload) {
+			payload += header_bytes;
+			sof_ipc3_dump_payload(sdev, payload, payload_bytes);
+		}
+	}
+
 	mutex_unlock(&ipc->tx_mutex);
 
 	return ret;
@@ -472,6 +503,14 @@ static int sof_ipc3_set_get_data(struct snd_sof_dev *sdev, void *data, size_t da
 		offset += payload_size;
 	}
 
+	if (sof_debug_check_flag(SOF_DBG_DUMP_IPC_MESSAGE_PAYLOAD)) {
+		size_t header_bytes = sizeof(struct sof_ipc_reply);
+		char *payload = (char *)cdata;
+
+		payload += header_bytes;
+		sof_ipc3_dump_payload(sdev, payload, data_bytes - header_bytes);
+	}
+
 	mutex_unlock(&sdev->ipc->tx_mutex);
 
 	kfree(cdata_chunk);
-- 
2.37.2

