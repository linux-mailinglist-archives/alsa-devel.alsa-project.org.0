Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5F3828F9
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 03:01:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACBF916C6;
	Tue,  6 Aug 2019 03:01:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACBF916C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565053318;
	bh=YdVoi+f64IAmddrrmQ1aVih0Yb031eQmhbShUyhhryw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b0lRLPHHRb0OwDj67wgj4pq8jcTyDu1o+ew5O0DlWJPKWrh4BQqP4kpomrIILqMkS
	 BLHuyrTggEVr64A1IOJxo0NBQrFPAipWml0kEherIOKqe1J3KBGv2LWWJaxXBU0cmt
	 lqUDyRA6zKniHiP39DzYQJhLPp8duvKVy+FLIgHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 636AFF80649;
	Tue,  6 Aug 2019 02:55:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3348DF8060E; Tue,  6 Aug 2019 02:55:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B3B6F805F8
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 02:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B3B6F805F8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 17:55:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="198153165"
Received: from sahluwal-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.202.215])
 by fmsmga004.fm.intel.com with ESMTP; 05 Aug 2019 17:55:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  5 Aug 2019 19:55:12 -0500
Message-Id: <20190806005522.22642-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
References: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: kbuild test robot <lkp@intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, Blauciak@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 Slawomir <slawomir.blauciak@intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
Subject: [alsa-devel] [PATCH 07/17] soundwire: include mod_devicetable.h to
	avoid compiling warnings
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Bard liao <yung-chuan.liao@linux.intel.com>

When integrating SoundWire, kbuild throws this warning with randconfig:

>> include/linux/soundwire/sdw.h:571:17: warning: 'struct
   sdw_device_id' declared inside parameter list will not be visible
   outside of this definition or declaration

       const struct sdw_device_id *id);
                    ^~~~~~~~~~~~~

Fix by adding the relevant include

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Bard liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/linux/soundwire/sdw.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index a49028e9d666..31d1e8acf25b 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -4,6 +4,8 @@
 #ifndef __SOUNDWIRE_H
 #define __SOUNDWIRE_H
 
+#include <linux/mod_devicetable.h>
+
 struct sdw_bus;
 struct sdw_slave;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
