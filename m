Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA808798A9
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Mar 2024 17:13:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49D05E68;
	Tue, 12 Mar 2024 17:13:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49D05E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710260000;
	bh=LJp6ddIBxKSeMRxJ3S+DBK5ZXqlfGj6rcL3czL4Snfg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jAMcMNwgImzMZdMXeApGEw8ovNLhXMbEl6wYu9vixzFE7cYR4PdF48JZ56JiEijjh
	 6b1PVJwfjaQBhWIAuPumVawtcRVM1ZWjaFdO5ZNiSsBdntaSFqTAmU68YzsFObexPe
	 Ht6uvFQ9I8jpwOoe0lzgvZQlTpUuyniOY+R0Vqu0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80201F805AD; Tue, 12 Mar 2024 17:12:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85B66F804B2;
	Tue, 12 Mar 2024 17:12:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D65ABF8028D; Tue, 12 Mar 2024 17:12:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC406F800E4
	for <alsa-devel@alsa-project.org>; Tue, 12 Mar 2024 17:12:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC406F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=H5C8q/QL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710259961; x=1741795961;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LJp6ddIBxKSeMRxJ3S+DBK5ZXqlfGj6rcL3czL4Snfg=;
  b=H5C8q/QLcO3q6aNjxzYpaRFeLp6yM9NxvBNjQnZ3BGSCPUDg61Dwx2Zn
   PsIKPivlGpZhM3ZX+771AMsoaMaGKSNX9Oxiz8Ol5Q0HDkrNrwrFHgz04
   aSFikhrLYfNWx7UBPLKukhPcQM9Wy8ZKniC8XJ/+owi4Dn4moBM8qHvcX
   XB8/wcawiRq2rp4fdCYYSElA/qAsRPZQaKsPkPfaQ3YBL7KSCKP7qaScw
   FuhuI88jOhdPwjFb96fHmYDHaBqm3zyfyihilZECKFOVxmk3vZwkGBXzr
   7JJmBFbST+pbkvkiREa873Ma7N/o7v//4eOLHYCPaBYHXP0ubkqchMsEH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="16379603"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000";
   d="scan'208";a="16379603"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 09:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000";
   d="scan'208";a="11493432"
Received: from yinnielx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.74.193])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 09:12:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	Gergo Koteles <soyer@irl.hu>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ALSA: hda/tas2781: remove unnecessary runtime_pm calls
Date: Tue, 12 Mar 2024 11:12:17 -0500
Message-Id: <20240312161217.79510-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LL3TJ75BWFLL6QFZKQN4G27NLQETLBXE
X-Message-ID-Hash: LL3TJ75BWFLL6QFZKQN4G27NLQETLBXE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LL3TJ75BWFLL6QFZKQN4G27NLQETLBXE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The runtime_pm handling seems to have been loosely inspired by the
cs32l41 driver, but in this case the get_noresume/put sequence is not
required.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/hda/tas2781_hda_i2c.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 2eb1f9e443c0..4475cea8e9f7 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -796,11 +796,8 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 	pm_runtime_use_autosuspend(tas_hda->dev);
 	pm_runtime_mark_last_busy(tas_hda->dev);
 	pm_runtime_set_active(tas_hda->dev);
-	pm_runtime_get_noresume(tas_hda->dev);
 	pm_runtime_enable(tas_hda->dev);
 
-	pm_runtime_put_autosuspend(tas_hda->dev);
-
 	tas2781_reset(tas_hda->priv);
 
 	ret = component_add(tas_hda->dev, &tas2781_hda_comp_ops);
-- 
2.40.1

