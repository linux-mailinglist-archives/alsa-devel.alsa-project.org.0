Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2996D35A88C
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Apr 2021 00:03:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 786FF1685;
	Sat, 10 Apr 2021 00:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 786FF1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618005800;
	bh=XoW9dqcdfjMQfc4S1ogkBKlR2sQK3jnvH05YsG9mnck=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IOthiDoAtgbs+nzcuHjLeUhs8wyfpEyGT+tnjE8bAqtO9pqkXdFOclUHSi5nJWZwl
	 8EpUixz1ENw9grQM3Xqlbgv5R6ut+nBwI9pcHpKke1FLOyQYoRx0SDu8ROEH2wpDeK
	 4zlnR0XTwSvly2A1k5rFQVHqKArBSQnbjqPaMihY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F21A7F8032D;
	Sat, 10 Apr 2021 00:01:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7A0FF8032D; Sat, 10 Apr 2021 00:01:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 689BEF8016A
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 00:01:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 689BEF8016A
IronPort-SDR: z6x5EKPVZbkiFV0RoDvyRNcdy0X+ieuXiDFsBTGBw7HR3Fj1b5QsksjwdHdLHWp5YuzQ1IY/hr
 XF7Dk1o/s9hQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="214284727"
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="214284727"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 15:01:35 -0700
IronPort-SDR: DxB7GMmNUcx4RftwlK3T7zYdNrxUWCRnsOP3fuUyQU/Mn6kNV2AkcMQMez0tygPVLloJd/smv1
 S1bqYlZMr24g==
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="599290604"
Received: from ukorat-mobl2.amr.corp.intel.com (HELO rsridh-mobl1.localdomain)
 ([10.212.104.152])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 15:01:33 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/6] ASoC: SOF: add Kconfig option for probe workqueues
Date: Fri,  9 Apr 2021 15:01:16 -0700
Message-Id: <20210409220121.1542362-2-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210409220121.1542362-1-ranjani.sridharan@linux.intel.com>
References: <20210409220121.1542362-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Daniel Baluta <daniel.baluta@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The probe workqueue is currently used in the HDaudio case, following
the example of the snd-hda-intel driver.

For development and validation, it's useful to enable the probe
workqueue even with ACPI devices or NOCODEC mode.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 8dfc165c3690..cd659493b5df 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -68,6 +68,17 @@ config SND_SOC_SOF_DEVELOPER_SUPPORT
 
 if SND_SOC_SOF_DEVELOPER_SUPPORT
 
+config SND_SOC_SOF_FORCE_PROBE_WORKQUEUE
+	bool "SOF force probe workqueue"
+	select SND_SOC_SOF_PROBE_WORK_QUEUE
+	help
+	  This option forces the use of a probe workqueue, which is only used
+	  when HDaudio is enabled due to module dependencies. Forcing this
+	  option is intended for debug only, but this should not add any
+	  functional issues in nominal cases.
+	  Say Y if you are involved in SOF development and need this option.
+	  If not, select N.
+
 config SND_SOC_SOF_NOCODEC
 	tristate
 
-- 
2.25.1

