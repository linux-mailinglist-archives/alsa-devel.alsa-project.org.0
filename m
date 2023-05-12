Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF60700E15
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 19:48:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAA25E86;
	Fri, 12 May 2023 19:47:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAA25E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683913690;
	bh=NXWEW2uL0MZdzPaFwT9g5wKRsXZ6EYOMBJswLRp4reE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HG3qTEi8Ip2ww1TLEmX4Xa6OO0lravmszIJEByC/9oCOyiXtI42WvzJybJ0N2B1fJ
	 8erj7uQQseJLQQZyocVnAK/tQ/f6+vBClvWKlOtzq7LrQvjJoYh/GY+eKq+yXrQYGK
	 Oc/1KyGxJR6Jtq+GUXtzydEoOjWDMC3m7zC3t+0k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E5A8F8055A; Fri, 12 May 2023 19:46:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2928F80534;
	Fri, 12 May 2023 19:46:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1982F80542; Fri, 12 May 2023 19:46:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84749F802E8
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 19:46:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84749F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XM4deN7m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683913584; x=1715449584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NXWEW2uL0MZdzPaFwT9g5wKRsXZ6EYOMBJswLRp4reE=;
  b=XM4deN7mEMDusm7iMtqfvzTPNISodULJdDSojRqAA/E91AV6Dz6o+IKR
   jkL9Ix9TffbZyL391npctt/SrN86gzZlf7UsVT9O0exqeTyONUaC/gV6K
   s3yaYN0md0gY8gz6LOzPDVX5yiYLtaV4fKW7DIsN4WGzBeaiTC7Cc2DBy
   pSWo1Tf0XqR+NV+ali779W7Om8lJUgH/hBgtDTEBH2zRAnkpAuJ+FMw3K
   qpZw7Noaas7O/SXFY76S+QK5VdDybCi8hU6BEHXPo58zwrSuFfUrA69K4
   pMNwJguK8pBUA3Md0nQ2Moa1wwuQ1VjMmjwFvzQkAolYFTFiqH27nW5QB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="349688046"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="349688046"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:46:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="812167745"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="812167745"
Received: from winkelru-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.144.249])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:46:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 1/6] ASoC: SOF: Intel: hda-mlink: fix sublink refcounting
Date: Fri, 12 May 2023 12:46:06 -0500
Message-Id: <20230512174611.84372-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512174611.84372-1-pierre-louis.bossart@linux.intel.com>
References: <20230512174611.84372-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: T2ZNESELO4VDMYIEDSKAEPQE2GTKVDBB
X-Message-ID-Hash: T2ZNESELO4VDMYIEDSKAEPQE2GTKVDBB
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T2ZNESELO4VDMYIEDSKAEPQE2GTKVDBB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In hindsight it was a very bad idea to use the same refcount for
Extended and 'legacy' HDaudio multi-links. The existing solution only
powers-up the first sublink, which causes SoundWire and SSP tests to
fail when more than one DAI is used concurrently. Solving this problem
requires per-sublink refcounting, as suggested in this patch.

The existing refcounting remains for 'legacy' HdAudio links, mainly to
avoid changing the obscure programming sequence in
snd_hdac_ext_bus_link_put().

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-mlink.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index 775582ab7494..6d0145c30afe 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -19,6 +19,9 @@
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_MLINK)
 
+/* worst-case number of sublinks is used for sublink refcount array allocation only */
+#define HDAML_MAX_SUBLINKS (AZX_ML_LCTL_CPA_SHIFT - AZX_ML_LCTL_SPA_SHIFT)
+
 /**
  * struct hdac_ext2_link - HDAudio extended+alternate link
  *
@@ -33,6 +36,7 @@
  * @leptr:		extended link pointer
  * @eml_lock:		mutual exclusion to access shared registers e.g. CPA/SPA bits
  * in LCTL register
+ * @sublink_ref_count:	array of refcounts, required to power-manage sublinks independently
  * @base_ptr:		pointer to shim/ip/shim_vs space
  * @instance_offset:	offset between each of @slcount instances managed by link
  * @shim_offset:	offset to SHIM register base
@@ -53,6 +57,7 @@ struct hdac_ext2_link {
 	u32 leptr;
 
 	struct mutex eml_lock; /* prevent concurrent access to e.g. CPA/SPA */
+	int sublink_ref_count[HDAML_MAX_SUBLINKS];
 
 	/* internal values computed from LCAP contents */
 	void __iomem *base_ptr;
@@ -641,8 +646,13 @@ static int hdac_bus_eml_power_up_base(struct hdac_bus *bus, bool alt, int elid,
 	if (eml_lock)
 		mutex_lock(&h2link->eml_lock);
 
-	if (++hlink->ref_count > 1)
-		goto skip_init;
+	if (!alt) {
+		if (++hlink->ref_count > 1)
+			goto skip_init;
+	} else {
+		if (++h2link->sublink_ref_count[sublink] > 1)
+			goto skip_init;
+	}
 
 	ret = hdaml_link_init(hlink->ml_addr + AZX_REG_ML_LCTL, sublink);
 
@@ -684,9 +694,13 @@ static int hdac_bus_eml_power_down_base(struct hdac_bus *bus, bool alt, int elid
 	if (eml_lock)
 		mutex_lock(&h2link->eml_lock);
 
-	if (--hlink->ref_count > 0)
-		goto skip_shutdown;
-
+	if (!alt) {
+		if (--hlink->ref_count > 0)
+			goto skip_shutdown;
+	} else {
+		if (--h2link->sublink_ref_count[sublink] > 0)
+			goto skip_shutdown;
+	}
 	ret = hdaml_link_shutdown(hlink->ml_addr + AZX_REG_ML_LCTL, sublink);
 
 skip_shutdown:
-- 
2.37.2

