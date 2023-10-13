Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F4B7C7B03
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 03:03:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8973B868;
	Fri, 13 Oct 2023 03:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8973B868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697158985;
	bh=z5/rwBJLaPdoYJt5h6c2jIvqQPVEf1Th6mPqtQ7A6SM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XiEFzZjSl8eGfqEuG4avjqvs88/v8/FSANgr0dCgElWBbbFi/iFyW8reah0xNPKVX
	 KBqDP+F9lS9U7YAwCtjrCOIvdg07t9cFVvAAQsMznIu8T8JkaMnCHLCWNCqgoUP0ud
	 2vhIltD/7NWb4bnFH04zZa/dly0lIBp9qZsbcpzI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF7D6F80552; Fri, 13 Oct 2023 03:02:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66531F802BE;
	Fri, 13 Oct 2023 03:02:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22E60F80536; Fri, 13 Oct 2023 03:02:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F497F802BE
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 03:02:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F497F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EBCc0IOD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697158925; x=1728694925;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=z5/rwBJLaPdoYJt5h6c2jIvqQPVEf1Th6mPqtQ7A6SM=;
  b=EBCc0IODVx6r6fcOVEOVmg7e6F7jY2GjMf84/4VW9fEv69FPCTI95LW6
   vAGN3CJ90u/e/ST3gaoF8c4mBo1yOLBDYPZj2HjIT7y0T4J7ypIYWhh+R
   hXC1B5xgwM4L5g8wxkoLxQGKbss8bcYP6gO5vjihMPeMfZUqzuQqrIPat
   +oF7xmZsAsrR5p0lx6p2p/EY+U7tDG1EvajaMZSvSK5b3il/kJrPu2Lrp
   YCY1stVJYaHH/Qzu10Ba0aTEbFdmOuHSsoAWlniMRFxIJEhQE4yoOBokm
   2TK4bIh4vfSnXyYXMZwfHkERAB2yljTGheuY2lfck1krqg5FpUEwOSEQF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="383935922"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="383935922"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 18:01:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845213939"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845213939"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 18:01:15 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH] soundwire: dmi-quirks: update HP Omen match
Date: Fri, 13 Oct 2023 09:08:33 +0800
Message-Id: <20231013010833.114271-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SZ7BPMGHMFSCZMI5LHCJVGPCHBHZU3EV
X-Message-ID-Hash: SZ7BPMGHMFSCZMI5LHCJVGPCHBHZU3EV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SZ7BPMGHMFSCZMI5LHCJVGPCHBHZU3EV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

New platforms have a slightly different DMI product name, remove
trailing characters/digits to handle all cases

Closes: https://github.com/thesofproject/linux/issues/4611
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/dmi-quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 2a1096dab63d..9ebdd0cd0b1c 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -141,7 +141,7 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "OMEN by HP Gaming Laptop 16-k0xxx"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "OMEN by HP Gaming Laptop 16"),
 		},
 		.driver_data = (void *)hp_omen_16,
 	},
-- 
2.25.1

