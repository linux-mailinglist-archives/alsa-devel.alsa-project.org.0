Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9E11AB295
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 22:38:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCF331672;
	Wed, 15 Apr 2020 22:37:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCF331672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586983081;
	bh=cKRUMPPzSZS76s1Sd0DlJgKICgmtLuEy3ZCcFQRJ9rA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bnHsSdJQrIRrHmSaKwoYrkwcN+q9TnDq72YThxaZA2Bj3rhk0ZYxjoP6OcY6D377p
	 v3vf7lpQXdSz74m2ieyZkUzDQEBdfGg4G/wDGYUUDgwx8fCs8mKd3PZsvtnxt3IG5b
	 ensWjzqVtAl3qEACAvXLwB10c4ku2aLiEkhiQ2q4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D47E6F802FF;
	Wed, 15 Apr 2020 22:29:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4980BF802BE; Wed, 15 Apr 2020 22:29:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81D2BF8029B
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 22:29:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81D2BF8029B
IronPort-SDR: Chp74Y7ru1SpAZMgpj2ACHSz0MOKpWaPqI/V3x4vMpDpkM9ap3OleU7/70XbDFvLMbGUxqWGqF
 azx7P4ua2Jug==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:29:09 -0700
IronPort-SDR: OwdXQlHamOH9b1onKwpwQkJlDAVM9vqkZkDRqvgCqtoiu/wD/DfWOYyne6ltX6Ysu/uPEJcZqv
 oFZJsXoKeqhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="288656290"
Received: from jplam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.82.197])
 by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2020 13:29:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/24] ASoC: SOF: add debug ABI version
Date: Wed, 15 Apr 2020 15:28:02 -0500
Message-Id: <20200415202816.934-11-pierre-louis.bossart@linux.intel.com>
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

Add new debug ABI version to be increased when changing user space debug
interfaces while the the main FW ABI is not affected.

The abi_dbg_version share same definition with SOF_ABI_VER

This change main ABI to 3.14.0

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/info.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/sound/sof/info.h b/include/sound/sof/info.h
index 68e92b550439..162f38430958 100644
--- a/include/sound/sof/info.h
+++ b/include/sound/sof/info.h
@@ -32,6 +32,7 @@ enum sof_ipc_ext_data {
 	SOF_IPC_EXT_WINDOW		= 1,
 	SOF_IPC_EXT_CC_INFO		= 2,
 	SOF_IPC_EXT_PROBE_INFO		= 3,
+	SOF_IPC_EXT_USER_ABI_INFO	= 4,
 };
 
 /* FW version - SOF_IPC_GLB_VERSION */
@@ -126,4 +127,11 @@ struct sof_ipc_probe_support {
 	uint32_t reserved[2];
 } __packed;
 
+/* extended data: user abi version(s) */
+struct sof_ipc_user_abi_version {
+	struct sof_ipc_ext_data_hdr ext_hdr;
+
+	uint32_t abi_dbg_version;
+}  __packed;
+
 #endif
-- 
2.20.1

