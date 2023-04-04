Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F242E6D5DC7
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 12:43:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 153CB1F9;
	Tue,  4 Apr 2023 12:42:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 153CB1F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680604992;
	bh=mr2Zsw26J/696SN7N7bMHSmE3gZLC9GqJT7D1kXs9rI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C9EwjhRQ7M83VJ37WjEq3Z6SbyzT+I3Wcz1wBMeaNBn47Lq1iRkET47x2MnS5IaoQ
	 LlJdiSTj/2R4bdGSaJEmSNtCJ+4N+/eHxWtkeZxLLg4PhowcLolPlM5pL1216ENhdU
	 0XIxctebYZuvh4df2D/ps52NXFDI/vQwGLig4XEE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC7B6F80553;
	Tue,  4 Apr 2023 12:41:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A12B0F8028B; Tue,  4 Apr 2023 12:41:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD355F8024C
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 12:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD355F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JuuhCevs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680604864; x=1712140864;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mr2Zsw26J/696SN7N7bMHSmE3gZLC9GqJT7D1kXs9rI=;
  b=JuuhCevsAum5PfAE7nwx51VHxzlFNXqAAYAlPOdSjgnOyZ8OkzKMqCdE
   edDt8Yhw9/GQ+8c/gP70RjWogNmxUllZrcSeF3sYiSUhHGop7aVp62rdS
   L8Ic7W3MWgQq3LwuK1EPU4WonkZp64OQ12ERdXt3RG48T8idHLyHMJiZi
   AXq2pQsOYgkcBhfuPlbU2OvQZ6k6naeywqDz18zA/mssQ6fZTbfRSEDvp
   KCs8jKI8hBZfvhmK5SG2DwpeotUBmNIVWDclimf2IjnbjRklibgrjNpQN
   MWDZmCl07glDmZEoWI/mtUS3u9iPThxk2ceP7bY2EIbxoGpmg0HFfDPbq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340877948"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="340877948"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829930128"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="829930128"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:00 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH v2 03/18] ASoC: SOF: Intel: hda-mlink: improve
 hda_bus_ml_free() helper
Date: Tue,  4 Apr 2023 13:41:12 +0300
Message-Id: <20230404104127.5629-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
References: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LAF423NB7WNZJDGDYT6JOYGU6JTWS6L7
X-Message-ID-Hash: LAF423NB7WNZJDGDYT6JOYGU6JTWS6L7
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, amadeuszx.slawinski@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LAF423NB7WNZJDGDYT6JOYGU6JTWS6L7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Use list_for_each_entry_safe() instead of open-coding.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-mlink.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index 76ab9a2e7bb3..ac9bf477f413 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -36,13 +36,12 @@ void hda_bus_ml_get_capabilities(struct hdac_bus *bus)
 
 void hda_bus_ml_free(struct hdac_bus *bus)
 {
-	struct hdac_ext_link *hlink;
+	struct hdac_ext_link *hlink, *_h;
 
 	if (!bus->mlcap)
 		return;
 
-	while (!list_empty(&bus->hlink_list)) {
-		hlink = list_first_entry(&bus->hlink_list, struct hdac_ext_link, list);
+	list_for_each_entry_safe(hlink, _h, &bus->hlink_list, list) {
 		list_del(&hlink->list);
 		kfree(hlink);
 	}
-- 
2.40.0

