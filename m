Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B13934D1DAA
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 17:45:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1243117EB;
	Tue,  8 Mar 2022 17:45:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1243117EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646757958;
	bh=JlVsEVtv+stKt8+Fm7133LjYVCeaSqakvtfe/gKYSn4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=diutaNFj0RlHrA8HOszlk8E6GaoUNodnklYqIWWTpsYoGzVpalYeiyPzF5mp2GFER
	 iG30TCN+dRvNkN7HdR1CFLNZ55oqCH935FUONRX9jkVJsrvuq4k9eGI2MvR56FWH+y
	 CnoREVGmvVYY4rUhPlz3mqaqBBjz30LlS/miGUu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87D0FF80526;
	Tue,  8 Mar 2022 17:44:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BB96F80520; Tue,  8 Mar 2022 17:44:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 322F7F80272
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 17:44:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 322F7F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Po5SAvQT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646757849; x=1678293849;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JlVsEVtv+stKt8+Fm7133LjYVCeaSqakvtfe/gKYSn4=;
 b=Po5SAvQT+fHd2108VTCU1N+rF5wUrBfac5AvW56H0601pE5Mo9AuYbbJ
 ufmXFNWo9mUCN68YwG252k1KFaD3iSUOE6q2jhaKuq6+KVnzP1T8NCynQ
 aXoAixzOrgqbJp5bxR1v93fKfGo8eJtaCSP4inmqa3yecjHBlG0Le0shY
 6U3RJW+GJsb6gn0EHTWWvQBbUTNpS29oElwr1VBd7D6ezWPH86paoSgDg
 SjIBAz6MH90CSRCaga/QxaS/tTFhpE8mQTeRV3Tq/F/hEpb+kB/6devQD
 P1Y7+UrSUKAHKHEC+koOAyRWv6zAyDYWQBFsY9XxVTMXqA72BqU6br4vc w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="341166851"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="341166851"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:44:00 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="537633287"
Received: from bustam3x-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.251.130.225])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:59 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 18/18] ASoC: SOF: move definition of snd_sof_ipc to header
 file
Date: Tue,  8 Mar 2022 08:43:44 -0800
Message-Id: <20220308164344.577647-19-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
References: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 amadeuszx.slawinski@linux.intel.com,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Rander Wang <rander.wang@intel.com>

Move definition of struct snd_sof_ipc to the header file so it can be
shared with new IPC versions.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc.c      | 12 ------------
 sound/soc/sof/sof-priv.h | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index c729bb7bf8c8..34084e0008f1 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -27,18 +27,6 @@ static void ipc_stream_message(struct snd_sof_dev *sdev, void *msg_buf);
  * IPC message Tx/Rx message handling.
  */
 
-/* SOF generic IPC data */
-struct snd_sof_ipc {
-	struct snd_sof_dev *sdev;
-
-	/* protects messages and the disable flag */
-	struct mutex tx_mutex;
-	/* disables further sending of ipc's */
-	bool disable_ipc_tx;
-
-	struct snd_sof_ipc_msg msg;
-};
-
 struct sof_ipc_ctrl_data_params {
 	size_t msg_bytes;
 	size_t hdr_bytes;
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 2e19ac619ad5..7f0514db4d06 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -345,6 +345,18 @@ struct snd_sof_ipc_msg {
 	bool ipc_complete;
 };
 
+/* SOF generic IPC data */
+struct snd_sof_ipc {
+	struct snd_sof_dev *sdev;
+
+	/* protects messages and the disable flag */
+	struct mutex tx_mutex;
+	/* disables further sending of ipc's */
+	bool disable_ipc_tx;
+
+	struct snd_sof_ipc_msg msg;
+};
+
 /*
  * SOF Device Level.
  */
-- 
2.25.1

