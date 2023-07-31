Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F00A76A317
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:40:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55A2A7F4;
	Mon, 31 Jul 2023 23:39:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55A2A7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690839627;
	bh=n+gYWPAWWn2JLZPyHWV+sZix+i/KMcgEQnVBlEXCl/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lnpmm7cVwPDKbV2jpIjcbm2T7n0ZN6oZ1jeFo1HK+4nOyhgP43CgM1NprMnOp372C
	 7odMWa2Yp9xcR/d0CLtUGk0gIa4PBhnrc7usj1RTnz5cWABXXPihs/gMMEDUlYiw+4
	 TmWn0qBkkwb9aG1W1p2TJwsdR/qt21+jO0ERch8U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8033CF805B5; Mon, 31 Jul 2023 23:38:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5DA3F805AE;
	Mon, 31 Jul 2023 23:38:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7695DF80578; Mon, 31 Jul 2023 23:38:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA838F8055A
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:38:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA838F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QgWirXHq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839496; x=1722375496;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n+gYWPAWWn2JLZPyHWV+sZix+i/KMcgEQnVBlEXCl/0=;
  b=QgWirXHqN9GWSxHju5FgGkFSf/9VLtOGTEG6j+almCKXheoNuCqQhyvw
   xzHYGxXjbt5PXNTD9jbQO2VqHOoJhFXjs/bDBMnazxe9jNyvfunH/ortu
   5RdU6VrSaNCXuMLgu0iISoewKaCMzVQhoLRDX4nRDHr1NFDXPXpMRl7wW
   66LReZJJaQZ6ks0Qdj3rCU8wQIBpXoRIWseOJ95HYtEcY/oRRV8C9t96i
   M0C47aTziU9dd4ytzWmRwaUy8V7LNNalm0hYefLikydJ7GzYMewE/037S
   zpirT7h17BqJT5LzWJeuLlrAoMpcYU03LaoQ87YP7v8SSB6agnjPRmwu5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="366604136"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="366604136"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:38:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="793880083"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="793880083"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:38:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Yaochun Hung <yc.hung@mediatek.com>
Subject: [PATCH 7/8] ASoC: Intel: atom: remove static analysis false positive
Date: Mon, 31 Jul 2023 16:37:47 -0500
Message-Id: <20230731213748.440285-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731213748.440285-1-pierre-louis.bossart@linux.intel.com>
References: <20230731213748.440285-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7TT6XNC3NMKJUGH667WQZN24O57SBCK2
X-Message-ID-Hash: 7TT6XNC3NMKJUGH667WQZN24O57SBCK2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7TT6XNC3NMKJUGH667WQZN24O57SBCK2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

make KCFLAGS='-fanalyzer' sound/soc/intel/atom/ reports a possible
NULL pointer dereference.

sound/soc/intel/atom/sst/sst_stream.c:221:40: error: dereference of
NULL ‘block’ [CWE-476] [-Werror=analyzer-null-dereference]
  221 |                         unsigned char *r = block->data;

This is a false-positive, the GCC analyzer generated that report by
considering if (bytes->block) as true in some cases and false in
others.

We can simplify the code and use a local variable so that static
analysis does not try to look for cases where bytes->block can be
modified concurrently.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
---
 sound/soc/intel/atom/sst/sst_stream.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst_stream.c b/sound/soc/intel/atom/sst/sst_stream.c
index 862a19ae5429..288221db7323 100644
--- a/sound/soc/intel/atom/sst/sst_stream.c
+++ b/sound/soc/intel/atom/sst/sst_stream.c
@@ -173,10 +173,11 @@ int sst_send_byte_stream_mrfld(struct intel_sst_drv *sst_drv_ctx,
 	u32 length;
 	int pvt_id, ret = 0;
 	struct sst_block *block = NULL;
+	u8 bytes_block = bytes->block;
 
 	dev_dbg(sst_drv_ctx->dev,
 		"type:%u ipc_msg:%u block:%u task_id:%u pipe: %#x length:%#x\n",
-		bytes->type, bytes->ipc_msg, bytes->block, bytes->task_id,
+		bytes->type, bytes->ipc_msg, bytes_block, bytes->task_id,
 		bytes->pipe_id, bytes->len);
 
 	if (sst_create_ipc_msg(&msg, true))
@@ -185,12 +186,12 @@ int sst_send_byte_stream_mrfld(struct intel_sst_drv *sst_drv_ctx,
 	pvt_id = sst_assign_pvt_id(sst_drv_ctx);
 	sst_fill_header_mrfld(&msg->mrfld_header, bytes->ipc_msg,
 			bytes->task_id, 1, pvt_id);
-	msg->mrfld_header.p.header_high.part.res_rqd = bytes->block;
+	msg->mrfld_header.p.header_high.part.res_rqd = bytes_block;
 	length = bytes->len;
 	msg->mrfld_header.p.header_low_payload = length;
 	dev_dbg(sst_drv_ctx->dev, "length is %d\n", length);
 	memcpy(msg->mailbox_data, &bytes->bytes, bytes->len);
-	if (bytes->block) {
+	if (bytes_block) {
 		block = sst_create_block(sst_drv_ctx, bytes->ipc_msg, pvt_id);
 		if (block == NULL) {
 			kfree(msg);
@@ -203,7 +204,7 @@ int sst_send_byte_stream_mrfld(struct intel_sst_drv *sst_drv_ctx,
 	dev_dbg(sst_drv_ctx->dev, "msg->mrfld_header.p.header_low_payload:%d",
 			msg->mrfld_header.p.header_low_payload);
 
-	if (bytes->block) {
+	if (bytes_block) {
 		ret = sst_wait_timeout(sst_drv_ctx, block);
 		if (ret) {
 			dev_err(sst_drv_ctx->dev, "fw returned err %d\n", ret);
@@ -216,7 +217,7 @@ int sst_send_byte_stream_mrfld(struct intel_sst_drv *sst_drv_ctx,
 		 * copy the reply and send back
 		 * we need to update only sz and payload
 		 */
-		if (bytes->block) {
+		if (bytes_block) {
 			unsigned char *r = block->data;
 
 			dev_dbg(sst_drv_ctx->dev, "read back %d bytes",
@@ -224,7 +225,7 @@ int sst_send_byte_stream_mrfld(struct intel_sst_drv *sst_drv_ctx,
 			memcpy(bytes->bytes, r, bytes->len);
 		}
 	}
-	if (bytes->block)
+	if (bytes_block)
 		sst_free_block(sst_drv_ctx, block);
 out:
 	test_and_clear_bit(pvt_id, &sst_drv_ctx->pvt_id);
-- 
2.39.2

