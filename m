Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F315E57689A
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 22:58:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F9511944;
	Fri, 15 Jul 2022 22:58:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F9511944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657918730;
	bh=TtuzAApJTU9hGEQXjVipEzK3N3TBAUeeSEWLjmWbJF8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pgL56Wvi9fFIW3O5SNxH7ngwKSecu8JeRSXXg+f18fBX9lyWsQkEJ+AvEUZ4/4urF
	 DdfMS10WdmIjdK1cTMm55ca7813IWKM43v0v/OykOqfrgiGZDEqZR7FmF+1cimLc8O
	 +QQ8M2K31R8JVhXzrtMBqAzA1a2XmeUksxUXCrc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAFFAF80212;
	Fri, 15 Jul 2022 22:57:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D978F8015B; Fri, 15 Jul 2022 22:57:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2451F800AA
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 22:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2451F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="T5PPRgKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657918662; x=1689454662;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TtuzAApJTU9hGEQXjVipEzK3N3TBAUeeSEWLjmWbJF8=;
 b=T5PPRgKk9bIQi/Uhh9+sinflP6ceUGX08++WPqbVEXUDSXBUopKL6B7s
 +a4YJD7Bs9NFXp/kukFP3MX/YdUHmpbNdZmjOrNJ/XhV32ogYA++lpDVY
 0jVPi2r0J/sL/ebHCOoFbU5mSkHHzHnN2pnHpS5AcOt8/oilMkLmAlBH8
 BWPa+7WOo9ePeNAtqIV13Z9xngxnPVQQF+KLnGrW/N73egZ/c9OMrkvaz
 hVUIqKqsY4Q6/I5bEKQpNtaWnx4UGaEm9GdP8msLaTGYVg3FFhqFSLW7S
 tCY7ZhUWuRRdr3CNGl6BHAuUEj23o80BKLI3c8BxkJ6B3fGjBsNNF31eA w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="372213109"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="372213109"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 13:57:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="654496590"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 15 Jul 2022 13:57:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 06FFF1A0; Fri, 15 Jul 2022 23:57:41 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] ALSA: isa: Use INVALID_HWIRQ definition
Date: Fri, 15 Jul 2022 23:57:37 +0300
Message-Id: <20220715205737.83076-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
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

Use specific definition for invalid IRQ. It makes the
code uniform in respect to the constant used for that.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/isa/sscape.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/isa/sscape.c b/sound/isa/sscape.c
index 0bc0025f7c19..9adaf91045e9 100644
--- a/sound/isa/sscape.c
+++ b/sound/isa/sscape.c
@@ -140,8 +140,7 @@ struct soundscape {
 	unsigned char midi_vol;
 };
 
-#define INVALID_IRQ  ((unsigned)-1)
-
+#define INVALID_IRQ  ((unsigned)INVALID_HWIRQ)
 
 static inline struct soundscape *get_card_soundscape(struct snd_card *c)
 {
-- 
2.35.1

