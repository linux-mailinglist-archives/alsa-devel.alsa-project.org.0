Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4677E6CA290
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 13:35:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71C32A4F;
	Mon, 27 Mar 2023 13:34:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71C32A4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679916930;
	bh=mr2Zsw26J/696SN7N7bMHSmE3gZLC9GqJT7D1kXs9rI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JfzqcBISz1fsoZSnlmWXCOicYztppWjPHJ4t15QPkiWgbmcAPbgVEuLSdsT9BFj3a
	 UDVu0WEgS4SjBQ779g+MoocEXHWlo0E2Oq6ybpHyUYbEFWMXdJFK12lq7Yi2c5tKYb
	 XtwdkGwAEzA7RL1UmvLVpaW4Jt7M0dGP9lTrzyZw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20EACF80558;
	Mon, 27 Mar 2023 13:32:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F319AF80495; Mon, 27 Mar 2023 13:32:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BDACEF80290
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 13:29:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDACEF80290
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YZwnwYQJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679916553; x=1711452553;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mr2Zsw26J/696SN7N7bMHSmE3gZLC9GqJT7D1kXs9rI=;
  b=YZwnwYQJVTyXtbq6HlvMfJvc8C6j2stplejbQPHC3fwMFr56a17CyAe4
   5MrDGg2Ksmg+6csUlZD0ST58qAkEZCpzUDBymHy795NeqJPyuFYNkQ+ek
   TLYZDmkbiITSSDYudm0bJV0NRAzUZbA4Xh+Ce0Btz7i/oMnpMYtLN5Ze+
   mlRayUfzQWEbyAxFwwsGAjkuTGKk5yaMbuuFfmL2f0rdp7Z1Xr6R8vBbw
   6FUPwc9XRiQNfJrfXLrt8jApYzJqBm0gee5y6s1u1RoS6Cj6nsOWmYj8T
   RGiDUVzdCAzFgG45be03Y7uwGXqwzkCOtRzgMOKYB6VRsaWrd2JGWdPWh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="367986901"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="367986901"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="857620379"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="857620379"
Received: from asebenix-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.223.110])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:07 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 03/18] ASoC: SOF: Intel: hda-mlink: improve hda_bus_ml_free()
 helper
Date: Mon, 27 Mar 2023 14:29:16 +0300
Message-Id: <20230327112931.23411-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
References: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2QG3THDT5CXEN3UQ4RQKM7Z5ZTZGK7IA
X-Message-ID-Hash: 2QG3THDT5CXEN3UQ4RQKM7Z5ZTZGK7IA
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2QG3THDT5CXEN3UQ4RQKM7Z5ZTZGK7IA/>
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

