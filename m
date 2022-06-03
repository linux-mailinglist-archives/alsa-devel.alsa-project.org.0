Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 522BC53CDC3
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 19:08:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC2E21852;
	Fri,  3 Jun 2022 19:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC2E21852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654276122;
	bh=xpOexUYLWNWmda+V5P62AASnYjvdSRQGlPJg1HsZW8A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fj/7fDz4xZfmanIsbyCx6QEUPvaLrcS/G7eagOWKCvSN2/ZJVdNf8TD6kK1wo/cra
	 evnQfI2Wg5c8rOnRXNZghiIneB7YLqs9AJa2xW7FhMOVQAOnV+JjU7XOgq1DUwWHUG
	 4/vVxQ3P/nh2BTm3fAyzaKqZeP/GrMXi104CuwD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 558FCF804D1;
	Fri,  3 Jun 2022 19:07:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EACB7F804CC; Fri,  3 Jun 2022 19:07:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 163CEF800F5
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 19:07:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 163CEF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="T088G6SR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654276059; x=1685812059;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xpOexUYLWNWmda+V5P62AASnYjvdSRQGlPJg1HsZW8A=;
 b=T088G6SRn2HdxNp2Vjrhk4oOZaCb6vsZzwNb+GFdspisROkmBVyrVgc7
 m6NNHHbmTUhCqeOzA5VcA6itakYlBli7xm+7xQAmp62DsqxialnmyTgtf
 LLlZOajgQg0siM4hv5AoL70nzr6EHXwrDVSYIK8TbQf2kiNftiJAvOyun
 WJH4nfOt4nxWFuCWblvpnfIibjrUXdqSC67u1wUS9XUtV2SvKmlPhjdLh
 NI2jRlwi2i5Zaom5ocG+ge2BNmdMwK1XOOUrLakCiGS7ajH0X4XoSg8pz
 8PoPiMj1QZbODyGMID2fhFsjT+3mFzeoVyqaL764MQBb6n/eJmI+14n3n w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10367"; a="275101289"
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; d="scan'208";a="275101289"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2022 10:07:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; d="scan'208";a="578109804"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga007.jf.intel.com with ESMTP; 03 Jun 2022 10:07:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id D79C5F8; Fri,  3 Jun 2022 20:07:12 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] ASoC: madera: Replace kernel.h with the necessary
 inclusions
Date: Fri,  3 Jun 2022 20:07:07 +0300
Message-Id: <20220603170707.48728-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
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

When kernel.h is used in the headers it adds a lot into dependency hell,
especially when there are circular dependencies are involved.

Replace kernel.h inclusion with the list of what is really being used.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/sound/madera-pdata.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/madera-pdata.h b/include/sound/madera-pdata.h
index e3060f48f108..58398d80c3de 100644
--- a/include/sound/madera-pdata.h
+++ b/include/sound/madera-pdata.h
@@ -9,7 +9,7 @@
 #ifndef MADERA_CODEC_PDATA_H
 #define MADERA_CODEC_PDATA_H
 
-#include <linux/kernel.h>
+#include <linux/types.h>
 
 #define MADERA_MAX_INPUT		6
 #define MADERA_MAX_MUXED_CHANNELS	4
-- 
2.35.1

