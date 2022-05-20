Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6819952F4F6
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 23:20:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3C02173F;
	Fri, 20 May 2022 23:19:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3C02173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653081631;
	bh=talhVHpiIiRh1i24aZV+2hUqQGbDBg0vp2vF49dS6gE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KPIx2JwS2snJbq7zMXNqDJtfnFKm8am2pActEIMRxnNnEtKyuXUI2p4q6T9HyqoCU
	 PiaAnb8FhjArpn/FK4ZyMDgr1Xyv0neFPEEQlWTRN1FG+PwVDj/npOUIXWP+9xgcoG
	 58ckx+Oza8PgSPLRla2NtkYHahwAAmtdfhZ4wOY0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5FA0F80543;
	Fri, 20 May 2022 23:17:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DDA7F80240; Fri, 20 May 2022 23:17:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74010F8051A
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 23:17:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74010F8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Oq1bnv1u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653081461; x=1684617461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=talhVHpiIiRh1i24aZV+2hUqQGbDBg0vp2vF49dS6gE=;
 b=Oq1bnv1ueDbz7RrH0lMjwUs7ZedGfb07KzYNeJnM68v/wZ9zk3VZZWRM
 ynd1CDmuYOE7aem/h609u+JE2hwGvP9JjoVpSpcp7fWEZXsNGRxDHUDhW
 9tLyR/5eNhdd2YVX1U9KHWyNlFPxe+6PLONamawCVcZSlJkAgpTjrcLkM
 ANeKfZiaJes1rABQyv+CE2Rv3NTNmUXIQDHcjmK/X6rqQqWXTTopU9rnx
 cAAB6ivxzLfkdermQZImh4iqCJO9GJg5wt3mrE5X/c+iUiS7ELMPPMrRp
 hwG8LQfsfs/O7nQbSbC++f2nHIvWWWH5OpAuLhVNmRxEDlRd5LI2eJmzb A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="270324233"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="270324233"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="674796022"
Received: from achsu-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.181.190])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/16] ASoC: Intel: atom: sst_ipc: remove redundant test
Date: Fri, 20 May 2022 16:17:09 -0500
Message-Id: <20220520211719.607543-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
References: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

cppcheck warning:

sound/soc/intel/atom/sst/sst_ipc.c:344:30: style: Condition 'drv_id'
is always true [knownConditionTrueFalse]
 if (msg_high.part.result && drv_id && !msg_high.part.large) {
                             ^
sound/soc/intel/atom/sst/sst_ipc.c:337:13: note: Assuming that
condition 'drv_id==0' is not redundant
 if (drv_id == SST_ASYNC_DRV_ID) {
            ^
sound/soc/intel/atom/sst/sst_ipc.c:344:30: note: Condition 'drv_id' is
always true
 if (msg_high.part.result && drv_id && !msg_high.part.large) {
                             ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/atom/sst/sst_ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst/sst_ipc.c b/sound/soc/intel/atom/sst/sst_ipc.c
index 4e8382097e618..78ea67c7a1281 100644
--- a/sound/soc/intel/atom/sst/sst_ipc.c
+++ b/sound/soc/intel/atom/sst/sst_ipc.c
@@ -341,7 +341,7 @@ void sst_process_reply_mrfld(struct intel_sst_drv *sst_drv_ctx,
 	}
 
 	/* FW sent short error response for an IPC */
-	if (msg_high.part.result && drv_id && !msg_high.part.large) {
+	if (msg_high.part.result && !msg_high.part.large) {
 		/* 32-bit FW error code in msg_low */
 		dev_err(sst_drv_ctx->dev, "FW sent error response 0x%x", msg_low);
 		sst_wake_up_block(sst_drv_ctx, msg_high.part.result,
-- 
2.30.2

