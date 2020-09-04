Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A9625D9AA
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 15:33:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 344031B16;
	Fri,  4 Sep 2020 15:33:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 344031B16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599226431;
	bh=QBE+gW5OdQDAhiVJleQf9lu2NtTaq2rz2VM3Rj0VB+Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MOFdtPpIWKXnJEGe5du0zwt/E0Jot7rg8ypSQ5l4n/R7fvYfQ8f4mSIt6TJsptOyw
	 O3/4VnzyoPm3PR60NJS4DfKEfi5H3yO+r/iUhvMMCUqhBLJ5XKH+Cwyjl5Yc97gk5t
	 kT9bc4M0RdfDydnQI00/76oh/yAinNEVnUKZUGW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5674F802F9;
	Fri,  4 Sep 2020 15:29:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98217F801DA; Fri,  4 Sep 2020 15:29:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63CD7F8025E
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 15:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63CD7F8025E
IronPort-SDR: 0t2UJj8A/BbNxRS46oTdrmt9HAsE2Z9cboLwHjtR1dHvSmou/hATB18ISU5fe99NU3B7W/gQQg
 hwRs8+Q4Xicw==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="137259551"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="137259551"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 06:29:33 -0700
IronPort-SDR: wXSH53jtk0ZSc/XRdVfJdOz0sdqBgfZ40lQKFsxVNkF83JyLJbfEO1rVwupto7VOzYvmAesFJi
 YU/gchVy/KQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="284416700"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 04 Sep 2020 06:29:32 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 02/16] ASoC: SOF: add comp_ext to struct snd_sof_widget
Date: Fri,  4 Sep 2020 16:27:30 +0300
Message-Id: <20200904132744.1699575-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200904132744.1699575-1-kai.vehmanen@linux.intel.com>
References: <20200904132744.1699575-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, Keyon Jie <yang.jie@linux.intel.com>,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

From: Keyon Jie <yang.jie@linux.intel.com>

Add member comp_ext to struct snd_sof_widget, which will be used for
topology extended tokens parsing.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof/topology.h | 8 ++++++++
 sound/soc/sof/sof-audio.h    | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/include/sound/sof/topology.h b/include/sound/sof/topology.h
index f56e80d09b32..796b6c8e851d 100644
--- a/include/sound/sof/topology.h
+++ b/include/sound/sof/topology.h
@@ -87,6 +87,9 @@ struct sof_ipc_comp {
  */
 #define SOF_BUF_UNDERRUN_PERMITTED	BIT(1)
 
+/* the UUID size in bytes, shared between FW and host */
+#define SOF_UUID_SIZE	16
+
 /* create new component buffer - SOF_IPC_TPLG_BUFFER_NEW */
 struct sof_ipc_buffer {
 	struct sof_ipc_comp comp;
@@ -300,4 +303,9 @@ enum sof_event_types {
 	SOF_KEYWORD_DETECT_DAPM_EVENT,
 };
 
+/* extended data struct for UUID components */
+struct sof_ipc_comp_ext {
+	uint8_t uuid[SOF_UUID_SIZE];
+}  __packed;
+
 #endif
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 7f8be8817e69..196cbd322893 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -89,6 +89,9 @@ struct snd_sof_widget {
 	struct snd_soc_dapm_widget *widget;
 	struct list_head list;	/* list in sdev widget list */
 
+	/* extended data for UUID components */
+	struct sof_ipc_comp_ext comp_ext;
+
 	void *private;		/* core does not touch this */
 };
 
-- 
2.27.0

