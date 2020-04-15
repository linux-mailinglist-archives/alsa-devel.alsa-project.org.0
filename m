Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4391AB290
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 22:36:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4C87886;
	Wed, 15 Apr 2020 22:36:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4C87886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586983010;
	bh=LsOp/JF47Au80V6oMbe46+mB+7kloiEBIeafSvINptk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ImKAjh0g8S3tkEkrjV4VNm7Dsuek2ve894iKd5EquQmA1MPCxDgiYNHp/FrAO1M5C
	 Kqn9DDtz6xlNfFStyqrOP7Lh9hvrHdwdDvw3Ab5J9qIdnHXMVnVHulqoEumUG9w0eY
	 A+0uW4OQcDfRrObuDUzHed/Ud6ykLpB00P7N5Eh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFA9AF802BE;
	Wed, 15 Apr 2020 22:29:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C0D1F802BD; Wed, 15 Apr 2020 22:29:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CC83F8029A
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 22:29:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CC83F8029A
IronPort-SDR: mnk4ET3H853ew0LV32OKvZswUsrCHLCzpmw/c/lgHTvKTUWdEB0Bjy48UGh3pbo8yEhSbJSJrX
 lpVQgY4uWrJg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:29:06 -0700
IronPort-SDR: P+/PiO7QhjxEAGqZnRpPNaDpYmnsVdAjaQYROynLIF1HKVnvFk8lVyvoz5gEBx5Iro9osZyJ/w
 s9QbFIEQ3Odw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="288656300"
Received: from jplam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.82.197])
 by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2020 13:29:05 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/24] ASoC: SOF: change type char to uint8_t in trace.h
Date: Wed, 15 Apr 2020 15:28:04 -0500
Message-Id: <20200415202816.934-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
References: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Pan Xiuli <xiuli.pan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

From: Pan Xiuli <xiuli.pan@linux.intel.com>

Use uint8_t to replace char in packed ABI structs
to have fixed length for struct.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/sof/trace.h b/include/sound/sof/trace.h
index fda6e8f6ead4..8056f214946d 100644
--- a/include/sound/sof/trace.h
+++ b/include/sound/sof/trace.h
@@ -72,7 +72,7 @@ struct sof_ipc_dma_trace_posn {
 struct sof_ipc_panic_info {
 	struct sof_ipc_hdr hdr;
 	uint32_t code;			/* SOF_IPC_PANIC_ */
-	char filename[SOF_TRACE_FILENAME_SIZE];
+	uint8_t filename[SOF_TRACE_FILENAME_SIZE];
 	uint32_t linenum;
 }  __packed;
 
-- 
2.20.1

