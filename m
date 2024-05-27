Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 179A58D0E5D
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 21:46:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C23BA4D;
	Mon, 27 May 2024 21:45:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C23BA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716839165;
	bh=i/Sxzx7HEvn6QqI+A26bFfrZ3QFeVcHTmAAQt647UdI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZetMzu298/GcSOe3froE952uDjmJeMKZJdQfFSzBhzLCJydb5d12oEwWHMrRMgPLA
	 wxgHQVFYzVs/57x/PjWJwPnXKtGx3JfHkzblpBjJqn45UdZPkmBcxStRZD9LfkIOeT
	 Mh+HUHAPILmb7mDFlipgYa+szHKuf2GsxqAvD0xE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84E5BF805D3; Mon, 27 May 2024 21:45:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 768ACF805B6;
	Mon, 27 May 2024 21:45:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A987F80496; Mon, 27 May 2024 21:45:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0311F80051
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 21:45:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0311F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=d1jiHJmD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716839108; x=1748375108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i/Sxzx7HEvn6QqI+A26bFfrZ3QFeVcHTmAAQt647UdI=;
  b=d1jiHJmDrj40/nQeZDkNO5PvCDf7sR8f0G6DPQ6xDVhLXjgHsP5zTtHE
   bJSds1pRYKjtbun6nJgGA9alV2VI+tYDAQtd64Gt7FC6It2vADAi6J6tb
   oxZNCveOMEk9bo/s1zqZUgBgr0iBVaRXDqKC86O6ZdOgT4R+Ai3KrGgfp
   fZelkkqSjJV5ajUI8yR0Hztwlolr6dZJLp5IK43QF+L5SFbEbj6xCQ3G+
   /1vggHXd98YGqk6gsAASfoGWIQRiPtjz5rDSFXHug7mQsUCjMtmGxBo8+
   ZJPk4HN7UwHSRKoJpSKE3KaS/C9wuqscVsbv/dDUrAqaW7PA8yjbPHiM3
   w==;
X-CSE-ConnectionGUID: buchY4hUTdexKYFZunrNBA==
X-CSE-MsgGUID: AjBSw/XtSJSC+6NwOu30ig==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30679488"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="30679488"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:45:03 -0700
X-CSE-ConnectionGUID: EllWY/9bQ2+ZGIsdbRJKYw==
X-CSE-MsgGUID: qr+92Qk1RNCQQREPu+TGnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="39280545"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:45:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 2/4] ASoC: SOF: AMD: group all module related information
Date: Mon, 27 May 2024 14:44:12 -0500
Message-ID: <20240527194414.166156-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527194414.166156-1-pierre-louis.bossart@linux.intel.com>
References: <20240527194414.166156-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IMYUZVJPBNCP62HJUVCO4CJLFKUPQG6W
X-Message-ID-Hash: IMYUZVJPBNCP62HJUVCO4CJLFKUPQG6W
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IMYUZVJPBNCP62HJUVCO4CJLFKUPQG6W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The module information is spread across files, group in a single
location.  For maintenability and alignment, the arbitrary Intel
convention is used with the following order:

MODULE_LICENSE
MODULE_DESCRIPTION
MODULE_IMPORT

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/amd/acp63.c       | 4 ----
 sound/soc/sof/amd/pci-acp63.c   | 1 +
 sound/soc/sof/amd/pci-rmb.c     | 1 +
 sound/soc/sof/amd/pci-rn.c      | 1 +
 sound/soc/sof/amd/pci-vangogh.c | 1 +
 sound/soc/sof/amd/rembrandt.c   | 4 ----
 sound/soc/sof/amd/renoir.c      | 4 ----
 sound/soc/sof/amd/vangogh.c     | 4 ----
 8 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sof/amd/acp63.c b/sound/soc/sof/amd/acp63.c
index 9fb645079c3a..9e6eb4bfc805 100644
--- a/sound/soc/sof/amd/acp63.c
+++ b/sound/soc/sof/amd/acp63.c
@@ -140,7 +140,3 @@ int sof_acp63_ops_init(struct snd_sof_dev *sdev)
 
 	return 0;
 }
-
-MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
-MODULE_DESCRIPTION("ACP63 SOF Driver");
-MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/amd/pci-acp63.c b/sound/soc/sof/amd/pci-acp63.c
index eeaa12cceb23..fc8984447365 100644
--- a/sound/soc/sof/amd/pci-acp63.c
+++ b/sound/soc/sof/amd/pci-acp63.c
@@ -109,5 +109,6 @@ static struct pci_driver snd_sof_pci_amd_acp63_driver = {
 module_pci_driver(snd_sof_pci_amd_acp63_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("ACP63 SOF Driver");
 MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
diff --git a/sound/soc/sof/amd/pci-rmb.c b/sound/soc/sof/amd/pci-rmb.c
index 2f288545c426..4bc30951f8b0 100644
--- a/sound/soc/sof/amd/pci-rmb.c
+++ b/sound/soc/sof/amd/pci-rmb.c
@@ -99,5 +99,6 @@ static struct pci_driver snd_sof_pci_amd_rmb_driver = {
 module_pci_driver(snd_sof_pci_amd_rmb_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("REMBRANDT SOF Driver");
 MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
index a0195e9b400c..e08875bdfa8b 100644
--- a/sound/soc/sof/amd/pci-rn.c
+++ b/sound/soc/sof/amd/pci-rn.c
@@ -103,5 +103,6 @@ static struct pci_driver snd_sof_pci_amd_rn_driver = {
 module_pci_driver(snd_sof_pci_amd_rn_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("RENOIR SOF Driver");
 MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
diff --git a/sound/soc/sof/amd/pci-vangogh.c b/sound/soc/sof/amd/pci-vangogh.c
index 5cd3ac84752f..16eb2994fbab 100644
--- a/sound/soc/sof/amd/pci-vangogh.c
+++ b/sound/soc/sof/amd/pci-vangogh.c
@@ -101,5 +101,6 @@ static struct pci_driver snd_sof_pci_amd_vgh_driver = {
 module_pci_driver(snd_sof_pci_amd_vgh_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("VANGOGH SOF Driver");
 MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
diff --git a/sound/soc/sof/amd/rembrandt.c b/sound/soc/sof/amd/rembrandt.c
index f1d1ba57ab3a..076f2f05a95c 100644
--- a/sound/soc/sof/amd/rembrandt.c
+++ b/sound/soc/sof/amd/rembrandt.c
@@ -140,7 +140,3 @@ int sof_rembrandt_ops_init(struct snd_sof_dev *sdev)
 
 	return 0;
 }
-
-MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
-MODULE_DESCRIPTION("REMBRANDT SOF Driver");
-MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/amd/renoir.c b/sound/soc/sof/amd/renoir.c
index 47b863f6258c..aa2d24dac6f5 100644
--- a/sound/soc/sof/amd/renoir.c
+++ b/sound/soc/sof/amd/renoir.c
@@ -115,7 +115,3 @@ int sof_renoir_ops_init(struct snd_sof_dev *sdev)
 
 	return 0;
 }
-
-MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
-MODULE_DESCRIPTION("RENOIR SOF Driver");
-MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/amd/vangogh.c b/sound/soc/sof/amd/vangogh.c
index bc6ffdb5471a..61372958c09d 100644
--- a/sound/soc/sof/amd/vangogh.c
+++ b/sound/soc/sof/amd/vangogh.c
@@ -161,7 +161,3 @@ int sof_vangogh_ops_init(struct snd_sof_dev *sdev)
 
 	return 0;
 }
-
-MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
-MODULE_DESCRIPTION("VANGOGH SOF Driver");
-MODULE_LICENSE("Dual BSD/GPL");
-- 
2.43.0

