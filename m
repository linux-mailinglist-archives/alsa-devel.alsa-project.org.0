Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2617A47E260
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:38:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C481A1817;
	Thu, 23 Dec 2021 12:37:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C481A1817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640259483;
	bh=i4OwgT1fu4jT6m6rkEuzscE4mGGtiitjaiemkrgSMbg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TzSZwwoSV7evuE9tOqlzDsOaKwd8AjNOIS16wBzEdfZcJ7PfontW4J+mdCJyn2cOR
	 NYxWUsp0DBMNHjiI0N+cxB3bMa77UmXOcFz/5eV4acN8ncpI2MLvZEG13dio+XI0Y4
	 1BFUwajn4bz4BmQflSNAxpDYuOtLfvBdMJeQmwwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5D1FF8011C;
	Thu, 23 Dec 2021 12:36:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EA83F804E4; Thu, 23 Dec 2021 12:36:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FD2FF80104
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:36:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FD2FF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VqX9yJpO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640259381; x=1671795381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i4OwgT1fu4jT6m6rkEuzscE4mGGtiitjaiemkrgSMbg=;
 b=VqX9yJpO6bdpQzFdGDuuFfo3TMnTbd8jx2LXfaCdf7AUoSTSihvoui+M
 TtZZwHp4bMdU6ZGH5Uu/IoC2+UHUzwIY7JdH+dKe9l71WHF/ZCJoE8+7w
 vzTxKPeKAwGgKEgJmZv/tuW7+5s68qdKloiBSO2keFrdYpR+mmibYL4My
 V4ciW79JSH2MK0kGLg7n3D5hcLZ4GYYXIYeSA4scV1m5kR4ROA1sEFvPX
 pV9Zw/YnEWk45uMM1EO79q6uQFNvEyR/+yeyYYOmSwWomNG2MSQpqJRl/
 ZlMQk1SyDWxZ85H202Vtj6bHtM+IzTJ4ooeze1e8JSlSs7dhW6grexGCM A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304180791"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="304180791"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522065061"
Received: from gcatala-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:14 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 03/20] ASoC: SOF: core: Add simple wrapper to check flags in
 sof_core_debug
Date: Thu, 23 Dec 2021 13:36:11 +0200
Message-Id: <20211223113628.18582-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
References: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 chao.song@intel.com, daniel.baluta@nxp.com
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

The sof_debug_check_flag() can be used to check a flag or a combination of
them in sof_core_debug.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/core.c     | 16 ++++++++++++++++
 sound/soc/sof/sof-priv.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 40549cdd6d58..1224a7da053a 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -27,6 +27,22 @@ MODULE_PARM_DESC(sof_debug, "SOF core debug options (0x0 all off)");
 #define TIMEOUT_DEFAULT_IPC_MS  500
 #define TIMEOUT_DEFAULT_BOOT_MS 2000
 
+/**
+ * sof_debug_check_flag - check if a given flag(s) is set in sof_core_debug
+ * @mask: Flag or combination of flags to check
+ *
+ * Returns true if all bits set in mask is also set in sof_core_debug, otherwise
+ * false
+ */
+bool sof_debug_check_flag(int mask)
+{
+	if ((sof_core_debug & mask) == mask)
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL(sof_debug_check_flag);
+
 /*
  * FW Panic/fault handling.
  */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 114882e4370f..35c5b2d6930b 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -43,6 +43,7 @@
 
 /* global debug state set by SOF_DBG_ flags */
 extern int sof_core_debug;
+bool sof_debug_check_flag(int mask);
 
 /* max BARs mmaped devices can use */
 #define SND_SOF_BARS	8
-- 
2.34.1

