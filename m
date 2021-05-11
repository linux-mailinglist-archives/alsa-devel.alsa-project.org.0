Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18040379D2B
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 04:52:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96D501777;
	Tue, 11 May 2021 04:51:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96D501777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620701551;
	bh=crAOd1tuh4eHWMvSzm3ChPQS6WWLMsavZ5zgnYuoJqQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TKMd2Oy+ZToHrBD0Smu2tfuxEUIFrIfLYM/vBUZ5/Um3sH0Qs2UFpUyCZQhQ7Kp4T
	 rapRr2YXaoEJeI8iamVM4mUPTo59UkYGKoAhxgo1MsQiKzmdhIloSJrqWjb3yy0i2Z
	 z7m6np7ywpZ0OGGYxTRCebgrMKO7dyMUBHEoywQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C35FF80129;
	Tue, 11 May 2021 04:51:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A83EAF80129; Tue, 11 May 2021 04:51:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 581A2F80129
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 04:50:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 581A2F80129
IronPort-SDR: FJWb9hnrb4Hk2P+QeA7MD6lh52UXmpm4bBWxw0hTInHbLf4iOaIAxNI9H9ma/BoVA8URgJVNJ7
 MP/8nAH+A4iA==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="186783825"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="186783825"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 19:50:48 -0700
IronPort-SDR: NODRnZTUIIC5tWEnSPuI0gozDPinD1oU6M8t4UCYQHfTuOr5WAxMK8GS1/3gvHpmLxttpRMbFB
 HWodagnLp98A==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="434083554"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 19:50:45 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [RESEND PATCH] soundwire: dmi-quirks: remove duplicate initialization
Date: Tue, 11 May 2021 10:50:35 +0800
Message-Id: <20210511025035.25233-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
 bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

cppcheck warning:

drivers/soundwire/dmi-quirks.c:85:12: style: Redundant initialization
for 'map'. The initialized value is overwritten before it is
read. [redundantInitialization]
  for (map = dmi_id->driver_data; map->adr; map++) {
           ^
drivers/soundwire/dmi-quirks.c:83:25: note: map is initialized
  struct adr_remap *map = dmi_id->driver_data;
                        ^
drivers/soundwire/dmi-quirks.c:85:12: note: map is overwritten
  for (map = dmi_id->driver_data; map->adr; map++) {
           ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/dmi-quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 82061c1d9835..5db0a2443a1d 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -80,7 +80,7 @@ u64 sdw_dmi_override_adr(struct sdw_bus *bus, u64 addr)
 	/* check if any address remap quirk applies */
 	dmi_id = dmi_first_match(adr_remap_quirk_table);
 	if (dmi_id) {
-		struct adr_remap *map = dmi_id->driver_data;
+		struct adr_remap *map;
 
 		for (map = dmi_id->driver_data; map->adr; map++) {
 			if (map->adr == addr) {
-- 
2.17.1

