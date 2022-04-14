Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C9C501B4E
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 20:50:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D2DC18B9;
	Thu, 14 Apr 2022 20:49:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D2DC18B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649962214;
	bh=SGmGyo3vAuw8xuhGzUT+cykO6GQd8Q2xN+LFWpH3x6U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UUtoyIYOcCD9VbiSKlBOfghsQ3tQHci8qAi+WPb7lCV0L34uBU3k0EvwE8IYO0I4B
	 PTDLfJkI6XEjlEOrCu44vUmq4cmKQwj2bVpn4XzUPrmZ8bdP1LNA/iPidTm/g6qiEz
	 TGibk0TiEaQPsxqNlrlaJBJvx7QBJcu1JcrEKw9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C873F80124;
	Thu, 14 Apr 2022 20:48:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 477EFF80124; Thu, 14 Apr 2022 20:48:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0ADF9F8012E
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 20:48:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ADF9F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dcn7B/qm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649962120; x=1681498120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SGmGyo3vAuw8xuhGzUT+cykO6GQd8Q2xN+LFWpH3x6U=;
 b=dcn7B/qmSDsGWOjV7ICtflSbFQNX26G+fGWjLLp+56csR2f34z09x+a+
 rBj7sw3PnjZWPlzxWalcsvrkBZXsr8rdPaEnsxUUY52Y5TAFj25sBM79w
 4CaiWPyhjqTSkK1DwJAZfbiRXJx23XuQXReHc1+wgB97jdyNZgIa4TXUv
 XbYl9thH2xzBvw149R+gtZ86KNE6Nkf9VtVVG8r+zJGF6s5fghpGF97hl
 I4h/sHNZ+UcyIYw07qkcpPZXzLamxc+nw0kMziUwIO939FDjJDFAALMCp
 lh71Ti8OIVItv535/Z5+ZumgMXn0B8QNQja7O/Nbfv13VftyTJRjkXRGs Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="349442333"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="349442333"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="560304599"
Received: from rrsolima-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.130.212])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 01/15] ASoC: SOF: add definitions for different IPC types
Date: Thu, 14 Apr 2022 13:48:03 -0500
Message-Id: <20220414184817.362215-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
References: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
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

Add enum type to allow for different types of IPCs. The IPCv4 is
intended for Intel only as a convergence path with firmware used in
Windows. Follow-up patches will introduce different abstractions with
.ops and different search paths for firmware and topology files.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/sof.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 7cdfc954df12..2658a38be5bd 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -47,6 +47,13 @@ enum sof_dsp_power_states {
 	SOF_DSP_PM_D3,
 };
 
+/* Definitions for multiple IPCs */
+enum sof_ipc_type {
+	SOF_IPC,
+	SOF_INTEL_IPC4,
+	SOF_IPC_TYPE_COUNT
+};
+
 /*
  * SOF Platform data.
  */
@@ -83,6 +90,8 @@ struct snd_sof_pdata {
 	const struct snd_soc_acpi_mach *machine;
 
 	void *hw_pdata;
+
+	enum sof_ipc_type ipc_type;
 };
 
 /*
-- 
2.30.2

