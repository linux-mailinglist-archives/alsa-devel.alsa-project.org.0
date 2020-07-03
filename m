Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB32B213FEE
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 21:24:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88BCD16B0;
	Fri,  3 Jul 2020 21:24:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88BCD16B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593804292;
	bh=sJKhq2DanDPrF94Tiv0ekiZx8ZKZhjdftCyesT1E2K8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vlvQm1v5r/HEOFbF6NXEU2iSXiCaQECZTdWAx/Ze3KYk+kkgoHReaU512kr1BVnWm
	 dsXC3az4Foqw5Hx7V+aINjEPTA3dMSYZX09gzVvUw+FgalChc1k8ssFDr1QdTenwjv
	 oHtaKEdtOTiKySPovjh7RT2+rPdRMYNSsIY8A0tc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 973FAF8021D;
	Fri,  3 Jul 2020 21:23:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E400CF80217; Fri,  3 Jul 2020 21:23:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E4A2F800ED
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 21:23:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E4A2F800ED
IronPort-SDR: ebHS3ecGkxMX79frfgEIUvS0aNBhawdt1ImsEmnW3zt6Q9uz9eedqYAMjVdYcyGYDC8pfZuZbe
 yrgrddvwU4OQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9671"; a="165255790"
X-IronPort-AV: E=Sophos;i="5.75,308,1589266800"; d="scan'208";a="165255790"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2020 12:22:59 -0700
IronPort-SDR: Q4DiU28/IMfXPgIUnlOjaTPacgjeHZExI8zjyDTLrx5kcM7OPsqhtms1M4S2G/3wMhWmHQVXmE
 YMBX0eeCrIDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,308,1589266800"; d="scan'208";a="455974643"
Received: from unknown (HELO buildpc-HP-Z230.iind.intel.com) ([10.223.89.131])
 by orsmga005.jf.intel.com with ESMTP; 03 Jul 2020 12:22:55 -0700
From: Sanyog Kale <sanyog.r.kale@intel.com>
To: vkoul@kernel.org
Subject: [PATCH 1/1] MAINTAINERS: change SoundWire maintainer
Date: Sat,  4 Jul 2020 00:56:44 +0530
Message-Id: <20200703192644.751-1-sanyog.r.kale@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org,
 kai.vehmanen@linux.intel.com, gregkh@linuxfoundation.org, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

Add Bard as SoundWire maintainer from Intel and change Sanyog's
role as reviewer.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Sanyog Kale <sanyog.r.kale@intel.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1c1527a34d99..9559e947bf67 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16012,8 +16012,9 @@ F:	sound/soc/sof/
 
 SOUNDWIRE SUBSYSTEM
 M:	Vinod Koul <vkoul@kernel.org>
-M:	Sanyog Kale <sanyog.r.kale@intel.com>
+M:	Bard Liao <yung-chuan.liao@linux.intel.com>
 R:	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
+R:	Sanyog Kale <sanyog.r.kale@intel.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/driver-api/soundwire/
-- 
2.17.1

