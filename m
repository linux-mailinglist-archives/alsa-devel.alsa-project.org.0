Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C7C702577
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:54:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FDFB1EC;
	Mon, 15 May 2023 08:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FDFB1EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684133665;
	bh=aNL2KliVK/W0PGGaQa+13McnVurhskx2OOU+yOO7uSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bsZRAS3WNRo+X1aUxXW3kYgrw0JdCwdI18kevWl7oKP9ZKhT8sNW1+fYeN+axP5ht
	 p0TkcbxI+S2hsud0zsR93aEEfT1RcBr9C8wWv35MfX7txWqLZWJSZM0q3/0GyUfQBI
	 FB/9RxQRAUN8PBWvyuAc5x/zc+9XjAcMVty1YRFE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C0F1F805EB; Mon, 15 May 2023 08:51:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCCA7F805E9;
	Mon, 15 May 2023 08:51:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DFC9F805C4; Mon, 15 May 2023 08:50:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF24AF805AF
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:50:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF24AF805AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YarHY0va
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684133453; x=1715669453;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aNL2KliVK/W0PGGaQa+13McnVurhskx2OOU+yOO7uSY=;
  b=YarHY0vaI+t+YMasibXFlCLNGrizrh+MiWOsUY9J2EcbwzLeflwAph2v
   zKwUzL4CSPAj9+ZTrJSaNXqfQ+dYLeUCFkpBFFe1u47ZFqYlRItL8gzUQ
   xxSNuddk30ihvI2H/fIXrNkb1WHwpxQXSLa1yJgqMMDlieHUP5b51DXvn
   x1+2q/up4jHJOIdATgZkKgaueJ79KliRN+2WSzP3a2tYQlSKoWPXCvv+R
   3nSgC56Djx3J+FTiykAMkoAW9a0dSTr+mwBgz2glPvyHC2wKAGV3p3579
   3kdhYgwwGMF+xLHbqwdYp9jcabVo4cfcIOMtZYzabh44S/qLKJV9CU2CB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="349966395"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="349966395"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694908711"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="694908711"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:47 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	vinod.koul@linaro.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 12/26] soundwire: intel_ace2x: set SYNCPRD before
 powering-up
Date: Mon, 15 May 2023 15:10:28 +0800
Message-Id: <20230515071042.2038-13-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CPVHDOWE35SGJFPL7CCQD7QHZBOL2ZCW
X-Message-ID-Hash: CPVHDOWE35SGJFPL7CCQD7QHZBOL2ZCW
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CPVHDOWE35SGJFPL7CCQD7QHZBOL2ZCW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The registers used for multi-link synchronization are no longer in the
SHIM but in the HDaudio multi-link capability space. Use helpers to
configure the SYNCPRD value, and wait for SYNCPU to change after
powering-up.

Note that the SYNCPRD value is shared between all sublinks, for
obvious reasons if those links are supposed to be synchronized. The
value of SYNCPRD is programmed only once for all sublinks.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_ace2x.c | 42 +++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 5b6a608e63ba..01668246b7ba 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -17,17 +17,51 @@
 
 static int intel_link_power_up(struct sdw_intel *sdw)
 {
+	struct sdw_bus *bus = &sdw->cdns.bus;
+	struct sdw_master_prop *prop = &bus->prop;
+	u32 *shim_mask = sdw->link_res->shim_mask;
+	unsigned int link_id = sdw->instance;
+	u32 syncprd;
 	int ret;
 
 	mutex_lock(sdw->link_res->shim_lock);
 
-	ret = hdac_bus_eml_sdw_power_up_unlocked(sdw->link_res->hbus, sdw->instance);
+	if (!*shim_mask) {
+		/* we first need to program the SyncPRD/CPU registers */
+		dev_dbg(sdw->cdns.dev, "first link up, programming SYNCPRD\n");
+
+		if (prop->mclk_freq % 6000000)
+			syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_38_4;
+		else
+			syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_24;
+
+		ret =  hdac_bus_eml_sdw_set_syncprd_unlocked(sdw->link_res->hbus, syncprd);
+		if (ret < 0) {
+			dev_err(sdw->cdns.dev, "%s: hdac_bus_eml_sdw_set_syncprd failed: %d\n",
+				__func__, ret);
+			goto out;
+		}
+	}
+
+	ret = hdac_bus_eml_sdw_power_up_unlocked(sdw->link_res->hbus, link_id);
 	if (ret < 0) {
 		dev_err(sdw->cdns.dev, "%s: hdac_bus_eml_sdw_power_up failed: %d\n",
 			__func__, ret);
 		goto out;
 	}
 
+	if (!*shim_mask) {
+		/* SYNCPU will change once link is active */
+		ret =  hdac_bus_eml_sdw_wait_syncpu_unlocked(sdw->link_res->hbus);
+		if (ret < 0) {
+			dev_err(sdw->cdns.dev, "%s: hdac_bus_eml_sdw_wait_syncpu failed: %d\n",
+				__func__, ret);
+			goto out;
+		}
+	}
+
+	*shim_mask |= BIT(link_id);
+
 	sdw->cdns.link_up = true;
 out:
 	mutex_unlock(sdw->link_res->shim_lock);
@@ -37,13 +71,17 @@ static int intel_link_power_up(struct sdw_intel *sdw)
 
 static int intel_link_power_down(struct sdw_intel *sdw)
 {
+	u32 *shim_mask = sdw->link_res->shim_mask;
+	unsigned int link_id = sdw->instance;
 	int ret;
 
 	mutex_lock(sdw->link_res->shim_lock);
 
 	sdw->cdns.link_up = false;
 
-	ret = hdac_bus_eml_sdw_power_down_unlocked(sdw->link_res->hbus, sdw->instance);
+	*shim_mask &= ~BIT(link_id);
+
+	ret = hdac_bus_eml_sdw_power_down_unlocked(sdw->link_res->hbus, link_id);
 	if (ret < 0) {
 		dev_err(sdw->cdns.dev, "%s: hdac_bus_eml_sdw_power_down failed: %d\n",
 			__func__, ret);
-- 
2.25.1

