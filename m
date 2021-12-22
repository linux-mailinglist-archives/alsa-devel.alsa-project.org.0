Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8016647D55E
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Dec 2021 17:47:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB8D41797;
	Wed, 22 Dec 2021 17:46:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB8D41797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640191620;
	bh=WegaZ0TOd3SsGdFDwHx1wl+dbnJ65m9gUFguUeYTD3k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BakBveuUsHbqS9t1qCmL9hzUYNvqoVVlsaVFT/S52TLc/m/+xLwcPQU8mz9oxVy8p
	 xWG51MRrZtEaFt0yCycIOqkeVhg7An6oZCD5ALX/DBiJ7dOBED673Un3uN4ibFdOyw
	 qsSo6SaA4MYiqwPJ+1NrJkMW8melrTrMut+k7XwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28C23F80111;
	Wed, 22 Dec 2021 17:45:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76D66F80109; Wed, 22 Dec 2021 17:45:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3415EF80084
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 17:45:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3415EF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Hi4z/UMH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640191545; x=1671727545;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WegaZ0TOd3SsGdFDwHx1wl+dbnJ65m9gUFguUeYTD3k=;
 b=Hi4z/UMHtsoFKembwHeDOo4cpEtXWJJ9uInn+a9e1geXF3TA+xcEXM5M
 5KIqZVNA4AGTKZ10tfKcxUzL8g5JBoJ6TYBK4XuB97tedRM1q928tv3vx
 EX0XqvhE8VzaIbZxqMzBQhP1Vdl8FH3Zftril2d9Mg87jIi9BYApynqh2
 1uyzdnUod4yJZh77ZaIys3jk617R8egX48jJaN5PF/SsAieHJEOfYtzUu
 rx7GJ94heKPbv2de+XqLYsngOyyNSuPXwEPAayHvEkEvRWnr5DHVWFXsN
 H8OYNYNjzhQ/+TbRCVQhr3IxexCEViZL8HlWm0tCz2u4fG35ev+K7/j4R g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="220669623"
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; d="scan'208";a="220669623"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 08:45:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; d="scan'208";a="587064285"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Dec 2021 08:45:34 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id F0578FE; Wed, 22 Dec 2021 18:45:42 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] ASoC: madera: Replace kernel.h with the necessary
 inclusions
Date: Wed, 22 Dec 2021 18:45:34 +0200
Message-Id: <20211222164534.67636-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
2.34.1

