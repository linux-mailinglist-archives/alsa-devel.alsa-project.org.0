Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3508B3BCA
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:40:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F071321E2;
	Fri, 26 Apr 2024 17:40:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F071321E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714146053;
	bh=8MLGSPpRbokfwbPdOKbZ3oBufJnpAtGiJAq0XBz63do=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YGTxfeW/SmcfDLFja4VMajkWJBctyPGL09bhdH+TRTD7YDPVmPSJLfna6ELTehPRD
	 t4fDxiSOO4uBBRiDDN76/PfYBOECjkfB/KQyITxwKdozpsPBdZJigFP1AHftB6l10K
	 iLqJBdhUTcWOvkBxFmGse13m1f7AifJg/kG18UX4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 411D5F8064F; Fri, 26 Apr 2024 17:39:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27BE1F8061F;
	Fri, 26 Apr 2024 17:39:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8F5BF8057F; Fri, 26 Apr 2024 17:39:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 029A1F8003A
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 029A1F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Q0PVF/mu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145961; x=1745681961;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8MLGSPpRbokfwbPdOKbZ3oBufJnpAtGiJAq0XBz63do=;
  b=Q0PVF/muzOOpYUQ/JAyOoudyvuxSX8qmMV3xgiB1c5Yy5RtWnntXU0Uq
   32zQ1zjuXGwC6P/lTPo468gtfno1iFIy+ZFn3GP1gmjTRVQvWxMVulLwf
   sJO8p2pjNiCZN2kGN5lLBlMeO61ajkPPn4pev+nYZmtTeetRBoSZm5csl
   fRnNHGe2Lw7LLzKw4Y/GlyoCdpGVedYNt9omM021rC0ko/YFqmUJe6E6A
   sG5mGORcpAntjJ+5GaI3PisAZfmCXoVyC43jSvPEUak86n5yQP/nsbnoj
   BnvxAtuxW0bNW36IGTzjYEu/Tc5MkM4e3mSP7YyT/UTLahPsgVSC4cFyl
   Q==;
X-CSE-ConnectionGUID: O6kl2/SsTs6y3Xv5mg/gkA==
X-CSE-MsgGUID: OQYERGbPRteYK2mFup7O8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9718433"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000";
   d="scan'208";a="9718433"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:39:10 -0700
X-CSE-ConnectionGUID: nEyCFAHgTFuh+0Cisk8NNw==
X-CSE-MsgGUID: Z1bahMjnTdua3tUON08/bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000";
   d="scan'208";a="56623536"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:39:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Marc Herbert <marc.herbert@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 1/5] ASoC: SOF: debug: Handle cases when fw_lib_prefix is not
 set, NULL
Date: Fri, 26 Apr 2024 10:38:58 -0500
Message-Id: <20240426153902.39560-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
References: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EIJADOXICUCQT3A2I647QFNKJXIRYWP6
X-Message-ID-Hash: EIJADOXICUCQT3A2I647QFNKJXIRYWP6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EIJADOXICUCQT3A2I647QFNKJXIRYWP6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

The firmware libraries are not supported by IPC3, the fw_lib_path is not
a valid parameter and it is always NULL.
Do not create the debugfs file for IPC3 at all as it is not applicable.

With IPC4 some vendors/platforms might not support loadable libraries and
the fw_lib_prefix is left to NULL to indicate this.
Handle such case with allocating "Not supported" string.

Reviewed-by: Marc Herbert <marc.herbert@intel.com>
Fixes: 17f4041244e6 ("ASoC: SOF: debug: show firmware/topology prefix/names")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/debug.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index cf282c8b18af..bf635cc96ede 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -326,8 +326,27 @@ int snd_sof_dbg_init(struct snd_sof_dev *sdev)
 
 	debugfs_create_str("fw_path", 0444, fw_profile,
 			   (char **)&plat_data->fw_filename_prefix);
-	debugfs_create_str("fw_lib_path", 0444, fw_profile,
-			   (char **)&plat_data->fw_lib_prefix);
+	/* library path is not valid for IPC3 */
+	if (plat_data->ipc_type != SOF_IPC_TYPE_3) {
+		/*
+		 * fw_lib_prefix can be NULL if the vendor/platform does not
+		 * support loadable libraries
+		 */
+		if (plat_data->fw_lib_prefix) {
+			debugfs_create_str("fw_lib_path", 0444, fw_profile,
+					   (char **)&plat_data->fw_lib_prefix);
+		} else {
+			static char *fw_lib_path;
+
+			fw_lib_path = devm_kasprintf(sdev->dev, GFP_KERNEL,
+						     "Not supported");
+			if (!fw_lib_path)
+				return -ENOMEM;
+
+			debugfs_create_str("fw_lib_path", 0444, fw_profile,
+					   (char **)&fw_lib_path);
+		}
+	}
 	debugfs_create_str("tplg_path", 0444, fw_profile,
 			   (char **)&plat_data->tplg_filename_prefix);
 	debugfs_create_str("fw_name", 0444, fw_profile,
-- 
2.40.1

