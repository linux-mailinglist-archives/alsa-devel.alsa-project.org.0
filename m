Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 471E08B3BC8
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:40:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CA621939;
	Fri, 26 Apr 2024 17:40:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CA621939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714146033;
	bh=v4RrR4ZevIdejO++X3NJ7yMsgRZ5oysDLZ7RLMPgM4U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t3U+xMyLb7k1F7xCNEO9UaNV1+aPLrPU7jMiZRV0eK2Z2ZvG4SnIW6XnkLYkn9bb4
	 KmF3O3SchnlicdCd8tA2s1to+ewcECx2Aigcaya16Vdqs5r1LJxL5+ywfuOzfxIU6Z
	 5UOEbuCc0LJi84sIso0qnQK1bRXpVxAY3a1kotVY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FC4BF80602; Fri, 26 Apr 2024 17:39:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 475E3F80600;
	Fri, 26 Apr 2024 17:39:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D7F8F80548; Fri, 26 Apr 2024 17:39:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7FF8F802E8
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:39:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7FF8F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ch670naY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145959; x=1745681959;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v4RrR4ZevIdejO++X3NJ7yMsgRZ5oysDLZ7RLMPgM4U=;
  b=ch670naYJaovE1swHa9oZ0aPYJAqYiUeh6rstSi8+fEYGxGRmQIq3X3w
   76LZP95mjjq6ywcOaFKtN5V/idQLGip+A6GaZ1VQhNewKPYVC1Nzv7mUZ
   sktRUs3yJUBqv5UIEIduC6YbkizXuvRTJD8ZDIEi7lsiCyNStqF6bPvff
   CeQGe5Ag/7Gl42EqC2i4OAG3wNahR8o5i87NzAcxCMDWomhpdgbt4nOAN
   6zWPRLcctnj6Yf8yZq+hoHbGj81weEpN0y5d6rOX2hYEer1E6sxwt1Tbh
   z5/O+Kqi/xQpqgeEjax3Dadr6fcm1st7vurnUJ3Br3yBdqFPs8joF5j9y
   w==;
X-CSE-ConnectionGUID: 5grURr0LQHGgtzLkyTppHw==
X-CSE-MsgGUID: /QrWuTtxQTiPts4qnL6buQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9718443"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000";
   d="scan'208";a="9718443"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:39:11 -0700
X-CSE-ConnectionGUID: dArphcUpTHu0MWM01xvL6g==
X-CSE-MsgGUID: rKXOU+QqQPGxrrRIVFB3kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000";
   d="scan'208";a="56623541"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:39:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 3/5] ASoC: SOF: Intel: hda: simplify and reduce indentation
 for hda_sdw_machine_select()
Date: Fri, 26 Apr 2024 10:39:00 -0500
Message-Id: <20240426153902.39560-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
References: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CPIQNHLU4IPFB7KCFBEKOWZQPWBAVZR5
X-Message-ID-Hash: CPIQNHLU4IPFB7KCFBEKOWZQPWBAVZR5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CPIQNHLU4IPFB7KCFBEKOWZQPWBAVZR5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Simplify code to return when no links are enabled. No functional
change, just code cleanup before updates.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 139 +++++++++++++++++++-------------------
 1 file changed, 71 insertions(+), 68 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 4d0fe706ebc1..8ddc1b0ca3c9 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1653,92 +1653,95 @@ static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev
 	hdev = pdata->hw_pdata;
 	link_mask = hdev->info.link_mask;
 
+	if (!link_mask) {
+		dev_info(sdev->dev, "SoundWire links not enabled\n");
+		return NULL;
+	}
+
 	/*
 	 * Select SoundWire machine driver if needed using the
 	 * alternate tables. This case deals with SoundWire-only
 	 * machines, for mixed cases with I2C/I2S the detection relies
 	 * on the HID list.
 	 */
-	if (link_mask) {
-		for (mach = pdata->desc->alt_machines;
-		     mach && mach->link_mask; mach++) {
-			/*
-			 * On some platforms such as Up Extreme all links
-			 * are enabled but only one link can be used by
-			 * external codec. Instead of exact match of two masks,
-			 * first check whether link_mask of mach is subset of
-			 * link_mask supported by hw and then go on searching
-			 * link_adr
-			 */
-			if (~link_mask & mach->link_mask)
-				continue;
+	for (mach = pdata->desc->alt_machines;
+	     mach && mach->link_mask; mach++) {
+		/*
+		 * On some platforms such as Up Extreme all links
+		 * are enabled but only one link can be used by
+		 * external codec. Instead of exact match of two masks,
+		 * first check whether link_mask of mach is subset of
+		 * link_mask supported by hw and then go on searching
+		 * link_adr
+		 */
+		if (~link_mask & mach->link_mask)
+			continue;
 
-			/* No need to match adr if there is no links defined */
-			if (!mach->links)
-				break;
+		/* No need to match adr if there is no links defined */
+		if (!mach->links)
+			break;
 
-			link = mach->links;
-			for (i = 0; i < hdev->info.count && link->num_adr;
-			     i++, link++) {
-				/*
-				 * Try next machine if any expected Slaves
-				 * are not found on this link.
-				 */
-				if (!snd_soc_acpi_sdw_link_slaves_found(sdev->dev, link,
-									hdev->sdw->ids,
-									hdev->sdw->num_slaves))
-					break;
-			}
-			/* Found if all Slaves are checked */
-			if (i == hdev->info.count || !link->num_adr)
+		link = mach->links;
+		for (i = 0; i < hdev->info.count && link->num_adr;
+		     i++, link++) {
+			/*
+			 * Try next machine if any expected Slaves
+			 * are not found on this link.
+			 */
+			if (!snd_soc_acpi_sdw_link_slaves_found(sdev->dev, link,
+								hdev->sdw->ids,
+								hdev->sdw->num_slaves))
 				break;
 		}
-		if (mach && mach->link_mask) {
-			int dmic_num = 0;
-			bool tplg_fixup;
-			const char *tplg_filename;
-
-			mach->mach_params.links = mach->links;
-			mach->mach_params.link_mask = mach->link_mask;
-			mach->mach_params.platform = dev_name(sdev->dev);
-
-			if (pdata->tplg_filename) {
-				tplg_fixup = false;
-			} else {
-				tplg_fixup = true;
-				tplg_filename = mach->sof_tplg_filename;
-			}
+		/* Found if all Slaves are checked */
+		if (i == hdev->info.count || !link->num_adr)
+			break;
+	}
+	if (mach && mach->link_mask) {
+		int dmic_num = 0;
+		bool tplg_fixup;
+		const char *tplg_filename;
 
-			/*
-			 * DMICs use up to 4 pins and are typically pin-muxed with SoundWire
-			 * link 2 and 3, or link 1 and 2, thus we only try to enable dmics
-			 * if all conditions are true:
-			 * a) 2 or fewer links are used by SoundWire
-			 * b) the NHLT table reports the presence of microphones
-			 */
-			if (hweight_long(mach->link_mask) <= 2) {
-				int ret;
+		mach->mach_params.links = mach->links;
+		mach->mach_params.link_mask = mach->link_mask;
+		mach->mach_params.platform = dev_name(sdev->dev);
 
-				ret = dmic_detect_topology_fixup(sdev, &tplg_filename, "",
-								 &dmic_num, tplg_fixup);
-				if (ret < 0)
-					return NULL;
-			}
-			if (tplg_fixup)
-				pdata->tplg_filename = tplg_filename;
-			mach->mach_params.dmic_num = dmic_num;
+		if (pdata->tplg_filename) {
+			tplg_fixup = false;
+		} else {
+			tplg_fixup = true;
+			tplg_filename = mach->sof_tplg_filename;
+		}
 
-			dev_dbg(sdev->dev,
-				"SoundWire machine driver %s topology %s\n",
-				mach->drv_name,
-				pdata->tplg_filename);
+		/*
+		 * DMICs use up to 4 pins and are typically pin-muxed with SoundWire
+		 * link 2 and 3, or link 1 and 2, thus we only try to enable dmics
+		 * if all conditions are true:
+		 * a) 2 or fewer links are used by SoundWire
+		 * b) the NHLT table reports the presence of microphones
+		 */
+		if (hweight_long(mach->link_mask) <= 2) {
+			int ret;
 
-			return mach;
+			ret = dmic_detect_topology_fixup(sdev, &tplg_filename, "",
+							 &dmic_num, tplg_fixup);
+			if (ret < 0)
+				return NULL;
 		}
+		if (tplg_fixup)
+			pdata->tplg_filename = tplg_filename;
+		mach->mach_params.dmic_num = dmic_num;
+
+		dev_dbg(sdev->dev,
+			"SoundWire machine driver %s topology %s\n",
+			mach->drv_name,
+			pdata->tplg_filename);
 
-		dev_info(sdev->dev, "No SoundWire machine driver found\n");
+		return mach;
 	}
 
+	dev_info(sdev->dev, "No SoundWire machine driver found\n");
+
 	return NULL;
 }
 #else
-- 
2.40.1

